# cocos2d-x-lua-animation-lib
a lua lib that wrap animation

# usage
copy files in directory lua to the lua directory of your cocos2d-x project
warnning: this rep only compatible  with cocos2d-x 2.x

#code 
```lua

local act = require "act.lua"

--move node to pos(5.0,6.0) in 1.0 s, mvt and mvt1 are same
local mvt = act.moveTo(1.0,ccp(5.0,6.0))
local mvt1 = act.moveTo(1.0,5.0,6.0)


local jump = act.seq(
                      act.moveBy(0.5,0,5),
                      act.moveBy(0.5,0,-5)
                    )
--jump by 5 in y direction in 1

local repeatlyJum = act.rep(jump)
-- repeate jump


```
