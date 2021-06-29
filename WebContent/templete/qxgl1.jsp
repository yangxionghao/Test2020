<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <link href="../css/bootstrap.min.css" rel="stylesheet">

    <script src="../js/jquery-3.3.1.min.js"></script>

    <script src="../js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
var str="";
var a;
$.ajax({
    type: "POST",
    url: "../yygl",
    dataType : "json",
    success: function (data) {
		$.each(
				data,
				function(i, item) {
					//拼接字符串给select动态赋予id
					var s = "jss"+i;
					//alert(s);
				str = str + "<tr><td>" + item.username +"</td><td>" + item.rname +"</td><td>";
				if(item.js=="1"){
					str = str +"<select id='"+s+"'  name='js' class='form-control' style='width:30%;'>" 
					+"<option value=1 selected='selected'>"+"管理员"+"</option>"
					+"<option value=2>"+"形式审核员"+"</option>"
					+"<option value=7>"+"部门审核员"+"</option>"
					+"<option value=3>"+"注册用户"+"</option>"
					+"</select>"+ "</td><td>"
				}
				if(item.js=="2"){
					str = str +"<select id='"+s+"'  name='js' class='form-control' style='width:30%;'>" 
					+"<option value=1 >"+"管理员"+"</option>"
					+"<option value=2 selected='selected'>"+"形式审核员"+"</option>"
					+"<option value=7>"+"部门审核员"+"</option>"
					+"<option value=3>"+"注册用户"+"</option>"
					+"</select>"+ "</td><td>"
				}
				if(item.js=="3"){
					str = str +"<select id='"+s+"'  name='js' class='form-control' style='width:30%;'>" 
					+"<option value=1 >"+"管理员"+"</option>"
					+"<option value=2>"+"形式审核员"+"</option>"
					+"<option value=7>"+"部门审核员"+"</option>"
					+"<option value=3 selected='selected'>"+"注册用户"+"</option>"
					+"</select>"+ "</td><td>"
				}
				if(item.js=="7"){
					str = str +"<select id='"+s+"'  name='js' class='form-control' style='width:30%;'>" 
					+"<option value=1 >"+"管理员"+"</option>"
					+"<option value=2>"+"形式审核员"+"</option>"
					+"<option value=7 selected='selected'>"+"部门审核员"+"</option>"
					+"<option value=3>"+"注册用户"+"</option>"
					+"</select>"+ "</td><td>"
				}
				str = str + "<input type='button' value='修改' class='btn btn-default' onclick='getValue(\""+item.uid+"\",\""+i+"\")'>"+"</td></tr>"; 
                  });
		$("#tab").append(str);
				}
				
});
function getValue(uid,i){
	   var str = "jss"+i;
	   a = $("#"+ str).find("option:selected").val();
	   alert(a);
	 window.location.href="${pageContext.request.contextPath}/qxjl1_Servlet?uid="+uid+"&js="+a+"";
}


</script>
<body>

<form action="${pageContext.request.contextPath}/qxgl1" method="post">
<table class="table table-bordered" id="tab" style="text-align: center;">
<tr>

<td>用户名</td>
<td>真实姓名</td>
<td>所属角色</td>
<td>操作</td>
</tr>
</table>
</form>

</body>

</html>