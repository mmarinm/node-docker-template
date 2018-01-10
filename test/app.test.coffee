global.Promise = require('bluebird').config longStackTraces:false, warnings:false
expect = require('chai').expect
helpers = require './helpers'
fs = require 'fs-jetpack'
require('sugar').extend()
require('clarify-plus').filter ['bluebird', 'chai']



suite 'Init Test', ()-> 
	test 'GET /', ()->
		Promise.resolve()
			.then ()-> helpers.chai.req({target:'', method:'get',apiKey:false})
			.then (res)->
				expect(res.status).to.equal(200)
				expect(res.text).to.contain('alive')