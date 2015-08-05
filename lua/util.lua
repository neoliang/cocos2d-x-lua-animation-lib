local map
map = function(ls, f)
  local tls = { }
  for _, l in ipairs(ls) do
    table.insert(tls, f(l))
  end
  return tls
end
local foldl
foldl = function(ls, initv, acc)
  for _, l in ipairs(ls) do
    initv = acc(initv, l)
  end
  return initv
end
local zip
zip = function(ls1, ls2)
  local len = math.min(#ls1, #ls2)
  local r = { }
  for i = 1, len do
    table.insert(r, {
      ls1[i],
      ls2[i]
    })
  end
  return r
end
local filter
filter = function(ls, f)
  local r = { }
  for _, l in ipairs(ls) do
    if f(l) then
      table.insert(r, l)
    end
  end
  return r
end
local isItemInList
isItemInList = function(ls, item)
  for _, l in ipairs(ls) do
    if l == item then
      return true
    end
  end
  return false
end
local randomItemInList
randomItemInList = function(ls)
  if ls == nil or #ls == 0 then
    return nil
  else
    return ls[math.random(1, #ls)]
  end
end
return {
  map = map,
  foldl = foldl,
  zip = zip,
  isItemInList = isItemInList,
  filter = filter,
  randomItemInList = randomItemInList
}
