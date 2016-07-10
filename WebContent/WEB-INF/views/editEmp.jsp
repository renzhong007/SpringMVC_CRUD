<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="${pageContext.request.contextPath }/emp" 
				method="post"
				modelAttribute="emp">
		<!-- <input type="hidden" name="_method" value="PUT"/> -->
		<input type="hidden" name="_method" value="PUT"/>
		<form:hidden path="empId"/>
		姓名:<form:input path="empName"/><br>
		SSN:<form:input path="ssn"/><br>
		
		部门:<form:select path="department.deptId" 
										items="${requestScope.deptList }" 
										itemValue="deptId"
										itemLabel="deptName"/> 
									<br>
		<input type="submit" value="修改">
	</form:form>
</body>
</html>