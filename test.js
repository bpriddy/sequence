var Sequence = (sequenceArray, options, finished) {
	var varArray = options || {};
	var applyArgs = function(args) {
		for(var i=0;i<args.length;i++) {
			varArray[sequenceArray[0].o[i]] = args[i]
		}
	}

	var prepArgs = function(args) {
		prepped = []
		for(key of args) {
			if(varArray[key]) {
				prepped[key] = varArray[key]
			} else {
				prepped[key] = null
			}
		}
		return prepped
	}

	var callback = function(returnArgs) {
		applyArgs(returnArgs)
		sequenceArray.shift()
		if(sequenceArray.length) {
			run()
		} else {
			finished.apply(varArray)
		}
	}

	var run =  function() {
		args = prepArgs(sequenceArray[0].i)
		args.push(callback)
		sequenceArray[0].fn.apply(this,args)
	}

	run()
}
