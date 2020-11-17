function renameItems(data)
	local itemName = data.displayedName
	local itemColor = data.textColor
	
	if trapWarning and data.itemType == -1 and not itemName:find("blocked") and itemColor == COLOR_RED then
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