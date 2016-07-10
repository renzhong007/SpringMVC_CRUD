<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		var $del=$(".del");
		$del.click(function(){
			var $form=$("form");
			//alert(this.herf);
			$form[0].action=this.href;
			$form.submit();
			return false;
		}); 
	});
</script>
</head>
<body>
	<form:form action="" method="post">
		<input type="hidden" name="_method" value="DELETE">
	</form:form>
	<table>
		<tr>
			<td>ID</td>
			<td>姓名</td>
			<td>SSN</td>
			<td>部门</td>
			<td>编辑</td>
			<td>编辑2</td>
			<td>删除</td>
		</tr>
		<c:forEach items="${requestScope.empList }" var="emp">
			<tr>
				<td>${emp.empId}</td>
				<td>${emp.empName}</td>
				<td>${emp.ssn}</td>
				<td>${emp.department.deptName}</td>
				<td><a href="${pageContext.request.contextPath}/emp/${emp.empId }">编辑</a></td>
				<td><a href="${pageContext.request.contextPath}/emp/toEdit/${emp.empId }">编辑</a></td>
				<td><a class="del" href="${pageContext.request.contextPath}/emp/${emp.empId }">删除</a></td>
			</tr>

		</c:forEach>
	</table>
	<a href="${pageContext.request.contextPath }/emp/toAdd">添加</a>
</body>
</html>