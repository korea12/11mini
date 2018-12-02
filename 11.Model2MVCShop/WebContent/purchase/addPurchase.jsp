<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% 	Product product = (Product)request.getAttribute("product");
	System.out.println(product);
	User user = (User)request.getSession().getAttribute("user");
	System.out.println(user);
	
%> --%>

<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
<script>
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });

    
</script>
	<link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
  	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
  	<style>
  	body {
            padding-top : 50px;
        }
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
	<script type="text/javascript">
	function fncAddPurchase() {
		document.addPurchase.submit();
		$('form[name="addPurchase"]').attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/purchase/addPurchase").submit();
	}
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$( "input[name='divyDate']").datepicker( {dateFormat: 'yy-mm-dd'} );
	
	});
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "button.btn.btn-primary" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
			 fncAddPurchase();
		});
		
		 $( "a.btn.btn-primary" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('추가등록')" ).html() );
				history.go(-1);
			});
	});




</script>
</head>

<body>	
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
	
	<form name="addPurchase" class="form-horizontal">
	<input type="hidden" name="prodNo" value="${product.prodNo}" />
	<div class="page-header text-center">
	       <h3 class=" text-info">상품상세조회</h3>	       
   </div>
	
	
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
	</div>
		
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
	</div>		
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
	</div>
		
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
	</div>
		
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
	</div>
		
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
	</div>
		
	<hr/>	  	
	
	<div class="row">	
		   <div class="col-xs-4 col-md-2 "><strong>구매자아이디</strong></div>
		    <div class="col-xs-8 col-md-4">  
			${user.userId}
		    </div>		    
		    <input type="hidden" name="buyerId" value="${user.userId}" />
	</div>		
	
	<hr/>
	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>구매방법</strong></div>
		    <div class="col-xs-8 col-md-4">  
		    	<select	name="paymentOption"		class="ct_input_g" 
								style="width: 100px; height: 19px" >
					<option value="1" selected="selected">현금구매</option>
					<option value="2">신용구매</option>
				</select>
		    </div>		    
	</div>
	 
	<hr/>
	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>구매자이름</strong></div>
		   <div class="col-xs-8 col-md-4">  
		    <input type="text" name="receiverName" class="form-control" value="${user.userName}" placeholder="구매자 이름을 입력하세요."/>
		   </div>		
		    
	</div>	
	
	<hr/>	  	
	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>구매자연락처</strong></div>
		   <div class="col-xs-8 col-md-4">  
		    <input type="text" name="receiverPhone" class="form-control" value="${user.phone}" placeholder="연락처를 입력하세요."/>
		   </div>		
  	</div>
	
	<hr/>	  	
	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>구매자주소</strong></div>
		   <div class="col-xs-8 col-md-4">  
		    <input type="text" name="divyAddr" class="form-control" value="${user.addr}" placeholder="주소를 입력하세요."/>
		   </div>		
  	</div>
	
	<hr/>  	
	
	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>구매요청사항</strong></div>
		   <div class="col-xs-8 col-md-4">  
		    <input type="text" name="divyRequest" class="form-control" placeholder="요청사항을 입력하세요."/>
		   </div>		
  	</div>
	
	<hr/>
	
	  	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>배송희망일자</strong></div>
		   <div class="col-xs-8 col-md-4">  
		    <input type="text" name="divyDate" readonly="readonly" class="form-control" placeholder="배송희망일자를 입력하세요."/>
		   </div>		
  	</div>
	
	<hr/>

	<div class="row">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >구매</button>
			  <a class="btn btn-primary" href="#" role="button">취소</a>
		    </div>
	</div>
	</form>	
</div>	
</body>
</html>	
		
	
	