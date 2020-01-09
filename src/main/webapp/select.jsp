<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/13
  Time: 12:06
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
    <style>
        div{
            width: 900px;
            margin: 0 auto;
        }
        table{
            width: 900px;
            text-align: center;
            border-collapse: collapse;
            height: 220px;
        }
        .p{
            font-family: "宋体";
            font-size: 20px;
        }
        .span{
            font-family: "宋体";
            font-size: 30px;

        }
        #title{
            background-color: #FFFFCC;
        }
    </style>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        function find(){
            var author=$('#author').val();
            location.href="<%=basePath%>selectall.do?author="+author;
        }
        $(function () {
            $("#author").val("${sessionScope.author}");
        });
    </script>
    <title>图书管理系统</title>
</head>
<body>
<div>
    <p class="p">图书管理系统欢迎您</p>
    <form action="selectall.do" method="post">
    <input type="text" name="author" id="author" placeholder="请输入作者名方便查找">
    <input type="button" value="查询" onclick="find()" >
    <table border="1" cellpadding="0" cellspacing="0">
        <tr class="font"><td colspan="8" id="title"> <span class="span">图书详情信息列表</span></td>
        </tr>
        <tr >
            <th >书名</th>
            <th >作者</th>
            <th >出版社</th>
            <th >出版日期</th>
            <th >页数</th>
            <th >价格</th>
            <th >内容摘要</th>
            <th >操作</th>
        </tr>
        <c:forEach var ="c" items="${pager.list}">
            <tr>
                <td>${c.name}</td>
                <td>${c.author}</td>
                <td>${c.publish}</td>
                <td><fmt:formatDate value="${c.publishdate}" pattern="yyyy-MM-dd"/></td>
                <td>${c.page}</td>
                <td>${c.price}</td>
                <td>${c.content}</td>
                <td>
                    <a href="<%=basePath%>modifly.do?id=${c.id}">修改</a>
                    <a href="<%=basePath%>del.do?id=${c.id}" >删除</a>
                </td>
            </tr>
        </c:forEach>

    </table>
    <input type="hidden" value="${pager.currPageNo}" name="currPageNo">
    <input type="hidden" value="${pager.pageSize}" name="pageSize">
    <c:if test="${not empty requestScope.pager.list }">
        <jsp:include page="/common/page.jsp">
            <jsp:param value="${requestScope.pager.currPageNo }" name="currPageNo" />
            <jsp:param value="${requestScope.pager.pageSize }" name="pageSize" />
            <jsp:param value="${requestScope.pager.totalPageCount }" name="totalPageCount"/>
            <jsp:param value="${requestScope.pager.totalCount }" name="totalCount"/>
        </jsp:include>
    </c:if>
    </form>
</div>
</body>
</html>
