<%@page import="com.model2.mvc.service.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html lang="ko">
<head>
	<meta charset="EUC-KR">
	<title>��ǰ �����ȸ</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
  	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        .thumbnail img {
        	width: 300px;
        	height: 300px;
        }
    </style>
    
    <script>

		$(window).scroll(function() { 
			$('#banner').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 500});
		}); 

  
	</script>    
    
	<style type="text/css">

	body {font-size:11pt; padding:0; margin:0;}
	h3 {color: #85144b; font-size: 14pt;}

	.contents {width: 800px; margin: 0 auto; height: auto; background-color: #e0e0e0; padding: 20px;}
	.contents img {float: left; padding: 30px;}	

	#banner { position: absolute; font-size: 8pt; top: 5px; left: 0; z-index: 10; background:#f1f1f1; padding:5px; border:1px solid #CCCCCC; text-align:center;}
	#banner > span {margin-bottom: 10px; display: block;}
	.banner_contents {min-height: 200px; background-color: #c0c0c0; padding: 5px;}


	</style>
	
	
	<script type="text/javascript">
	
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
	   	//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
	}
	//===========================================//
	//==> �߰��Ⱥκ� : "�˻�" ,  userId link  Event ���� �� ó��
	 $(function() {
		 
		//==> �˻� Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
		 $( "button.btn.btn-default" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
			fncGetList(1);
		});
		
		 $( "#priceSearch" ).on("change" , function() {
			fncGetList(1);
		});
		//==> userId LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1.
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
		$( "div.caption" ).on("click" , function() {
				var prodNo = $(this).data('param1');
				
				self.location ="/product/getProduct?prodNo="+prodNo+"&menu=${param.menu}";
				
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
</head>

<body>
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
<div style="width:98%; margin-left:10px;">

<%-- <form name="detailForm" action="/product/listProduct?menu=${param.menu} %>" method="post"> --%>
<form name="detailForm" class="form-horizontal">
<input type="hidden" id="menu" name="menu" value="search"/>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<div class="page-header text-info">
	       	<h3>��ǰ �����ȸ</h3>
							
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		  	<td align="left">
			<select id="priceSearch" name = "priceSearch" class="ct_input_g" style="width:100px">
				<option value="0" ${ !empty search.priceSearch && search.priceSearch=='0' ? "selected" : ""} >��ǰ������</option>
				<option value="1" ${ !empty search.priceSearch && search.priceSearch=='1' ? "selected" : ""}>�������ݼ�</option>
				<option value="2" ${ !empty search.priceSearch && search.priceSearch=='2' ? "selected" : ""}>�������ݼ�</option>
				<option value="3" ${ !empty search.priceSearch && search.priceSearch=='3' ? "selected" : ""}>�Ż�ǰ��</option>
				<option value="4" ${ !empty search.priceSearch && search.priceSearch=='4' ? "selected" : ""}>�����Ȼ�ǰ��</option>				
				
			</select>			
							
			</td>
		    </div>
		    <div class="col-md-3"></div>
		    
		    <div class="col-md-3 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>����</option>						
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
				<div style="position:relative;float:right;width:10px;top:-15px;right:0px;">
			    	<div id ="banner">
			    		<span>�ֱ� �� ��ǰ</span>
			    		<div id="" class="banner_contents">    		  
			  				<div class="col-xs-6 col-md-3">
			 		  		 <a href="#" class="thumbnail">
			   		  			 <img src="/images/uploadFiles/${product.fileName}" alt="...">
			   		  			 <span>${product.prodName}</span>
			  					  </a>
			  				 </div>
			    			</div>
			    		</div>
    			</div>    
				</div>
	    	
		</div>
		 <c:set var="i" value="0" />
	<div class="row">
	<c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
		
 			 <div class="col-sm-6 col-md-4">
   			 <div class="thumbnail">
    		  <img src="/images/uploadFiles/${product.fileName}" alt="...">
    		  <div class="caption" data-param1="${product.prodNo}" data-photo="${product.fileName}" data-param2="${product.prodDetail}">
     		   <h3>${product.prodName}</h3>
      		  <p>${product.prodDetail}</p>
     		   <p><a href="#" class="btn btn-primary" role="button">�󼼺���</a>
     		   <span class="btn btn-default" role="button">
						<c:choose>
							<c:when test="${product.proTranCode==null}">
								�Ǹ���
							</c:when>
							<c:otherwise>
								������
							</c:otherwise>
						</c:choose>					
			   </span></p>
     		 </div>
   		 	</div>
 		 	</div>
		
	</c:forEach>
	</div>		
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	</form>
</div>
</body>

</html>
