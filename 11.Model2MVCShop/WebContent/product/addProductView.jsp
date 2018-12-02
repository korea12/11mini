<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta charset="EUC-KR">
<title>��ǰ���</title>
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
        prevText: '���� ��',
        nextText: '���� ��',
        monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
        monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
        dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
        dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
        dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
        showMonthAfterYear: true,
        yearSuffix: '��'
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
			//Form ��ȿ�� ����
		 	/* var name = document.detailForm.prodName.value;
			var detail = document.detailForm.prodDetail.value;
			var manuDate = document.detailForm.manuDate.value;
			var price = document.detailForm.price.value; */
			
			var prodName=$("input[name='prodName']").val();
			var prodDetail=$("input[name='prodDetail']").val();
			var manuDate =$("input[name='manuDate']").val();
			var price =$("input[name='price']").val();
			
			if(prodName == null || prodName.length<1){
				alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(prodDetail == null || prodDetail.length<1){
				alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(manuDate == null || manuDate.length<1){
				alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(price == null || price.length<1){
				alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
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
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			$( "input[name='manuDate']").datepicker( {dateFormat: 'yy-mm-dd'} );

		});	
		
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "button.btn.btn-primary" ).on("click" , function() {
				
				fncAddProduct();
			});
		});	
		
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "a.btn.btn-primary" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('���')" ).html() );
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
	
	<h1 class="bg-primary text-center">�� ǰ �� ��</h1>
	
	
	
		<div class="form-group">		
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label text-center">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" name="prodName" class="form-control" placeholder="��ǰ���� �Է��ϼ���."/>
		       <span id="helpBlock" class="help-block">		      	
		      </span>
		    </div>
		</div>
		    
		    <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label text-center">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" name="prodDetail" class="form-control" placeholder="��ǰ�������� �Է��ϼ���."/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label text-center">��������</label>
		    <div class="col-sm-4">
		      <input type="text" name="manuDate" readonly="readonly" class="form-control" placeholder="�������ڸ� �Է��ϼ���."/>
		    </div>
		  </div>
		  		  	  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label text-center">�� ��</label>
		    <div class="col-sm-4">
		      <input type="text" name="price" 	class="form-control" placeholder="������ �Է��ϼ���.">
		      <span id="helpBlock" class="help-block">		      	 
		      </span>
		    </div>
		 </div>
		    
		  <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label text-center">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input type="file" name="uploadFile" class="form-control" placeholder="��ǰ�̹����� ����ϼ���."/>
		    </div>
		  </div>
		  
		  		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
	
	</form>
</body>
</html>