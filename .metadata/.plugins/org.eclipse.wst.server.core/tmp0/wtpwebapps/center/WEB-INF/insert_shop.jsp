<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    String scode = request.getParameter("scode");
    String shop_name = request.getParameter("shop_name");
    
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "sdh-23", "1234");
				
				Statement stmt = conn.createStatement();
				String query = "INSERT INTO TBL_SHOP_01(SCODE,SNAME) VALUES('%s', '%s')" ;
				
				ResultSet rs = stmt.executeQuery(String.format(query, scode, shop_name));
				
				conn.commit();
				
				stmt.close();
				conn.close();
			}
			catch (Exception e){
				e.printStackTrace();
			}
			
			%>