<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<%
	response.setHeader("Content-Disposition", "attachment; filename=apply.xls");
	response.setHeader("Content-Description", "JSP Generated Data");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta charset="UTF-8">
<title>목록</title>

<link href="/css/common.css" rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
	<!--
		body:{
			font-size : 12px;
			margin-left : 0px;
			font-family : 돋움;
		}
	-->
</style>

</head>
<body>

	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>신청자명</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>신청일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td class="num"><c:out value="${fn:length(resultList) - (status.index)}"></c:out></td>
					<td><c:out value="${result.chargerNm}" />
						(<c:out value="${result.frstRegisterId}" />)
					</td>
					<td><c:out value="${result.telno}" /></td>
					<td><c:out value="${result.email}" /></td>
					<td><fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="5">
						신청자가 없습니다.
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>

</body>
</html>