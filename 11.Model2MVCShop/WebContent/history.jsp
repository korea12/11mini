

<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>열어본 상품 보기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript">

		$(window).scroll(function() { 
			$('#banner').animate({top:$(window).scrollTop()+200+"px" },{queue: false, duration: 500});
		}); 
		
		$(function() {	 
	 		$('span[name="showProd"]').on("click" , function() {
				var prodNo = $(this).data("param1");
				$(frames.location).attr("href","/product/getProduct?prodNo="+prodNo+"&menu=search");
			});
	 		
	 		
		});

  
	</script>    
    
	<style type="text/css">
	.thumbnail1 img {
        	width: 100px;
        	height: 100px;
        }
        .thumbnail img {
        	width: 300px;
        	height: 300px;
        }
	body {position:relative;font-size:11pt; padding:50px; margin:0;}
	h3 {color: #85144b; font-size: 14pt;}

	.contents {width: 800px; margin: 0 auto; height: auto; background-color: #e0e0e0; padding: 20px;}
	.contents img {float: left; padding: 30px;}	

	#banner { position: absolute;  font-size: 8pt; top:500px; width:150px; right:100px;  z-index: 10; background:#f1f1f1; padding:5px; border:1px solid #CCCCCC; text-align:center;}
	#banner > span {margin-bottom: 10px; display: block;}
	

	</style>
</head>
<body>
<br/>
<br/>
<div id ="banner">
<span>최근 본 상품</span>
			    		<div id="" class="banner_contents">    		  
			  				<div class="col-xs-6 col-md-3">
			  				 
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String history = null;
	Cookie[] cookies = request.getCookies();
	if (cookies!=null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookie.getName().equals("history")) {
				history = cookie.getValue();
			}
		}
		System.out.println("jsp history: "+history);
		if (history != null) {
			String[] h = history.split(",");
			for (int i = 0; i < h.length; i++) {
				if (!h[i].equals("null")) {
%>
<%-- <a href="/getProduct.do?prodNo=<%=h[i]%>&menu=search"
	target="rightFrame"><%=h[i]%></a> --%>
	
	
		
			    		
			 		  			<a href="#" class="thumbnail1">
			   		  			 <%-- <img src="/images/uploadFiles/<%= h[i].split("@")[1] %>"  name="showProd" data-param1="<%= h[i].split("@")[0] %> alt="..."> --%>
			   		  			 <span name="showProd" data-param1="<%= h[i].split("@")[0] %>" style="cursor:pointer"><img src="/images/uploadFiles/<%=h[i].split("@")[1]%>"></span>
			  					 </a>
			  					  <!-- </a>
			  				
<br> -->
<%
	
				}
			}
		}
	}
%>

			  				
<br>
 </div>
			    			</div>
	
</div>
</body>
</html>