<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="imnu.ImgInfoBean"%>
<%@ page import="imnu.SampleUsage"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2&ak=DUltfwgaw6ozjECzUCeCeZmXe8HGXdOK"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="baidu_map" style="width: 800px ; height: 500px">加载中,请稍后...</div>
</body>
 
<script type="text/javascript">
	//添加地图
	var map = new BMap.Map("baidu_map");
	
	
	<%double x=111.111;%>
	var a="<%=x%>";
	var point = new BMap.Point(parseFloat(a), 40.487);
	
	
	
	

	
	
	map.centerAndZoom(point, 15);  // 初始化地图,设置中心点坐标和地图级别
 
        map.enableScrollWheelZoom();                  // 启用滚轮放大缩小。
        //添加一个跳跃的点
	var marker = new BMap.Marker(point);  // 创建标注
	map.addOverlay(marker);               // 将标注添加到地图中
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	
	
	var pointA = new BMap.Point(111.111,40.487);  // 创建点坐标A--大渡口区
	var pointB = new BMap.Point(106.581515,30.615467);  // 创建点坐标B--江北区
	var polyline = new BMap.Polyline([pointA,pointB], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
	map.addOverlay(polyline); 
	
	
	
	//添加控件
        var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
	var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
	map.addControl(top_left_control);
        map.addControl(top_left_navigation);
        map.addControl(top_right_navigation);	
</script>
</html>
