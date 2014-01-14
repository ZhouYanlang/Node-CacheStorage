class Storage


	async: false

	cache: null


	constructor: ->
		if @ !instanceof Storage	# for testing
			if typeof @getData == 'undefined' || typeof @getMeta == 'undefined' || typeof @writeData == 'undefined'
				throw new Error 'Cache storage: you have to implement methods getData, getMeta and writeData.'


	checkFilesSupport: ->
		isWindow = if typeof window == 'undefined' then false else true

		if isWindow && window.require.simq != true
			throw new Error 'Files meta information can be used in browser only with simq.'

		if isWindow
			version = window.require.version
			if typeof version == 'undefined' || parseInt(version.replace(/\./g, '')) < 510
				throw new Error 'File method information is supported only with simq@5.1.0 and later.'


module.exports = Storage
