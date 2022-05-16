<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<!-- 웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<!-- css -->
<link rel="stylesheet" href="../resources/css/boardList.css">

<!-- js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../resources/js/boardList.js"></script>

</head>
<body>
	<div id="wrap">
		<div class="content">
		    <h2>공지사항</h2>
			<div class="list_area">
				<ul>
					<li class="list_header">
						<div class="board_title">제목</div>
						<div class="board_writer">작성자</div>
						<div class="board_regdate">등록일</div>
						<div class="board_count">조회수</div>
					</li>
					<c:forEach items="${blist}" var="blist">
						<li class="list_content">
							<div class="board_title"><a href="/board/detail?bno=${blist.bno}">${blist.title}</a></div>
							<div class="board_writer">${blist.writer}</div>
							<div class="board_regdate">
								<fmt:parseDate value="${blist.regdate}" var="regdate" pattern="yyyymmdd"/>
								<fmt:formatDate value="${regdate}" pattern="yyyy/MM/dd"/>
							</div>
							<div class="board_count">${blist.count}</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<c:if test="${login!=null}">
				<a class="writeBtn" href="/board/write">글쓰기</a>
			</c:if>

			<div class="list_search">
				<form action="/board" id="searchForm" method="get">
					<select name="type" class="s_type">
						<option value="t" ${paging.cri.type eq 't'?'selected':''}>제목</option>
						<option value="c" ${paging.cri.type eq 'c'?'selected':''}>내용</option>
						<option value="tc" ${paging.cri.type eq 'tc'?'selected':''}>제목+내용</option>
						<option value="w" ${paging.cri.type eq 'w'?'selected':''}>작성자</option>
					</select>
						<input type="text" name="keyword" id="keyword" class="s_keyword" value="${paging.cri.keyword}">
						<input type="hidden" name="pageNum" id="pageNum" value="${paging.cri.pageNum}">			
						<input type="button" id="searchBtn" class="s_searchBtn" value="검색">
				</form>
			</div>

			<div class="list_paging">
				<c:if test="${paging.prev}">
					<a class="prev" href="/board?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.startPage-1}&amount=${paging.cri.amount}">PREV</a>
				</c:if>
				<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
					<a class="pageNo" href="${num}">${num}</a>
				</c:forEach>
				<c:if test="${paging.next}">
					<a class="next" href="/board?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">NEXT</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>