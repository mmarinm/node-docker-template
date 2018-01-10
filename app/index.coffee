require '../load'
app = require('./expressConfig')(require('express')())

## ==========================================================================
## Router
## ========================================================================== 

app.use require './router'

app.get '/', (req, res)->
  res.status(200).send('alive')


app.use (req, res, next)->
	res.status(404)
	switch
		when req.accepts('json')
			res.send(error:'Not found')
		else
			res.type('text').send('Not found')


app.use (err, req, res, next)->
	unless res.headersSent
		console.error(err.stack)
		res.status(500).send(err.message.replace /^.*?Error: /,'').end()

## ==========================================================================
## Server init
## ========================================================================== 

server = app.listen 80, ()-> console.log 'listening on port 80'

app.server = server



module.exports = app