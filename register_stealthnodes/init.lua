--[[
       ********************************************
       **                                        **
       **           Stealthnode-Register         **
       **                                        **
       **        Helpmod for Stealthnode to      **
       **      easy Register new Stealthnodes    **
       **                                        **
       ********************************************
]]--

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

                {"moreores", "mithril_block"},

            }

local register = stealthnode.register_stealthnode
for i,value in pairs(snodes) do
    if(minetest.registered_nodes[value[1]..":"..value[2]]) then
        register(value[1], value[2])
    else
        minetest.log("info","[MOD]stealthnode:Node ".. value[1]..":"..value[2].." not found to register a Stealthnode.")
    end -- if(mintest.registered_nodes

end -- for i,value
