<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%
	List<Purchase> list= (List<Purchase>)request.getAttribute("list");
Page resultPage=(Page)request.getAttribute("resultPage");
	Search search=(Search)request.getAttribute("search");	
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	String menu = request.getParameter("menu");
	
	
	
%> --%>
<html>
<head>
	<meta charset="EUC-KR">
<title>구매 목록조회</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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

function fncGetList(currentPage){
	/* document.getElementById("currentPage").value = currentPage; */
	$("#currentPage").val(currentPage)
	/* document.detailForm.submit(); */
	$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
} 

$(function() {
	
	$(".deli td:nth-child(1)").on("click", function(){
		var tranNo = $(this).data('param1');
		console.log("아아아");
		self.location = "/purchase/getPurchase?tranNo="+tranNo;
	});
	$(".deli td:nth-child(2)").on("click", function(){
		var userId = $(this).data('param2');
		console.log("아아아");
		self.location = "/user/getUser?userId="+userId;
	});
	
	$('#delivery').on("click" , function(){
		var tranNo = $(this).data('param1');
		self.location ="/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=3";
	});
	
	$( ".deli td:nth-child(6)" ).css("color" , "#f37735");
	$("h7").css("color" , "	#f37735");
});


</script>
</head>

<body>

	<div class="navbar  navbar-default">
		<div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
 <div style="width: 98%; margin-left: 10px;">
<form name="detailForm">
<input type="hidden" id="menu" name="menu" value="search"/>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<div class="page-header text-info">
	       	<h3>구매 목록조회</h3>
							
	    </div>

 	<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
		    </div>
	</div>
	<table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >회원ID</th>
            <th align="left">회원명</th>
            <th align="left">전화번호</th>
            <th align="left">배송현황</th>
            <th align="left">정보수정</th>
          </tr>
        </thead>
	 <tbody>
	 
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${i+1}"/>
		
	   <tr class="deli">
		
	
		<td align="center" data-param1="${purchase.tranNo }" style="cursor:pointer">
			<%--<a href="/getPurchase.do?tranNo=<%=purchase.getTranNo()%>"><%=purchase.getTranNo()%></a> --%>
			<%-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${purchase.tranNo}</a> --%>
			${purchase.tranNo}
		</td>		
		<td align="left" data-param2="${user.userId}" style="cursor:pointer">
			<%--<a href="/getUser.do?userId=<%=purchase.getBuyer().getUserId()%>"><%=purchase.getBuyer().getUserId()%></a> --%>
			<%-- <a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a> --%>
			${purchase.buyer.userId}
		</td>		
		<%--<td align="left"><%=purchase.getReceiverName()%></td> --%>
		<td align="left">${purchase.receiverName }</td>		
		<%--<td align="left"><%=purchase.getReceiverPhone()%></td> --%>
		<td align="left">${purchase.receiverPhone}</td>		
		<%-- <td align="left"><%if(purchase.getTranCode().trim().equals("1")){ %>
							현재 구매완료 상태입니다.
						 <%}else if(purchase.getTranCode().trim().equals("2")){ %>
							현재 배송중 상태입니다.
						 <%}else if(purchase.getTranCode().trim().equals("3")){ %>
							현재 배송완료 상태입니다.
						 <%} %>
		</td> --%>
		<td align="left"><c:if test = "${fn:trim(purchase.tranCode)=='1'}">
							현재 구매완료 상태입니다.
						</c:if>
						<c:if test = "${fn:trim(purchase.tranCode)=='2'}">
							현재 배송중 상태입니다.
						</c:if>
						<c:if test = "${fn:trim(purchase.tranCode)=='3'}">
							현재 배송완료 상태입니다.
						</c:if>
		</td>		
		<td align="left" >
			<%-- <%if(purchase.getTranCode().trim().equals("2")) {%>
				<a href="/updateTranCode.do?tranNo=<%=purchase.getTranNo()%>&tranCode=3">물건도착</a>
			<%} %> --%>
			<c:choose>
			<c:when test = "${fn:trim(purchase.tranCode) == '2'}">
			<%-- <a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=3">물건도착</a> --%>
				<span id="delivery" data-param1="${purchase.tranNo}" style="cursor:pointer">물건도착</span>
			</c:when>
			</c:choose>
		</td>		
	</tr>
	
	<%-- <%
		}
		
	%>	 --%>
	</c:forEach>
	</tbody>
   </table>
   
  </div>
  <jsp:include page="/history.jsp" />
		<jsp:include page="../common/pageNavigator_new.jsp"/>	
    	</form>
</div>
</body>

</html>
