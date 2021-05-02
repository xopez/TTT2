ROLE.Base = "ttt_role_base"

ROLE.index = ROLE_TRAITOR

---
-- @ignore
function ROLE:PreInitialize()
	self.color = Color(209, 43, 39, 255)

	self.abbr = "traitor"

	self.builtin = true

	self.defaultTeam = TEAM_TRAITOR
	self.defaultEquipment = TRAITOR_EQUIPMENT
	self.score.surviveBonusMultiplier = 0.5
	self.score.timelimitMultiplier = -0.5
	self.score.killsMultiplier = 2
	self.score.teamKillsMultiplier = -16
	self.score.bodyFoundMuliplier = 0
	self.fallbackTable = {}

	-- conVarData
	self.conVarData = {
		pct = 0.4,
		maximum = 32,
		minPlayers = 1,
		traitorButton = 1
	}
end

hook.Add("TTT2SpecialRoleSyncing", "TTT2TraitorSync", function(ply, target)
	if target:GetTeam() ~= TEAM_TRAITOR || ply:GetTeam() ~= TEAM_TRAITOR then return end

	ply:TTT2NETSetUInt("subrole", ROLE_TRAITOR, ROLE_BITS, target)
	ply:TTT2NETSetString("team", TEAM_TRAITOR, target)
end)
