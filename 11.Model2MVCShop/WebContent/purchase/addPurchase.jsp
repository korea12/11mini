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
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		$( "input[name='divyDate']").datepicker( {dateFormat: 'yy-mm-dd'} );
	
	});
	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "button.btn.btn-primary" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('Ȯ��')" ).html() );
			 fncAddPurchase();
		});
		
		 $( "a.btn.btn-primary" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�߰����')" ).html() );
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
	       <h3 class=" text-info">��ǰ����ȸ</h3>	       
   </div>
	
	
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
	</div>
		
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
	</div>		
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
	</div>
		
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
	</div>
		
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
	</div>
		
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
	</div>
		
	<hr/>	  	
	
	<div class="row">	
		   <div class="col-xs-4 col-md-2 "><strong>�����ھ��̵�</strong></div>
		    <div class="col-xs-8 col-md-4">  
			${user.userId}
		    </div>		    
		    <input type="hidden" name="buyerId" value="${user.userId}" />
	</div>		
	
	<hr/>
	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>���Ź��</strong></div>
		    <div class="col-xs-8 col-md-4">  
		    	<select	name="paymentOption"		class="ct_input_g" 
								style="width: 100px; height: 19px" >
					<option value="1" selected="selected">���ݱ���</option>
					<option value="2">�ſ뱸��</option>
				</select>
		    </div>		    
	</div>
	 
	<hr/>
	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>�������̸�</strong></div>
		   <div class="col-xs-8 col-md-4">  
		    <input type="text" name="receiverName" class="form-control" value="${user.userName}" placeholder="������ �̸��� �Է��ϼ���."/>
		   </div>		
		    
	</div>	
	
	<hr/>	  	
	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>�����ڿ���ó</strong></div>
		   <div class="col-xs-8 col-md-4">  
		    <input type="text" name="receiverPhone" class="form-control" value="${user.phone}" placeholder="����ó�� �Է��ϼ���."/>
		   </div>		
  	</div>
	
	<hr/>	  	
	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>�������ּ�</strong></div>
		   <div class="col-xs-8 col-md-4">  
		    <input type="text" name="divyAddr" class="form-control" value="${user.addr}" placeholder="�ּҸ� �Է��ϼ���."/>
		   </div>		
  	</div>
	
	<hr/>  	
	
	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>���ſ�û����</strong></div>
		   <div class="col-xs-8 col-md-4">  
		    <input type="text" name="divyRequest" class="form-control" placeholder="��û������ �Է��ϼ���."/>
		   </div>		
  	</div>
	
	<hr/>
	
	  	
	<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>����������</strong></div>
		   <div class="col-xs-8 col-md-4">  
		    <input type="text" name="divyDate" readonly="readonly" class="form-control" placeholder="���������ڸ� �Է��ϼ���."/>
		   </div>		
  	</div>
	
	<hr/>

	<div class="row">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >����</button>
			  <a class="btn btn-primary" href="#" role="button">���</a>
		    </div>
	</div>
	</form>	
</div>	
</body>
</html>	
		
	
	