
util = require 'moon/util'

describe "isItemInList",->
	it "item in",->
		assert.are.equal(util.isItemInList({1,2,3,4},3),true)
		assert.are.equal(util.isItemInList({5,9,8,10},9),true)