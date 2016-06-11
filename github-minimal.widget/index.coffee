githubUsername = "eanplatter"
username: githubUsername
rotate = 0
command: "curl -s https://github.com/users/#{githubUsername}/contributions"

refreshFrequency: 3600000 # 1 hour

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
	$(widget).draggable()

update: (output) ->
	contributionData = $($.parseHTML(output))
	$('.contributions').html(contributionData)
