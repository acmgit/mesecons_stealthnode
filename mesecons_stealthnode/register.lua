--[[
    ********************************************
    ***          Register Stealthnodes        **
    ********************************************

    Registers a new Ghoststone with the tile of the given Node.

    stealthnode.register_stealthnode(Name, Node)

    Modname = String. Name of the Mod without ":", for example "default"
    Node = String. Name of the registered Node

]]--

function stealthnode.register_stealthnode(modname, node)

    local tile

    if minetest.registered_nodes[modname .. ":" .. node] == nil then
        print("[MOD] " .. minetest.get_current_modname() .. ": "
              .. modname .. ":" .. node .. " not found to register a stealthnode.")
        minetest.log("warning", "[MOD] " .. minetest.get_current_modname() .. ": "
                      .. modname .. ":" .. node .. " not found to register a stealthnode.")
        return
    else
        tile = minetest.registered_nodes[modname .. ":" .. node].tiles

    end

    local newgroup = stealthnode.table_clone(minetest.registered_nodes[modname .. ":" .. node].groups)

    minetest.register_node(":mesecons_stealthnode:" .. modname .. "_" .. node, {
        description="Stealthnode " .. minetest.registered_nodes[modname .. ":" .. node].description,
        tiles = tile,
        is_ground_content = false,
        inventory_image = tile,
        groups = newgroup,
        sounds = minetest.registered_nodes[modname .. ":" .. node].sounds,
        mesecons = {conductor = {
                    state = mesecon.state.off,
                    rules = mesecon.rules.alldirs,
                    onstate = "mesecons_stealthnode:" .. modname .. "_" .. node .. "_active"
                    }},
        on_blast = mesecon.on_blastnode,
    })

    minetest.register_node(":mesecons_stealthnode:" .. modname .. "_" .. node .. "_active", {
        drawtype = "airlike",
        pointable = false,
        walkable = false,
        diggable = false,
        is_ground_content = false,
        sunlight_propagates = true,
        paramtype = "light",
        drop = "mesecons_stealthnode:" .. modname .. "_" .. node,
        mesecons = {conductor = {
            state = mesecon.state.on,
            rules = mesecon.rules.alldirs,
            offstate = "mesecons_stealthnode:" .. modname .. "_" .. node
        }},
        on_construct = function(pos)
            -- remove shadow
            shadowpos = vector.add(pos, vector.new(0, 1, 0))
            if (minetest.get_node(shadowpos).name == "air") then
                minetest.dig_node(shadowpos)
            end
        end,
        on_blast = mesecon.on_blastnode,
    })


    minetest.register_craft({
        output = 'mesecons_stealthnode:' .. modname .. "_" .. node .. ' 4',
        recipe = {
            {"default:tin_ingot", modname .. ":" .. node, "default:tin_ingot"},
            {modname .. ":" .. node, "group:mesecon_conductor_craftable", modname .. ":" .. node},
            {"default:tin_ingot", modname .. ":" .. node, "default:tin_ingot"},
        }
    })

end -- function stealthnode.register_stealth_node(


function stealthnode.table_clone(c_table)
  local t2 = {}
  for k,v in pairs(c_table) do
    t2[k] = v

  end

  return t2

end -- function cucina_vegana.table_clone
