local moveTo
moveTo = function(dt, x, y)
  if tolua.type(x) == 'CCPoint' then
    return CCMoveTo:create(dt, x)
  else
    return CCMoveTo:create(dt, ccp(x, y))
  end
end
local moveBy
moveBy = function(dt, x, y)
  if tolua.type(x) == 'CCPoint' then
    return CCMoveBy:create(dt, x)
  else
    return CCMoveBy:create(dt, ccp(x, y))
  end
end
local delay
delay = function(dt)
  return CCDelayTime:create(dt)
end
local scaleTo
scaleTo = function(dt, sx, sy)
  return CCScaleTo:create(dt, sx, sy or sx)
end
local fadeIn
fadeIn = function(dt)
  return CCFadeIn:create(dt)
end
local fadeOut
fadeOut = function(dt)
  return CCFadeOut:create(dt)
end
local fadeTo
fadeTo = function(dt, o)
  return CCFadeTo:create(dt, o)
end
local rotateTo
rotateTo = function(dt, ang)
  return CCRotateTo:create(dt, ang)
end
local rep
rep = function(a, n)
  n = n or -1
  if n > 0 then
    return CCRepeat:create(a, n)
  else
    return CCRepeatForever:create(a)
  end
end
local callBack
callBack = function(f)
  return CCCallFunc:create(f)
end
local helpFold
helpFold = function(aList, foldType)
  return util.foldl(aList, nil, function(seq, a)
    if seq == nil then
      return a
    else
      return foldType:createWithTwoActions(seq, a)
    end
  end)
end
local easeIn
easeIn = function(a, param)
  return CCEaseIn:create(a, param)
end
local easeOut
easeOut = function(a, param)
  return CCEaseOut:create(a, param)
end
local sequence
sequence = function(...)
  local aList = type(...) == 'table' and ... or {
    ...
  }
  return helpFold(aList, CCSequence)
end
local spawn
spawn = function(...)
  local aList = type(...) == 'table' and ... or {
    ...
  }
  return helpFold(aList, CCSpawn)
end
local seq = sequence
local rep_seq
rep_seq = function(...)
  return rep(seq(...))
end
local absTimeToRelativeTime
absTimeToRelativeTime = function(timeLines)
  for i = #timeLines, 2, -1 do
    timeLines[i] = timeLines[i] - timeLines[i - 1]
  end
  return timeLines
end
local absPosToRelativePos
absPosToRelativePos = function(poses)
  for i = #poses, 2, -1 do
    poses[i][1] = poses[i][1] - poses[i - 1][1]
    poses[i][2] = poses[i][2] - poses[i - 1][2]
  end
  return poses
end
local createTimeLineAnimations
createTimeLineAnimations = function(timeLines, params, paramProcess)
  local tp = util.zip(timeLines, params)
  return util.foldl(tp, { }, function(ls, p)
    table.insert(ls, paramProcess(p[1], p[2]))
    return ls
  end)
end
local createMoveByTimeLineAnimations
createMoveByTimeLineAnimations = function(timeLines, poses, isAbs)
  if isAbs then
    poses = absPosToRelativePos(poses)
  end
  return createTimeLineAnimations(timeLines, poses, function(t, pos)
    return act.moveBy(t, pos[1], pos[2])
  end)
end
local createScaleToTimeLineAnimations
createScaleToTimeLineAnimations = function(timeLines, scales)
  local scaleCreater
  if #scales > 0 and type(scales[1]) == 'table' then
    scaleCreater = function(t, s)
      return act.scaleTo(t, s[1], s[2])
    end
  else
    scaleCreater = function(t, s)
      return act.scaleTo(t, s)
    end
  end
  return createTimeLineAnimations(timeLines, scales, scaleCreater)
end
return {
  moveTo = moveTo,
  moveBy = moveBy,
  delay = delay,
  scaleTo = scaleTo,
  fadeIn = fadeIn,
  fadeOut = fadeOut,
  fadeTo = fadeTo,
  rep = rep,
  callBack = callBack,
  easeIn = easeIn,
  easeOut = easeOut,
  sequence = sequence,
  spawn = spawn,
  rep_seq = rep_seq,
  absTimeToRelativeTime = absTimeToRelativeTime,
  absPosToRelativePos = absPosToRelativePos,
  createTimeLineAnimations = createTimeLineAnimations,
  createMoveByTimeLineAnimations = createMoveByTimeLineAnimations,
  createScaleToTimeLineAnimations = createScaleToTimeLineAnimations
}
