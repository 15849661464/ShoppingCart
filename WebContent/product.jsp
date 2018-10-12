<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Produce List</title>
<style type="text/css">
/* Table Head */
#table-7 {
	border-collapse: collapse;
}

#table-7 thead th {
	background-color: rgb(81, 130, 187);
	color: #fff;
	border-bottom-width: 0;
}

/* Column Style */
#table-7 td {
	color: #000;
}
/* Heading and Column Style */
#table-7 tr, #table-7 th {
	border-width: 1px;
	border-style: solid;
	border-color: rgb(81, 130, 187);
}

/* Padding and font style */
#table-7 td, #table-7 th {
	padding: 5px 10px;
	font-size: 12px;
	font-family: Verdana;
	font-weight: bold;
}
</style>
</head>
<body>
	<div align="center">


		<table id="table-7" border="1px solid">
			<caption align="top">商品列表</caption>
			<thead>
				<th>编号</th>
				<th>产品</th>
				<th>介绍</th>
				<th>单价</th>
				<th>数量</th>
				<th>选择</th>
			</thead>

			<tbody>
				<tr>
					<td>1001</td>
					<td>联想笔记本</td>
					<td>介绍</td>
					<td id="unitPrice">3000</td>
					<td><input type="text"  id="lenovo" /></td>
					<td><button id="lenovoBtn" onclick="addProduct(this.id)">Add
							to Shopping cart</button></td>
				</tr>
				<tr>
					<td>1002</td>
					<td>戴尔游侠笔记本</td>
					<td>介绍</td>
					<td>4000</td>
					<td><input type="text" id="dell" /></td>
					<td><button id="dellBtn" onclick="addProduct(this.id)">Add
							to Shopping cart</button></td>
				</tr>
				<tr>
					<td>1003</td>
					<td>苹果笔记本</td>
					<td>介绍</td>
					<td>5000</td>
					<td><input type="text" id="apple" /></td>
					<td><button id="appleBtn" onclick="addProduct(this.id)">Add
							to Shopping cart</button></td>
				</tr>
				<tr>
					<td>1004</td>
					<td>外星人笔记本</td>
					<td>介绍</td>
					<td>6000</td>
					<td><input type="text" id="alienware" /></td>
					<td><button id="alienwareBtn" onclick="addProduct(this.id)">Add
							to Shopping cart</button></td>
				</tr>
				<tr>
					<td colspan="3"><button
							onclick="toShoppingCarts()">去结算</button></td>
					<td colspan="3"><button onclick="clearAllCookie()">清空购物车</button></td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- 使用JavaScript 将商品的数量写入到cookie中-->
	<script type="text/javascript">
		//跳转到购物车结算页面的函数
		function toShoppingCarts()
		{
			window.location.href='shoppingcarts.jsp';
		}
		//设置一个添加函数，将input中的数值 添加到购物车中
		function addProduct(buttonId) {
			if (buttonId == 'lenovoBtn') {
				var lenovoAmount = document.getElementById("lenovo").value;
				setCookie("1001-联想笔记本-3000-btn_lenovo", lenovoAmount);
			} else if (buttonId == 'dellBtn') {
				var dellAmount = document.getElementById("dell").value;
				setCookie("1002-Dell笔记本-4000-btn_dell", dellAmount);
			} else if (buttonId == 'appleBtn') {
				var appleAmount = document.getElementById("apple").value;
				setCookie("1003-苹果笔记本-5000-btn_apple", appleAmount);
			} else if (buttonId == 'alienwareBtn') {
				var alienWareAmount = document.getElementById("alienware").value;
				setCookie("1004-外星人笔记本-6000-btn_alienware", alienWareAmount);
			}
		}

		function setCookie(name, value) {
			//var d = new Date();
			//d.setTime(d.getTime() + (30 * 24 * 60 * 60 * 1000));
			//var expires = "expires=" + d.toGMTString();
			document.cookie = escape(name) + "=" + value + ";";
			alert("添加成功");

		}

		//获取cookie中key 对应的值
		function getCookie(name) {
			var arr, reg = new RegExp("(^| )" + escape(name) + "=([^;]*)(;|$)");
			if (arr = document.cookie.match(reg))
				return unescape(arr[2]);
			else
				return null;
		}

		//清空所有cookie
		function clearAllCookie() {
			var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
			if (keys) {
				for (var i = keys.length; i--;)
					document.cookie = keys[i] + '=0;expires='
							+ new Date(0).toUTCString()
			}
			alert("清空购物车成功!");
		}
	</script>

</body>
</html>