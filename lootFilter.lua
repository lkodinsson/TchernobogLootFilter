require "lootFilter/global"
dofile "lootFilter/lootFilter.dat"
--dofile "lootFilter/lootFilter.cfg"
dofile "lootFilter/config.ini"
COLOR_PURPLE = 9

function set(list)
	local set = {}
	if list[1] == nil then return set end
	for _, value in pairs(list) do
		set[value] = true
	end
	return set
end

function setUniques(list)
	local set = {}
	if list[1] == nil then return set end
	for _, value in pairs(list) do
		if itemUnique[value] ~= nil then
			set[itemUnique[value]] = true
		end
	end
	return set
end

function setSets(list)
	local set = {}
	if list[1] == nil then return set end
	for _, value in pairs(list) do
		if itemSet[value] ~= nil then
			set[itemSet[value]] = true
		end
	end
	return set
end

HIDE = true
SHOW = false

if LEVEL < 1 then LEVEL = 1 end
if LEVEL > 60 then LEVEL = 60 end

if STRICTNESS < 0 then STRICTNESS = 0 end
if STRICTNESS > 100 then STRICTNESS = 100 end

if GOLD_STRICT < 0 then GOLD_STRICT = 0 end
if GOLD_STRICT > 10 then GOLD_STRICT = 10 end

if BOOK_STRICT < 0 then BOOK_STRICT = 0 end
if BOOK_STRICT > 10 then BOOK_STRICT = 10 end

if SCROLL_STRICT < 0 then SCROLL_STRICT = 0 end
if SCROLL_STRICT > 10 then SCROLL_STRICT = 10 end

if GOLD_LIMIT < 0 then
	GOLD_LIMIT = ((GOLD_STRICT)*LEVEL*LEVEL)/(5-STRICTNESS/100*4)
	GOLD_LIMIT = math.floor(GOLD_LIMIT+0.5)
end

dofile "lootFilter/advanced.ini"

if rarityMult["rare"] < 2 then rarityMult["rare"] = 2 end
if rarityMult["magic"] < 1.5 then rarityMult["magic"] = 1.5 end
if rarityMult["normal"] < 1 then rarityMult["normal"] = 1 end

if rarityMult["rare"] > 10 then rarityMult["rare"] = 10 end
if rarityMult["magic"] > rarityMult["rare"] then rarityMult["magic"] = rarityMult["rare"] end
if rarityMult["normal"] > rarityMult["magic"] then rarityMult["normal"] = rarityMult["magic"] end

--STRICT_MULT = rarityMult["rare"]/10*7-1		-- both of these formulas produce the same results
STRICT_MULT = rarityMult["rare"]*42/60-1
LEVEL_MULT = 1+STRICTNESS/100*STRICT_MULT
--LEVEL_MULT = 1+STRICTNESS/100*6

alwaysHide = set(alwaysHide)
alwaysHideType = set(alwaysHideType)
alwaysHideUniqueBase = setUniques(alwaysHideUnique)
alwaysHideUnique = set(alwaysHideUnique)
alwaysHideSetBase = setSets(alwaysHideSet)
alwaysHideSet = set(alwaysHideSet)

alwaysShow = set(alwaysShow)
alwaysShowType = set(alwaysShowType)
highValue = set(highValue)
highValueUniqueBase = setUniques(highValueUnique)
highValueUnique = set(highValueUnique)
highValueSetBase = setSets(highValueSet)
highValueSet = set(highValueSet)

