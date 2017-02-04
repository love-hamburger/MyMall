<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>陈龙辉后台商城管理系统</title>
	<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css"/>
	<link rel="stylesheet" type="text/css" href="view/admin/style/attr.css"/>
	<script type="text/javascript" src="view/admin/js/jquery.js"></script>
	<script type="text/javascript" src="view/admin/js/attr.js"></script>
</head>
<body>
	<h2>
		商品————修改属性
		<a href="?a=attr">返回属性列表</a>
	</h2>
	 <form method="post" action="?a=attr&m=update&id={$oneAttr.id}">
	 <input type="hidden" name="ajaxName" val="">
	 <input type="hidden" name="GET" value="{$oneAttr.id}">
		<dl class="form">
			<dd>
				属性名称：
				<input type="text" name="name" value="{$oneAttr.name}" placeholder="请输入属性名称" /><span class="red">[必填]</span>
			</dd>
			<dd>
				是否单选：
				<input type="radio" name="way" value="0" {if $oneAttr.way == 0}checked="checked"{/if}/>单选
				<input type="radio" name="way" value="1" {if $oneAttr.way == 1}checked="checked"{/if}/>多选
			</dd>
			<dd>
				属性简介：
				<textarea name="info" placeholder="请输入属性简介">{$oneAttr.info}</textarea><span class="red">[必填]</span>(用"|"分割开,例如:白色|红色|蓝色|)
			</dd>
			<dd>
				商品类别：
					{foreach from=$addNav key=key item=value}
					{if $value.sub}
					<option disabled="disabled" value="{$value.id}">{$value.name}</option>
					{foreach from=$value.sub key=key1 item=value1}
					<input {if in_array($key1,$oneAttr.nav)}checked="checked"{/if} type="checkbox" name="nav[]" value="{$key1}" >{$value1}
					{/foreach}
					{else}
					<option type="checkbox" disabled="disabled" value="{$value.id}">{$value.name}</option>
					{/if}
					{/foreach}
			</dd>
			<dd>
				<button onclick="return updateAttr()" class="submit" type="submit"  name="sub" >修改属性</button>
			</dd>
		</dl>
	</form> 
</body>
</html>