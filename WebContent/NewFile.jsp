<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html,#allmap {width: 800px;height: 500px;overflow: hidden;margin:0;}
#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
#r-result{height:100%;width:20%;float:left;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4&ak=ak=DUltfwgaw6ozjECzUCeCeZmXe8HGXdOK"></script>
<title>获取步行导航的结果面板</title>
</head>
<body>
<form>
					  <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">请输入地名:</th>
					    <td bgcolor="#F8F8F8">
					    <input type="text" name="location1"></td>
					  </tr>
					   <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">请输入地名:</th>
					    <td bgcolor="#F8F8F8">
					    <input type="text" name="location2"></td>
					  </tr>
					<input type ="submit" value="搜索">	
</form>
<div id="l-map"></div>
<div id="r-result"></div>
</body>
</html>
<script type="text/javascript">

// 百度地图API功能
var map = new BMap.Map("l-map");
map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
var walking = new BMap.WalkingRoute(map, {renderOptions: {map: map, panel: "r-result", autoViewport: true}});
walking.search("<%=request.getParameter("location1")%>", "<%=request.getParameter("location2")%>");
</script>

