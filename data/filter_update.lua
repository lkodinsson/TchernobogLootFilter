strictnessDefault = strictness	-- save strictness setting on filter load

function updateFilter(data)	-- updates certain variables during active filter operation
	local playerLevel = data.playerLevel
	if type(fixedLevel) == "number" then
		playerLevel = fixedLevel
	end
	
	if scaleToLevel then
		if scaleToLevel == "slow" then
			strictness = strictnessDefault*playerLevel/(120-playerLevel)
		else
			strictness = strictnessDefault*playerLevel/60
		end
	end
end