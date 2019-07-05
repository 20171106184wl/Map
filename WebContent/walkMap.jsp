<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 800px;height: 500px;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4&ak=ak=DUltfwgaw6ozjECzUCeCeZmXe8HGXdOK"></script>
	<title>步行导航检索</title>
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
<%=request.getParameter("location1")%>
<%=request.getParameter("location2")%>
<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
	var walking = new BMap.WalkingRoute(map, {renderOptions:{map: map, autoViewport: true}});
	walking.search("<%=request.getParameter("location1")%>", "<%=request.getParameter("location2")%>");
	
</script>
