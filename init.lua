--[[
	********************************************
	***         Mesecons Stealthnodes        ***
	********************************************

	A mod for Minetest to register various ghoststones and conducting stones.

]]--

stealthnode = {}
stealthnode.version = "1"
stealthnode.revision = "6"

local modpath = minetest.get_modpath("mesecons_stealthnodes")
local S = minetest.get_translator(minetest.get_current_modname())

stealthnode.S = S

dofile(modpath .. "/register.lua")
dofile(modpath .. "/nodes.lua")

print("[MOD] Mesecons Stealthnodes loaded.")
minetest.log("info", "[MOD] Mesecons Stealthnodes loaded.")
