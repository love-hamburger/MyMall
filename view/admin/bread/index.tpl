<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>陈龙辉后台商城管理系统</title>
	<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css"/>
	<script type="text/javascript" src="view/admin/js/jquery.js"></script>
</head>
<body>
	<h2>
		商品————品牌列表页
		<a href="?a=bread&m=add">添加品牌</a>
	</h2>
	<div id="list">
		<table>
			<tr>
				<th>品牌名称</th>
				<th>品牌信息</th>
				<th>官方网站</th>
				<th>添加时间</th>
				<th>操作</th>
			</tr>
			{foreach from=$allBread key=key item=value}
			<tr>
				<td id="read">{$value.name}</td>
				<td>{$value.info}</td>
				<td>{$value.url}</td>
				<td>{$value.reg_time|date_format:'%Y-%m-%d %H:%M:%S'}</td>
				<td>
					<a href="?a=bread&m=update&id={$value.id}"><img src="view/admin/images/edit.gif"   alt="编辑" title="编辑" /></a>
					<a href="?a=bread&m=delete&id={$value.id}" onclick="return confirm('确定要删除数据吗?') ? true : false"><img src="view/admin/images/drop.gif" alt="删除" title="删除" /></a>
				</td>
				{foreachelse}
				<td colspan="5">没有任何数据</td>
			</tr>
			{/foreach}
		</table>
	</div>
	<div id="page">{$page}</div>
</body>
</html>