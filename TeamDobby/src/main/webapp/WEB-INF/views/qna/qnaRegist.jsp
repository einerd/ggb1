<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>장바구니</title>

    <!-- 달력 관련 시작 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <!-- 달력 관련 END -->
    
    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

    
    <style type="text/css">
        /* 상품문의 작성 */
        .qnaimg td{
            vertical-align: middle;
            width: 50%;
            
        }
        
        .qnaimg .middle .p{
            padding-top: 20px;
            vertical-align: middle;
            text-align: center;
        }
        
        .qnaimg .middle{
            padding-top: 20px;
            vertical-align: middle;
            text-align: center;
        }
        
        .qnaimg .out{
	         width: 100%;
			 text-align: center;
        }
        
        .qnaimg .in{
        	padding-top: 15px;
        	display: inline-block;
        }
        
        .top {
        	padding-top: 80px;
        }
        /* 상품문의 작성 END-------------------------- */
    
    </style>
    
</head>
<body>
<%@include file="../include/header.jsp" %>
            
    <section class="top">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    <div class="titlebox titlebox2">
                        <p>상품문의</p>
                    </div>
                    <form action="registForm" name="qnaRegform" id="qnaRegform" method="post" enctype="multipart/form-data">
                    	<table class="table">
                        <tbody class="t-control">
                        <tr class="qnaimg">
                             
                              <td class="t-title">
                               <div class="middle">
                                <img width="150" src="${pageContext.request.contextPath }/${vo.p_uploadpath }/${vo.p_img_names}${vo.p_img_exts}">
                                </div>
                              </td>
                              <td>
                                <div class="middle">
                                 <div class="info">
                                  <p class="title p">${vo.p_name }</p>
                                  </div>
                                  <div class="seller">
                                   <p class="title p">${vo.seller_name }</p>
                                  </div>
                                  </div>
                              </td>
                          </tr>
                        </tbody>
                    </table>
                    <table class="table">
                        <tbody class="t-control">
                        <tr class="qnaimg">
                              <td class="out">
                              
                             	 	<div class="in" id='previewId' style='width: 200px;'></div>
                 
                              </td>
                              
                          </tr>
                        </tbody>
                    </table>	
                    
                    <input type="hidden" class="form-control" name="pno" id="pno">
                    <input type="hidden" class="form-control" name="sno" id="sno">
                    <input type="hidden" class="form-control" name="uno" id="uno" value="${sessionScope.uno }">
                    
                    <table class="table">
                        <tbody class="t-control">
                         <tr>
                             <td class="t-title">Category</td>
                            <td>
								<div class="category_select">
									<!-- <select class=" tune" id="category" name="category" style="width: 127px;"><option value="상품">상품</option><option value="배송">배송</option><option value="반품/환불">반품/환불</option><option value="교환/변경">교환/변경</option><option value="기타">기타</option></select> -->
									<select class="tune" id="b_history" name="b_history" style="width: 127px;"><option value="상품">상품</option><option value="배송">배송</option><option value="반품/환불">반품/환불</option><option value="교환/변경">교환/변경</option><option value="기타">기타</option></select>
								</div>
							</td>
                         </tr>
                          <tr>
                            <td class="t-title">UserId</td>
                            <td><input type="text" class="form-control" name="user_id" value="${sessionScope.user_id }" readonly="true"></td> <!-- value="${sessionScope.user_id}" readonly -->
                          </tr>
                          <tr>
                            <td class="t-title">TITLE</td>
                            <td><input type="text" class="form-control" id="q_title" name="q_title"></td>
                          </tr>
                          <tr>
                            <td class="t-title">CONTENT</td>
                            <td><textarea class="form-control" rows="7" name="q_content" id="q_content"></textarea></td>
                          </tr>
                          <tr>
                           <td class="t-title left">PICTURE</td>
                           <td>
                               <input onchange="previewImage(this,'previewId')" type="file" class="form-control btn btn-default" id="file" name="file" value="파일명.jpg">
                               <!-- <td><textarea cols="100" rows="20" id="imgName" name="imgName" title="내용"></textarea></td> -->
                           </td>
                          </tr>
                          
                        </tbody>
                      </table>
                    </form>
                      <div class="titlefoot">
                          <button class="btn btn-default" id="qnaList">목록</button>
                          <button class="btn btn-default" id="qnaRegist">완료</button>
                      </div>
                      
                      
                </div>
            </div>
            
        </div>
        
        
    </section>

   	<script>
	    //목록을 클릭하면 list화면으로 연결
	    var qnaList = document.getElementById("qnaList");
	    qnaList.onclick = function() {
	    	var pno = location.search;
	    	pno = location.search.substring(pno.lastIndexOf("=")+1);
	    	location.href = "../productList/productDetail?pno="+pno+"#qna-point";
	    }
	    
	    
   		//등록을 클릭하면 작성자, 제목, 내용이 공백인지 확인하고, 공백이라면 함수종료 ,공백이 아니라면 controller전송하는 처리
   		window.onload = function() {
   			var qnaRegist = document.getElementById("qnaRegist");
   	    	qnaRegist.onclick = function() {
   	    		
   	    		if(document.qnaRegform.user_id.value == '' ) {
   	    			alert("작성자는 필수 사항입니다");
   	    			document.qnaRegform.uno.focus();
   	    			return; //함수 종료
   	    		} else if(document.qnaRegform.q_title.value == '') {
   	    			alert("제목은 필수 사항입니다");
   	    			document.qnaRegform.q_title.focus();
   	    			return;
   	    		} else if(document.qnaRegform.q_content.value == '') {
   	    			alert("내용은 필수 사항입니다");
   	    			document.qnaRegform.q_content.focus();
   	    			return;
   	    		} else {
   	    			var pno = location.search;
   	    	    	pno = pno.substring(pno.lastIndexOf("=")+1);
   	    			$("#pno").val(pno);
   	    	    	console.log(pno);
   	    	    	console.log($("#pno").val());
  	     	    	$("#qnaRegform").submit();
//    	    			document.qnaRegform.submit(); //폼의 서브밋기능
   	    		}
   	    	}
   			
   		}
    
    
    </script>
	
	<script type="text/javascript">
	       function previewImage(targetObj, previewId) {
	
	        var preview = document.getElementById(previewId); //div id   
	        var ua = window.navigator.userAgent;
	
	        if (ua.indexOf("MSIE") > -1) {//ie일때
	
	            targetObj.select();
	
	            try {
	                var src = document.selection.createRange().text; // get file full path 
	                var ie_preview_error = document
	                        .getElementById("ie_preview_error_" + previewId);
	
	                if (ie_preview_error) {
	                    preview.removeChild(ie_preview_error); //error가 있으면 delete
	                }	
	
	                var img = document.getElementById(previewId); //이미지가 뿌려질 곳 
	
	                img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
	                        + src + "', sizingMethod='scale')"; //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
	            } catch (e) {
	                if (!document.getElementById("ie_preview_error_" + previewId)) {
	                    var info = document.createElement("<p>");
	                    info.id = "ie_preview_error_" + previewId;
	                    info.innerHTML = "a";
	                    preview.insertBefore(info, null);
	                }
	            }
	        } else { //ie가 아닐때
	            var files = targetObj.files;
	            for ( var i = 0; i < files.length; i++) {
	
	                var file = files[i];
	
	                var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
	                if (!file.type.match(imageType))
	                    continue;
	
	                var prevImg = document.getElementById("prev_" + previewId); //이전에 미리보기가 있다면 삭제
	                if (prevImg) {
	                    preview.removeChild(prevImg);
	                }
	
	                var img = document.createElement("img"); //크롬은 div에 이미지가 뿌려지지 않는다. 그래서 자식Element를 만든다.
	                img.id = "prev_" + previewId;
	                img.classList.add("obj");
	                img.file = file;
	                img.style.width = '200px'; //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다.
	                img.style.height = '200px';
	                
	                preview.appendChild(img);
	
	                if (window.FileReader) { // FireFox, Chrome, Opera 확인.
	                    var reader = new FileReader();
	                    reader.onloadend = (function(aImg) {
	                        return function(e) {
	                            aImg.src = e.target.result;
	                        };
	                    })(img);
	                    reader.readAsDataURL(file);
	                } else { // safari is not supported FileReader
	                    //alert('not supported FileReader');
	                    if (!document.getElementById("sfr_preview_error_"
	                            + previewId)) {
	                        var info = document.createElement("p");
	                        info.id = "sfr_preview_error_" + previewId;
	                        info.innerHTML = "not supported FileReader";
	                        preview.insertBefore(info, null);
	                    }
	                }
	            }
	        }
	    }
	</script>
<%@include file="../include/footer.jsp" %>	
	
</body>
</html>