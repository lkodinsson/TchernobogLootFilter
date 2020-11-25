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

-- Thanks lhf from https://stackoverflow.com/a/4991602/3173125
function isFile(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end
