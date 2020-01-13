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
    	
    	.titlefoot{
            float:right;
        }
    	
    	#form1 {
    		padding-bottom: 18px;
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
                    <form action="reviewUpload"  method="post" id="regForm" name="regForm" enctype="multipart/form-data">
                  
                    
                    <table class="table">
                        <tbody class="t-control reviewwrite">
                          <tr>
                          <td class="t-title" id="sksk">Preview</td>
                          	<td>
                          		<div id="form1" >
                          	 
                          			<img id="blah" src="">
                          		
       							</div>
                          	</td>
                          	
                          </tr>
                          
                          <tr>
                             <!--<td>평가</td>-->
                              <td><span class="rating_star"><span style="width: 50%;">Rating</span></span></td>
                              <td>
                                <div class="starRev" id="star" >
                                <!-- $(".starRev").html(str) -->
                                  <span class="starR on">★</span>
                                  <span class="starR">★</span>
                                  <span class="starR">★</span>
                                  <span class="starR">★</span>
                                  <span class="starR">★</span>   
                                </div>
                              </td>
                          </tr>
                          <tr>
                            <td class="t-title">UserId</td>
                            <td><input type="text" class="form-control" name="writer"  id="writer" value="${sessionScope.user_id }" readonly></td>
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
                           <td class="t-title left">PICTURE</td>
                           <td>
                               <input type="file" class="form-control" id="file" name="file" placeholder="파일업로드" onchange="readURL(this)" runat="server">
                           </td>
                          </tr>
                          
                        </tbody>
                      </table>
                       <input type="hidden" id="cnt" name="cnt">
                       <input type="hidden" id="pno" name="pno">
                       <input type="hidden" id="uno" name="uno" value="${sessionScope.uno }">
                      </form>
                      
                      
                      <div class="titlefoot">
                          <button class="btn btn-default" id="reviewList">목록</button>
                          <button type="button" class="btn btn-default" id="reviewUpload">등록</button>
                      </div>
                      
                      
                </div>
            </div>
            
        </div>
       
        
    </section>
    
    <%@include file="../include/footer.jsp" %>
    

    
  <script>
	  
	  window.onload = function() {
			
			// 뒤로가기 실행후에 앞으로가기 했을 때, 저장된 기록이 공백이라면 함수 종료
			if(history.state == '') return;
			
			var msg = '${msg}';
			if(msg != '') { // 값이 없을 때는 ''로 감싸서 공백문자열로 완성되도록 해준다
				alert(msg);
				history.replaceState('', null, null); // 현재 히스토리 기록을 변경
			}
		}
  
  
  
  
  		//이미지 파일 미리보기
		  function readURL(input) {
		      if (input.files && input.files[0]) {
		          var reader = new FileReader();
		          reader.onload = function (e) {
		        	  
		              $('#blah').attr('src', e.target.result)
		              .width("480px")            
		              .height("360px");
		          };
		          reader.readAsDataURL(input.files[0]);
		      }
		  }
  		
  		
  
  
  		//별 움직임
  		$('.starRev span').click(function(e){
  	  		      $(this).parent().children('span').removeClass('on');
  	  		      $(this).addClass('on').prevAll('span').addClass('on');
  	  	})
  	    
  	
  	    
  	    
  	    //목록이동
  	    var reviewList = document.getElementById("reviewList");
  	    reviewList.onclick = function() {
  	    	var pno = location.search;
  	    	pno = pno.substring(pno.lastIndexOf("=")+1);
     		location.href="../productList/productDetail?pno="+pno+"#review-point";
  	    }
  	    
  	   
  	    
  	    
  	   //등록처리
  	   var reviewUpload = document.getElementById("reviewUpload");
  	   reviewUpload.onclick = function() {
  		   
  		   var file = document.regForm.file.value;
  		   file = file.slice(file.indexOf(".") + 1).toLowerCase();
  		   
  		   if(file != "jpg" && file !="png" && file !="bmp" && file != "") {
  			   alert("이미지 파일(jpg, png, bmp)만 등록 가능합니다");
  			   document.regForm.file.value(""); //file태그 파일을 비우고 함수종료
  			   return;
  		   }else if(document.regForm.writer.value == "") {
  			   alert("로그인이 필요한 서비스 입니다");
  			   location.href="/test";
  			   return;
  		   }else if(document.regForm.r_title.value == "") {
  			   alert("제목을 입력해주세요");
  			   document.regForm.r_title.focus();
  			   return;
  		   }else if(document.regForm.r_content.value == "") {
  			   alert("내용을 입력해주세요");
  			   document.regForm.r_content.focus();
  			   return;
  		   }else if(confirm("등록하시겠습니까?")){
  			    //별값
  			 	let cnt = 0;
				var list = document.querySelectorAll(".starR");
				for(var i = 0; i < list.length; i++) {
					if(list[i].getAttribute("class").indexOf("on") != -1) {
						cnt++;
					}
				}
				
				//pno값
				var pno = location.search;
	  	    	pno = location.search.substring(pno.lastIndexOf("=")+1);
	  	 		
	  	 		document.getElementById("pno").setAttribute("value", pno);
	  	 		
	  	 		document.getElementById("cnt").setAttribute("value", cnt);
	  	 		
	  	    	document.regForm.submit(); //폼값 전송
				
  		   }
  		   
  	   }
  	   
  	   

  
	
	</script>

</body>
</html>