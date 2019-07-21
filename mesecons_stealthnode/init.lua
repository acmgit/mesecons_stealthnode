--[[
    ********************************************
    ***          Mesecons Stealthnodes        **
    ********************************************

 A mod for Minetest to register various Ghoststones.

]]--

stealthnode = {}
stealthnode.version = "1"
stealthnode.revision = "3"

dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/register.lua")

print("[MOD] " .. minetest.get_current_modname() .. " loaded.")
minetest.log("info", "[MOD] " .. minetest.get_current_modname() .. " loaded.")
