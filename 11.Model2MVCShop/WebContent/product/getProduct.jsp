<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
<%
	Product product = (Product)request.getAttribute("product");
	String menu = request.getParameter("menu");
	User vo = (User) session.getAttribute("user");

	String role = "";

	if (vo != null) {
		role = vo.getRole();
	}
%>	
--%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>��ǰ����ȸ</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <style>
 		body {
            padding-top : 50px;
        }
     </style>
     
	<script type="text/javascript">	
	$( function(){
		/* console.log("���� �����丮: "+history.go(-1)); */
		console.log("abvc254");
		$("td.ct_btn01:contains('Ȯ��')").on("click", function(){
			var prodNo = $(this).data('param1');
			console.log("abvc");
			self.location="/product/listProduct?menu=manage&prodNo="+prodNo;
		});
		
		$("#buy").on("click", function(){
			var tranCode =$(this).data('param2')
			var prodNo = $(this).data('param1');	
			if(${user.role eq 'admin' || user.role eq 'user'}){
									
					self.location="/purchase/addPurchase?prodNo="+prodNo;		
			}else{
				alert("�α����ϼ���")
				self.location="/user/loginView.jsp";
			}
			
		});
		/* 
		$('#none').on("click", function(){
			alert("�α����ϼ���")
			self.location="/user/loginView.jsp";
		}); */
		
		$("#back").on("click", function(){
			
			history.go(-1);
		})
		
		$("#ok").on("click", function(){
			var prodNo = $(this).data('param1');
			self.location="/product/listProduct?menu=manage&prodNo="+prodNo;
		})
	});
	</script>
</head>
	
<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ������ȸ</h3>
	       <h5 class="text-muted">��ǰ ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
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
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${product.fileName}" width="200px" height="200px"/></div>
			
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
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
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-right" id="key">
	  			<c:choose>
	  				<c:when test="${user.role=='admin'}">
	  					<button type="button" class="btn btn-primary" id="ok" data-param1="${product.prodNo}">Ȯ��</button>
	  				</c:when>
	  				<c:otherwise>
	  					<button type="button" class="btn btn-primary" id="buy" data-param1="${product.prodNo}" data-param2="${purchase.tranCode}">����</button>
	  				</c:otherwise>
	  			</c:choose>
	  			<button type="button" class="btn btn-primary" id="back">����</button>
	  		</div>
	  	</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html><%-- 
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
				<td width="20%" align="right">&nbsp;</td>
			</tr>
		</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%=product.getProdNo() %></td>
		<td class = "ct_write01">${product.prodNo}</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%=product.getProdName() %></td>
		<td class="ct_write01">${product.prodName}</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">��ǰ�̹���</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%=product.getFileName() %></td>
		<td class="ct_write01">
			<img src="/images/uploadFiles/${product.fileName}" width="200px" height="200px"/>
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">��ǰ������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%=product.getProdDetail() %>	</td>
		<td class="ct_write01">${product.prodDetail}</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�������� </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%=product.getManuDate() %></td>
		<td class="ct_write01">${product.manuDate}</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%=product.getPrice() %></td>
		<td class="ct_write01">${product.price}</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%=product.getRegDate()%></td>
		<td class="ct_write01">${product.regDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					
					<% if(menu.equals("manage")){ %>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="/listProduct.do?menu=manage&prod_no=<%=product.getProdNo()%>">Ȯ��</a>
					<%}else{ %>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="/addPurchaseView.do?&prod_no=<%=product.getProdNo()%>">����</a>
					<%} %>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="cursor:pointer" style="padding-top: 3px;" data-param1="${product.prodNo}">
					<c:choose>
						<c:when test= "${param.menu == 'manage'}">
							<a href="/product/listProduct?menu=manage&prodNo=${product.prodNo}">Ȯ��</a>
							Ȯ��
						</c:when>
					
						<c:when test= "${param.menu == 'search'}">
							<c:choose>
								<c:when test= "${user.role eq 'admin' || user.role eq 'user'}">
									<a href="/purchase/addPurchase?&prodNo=${product.prodNo}">����</a>
									����
								</c:when>
								<c:otherwise>
									<span id='none'>����</span>					
								</c:otherwise>
							</c:choose>
							����
						</c:when>
						<c:otherwise>
							����
						</c:otherwise>
					</c:choose>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="cursor:pointer" style="padding-top:3px;">
						<!-- <a href="javascript:history.go(-1);">����</a> -->
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</body>
</html> --%>