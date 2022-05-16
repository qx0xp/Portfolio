<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>작성글 수정</title>

<!-- 웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<!-- css -->
<link rel="stylesheet" href="../../resources/css/boardWrite.css">

<!-- js -->
<script src="../../resources/js/jquery.js"></script>
<script src="../../resources/js/attachFile.js"></script>
</head>
<body>
    <div class="main">
        <h2>작성글 수정</h2>
        <form action="/board/modify" method="post" class="mainForm">
            <table>
                <tr><td>
                    <select name="category">
                        <option>게시판을 선택하세요</option>
                        <option value="공지사항" selected>공지사항</option>
                        <option value="영화소식">영화소식</option>
                        <option value="영화리뷰">영화리뷰</option>
                        <option value="영화수다">영화수다</option>
                        <option value="자유수다">자유수다</option>
                        <option value="창작">창작</option>
                        <option value="나눔">나눔</option>
                    </select>
                </td></tr>
                <tr><td>
                	<input type="hidden" name="bno" value="${bmodify.bno}">
                    <input type="text" name="title" value="${bmodify.title}">
                    <input type="hidden" name="id" value="${bmodify.id}">
                    <input type="hidden" name="writer" value="${bmodify.writer}">
                </td></tr>
                <tr><td><input type="file" name="uploadFile" id="uploadFile" class="b_uploadFile" multiple></td></tr>
                <tr><td><textarea name="content" rows="20">${bmodify.content}</textarea></td></tr>
                <tr><td><div id="test">테테테테스트</div></td></tr>
            </table>
            <input type="button" id="cancelBtn" class="cancelBtn" value="취소" onclick="history.back(-1)">
            <input type="button" id="uploadBtn" class="uploadBtn" value="완료">
        </form>
    </div>
</body>
</html>