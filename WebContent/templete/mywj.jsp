<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <link href="../css/bootstrap.min.css" rel="stylesheet">

    <script src="../js/jquery-3.3.1.min.js"></script>

    <script src="../js/bootstrap.min.js"></script>
<title>需求管理</title>
</head>
<script type="text/javascript">
var str="";
$.ajax({
    type: "POST",
    url: "../mywj_Servlet",
    dataType : "json",
    success: function (data) {
		$.each(
				data,
				function(i, item) {
					var qsbut = "qsbut" + i
				str = str + "<tr><td>" + item.jsxqmc +"</td><td>" + item.qsxqnf +"-" + item.jzxqnf+"</td><td>" + item.gjz1+"、"+item.gjz2+ "、" +item.gjz3+ "、" +item.gjz4+ "、" +item.gjz5+"</td><td>" + item.jgmc +"</td><td>"+ item.sfsh +"</td><td>" +item.shyj +"</td></tr>"; 
                  });
		$("#tab").append(str);
				}
				
});

</script>

<body>
<table class="table table-bordered" id="tab" style="text-align: center;">
<tr>
<td>技术需求名称</td>
<td>技术需求年限</td>
<td>关键字</td>
<td>机构名称</td>
<td>审核</td>
<td>审核意见</td>
</tr>
</table>





</body>
</html>