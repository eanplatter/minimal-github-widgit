githubUsername = "eanplatter"
rotate = 0

command: "curl -s https://github.com/users/#{githubUsername}/contributions"

refreshFrequency: (1 * 60 * 60 * 1000) # 1 hour

style: """
.contributions
	position: absolute
	top: 35px
	transform: rotate(#{rotate}deg)
	font-size: 0px
"""

render: (output) -> """
	<div class="contributions"></div>
"""

afterRender: (widget) ->
  # this is a bit of a hack until jQuery UI is included natively
  $.ajax({
    url: "https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js",
    cache: true,
    dataType: "script",
    success: ->
      $(widget).draggable()
      return
  })

update: (output) ->
	contributionData = $($.parseHTML(output))
	$('.contributions').html(contributionData)
