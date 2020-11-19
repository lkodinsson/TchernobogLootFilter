rarityMult = {
	["normal"] = 4, --must range from 1 to 10
	["magic"] = 7, --must range from 1.5 to 10
	["rare"] = 10, --must range from 2 to 10
}

itemLevel = {
	-- head gear (tier 1)
	["cap"] = 1,				-- level 1
	["skull cap"] = 2,			-- level 1
	["helm"] = 3,
	["full helm"] = 6,
	["crown"] = 9,
	["great helm"] = 13,
	["horned helm"] = 17,
	-- head gear (tier 2)
	["war hat"] = 20,
	["sallet"] = 22,
	["barbute"] = 25,
	["visor"] = 29,
	["grand crown"] = 32,
	["ancient helm"] = 35,
	["spired helm"] = 40,
	
	-- body armor (tier 1)
	["rags"] = 1,				-- level 1
	["cape"] = 1.33,			-- level 1
	["cloak"] = 1.67,			-- level 1
	["robe"] = 2,				-- level 1
	["quilted armor"] = 2.33,	-- level 1
	["leather armor"] = 2.67,	-- level 1
	["hard leather armor"] = 3,	-- level 1
	["studded leather armor"] = 4,
	["ring mail"] = 5,
	["chain mail"] = 7,
	["scale mail"] = 9,
	["breast plate"] = 9,
	["splint mail"] = 10,
	["light plate"] = 13,
	["plate mail"] = 12,
	["gothic plate"] = 15,
	["full plate mail"] = 19,
	-- body armor (tier 2)
	["tatters"] = 11,
	["mantle"] = 13,
	["shroud"] = 15,
	["grand robe"] = 17,
	["serpentskin armor"] = 18,
	["demonhide armor"] = 21,
	["wyrmhide armor"] = 24,
	["dragonhide armor"] = 26,
	["linked mail"] = 28,
	["mesh armor"] = 29,
	["hauberk"] = 30,
	["cuirass"] = 32,
	["tigulated mail"] = 33,
	["archon plate"] = 36,
	["templar plate"] = 34,
	["ornate plate"] = 37,
	["ancient plate"] = 41,
	
	-- belts (tier 1)
	["sash"] = 1.5,				-- level 1
	["light belt"] = 2,
	["belt"] = 6,
	["heavy belt"] = 11,
	["plated belt"] = 18,
	-- belts (tier 2)
	["demonhide sash"] = 21,
	["sharkskin belt"] = 25,
	["mesh belt"] = 29,
	["battle belt"] = 33,
	["war belt"] = 41,
	
	-- shields (tier 1)
	["buckler"] = 2,			-- level 1
	["small shield"] = 3,		-- level 1
	["large shield"] = 4,
	["kite shield"] = 8,
	["tower shield"] = 13,
	["gothic shield"] = 15,
	-- shields (tier 2)
	["defender"] = 20,
	["round shield"] = 23,
	["dragon shield"] = 26,
	["monarch"] = 30,
	["ward"] = 35,
	["aegis"] = 37,
	
	-- 1h swords (tier 1)
	["dagger"] = 1,				-- level 1
	["short sword"] = 1.5,		-- level 1
	["scimitar"] = 2,			-- level 1
	["sabre"] = 3,				-- level 1
	["blade"] = 4,
	["falchion"] = 5,
	["claymore"] = 6,
	["long sword"] = 9,
	["broad sword"] = 13,
	["bastard sword"] = 18,
	-- 1h swords (tier 2)
	["bone knife"] = 19,
	["gladius"] = 21,
	["rapier"] = 23,
	["cutlass"] = 25,
	["backsword"] = 26,
	["tulwar"] = 28,
	["espadon"] = 29,
	["battle sword"] = 31,
	["rune sword"] = 35,
	["ancient sword"] = 41,
	
	-- 2h swords
	["two handed sword"] = 16,
	["great sword"] = 23,
	["colossal blade"] = 38,
	["executioner's sword"] = 42,
	
	-- 1h maces (tier 1)
	["club"] = 1,				-- level 1
	["spiked club"] = 2,		-- level 1
	["mace"] = 3,
	["morning star"] = 7,
	["flail"] = 12,
	["war hammer"] = 17,
	["scepter"] = 19,
	-- 1h maces (tier 2)
	["cudgel"] = 14,
	["barbed club"] = 20,
	["flanged mace"] = 25,
	["jagged star"] = 29,
	["knout"] = 34,
	["battle hammer"] = 39,
	["divine scepter"] = 41,
	
	-- 2h maces
	["maul"] = 13,
	["great maul"] = 22,
	["war maul"] = 36,
	["martel de fer"] = 42,
	
	-- axes (tier 1)
	["small axe"] = 2,			-- level 1
	["axe"] = 3,				-- level 1
	["large axe"] = 4,			-- level 1
	["broad axe"] = 6,
	["battle axe"] = 10,
	["great axe"] = 15,
	["giant axe"] = 18,
	-- axes (tier 2)
	["cleaver"] = 21,
	["military axe"] = 22,
	["twin axe"] = 24,
	["bearded axe"] = 29,
	["tabar"] = 34,
	["gothic axe"] = 38,
	["ancient axe"] = 42,
	
	-- bows (tier 1)
	["short bow"] = 1,			-- level 1
	["hunter's bow"] = 2,		-- level 1
	["long bow"] = 3,
	["composite bow"] = 6,
	["short battle bow"] = 11,
	["long battle bow"] = 15,
	["short war bow"] = 18,
	["long war bow"] = 21,
	-- bows (tier 2)
	["edge bow"] = 19,
	["razor bow"] = 23,
	["cedar bow"] = 25,
	["ward bow"] = 29,
	["short siege bow"] = 33,
	["long siege bow"] = 37,
	["rune bow"] = 41,
	["gothic bow"] = 42,
	
	-- jewelry
	["ring"] = 42,
	["amulet"] = 42,
}

