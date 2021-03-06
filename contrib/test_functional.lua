require('game/scripts/vscripts/libraries/functional')

TestPartial = {}

function TestPartial:setUp ()
  print("Testing partial() from function.lua")
end

function add (a, b)
  return a + b
end

function TestPartial:test1 ()
  print("simple test")
  local addToFive = partial(add, 5)
  assertEquals(addToFive(5), 10)
  assertEquals(addToFive(-5), 0)
  assertEquals(addToFive(-10), -5)
end
