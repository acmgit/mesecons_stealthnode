--[[
	********************************************
	***         Mesecons Stealthnodes        ***
	********************************************

	A mod for Minetest to register various Ghoststones.

]]--

stealthnode = {}
stealthnode.version = "1"
stealthnode.revision = "5"

local modpath = minetest.get_modpath("mesecons_stealthnodes")

dofile(modpath .. "/register.lua")
dofile(modpath .. "/nodes.lua")

print("[MOD] Mesecons Stealthnodes loaded.")
minetest.log("info", "[MOD] Mesecons Stealthnodes loaded.")