staffLevel = {
	-- tier 1
	["short staff"] = 1,
	["long staff"] = 3,
	["composite staff"] = 6,
	["quarter staff"] = 10,
	["war staff"] = 16,
	-- tier 2
	["elder staff"] = 20,
	["cedar staff"] = 25,
	["gothic staff"] = 29,
	["rune staff"] = 33,
	["archon staff"] = 38,
}

-- types are: "head gear", "body armor", "belt", "shield", "sword", "2h sword", "mace", "2h mace", "axe", "bow", "staff", and "jewelry"
itemType = {
	-- head gear (tier 1)
	["cap"] = "head gear",
	["skull cap"] = "head gear",
	["helm"] = "head gear",
	["full helm"] = "head gear",
	["crown"] = "head gear",
	["great helm"] = "head gear",
	["horned helm"] = "head gear",
	-- head gear (tier 2)
	["war hat"] = "head gear",
	["sallet"] = "head gear",
	["barbute"] = "head gear",
	["visor"] = "head gear",
	["grand crown"] = "head gear",
	["ancient helm"] = "head gear",
	["spired helm"] = "head gear",
	
	-- body armor (tier 1)
	["rags"] = "body armor",
	["cape"] = "body armor",
	["cloak"] = "body armor",
	["robe"] = "body armor",
	["quilted armor"] = "body armor",
	["leather armor"] = "body armor",
	["hard leather armor"] = "body armor",
	["studded leather armor"] = "body armor",
	["ring mail"] = "body armor",
	["chain mail"] = "body armor",
	["scale mail"] = "body armor",
	["breast plate"] = "body armor",
	["splint mail"] = "body armor",
	["light plate"] = "body armor",
	["plate mail"] = "body armor",
	["gothic plate"] = "body armor",
	["full plate mail"] = "body armor",
	-- body armor (tier 2)
	["tatters"] = "body armor",
	["mantle"] = "body armor",
	["shroud"] = "body armor",
	["grand robe"] = "body armor",
	["serpentskin armor"] = "body armor",
	["demonhide armor"] = "body armor",
	["wyrmhide armor"] = "body armor",
	["dragonhide armor"] = "body armor",
	["linked mail"] = "body armor",
	["mesh armor"] = "body armor",
	["hauberk"] = "body armor",
	["cuirass"] = "body armor",
	["tigulated mail"] = "body armor",
	["archon plate"] = "body armor",
	["templar plate"] = "body armor",
	["ornate plate"] = "body armor",
	["ancient plate"] = "body armor",
	
	-- belts (tier 1)
	["sash"] = "belt",
	["light belt"] = "belt",
	["belt"] = "belt",
	["heavy belt"] = "belt",
	["plated belt"] = "belt",
	-- belts (tier 2)
	["demonhide sash"] = "belt",
	["sharkskin belt"] = "belt",
	["mesh belt"] = "belt",
	["battle belt"] = "belt",
	["war belt"] = "belt",
	
	-- shields (tier 1)
	["buckler"] = "shield",
	["small shield"] = "shield",
	["large shield"] = "shield",
	["kite shield"] = "shield",
	["tower shield"] = "shield",
	["gothic shield"] = "shield",
	-- shields (tier 2)
	["defender"] = "shield",
	["round shield"] = "shield",
	["dragon shield"] = "shield",
	["monarch"] = "shield",
	["ward"] = "shield",
	["aegis"] = "shield",
	
	-- 1h swords (tier 1)
	["dagger"] = "sword",
	["short sword"] = "sword",
	["scimitar"] = "sword",
	["sabre"] = "sword",
	["blade"] = "sword",
	["falchion"] = "sword",
	["claymore"] = "sword",
	["long sword"] = "sword",
	["broad sword"] = "sword",
	["bastard sword"] = "sword",
	-- 1h swords (tier 2)
	["bone knife"] = "sword",
	["gladius"] = "sword",
	["rapier"] = "sword",
	["cutlass"] = "sword",
	["backsword"] = "sword",
	["tulwar"] = "sword",
	["espadon"] = "sword",
	["battle sword"] = "sword",
	["rune sword"] = "sword",
	["ancient sword"] = "sword",
	
	-- 2h swords
	["two handed sword"] = "2h sword",
	["great sword"] = "2h sword",
	["colossal blade"] = "2h sword",
	["executioner's sword"] = "2h sword",
	
	-- 1h maces (tier 1)
	["club"] = "mace",
	["spiked club"] = "mace",
	["mace"] = "mace",
	["morning star"] = "mace",
	["flail"] = "mace",
	["war hammer"] = "mace",
	["scepter"] = "mace",
	-- 1h maces (tier 2)
	["cudgel"] = "mace",
	["barbed club"] = "mace",
	["flanged mace"] = "mace",
	["jagged star"] = "mace",
	["knout"] = "mace",
	["battle hammer"] = "mace",
	["divine scepter"] = "mace",
	
	-- 2h maces
	["maul"] = "2h mace",
	["great maul"] = "2h mace",
	["war maul"] = "2h mace",
	["martel de fer"] = "2h mace",
	
	-- axes (tier 1)
	["small axe"] = "axe",
	["axe"] = "axe",
	["large axe"] = "axe",
	["broad axe"] = "axe",
	["battle axe"] = "axe",
	["great axe"] = "axe",
	["giant axe"] = "axe",
	-- axes (tier 2)
	["cleaver"] = "axe",
	["military axe"] = "axe",
	["twin axe"] = "axe",
	["bearded axe"] = "axe",
	["tabar"] = "axe",
	["gothic axe"] = "axe",
	["ancient axe"] = "axe",
	
	-- bows (tier 1)
	["short bow"] = "bow",
	["hunter's bow"] = "bow",
	["long bow"] = "bow",
	["composite bow"] = "bow",
	["short battle bow"] = "bow",
	["long battle bow"] = "bow",
	["short war bow"] = "bow",
	["long war bow"] = "bow",
	-- bows (tier 2)
	["edge bow"] = "bow",
	["razor bow"] = "bow",
	["cedar bow"] = "bow",
	["ward bow"] = "bow",
	["short siege bow"] = "bow",
	["long siege bow"] = "bow",
	["rune bow"] = "bow",
	["gothic bow"] = "bow",
	
	-- staves (tier 1)
	["short staff"] = "staff",
	["long staff"] = "staff",
	["composite staff"] = "staff",
	["quarter staff"] = "staff",
	["war staff"] = "staff",
	-- staves (tier 2)
	["elder staff"] = "staff",
	["cedar staff"] = "staff",
	["gothic staff"] = "staff",
	["rune staff"] = "staff",
	["archon staff"] = "staff",
	
	-- jewelry
	["ring"] = "jewelry",
	["amulet"] = "jewelry",
	
	-- currently wands and crossbows are not listed because they only show up on unique/set items
	-- the same logic applies to weird base items which technically fit into a given category above but only appear on unique/set items (such as the head gear "corona")
}

potionColor = {
	["healing potion"] = COLOR_GREY,
	["mana potion"] = COLOR_GREY,
	["rejuvenation potion"] = COLOR_WHITE,
	["full healing potion"] = COLOR_WHITE,
	["full mana potion"] = COLOR_WHITE,
	["full rejuvenation potion"] = COLOR_BLUE,
	["elixir of strength"] = COLOR_YELLOW,
	["elixir of magic"] = COLOR_YELLOW,
	["elixir of dexterity"] = COLOR_YELLOW,
	["elixir of vitality"] = COLOR_YELLOW,
}
