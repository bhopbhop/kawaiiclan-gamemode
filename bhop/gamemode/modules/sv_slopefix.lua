-- Slopefix by Niflheimr --
-- Description: Makes it so landing on a slope will guarantee a boost --
-- This plugin is ported from the original gamemode from Niflheimr. --

-- Nifl is sexy - justa

Slopefix = {}
Slopefix.Enabled = true -- Unless this module causes problems in your server, this should always be set to true
Slopefix.Debug = false -- Only set this to true if you want to track velocity changes through the server console.

Slopefix.vCurrent = {}
Slopefix.vLast = {}
Slopefix.bOnGround = {}
Slopefix.bLastOnGround = {}

local iMaxVelocity = GetConVar( "sv_maxvelocity" ):GetInt()
local iGravity = GetConVar( "sv_gravity" ):GetInt()

hook.Add( "StartCommand", "Slopefix_Control", function( ply, cmd )
	if not Slopefix.Enabled then return end

	Slopefix.bLastOnGround[ply] = Slopefix.bOnGround[ply] or false
	Slopefix.bOnGround[ply] = ply:IsOnGround()
	Slopefix.vLast[ply] = Slopefix.vCurrent[ply]
	Slopefix.vCurrent[ply] = ply:GetVelocity()

	if Slopefix.bOnGround[ply] and not Slopefix.bLastOnGround[ply] then
		local vPos = ply:GetPos()
		local vMins = ply:OBBMins()
		local vMaxs = ply:OBBMaxs()
		local vEndPos = vPos * 1
		vEndPos.z = vEndPos.z - iMaxVelocity

		local tr = util.TraceHull{
			start = vPos,
			endpos = vEndPos,
			mins = vMins,
			maxs = vMaxs,
			mask = MASK_PLAYERSOLID_BRUSHONLY,
			filter = ply
		}

		if tr.Fraction != 1 then
			local vPlane, vLast = tr.HitNormal, Vector()
			if (vPlane.z >= 0.7 and vPlane.z < 1) then
				vLast = Slopefix.vLast[ply]
				vLast.z = vLast.z - ( iGravity * engine.TickInterval() )

				local fBackOff = vLast:Dot(vPlane)
				local vVel = Vector()

				vVel.x = vLast.x - ( vPlane.x * fBackOff )
				vVel.y = vLast.y - ( vPlane.y * fBackOff )
				vVel.z = vLast.z - ( vPlane.z * fBackOff )

				local fAdjust = vVel:Dot(vPlane)
				if fAdjust < 0 then
					vVel.x = vVel.x - ( vPlane.x * fAdjust )
					vVel.y = vVel.y - ( vPlane.y * fAdjust )
					vVel.z = vVel.z - ( vPlane.z * fAdjust )
				end

				vVel.z, vLast.z = 0, 0

				if ( vVel:Length() > vLast:Length() ) then
					if ( bit.band( ply:GetFlags(), FL_BASEVELOCITY ) != 0 ) then
						local vBase = ply:GetBaseVelocity()
						vVel:Add( vBase )
					end

					ply:SetLocalVelocity( vVel )

					if Slopefix.Debug then
						MsgC( Color( 0, 255, 255 ), "[SM] DEBUGGER: [Slopefix] Player " .. ply:Name() .. " has hooked the slopefix trigger. [vVel.x = " .. vVel.x .. "] [vVel.y = " .. vVel.y .. "]\n" )
					end
				end
			end
		end
	end
end )
