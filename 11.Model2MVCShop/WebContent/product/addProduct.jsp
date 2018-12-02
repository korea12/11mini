<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--    
<%@page import="com.model2.mvc.service.domain.Product"%>
<%
Product product = (Product)request.getAttribute("product"); 
%>
--%>




<html>
<head>
	<meta charset="EUC-KR">
<title>상품등록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
	<script type="text/javascript">
	
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "button.btn.btn-primary" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
				 self.location="/product/adminListProduct?menu=manage"
			});
			
			 $( "a.btn.btn-primary" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('추가등록')" ).html() );
					self.location = "../product/addProductView.jsp;"
				});
		});
	</script>
</head>

<body>
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
	
	<h1 class="bg-primary text-center">상 품 등 록</h1>
	
	
		<div class="form-group text-center" >		
			<label for="prodName" class="col-sm-offset-2 col-sm-5 control-label text-center">상품명</label>
		    <div class="col-sm-1">
		      ${product.prodName}
		       <span id="helpBlock" class="help-block">		      	
		      </span>
		    </div>
		</div>

		<div class="form-group text-center">
		    <label for="prodDetail" class="col-sm-offset-2 col-sm-5 control-label text-center">상품상세정보</label>
		    <div class="col-sm-1">
		      ${product.prodDetail}
		    </div>
		 </div>
		<div class="form-group text-center">
		    <label for="manuDate" class="col-sm-offset-2 col-sm-5 control-label text-center">제조일자</label>
		    <div class="col-sm-1 ">
		      ${product.manuDate}
		    </div>
		 </div>
	
		<div class="form-group text-center">
		    <label for="price" class="col-sm-offset-2 col-sm-5 control-label text-center">가 격</label>
		    <div class="col-sm-1">
		      ${product.price}
		      <span id="helpBlock" class="help-block">		      	 
		      </span>
		    </div>
		</div>

		
		<div class="form-group text-center">
		  <label for="uploadFile" class="col-sm-offset-2 col-sm-5 control-label text-center">상품이미지</label>
		    <div class="col-sm-1">
		      ${product.fileName}
		    </div>
		</div>
	

		<div class="form-group ">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >확인</button>
			  <a class="btn btn-primary" href="#" role="button">추가등록</a>
		    </div>
		 </div>

	
</body>
</html>
