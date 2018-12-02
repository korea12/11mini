<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
<%@page import="java.util.*"%>
<%@page import="com.model2.mvc.common.Search"%>

<%@page import="com.model2.mvc.service.domain.Product"%>
<%@page import="com.model2.mvc.service.product.dao.ProductDAO"%>


<% Product product = (Product)request.getAttribute("product"); 

%>
--%>

<html>
<head>
<title>회원정보수정</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
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

	function fncAddProduct(){
	//Form 유효성 검증
		var prodName=$("input[name='prodName']").val();
		var prodDetail=$("input[name='prodDetail']").val();
		var manuDate =$("input[name='manuDate']").val();
		var price =$("input[name='price']").val();
		
		if(prodName == null || prodName.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(prodDetail == null || prodDetail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
			
		/* document.detailForm.action='/product/updateProduct?menu=manage';
		document.detailForm.submit(); */
		$('form[name="detailForm"]').attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/product/updateProduct").submit();
	}
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$( "input[name='manuDate']").datepicker( {dateFormat: 'yy-mm-dd'} );
	
	});	
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "button.btn.btn-primary" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('가입')" ).html() );
			 fncAddProduct();
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
	<div class="container">
	
		
<form name="detailForm" class="form-horizontal">

<%--<input type="hidden" name="prodNo" value="<%= product.getProdNo()%>"/> --%> 
	<input type="hidden" name="prodNo" value="${product.prodNo}"/>
	
	<div class="page-header text-center">
	       <h3 class=" text-info">상품정보수정</h3>
	       <h5 class="text-muted">상품 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
    </div>
	    
		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}">
		    </div>
		</div>
		 <div class="form-group">
		   <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		   <div class="col-sm-4">
		     <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
		   </div>
		 </div>
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile" value="${product.fileName}">		      
		    </div>
		  </div>
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
	</div>
</body>
</html>
	<%-- 	  
<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품수정</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input 	type="text" name="prodName" class="ct_input_g" 
										style="width: 100px; height: 19px" maxLength="20" value="<%=product.getProdName()%>">
						<input 	type="text" name="prodName" class="ct_input_g" 
										style="width: 100px; height: 19px" maxLength="20" value="${product.prodName}">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품상세정보 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="prodDetail" value="<%=product.getProdDetail()%>" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
				<input type="text" name="prodDetail" value="${product.prodDetail}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			제조일자 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" readonly="readonly" name="manuDate" value="<%=product.getManuDate()%>" 	
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp;
				<input type="text" readonly="readonly" name="manuDate" value="${product.manuDate}" 
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6"/>&nbsp;
						<img 	src="../images/ct_icon_date.gif" width="15" height="15" />
									<!-- onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" --> 
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			가격 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" readonly="readonly" name="manuDate" value="<%=product.getPrice()%>" 	
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp;
			<input type="text"  name="price" value="${product.price}" 	
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp;
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">상품이미지</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input	type="text" name="fileName" class="ct_input_g" 
						style="width: 200px; height: 19px" maxLength="13" value="<%=product.getFileName()%>"/>
				<input	type="file" name="uploadFile" class="ct_input_g" 
						style="width: 200px; height: 19px" maxLength="13" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="cursor:pointer"	style="padding-top: 3px;">
						<!-- <a href="javascript:fncAddProduct();">수정</a> -->
						수정
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif"width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="cursor:pointer" style="padding-top: 3px;">
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