<html>
 <body>
	Request: <%= request.getRequestURI() %><br>
	#Protocol: <%= request.getProtocol() %><br>
	Protocol: <%= request.getHeader("x-server-proto") %><br> %><br>
	<h4>Remote</h4>
	Host: <%= request.getRemoteHost() %><br>
	Address: <%= request.getRemoteAddr() %><br>
	Scheme: <%= request.getScheme() %><br>
 </body>
</html>