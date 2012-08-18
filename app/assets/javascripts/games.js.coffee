$ ->
	$('#filedrop').filedrop
		url: "/games.json"
		paramname: "file"
		allowedfiletypes: ['text/csv']
		maxfiles: 1
		maxfilesize: 1
		uploadFinished: (i, file, response, time)-> 
			d = $('<div class="alert" data-dismiss="alert" />')
			if response.id
				d.addClass('alert-success')
				d.text('Created')
				window.location.reload()
			else
				d.addClass('alert-error')
				errors = for property, errors of response
					"#{property} - #{errors}"
				d.html( errors.join("<br />") )
			$('body').prepend( d )
		error: (err,file)->
			#blah
			