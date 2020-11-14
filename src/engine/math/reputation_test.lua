local t = require("lib.dev.luaunit")
local reputation = require("src.engine.math.reputation")

TestReputation = {}

function TestReputation:test_to_name_feared()
    t.assertEquals(reputation:to_name(0), "feared")
    t.assertEquals(reputation:to_name(124), "feared")
end

function TestReputation:test_to_name_tolerated()
    t.assertEquals(reputation:to_name(125), "tolerated")
    t.assertEquals(reputation:to_name(249), "tolerated")
end

function TestReputation:test_to_name_revered()
    t.assertEquals(reputation:to_name(250), "revered")
    t.assertEquals(reputation:to_name(499), "revered")
end

function TestReputation:test_to_name_hallowed()
    t.assertEquals(reputation:to_name(500), "hallowed")
    t.assertEquals(reputation:to_name(501), "hallowed")
end

function TestReputation:test_to_name_invalid_reputation()
    t.assertErrorMsgContains("invalid reputation", reputation.to_name, reputation, -1)
end

function TestReputation:test_required()
    t.assertEquals(reputation:required(0), 125)
    t.assertEquals(reputation:required(124), 1)
    t.assertEquals(reputation:required(125), 125)
    t.assertEquals(reputation:required(249), 1)
    t.assertEquals(reputation:required(250), 250)
    t.assertEquals(reputation:required(499), 1)
    t.assertEquals(reputation:required(500), 0)
end

function TestReputation:test_required_invalid_reputation()
    t.assertErrorMsgContains("invalid reputation", reputation.required, reputation, -1)
end

function TestReputation:test_next_feared()
    t.assertEquals(reputation:next(0), 125)
    t.assertEquals(reputation:next(124), 125)
end

function TestReputation:test_next_tolerated()
    t.assertEquals(reputation:next(125), 250)
    t.assertEquals(reputation:next(249), 250)
end

function TestReputation:test_next_revered()
    t.assertEquals(reputation:next(250), 500)
    t.assertEquals(reputation:next(499), 500)
end

function TestReputation:test_next_exalted()
    t.assertEquals(reputation:next(500), 500)
    t.assertEquals(reputation:next(501), 500)
end

os.exit(t.LuaUnit.run())
