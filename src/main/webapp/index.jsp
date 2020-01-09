<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<script type="text/javascript"src="js/jquery.js"></script>
<script type="text/javascript">
    $(function(){
        setTimeout(function () {
            $("span").text("");
        },3000);
    });
</script>
<style>
    div{
        margin: 0 auto;
        width: 450px;
    }
    table{
        width: 450px;
        text-align: center;
        border-collapse: collapse;
        height: 220px;
    }
    span{
        color: red;
    }
    .good{
        background-color: orangered;
    }
</style>
<body>
<div>
<form  action="<%=basePath%>login.do">
        <table border="1" cellpadding="0" cellspacing="0">

      <tr>
              <td colspan="2">  <h2 >登陆图书管理系统</h2></td>
      </tr>
      <tr>
              <td  class="good"> <label >登录名：</label></td>
              <td><input id="name" type="text" name="name" placeholder="请输入用户名" required/></td>
      </tr>
       <tr>
               <td class="good"><label  >密码：</label></td>
               <td><input id="password" type="password" name="password" placeholder="请输入密码" required/></td>
        </tr>


       <tr>
               <td colspan="2"> <input type="submit" value="登录" /> </td>

       </tr>

            <tr>
                <td colspan="2"> <span>${sessionScope.info}</span> </td>

            </tr>






        </table>
</form>

</div>
</body>


</html>
