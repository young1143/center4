<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<form action="insert_product.jsp">
		<table border="1">
			<tr>
				<td>상품코드</td>
				<td><input type="text" name="pcode"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="pname"></td>
			</tr>
			<tr>
				<td>금액</td>
				<td><input type="number" name="cost"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="상품 입력하기">
				</td>
			</tr>
		</table>
	</form>