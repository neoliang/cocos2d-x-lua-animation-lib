
--function that wrap CCAction   


moveTo = (dt,x,y)->
  if tolua.type(x) == 'CCPoint'
    CCMoveTo\create(dt,x)
  else
    CCMoveTo\create(dt,ccp(x,y))  

moveBy = (dt,x,y)->
  if tolua.type(x) == 'CCPoint'
    CCMoveBy\create(dt,x)
  else
    CCMoveBy\create(dt,ccp(x,y))

delay = (dt)-> CCDelayTime\create(dt)

scaleTo = (dt,sx,sy)-> CCScaleTo\create(dt,sx,sy or sx)

fadeIn = (dt)-> CCFadeIn\create(dt)

fadeOut = (dt)-> CCFadeOut\create(dt)

fadeTo =( dt,o )-> CCFadeTo\create(dt,o)

rotateTo = (dt,ang)-> CCRotateTo\create(dt,ang)


rep = (a,n)->
  n = n or -1
  if n > 0
    CCRepeat\create(a,n)
  else
    CCRepeatForever\create(a)

callBack = (f)-> CCCallFunc\create(f)

helpFold = (aList,foldType)->
  return util.foldl aList,nil,(seq,a)->
    if seq == nil
      a
    else
      foldType\createWithTwoActions(seq,a)

easeIn =(a,param)-> CCEaseIn\create(a,param)
easeOut =(a,param)-> CCEaseOut\create(a,param)  


sequence =(...)->
  aList = type(...) == 'table' and ... or {...}
  return helpFold(aList,CCSequence)


spawn = (...)->
  aList = type(...) == 'table' and ... or {...}
  return helpFold(aList,CCSpawn)

seq = sequence
rep_seq = (...)-> rep(seq(...))

absTimeToRelativeTime = (timeLines)->
  for i = #timeLines,2,-1 do
    timeLines[i] = timeLines[i] - timeLines[i-1]
  return timeLines

absPosToRelativePos = (poses)->
  for i = #poses,2,-1 do
    poses[i][1] = poses[i][1] - poses[i-1][1]
    poses[i][2] = poses[i][2] - poses[i-1][2]
  return poses

createTimeLineAnimations = (timeLines,params,paramProcess)->
  tp = util.zip(timeLines,params)
  util.foldl tp,{},(ls,p)-> 
    table.insert(ls,paramProcess(p[1],p[2]))
    return ls
createMoveByTimeLineAnimations =(timeLines,poses,isAbs)->
  if isAbs 
    poses = absPosToRelativePos(poses)
  return createTimeLineAnimations timeLines,poses,(t,pos)->
    act.moveBy t,pos[1],pos[2]

createScaleToTimeLineAnimations =(timeLines,scales)->
  scaleCreater =if #scales > 0 and type(scales[1]) == 'table'
    (t,s)-> act.scaleTo(t,s[1],s[2])
  else
    (t,s)-> act.scaleTo(t,s)  
  return createTimeLineAnimations timeLines,scales,scaleCreater

{
  :moveTo
  :moveBy
  :delay
  :scaleTo
  :fadeIn
  :fadeOut
  :fadeTo
  :rep
  :callBack
  :easeIn
  :easeOut
  :sequence
  :spawn
  :rep_seq
  :absTimeToRelativeTime
  :absPosToRelativePos
  :createTimeLineAnimations
  :createMoveByTimeLineAnimations
  :createScaleToTimeLineAnimations
}