# prettyError = require('pretty-error').start().skipNodeFiles().skipPackage('bluebird','coffee-script','express')
global.ENV = process.env
global.ROOT = __dirname
# global.DEBUG = "#{ROOT}/debug.coffee"
require './sugar'
require('mountenv').load()

global.Promise = require 'bluebird'; Promise.config warnings:false, longStackTraces:ENV.DEBUG

console.error = do ()->
	orig = console.error
	return (err)->
		if arguments.length is 1 and err instanceof Error
			unless err._logged
				orig(err); err._logged = true
		else
			orig.apply(console, arguments)

# require('bugsnag').register(ENV.BUGSNAG_KEY)
# require('console-stamp')(console, 'mm-dd HH:MM:ss')