<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 구글 웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<!-- css -->
<link rel="stylesheet" href="../resources/css/style.css">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>main</title>
</head>
<body>
    <div id="wrap">
        <header id="header">
            <div id="headerIn">
                <h1 class="logo"><a href="#">logo</a></h1>
                <div class="pc gnb">
                    <ul>
                        <li class="h_notice"><a href="#">notice</a></li>
                        <li class="h_info"><a href="#">info</a></li>
                        <li class="h_review"><a href="#">review</a></li>
                        <li class="h_talk"><a href="#">talk</a></li>
                        <li class="h_creation"><a href="#">creation</a></li>
                        <li class="h_share"><a href="#">share</a></li>
                    </ul>
                </div>
                <div class="util">
                	<c:if test="${login==null}"><a href="/login" class="h_login">login</a></c:if>
                    <c:if test="${login!=null}">
                    	<a href="/logout" class="h_logout">로그아웃</a>
                    	<a href="/mypage">마이페이지</a>
                    </c:if>
                    <ul>
                        <li class="h_search"><a href="#">search</a></li>
                        <li class="h_menu"><a href="#">menu</a></li>
                    </ul>
                </div>
            </div> <!--.headerIn-->
        </header> <!--#header-->
        <div id="container">
            <section class="main1">
                <div class="slides">
                    <div class="menu">
                        <ul>
                            <li class="notice"><a>NOTICE</a></li>
                            <li class="news"><a>News</a></li>
                            <li class="talk"><a>Talk</a></li>
                            <li class="free"><a>Free</a></li>
                            <li class="review"><a>Review</a></li>
                            <li class="creation"><a>Creation</a></li>
                        </ul>
                    </div>
                </div>
                <div class="slides"><img src="../resources/img/main7.jpg"></div>
                <div class="slides"><img src="../resources/img/main3.jpg"></div>
                <div class="slides"><img src="../resources/img/main4.png"></div>
                <div class="pager">
                    <ul>
                        <li class="on"><a href="#">1</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">1</a></li>
                    </ul>
                </div>
            </section> <!--.main1-->
        </div> <!--#container-->
        <footer id="footer">
            <div class="f_logo">logo</div>
            <div class="f_info">site info</div>
            <div class="f_copyright">copyright</div>
        </footer> <!--#footer-->
        <div class="top"><a href="#">top</a></div>
        <div class="side">
            <div class="side_close"><a href="#">닫기</a></div>
            <div class="side_box">
                <ul>
                    <li><a href="/board">공지사항</a></li>
                </ul>
                <span class="bar"></span>
                <ul>
                    <li><a href="#">영화소식</a></li>
                    <li><a href="#">영화리뷰</a></li>
                    <li><a href="#">영화수다</a></li>
                </ul>
                <span class="bar"></span>
                <ul>
                    <li><a href="#">자유수다</a></li>
                    <li><a href="#">나눔</a></li>
                </ul>
            </div>
        </div>
    </div> <!--#wrap-->
    <script src="../resources/js/script.js"></script>
</body>
</html>