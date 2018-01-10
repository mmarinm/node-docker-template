express = require 'express'
express.start = (target)-> (req,res,next)-> res.startTime(target); next()
express.end = (target)-> (req,res,next)-> res.endTime(target); next()

module.exports = (app)->
	app.use require('server-timing')()
	app.use require('cors')()
	# app.use require('serve-favicon')("#{ROOT}/favicon.ico")
	# app.use express.start 'compression'
	# app.use require('compression')()
	# app.use express.end 'compression'

	app.use express.start 'body-parser'
	app.use require('body-parser').json(limit:'500mb') # Enable JSON req parsing
	app.use require('body-parser').urlencoded({extended:true, limit:'500mb'})
	app.use express.end 'body-parser'
	