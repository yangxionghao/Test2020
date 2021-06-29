<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>角色管理</title>
   <link href="../css/bootstrap.min.css" rel="stylesheet">

    <script src="../js/jquery-3.3.1.min.js"></script>

    <script src="../js/bootstrap.min.js"></script>
</head>
<body>

<ul class="nav nav-tabs">
  <li role="presentation" class="active"><a href="jsgl.jsp">角色管理</a></li>
  <li role="presentation"><a href="addjs.jsp">添加角色</a></li>
</ul>

 <div id="panel-169507">
<div style="text-align: center"><h1>角色管理</h1></div>

<hr>
<div style="padding-left: 650px" >
<select id="js"  name="js" class="form-control" style="width:30%;">
	<option value=1 >管理员</option>
    <option value=2>形式审核员</option>
      <option value=7>部门审核员</option>
    <option value=3>注册用户</option>
	</select> 
<hr>	

	</div>
	<table class="table table-bordered" id="table">
<tr>
<td>权限名称</td>
<td>是否赋予</td>
</tr>

<tr>
<td>用户管理</td>
<td><input type="checkbox" id="a" name="b" value="用户管理"></td>
</tr>

<tr>
<td>角色管理</td>
<td><input type="checkbox" id="a1" name="b1" value="角色管理"></td>
</tr>

<tr>
<td>权限管理</td>
<td><input type="checkbox" id="a2" name="b2" value="权限管理"></td>
</tr>

<tr>
<td>需求管理</td>
<td><input type="checkbox" id="a3" name="b3" value="需求管理"></td>
</tr>

<tr>
<td>形式审核</td>
<td><input type="checkbox" id="a4" name="b4" value="形式审核"></td>
</tr>

<tr>
<td>部门审核</td>
<td><input type="checkbox" id="a5" name="b5" value="部门审核"></td>
</tr>

<tr>
<td>统计查询</td>
<td><input type="checkbox" id="a6" name="b6" value="统计查询"></td>
</tr>

<tr>
<td>网络审核</td>
<td><input type="checkbox" id="a7" name="b7" value="网络审核"></td>
</tr>

<tr>
<td>修改密码</td>
<td><input type="checkbox" id="a8" name="b8" value="修改密码"></td>
</tr>

<tr>
<td>需求征集</td>
<td><input type="checkbox" id="a9" name="b0" value="需求征集"></td>
</tr>

<tr>
<td>用户信息</td>
<td><input type="checkbox" id="a0" name="b0" value="用户信息"></td>
</tr>
</table>
</div>
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
	      <h1 class="invisible">11</h1><h1 class="invisible">11</h1>
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
<script type="text/javascript">
$("#js").change(function(){
	var js1 = document.getElementById('js').value;
	$.ajax({
        type: "POST",
        url: "../jsServlet",
        data: {'js1': js1},
        dataType : "json",
        success: function (data) {
        	$.each(data,function(i, item) {
						jsid = item.jsid;
			//			alert("jsid=" + jsid);
			   $("input[type=checkbox]").attr("checked",false);
        		if(jsid==1){
        			 $("input[type=checkbox]").attr("checked","checked"); 
                   }else if(jsid==2){
                	   $("#a4").attr("checked","checked");
                	   $("#a8").attr("checked","checked");
                	   $("#a6").attr("checked","checked");
                   }else if(jsid==7){
                	   $("#a5").attr("checked","checked");
                	   $("#a8").attr("checked","checked");
                	   $("#a6").attr("checked","checked");
                	   
                   }
                   else{
                	   $("#a9").attr("checked","checked");
                	   $("#a3").attr("checked","checked");
                	   $("#a0").attr("checked","checked");
                	   $("#a8").attr("checked","checked"); 

                   }
        		});
        }
    });
});


</script>
</html>