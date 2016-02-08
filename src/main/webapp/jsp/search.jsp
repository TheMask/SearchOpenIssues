<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Input Path Page</title>
 <link href="css/bootstrap.min.css" rel="stylesheet">
 <style type="text/css">
 #mainDiv
 {
 	position:fixed;
 	top:35%;
 	left:35%;
 	width:600px;
 }
  
 </style>
</head>
<body>

<div id="mainDiv" class="panel panel-default">
  <div class="panel-heading">
    <h2 class="h2">Enter Git Repository path</h2>
  </div>
  <div class="panel-body">
		  <form action="output">
			  <div class="form-group" >
			    <label for="path">Path:</label>
			    <input type="text" class="form-control" name="path" id="path" placeholder="For Example:http://github.com/Shippable/support/issues">
			  </div>
			  <button type="submit" class="btn btn-success">Submit</button>
		  </form> 		
  </div>
</div>

</body>
</html>