<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'page.jsp' starting page</title>
	<style type="text/css">
	#pagination{
	width:900px;
	margin:0 auto;
	text-align:center;
	height:30px;
	line-height:30px;
	}
	.bt{
		width:25px;
		heigth:30px;
		background-color:black;
		color:white;
		border:none;
		border-radius:5px 
	}
	#ins{
		width:70px;
		heigth:33px;
		background-color:black;
		color:white;
		border:none;
		border-radius:5px
	}
	#no{
		width:50px;
	}
	#ps{
		width:50px;
	}
	</style>
	<script type="text/javascript">
	function jumpPage(pageNo){
		$("input:hidden").eq(0).val(pageNo);
		$('form').submit();
	}
	function changePageSize(){
		var pageSize=$("#ps").val();
		$("input:hidden").eq(1).val(pageSize);
		$('form').submit();
	}
	function insert(){
		location.href="insert.jsp";
	}
	$(function(){
		$("#go").click(function(){
			$("input:hidden").eq(0).val($('#no').val());
			var p=$("#no").val();
			var par=Number($("#tpc").val());
			var c=/^-?[1-9]\d*$/;
			var fl=c.test(p);
			if(p.length==0){
				alert("输入为空~");
			}else{
				if(fl==false){
					alert("输入的数字格式有误~");
			}else{
					if(p<1||p>par){
						alert("输入的数字越界，请重试");
					}else{
						$('form').submit();
					}
				}
			}
		});
	});
	</script>
  </head>

  <body>
  	<div id="pagination">
  		<input type="button" value="新增图书" onclick="insert()" id="ins">　　共${param.totalCount }条记录　　 每页<input type="text" id="ps" onchange="changePageSize()" value="${param.pageSize}"/>条　　　
  		<c:if test="${param.currPageNo eq 1 }">
  			首页
  			上一页
  		</c:if>
  		<c:if test="${param.currPageNo gt 1 }">
  			<a href="javascript:jumpPage(1)">首页</a>
  			<a href="javascript:jumpPage(${param.currPageNo - 1 })">上一页</a>
  		</c:if>
  		<c:if test="${param.currPageNo eq param.totalPageCount }">
  			下一页
  			尾页
  		</c:if>
  		<c:if test="${param.currPageNo lt param.totalPageCount }">
  			<a href="javascript:jumpPage(${param.currPageNo+1 })">下一页</a>
  			<a href="javascript:jumpPage(${param.totalPageCount })">尾页</a>
  		</c:if>
  		第<input type="button" readonly="readonly" value="${param.currPageNo }" class="bt" id="cur"/>页/共<input type="button" readonly="readonly" value="${param.totalPageCount }" class="bt" id="tpc"/>页　　　
  		跳转至  <input type="text" id="no"/> 页 <input type="button" id="go" value="GO" class="bt"/>
  	</div>
  </body>
</html>
