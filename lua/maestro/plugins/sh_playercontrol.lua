maestro.command("speed", {"player:target","speed:number"}, function(caller, targets,speed)
	if #targets == 0 then
		return true, "Query matched no players."
	end
	for _, ply in pairs(targets) do
		ply:SetRunSpeed(speed)
		ply:SetWalkSpeed(speed/2)
	end
	return false, "set the speed of %1 to %2"
end, [[Change player run speed. 500 is normal speed.]])

maestro.command("jump", {"player:target","power:number"}, function(caller, targets,power)
	if #targets == 0 then
		return true, "Query matched no players."
	end
	for _, ply in pairs(targets) do
		ply:SetJumpPower(power)
	end
	return false, "set the jump force of %1 to %2"
end, [[Change player jump power. 200 is normal power.]])

maestro.command("flashlight", {"player:target","boolean:enabled(optional)"}, function(caller, targets,enabled)
    if #targets == 0 then
        return true, "Query matched no players."
    end
	
    if enabled == nil then
        for i = 1, #targets do
            local ply = targets[i]
			local currentState = ply:CanUseFlashlight()
            ply:AllowFlashlight( not currentState )
        end
        return false, "toggled flashlight on %1"
		
    else
        for i = 1, #targets do
            local ply = targets[i]
            ply:AllowFlashlight( enabled )
        end
		
        if enabled then
            return false, "enabled flashlight on %1"
        end
        return false, "disabled flashlight on %1"
		
	end
end, [[Toggle a player's ability to use the flashlight.]])

maestro.command("act", {"action"}, function(caller, action)
		caller:ConCommand( "act "..action )
end, [[The ability to act without using the console.]])

maestro.command("matfix", {}, function(caller)
		caller:SetMaterial()
		caller:SetColor( Color(255, 255, 255) )
		return false, "fixed their material"
end, [[Fix material and color.]])

maestro.command("getpos", {"accurate:boolean(optional)"}, function(caller, accurate)
	local pos = caller:GetPos()
	if !accurate then
		pos.x = math.floor(pos.x)
		pos.y = math.floor(pos.y)
		pos.z = math.floor(pos.z)
	end
	
	caller:ChatPrint( "Vector("..pos.x..", "..pos.y..", "..pos.z..")" )
	return false
end, [[Get position and return as a Vector.]])

maestro.command("playermodel", {"model"}, function(caller, model)
		caller:SetModel(model)
		return false, "set their playermodel to %1"
end, [[Set your playermodel.]])


--Plugin by FluffyXVI
