<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
	<h2>판매등록</h2>
	<form action = "/cafe/action/action.jsp" name = "action_form">
		<table border = "1">
			<tr>
				<td>비번호</td>
				<td><input type = "text" name = "saleno"></td>
			</tr>
		<tr>
			<td>상품코드</td>
			<td><select name = "pcode">
			<option value = "0">상품선택</option>
			<%
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT PCODE, NAME FROM TBL_PRODUCT_01");
				
				while(rs.next()){
					%>
					<option value = "<%=rs.getString(1) %>"><%=String.format("[%s] %s", rs.getString(1), rs.getString(2)) %>
					<%
					
				}
				stmt.close();
				conn.close();
			}
			catch (Exception e){
				e.printStackTrace();
			}
			
			%>
			</select>	
			</td></tr>
			
			<tr>
				<td>판매날짜</td>
				<td><input type = "date" name = "sale_date"></td>
			</tr>
			
			<tr>
				<td>매장코드</td>
				<td><input type = "text" name = "scode"></td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type = "text" name = "amount"></td>
			</tr>
			<tr>
				<td colspan = "2">
				<input type = "button" value = "전표 등록" onclick = "submit_form()">
				<input type = "button" value = "다시 쓰기" onclick="reset_form()"></td>
			</tr>
		</table>
	<script>
		function submit_form(){
			if (document.action_form.saleno.value === ""){
				alert("매출전표번호가 입력되지 않았습니다!");
				document.action_form.saleno.focus();
				return;
			}
			if (document.action_form.scode.value === ""){
				alert("지점코드가 입력되지 않았습니다!");
				document.action_form.scode.focus();
				return;
			}
			if (document.action_form.sale_date.value === ""){
				alert("판매일자가 입력되지 않았습니다!");
				document.action_form.sale_date.focus();
				return;
			}
			if (document.action_form.pcode.selectedIndex === 0){
				alert("피자코드가 입력되지 않았습니다!");
				return;
			}
			if (document.action_form.amount.value === ""){
				alert("지점코드가 입력되지 않았습니다!");
				document.action_form.amount.focus()
				return;
			}
			alert("매출전표가 정상적으로 등록되었습니다.");
			document.action_form.submit();
		}
		function reset_form(){
		
			document.action_form.reset();
	}
</script>
