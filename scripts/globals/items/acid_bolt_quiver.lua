-----------------------------------------
-- ID: 5335
-- Item: Acid Bolt Quiver
-- When used, you will obtain one stack of Acid Bolts
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
return result;
end;

function onItemUse(target)
    target:addItem(18148,99);
end;