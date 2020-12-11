<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
	<h2>판매현황</h2>
	<table border = "1">
	<tr>
		<td>비번호</td>
		<td>상품코드</td>
		<td>판매날짜</td>
		<td>매장코드</td>
		<td>상품명</td>
		<td>판매수량</td>
		<td>총판매액</td>
	</tr>
	<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			
			Statement stmt = conn.createStatement();
			
			String query = "SELECT SALELIST.SALENO, SHOP.SCODE, SALELIST.SALEDATE, CAFE.PCODE, SALELIST.AMOUNT, CAFE.COST * SALELIST.AMOUNT AS TOTAL_COST FROM TBL_SALELIST_01 SALELIST, TBL_SHOP_01 SHOP, TBL_PRODUCT_01 CAFE WHERE SALELIST.SCODE = SHOP.SCODE AND SALELIST.PCODE = CAFE.PCODE ORDER BY SALELIST.SALENO";
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				%>	
			<tr>
				<td><%= rs.getString(1)%></td>
				<td><%= rs.getString(4)%></td>
				<td><%= rs.getString(3)%></td>
				<td><%= rs.getString(2)%></td>
			    <td><%= rs.getString(4)%>
					<%
					if(rs.getString(4).equals("AA01")){
						out.print("아메리카노");
					}
					else if(rs.getString(4).equals("AA02")){
						out.print("에스프레소");
					}
					else if(rs.getString(4).equals("AA03")){
						out.print("카페라떼");
					}
					else if(rs.getString(4).equals("AA04")){
						out.print("카라멜마끼");
					}
					else if(rs.getString(4).equals("AA05")){
						out.print("카푸치노");
					}
					else if(rs.getString(4).equals("AA06")){
						out.print("초코롤케익");
					}
					else if(rs.getString(4).equals("AA07")){
						out.print("녹차롤케익");
					}
					else if(rs.getString(4).equals("AA08")){
						out.print("망고쥬스");
					}
					else if(rs.getString(4).equals("AA09")){
						out.print("핫초코");
					}
					else{
						out.print("aaaa");
					}
					%>
				</td>
				<td><%= rs.getString(5)%></td>
				<td>
					<% out.print("\\");%>
					<%= rs.getString(6)%>
				</td>
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
