local HitCounter = RegisterMod('HitCounter', 1)
local hitcount = 0

function HitCounter:increment(_Hitcounter) -- The mod itself gets passed in automatically but isn't used
    hitcount = hitcount + 1
end

function HitCounter:resetHitCount(_Hitcounter)
    hitcount = 0
end

function HitCounter:render(_HitCounter)
    if Game():GetFrameCount() == 1 then
        hitcount = 0
    end

    Isaac.RenderText(
        "Hit Count:" .. hitcount, -- text
        118, -- x
        5, -- y
        255, -- r
        0,   -- g
        0,   -- b
        255  -- opacity
    )
end

HitCounter:AddCallback(
    ModCallbacks.MC_ENTITY_TAKE_DMG, -- this triggers BEFORE the damage is taken
    HitCounter.increment,
    EntityType.ENTITY_PLAYER
)

HitCounter:AddCallback(
    ModCallbacks.MC_POST_RENDER,
    HitCounter.render
)

HitCounter:AddCallback(
    ModCallbacks.MC_POST_PLAYER_INIT,
    HitCounter.resetHitCount
)