function hideItems(data)
	local itemName = data.displayedName
	local itemColor = data.textColor
	
	if alwaysShow[itemName] or highValue[itemName] then return SHOW end
	if alwaysShowType[itemType[itemName]] then return SHOW end
	if itemColor == COLOR_GOLD and (highValueUnique[itemName] or highValueUniqueBase[itemName]) then return SHOW end
	if itemColor == COLOR_GREEN and (highValueSet[itemName] or highValueSetBase[itemName]) then return SHOW end
	if highValueJewelry and (data.itemType == ITEM_FING or data.itemType == ITEM_NECK) and (itemColor == COLOR_GOLD or itemColor == COLOR_GREEN) then return SHOW end
	
	if itemColor == COLOR_WHITE and showNormal == false then return HIDE end
	if itemColor == COLOR_BLUE and showMagic == false then return HIDE end
	if itemColor == COLOR_YELLOW and showRare == false then return HIDE end
	
	if alwaysHide[itemName] then return HIDE end
	if alwaysHideType[itemType[itemName]] then return HIDE end
	if itemColor == COLOR_GOLD and (alwaysHideUnique[itemName] or alwaysHideUniqueBase[itemName]) then return HIDE end
	if itemColor == COLOR_GREEN and (alwaysHideSet[itemName] or alwaysHideSetBase[itemName]) then return HIDE end
	
	if itemName:find("staff of") then
		local baseItemName = string.match(itemName, "(.*) of ")
		local spellName = string.match(itemName, " of (.*)")
		if alwaysShow["staff of "..spellName] or highValue["staff of "..spellName] then return SHOW end
		if alwaysHide["staff of "..spellName] then return HIDE end
		if staffLevel[baseItemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = staffLevel[baseItemName]+(42-staffLevel[baseItemName])*spellRating[spellName]/4
			if itemColor == COLOR_WHITE and LEVEL*LEVEL_MULT >= levelRating*rarityMult["normal"] then
				return HIDE
			elseif itemColor == COLOR_BLUE and LEVEL*LEVEL_MULT >= levelRating*rarityMult["magic"] then
				return HIDE
			elseif itemColor == COLOR_YELLOW and LEVEL*LEVEL_MULT >= levelRating*rarityMult["rare"] then
				return HIDE
			end
		end
	
	elseif itemName:find("staff") then
		if itemColor == COLOR_WHITE and LEVEL*LEVEL_MULT >= staffLevel[itemName]*rarityMult["normal"] then
			return HIDE
		elseif itemColor == COLOR_BLUE and LEVEL*LEVEL_MULT >= staffLevel[itemName]*rarityMult["magic"] then
			return HIDE
		elseif itemColor == COLOR_YELLOW and LEVEL*LEVEL_MULT >= staffLevel[itemName]*rarityMult["rare"] then
			return HIDE
		end
	
	elseif isEquipment(data) and itemLevel[itemName] ~= nil then
		if itemColor == COLOR_WHITE and LEVEL*LEVEL_MULT >= itemLevel[itemName]*rarityMult["normal"] then
			return HIDE
		elseif itemColor == COLOR_BLUE and LEVEL*LEVEL_MULT >= itemLevel[itemName]*rarityMult["magic"] then
			return HIDE
		elseif itemColor == COLOR_YELLOW and LEVEL*LEVEL_MULT >= itemLevel[itemName]*rarityMult["rare"] then
			return HIDE
		end
	
	elseif data.itemType == ITEM_BOOK then
		local spellName = string.match(itemName, " of (.*)")
		if bookLevel[itemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = bookLevel[itemName]+(42-bookLevel[itemName])*spellRating[spellName]/4
			if LEVEL*LEVEL_MULT >= levelRating*(10-BOOK_STRICT) then
				return HIDE
			end
		end
		
	elseif data.itemType == ITEM_SCROLL then
		local spellName = string.match(itemName, " of (.*)")
		if scrollLevel[itemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = scrollLevel[itemName]+(42-scrollLevel[itemName])*spellRating[spellName]/4
			if LEVEL*LEVEL_MULT >= levelRating*(10-SCROLL_STRICT) then
				return HIDE
			end
		end
	end
	--[[elseif data.itemType == ITEM_POTION and potionValue[itemName] ~= nil then
		if GOLD_LIMIT >= 10000 then
			return HIDE
		end
	end]]--
	
	return SHOW
end

function renameItems(data)
	local itemName = data.displayedName
	local itemColor = data.textColor
	
	if data.itemType == -1 and not itemName:find("blocked") and itemColor == COLOR_RED then
		itemName = "! trapped !"
	end

	if renameItemList[itemName] ~= nil then itemName = renameItemList[itemName] end
	
	if next(renameSubList) ~= nil then
		for entry,value in pairs(renameSubList) do
			itemName = itemName:gsub(entry,value)
		end
	end
	
	return itemName
end

function recolorItems(data)
	local itemName = data.displayedName
	local itemColor = data.textColor
	
	if recolorItemList[itemName] then return recolorItemList[itemName] end
	
	if highValue[itemName] then return COLOR_PURPLE end
	if itemColor == COLOR_GOLD and (highValueUnique[itemName] or highValueUniqueBase[itemName]) then return COLOR_PURPLE end
	if itemColor == COLOR_GREEN and (highValueSet[itemName] or highValueSetBase[itemName]) then return COLOR_PURPLE end
	if highValueJewelry and (data.itemType == ITEM_FING or data.itemType == ITEM_NECK) and (itemColor == COLOR_GOLD or itemColor == COLOR_GREEN) then return COLOR_PURPLE end
	
	if data.itemType == -1 then
		if shrinesSpecial[itemName] then
			return shrinesSpecial[itemName]
		elseif itemName:find("goat shrine") then
			local shrineName = string.match(itemName, "(.*) goat shrine")
			if shrines[shrineName] then return shrines[shrineName] end
		elseif itemName:find("shrine") then
			local shrineName = string.match(itemName, "(.*) shrine")
			if shrines[shrineName] then return shrines[shrineName] end
		elseif itemName:find("cauldron") then
			local shrineName = string.match(itemName, "(.*) cauldron")
			if shrines[shrineName] then return shrines[shrineName] end
		end
	end
	
	if itemName:find("staff of") then
		local baseItemName = string.match(itemName, "(.*) of ")
		local spellName = string.match(itemName, " of (.*)")
		if recolorItemList["staff of "..spellName] then return recolorItemList["staff of "..spellName] end
		if highValue["staff of "..spellName] then return COLOR_PURPLE end
		if staffLevel[baseItemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = staffLevel[baseItemName]+(42-staffLevel[baseItemName])*spellRating[spellName]/4
			if data.textColor == COLOR_WHITE and LEVEL*LEVEL_MULT >= levelRating*2 then
				return COLOR_GREY
			--[[elseif data.textColor == COLOR_BLUE and LEVEL*LEVEL_MULT >= levelRating*4 then
				return COLOR_GREY
			elseif data.textColor == COLOR_YELLOW and LEVEL*LEVEL_MULT >= levelRating*6 then
				return COLOR_GREY]]--
			end
		end
		
	elseif isEquipment(data) and itemLevel[itemName] ~= nil then
		if itemColor == COLOR_WHITE and LEVEL*LEVEL_MULT/2 >= itemLevel[itemName] then
			return COLOR_GREY
		--[[elseif data.textColor == COLOR_BLUE and LEVEL*LEVEL_MULT/4 >= itemLevel[itemName] then
			return COLOR_GREY
		elseif data.textColor == COLOR_YELLOW and LEVEL*LEVEL_MULT/6 >= itemLevel[itemName] then
			return COLOR_GREY]]--
		end
	
	elseif data.itemType == ITEM_BOOK then
		local spellName = string.match(itemName, " of (.*)")
		if bookLevel[itemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = bookLevel[itemName]+(42-bookLevel[itemName])*spellRating[spellName]/4
			if LEVEL*LEVEL_MULT <= levelRating*(2-BOOK_STRICT*2/10) then
				return COLOR_YELLOW
			elseif LEVEL*LEVEL_MULT <= levelRating*(4-BOOK_STRICT*4/10) then
				return COLOR_BLUE
			elseif LEVEL*LEVEL_MULT <= levelRating*(7-BOOK_STRICT*7/10) then
				return COLOR_WHITE
			else
				return COLOR_GREY
			end
		end
		
	elseif data.itemType == ITEM_SCROLL then
		local spellName = string.match(itemName, " of (.*)")
		if scrollLevel[itemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = scrollLevel[itemName]+(42-scrollLevel[itemName])*spellRating[spellName]/4
			if LEVEL*LEVEL_MULT <= levelRating*(1-SCROLL_STRICT/10) then
				return COLOR_BLUE
			elseif LEVEL*LEVEL_MULT <= levelRating*(2-SCROLL_STRICT*2/10) then
				return COLOR_WHITE
			else
				return COLOR_GREY
			end
		end
	
	--[[
	elseif data.itemType == ITEM_POTION and potionValue[itemName] ~= nil then
		if itemName:find("elixir") then
			if GOLD_LIMIT <= potionValue[itemName] then
				return COLOR_YELLOW
			elseif GOLD_LIMIT <= potionValue[itemName]*1.5 then
				return COLOR_BLUE
			elseif GOLD_LIMIT <= potionValue[itemName]*2 then
				return COLOR_WHITE
			else
				return COLOR_GREY
			end
		else
			if GOLD_LIMIT <= potionValue[itemName] then
				return COLOR_BLUE
			elseif GOLD_LIMIT <= potionValue[itemName]*2 then
				return COLOR_WHITE
			else
				return COLOR_GREY
			end
		end
	end
	]]--
	
	elseif data.itemType == ITEM_POTION and potionColor[itemName] ~= nil then
		return potionColor[itemName]
	end
	
	return itemColor
end

-- handleEverything() changed to allow modifying of NPCs/Objects
function handleEverything(data,filterList,exception,renames,recolors)
	local newName = getNew(data.displayedName,renames)
	local newColor = getNew(data.textColor,recolors)
	--if data.itemType == -1 then
	--	return data.displayedName,data.textColor,TRUE
	--end
	if isException(exception,data.displayedName) == TRUE then
		return newName,newColor,TRUE
	end
	return newName,newColor,filter(filterList)
end

-- lootFilter() changed to allow the hidden purple color
function lootFilter(displayedName,textColor,itemType)
	local isGood,v1,v2,v3 = pcall(myLootFilter,{displayedName=displayedName:lower(),textColor=textColor,itemType=itemType})
    if isGood == true then
		if v1 ~= nil and v2 ~= nil and v3 ~= nil then
		    if type(v1) == "string" and type(v2) == "number" and type(v3) == "number" then
				if v2 >= 0 and v2 <= 9 then
				    return v1,v2,v3
				else
					--printMsg("Color must be between 0 and 9.")
					printMsg("Enter a correct color as provided!")
				end
			else
				--printMsg(type(v1).." "..type(v2).." "..type(v3))
				printMsg("Your loot filter returned bad values! It should return <new displayed name>,<new color><show or not>")	
			end
		else
		    printMsg("One or more of the values returned by your lootFilter were empty!!!")	
		end
	else
		printMsg(ret)
		return -1
	end
	return TRUE
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function myLootFilter(data)
---------------add your functions to the array here!---------------
--list with exception of items
	local exception = {}
--list with filters
	local filterList = {
		hideGoldBelow(data,GOLD_LIMIT),       -- hides gold piles with less than X pieces
		hideItems(data)
	}
--list with renaming functions
	renameList = {
		renameItems(data)
	}
--list with recoloring functions
	recolorList = {
		recolorItems(data)
	}
---------------end of functions array, don't touch the rest!---------------
	return handleEverything(data,filterList,exception,renameList,recolorList)
end