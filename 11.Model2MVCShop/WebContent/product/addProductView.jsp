<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta charset="EUC-KR">
<title>상품등록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
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
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
	<script type="text/javascript">
		
		function fncAddProduct(){
			//Form 유효성 검증
		 	/* var name = document.detailForm.prodName.value;
			var detail = document.detailForm.prodDetail.value;
			var manuDate = document.detailForm.manuDate.value;
			var price = document.detailForm.price.value; */
			
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
		
			/* document.detailForm.action='/product/addProduct';
			document.detailForm.submit(); */
			$('form[name="detailForm"]').attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/product/addProduct").submit();	
		}
		
		/* function resetData(){
			document.detailForm.reset();
		} */
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			$( "input[name='manuDate']").datepicker( {dateFormat: 'yy-mm-dd'} );

		});	
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "button.btn.btn-primary" ).on("click" , function() {
				
				fncAddProduct();
			});
		});	
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "a.btn.btn-primary" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
					history.go(-1);
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
   	<jsp:include page="/layout/toolbar.jsp" />
<form name="detailForm" class="form-horizontal">
	
	<h1 class="bg-primary text-center">상 품 등 록</h1>
	
	
	
		<div class="form-group">		
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label text-center">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" name="prodName" class="form-control" placeholder="상품명을 입력하세요."/>
		       <span id="helpBlock" class="help-block">		      	
		      </span>
		    </div>
		</div>
		    
		    <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label text-center">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" name="prodDetail" class="form-control" placeholder="상품상세정보를 입력하세요."/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label text-center">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" name="manuDate" readonly="readonly" class="form-control" placeholder="제조일자를 입력하세요."/>
		    </div>
		  </div>
		  		  	  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label text-center">가 격</label>
		    <div class="col-sm-4">
		      <input type="text" name="price" 	class="form-control" placeholder="가격을 입력하세요.">
		      <span id="helpBlock" class="help-block">		      	 
		      </span>
		    </div>
		 </div>
		    
		  <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label text-center">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="file" name="uploadFile" class="form-control" placeholder="상품이미지를 등록하세요."/>
		    </div>
		  </div>
		  
		  		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
			  <a class="btn btn-primary" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
	
	</form>
</body>
</html>