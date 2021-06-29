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

<title>Insert title here</title>
<style type="text/css">
h1.invisible{
visibility:hidden;
}

</style>
</head>
<script type="text/javascript">


jQuery(document).ready(function() {
	      
	$.ajax({
        //请求方式
        type : "POST",
        //请求的媒体类型
        dataType: "json",
        //请求地址
        url : "../aa",
        //请求成功
        success : function(result) {
            var zNodes = [];
            for (var i = 0; i < result.length; i++) {
                var tempNode = {};
                tempNode["id"] = parseInt(result[i]['id']);
                tempNode["pId"] = parseInt(result[i]['pid']);
                tempNode["name"] = result[i]['name'];
                zNodes.push(tempNode);
            }
            var s = JSON.stringify(zNodes);
            var epc=eval("("+s+")");
            $.fn.zTree.init($("#dept_tree"), setting,epc);
        },
        //请求失败，包含具体的错误信息
        error : function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
	
	                $.fn.zTree.init($("#dept_tree"), setting, zNodes);
	 
	});
	 
	        var setting = {
	                 data: {
	                     simpleData: {
	                         enable: true
	                     }
	                 },
	                 callback: {
	                     onClick:function zTreeOnClick(event, treeId, treeNode){
	           
	                             //alert(parentsids+'    '+parentsnames);
	            
	                             $('#textorg').val(treeNode.name);//设置节点所属部门的值
	                            
	                        
	                             hideMenu();
	                         }
	                 },
	                 view:{
	                     fontCss:{font:{'background-color':'black', 'color':'white'}}
	                 }
	                 
	             };
		
	
	        //隐藏zTree外围div容器
	             function hideMenu() {
	                 $("#menuContent").fadeOut("fast");
	                 $("body").unbind("mousedown", onBodyDown);
	             }
	 
	             //点击“选择”后显示zTree树
	             function showMenu(id) {
	                 CurInput = 1; //标记第一个文本框
	                 var cityObj = $("#"+id);
	                 var cityOffset = $("#"+id).offset();
	                 var w=$("#"+id).css('width');
	                 var sw=w.substr(0,w.length-2)-12+'px';
	                 $("#dept_tree").width(sw);
	                 
	                 //定位zTree外围div容器位置
	                 //alert(cityOffset.left+":"+cityOffset.top);
	                 $("#menuContent").css({
	                    // left: cityOffset.left-mod_left + "px",
	                    // top: cityOffset.top-mod_top-24 + "px"
	                    left:cityOffset.left + "px",
	                    top: cityOffset.top+30 + "px"
	                 }).slideDown("fast");
	                 //绑定页面的鼠标按下事件
	                 $("body").bind("mousedown", onBodyDown);
	             }
	             //判断当前事件来源
	             function onBodyDown(event) {
	                 if (! (event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
	                     hideMenu();
	                 }
	             }

	
</script>
<body>
<form action="../wjServlet" method="get" onsubmit="return queding()">
<table class="table table-bordered" >

<tr>
<td colspan=1><label>机构名称</label></td>
<td colspan=2 width="33.4%"><input type="text" class="form-control" id="jgmc" name="jgmc"></td>
<td colspan=1><label>归口管理部门</label></td>
<td colspan=2 width="33.4%"><input type="text" class="form-control" id="gkglbm" name="gkglbm"></td>
</tr>

<tr>
<td  colspan=1><label>通讯地址</label></td>
<td colspan=2 width="33.4%"><input type="text" class="form-control" id="txdz" name="txdz"></td>
<td  colspan=1><label>所在地域</label></td>
<td colspan=2 width="33.4%"><select id="szdy"  name="szdy" class="form-control" style="width:200px">
	<option >--所在市--</option>
    <option>石家庄市
    </option>
	<option>唐山市
	</option>
	<option>秦皇岛市
	</option>
	<option>邯郸市
	</option>
	<option>邢台市
	</option>
	<option>保定市
	</option>
	<option>张家口市
	</option>
	<option>承德市
	</option>
	<option>沧州市
	</option>
	<option>廊坊市
	</option>
	<option>衡水市
	</option>
	<option>定州市
	</option>
	<option>辛集市
	</option>
	<option>其他（河北工大）
	</option>
	</select> </td>
</tr>

<tr>
<td  colspan=1><label>网址</label></td>
<td colspan=2 width="33.4%"><input type="text" class="form-control" id="dwwz" name="dwwz"></td>
<td  colspan=1><label>电子邮箱</label></td>
<td colspan=2><input type="text" class="form-control" id="dzyx" name="dzyx"></td>
</tr>

<tr>
<td  colspan=1><label>法人代表</label></td>
<td colspan=2 width="33.4%"><input type="text" class="form-control" id="frdb" name="frdb"></td>
<td  colspan=1><label>邮政编码</label></td>
<td colspan=2><input type="text" class="form-control" id="yzbm" name="yzbm"></td>
</tr>

<tr >
<td   colspan=1><label>联系人</label></td>
<td   colspan=2 width="33.4%" style="text-align: center"><input type="text" class="form-control" id="lxr" name="lxr"></td>
<td  colspan=1><label>固定电话</label></td>
<td colspan=2>
<input type="text" class="form-control" id="gddh" name="gddh" placeholder="固定电话">
</td>
</tr>

<tr>
<td colspan=1><label>手机号</label></td>
<td colspan=2>
<input type="text" class="form-control" id="yddh" name="yddh" placeholder="手机">
</td>
<td  colspan=1><label>传真</label></td>
<td colspan=2><input type="text" class="form-control" id="cz" name="cz" ></td>
</tr>

<tr>
<td  colspan=1><label>机构属性</label></td>
<td colspan=5>
<label class="radio-inline">
  <input type="radio" name="jgsx" id="jgsx1" value="企业"> 企业
</label>
<label class="radio-inline">
  <input type="radio" name="jgsx" id="jgsx2" value="高等院校">高等院校
</label>
<label class="radio-inline">
  <input type="radio" name="jgsx" id="jgsx3" value="研究机构"> 研究机构
</label>
<label class="radio-inline">
  <input type="radio" name="jgsx" id="jgsx4" value="其他"> 其他
</label>
</td>
</tr>

<tr>
<td colspan=6><label>机构简介（单位基本情况，研究基础等，限500字）</label></td>
</tr>

<tr>
<td  colspan=6 style="text-align: center;">
<textarea class="form-control" rows="5" id="jgjj" name="jgjj"></textarea>
<label><span id="num">0</span>/500</label></td>
</tr>

<tr>
<td  colspan=1><label>技术需求名称</label></td>
<td colspan=2><input type="text" class="form-control" id="jsxqmc" name="jsxqmc" ></td>
<td  colspan=1><label>需求年限</label></td>
<td colspan=2><div class="col-md-4" width="50%"><input type="text" class="form-control" id="qsnf" name="qsxqnf" placeholder="起始需求年份"></div>
&nbsp;&nbsp;  <div class="col-md-4" width="50%"><input type="text" class="form-control" id="jznf" name="jzxqnf" placeholder="截至需求年份"></div>
</td>
</tr>

<tr>
<td colspan=6><label>*技术需求概述
1、主要问题（需要解决的重大技术问题，限500字以内）
2、技术关键（所需的关键技术、主要指标，限500字以内）
3、预期目标（技术创新性、经济社会效益，限500字以内）
</label>
</td>
</tr>

<tr>
<td  colspan=6>
<textarea class="form-control" rows="5" id="jxqgs" name="jxqgs"></textarea>
<div style="text-align: center;"><label><span id="num1">0</span>/500</label></div>
<br>
<label>关键字</label>
<div class="row">
  <div class="col-md-1" style="width: 20%"><input type="text" class="form-control" oninput="cx()" id="gjz1" name="gjz1"></div>
  <div class="col-md-1" style="width: 20%"><input type="text" class="form-control" oninput="cx()" id="gjz2" name="gjz2" disabled="disabled"></div>
  <div class="col-md-1" style="width: 20%"><input type="text" class="form-control" oninput="cx()" id="gjz3" name="gjz3" disabled="disabled"></div>
  <div class="col-md-1" style="width: 20%"><input type="text" class="form-control" oninput="cx()" id="gjz4" name="gjz4" disabled="disabled"></div>
  <div class="col-md-1" style="width: 20%"><input type="text" class="form-control" oninput="cx()" id="gjz5" name="gjz5" disabled="disabled"></div>
</div>
</td>
</tr>

<tr>
<td  colspan=1><label>拟投入资金总额</label></td>
<td colspan=2 width="33.4%"><input type="text" class="form-control" id="ntrzjze" name="ntrzjze" placeholder="万元"></td>
<td  colspan=3>&nbsp;</td>
</tr>

<tr>
<td rowspan=2  colspan=1><label>*技术需求解决方式</label></td>
<td colspan=5>
<label class="checkbox-inline">
  <input type="checkbox" id="hzms" name="jsxqjjfs" value="独立研发"> 独立研发
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="hzms" name="jsxqjjfs" value="委托研发"> 委托研发
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="hzms" name="jsxqjjfs" value="合作研发"> 合作研发
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="hzms" name="jsxqjjfs" value="其他">其他
</label>
</td>
</tr>

<tr>
<td colspan=5><label>合作意向单位</label><input type="text" id="hzyxdw" name="hzyxdw" class="form-control"></td>
</tr>

<tr>
<td rowspan=1  colspan=1><label>科技活动类型</label></td>
<td colspan=5  colspan=1>
<label class="radio-inline">
  <input type="radio" name="kjhdlx" id="hdlx1" value="基础研究"> 基础研究
</label>
<label class="radio-inline">
  <input type="radio" name="kjhdlx" id="hdlx2" value="应用研究">应用研究
</label>
<label class="radio-inline">
  <input type="radio" name="kjhdlx" id="hdlx3" value="试验发展"> 试验发展
</label>
<label class="radio-inline">
  <input type="radio"name="kjhdlx" id="hdlx4" value="研究与试验发展成果应用"> 研究与试验发展成果应用
</label>
<label class="radio-inline">
  <input type="radio"name="kjhdlx" id="hdlx5" value="技术推广与科技服务"> 技术推广与科技服务  
</label>
<label class="radio-inline">
  <input type="radio"name="kjhdlx" id="hdlx5" value="生产性活动"> 生产性活动  
</label>
</td>
</tr>



<tr style="display: none" id="myAdmin">
<td  colspan=1><label>学科分类</label></td>
<td  colspan=2> <div class="col-sm-9" style="text-align:left;">
                                                <div style=" border-collapse: separate;display: table;"  id="dept_div">
                                                    <input type="text"  id="textorg"  placeholder="请选择所属部门" name="xkfl"  readonly="readonly"
                                                    style=" border-bottom-right-radius: 0px;border-top-right-radius: 0px;" 
                                                    class="form-control" data-bv-field="contacts_id" />
                                                    <i style="display: none;" class="form-control-feedback" data-bv-icon-for="contacts_id"></i>
                                                    <div onclick="showMenu('dept_div'); return false;" style="cursor:pointer;" class="input-group-addon"> 
                                                       <!--  <span class="glyphicon-user glyphicon"></span> -->选择
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                   </td>
<td  colspan=3>&nbsp;</td>

</tr>

<tr style="display: none" id="myAdmin1">
<td  colspan=1><label>需求技术所属领域</label></td>
<td colspan=5>
<label class="checkbox-inline">
  <input type="checkbox" id="jsly1" name="xqjsssly" value="电子信息技术"> 电子信息技术
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="jsly2" name="xqjsssly" value="光机电一体化"> 光机电一体化
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="jsly3" name="xqjsssly" value="软件"> 软件
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="jsly4" name="xqjsssly" value="生物制药技术">生物制药技术
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="jsly5" name="xqjsssly" value="新材料及应用技术">新材料及应用技术
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="jsly6" name="xqjsssly" value="先进制造技术"> 先进制造技术
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="jsly7" name="xqjsssly" value="现代农业技术"> 现代农业技术
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="jsly8" name="xqjsssly" value="新能源与高效节能技术"> 新能源与高效节能技术
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="jsly9" name="xqjsssly" value="资源与环境保护新技术"> 资源与环境保护新技术
</label>
<label class="checkbox-inline">
  <input type="checkbox" id="jsly0" name="xqjsssly" value="其他技术"> 其他技术
</label>
<input type="text" class="form-control" id="qtjsms" name="qtjsms" placeholder="其他技术" style="display: none;">
</td>
</tr>

<tr style="display: none" id="myAdmin2">
<td  colspan=1><label>需求技术应用行业</label></td>
<td width="16.6%"  colspan=2><input type="text" class="form-control" id="yyhy" name="xqjsyyhy"></td>
<td  colspan=3>&nbsp;</td>
</tr>


<tr style="text-align: center;">
<td colspan=6>
<input type="submit" value="保存并提交" class="btn btn-default" >
</td>
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
	   <h1 class="invisible">11</h1>
	      <h1 class="invisible">11</h1>
	   <h1 class="invisible">11</h1>
	      <h1 class="invisible">11</h1>
	   <h1 class="invisible">11</h1>
	      <h1 class="invisible">11</h1>
	   <h1 class="invisible">11</h1>	 
	   
	   
	   
	   
	   
	   
	   
	   
	   
		

	

                 
                    <div id="menuContent" class="menuContent"
                        style="background: #fff; display: none; position: absolute; border: 1px solid #ddd; border-radius: 5px;">
                        <ul id="dept_tree" class="ztree"
                            style="margin-top: 0; width: 296px;">
                        </ul>
                    </div>

	
		
</body>
	<script>
		 // 根据单选框触发是否提交事件! 科技活动类型
    $('input:radio[name="kjhdlx"]').change(function () {
        if ($("#hdlx1").is(":checked")) {
            $("#myAdmin").show();
            $("#myAdmin1").hide();
            $("#myAdmin2").hide();
        }
        else {
        	$("#myAdmin1").show();
        	$("#myAdmin2").show();
            $("#myAdmin").hide();
            $("#xkfl").text('');
        }
    })
    //需求技术所属领域
	    $('input:checkbox[name="xqjsssly"]').change(function () {
        if ($("#jsly0").is(":checked")) {
            $("#qtjsms").show();
        }
        else {
            $("#qtjsms").hide();
            $("#qtjsms").text('');
        }
    })	
      function sum() {
    	var qyzc=parseInt(document.getElementById("a1").value);
    	var yhdk=parseInt(document.getElementById("a3").value);
    	var qtrz=parseInt(document.getElementById("a2").value);
    	/* alert(qyzc);
    	alert(yhdk);
    	alert(qtrz); */
    	document.getElementById("a").value=qyzc+yhdk+qtrz;
    	
	}
  //文本域数字数量限制
   $('#jgjj').on("keyup",function(){
	   $('#num').text($('#jgjj').val().length);
	   if($('#jgjj').val().length > 500){
		   alert("不能超过五百字！");
		   $('#num').text(500);
		   $('#jgjj').val($('#jgjj').val().substring(0,500));
	   }
   })
      $('#jxqgs').on("keyup",function(){
	   $('#num1').text($('#jxqgs').val().length);
	   if($('#jxqgs').val().length > 500){
		   alert("不能超过五百字！");
		   $('#num1').text(500);
		   $('#jxqgs').val($('#jxqgs').val().substring(0,500));
	   }
   })
   //设置输入框输入次序
   function cx(){
	  if($('#gjz1').val().length != 0){
		  $('#gjz2').removeAttr("disabled");
	  }
	  if($('#gjz2').val().length != 0){
		  $('#gjz3').removeAttr("disabled");
	  }
	  if($('#gjz3').val().length != 0){
		  $('#gjz4').removeAttr("disabled");
	  }
	  if($('#gjz4').val().length != 0){
		  $('#gjz5').removeAttr("disabled");
	  }
	  
  }
   function queding() {
	   var msg = "需求信息审核后不能修改！ 确定提交吗？";
	   if (confirm(msg)==true){
	   return true;
	   }else{
	   return false;
	   }
	   }
	</script>
	
</html>