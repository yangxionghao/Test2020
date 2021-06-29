<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link href="../css/bootstrap.min.css" rel="stylesheet">

    <script src="../js/jquery-1.11.3.min.js"></script>

    <script src="../js/bootstrap.min.js"></script>
<title>注册</title>

<style>
	h1{
	color:white
	}
	body{
	
	
	
	}
	.a{
		margin-top: 20px;
	}
	.b{
		font-size: 20px;
		width: 160px;
		color: white;
		background-color: greenyellow;
	}
	.c{
		margin-top: 20px;
		color: red;
	}
/* 	table {
	border:2px solid;
	border-radius:25px;
	-moz-border-radius:25px; /* Old Firefox */

	background-color: white; 
	box-shadow: 10px 10px 5px #888888;
	border: red solid thin;
	width: 400px;
	position: relative;
	top: 50px;
	left: 300px;
} */
body{

		background-color: white;

}
</style>
<script type="text/javascript">

function check()
{
	var password= document.getElementById("password");
	var qpassword = document.getElementById("qpassword");
	if(password.value!=qpassword.value)
		{
		alert("两次输入密码不相同");
		qpassword.focus();
		return false;
		}
	
	var number=document.getElementById("number");
	if(number.value.length!=11)
		{
		alert("手机号码11位");
		number.focus();
		return false;
		}
	}

window.onload=function(){
    //定义省份的字符串
    var provincesArr=["湖南","湖北","广东"];
    //定义城市的字符串
    var citiesArr=["长沙,株洲,湘潭,常德,益阳,张家界","武汉,宜昌,恩施,黄石,襄樊,荆州","广州,珠海,佛山,东莞,惠州,深圳"];
    var provinces=document.getElementById("province");
    var cities=document.getElementById("city");
    //给省份下拉列表框添加option
    for(var i=0;i<provincesArr.length;i++){
        var op=document.createElement("option");
        op.value=i;
        op.innerHTML=provincesArr[i];
        provinces.appendChild(op);
    }
    //选择省份后，城市列表框联动
    provinces.onchange=function(){
        var index=this.value;
        cities.options.length=1;
        if(citiesArr[index]==null){
            return;
        }
        var secondCitiesArr=citiesArr[index].split(",");
        for(var i=0;i<secondCitiesArr.length;i++){
            var op=document.createElement("option");
            op.innerHTML=secondCitiesArr[i];
            cities.appendChild(op);
        }
    }
}

</script>
</head>
<body>
	<div align="center">
		<form action="../zhuceServlet" method="post" onsubmit="return check()">
			<table class="table table-hover" border="1px"  align="center"> 
		
	<tr><td><font color="red">*</font>用户名</td><td><input type="text" id="username" name="username" class="form-control"></td><td><span id="span1"></span></td><td><font>用户名应大于6位且小于20位</font></td></tr>
	<tr><td><font color="red">*</font>用户密码</td><td><input type="password" id="password" name="password" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
	<tr><td><font color="red">*</font>确认密码密码</td><td><input type="password" id="qpassword" name="qpassword" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
	<tr><td>姓名</td><td><input type="text" id="Name" name="rname" class="form-control"></td><td><span id="span1"></span></td><td><font>请填写真实姓名，以方便与您取得联系</font></td></tr>
	<tr><td>性别</td><td><input type="radio" id="sex" name="sex"value="男" >男<input type="radio" id="sex" name="sex" value="女">女</td><td><span id="span1"></span></td><td><font>请填写真实姓名，以方便与您取得联系</font></td></tr>
	<tr><td><font color="red">*</font>国家/省份</td><td><div class="form-inline"><select id="province"  name="province" class="form-control" style="width:200px">
	<option >--省份--</option>

	
	</select> 
	  <select id="city" name="city" class="form-control" style="width:200px">
            <option>--市区--</option>
            </div>
        </select></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
	<tr><td><font color="red">*</font>工作单位</td><td><input type="text" id="danwei" name="gzdw" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
	<tr><td><font color="red">*</font>专业方向</td><td><input type="text" id="fangxiang" name="zyfx" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
		<tr><td><font color="red">*</font>所在行业</td><td><input type="text" id="hangye" name="szhy" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
		<tr><td><font color="red">*</font>教育程度</td><td><input type="text" id="jiaoyv" name="jycd" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
		<tr><td><font color="red">*</font>职称</td><td><input type="zhicheng" id="zhicheng" name="zc" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
		<tr><td><font color="red">*</font>通讯地址</td><td><input type="text" id="dizhi" name="txdz" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
		<tr><td><font color="red">*</font>邮政编码</td><td><input type="text" id="youzheng" name="yzbm" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
			<tr><td><font color="red">*</font>手机</td><td><input type="number" id="phone" name="sj" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
			<tr><td><font color="red">*</font>固定电话</td><td><input type="number" id="telephone" name="gddh" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
					<tr><td><font color="red">*</font>邮箱</td><td><input type="email" id="mail" name="yx" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
					<tr><td><font color="red">*</font>QQ</td><td><input type="number" id="qq" name="qq" class="form-control"></td><td><span id="span1"></span></td><td><font>密码不能为空</font></td></tr>
					<tr><td><font color="red">*</font>msn</td><td><input type="number" id="msn" name="msn" class="form-control"></td><td><span id="span1" ></span></td><td><font>密码不能为空</font></td></tr>
											<tr><td colspan="2"><input type="submit" value="注册" class="btn btn-default"></td><td colspan="2"><input type="reset" value="重置" class="btn btn-default"></td></tr>
						
		</table>
		</form>
	
	
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