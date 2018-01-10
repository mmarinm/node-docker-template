module.exports = apps: [
	name: "renderer"
	instances: 1
	restart_delay: 1000
	exec_mode: 'cluster'
	script: "./index.js"
	watch: ['app/']
	error_file: "./logs/error.log"
	out_file: "./logs/logs.log"
	min_uptime: 3000
	ignore_watch: [
		"node_modules/**"
		"**/node_modules/**"
		"*.log"
		"package.json"
		"generalLogs/*"
		"*.sublime-*"
		".git/**"
	]
]