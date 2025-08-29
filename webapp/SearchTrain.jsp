<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Train</title>
<link rel="stylesheet" href="styles/searchtrain.css">
</head>
<body>
<br><br><br><br>
    
    <h1>Search Train</h1>
   <table border=2>
      <tr>
        <th>Train No</th>
        <th>Train Name</th>
        <th>Train From</th>
        <th>Train To</th>
        <th>MaxSeats</th>
        <th>Train Description</th>
        <th>Options</th>
     </tr>
     <%@page import="java.sql.*"%>
     <%@page import="com.train.DBConnect" %>
     <%try
     {
         Connection con=DBConnect.getConnection();
         Statement state=con.createStatement();
         String sql="select*from train1";
         ResultSet rs=state.executeQuery(sql);
         while(rs.next())
         {
        	
         %>
         <c:set var="trainNo" value="<%= rs.getString(\"TrainNo\") %>"></c:set>
         <c:set var="trainName" value="<%= rs.getString(\"TrainName\") %>"></c:set>
         <c:set var="trainFrom" value="<%= rs.getString(\"TrainFrom\") %>"></c:set>
         <c:set var="trainTo" value="<%= rs.getString(\"TrainTo\") %>"></c:set>
         <c:set var="trainSeats" value="<%= rs.getString(\"TrainSeats\") %>"></c:set>
         <c:set var="trainDescription" value="<%= rs.getString(\"TrainDescription\") %>"></c:set>
         
         <tr>
         <td><c:out value="${trainNo}"></c:out></td>
         <td><c:out value="${trainName}"></c:out></td>
         <td><c:out value="${trainFrom}"></c:out></td>
         <td><c:out value="${trainTo}"></c:out></td>
         <td><c:out value="${trainSeats}"></c:out></td>
         <td><c:out value="${trainDescription}"></c:out></td>
         
         
         <c:url value="UpdateTrain.jsp" var="trainupdate">
         <c:param name="TrainNo" value="${trainNo}"></c:param>
         <c:param name="TrainName" value="${trainName}"></c:param>
         <c:param name="TrainFrom" value="${trainFrom}"></c:param>
         <c:param name="TrainTo" value="${trainTo}"></c:param>
         <c:param name="TrainSeats" value="${trainSeats}"></c:param>
         <c:param name="TrainDescription" value="${trainDescription}"></c:param>
         </c:url>
   
         <td><a href="booking.jsp"><input type="button" name="Booking" value="Booking" id="button1"></a>
         
         <c:url value="DeleteTrain.jsp" var="deletetrain">
         <c:param name="TrainNo" value="${trainNo}"></c:param>
         <c:param name="TrainName" value="${trainName}"></c:param>
         <c:param name="TrainFrom" value="${trainFrom}"></c:param>
         <c:param name="TrainTo" value="${trainTo}"></c:param>
         <c:param name="TrainSeats" value="${trainSeats}"></c:param>
         <c:param name="TrainDescription" value="${trainDescription}"></c:param>
         </c:url>
         
         </tr>
        <%  }
         }catch(Exception e1)
         {
         }%>
         
   </table>
   
   <footer>
   <%@ include file="footer.jsp" %>
   </footer>

</body>
</html>