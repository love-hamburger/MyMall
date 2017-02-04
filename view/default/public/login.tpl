<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城系统</title>
	<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/default/style/login.css" />
	<link rel="stylesheet" type="text/css" href="view/default/style/reg.css" />
	<script type="text/javascript" src="view/default/js/jquery.js"></script>
	<script type="text/javascript" src="view/default/js/login.js"></script>
</head>
<body>
	{include file='default/public/header.tpl'}
	<div id="reg">
		<form action="?a=member&m=login" name="login" method="post">
			<input type="hidden" name="ajaxlogin" id="ajaxlogin" val=''/>
			<input type="hidden" name="ajaxcode" id="ajaxcode" val=''/>
			<dl>
				<dd>
					用 户 名：
					<input type="text" name="user" id="user"  class="text" />
				</dd>
				<dd>
					密　　码：
					<input type="password" name="pass" id="pass"  class="text" />
				</dd>
				<dd>
					验 证 码：
					<input  type="text" name="frontcode" id="code"/>
					<img class="code" src="?a=Call&m=validateFrontCode" onclick="javascript:this.src='?a=Call&m=validateFrontCode&tm='+Math.random()">
				</dd>
				<dd>
					<input type="checkbox" name="keep" />
					请保留这次登录信息
				</dd>
				<dd>
					<input type="submit" name="send" onclick="return loginUser();" value="登录" class="submit" />
				</dd>
			</dl>
		</form>
	</div>
{include file='default/public/footer.tpl'}
</body>
</html>