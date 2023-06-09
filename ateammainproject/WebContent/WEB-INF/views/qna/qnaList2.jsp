<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/qna-bt.css">
<!-- Content영역 -->
<div class="container">
	<div class="row">
		<header>
			<h1>Q&A List</h1>
		</header>
		
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="e" items="${list }">
						<tr>
							<td class="align-middle text-center">
								${e.no }</td>
							<td class="align-middle text-center">
							<a href="qadetail?no=${e.no}">${e.subject }</a>[${e.cnt}]</td>
							<td class="align-middle text-center">${e.writer }</td>
							<td class="align-middle text-center">${e.mdate }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan=4">
								<form class="d-flex" method="post" action="qalist">
						<input type="hidden" name="cPage" value="1">
							<div
								class="row g-3 align-middle text-center; justify-content-md-center">
								<div class="col-auto">
									<select class="form-select" name="searchType" id="searchType"
										aria-label="Default select example">
										<option selected value="3">검색</option>
										<option value="1">작성자</option>
										<option value="2">제목</option>
									</select>
								</div>
								<div class="col-auto">
									<label for="searchValue" class="visually-hidden">Password</label>
									<input type="text" class="form-control" id="searchValue"
										name="searchValue" placeholder="검색할 문구를 작성하세요"
										style="font-size: 15px; width: 250px;">
								</div>
								<div class="col-auto">
								
									<button type="submit" class="btn btn-primary mb-3">Search</button>
								</div>
							</div>
									</form>
						</td>
					</tr>
					<tr>
						<td colspan="6">
						<%@include file="../page/pageModule.jsp" %>
						</td>
					</tr>


					<tr>
						<c:choose>
							<c:when test="${sessionScope.sessionID != null }">
								<td colspan=4 " style="text-align: center"><a
									href="${pageContext.request.contextPath}/qaboard/qaform"><input
										type="button" value="글작성" id="wbtn" class="button-l"></a>
								</td>
							</c:when>
						</c:choose>
					</tr>

				</tfoot>
			</table>
		
	</div>
</div>

