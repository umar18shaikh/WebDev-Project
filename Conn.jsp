<%@page import="javax.servlet.*,java.sql.*,java.io.*,javax.sql.*" %>
<html>
<head>
<title>
Validation Page
</title>
</head>
<body class="body1">
	 <% 
	 try
	 { 
	 	Class.forName("com.mysql.jdbc.Driver");
	 	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/demo","root","umar");
	 	Statement st=con.createStatement();
	 	String username=request.getParameter("username");
	 	String passwod=request.getParameter("passwod");
	 	ResultSet rs=st.executeQuery("select * from Users where User_name='"+username+"' and passwd='"+passwod+"'");
	 	if(rs.next())
	 	{
	     //out.println("Login Successful!");
	     response.sendRedirect("AR.html");
	 	}
	 	else
	 	{
	 	 //out.println("User not found!");
	 	 st.executeUpdate("insert into Users values('"+username+"','"+passwod+"')");
	 	 response.sendRedirect("NU.html");
	 	}
	 }
	 catch(Exception e)
	 {
	  System.out.println(e);	
	 }
	 %>	 
 </body>
 </html>