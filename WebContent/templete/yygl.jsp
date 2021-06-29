<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户管理</title>
   <link href="../css/bootstrap.min.css" rel="stylesheet">

    <script src="../js/jquery-3.3.1.min.js"></script>

    <script src="../js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
var str="";
$.ajax({
    type: "POST",
    url: "../yygl",
    dataType : "json",
    success: function (data) {
		$.each(
				data,
				function(i, item) {
				str = str + "<tr><td>" + item.username +"</td><td>" + item.rname +"</td><td>" + item.sex +"</td><td>" + item.sf +"</td><td>" + item.gzdw +"</td><td>" + item.zyfx +
				"</td><td>" + item.szhy +"</td><td>";
				if(item.js=="1"){
					str = str + "管理员" +"</td><td>";
				}
				if(item.js=="2"){
					str = str + "形式审核员" +"</td><td>";
				}
				if(item.js=="3"){
					str = str + "注册用户" +"</td><td>";
				}
				if(item.js=="7"){
					str = str + "部门审核员" +"</td><td>";
				}
				str = str + "<a href='../yygl_xg_Servlet?uid="+item.uid+"'><input type='button' value='修改' class='btn btn-default' ></a>" + "<a href='../yygl_sc_Servlet?uid="+item.uid+"'><input type='button' value='删除' class='btn btn-default' ></a>"+"</td></tr>"; 
                  });
		$("#tab").append(str);
				}
				
});


</script>
<body>
<table class="table table-bordered" id="tab" style="text-align: center;">
<tr>
<td>用户名</td>
<td>真实姓名</td>
<td>性别</td>
<td>省份</td>
<td>工作单位</td>
<td>专业方向</td>
<td>所在行业</td>
<td>所属角色</td>
<td>操作</td>
</tr>
</table>

</body>

</html>