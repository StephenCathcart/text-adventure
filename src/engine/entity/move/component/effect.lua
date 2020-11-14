local class = require("src.core.class")
local Effect = class:derive("Effect")

-- Abstract apply to be overridden.
-- @param source The demon applying the efect.
-- @param target The demon being targeted by the effect.
function Effect:apply(source, target)
    error("effect:apply: abstract function")
end

return Effect