<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	    <%@page import="java.sql.*" %>
	<%
	request.setCharacterEncoding("utf-1");
	String saleno = request.getParameter("saleno");
	String pcode = request.getParameter("pcode");
	String saledate = request.getParameter("saledate");
	String scode = request.getParameter("scode");
	String amount = request.getParameter("amount");
	
	try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "sdh-23", "1234");
				
				Statement stmt = conn.createStatement();
				String query = "INSERT INTO TBL_SALELIST_01(SALENO, PCODE, SALEDATE, SCODE, AMOUNT) VALUES(%s, '%s', '%s', '%s', %s)" ;
				
				ResultSet rs = stmt.executeQuery(String.format(query, saleno, pcode, saledate, scode, amount));
				
				conn.commit();
				
				stmt.close();
				conn.close();
			}
			catch (Exception e){
				e.printStackTrace();
			}
			
			%>
	
	