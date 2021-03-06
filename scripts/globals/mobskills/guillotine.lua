---------------------------------------------
--  Guillotine
--
--  Description: Delivers a four-hit attack. Silences enemy. Duration of effect varies with TP.
--  Type: Physical
--  Number of hits
--  Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(msgBasic.READIES_WS, 0, 689+256);
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 4;
    local accmod = 1;
    local dmgmod = 1.2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    MobStatusEffectMove(mob, target, EFFECT_SILENCE, 1, 0, (skill:getTP()*30/1000)+30);

    -- 242 to a NIN, but shadows ate some hits...
    target:delHP(dmg);
    return dmg;
end;
