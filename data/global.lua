COLOR_PURPLE = 9

SHOW = false
HIDE = true

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
function lootFilter(displayedName,textColor,itemType,isIdentified,playerClass,playerLevel)
	local isGood,v1,v2,v3 = pcall(myLootFilter,{displayedName=displayedName:lower(),textColor=textColor,itemType=itemType,isIdentified=isIdentified,playerClass=playerClass,playerLevel=playerLevel})
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
				printMsg("Your loot filter returned bad values! It should return <new displayed name>,<new color>,<show or not>")	
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