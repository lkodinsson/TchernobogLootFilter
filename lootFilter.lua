require "lootFilter/global"
dofile "lootFilter/data/global.lua"

--load all data files
dofile "lootFilter/data/data_items.lua"
dofile "lootFilter/data/data_uniques.lua"
dofile "lootFilter/data/data_sets.lua"
dofile "lootFilter/data/data_spells.lua"
dofile "lootFilter/data/data_shrines.lua"

--load filter logic
dofile "lootFilter/data/filter_functions.lua"
dofile "lootFilter/data/filter_hideshow.lua"
dofile "lootFilter/data/filter_colors.lua"
dofile "lootFilter/data/filter_names.lua"

--load filter defaults
dofile "lootFilter/data/filter_defaults.lua"

--load filter configuration
dofile "lootFilter/config.ini"

--load filter profile
if PROFILE ~= nil and type(PROFILE)=="string" then
	dofile("lootFilter/profiles/"..PROFILE..".ini")
end

--reconfigure profile to fit within allowed parameters
dofile "lootFilter/data/filter_reconfig.lua"

--load filter update logic
dofile "lootFilter/data/filter_update.lua"

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function myLootFilter(data)
---------------add your functions to the array here!---------------
--list with exception of items
	local exception = {
		updateFilter(data),	-- returns nil so as not to interfere with filter
	}
--list with filters
	local filterList = {
		hideItems(data),
	}
--list with renaming functions
	renameList = {
		renameItems(data),
	}
--list with recoloring functions
	recolorList = {
		recolorItems(data),
	}
---------------end of functions array, don't touch the rest!---------------
	return handleEverything(data,filterList,exception,renameList,recolorList)
end