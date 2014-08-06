module.exports = (sequenceArray, varArray, finished) =>
	applyArgs = (args) ->
		_.each args, (item) ->
			varArray[item.key] = item.value

	prepArgs = (args) ->
		prepped = _.map args, (item) ->
			return varArray[item] or null

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

