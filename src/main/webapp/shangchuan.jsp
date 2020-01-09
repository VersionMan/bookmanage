<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/14
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="upload_box">
<b>上传图片</b>
<img id="imghead"src="tupian/Headportrait.png"width="50"height="50" />
<input type="file"name="file"id="file"  value="请选择头像" accept="image/*" onchange="imgChange(this); "/> <!--文件上传选择按钮-->
<div id="preview">

</div>
</div>

<script type="text/javascript">
// 选择图片显示
function imgChange(obj) {
//获取点击的文本框
var file =document.getElementById("file");
var imgUrl =window.URL.createObjectURL(file.files[0]);
var img =document.getElementById('imghead');
img.setAttribute('src',imgUrl); // 修改img标签src属性值
};
</script>
</body>
</html>
