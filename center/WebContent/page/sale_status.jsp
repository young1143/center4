<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
	<h2>�Ǹ���Ȳ</h2>
	<table border = "1">
	<tr>
		<td>���ȣ</td>
		<td>��ǰ�ڵ�</td>
		<td>�Ǹų�¥</td>
		<td>�����ڵ�</td>
		<td>��ǰ��</td>
		<td>�Ǹż���</td>
		<td>���Ǹž�</td>
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
						out.print("�Ƹ޸�ī��");
					}
					else if(rs.getString(4).equals("AA02")){
						out.print("����������");
					}
					else if(rs.getString(4).equals("AA03")){
						out.print("ī���");
					}
					else if(rs.getString(4).equals("AA04")){
						out.print("ī��Ḷ��");
					}
					else if(rs.getString(4).equals("AA05")){
						out.print("īǪġ��");
					}
					else if(rs.getString(4).equals("AA06")){
						out.print("���ڷ�����");
					}
					else if(rs.getString(4).equals("AA07")){
						out.print("����������");
					}
					else if(rs.getString(4).equals("AA08")){
						out.print("�����꽺");
					}
					else if(rs.getString(4).equals("AA09")){
						out.print("������");
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
