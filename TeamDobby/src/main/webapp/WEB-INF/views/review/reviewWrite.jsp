<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>장바구니</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

    <style type="text/css">
    
        /*review_write 별 ---------------------*/
        
        .reviewwrite .starR{
          background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
          background-size: auto 100%;
          width: 30px;
          height: 30px;
          display: inline-block;
          text-indent: -9999px;
          cursor: pointer;
        }
        
        .reviewwrite .starR.on{
            background-position:0 0;
        
        }
        
        /*review_write 별 END-------------------*/
        
         /* review_write -----------------*/
        .reviewimg .t-title .middle{
            vertical-align: middle;
            text-align: center;
            padding-top: 20px;
        }
        
        .category_select select{
            width:150px;
            padding:2px; 
            border:1px solid #ddd;
            border-radius:0.3em;
        }
        /* rewview_write END ----------------------*/
    	.top {
    		padding-top: 80px;
    	}
    </style>
</head>
<body> <!-- ----------------------------------여기부터 body입니다.-------------------------------------------- -->
	
    <%@include file="../include/header.jsp" %>
    
    <section class="top">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    <div class="titlebox titlebox2">
                        <p>상품후기</p>
                    </div>
                    <form action="regForm"  method="post" id="regForm" name="regForm" enctype="multipart/form-data">
                  
                    
                    <table class="table">
                        <tbody class="t-control reviewwrite">
                          <tr>
                             <!--<td>평가</td>-->
                              <td><span class="rating_star"><span style="width: 50%;">Rating</span></span></td>
                              <td>
                                <div class="starRev" id="star">
                                <!-- $(".starRev").html(str) -->
                                  <span class="starR">★</span>
                                  <span class="starR">★</span>
                                  <span class="starR">★</span>
                                  <span class="starR">★</span>
                                  <span class="starR">★</span>   
                                </div>
                              </td>
                          </tr>
                          <tr>
                            <td class="t-title">UserId</td>
                            <td><input type="text" class="form-control" name="user_id"  id="user_id" value="${sessionScope.user_id }" readonly="true"></td>
                          </tr>
                          <tr>
                            <td class="t-title">TITLE</td>
                            <td><input type="text" class="form-control" name="r_title" id="r_title"></td>
                          </tr>
                          <tr>
                            <td class="t-title">CONTENT</td>
                            <td><textarea class="form-control" rows="7" name="r_content" id="r_content"></textarea></td>
                          </tr>
                          <tr>
                           <td class="t-title left">
                               <input type="file" id="file" placeholder="파일업로드">
                           </td>
                          </tr>
                          
                        </tbody>
                      </table>
                      </form>
                      
                      
                      <div class="titlefoot">
                          <button class="btn btn-default" id="reviewList">목록</button>
                          <button type="button" class="btn btn-default" id="uploadBtn">등록</button>
                      </div>
                      
                      
                </div>
            </div>
            
        </div>
        
        
    </section>
    
    <%@include file="../include/footer.jsp" %>
    

    
  <script>
  
  		//별 움직임
  		$('.starRev span').click(function(e){
  	  		      $(this).parent().children('span').removeClass('on');
  	  		      $(this).addClass('on').prevAll('span').addClass('on');
  	  	})
  	    
  	
  	    
  	    
  	    //목록이동
  	  	var reviewList = document.getElementById("reviewList");
	    reviewList.onclick = function() {
	    	var pno = location.search;
	    	pno = location.search.substring(pno.lastIndexOf("=")+1);
	    	location.href="../productList/productDetail?pno="+pno+"#review-point";
	    }
  	   
  	    
  	    
  	    
  	    //등록처리
  	     $(document).ready(function(){
  	    	$("#uploadBtn").click(function() {
				regist();	
			})
  	     });
  	     
  	    
  	     
  	    function regist() {
  	    	
  	    	//파일 확장자 확인
  	    	var file = $("#file").val();
			file = file.slice( file.indexOf(".") + 1 ).toLowerCase();
			
			if(file != "jpg" && file !="png" && file != "bmp" && file != null) {
				alert("이미지 파일(jpg, png, bmp)만 등록 가능합니다");
				$("#file").val(""); //file태그가 가지고 있는 파일을 비우고 함수종료
				return false;
			} else if(user_id == '' /* false */) {
				alert("로그인이 필요한 서비스 입니다");
				return false;
			}
			

			
			//ajax폼전송의 핵심 FormData객체 생성
			var formData = new FormData();
			var fileData = $("#file");
			var user_id = $("#user_id").val();
			var r_title = $("#r_title").val(); 
			var r_content = $("#r_content").val();
			var pno = location.search;
  	    	pno = location.search.substring(pno.lastIndexOf("=")+1);
			
			let cnt = 0;
			var list = document.querySelectorAll(".starR");
			for(var i = 0; i < list.length; i++) {
				if(list[i].getAttribute("class").indexOf("on") != -1) {
					cnt++;
				}
			}
			formData.append("starCount", cnt);
			formData.append("file", $("#file")[0].files[0]); //file이름으로  파일정보를 폼에 저장
			formData.append("user_id", user_id);
			formData.append("r_title", r_title); 
			formData.append("r_content", r_content);
			formData.append("pno", pno);
			
			
  	    	
		
			
  	    	if(r_title == "") {
  	    		alert("제목을 입력해주세요");
  	    		$("#r_title").focus();
  	    		return;
  	    	}
  	    	
  	    	if(r_content == "") {
  	    		alert("내용을 입력해주세요");
  	    		$("#r_content").focus();
  	    		return;
  	    	}
  	    	
  	    	var ys = confirm("게시글을 등록하시겠습니까?");
  	    	
  	    	if(ys) {
  	    		
  	    		$.ajax({
  	    			
  	    			url : "reviewUpload",
  	    			type : "POST",
  	    			data : formData,
  	    			processData: false, //false면 post타입
  	    			contentType: false, //false면 multipart/form-data
  	    			success : function(result) {
  	    				if(result == 'success') {
  	    					alert("게시글이 성공적으로 등록되었습니다");
  	    					location.href="../productList/productDetail?pno="+pno+"#review-point";
  	    				}
  	    			
  	    			},
  	    			error : function(result) {
  	    				
  	    			}
  	    			
  	    		});
  	    	}
  	    }  
  	    
  
	
	</script>

</body>
</html>