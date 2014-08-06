Sequence = require 'sequence' # this doesn't work

doSequence = ->
		
	finished = (args) =>
		console.log 'finished', args

	Sequence([
		[first,['var1']],
		[second,['var2','returnVar1']],
		[third,['returnVar2','var3']]
		],
			'var1':true
			'var2':'dogs'
			'var3':1
		,
		finished
	)

first = (arg1, callback) ->
	#do stuff
	callback [{key:'returnVar1',value:'circus animals'}]

second = (arg1, arg2, callback) ->
	#do more stuff.. maybe even async stuff
	callback [
		{key:'returnVar2',value:'chaos'},
		{key:'returnVar3',value:'everywhere'}
	]

third = (arg1, arg2, callback) ->
	#we got so much stuff we can do
	callback [{key:'dogs',value:true}]
	