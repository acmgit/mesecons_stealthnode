--[[
    ********************************************
    ***          Mesecons Stealthnodes        **
    ********************************************

 A mod for Minetest to register various Ghoststones.

]]--

stealthnode = {}
stealthnode.version = "1"
stealthnode.revision = "0"

dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/register.lua")

local snodes = {
                {"default", "cobble"},
                {"default", "stone"},
                {"default", "stonebrick"},
                {"default", "stone_block"},

                {"default", "desert_cobble"},
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

            }

for i,value in pairs(snodes) do
    stealthnode.register_stealthnode(value[1], value[2])

end

print("[MOD] " .. minetest.get_current_modname() .. " loaded.")
minetest.log("info", "[MOD] " .. minetest.get_current_modname() .. " loaded.")
