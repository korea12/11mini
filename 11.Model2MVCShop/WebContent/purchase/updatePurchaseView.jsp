<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% 
	Purchase purchase = (Purchase)request.getAttribute("purchase");
%>--%>


<html>
<head>
<title>구매정보 수정</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	<link href="/css/animate.min.css" rel="stylesheet">
  	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
    <style>
		body {
            padding-top : 50px;
        }
    </style>
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
	<script type="text/javascript">
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$( "input[name='divyDate']").datepicker( {dateFormat: 'yy-mm-dd'} );
	
	});	
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "button.btn.btn-primary" ).on("click" , function() {
			 console.log("abvc");
			 var tranNo = $(this).data('param1');
			 
			 $('form[name="updatePurchase"]').attr("method" , "POST").attr("action" , "/purchase/updatePurchase?tranNo="+tranNo).submit();
		});
	});	
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "button.btn.btn-primary.btn" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			 history.go(-1);
		});
	});	
	
	</script>
	

</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
<%-- <form name="updatePurchase" method="post"	action="/updatePurchase.do?tranNo=<%=purchase.getTranNo() %>"> --%>
<%-- <form name="updatePurchase" method="post"	action="/purchase/updatePurchase?tranNo=${purchase.tranNo}"> --%>
	<form name="updatePurchase" class="form-horizontal">
	<div class="container">
	<input type="hidden" name="buyerId" value="${purchase.buyer.userId}">
	
	<div class="page-header text-center">
	       <h3 class=" text-info">구매정보수정</h3>
	       <h5 class="text-muted">구매 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
    </div>
    
	    <div class="form-group">
			    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
				    <div class="col-sm-4">
				    <p align ="center" style="width: 100px; height: 19px" 
							maxLength="20"> ${purchase.buyer.userId}</p> 
				    </div>
		</div>
		<hr/>
		<div class="form-group">
		   <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		   <div class="col-sm-4">
		     <select 	name="paymentOption" 	class="col-sm-offset-1" style="width: 100px; height: 19px" value="${purchase.paymentOption }">
				<%-- <option value="1" <%=purchase.getPaymentOption().equals("1")?"selected":"" %>>현금구매</option>
				<option value="2" <%=purchase.getPaymentOption().equals("2")?"selected":"" %>>신용구매</option> --%>
				<option value="1" >현금구매</option>
				<option value="2" >신용구매</option>
			</select>
		   </div>
		 </div>
		 <hr/>
		 <div class="form-group">
		   <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		   <div class="col-sm-4">
		     <input 	type="text" name="receiverName" align ="center"	class="col-sm-offset-1" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.receiverName}" />
		   </div>
		 </div>
		 <hr/>
		 <div class="form-group">
		   <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		   <div class="col-sm-4">
		     <input 	type="text" name="receiverPhone" 	class="col-sm-offset-1" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.receiverPhone}" />
		   </div>
		 </div>
		 
		<hr/>
		
		<div class="form-group">
		   <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		   <div class="col-sm-4">
		     <input 	type="text" name="divyAddr" 	class="col-sm-offset-1" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.divyAddr}" />
		   </div>
		 </div>
			<hr/> 
		<div class="form-group">
		   <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		   <div class="col-sm-4">
		     <input 	type="text" name="divyRequest" 	class="col-sm-offset-1" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.divyRequest}" />
		   </div>
		 </div>
		 <hr/>
		 
		<div class="form-group">
		   <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		   <div class="col-sm-4">
		     <input 	type="text" name="divyDate" 	class="col-sm-offset-1" style="width: 100px; height: 19px" 
							maxLength="20" value="${purchase.divyDate}" />
		   </div>
		 </div>
		  <hr/>
	
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" data-param1=${purchase.tranNo } >수정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취소</a>
		    </div>
		</div>
		<hr/>
		
	</div>
	</form>
<%-- 
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;" data-param1=${purchase.tranNo }>
					<!-- <input type="submit" value="수정"/> -->
					수정
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<!-- <a href="javascript:history.go(-1)">취소</a> -->
					취소
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>

</body>
</html> --%>