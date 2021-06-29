<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="../js/jquery.ztree.core.min.js"></script>

<title>修改密码</title>
</head>
<body>
<div style="padding-left: 500px;padding-top: 50px">
<form action="${pageContext.request.contextPath}/mmxg_Servlet" method="post" onsubmit="return xgmm()">
<label>原始密码：</label><input type="text" class="form-control" id="ysmm" name="ysmm" style="width: 30%">
<label>新密码：</label><input type="text" class="form-control" id="xmm" name="xmm" style="width: 30%">
<label>确认新密码：</label><input type="text" class="form-control" id="qrmm" name="qrmm" style="width: 30%">
<input type="submit" value="保存并提交" class="btn btn-default" >
</form>
</div>
</body>
<script type="text/javascript">
function  xgmm(){
	
	var xmm= document.getElementById("xmm");
	var qrmm = document.getElementById("qrmm");
	if(xmm.value!=qrmm.value)
		{
		alert("两次输入密码不相同");
		qrmm.focus();
		return false;
		}
	}
</script>
</html>