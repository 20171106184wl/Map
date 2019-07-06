<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{width:800px;margin:0 auto;height:500px;}
		p{margin-left:5px; font-size:14px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4&ak=DUltfwgaw6ozjECzUCeCeZmXe8HGXdOK"></script>
	<title>根据关键字本地搜索</title>
	<link href="css/base.css" rel="stylesheet" type="text/css">
</head>
<body>
<iframe src="top.jsp" width="100%" height="100" scrolling="no"
		frameborder="0"></iframe>
		<div class="content">
		<div class="centr">
<form>

					  <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">请输入地名:</th>
					    <td bgcolor="#F8F8F8">
					    <input type="text" name="location"></td>
					  </tr>
					<input type ="submit" value="搜索">	
</form>
</div>
	<div id="allmap"></div>
	
	<iframe src="foot.jsp" width="100%" height="150" scrolling="no"
	frameborder="0"></iframe>
	</div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");          
	map.centerAndZoom(new BMap.Point(111.65, 40.82), 11);
	var local = new BMap.LocalSearch(map, {
		renderOptions:{map: map}
	});
	local.search("<%=request.getParameter("location")%>");
	map.enableScrollWheelZoom();  // 启用滚轮放大缩小。
	var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
	var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
	map.addControl(top_left_control);
	map.addControl(top_left_navigation);
	map.addControl(top_right_navigation);	
	
</script>