if strictness < 0 then strictness = 0 end
if strictness > 100 then strictness = 100 end

if goldStrict < 0 then goldStrict = 0 end
if goldStrict > 100 then goldStrict = 100 end

if bookStrict < 0 then bookStrict = 0 end
if bookStrict > 100 then bookStrict = 100 end

if scrollStrict < 0 then scrollStrict = 0 end
if scrollStrict > 100 then scrollStrict = 100 end

if type(fixedLevel) == "number" then --It is allowed to be nil, so only do something if its a number
	if fixedLevel < 0 then fixedLevel = 0 end
	if fixedLevel > 60 then fixedLevel = 60 end
end

if rarityMult["rare"] < 2 then rarityMult["rare"] = 2 end
if spellMult < 2 then spellMult = 2 end
if rarityMult["magic"] < 1.5 then rarityMult["magic"] = 1.5 end
if rarityMult["normal"] < 1 then rarityMult["normal"] = 1 end

if rarityMult["rare"] > 10 then rarityMult["rare"] = 10 end
if spellMult > rarityMult["rare"] then spellMult = rarityMult["rare"] end
if rarityMult["magic"] > rarityMult["rare"] then rarityMult["magic"] = rarityMult["rare"] end
if rarityMult["normal"] > rarityMult["magic"] then rarityMult["normal"] = rarityMult["magic"] end

--strictMult = rarityMult["rare"]*42/60-1
--levelMult = 1+strictness/100*strictMult
if oldStrictnessScaling == true then
	levelMult = 1+strictness/100*(rarityMult["rare"]*42/60-1)
else
	levelMult = strictness/100*(rarityMult["rare"]*42/60)
end
--If you make strictness = 100/7, that simulates the old formula floor on the new formula

alwaysHide = set(alwaysHide)
alwaysHideType = set(alwaysHideType)
alwaysHideUniqueBase = setUniques(alwaysHideUnique)
alwaysHideUnique = set(alwaysHideUnique)
alwaysHideSetBase = setSets(alwaysHideSet)
alwaysHideSet = set(alwaysHideSet)

alwaysShow = set(alwaysShow)
alwaysShowType = set(alwaysShowType)
alwaysShowUniqueBase = setUniques(alwaysShowUnique)
alwaysShowUnique = set(alwaysShowUnique)
alwaysShowSetBase = setSets(alwaysShowSet)
alwaysShowSet = set(alwaysShowSet)

highValue = set(highValue)
highValueUniqueBase = setUniques(highValueUnique)
highValueUnique = set(highValueUnique)
highValueSetBase = setSets(highValueSet)
highValueSet = set(highValueSet)