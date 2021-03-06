--LinkLuaModifier("modifier_boss_twin_twin_empathy_buff", "abilities/twin/boss_twin_twin_empathy.lua", LUA_MODIFIER_MOTION_NONE)

modifier_boss_twin_twin_empathy_buff = class({})

--This may need to be in the abil not the mod
function modifier_boss_twin_twin_empathy_buff:OnCreated()
  local interval = 2 --self:GetSpecialValueFor( "heal_timer" )
  self:StartIntervalThink(interval)
  return true
end

function modifier_boss_twin_twin_empathy_buff:IsHidden()
  return false
end

function modifier_boss_twin_twin_empathy_buff:IsPurgable()
  return false
end

function modifier_boss_twin_twin_empathy_buff:OnIntervalThink()
  if IsServer() then	
  end

  local master = self:GetCaster()
  local twin = self:GetParent()

	if twin:IsAlive() then
	  if twin:GetHealth() < master:GetHealth() then
      twin:SetHealth(master:GetHealth())
    end
    if twin:GetHealth() > master:GetHealth() then
      master:SetHealth(twin:GetHealth()) 
    end
	end
end

