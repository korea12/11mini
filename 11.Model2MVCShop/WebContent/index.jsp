<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	function history1(){
		popWin = window.open("/history.jsp",
													"popWin",
													"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}
		//============= ȸ�������� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#']:contains('ȸ������')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= �α��� ȭ���̵� =============
		$( function() {
			//==> �߰��Ⱥκ� : "addUser"  Event ����
			$("a[href='#']:contains('�� �� ��')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		$( function() {
			$("a[href='#']:contains('�ǸŻ�ǰ���')").on("click" , function() {
				self.location = "../product/addProductView.jsp"
			});
		});
		$( function() {
			$("a[href='#']:contains('�ǸŻ�ǰ����')").on("click" , function() {
				self.location = "/product/listProduct?menu=manage"
			});
		});
		$( function() {
			$("a[href='#']:contains('�� ǰ �� ��')").on("click" , function() {				
				self.location = "/product/listProduct?menu=search"			
			});
		});
		$( function() {
			$("a[href='#']:contains('�����̷���ȸ')").on("click" , function() {
				self.location = "/purchase/listPurchase"
			});
		});
		$( function() {
			$("a[href='#']:contains('�ֱٺ���ǰ')").on("click" , function() {
				history1();
			});
		});
		
	</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">Model2 MVC Shop</a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">ȸ������</a></li>
	                 <li><a href="#">�� �� ��</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- �ٴܷ��̾ƿ�  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu ���� Start /////////////////////////////////////-->     	
			<div class="col-md-3">
		        
		       	<!--  ȸ������ ��Ͽ� ���� -->
		       	<c:if test="${sessionScope.user.role == 'admin' && user.role=='user'}">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> ȸ������
         			</div>
         			<!--  ȸ������ ������ -->
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">����������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">ȸ��������ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
		        </c:if>
               
               <c:if test="${sessionScope.user.role == 'admin'}">
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> �ǸŻ�ǰ����
         			</div>         			
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ���</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">�ǸŻ�ǰ����</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
					
		        </div>
               </c:if>
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> ��ǰ����
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">�� ǰ �� ��</a></li>
						 <c:if test="${sessionScope.user.role != null}">
						  <li class="list-group-item">						  
						  	<a href="#">�����̷���ȸ</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li>
						 </c:if> 
						
					</ul>
				</div>
				
			</div>
			<!--  Menu ���� end /////////////////////////////////////-->   

	 	 	<!--  Main start /////////////////////////////////////-->   		
	 	 	<div class="col-md-9">
				<div class="jumbotron">
			  		<h1>Model2 MVC Shop</h1>
			  		<p>�α��� �� ��밡��...</p>
			  		<p>�α��� �� �˻��� �����մϴ�.</p>
			  		<p>ȸ������ �ϼ���.</p>
			  		
			  		<div class="text-center">
			  			<a class="btn btn-info btn-lg" href="#" role="button">ȸ������</a>
			  			<a class="btn btn-info btn-lg" href="#" role="button">�� �� ��</a>
			  		</div>
			  	
			  	</div>
	        </div>
	   	 	<!--  Main end /////////////////////////////////////-->   		
	 	 	
		</div>
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>