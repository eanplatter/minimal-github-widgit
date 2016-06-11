# Replace with your username here.
uname = "eanplatter"
username: uname
rotate = 0
command: "curl -s https://github.com/users/#{uname}/contributions"

refreshFrequency: 3600000 # 1 hour

style: """
.container
	position: absolute
	top: 35px
	opacity:0.9
.calendar-graph
	transform: rotate(#{rotate}deg)
	background-color: transparent
	font-size: 0px
"""

render: (output) -> """
<div class="container">
	<div class="calendar-graph"></div>
</div>
"""
afterRender: (widget) ->
	$(widget).draggable()
update: (output, domEl) ->
	calendar = $($.parseHTML(output))
	$(domEl)
		.find('.calendar-graph')
		.html(calendar)
