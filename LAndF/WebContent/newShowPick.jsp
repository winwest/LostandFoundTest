<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>拾取添加</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newShowLost.css" charset="utf-8">
</head>
<body>
	<div class="box">

    <div class="tit">
        <img src="./images/物品.png">
        <p>拾物添加</p>
    </div>

<form action="addPick.jsp" method="post" onsubmit=" return check(this) enctype="multipart/form-data"">
    <div class="content">
        <ul>
            <li><input type="text" name="pick_name" placeholder="拾物名称"></li>
            <li><input type="text" name="pick_place" placeholder="拾物地点"></li>
            <li><input type="date" name="pick_time" placeholder="拾物人时间"></li>
            <li><input type="text" name="pname" placeholder="拾物人姓名"></li>
            <li><input type="text" name="pphone" placeholder="拾物人联系方式"></li>
            <li><input type="text" name="userID" placeholder="管理员ID"></li>
            <li><textarea rows="5" cols="30" name="pick_trait" placeholder="物品备注" style="resize: none"></textarea></li>
            <li>
                <input type="submit" value="添加">
                <a href="newMain.jsp">返回</a>
            </li>
        </ul>
    </div>
</form>
</body>
</html>