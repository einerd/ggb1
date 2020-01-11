<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">
	.modal-footer .btn {
		float: right;
		margin-right: 10px;
	}

</style>

<header>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath }/"><img width="43" src="${pageContext.request.contextPath }/resources/img/logo.svg"></a>
            </div>


            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="dropdown">

                        <a href="#" class="dropdown-toggle" id="dropdown1" data-toggle="dropdown" role="button" aria-expanded="true">
                        <span id="category"></span><span class="caret"></span></a>
                        <ul class="dropdown-menu" id="dropdown-menu" role="menu">
                            <li><a href="all">전체상품</a></li>
                            <li class="divider"></li>
                            <li><a href="artefact">인공물</a></li>
                            <li class="divider"></li>
                            <li><a href="animal">동물</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" id="searchForm" role="search" action="${pageContext.request.contextPath }/user/searchTarget" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="searchName" placeholder="Search">
                        <input type="hidden" name="searchType" id="searchType" value="${sessionScope.searchType }">
                        <input type="hidden" name="path" id="path" value="${sessionScope.path }">
                        <div><button type="submit" class="btn btn-default">검색</button></div>
                    </div>
                </form>
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" id="dropdown2" data-toggle="dropdown" role="button" aria-expanded="true">
                            <span class="glyphicon glyphicon-home"></span>
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li><a href="${pageContext.request.contextPath }/productList/purchaseHistory"><span class="glyphicon glyphicon-shopping-cart"></span> 구매내역</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath }/productList/basketList"><span class="glyphicon glyphicon-log-in"></span> 장바구니</a></li>
                        </ul>
                    </li>


                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" id="dropdown3" data-toggle="dropdown" role="button" aria-expanded="true">
                            <span class="glyphicon glyphicon-user"></span>
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        	<c:choose>
	                        	<c:when test="${sessionScope.user_id eq null }">
	                            <li><a href="${pageContext.request.contextPath }/user/userJoin"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
	                            </c:when>
								<c:otherwise>
								<li><a href="${pageContext.request.contextPath }/user/userMypage"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
								</c:otherwise>
							</c:choose>	                        
                            <c:choose>
	                            <c:when test="${sessionScope.user_id eq null }">
		                            <li class="divider"></li>
		                            <li><a href="#myModal" data-toggle="modal"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	                            </c:when>
                            <c:otherwise>
	                            <li class="divider"></li>
	                            <li><a href="${pageContext.request.contextPath }/user/userLogout"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
                            </c:otherwise>
                            </c:choose>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인</h4>
        </div>
        <div class="modal-body">
        	<form action="${pageContext.request.contextPath }/user/loginForm" id="loginForm" name="loginForm" method="post">
				<div class="input-group">
    				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    				<input id="header_user_id" type="text" class="form-control" name="header_user_id" placeholder="ID">
  				</div>
  				<div class="input-group">
    				<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    				<input id="header_user_pw" type="password" class="form-control" name="header_user_pw" placeholder="Password">
  				</div>
			</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          <button type="button" id="login" class="btn btn-success" data-dismiss="modal">로그인</button>
        </div>
      </div>
      
    </div>
  </div>
    
</header>
<script>
	$(document).ready(function() {
		var category = "";
		var tab = "${sessionScope.searchType}";
		if(tab == "animal") category = "동물";
		else if(tab == "artefact") category = "인공물";
		else if(tab == "") category = "전체상품";
		
		document.getElementById("category").innerHTML = category;
	})


	document.getElementById("dropdown-menu").onclick = function(event) {
		event.preventDefault();
		var searchType = event.target.getAttribute("href");
		document.getElementById("searchType").setAttribute("value", searchType);
		document.getElementById("searchForm").submit();
	}
	
	document.getElementById("login").onclick = function() {
		document.loginForm.submit();
	}
</script>