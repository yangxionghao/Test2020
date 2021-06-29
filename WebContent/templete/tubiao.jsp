<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
   <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
       <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
    
    
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<ul class="nav nav-tabs">
  <li role="presentation" ><a href="${pageContext.request.contextPath}/templete/tongji.jsp">综合检索</a></li>
  <li role="presentation" ><a href="fljs.jsp">分类检索</a></li>
  <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/templete/tubiao.jsp">图表显示</a></li>
</ul>
  <label>————————请选择检索条件——————————</label>
   <%--分类检索--%>
                    <div class="tab-pane active" id="panel-169507">
                        <form  action="${pageContext.request.contextPath}/tubiao_Servlet" method="post" >
                            <div class="row-fluid">
                                <div class="span12">
                                    <h4 align="left" >分类检索条件
                                        <select id="jstj" class="form-control" style="height: 40px;display: inline;width:200px;" name="jstj">
                                            <option value ="0">--请选择--</option>
                                            <option value="jgmc">机构全称</option>
                                            <option value="gkglbm">归口管理单位</option>
                                            <option value="szdy">所在地域</option>
                                            <option value="frdb">法人代表</option>
                                            <option value="lxr">联系人</option>
                                            <option value="jgsx">机构属性</option>
                                            <option value="jsxqmc">技术需求名称</option>
                                            <option value="gjz">关键字</option>
                                            <option value="ntrzjze">拟投入资金总额</option>
                                            <option value="jsxqjjfs">技术需求解决方式</option>
                                            <option value="kjhdlx">科技活动类型</option>
                                            <option value="xkfl">学科分类</option>
                                            <option value="xqjsssly">需求技术所属领域</option>
                                            <option value="xqjsyyhy">需求技术应用行业</option>
                                        </select>
                                        <input type="text" class="form-control" name="value" id="value" style="width:250px;height: 40px;display: inline" value="${value}">
                                    </h4>
                                    <h4>
                                        检索要求
                                        <select id="jsyq" class="form-control" style="width: 200px;height: 40px;display: inline" name="jsyq" >
                                            <option value = "0">模糊查询</option>
                                            <option value = "1">精确查询</option>
                                        </select>
               选择统计字段                                                                         <select id="tjzd" class="form-control" style="width: 200px;height: 40px;display: inline" name="tjzd" >
                                            <option value = "jgsx">机构属性</option>
                                            <option value = "kjhdlx">科技活动类型</option>
                                            <option value = "jsxqjjfs">技术需求解决方式</option>
                                        </select>
                   选择图表类型                                  <select id="tblx" class="form-control" style="width: 200px;height: 40px;display: inline" name="tblx">
                                            <option value = "zzt">柱状图</option>
                                            <option value = "zxt">折线图</option>
                                            <option value = "bzt">饼状图</option>
                                        </select>
                                        <input type="submit" class="btn btn-success" style="width: 200px;height:30px;position: relative;left: 100px" value="查询">
                                    </h4>
                                </div>

                            </div>
                        </form>
                        
                        
                       <div id="main" style="width: 700px;height:400px;" >
                        <script type="text/javascript">
                        $(function() {
      	                   if('${tblx}'=="zzt"){
      	                	   var myChart = echarts.init(document.getElementById('main'));
      	                	   var arr = new Array();
      	                	   var index = 0;
      	                	   <c:forEach items="${listtb}" var="item"> 
      	                	       arr[index++] = ${item.count};
      	                	   </c:forEach>
      	                	   // 指定图表的配置项和数据
      	                	   var option = {
      	                	       title: {
      	                	           text: '统计图表'
      	                	       },
      	                	       tooltip: {
      	                	           show: true
      	                	       },
      	                	       legend: {
      	                	           data:['统计数']
      	                	       },
      	                	       xAxis : [
      	                	           {
      	                	               type : 'category',
      	                	               axisLabel:{  
      	                	     	           interval:0,//横轴信息全部显示  
      	                	     	           rotate:40,//-30度角倾斜显示  
      	                	     	            },
      	                	               data : [
      	                	                   <c:forEach items="${listtb}" var="item">
      	                	                   ["${item.type}"],
      	                	                   </c:forEach>
      	                	               ]
      	                	           }
      	                	       ],
      	                	       yAxis : [
      	                	           {
      	                	               type : 'value'
      	                	           }
      	                	       ],
      	                	       series : [
      	                	           {
      	                	               name:'统计数',
      	                	               type:'bar',
      	                	               data: arr
      	                	               
      	                	           }
      	                	       ]
      	                	   };

      	                	   // 使用刚指定的配置项和数据显示图表。
      	                	   myChart.setOption(option);
      	                    }else if('${tblx}'=="zxt"){
      	                    	var myChart = echarts.init(document.getElementById('main'));
      	                    	var arr = new Array();
      	                    	var index = 0;
      	                    	<c:forEach items="${listtb}" var="item"> 
      	                    	    arr[index++] = ${item.count};
      	                    	</c:forEach>

      	                    	// 指定图表的配置项和数据
      	                    	var option = {
      	                    	    title: {
      	                    	        text: '统计图表'
      	                    	    },
      	                    	    tooltip: {
      	                    	        show: true
      	                    	    },
      	                    	    legend: {
      	                    	        data:['统计数']
      	                    	    },
      	                    	    xAxis : [
      	                    	        {
      	                    	            type : 'category',
      	                    	            axisLabel:{  
      	                    	  	           interval:0,//横轴信息全部显示  
      	                    	  	           rotate:40,//-30度角倾斜显示  
      	                    	  	            },
      	                    	            data : [
      	                    	                <c:forEach items="${listtb}" var="item">
      	                    	                ["${item.type}"],
      	                    	                </c:forEach>
      	                    	            ]
      	                    	        }
      	                    	    ],
      	                    	    yAxis : [
      	                    	        {
      	                    	            type : 'value'
      	                    	        }
      	                    	    ],
      	                    	    series : [
      	                    	        {
      	                    	            name:'统计数',
      	                    	            type:'line',
      	                    	            data: arr
      	                    	            
      	                    	        }
      	                    	    ]
      	                    	};

      	                    	// 使用刚指定的配置项和数据显示图表。
      	                    	myChart.setOption(option);
      	                       }else{
      	                    	 var myChart = echarts.init(document.getElementById('main'));
       	                    	var arr = new Array();
       	                    	var index = 0;
       	                    	<c:forEach items="${listtb}" var="item"> 
       	                    	arr[index++] = ${item.count};
       	                    	</c:forEach>
       	                    	var option = {
       	                    		    tooltip: {
       	                    		        trigger: 'item',
       	                    		        formatter: '{a} <br/>{b}: {c} ({d}%)'
       	                    		    },
       	                    		    legend: {
       	                    		        orient: 'vertical',
       	                    		        left: 10,
       	                    		      data : [
     	                    	                <c:forEach items="${listtb}" var="item">
     	                    	                '${item.type}',
     	                    	                </c:forEach>
     	                    	            ]
       	                    		    },
       	                    		    series: [
       	                    		        {
       	                    		            name: '访问来源',
       	                    		            type: 'pie',
       	                    		            radius: ['50%', '70%'],
       	                    		            avoidLabelOverlap: false,
       	                    		            label: {
       	                    		                show: false,
       	                    		                position: 'center'
       	                    		            },
       	                    		            emphasis: {
       	                    		                label: {
       	                    		                    show: true,
       	                    		                    fontSize: '30',
       	                    		                    fontWeight: 'bold'
       	                    		                }
       	                    		            },
       	                    		            labelLine: {
       	                    		                show: false
       	                    		            },
       	                    		            data: [
       	                    		            	 <c:forEach items="${listtb}" var="item">
       	                    		                {value: '${item.count}', name: '${item.type}'},
       	                    		         	      </c:forEach>
       	                    		            ]
       	                    		        }
       	                    		    ]
       	                    		};
       	                    	myChart.setOption(option);
      	                       }
      	                 myChart.on('click',function (params) {
      	                      // 获取table下所有的tr
      	                      let trs = $("#table tbody tr");
      	                      for (var i = 0;i<trs.length;i++){
      	                          // 获取tr下所有的td
      	                          let tds = trs.eq(i).find("td");
      	                          // 先把之前的标记的success去掉
      	                          $("#table tbody tr").eq(i).removeClass('success');
      	                          var n = 0;
      	                          if('${tjzd}'=="jgsx"){
      	                        	  n=4;
      	                          }else if('${tjzd}'=="kjhdlx"){
      	                        	  n=5;
      	                        	  
      	                          }else{
      	                        	  n=6;
      	                          }
      	                          // 如果点击图示的名字和table下的某一个行的第一个td的值一样
      	                          if (params.name == tds.eq(n).text()){
      	                              //设置success状态
      	                              $("#table tbody tr").eq(i).addClass('success');
      	                              // 跳转到页面指定的id位置
      	                              $("html,body").animate({scrollTop:$("#table tbody tr").eq(i).offset().top},1000);
      	                          }
      	                      }
      	                  });
      	                  // 当鼠标落在tr时，显示浮动
      	                  $("#table tbody").find("tr").on("mouseenter",function () {
      	                   	var n = 0;
	                          if('${tjzd}'=="jgsx"){
	                        	  n=4;
	                          }else if('${tjzd}'=="kjhdlx"){
	                        	  n=5;
	                        	  
	                          }else{
	                        	  n=6;
	                          }
      	                      // 获得当前匹配元素的个数
      	                      let row = $(this).prevAll().length;
      	                      // 获得当前tr下td的名字
      	                      let name = $("#table tbody").find("tr").eq(row).find("td").eq(n).text();
      	                      // 设置浮动
      	                      myChart.dispatchAction({ type: 'showTip',seriesIndex: 0, name:name});//选中高亮
      	                  });
      	                  // 当鼠标移开tr时候取消浮动
      	                   $("#table tbody").find("tr").on("mouseleave",function () {
      	                    	var n = 0;
	                          if('${tjzd}'=="jgsx"){
	                        	  n=4;
	                          }else if('${tjzd}'=="kjhdlx"){
	                        	  n=5;
	                        	  
	                          }else{
	                        	  n=6;
	                          }
      	                      // 获得当前匹配元素的个数
      	                      let row = $(this).prevAll().length;
      	                      // 获得当前tr下td的名字
      	                      let name = $("#table tbody").find("tr").eq(row).find("td").eq(n).text();
      	                      // 设置浮动
      	                      myChart.dispatchAction({ type: 'hideTip', name:name});//选中高亮
      	                  });
						});
                     </script>
                       </div> 
                        
                        
                        
                        
                        <div class="row-fluid">
                            <div class="span12">
                                <table class="table table-bordered table-hover" id="table">
                                    <thead>
                                    <tr>
                                        <th>需求名称</th>
                                        <th>学科分类</th>
                                        <th>归口管理单位</th>
                                        <th>机构全称</th>
                                        <th>机构属性</th>
                                        <th>活动类型属性</th>
                                        <th>技术学求解决方式</th>
                                        <th>所在地域</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="m" items="${list}">
                                        <tr>
                                            <td>${m.jsxqmc}</td>
                                            <td>${m.xkfl}</td>
                                            <td>${m.gkglbm}</td>
                                            <td>${m.jgmc}</td>
                                            <td>${m.jgsx}</td>
                                            <td>${m.kjhdlx}</td>
                                            <td>${m.jsxqjjfs}</td>
                                            <td>${m.szdy}</td>
                                            <td><a href="${pageContext.request.contextPath}/xssh1_Servlet?wjid=${m.wjid}&sy=fljs"><button class="btn btn-success">查看</button></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                       
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
	   <h1 class="invisible">11</h1>		   <h1 class="invisible">11</h1>
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
	   <h1 class="invisible">11</h1>		   <h1 class="invisible">11</h1>
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
	   <h1 class="invisible">11</h1>		   <h1 class="invisible">11</h1>
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