<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
	<h2>상품별판매액</h2>
	<table border = "1">
		<tr>
			<td>매장코드</td>
			<td>매장명</td>
			<td>매장별 판매액</td>
		</tr>
		<%
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				
				
				Statement stmt = conn.createStatement();
				
				String query = "SELECT CAFE.PCODE, CAFE.NAME, SUM(SALELIST.AMOUNT * CAFE.COST) FROM TBL_SALELIST_01 SALELIST, TBL_PRODUCT_01 CAFE WHERE SALELIST.PCODE = CAFE.PCODE GROUP BY CAFE.PCODE, CAFE.NAME ORDER BY SUM(SALELIST.AMOUNT * CAFE.COST) DESC";
				ResultSet rs = stmt.executeQuery(query);
				
				while (rs.next()) {
					%>	
					<tr>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
					</tr>
					<%
				}
				stmt.close();
				conn.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
