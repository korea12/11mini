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
<title>상품상세조회</title>
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
		/* console.log("이전 히스토리: "+history.go(-1)); */
		console.log("abvc254");
		$("td.ct_btn01:contains('확인')").on("click", function(){
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
				alert("로그인하세용")
				self.location="/user/loginView.jsp";
			}
			
		});
		/* 
		$('#none').on("click", function(){
			alert("로그인하세용")
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
	       <h3 class=" text-info">상품정보조회</h3>
	       <h5 class="text-muted">상품 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${product.fileName}" width="200px" height="200px"/></div>
			
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-right" id="key">
	  			<c:choose>
	  				<c:when test="${user.role=='admin'}">
	  					<button type="button" class="btn btn-primary" id="ok" data-param1="${product.prodNo}">확인</button>
	  				</c:when>
	  				<c:otherwise>
	  					<button type="button" class="btn btn-primary" id="buy" data-param1="${product.prodNo}" data-param2="${purchase.tranCode}">구매</button>
	  				</c:otherwise>
	  			</c:choose>
	  			<button type="button" class="btn btn-primary" id="back">이전</button>
	  		</div>
	  	</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

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
				<td width="93%" class="ct_ttl01">상품상세조회</td>
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
			상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
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
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%=product.getProdName() %></td>
		<td class="ct_write01">${product.prodName}</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">상품이미지</td>
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
		<td width="104" class="ct_write">상품상세정보</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%=product.getProdDetail() %>	</td>
		<td class="ct_write01">${product.prodDetail}</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">제조일자 </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%=product.getManuDate() %></td>
		<td class="ct_write01">${product.manuDate}</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">가격</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%=product.getPrice() %></td>
		<td class="ct_write01">${product.price}</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">등록일자</td>
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
						<a href="/listProduct.do?menu=manage&prod_no=<%=product.getProdNo()%>">확인</a>
					<%}else{ %>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="/addPurchaseView.do?&prod_no=<%=product.getProdNo()%>">구매</a>
					<%} %>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="cursor:pointer" style="padding-top: 3px;" data-param1="${product.prodNo}">
					<c:choose>
						<c:when test= "${param.menu == 'manage'}">
							<a href="/product/listProduct?menu=manage&prodNo=${product.prodNo}">확인</a>
							확인
						</c:when>
					
						<c:when test= "${param.menu == 'search'}">
							<c:choose>
								<c:when test= "${user.role eq 'admin' || user.role eq 'user'}">
									<a href="/purchase/addPurchase?&prodNo=${product.prodNo}">구매</a>
									구매
								</c:when>
								<c:otherwise>
									<span id='none'>구매</span>					
								</c:otherwise>
							</c:choose>
							구매
						</c:when>
						<c:otherwise>
							구매
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
						<!-- <a href="javascript:history.go(-1);">이전</a> -->
						이전
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