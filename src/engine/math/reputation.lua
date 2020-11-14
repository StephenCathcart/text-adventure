local Reputation = {
    town_reputation = {
        feared = 0,
        tolerated = 125,
        revered = 250,
        hallowed = 500
    }
}

function Reputation:to_name(reputation)
    assert(reputation >= 0, "invalid reputation")
    if reputation < self.town_reputation.tolerated then
        return "feared"
    elseif reputation < self.town_reputation.revered then
        return "tolerated"
    elseif reputation < self.town_reputation.hallowed then
        return "revered"
    end
    return "hallowed"
end

function Reputation:required(reputation)
    assert(reputation >= 0, "invalid reputation")
    if reputation >= self.town_reputation.hallowed then
        return 0
    elseif reputation >= self.town_reputation.revered then
        return self.town_reputation.hallowed - reputation
    elseif reputation >= self.town_reputation.tolerated then
        return self.town_reputation.revered - reputation
    elseif reputation >= 0 then
        return self.town_reputation.tolerated - reputation
    end
end

function Reputation:next(reputation)
    if reputation >= self.town_reputation.hallowed then
        return self.town_reputation.hallowed
    elseif reputation >= self.town_reputation.revered then
        return self.town_reputation.hallowed
    elseif reputation >= self.town_reputation.tolerated then
        return self.town_reputation.revered
    elseif reputation >= 0 then
        return self.town_reputation.tolerated
    end
end

function Reputation:stats(reputation)
    local previous = self.town_reputation[self:to_name(reputation)]
    local next = self:next(reputation)
    if next - previous == 0 then return next, 1 end
    return next, math.min(1, (reputation - previous) / (next - previous))
end

return Reputation
