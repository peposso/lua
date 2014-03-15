local ok, msg

ok, msg = load([[
  local def test()
    return 'ok'
  end
  return test()
]])
assert(ok, msg)
print(ok()..' -- local def test()')

--
ok, msg = load([[
  local test = def()
    return 'ok'
  end
  return test()
]])
assert(ok, msg)
print(ok()..' -- local test = def()')

--
ok, msg = load([[
  def test()
    return 'ok'
  end
  return test()
]])
assert(ok, msg)
print(ok()..' -- def test()')
_G.test = nil

--
ok, msg = load([[
  test = def()
    return 'ok'
  end
  return test()
]])
assert(ok, msg)
print(ok()..' -- test = def()')
_G.test = nil

--
ok, msg = load([[
  local test = {}
  def test.test()
    return 'ok'
  end
  return test.test()
]])
assert(ok, msg)
print(ok()..' -- def test.test()')

--
ok, msg = load([[
  local test = {}
  def test:test()
    assert(self == test)
    return 'ok'
  end
  return test:test()
]])
assert(ok, msg)
print(ok()..' -- def test:test()')


