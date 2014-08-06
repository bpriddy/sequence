module.exports = (sequenceArray, varArray, finished) =>
	applyArgs = (args) ->
		for key of args ->
			varArray[key] = args[key]

	prepArgs = (args) ->
		prepped = []
		for key of args
			prepped[key] = varArray[key] or null
		prepped

	callback = (returnArgs) =>
		sequenceArray.shift()
		applyArgs returnArgs
		if sequenceArray.length
			run()
		else
			finished.apply varArray

	run = ->
		args = prepArgs sequenceArray[0][1]
		args.push callback
		sequenceArray[0][0].apply(@,args)

	run()

