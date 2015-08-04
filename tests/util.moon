
util = require 'moon/util'

describe "isItemInList",->
	it "item in",->
		assert.are.equal(util.isItemInList({1,2,3,4},3),true)
		assert.are.equal(util.isItemInList({5,9,8,10},9),true)
	it "item not in",->
		assert.is_not_true util.isItemInList({1,2,3,4},5)
		assert.is_not_true util.isItemInList {}, 0

describe "map,foldl,zip,filter",->
	it "map",->
		assert.are.same util.map( {1,2,3,4},(x)->2*x ) , {2,4,6,8}
	it "foldl sum",->
		sum  = (ls)-> util.foldl ls,0,(acc,l)->l+acc
		assert.are.equal sum([i for i = 1,100]), (1+100)*50
	it "foldl product",->	
		product = (ls)-> util.foldl ls,1,(acc,l)->l*acc
		ls2product = [i for i = 1,10]
		r = 1
		for i,v in ipairs(ls2product)
			r *= v
		assert.are.equal product(ls2product),r
	it "foldl empty list",->
		assert.are.equal util.foldl({},0,(acc,l)-> acc),0
	it "zip",->
		ls1 = {1,7,3,4,5}
		ls2 = {"a","hello","world"}
		ls = util.zip ls1,ls2
		assert.are.same ls ,{{1,"a"},{7,"hello"},{3,"world"}}
	it "zip empty",->
		assert.are.same util.zip({},{1,2,3}),{}
	it "filter odd",->
		isOdd =(x) -> x % 2 == 1
		nums = [i for i = 1,100]
		odds = [i for i = 1,100 when isOdd i ]
		assert.are.same util.filter(nums,isOdd),odds
	it "filter empty",->
		assert.are.same util.filter({1,2,3,5},(n)->false),{}
describle,"randomItemInList",->
	it "null test",->
		assert.is_nil util.randomItemInList {}
	it "random",->
		ls = [i for i = 1,50 when i % 2 == 0]
		assert.is_true util.isItemInList ls, util.randomItemInList ls

