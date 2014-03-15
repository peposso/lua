local ok, msg

ok, msg = load([[
  if false then
    error('bad')
  elif true then
    return 'ok'
  end
]])
assert(ok, msg)
print(ok()..' -- multiline elif')

ok, msg = load([[
  if false then return 'bad' elif true then return 'ok' end
]])
assert(ok, msg)
print(ok()..' -- oneline elif')

