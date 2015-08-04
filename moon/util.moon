
--utility function

map = (ls,f)->
	tls = {}
	for _,l in ipairs(ls)
		table.insert(tls,f(l))
	tls

foldl = (ls,initv,acc)->
	for _,l in ipairs(ls)
		initv = acc(init,l)
	initv

zip = (ls1,ls2)->
	len = math.min(#ls1,#ls2)
	r = {}
	for i=1,len
		table.insert(r,{ls1[i],ls2[i]})
	r

filter = (ls,f)->
	r = {}
	for _,l in ipairs(ls)
		if f l
			table.insert(r,l)
	r

isItemInList = (ls,item)->
	for _,l in ipairs(ls)
		if l == item
			return true
	false

randomItemInList = (ls)->
	if ls == nil or #ls == 0
		nil
	else
		ls[math.random(1,#ls)]

{
	:map
	:foldl
	:zip
	:isItemInList
	:filter
	:randomItemInList
}