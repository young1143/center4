<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
	<h2>�Ǹŵ��</h2>
	<form action = "/cafe/action/action.jsp" name = "action_form">
		<table border = "1">
			<tr>
				<td>���ȣ</td>
				<td><input type = "text" name = "saleno"></td>
			</tr>
		<tr>
			<td>��ǰ�ڵ�</td>
			<td><select name = "pcode">
			<option value = "0">��ǰ����</option>
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
				<td>�Ǹų�¥</td>
				<td><input type = "date" name = "sale_date"></td>
			</tr>
			
			<tr>
				<td>�����ڵ�</td>
				<td><input type = "text" name = "scode"></td>
			</tr>
			<tr>
				<td>�Ǹż���</td>
				<td><input type = "text" name = "amount"></td>
			</tr>
			<tr>
				<td colspan = "2">
				<input type = "button" value = "��ǥ ���" onclick = "submit_form()">
				<input type = "button" value = "�ٽ� ����" onclick="reset_form()"></td>
			</tr>
		</table>
	<script>
		function submit_form(){
			if (document.action_form.saleno.value === ""){
				alert("������ǥ��ȣ�� �Էµ��� �ʾҽ��ϴ�!");
				document.action_form.saleno.focus();
				return;
			}
			if (document.action_form.scode.value === ""){
				alert("�����ڵ尡 �Էµ��� �ʾҽ��ϴ�!");
				document.action_form.scode.focus();
				return;
			}
			if (document.action_form.sale_date.value === ""){
				alert("�Ǹ����ڰ� �Էµ��� �ʾҽ��ϴ�!");
				document.action_form.sale_date.focus();
				return;
			}
			if (document.action_form.pcode.selectedIndex === 0){
				alert("�����ڵ尡 �Էµ��� �ʾҽ��ϴ�!");
				return;
			}
			if (document.action_form.amount.value === ""){
				alert("�����ڵ尡 �Էµ��� �ʾҽ��ϴ�!");
				document.action_form.amount.focus()
				return;
			}
			alert("������ǥ�� ���������� ��ϵǾ����ϴ�.");
			document.action_form.submit();
		}
		function reset_form(){
		
			document.action_form.reset();
	}
</script>
