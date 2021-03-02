
--[[
    ********************************************
    ***         Register Stealthnodes        ***
    ********************************************

    Registers a new Stealthnode with the tile of the given node.

    stealthnode.register_stealthnode(modname, node)

    modname = String. Name of the mod without ":", for example "default".
    node = String. Name of the registered node, for example "sandstone".

]]--

local function copy_table(t)
	if type(t) ~= "table" then return end
	local t2 = {}
	for k,v in pairs(t) do
		t2[k] = v
	end
	return t2
end

function stealthnode.register_stealthnode(modname, node)

	local node_name = modname .. ":" .. node

	local nodedef = minetest.registered_nodes[node_name]

	if not nodedef then
		local message = "[MOD] " .. minetest.get_current_modname() .. ": "
			.. node_name .. " not found to register a stealthnode."
		print(message)
		minetest.log("warning", message)
		return
	end

	local stealthnode_name = "mesecons_stealthnode:" .. modname .. "_" .. node

	local node_groups = copy_table(nodedef.groups) or {}
	node_groups.mesecons_stealthnode = 1

	minetest.register_node(":" .. stealthnode_name, {
		description = "Stealthnode " .. nodedef.description,
		drawtype = nodedef.drawtype,
		tiles = nodedef.tiles,
		use_texture_alpha = nodedef.use_texture_alpha,
		paramtype = nodedef.paramtype,
		paramtype2 = nodedef.paramtype2,
		is_ground_content = false,
		sunlight_propagates = nodedef.sunlight_propagates,
		node_box = nodedef.node_box,
		mesh = nodedef.mesh,
		selection_box = nodedef.selection_box,
		collision_box = nodedef.collision_box,
		sounds = nodedef.sounds,
		groups = node_groups,
		inventory_image = nodedef.inventory_image,
		mesecons = {
			conductor = {
				state = mesecon.state.off,
				rules = mesecon.rules.alldirs,
				onstate = stealthnode_name .. "_active",
			}
		},
		on_blast = mesecon.on_blastnode,
	})

	minetest.register_node(":" .. stealthnode_name .. "_active", {
		drawtype = "airlike",
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		pointable = false,
		walkable = false,
		diggable = false,
		drop = stealthnode_name,
		groups = {
			mesecons_stealthnode_active = 1,
			not_in_creative_inventory = 1,
			not_blocking_trains = 1
		},
		mesecons = {
			conductor = {
				state = mesecon.state.on,
				rules = mesecon.rules.alldirs,
				offstate = stealthnode_name,
			}
		},
		on_construct = function(pos)
			-- remove shadow
			local shadowpos = vector.add(pos, vector.new(0, 1, 0))
			if minetest.get_node(shadowpos).name == "air" then
				minetest.dig_node(shadowpos)
			end
		end,
		on_blast = mesecon.on_blastnode,
	})

	minetest.register_craft({
		output = stealthnode_name .. " 4",
		recipe = {
			{"default:tin_ingot", node_name, "default:tin_ingot"},
			{node_name, "group:mesecon_conductor_craftable", node_name},
			{"default:tin_ingot", node_name, "default:tin_ingot"},
		}
	})
end
