local ok, msg

ok, msg = load([[
  local f = => return 'ok' end
  return f()
]])
assert(ok, msg)
print(ok()..' -- => return "ok" end')

ok, msg = load([[
  local f = => "ok" end
  return f()
]])
assert(ok, msg)
print(ok()..' -- => "ok" end')

ok, msg = load([[
  local f = => "o".."k" end
  return f()
]])
assert(ok, msg)
print(ok()..' -- => "o".."k" end')

ok, msg = load([[
  local f = => 
    'ok'
  end
  return f()
]])
assert(ok, msg)
print(ok()..' -- => \\n "ok" end')

ok, msg = load([[
  local f = => (=>"ok")() end
  return f()
]])
assert(ok, msg)
print(ok()..' -- => (=>"ok")() end')


ok, msg = load([[
  local f = (=> 'ok')
  return f()
]])
assert(ok, msg)
print(ok()..' -- (=> "ok")')


ok, msg = load([[
  local f = {bad= =>'bad', ok= =>'ok'}
  return f.ok()
]])
assert(ok, msg)
print(ok()..' -- {bad= =>"bad", ok= =>"ok"}')


ok, msg = load([[
  local f = => 'ok'
  return f()
]])
assert(ok, msg)
print(ok()..' -- => "ok"')




ok, msg = load([[
  local f = s=>s
  return f("ok")
]])
assert(ok, msg)
print(ok()..' -- s=> s')


ok, msg = load([[
  local f = (a,b)=>a..b
  return f("o","k")
]])
assert(ok, msg)
print(ok()..' -- (a,b)=>a..b')


ok, msg = load([[
  local f = (a)=>a
  return f("ok")
]])
assert(ok, msg)
print(ok()..' -- (a)=>a')


ok, msg = load([[
  local f = (...)=>table.concat({...})
  return f("o","k")
]])
assert(ok, msg)
print(ok()..' -- (...)=>table.concat({...})')


ok, msg = load([[
  local f = ...=>table.concat({...})
  return f("o","k")
]])
assert(ok, msg)
print(ok()..' -- ...=>table.concat({...})')


ok, msg = load([[
  local f = function(s) return s end
  return (nil or f)("ok")
]])
assert(ok, msg)
print(ok()..' -- primaryexp test')


ok, msg = load([[
  local f ==>=>"ok"
  return f()()
]])
assert(ok, msg)
print(ok()..' -- no space')


