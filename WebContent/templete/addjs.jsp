<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加角色</title>
   <link href="../css/bootstrap.min.css" rel="stylesheet">

    <script src="../js/jquery-3.3.1.min.js"></script>

    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<ul class="nav nav-tabs">
  <li role="presentation" ><a href="jsgl.jsp">角色管理</a></li>
  <li role="presentation" class="active"><a href="addjs.jsp">添加角色</a></li>
</ul>
<form action="../addjsServlet" method="post">
<div style="text-align: center"><h1>角色管理</h1></div>
<div style="text-align: center"><a href="addjs.jsp"><input type="submit" value="添加用户" class="btn btn-default" ></a></div>
<hr>
<div style="padding-left: 400px;" >
<div class="row">
  <div class="col-xs-6 col-md-4" style="text-align: right;"><label>请输入添加角色名称：</label></div>
  <div class="col-xs-6 col-md-4" style="text-align: left;"><input  name="jsmc" class="form-control" style="width:30%;"></div>
</div>
	</div>
<hr>	

<table class="table table-bordered" id="table">
<tr>
<td>权限名称</td>
<td>是否赋予</td>
</tr>

<tr>
<td>管理员权限</td>
<td><input type="checkbox" id="a2" name="power" value="0"></td>
</tr>

<tr>
<td>部门审核</td>
<td><input type="checkbox" id="a5" name="bmsh_qx" value="0"></td>
</tr>

<tr>
<td>统计查询</td>
<td><input type="checkbox" id="a6" name="tjcx_qx" value="0"></td>
</tr>

<tr>
<td>需求管理</td>
<td><input type="checkbox" id="a7" name="xqgl_qx" value="0"></td>
</tr>

<tr>
<td>形式审核</td>
<td><input type="checkbox" id="a7" name="xssh_qx" value="0"></td>
</tr>

<tr>
<td>网络审核</td>
<td><input type="checkbox" id="a7" name="wlsh_qx" value="0"></td>
</tr>

<tr>
<td>修改密码</td>
<td><input type="checkbox" id="a8" name="yhxg_qx" value="0"></td>
</tr>

<tr>
<td>需求征集</td>
<td><input type="checkbox" id="a9" name="xqzj_qx" value="0"></td>
</tr>

<tr>
<td>用户信息</td>
<td><input type="checkbox" id="a0" name="yhxx_qx" value="0"></td>
</tr>
</table>
</form>


<h1 class="invisible">11</h1>
	   <h1 class="invisible">11</h1>
	      <h1 class="invisible">11</h1>
	   <h1 class="invisible">11</h1>
	      <h1 class="invisible">11</h1>
	   <h1 class="invisible">11</h1>
	      <h1 class="invisible">11</h1>
	   <h1 class="invisible">11</h1>
	      <h1 class="invisible">11</h1>
	   <h1 class="invisible">11</h1>
	      <h1 class="invisible">11</h1>
	   <h1 class="invisible">11</h1>
	   	   <h1 class="invisible">11</h1>
	   <h1 class="invisible">11</h1>
	      <h1 class="invisible">11</h1>
	   <h1 class="invisible">11</h1>
	      <h1 class="invisible">11</h1>
	      
</body>
</html>