function hideItems(data)
	local playerLevel = data.playerLevel
	if type(fixedLevel) == "number" then
		playerLevel = fixedLevel
	end
	local itemName = data.displayedName
	local itemColor = data.textColor
	
	if itemColor ~= COLOR_WHITE and isEquipment(data) and data.isIdentified == 1 then return SHOW end
	
	if itemColor == COLOR_GOLD and (highValueUnique[itemName] or highValueUniqueBase[itemName]) then return SHOW end
	if itemColor == COLOR_GREEN and (highValueSet[itemName] or highValueSetBase[itemName]) then return SHOW end
	if highValueJewelry and (data.itemType == ITEM_FING or data.itemType == ITEM_NECK) and (itemColor == COLOR_GOLD or itemColor == COLOR_GREEN) then return SHOW end
	
	if itemColor == COLOR_WHITE and isEquipment(data) and showNormal == false then return HIDE end
	if itemColor == COLOR_BLUE and isEquipment(data) and showMagic == false then return HIDE end
	if itemColor == COLOR_YELLOW and isEquipment(data) and showRare == false then return HIDE end
	
	if alwaysShow[itemName] or highValue[itemName] then return SHOW end
	if alwaysShowType[itemType[itemName]] then
		if (itemColor == COLOR_GOLD or itemColor == COLOR_GREEN) and typeFilterUniques then
			return SHOW
		elseif not (itemColor == COLOR_GOLD or itemColor == COLOR_GREEN) then
			return SHOW
		end
	end
	if itemColor == COLOR_GOLD and (alwaysShowUnique[itemName] or alwaysShowUniqueBase[itemName]) then return SHOW end
	if itemColor == COLOR_GREEN and (alwaysShowSet[itemName] or alwaysShowSetBase[itemName]) then return SHOW end

	if alwaysHide[itemName] then return HIDE end
	if alwaysHideType[itemType[itemName]] then
		if (itemColor == COLOR_GOLD or itemColor == COLOR_GREEN) and typeFilterUniques then
			return HIDE
		elseif not (itemColor == COLOR_GOLD or itemColor == COLOR_GREEN) then
			return HIDE
		end
	end
	if itemColor == COLOR_GOLD and (alwaysHideUnique[itemName] or alwaysHideUniqueBase[itemName]) then return HIDE end
	if itemColor == COLOR_GREEN and (alwaysHideSet[itemName] or alwaysHideSetBase[itemName]) then return HIDE end
	
	if filterEquipment and itemName:find("staff of") then
		local baseItemName = string.match(itemName, "(.*) of ")
		local spellName = string.match(itemName, " of (.*)")
		if alwaysShow["staff of "..spellName] or highValue["staff of "..spellName] then return SHOW end
		if alwaysHide["staff of "..spellName] then return HIDE end
		if staffLevel[baseItemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = staffLevel[baseItemName]+(42-staffLevel[baseItemName])*spellRating[spellName]/4
			if itemColor == COLOR_WHITE and playerLevel*levelMult >= levelRating*rarityMult["normal"] then
				return HIDE
			elseif itemColor == COLOR_BLUE and playerLevel*levelMult >= levelRating*rarityMult["magic"] then
				return HIDE
			elseif itemColor == COLOR_YELLOW and playerLevel*levelMult >= levelRating*rarityMult["rare"] then
				return HIDE
			end
		end
	
	elseif filterEquipment and itemName:find("staff") then
		if itemColor == COLOR_WHITE and playerLevel*levelMult >= staffLevel[itemName]*rarityMult["normal"] then
			return HIDE
		elseif itemColor == COLOR_BLUE and playerLevel*levelMult >= staffLevel[itemName]*rarityMult["magic"] then
			return HIDE
		elseif itemColor == COLOR_YELLOW and playerLevel*levelMult >= staffLevel[itemName]*rarityMult["rare"] then
			return HIDE
		end
	
	elseif filterEquipment and isEquipment(data) and itemLevel[itemName] ~= nil then
		if itemColor == COLOR_WHITE and playerLevel*levelMult >= itemLevel[itemName]*rarityMult["normal"] then
			return HIDE
		elseif itemColor == COLOR_BLUE and playerLevel*levelMult >= itemLevel[itemName]*rarityMult["magic"] then
			return HIDE
		elseif itemColor == COLOR_YELLOW and playerLevel*levelMult >= itemLevel[itemName]*rarityMult["rare"] then
			return HIDE
		end
	
	elseif filterBooks and data.itemType == ITEM_BOOK then
		local spellName = string.match(itemName, " of (.*)")
		if bookLevel[itemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = bookLevel[itemName]+(42-bookLevel[itemName])*spellRating[spellName]/4
			if playerLevel*levelMult >= levelRating*(100-bookStrict)/100*spellMult then
				return HIDE
			end
		end
		
	elseif filterScrolls and data.itemType == ITEM_SCROLL then
		local spellName = string.match(itemName, " of (.*)")
		if scrollLevel[itemName] ~= nil and spellRating[spellName] ~= nil then
			local levelRating = scrollLevel[itemName]+(42-scrollLevel[itemName])*spellRating[spellName]/4
			if playerLevel*levelMult >= levelRating*(100-scrollStrict)/100*spellMult then
				return HIDE
			end
		end
	
	elseif filterGold and data.itemType == ITEM_GOLD then
		local howMuchGold = tonumber(string.match(string.match(itemName,"%d+ gold pieces"),"%d+"))
		if goldLimit == nil then
			if howMuchGold < ((goldStrict/10)*playerLevel*playerLevel)/(5-strictness/100*4) then return HIDE end
		else
			if howMuchGold < goldLimit then return HIDE end
		end
	end
	
	return SHOW
end
