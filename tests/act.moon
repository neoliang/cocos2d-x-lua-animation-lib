-- require 'tests/mockAction'
-- act = require 'moon/act'
-- v = act.moveTo 1.0,5,10.0
-- print v

describe "action test",->
	act = nil
	setup ()->
		require 'tests/mockAction'
		act = require 'moon/act'
	it 'moveTo x y',->
		v = act.moveTo 1.0,5,10.0
		assert.are.equal tolua.type(v) , 'CCMoveTo'
		assert.are.same v.pos, ccp(5,10.0)
		assert.are.equal v.dt , 1.0
	it 'moveTo ccp',->
		v = act.moveTo 5.5,ccp(2.0,3.3)
		assert.are.equal tolua.type(v), 'CCMoveTo'
		assert.are.same v.pos ,ccp(2.0,3.3)
		assert.are.equal v.dt,5.5
	it 'moveBy x y',->
		v = act.moveBy 1.0,5,10.0
		assert.are.equal tolua.type(v) , 'CCMoveBy'
		assert.are.same v.pos, ccp(5,10.0)
		assert.are.equal v.dt , 1.0
	it 'moveBy ccp',->
		v = act.moveBy 5.5,ccp(2.0,3.3)
		assert.are.equal tolua.type(v), 'CCMoveBy'
		assert.are.same v.pos ,ccp(2.0,3.3)
		assert.are.equal v.dt,5.5
	it 'delay',->
		v = act.delay 0.5
		assert.are.equal tolua.type(v),'CCDelayTime'
		assert.are.equal 0.5,v.dt		