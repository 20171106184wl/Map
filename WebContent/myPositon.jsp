<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";overflow: hidden;margin:0;}
		#allmap{width:800px;margin:0 auto;height:500px;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4&ak=DUltfwgaw6ozjECzUCeCeZmXe8HGXdOK"></script>
<title>IP定位获取当前城市</title>
<link href="css/base.css" type="text/css" rel="stylesheet" />
</head>
<body>
<iframe src="top.jsp" width="100%" height="100" scrolling="no"
		frameborder="0"></iframe>
		<div class="content">
		
<div id="allmap"></div>
<script type="text/javascript">

// 百度地图API功能
var map = new BMap.Map("allmap");
var point = new BMap.Point(116.331398,39.897445);
map.centerAndZoom(point,12);

function myFun(result){
    var cityName = result.name;
    map.setCenter(cityName);
    alert(cityName);
}
var myCity = new BMap.LocalCity();
myCity.get(myFun);
</script>
</div>
<iframe src="foot.jsp" width="100%" height="150" scrolling="no"
	frameborder="0"></iframe>
</body>
</html>
