<%@page import="com.model2.mvc.service.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html lang="ko">
<head>
	<meta charset="EUC-KR">
	<title>상품 목록조회</title>
	
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
    </style>
	<script type="text/javascript">
	
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
	   	//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
	}
	//===========================================//
	//==> 추가된부분 : "검색" ,  userId link  Event 연결 및 처리
	 $(function() {
		 
		//==> 검색 Event 연결처리부분
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
		 $( "button.btn.btn-default" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
			fncGetList(1);
		});
		
		 $( "#priceSearch" ).on("change" , function() {
			fncGetList(1);
		});
		//==> userId LINK Event 연결처리
		//==> DOM Object GET 3가지 방법 ==> 1.
		//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
		$( "td:nth-child(2)" ).on("click" , function() {
				var prodNo = $(this).data('param1');
												
				if(${param.menu == 'search'}){					
					self.location ="/product/getProduct?prodNo="+prodNo+"&menu=${param.menu}";
				}else if(${param.menu == 'manage'}){					
					self.location ="/product/updateProduct?prodNo="+prodNo+"&menu=${param.menu}";
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
		
		$( 'span.deli.btn' ).css("color" , "#f37735");
		$("h7").css("color" , "	#f37735");
		
		$( "td:nth-child(2)" ).css("color" , "	#f37735");
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
<!-- <form name="detailForm" class="form-horizontal"> -->
<form name="detailForm" class="form-horizontal">
<input type="hidden" id="menu" name="menu" value="${param.menu}"/>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<div class="page-header text-info">	       
				
			<h3>상품 관리</h3>
				
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		  	<td align="left">
			<select id="priceSearch" name = "priceSearch" class="ct_input_g" style="width:130px">
				<option value="0" ${ !empty search.priceSearch && search.priceSearch=='0' ? "selected" : ""} >상품순서별</option>
				<option value="1" ${ !empty search.priceSearch && search.priceSearch=='1' ? "selected" : ""}>낮은가격순</option>
				<option value="2" ${ !empty search.priceSearch && search.priceSearch=='2' ? "selected" : ""}>높은가격순</option>
				<option value="3" ${ !empty search.priceSearch && search.priceSearch=='3' ? "selected" : ""}>신상품순</option>
				<option value="4" ${ !empty search.priceSearch && search.priceSearch=='4' ? "selected" : ""}>오래된상품순</option>				
				
			</select>			
							
			</td>
		    </div>
		    
		    <div class="col-md-2"></div>
		    
		    <div class="col-md-4 text-right">
			    <form class="form-inline" name="detailForm">
			    <div class="col-md-5">
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>가격</option>						
					</select>
				  </div>
				 </div>
				 
				  <div class="col-md-5">
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  </div>
				  
				  <div class="col-md-1">
				  <button type="button" class="btn btn-default">검색</button>
				  </div>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
			
				</div>
		  </div>
			
	   
		
		<table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">현재상태</th>
            
          </tr>
        </thead>
        <tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>			  
			  <td align="left" style="cursor:pointer" data-param1="${product.prodNo}" data-photo="${product.fileName}" data-param2="${product.prodDetail}">
			  	
					<%-- <a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a> --%>
					${product.prodName}			
			</td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.regDate}</td>
				<c:choose>
					<c:when test="${user.role=='admin'}">				
							<c:if test = "${product.proTranCode== null}">
								<td align="left">판매중</td>
							</c:if>
							<c:if test = "${fn:trim(product.proTranCode)=='1'}">
								<td align="left">구매완료
								<c:if test="${param.menu=='manage'}">
									<%-- <a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2"> --%>
									<span id='delivery' class="deli btn" style="cursor:pointer" data-param1="${product.prodNo}" >배송하기</span>
								</c:if>
								</td>
							</c:if>
							<c:if test="${fn:trim(product.proTranCode)=='2'}">
								<td align="left">배송중</td>
							</c:if>
							<c:if test="${fn:trim(product.proTranCode)=='3'}">
								<td align="left">배송완료</td>
							</c:if>				
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${product.proTranCode==null}">
								<td align="left">판매중</td>
							</c:when>
							<c:otherwise>
								<td align="left">재고없음</td>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>	
						  
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	</div>
	</form>
	</div>
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
				<% if(menu.equals("search")) {%>
					<td width="93%" class="ct_ttl01">상품 목록조회</td>
				<%}else if(menu.equals("manage")) {%>
					<td width="93%" class="ct_ttl01">상품 관리</td>
				<%} %>
				<c:if test= "${param.menu == 'search'}">
					<td width="93%" class="ct_ttl01">상품 목록조회</td>
				</c:if>
				<c:if test= "${param.menu == 'manage'}">
					<td width="93%" class="ct_ttl01">상품 관리</td>
				</c:if>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="left">
			<select id="priceSearch" name = "priceSearch" class="ct_input_g" style="width:100px">
				<option value="0" ${ !empty search.priceSearch && search.priceSearch=='0' ? "selected" : ""} >상품순서별</option>
				<option value="1" ${ !empty search.priceSearch && search.priceSearch=='1' ? "selected" : ""}>낮은가격순</option>
				<option value="2" ${ !empty search.priceSearch && search.priceSearch=='2' ? "selected" : ""}>높은가격순</option>
				<option value="3" ${ !empty search.priceSearch && search.priceSearch=='3' ? "selected" : ""}>신상품순</option>
				<option value="4" ${ !empty search.priceSearch && search.priceSearch=='4' ? "selected" : ""}>오래된상품순</option>				
				
			</select>
			
			<select id="newSearch" name="newSearch" class="ct_input_g" style="width:90px">
				<option value="3" ${ !empty search.newSearch && search.newSearch=='3' ? "selected" : ""}>등록일순</option>
				<option value="4" ${ !empty search.newSearch && search.newSearch=='4' ? "selected" : ""}>신상품순</option>
				<option value="5" ${ !empty search.newSearch && search.newSearch=='5' ? "selected" : ""}>오래된상품순</option>
					
			</select>
			<table border="0" cellspacing="0" cellpadding="0">	
		</td>
	</table>	
		
			<td align="right">
			
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>상품번호</option>
				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>상품명</option>
				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>상품가격</option>
				<option value="0" ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>상품번호</option>
				<option value="1" ${ !empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>상품명</option>
				<option value="2" ${ !empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>상품가격</option>
			</select>
			<input type="text" name="searchKeyword" value="<%=searchKeyword %>" class="ct_input_g" style="width:200px; height:19px" />
			<input type="text" name="searchKeyword"
				value = "${! empty search.searchKeyword ? search.searchKeyword : "" }"
				class="ct_input_g" style="width:200px; height:20px" >
		</td>
	
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="cursor:pointer" style="padding-top:3px;">
						<!-- <a href="javascript:fncGetList('1');">검색</a> -->
						검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체 <%= resultPage.getTotalCount()%>건수, 현재 <%=resultPage.getCurrentPage() %> 페이지</td>
		<td colspan="11" >
		전체  ${resultPage.totalCount }건수, 현재 ${resultPage.currentPage}  페이지
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%		
		for(int i=0; i<list.size(); i++) {
			Product product = list.get(i);
	%>
	<c:set var="i" value ="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}"/>	
	<tr class="ct_list_pop">
		<td align="center" style="cursor:pointer">${i}</td>
		<td></td>
		<td align="left" data-param1="${product.prodNo}" style="cursor:pointer" data-photo="${product.fileName}" data-param2="${product.prodDetail}">
		<% if(menu.equals("search")){%>
			<a href="/getProduct.do?prodNo=<%=product.getProdNo()%>&menu=<%=menu%>"><%=product.getProdName()%></a></td>
		<%} else if(menu.equals("manage")){%>
			<a href="/updateProductView.do?prodNo=<%=product.getProdNo()%>&menu=<%=menu%>"><%=product.getProdName()%></a></td>
		<%} %>
		
		<c:if test= "${param.menu == 'search'}">
			<a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>
			${product.prodName}
		</c:if>
		<c:if test= "${param.menu == 'manage'}">
			<a href="/product/updateProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>
			${product.prodName}
		</c:if>
		</td>
		<td></td>
		<td align="left"><%= product.getPrice() %></td>
		<td align="left">${product.price}</td>
		<td></td>
		<td align="left"><%= product.getRegDate() %></td>
		<td align="left" >${product.regDate }</td>
		<td></td>
		<c:choose>
			<c:when test="${user.role=='admin'}">				
					<c:if test = "${product.proTranCode== null}">
						<td align="left">판매중</td>
					</c:if>
					<c:if test = "${fn:trim(product.proTranCode)=='1'}">
						<td align="left">구매완료
						<c:if test="${param.menu=='manage'}">
							<a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2">
							<span id='delivery' style="cursor:pointer" data-param1="${product.prodNo}" >배송하기</span>
						</c:if>
						</td>
					</c:if>
					<c:if test="${fn:trim(product.proTranCode)=='2'}">
						<td align="left">배송중</td>
					</c:if>
					<c:if test="${fn:trim(product.proTranCode)=='3'}">
						<td align="left">배송완료</td>
					</c:if>				
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${product.proTranCode==null}">
						<td align="left">판매중</td>
					</c:when>
					<c:otherwise>
						<td align="left">재고없음</td>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
			
					</td>
		</td>	
	</tr>	
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	<%
		}
	%>	
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		
		<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					◀ 이전
			<% }else{ %>
					<a href="javascript:fncGetList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="javascript:fncGetList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
			<% } %>
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>
 --%>