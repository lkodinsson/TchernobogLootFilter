strictnessDefault = strictness	-- save strictness setting on filter load

function updateFilter(data)	-- updates certain variables during active filter operation
	local playerLevel = data.playerLevel
	if type(fixedLevel) == "number" then
		playerLevel = fixedLevel
	end
	
	if scaleToLevel then
		strictness = strictnessDefault*playerLevel/60
	end
end