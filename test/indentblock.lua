local ok, msg

ok, msg = load([[
  if true:
    return 'ok'
]])
assert(ok, msg)
print(ok()..' -- if')

ok, msg = load([[
  local two = 2
  if 1+1 == two:
    return 'ok'
]])
assert(ok, msg)
print(ok()..' -- if expr')


ok, msg = load([[
  local s = "bad"
  if 1+1 == 2:
    s = "ok"
  return s
]])
assert(ok, msg)
print(ok()..' -- if upvalue')

ok, msg = load([[
  while 1 do
    if 1:
      break
    print "bad"
  end
  return "ok"
]])
assert(ok, msg)
print(ok()..' -- if break')

ok, msg = load([[
  while 1 do
    if 1:
      goto TEST
    print "bad"
  end
  ::TEST:: return "ok"
]])
assert(ok, msg)
print(ok()..' -- if goto')

ok, msg = load([[
  local s = "bad"
  if 1:
    if 1:
      if 1:
        if 1:
          s = "ok"
  return s
]])
assert(ok, msg)
print(ok()..' -- deep if')

ok, msg = load([[
  if nil:
    return "bad"
  elseif true:
    return "ok"
]])
assert(ok, msg)
print(ok()..' -- elseif')

ok, msg = load([[
  if nil:
    return "bad"
  else:
    return "ok"
]])
assert(ok, msg)
print(ok()..' -- else')

ok, msg = load([[
  if nil:
    error()
  else:
    if false:
      error()
    else:
      if 1==2:
        error()
      else:
        return "ok"
]])
assert(ok, msg)
print(ok()..' -- deep else')

-----------------------------
print('----------------------')

ok, msg = load([[
  local f = =>
    "ok"
  return f()
]])
assert(ok, msg)
print(ok()..' -- arrow func indent')

ok, msg = load([[
  local f = =>
    => =>
      => => "ok"
  return f()()()()()
]])
assert(ok, msg)
print(ok()..' -- arrow func deep indent')

















