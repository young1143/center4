<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.*" %>
    <% 
    try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "sdh-23", "1234");
				
		Statement stmt = conn.createStatement();
				
		%>
		<form action="insert_shop">
		<table border="1">
			<tr>
				<td>비번호</td>
				<td><input type="number" name="saleno"></td>
			</tr>
			<tr>
				<td>상품코드</td>
				<td>
					<select name="pcode">
					<%
					String query = "INSERT INTO TBL_PRODUCT_01(PCODE, NAME, COST) VALUES('%s', '%s', %s)" ;
					
					ResultSet rs = stmt.executeQuery(String.format(query, pcode, saledate, scode, amount));
					
					while(rs.next()){
						%><option value="<%=rs.getString%>"><%=rs.getString(2) %><%				
					}
					 %>
					</select>
				</td>
			</tr>
			<tr>
				<td>판매날짜</td>
				<td><input type="date" name="saledate"></td>
			</tr>
			<tr>
				<td>매장코드</td>
				<td>
					<select name="pcode">
					<%
					String query2 = "SELECT SCODE, SNAME FROM TVL_SHOP_01";
					
					ResultSet rs2 = stmt.executeQuery(query2);
					
					while(rs.next()){
						%><option value="<%=rs.getString(1)%>"><%=rs2.getString(2) %><%				
					}
					 %>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="샵 입력하기">
			</tr>
		</table>
	</form>
	<%
	conn.commit();
	
	stmt.close();
	conn.close();
}
catch (Exception e){
	e.printStackTrace();
}

%>
	
				
				
    