<%@page import="com.model2.mvc.service.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html lang="ko">
<head>
	<meta charset="EUC-KR">
	<title>상품 목록조회</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
  	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	<script type="text/javascript">
	
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
	   	//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
	}
	//===========================================//
	//==> 추가된부분 : "검색" ,  userId link  Event 연결 및 처리
	 $(function() {
		 
		//==> 검색 Event 연결처리부분
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
		 $( "button.btn.btn-default" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
			fncGetList(1);
		});
		
		 $( "#priceSearch" ).on("change" , function() {
			fncGetList(1);
		});
		//==> userId LINK Event 연결처리
		//==> DOM Object GET 3가지 방법 ==> 1.
		//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
		$( "span.btn.btn-primary" ).on("click" , function() {
				var prodNo = $(this).data('param1');
				var tranCode = $(this).data('param3');
				console.log('트랜코드는?'+tranCode);
				if(tranCode == ''){					
					self.location ="/product/getProduct?prodNo="+prodNo+"&menu=${param.menu}";					
				}else{				
					alert("재입고 예정입니다.")
					self.location="/product/listProduct?menu=${param.menu}";
				}
		});
		
		$("td:nth-child(2)").tooltip({
			items: '[data-photo]',
			content: function(){
				var fileName = $(this).data('photo');
				var prodDetail = $(this).data('param2');
				return '<img src="/images/uploadFiles/'+fileName+'" width="200px;" height="200px;"/><br/>'+prodDetail;
			}
					
		});
		
		$('#delivery').on("click" , function(){
			var prodNo = $(this).data('param1');			
			self.location = "/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode=2";
			
		});		
		
		
		
		$( "td:nth-child(2)" ).css("color" , "#f37735");
		$("h7").css("color" , "	#f37735");
				
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		
	});
	
	</script>
	<style>
        body {
            padding-top : 50px;
        }
        
        .thumbnail img {
        	width: 300px;
        	height: 300px;
        }
    </style>
</head>

<body>

<%-- <form name="detailForm" action="/product/listProduct?menu=${param.menu} %>" method="post"> --%>



<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<div class="page-header text-info">
	       	<h3>상품 목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
		    <form name="detailForm" class="form-inline">
		   		<input type="hidden" id="menu" name="menu" value="search"/>
			    <div class="col-md-6 text-left">
			    	<p class="text-primary">
			    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
			    	</p>
				  	<div align="left">
						<select id="priceSearch" name = "priceSearch" class="form-control" style="width:130px">
							<option value="0" ${ !empty search.priceSearch && search.priceSearch=='0' ? "selected" : ""} >상품순서별</option>
							<option value="1" ${ !empty search.priceSearch && search.priceSearch=='1' ? "selected" : ""}>낮은가격순</option>
							<option value="2" ${ !empty search.priceSearch && search.priceSearch=='2' ? "selected" : ""}>높은가격순</option>
							<option value="3" ${ !empty search.priceSearch && search.priceSearch=='3' ? "selected" : ""}>신상품순</option>
							<option value="4" ${ !empty search.priceSearch && search.priceSearch=='4' ? "selected" : ""}>오래된상품순</option>				
						</select>			
					</div>
			    </div>
			    
			    <div class="col-md-2"></div>
			    
			    <div class="col-md-4 text-right">
				    <div class="col-md-5">
						  <div class="form-group">
						    <select class="form-control" name="searchCondition" >
								<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
								<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
								<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>가격</option>						
							</select>
						  </div>
					 </div>
					 
					  <div class="col-md-5">
						  <div class="form-group">
						    <label class="sr-only" for="searchKeyword">검색어</label>
						    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
						    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
						  </div>
					  </div>
					  
					  <div class="col-md-1">
					  	<button type="button" class="btn btn-default">검색</button>
					  </div>
					  
					  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					 </div>
				</form>
			</div>
				
		<div class="row">
		<c:set var="i" value="0" />
		<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		
 			 <div class="col-sm-6 col-md-4">
   			 <div class="thumbnail">
    		  <img src="/images/uploadFiles/${product.fileName}" alt="...">
    		  <div class="caption" >
     		   <h3>${product.prodName}</h3>
      		  <p>${product.prodDetail}</p>
     		   <p><span class="btn btn-primary" role="button" data-param1="${product.prodNo}" data-photo="${product.fileName}"
     		    data-param2="${product.prodDetail}" data-param3="${product.proTranCode}">상세보기</span>
     		   <span class="btn btn-default" role="button" >
						<c:choose>
							<c:when test="${product.proTranCode==null}" >
								판매중
							</c:when>
							<c:otherwise>
								재고없음
							</c:otherwise>
						</c:choose>					
			   </span></p>
     		 </div>
   		 	</div>
 		 	</div>
		
	</c:forEach>
	</div>		
	  <!--  table End /////////////////////////////////////-->
	  
 	
 	<jsp:include page="/history.jsp" />
	
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</div>
</body>

</html>
