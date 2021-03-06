 
minetest.register_chatcommand("affect",{
	params = "<name> <affectid>",
	description = "Applies an affect to a player",
	privs = {affects=true},
	func = function (name, param)
		local aname, affectid = string.match(param, "([^ ]+) (.+)")	
		if ( aname == nil or aname == "" or affectid == nil or affectid == '' ) then
			minetest.chat_send_player(name, "Syntax: affect <name> <affectid>")
		elseif ( affects.affectPlayer(aname,affectid) ) then
			minetest.chat_send_player(name,aname.." has been affected by "..affects._affects[affectid].name)
		else
			minetest.chat_send_player(name,"Unable to affect "..aname.." with "..affectid)
		end
	end
})

minetest.register_chatcommand("removeaffect",{
	params = "<name> [affectid]",
	description = "Remove an affect or all affects from a player",
	privs = {affects=true},
	func = function (name, param)
		local aname, affectid = string.match(param, "([^ ]+) (.+)")	
		if ( aname == nil or aname == "" ) then
			minetest.chat_send_player(name, "Syntax: removeaffect <name> [affectid]")
		elseif ( affects.removeAffect(aname,affectid) ) then
			minetest.chat_send_player(name,"Affect removed from "..aname)
		else
			minetest.chat_send_player(name,"Unable to remove affects")
		end
	end
})
