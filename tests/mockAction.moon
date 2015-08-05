

createAction = (dt,type)->
	{
		dt:dt,
		type:type
	}


export tolua = {}

tolua.type = (t)->
	if (type t) == 'table' 
		t.type
	else
		type t

export ccp = (x,y)->
	{
		x: x,
		y: y,
		type:'CCPoint'
	}


export CCRepeatForever = {}
CCRepeatForever.create = (self,a)->
	{
		type:'CCRepeatForever',
		action: a
	}
	
export CCCallFunc = {}
CCCallFunc.create = (self,f)->
	{
		type:'CCCallFunc',
		fun:f
	}

export CCEaseIn = {}
CCEaseIn.create = (self,a,param)->
	{
		type:'CCEaseIn'
		action:a,
		param:param
	}

export CCEaseOut = {}
CCEaseOut.create = (self,a,param)->
	{
		type:'CCEaseOut'
		action:a,
		param:param
	}

export CCSequence = {}
CCSequence.createWithTwoActions =(self,a1,a2)->
	{
		type:'CCSequence',
		action1:a1,
		action2:a2
	}

export CCSpawn = {}
CCSpawn.createWithTwoActions = (self,a1,a2)->
	{
		type:'CCSpawn',
		action1:a1,
		action2:a2
	}	

export CCFadeOut = {}
CCFadeOut.create =(self,dt)->createAction dt ,'CCFadeOut' 

export CCFadeTo = {}
CCFadeTo.create = (self,dt)->createAction dt,'CCFadeTo'

export CCRotateTo = {}
CCRotateTo.create = (self,dt,ang)->
	r = createAction dt,'CCRotateTo'
	r.ang = ang
	r
export CCRepeat = {}
CCRepeat.create = (self,a,n)->
	{
		type:'CCRepeat',
		action:a,
		times:n
	}
 
export CCMoveTo = {}
CCMoveTo.create = (self,dt,x,y)->
	result = createAction dt,'CCMoveTo'
	if tolua.type(x) == 'CCPoint'
		result.pos = x
	else
		result.pos = ccp(x,y)
	result

export CCMoveBy = {}

CCMoveBy.create = (self,dt,x,y)->
	result = createAction dt,'CCMoveBy'
	if tolua.type(x) == 'CCPoint'
		result.pos = x
	else
		result.pos = ccp(x,y)
	result	

export CCDelayTime = {}
CCDelayTime.create = (self,dt)-> createAction dt,'CCDelayTime'

export CCScaleTo = {}
CCScaleTo.create = (self,dt,sx,sy)->
	result = createAction dt,'CCScaleTo'
	result.scale = ccp(sx,sy)
	result

export CCFadeIn = {}
CCFadeIn.create = (self,dt)-> createAction(dt,'CCFadeIn')