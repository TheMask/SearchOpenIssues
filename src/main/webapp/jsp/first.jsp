<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="org.eclipse.egit.github.core.Issue" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Open Issues</title>
 <link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.0.min.js" ></script>
<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js" ></script>
<script src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js" ></script>
<script>
$(document).ready(function() {
    $('#table1').DataTable();
    $('#table2').DataTable();
    $('#table3').DataTable();
} );

</script>

<style type="text/css">
 
 table
 {
 width: inherit;
 }
 
 .panel
 {
 left:680px;
 padding-top:20px;
 width: 800px;
 }
 </style>
</head>
<body >
<center>

<%
LinkedHashSet<Issue> firstList=((LinkedHashSet<Issue>)session.getAttribute("firstList"));
LinkedHashSet<Issue> secondList=((LinkedHashSet<Issue>)session.getAttribute("secondList"));
LinkedHashSet<Issue> thirdList=((LinkedHashSet<Issue>)session.getAttribute("thirdList"));

%>

<div class="panel panel-default">
  <div class="panel-heading">
    <h1 class="h1">Issues opened in the last 24 hours</h1>
  </div>
  <div class="panel-body">
   	
		<table id="table1" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
		 <thead>
		 <tr>
		<th>
		Title	
		</th>
		<th>
		Created at
		</th>
		
		</tr>
		</thead>
		
		<tbody>
		<% 
		
		for(Issue issue : firstList) { %>
		<tr>
		<td>
		<% 
		out.write(issue.getTitle()); 
		%>
		</td>
		<td>
		<% 
		
		out.write(issue.getCreatedAt().toString()); } 
		%>
		</td>
		</tr>
		</tbody>
		
		</table>
  </div>
</div>


<div class="panel panel-default">
  <div class="panel-heading">
    <h1 class="h1">Issues  opened more than 24 hours ago but less than 7 days ago</h1>
  </div>
  <div class="panel-body">
   	
		<table id="table2" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
		 <thead>
		 <tr>
		<th>
		Title	
		</th>
		<th>
		Created at
		</th>
		
		</tr>
		</thead>
		
		<tbody>
		<% 
		
		for(Issue issue : secondList) { %>
		<tr>
		<td>
		<% 
		out.write(issue.getTitle()); 
		%>
		</td>
		<td>
		<% 
		
		out.write(issue.getCreatedAt().toString()); } 
		%>
		</td>
		</tr>
		</tbody>
		
		</table>
  </div>
</div>


<div class="panel panel-default">
  <div class="panel-heading">
    <h1 class="h1">Issues opened more than 7 days ago </h1>
  </div>
  <div class="panel-body">
   	
		<table id="table3" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
		 <thead>
		 <tr>
		<th>
		Title	
		</th>
		<th>
		Created at
		</th>
		
		</tr>
		</thead>
		
		<tbody>
		<% 
		
		for(Issue issue : thirdList) { %>
		<tr>
		<td>
		<% 
		out.write(issue.getTitle()); 
		%>
		</td>
		<td>
		<% 
		
		out.write(issue.getCreatedAt().toString()); } 
		%>
		</td>
		</tr>
		</tbody>
		
		</table>
  </div>
</div>

</center>
</body>


</html>