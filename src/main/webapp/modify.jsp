<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/13
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>修改书本信息</title>
</head>
<style>
    div{
        width: 500px;
        margin: 0 auto;
        border: black 1px solid ;
        text-align: center;
    }
    table{
        width: 500px;
        text-align: center;
        border-collapse: collapse;
        height: 220px;
    }

    .a{
        font-family: "宋体";
        font-size: 30px;

    }
    #title{
        background-color: FFFFCC;
    }
    .span{
        color: red;
    }
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    function back(){
        location.href="<%=basePath%>selectall.do";
    }
    $(function(){
        $("#id").val("${oneBook.id}");
        $("#name").val("${oneBook.name}");
        $("#author").val("${oneBook.author}");
        $("#publish").val("${oneBook.publish}");
        $("#publishdate").val("<fmt:formatDate value="${oneBook.publishdate}" pattern="yyyy-MM-dd"/>");
        $("#page").val("${oneBook.page}");
        $("#price").val("${oneBook.price}");
        $("#content").val("${oneBook.content}");

    });
</script>
<body>
<div>
    <form action="<%=basePath%>update.do" method="post">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr class="font"><td colspan="8" id="title"> <span class="a">编辑图书</span></td>
            </tr>
            <tr >
                <td>书名<span class="span">(*)</span></td>
                <td><input type="text" name="name" id="name" required></td>
                <td><input type="hidden" name="id"  id="id"></td>
            </tr>
            <tr >
                <td>作者<span class="span">(*)</span></td>
                <td><input type="text" id="author" name="author" required></td>
            </tr>
            <tr >
                <td>出版社<span class="span">(*)</span></td>
                <td><input type="text" id="publish" name="publish" required></td>
            </tr>
            <tr >
                <td>出版日期<span class="span">(*)</span></td>
                <td><input type="text" id="publishdate" name="publishdate" required></td>
            </tr>
            <tr >
                <td>页数</td>
                <td><input type="text" id="page" name="page"></td>
            </tr>
            <tr >
                <td>价格</td>
                <td><input type="text" id="price" name="price"></td>
            </tr>
            <tr >
                <td>内容摘要</td>
                <td><textarea id="content" name="content"></textarea></td>
            </tr>

        </table>
        <td><input type="submit"></td>
        <td><input type="button" onclick="back()" value="返回"></td>
    </form>
</div>
</body>
</html>
