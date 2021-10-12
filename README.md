# TchernobogLootFilter
Primarily this acts to extend the functionality of filters and make creating them simpler. Rather than having you modify lootFilter.lua and creating your own logic, you instead create a filter profile. The game loads my filter, loads your profile, and from there it does all the filter work you want.

# Installation
[Download the latest version](https://github.com/lkodinsson/TchernobogLootFilter/archive/main.zip), then extract the contents of the folder inside that archive into your lootFilter folder where you have installed Tchernobog (it should ask you to overwrite lootFilter.lua). Once you have done that, it's ready to go.

If you want to change the filter's profile to something more strict, open and edit config.ini and set to the name of your desired filter profile. For example:

```
PROFILE = "Semi-Strict"
```

This would change the currently active filter profile from "Default" to "Semi-strict." Other stock profiles are listed below.

# Stock Profiles
Below are the stock profiles provided. Each one contains features from the previous filter.

| Profile | Description |
| --- | --- |
| Default | Extremely low strictness. Keeps a majority of items visible. Highlights a majority of valuable items. |
| Semi-Strict | Slightly higher strictness scaling. |
| Strict | Higher strictness scaling, forcefully hides low value base items. |
| Super-Strict | Much higher strictness scaling, forcefully hides normal items, and basic potions. |
| Uber-Strict | Extremely high strictness scaling, forcefully hides magic items. |

There is also an example profile provided. It shows how all variables are used. It is not recommended for normal use.

# Customization
Creating filters is about as easy as creating a new text file, then declaring something like:

```
goldLimit = 5000
```

Then picking that file as your profile, and toggling your loot filter in-game. (No restart required)

[See the wiki](https://github.com/lkodinsson/TchernobogLootFilter/wiki) for more details on how to build a profile. If you're looking for the reference list of variables, [click here](https://github.com/lkodinsson/TchernobogLootFilter/wiki/Configurable-Variables).
