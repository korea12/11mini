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
		$( "span.btn.btn-primary" ).on("click" , function() {
				var prodNo = $(this).data('param1');
				var tranCode = $(this).data('param3');
				console.log('Ʈ���ڵ��?'+tranCode);
				if(tranCode == ''){					
					self.location ="/product/getProduct?prodNo="+prodNo+"&menu=${param.menu}";					
				}else{				
					alert("���԰� �����Դϴ�.")
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
	       	<h3>��ǰ �����ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
		    <form name="detailForm" class="form-inline">
		   		<input type="hidden" id="menu" name="menu" value="search"/>
			    <div class="col-md-6 text-left">
			    	<p class="text-primary">
			    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
			    	</p>
				  	<div align="left">
						<select id="priceSearch" name = "priceSearch" class="form-control" style="width:130px">
							<option value="0" ${ !empty search.priceSearch && search.priceSearch=='0' ? "selected" : ""} >��ǰ������</option>
							<option value="1" ${ !empty search.priceSearch && search.priceSearch=='1' ? "selected" : ""}>�������ݼ�</option>
							<option value="2" ${ !empty search.priceSearch && search.priceSearch=='2' ? "selected" : ""}>�������ݼ�</option>
							<option value="3" ${ !empty search.priceSearch && search.priceSearch=='3' ? "selected" : ""}>�Ż�ǰ��</option>
							<option value="4" ${ !empty search.priceSearch && search.priceSearch=='4' ? "selected" : ""}>�����Ȼ�ǰ��</option>				
						</select>			
					</div>
			    </div>
			    
			    <div class="col-md-2"></div>
			    
			    <div class="col-md-4 text-right">
				    <div class="col-md-5">
						  <div class="form-group">
						    <select class="form-control" name="searchCondition" >
								<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
								<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
								<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>����</option>						
							</select>
						  </div>
					 </div>
					 
					  <div class="col-md-5">
						  <div class="form-group">
						    <label class="sr-only" for="searchKeyword">�˻���</label>
						    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
						    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
						  </div>
					  </div>
					  
					  <div class="col-md-1">
					  	<button type="button" class="btn btn-default">�˻�</button>
					  </div>
					  
					  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
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
     		    data-param2="${product.prodDetail}" data-param3="${product.proTranCode}">�󼼺���</span>
     		   <span class="btn btn-default" role="button" >
						<c:choose>
							<c:when test="${product.proTranCode==null}" >
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
	  
 	
 	<jsp:include page="/history.jsp" />
	
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</div>
</body>

</html>
