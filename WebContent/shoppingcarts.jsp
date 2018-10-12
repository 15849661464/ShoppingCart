<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车结算页面</title>
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
<!--  
<body onload="addTableCell('8888','火影笔记本','5989','8','699999','lenovoBtn')">
-->
<body onload="loadTableInfo()">

	<div align="center">


		<table id="table-7" border="1px solid">
			<caption align="top">商品列表</caption>
			<thead>
				<th>编号</th>
				<th>名称</th>
				<th>单价</th>
				<th>数量</th>
				<th>金额</th>
				<th>操作</th>
			</thead>

			<tbody>


			</tbody>
		</table>
		<h6 id="allMoney"></h6>
	</div>

	<script type="text/javascript">
		//创建Table 的函数
		function loadTableInfo() {
			//alert(unescape(document.cookie));
			//console.log(unescape(document.cookie));
			
			var productList = [];
			var cookieArr = document.cookie.split(";");
			var total=0;
			for (var i = 0; i < cookieArr.length; i++) {
				console.log(unescape(cookieArr[i]));
				var attr = unescape(cookieArr[i]).split("-");
				var product = new Object();
				product.id = attr[0];
				product.name = attr[1];
				product.unitprice = attr[2];
				product.btn_id = attr[3].split("=")[0];
				product.amount = attr[3].split("=")[1];
				product.totalPrice = parseInt(product.unitprice)*parseInt(product.amount);
				total+=product.totalPrice;
				addTableCell(product.id, product.name, product.unitprice,product.amount, product.totalPrice,product.btn_id);
				productList.push(product);
			}
			
			console.log(total);
			document.getElementById('allMoney').innerHTML="合计总金额:￥"+total;
			//console.log(productList);
			//console.log(productList[1]);
			
		}

		//向表格中添加一行数据  参数 ： 产品编号、产品名称、产品价格、产品数量、总计价格、设置button的id
		function addTableCell(productId, productName, productPrice,
				productAmount, totalPrice, BtnId) {
			var table = document.getElementById("table-7");
			var newRow = table.insertRow(); //创建新行

			var idCell = newRow.insertCell(0); //创建新单元格
			idCell.innerHTML = "<td>" + productId + "</td>"; //单元格内的内容
			idCell.setAttribute("align", "center"); //设置位置

			var nameCell = newRow.insertCell(1); //创建新单元格
			nameCell.innerHTML = "<td>" + productName + "</td>";
			nameCell.setAttribute("align", "center"); //设置位置

			var priceCell = newRow.insertCell(2); //创建新单元格
			priceCell.innerHTML = "<td>" + productPrice + "</td>";
			priceCell.setAttribute("align", "center"); //设置位置

			var amountCell = newRow.insertCell(3); //创建新单元格 
			amountCell.innerHTML = "<td>" + productAmount + "</td>";
			amountCell.setAttribute("align", "center"); //设置位置

			var totalCell = newRow.insertCell(4); //创建新单元格 
			totalCell.innerHTML = "<td>" + totalPrice + "</td>";
			totalCell.setAttribute("align", "center"); //设置位置

			var operateCell = newRow.insertCell(5); //创建新单元格 
			operateCell.innerHTML = "<td><button id='"
					+ BtnId
					+ "' onclick='deleteProduct(this.id)'>Delete Product</button></td>";
			operateCell.setAttribute("align", "center"); //设置位置

		}

		function delCookieByName(name) {
			document.cookie = escape(name) + '=0;expires='
					+ new Date(0).toUTCString();
		}

		function deleteProduct(btnId) {
			if (btnId == "btn_lenovo") {
				delCookieByName("1001-联想笔记本-3000-btn_lenovo");
				alert("删除成功");
				window.location.href = 'shoppingcarts.jsp';
			} else if (btnId == "btn_dell") {
				delCookieByName("1002-Dell笔记本-4000-btn_dell");
				alert("删除成功");
				window.location.href = 'shoppingcarts.jsp';
			} else if (btnId == "btn_apple") {
				delCookieByName("1003-苹果笔记本-5000-btn_apple");
				alert("删除成功");
				window.location.href = 'shoppingcarts.jsp';
			} else if (btnId == "btn_alienware") {
				alert(document.cookie);
				delCookieByName("1004-外星人笔记本-6000-btn_alienware");
				alert("删除成功！！！！");
				window.location.href = 'shoppingcarts.jsp';
			}

		}
	</script>

</body>
</html>