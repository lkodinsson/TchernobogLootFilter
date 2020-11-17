# TchernobogLootFilter
Loki's Loot Filter for Tchernobog
The ultimate Tchernobog loot filter

Functionally it is more of a extension to the functionality of filters. Rather than modifying lootFilter.lua and creating your own logic, you instead create a filter profile. The game loads my filter, loads your profile, and from there it does all the filter work you want.

# Installation
[Download](https://github.com/lkodinsson/TchernobogLootFilter/archive/main.zip) the latest version, then extract it into your lootFilter folder where you have installed Tchernobog. That's it, you're done.

If you want to change the filter's profile to something more strict, open and edit config.ini and set to the name of your desired filter profile. For example:

```PROFILE = "Semi-Strict"```

This would change the currently active filter profile from "Default" to "Semi-strict." Other stock profiles are listed below.

# Stock Profiles
Below are the stock profiles provided.

Default: Extremely low strictness values, so it keeps a majority of items visible. It will also highlight a majority of valuable items.
Semi-Strict: Slightly higher strictness scaling. It will also highlight a majority of valuable items.
Strict: Higher strictness scaling, forcefully hides low value base items. It will also highlight a majority of valuable items.
Super-Strict: Much higher strictness scaling, forcefully hides low value base items, normal items, and basic potions. It will also highlight a majority of valuable items.
Uber-Strict: Extremely high strictness scaling, forcefully hides low value base items, normal and magic items, and basic potions. It will also highlight a majority of valuable items.
Example: This profile is intended as an example profile for creating custom profiles with. It shows how all customizable variables are used. It is not recommended to set your active profile to this one.

# Basic Customization
This is basically a short primer on how-to create a custom profile and a list of variables.

Inside a profile (such as Example.ini in the profiles folder) you may change the following variables to any appropriate value(s), and it will change how the filter functions.

Variable (Type) — Description
strictness (Number) — Degree of overall filter strictness, ranges from 0 to 100
goldStrict (Number) — Degree of filter strictness on gold, ranges from 0 to 100
bookStrict (Number) — Degree of filter strictness on books, ranges from 0 to 100
scrollStrict (Number) — Degree of filter strictness on scrolls, ranges from 0 to 100
scaleToLevel (Number) — Forced character level, ranges from 0 to 60 (overrides automatic level scaling)
goldLimit (Number) — Lowest visible size of gold piles (overrides automatic scaling if set to any value)
showNormal (Boolean) — Are normal items are allowed to be visible (does not force them to be visible)
showMagic (Boolean) — Are magic items are allowed to be visible (does not force them to be visible)
showRare (Boolean) — Are rare items are allowed to be visible (does not force them to be visible)
filterEquipment (Boolean) — Is equipment filtered by level/strictness
filterGold (Boolean) — Is gold filtered by level/strictness
filterBooks (Boolean) — Are books filtered by level/strictness
filterScrolls (Boolean) — Are scrolls filtered by level/strictness
trapWarning (Boolean) — Traps will show up as "! TRAPPED !" to be more obvious
alwaysHide (Table) — List of items to always hide
alwaysHideType (Table) — List of item types to always hide
alwaysHideUnique (Table) — List of unique items to always hide
alwaysHideSet (Table) — List of set items to always hide
alwaysShow (Table) — List of items to always show (priority over hide)
alwaysShowType (Table) — List of item types to always show (priority over hide)
alwaysShowUnique (Table) — List of unique items to always show (priority over hide)
alwaysShowSet (Table) — List of set items to always show (priority over hide)
highValue (Table) — List of items to always show, and recolor purple (highest priority)
highValueJewelry (Boolean) — Always show unique jewelry, and recolors them purple (highest priority)
highValueUnique (Table) — List of unique items to always show, and recolor purple (highest priority)
highValueSet (Table) — List of set items to always show, and recolor purple (highest priority)
typeFilterUniques (Boolean) — Whether or not type filtering effects unique/set items
renameItemList (Table) — List of items to rename, and what to
renameSubList (Table) — List of parts of item names, and what to change them to
recolorEquipment (Boolean) — Low level normal equipment is recolored grey (overridden by recolorItemList)
recolorPotions (Boolean) — Potions will be recolored for clarity and value (overridden by recolorItemList)
recolorBooks (Boolean) — Books will be recolored for clarity and value (overridden by recolorItemList)
recolorScrolls (Boolean) — Scrolls will be recolored for clarity and value (overridden by recolorItemList)
recolorShrines (Boolean) — Shrines will be recolored for clarity and value (overridden by recolorItemList)
recolorItemList (Table) — List of items to recolor, and what to

(More will be added to this list in the future)

Defaults for these variables can be found in the data/filter_defaults.lua.

# Advanced Customization
I'll make a tutorial for safely changing values set in the data files at some point.

data_items.lua
data_uniques.lua
data_sets.lua
data_spells.lua
data_shrines.lua

For example:

```shrines["diabolic"] = COLOR_ORANGE```