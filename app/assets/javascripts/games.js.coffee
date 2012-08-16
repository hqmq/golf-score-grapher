# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('#filedrop').filedrop
		url: "/games.json"
		paramname: "file"
		allowedfiletypes: ['text/csv']
		maxfiles: 1
		maxfilesize: 1
		uploadFinished: (i, file, response, time)-> 
			console.log(response)
			