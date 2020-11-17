function recolorItems(data)
	local playerLevel = data.playerLevel
	if type(fixedLevel) == "number" then
		playerLevel = fixedLevel
	end
	local itemName = data.displayedName
	local itemColor = data.textColor
	
	if recolorItemList[itemName] then return recolorItemList[itemName] end
	
	if highValue[itemName] then return COLOR_PURPLE end
	if itemColor == COLOR_GOLD and (highValueUnique[itemName] or highValueUniqueBase[itemName]) then return COLOR_PURPLE end
	if itemColor == COLOR_GREEN and (highValueSet[itemName] or highValueSetBase[itemName]) then return COLOR_PURPLE end
	if highValueJewelry and (data.itemType == ITEM_FING or data.itemType == ITEM_NECK) and (itemColor == COLOR_GOLD or itemColor == COLOR_GREEN) then return COLOR_PURPLE end
	
	if recolorShrines and data.itemType == ITEM_OBJECT then
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
	
	if recolorEquipment and itemName:find("staff of") then
		local baseItemName = string.match(itemName, "(.*) of ")
		local spellName = string.match(itemName, " of (.*)")
		if recolorItemList["staff of "..spellName] then return recolorItemList["staff of "..spellName] end
		if highValue["staff of "..spellName] then return COLOR_PURPLE end
		if staffLevel[baseItemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = staffLevel[baseItemName]+(42-staffLevel[baseItemName])*spellRating[spellName]/4
			if data.textColor == COLOR_WHITE and playerLevel*levelMult >= levelRating*rarityMult["normal"]/2 then
				return COLOR_GREY
			--[[elseif data.textColor == COLOR_BLUE and playerLevel*levelMult >= levelRating*rarityMult["magic"] then
				return COLOR_GREY
			elseif data.textColor == COLOR_YELLOW and playerLevel*levelMult >= levelRating*rarityMult["rare"] then
				return COLOR_GREY]]--
			end
		end
		
	elseif recolorEquipment and isEquipment(data) and itemLevel[itemName] ~= nil then
		if itemColor == COLOR_WHITE and playerLevel*levelMult >= itemLevel[itemName]*rarityMult["normal"]/2 then
			return COLOR_GREY
		--[[elseif data.textColor == COLOR_BLUE and playerLevel*levelMult >= itemLevel[itemName]*rarityMult["magic"] then
			return COLOR_GREY
		elseif data.textColor == COLOR_YELLOW and playerLevel*levelMult >= itemLevel[itemName]*rarityMult["rare"] then
			return COLOR_GREY]]--
		end
	
	elseif recolorBooks and data.itemType == ITEM_BOOK then
		local spellName = string.match(itemName, " of (.*)")
		if bookLevel[itemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = bookLevel[itemName]+(42-bookLevel[itemName])*spellRating[spellName]/4
			if playerLevel*levelMult <= levelRating*(2-bookStrict*2/100) then
				return COLOR_YELLOW
			elseif playerLevel*levelMult <= levelRating*(4-bookStrict*4/100) then
				return COLOR_BLUE
			elseif playerLevel*levelMult <= levelRating*(7-bookStrict*7/100) then
				return COLOR_WHITE
			else
				return COLOR_GREY
			end
		end
		
	elseif recolorScrolls and data.itemType == ITEM_SCROLL then
		local spellName = string.match(itemName, " of (.*)")
		if scrollLevel[itemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = scrollLevel[itemName]+(42-scrollLevel[itemName])*spellRating[spellName]/4
			if playerLevel*levelMult <= levelRating*(1-scrollStrict/100) then
				return COLOR_BLUE
			elseif playerLevel*levelMult <= levelRating*(2-scrollStrict*2/100) then
				return COLOR_WHITE
			else
				return COLOR_GREY
			end
		end
	
	elseif recolorPotions and data.itemType == ITEM_POTION and potionColor[itemName] ~= nil then
		return potionColor[itemName]
	end
	
	return itemColor
end