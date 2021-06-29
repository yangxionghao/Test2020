<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/zTreeStyle.css"type="text/css">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.ztree.core.min.js"></script>
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
  <div class="col-md-6 col-sm-6"  >
                                        <div class="form-group ">
                                            <label class="col-sm-3 control-label" for="">
                                                所属组织
                                                <span id="label_orgname"><font
                                                    color="RED" style="font-size: 12px">*</font></span>
                                            </label>
                                            <div class="col-sm-9" style="text-align:left;">
                                                <div style=" border-collapse: separate;display: table;"  id="dept_div">
                                                    <input type="text"  id="textorg"  placeholder="请选择所属部门" name="orgname"  readonly="readonly"
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
                    <div id="menuContent" class="menuContent"
                        style="background: #fff; display: none; position: absolute; border: 1px solid #ddd; border-radius: 5px;">
                        <ul id="dept_tree" class="ztree"
                            style="margin-top: 0; width: 296px;">
                        </ul>
                    </div>


</body>
</html>