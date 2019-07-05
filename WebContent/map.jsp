<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="imnu.ImgInfoBean"%>
<%@ page import="imnu.SampleUsage"%>
<%@ page import="imnu.Position"%>
<%@ page import="dao.picDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=1.2&ak=DUltfwgaw6ozjECzUCeCeZmXe8HGXdOK"></script>
<title>地图</title>
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/register.css" type="text/css" rel="stylesheet" />


</head>
	<body>
		<iframe src="top.jsp" width="100%" height="100" scrolling="no" frameborder="0"></iframe>
			<div class="content">
		
		<div id="baidu_map" style="width: 800px; height: 500px; margin:0 auto;">加载中,请稍后...
			
		<script type="text/javascript">
	//添加地图
	var map = new BMap.Map("baidu_map");
	//读取exiff信息，取坐标，划线
	<%
	picDAO pic=new picDAO();
	List <String>list=pic.getPicList();
	List<Position>points=new ArrayList<Position>();
	int flag=0;
	float x1=0;
	float y1=0;
	if(list!=null){
	for(String path:list){
		Position point=new Position();
		ImgInfoBean imgInfoBean = new SampleUsage().parseImgInfo(path);
		point.x=imgInfoBean.getLongitudeNumber();
		point.y=imgInfoBean.getLatitudeNumber();
		points.add(point);
	}
	for(Position nowpoi:points){
		if(flag==1){
			%>
			var beforex="<%=x1%>";
			var beforey="<%=y1%>";
			var nowx="<%=nowpoi.x%>";
			var nowy="<%=nowpoi.y%>";
			var pointA = new BMap.Point(parseFloat(beforex),parseFloat(beforey));  // 创建点坐标A--大渡口区
			var pointB = new BMap.Point(parseFloat(nowx),parseFloat(nowy));  // 创建点坐标B--江北区
			var polyline = new BMap.Polyline([pointA,pointB], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
			map.addOverlay(polyline); 
			<%
		}else{
			%>
			var nowx="<%=nowpoi.x%>";
			var nowy="<%=nowpoi.y%>";
			var point = new BMap.Point(parseFloat(nowx),parseFloat(nowy));
			
			

			map.centerAndZoom(point, 15);  // 初始化地图,设置中心点坐标和地图级别
		 
		      map.enableScrollWheelZoom();                  // 启用滚轮放大缩小。
		        //添加一个跳跃的点
			var marker = new BMap.Marker(point);  // 创建标注
			map.addOverlay(marker);               // 将标注添加到地图中
			marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			<%
		}
		x1=nowpoi.x;
		y1=nowpoi.y;
		flag=1;
	}
	}
%>
	
	
	//添加控件
        var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
	var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
	map.addControl(top_left_control);
        map.addControl(top_left_navigation);
        map.addControl(top_right_navigation);	
</script>
</div>
</div>


<iframe src="foot.jsp" width="100%" height="150" scrolling="no"
	frameborder="0"></iframe>
</body>

</html>
