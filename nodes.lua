--[[
	********************************************
	***              Stealthnodes            ***
	********************************************

	Adds various Stealthnodes for nodes from "default" and "moreores".

]]--

local nodes = {

	{"default", "dirt"},
	{"default", "dry_dirt"},
	{"default", "permafrost"},
	{"default", "gravel"},
	{"default", "clay"},
	{"default", "snowblock"},
	{"default", "ice"},
	{"default", "coral_skeleton"},

	{"default", "sand"},
	{"default", "silver_sand"},
	{"default", "desert_sand"},

	{"default", "cobble"},
	{"default", "mossycobble"},
	{"default", "desert_cobble"},

	{"default", "stone"},
	{"default", "stonebrick"},
	{"default", "stone_block"},

	{"default", "glass"},
	{"default", "obsidian_glass"},

	{"default", "desert_stone"},
	{"default", "desert_stonebrick"},
	{"default", "desert_stone_block"},

	{"default", "sandstone"},
	{"default", "sandstonebrick"},
	{"default", "sandstone_block"},

	{"default", "desert_sandstone"},
	{"default", "desert_sandstone_brick"},
	{"default", "desert_sandstone_block"},

	{"default", "silver_sandstone"},
	{"default", "silver_sandstone_brick"},
	{"default", "silver_sandstone_block"},

	{"default", "obsidian"},
	{"default", "obsidianbrick"},
	{"default", "obsidian_block"},

	{"default", "wood"},
	{"default", "tree"},

	{"default", "junglewood"},
	{"default", "jungletree"},

	{"default", "aspen_wood"},
	{"default", "aspen_tree"},

	{"default", "pine_wood"},
	{"default", "pine_tree"},

	{"default", "acacia_wood"},
	{"default", "acacia_tree"},

	{"moreores", "mithril_block"},
	{"moreores", "silver_block"},
}

for _,value in pairs(nodes) do
	if minetest.get_modpath(value[1]) then
		stealthnode.register_stealthnode(value[1], value[2])
	end
end
