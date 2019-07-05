<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
		#allmap{height:500px;width:100%;}
		#r-result,#r-result table{width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4&ak=ak=DUltfwgaw6ozjECzUCeCeZmXe8HGXdOK"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<title>根据起终点名称驾车导航</title>
</head>
<body>
	<div id="allmap"></div>
	<div id="driving_way">
	<form>
		<select name="way">
			<option value="0">最少时间</option>
			<option value="1">最短距离</option>
			<option value="2">避开高速</option>
		</select>
	
		<input input name="" type="submit"  value="保存"/>
		</form>
	</div>
	<div id="r-result"></div>
</body>
</html>
<script type="text/javascript">
var map = new BMap.Map('allmap');
map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);

var driving = new BMap.DrivingRoute(map, {
    renderOptions: {
        map: map
    }
});

driving.search('圆明园', '西单');
</script>

<%=request.getParameter("way")%>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var start = "天安门";
	var end = "百度大厦";
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
	//三种驾车策略：最少时间，最短距离，避开高速
		var routePolicy = [BMAP_DRIVING_POLICY_LEAST_TIME,BMAP_DRIVING_POLICY_LEAST_DISTANCE,BMAP_DRIVING_POLICY_AVOID_HIGHWAYS];
		map.clearOverlays(); 
		var i=<%=request.getParameter("way")%>;
		search(start,end,BMAP_DRIVING_POLICY_LEAST_TIME); 
		function search(start,end,route){ 
			var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true},policy: route});
			driving.search(start,end);
		}
</script>