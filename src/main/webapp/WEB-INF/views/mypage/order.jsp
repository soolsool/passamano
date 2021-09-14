<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
  <script type="text/javascript">
 
  $(function(){
	  $("#check_module").click(function(){
		  IMP.init("imp71134967");
			IMP.request_pay({
				pg:'kcp',
				pay_method:'card',
				merchant_uid:'merchant_'+new Date().getTime(),
				name:'축구공',
				amount:$("#orderTot").val(),
				buyer_email:'tiger@gmail.com',
				buyer_name:'홍길동',
				buyer_tel:'010-2559-8279',
				buyer_addr:'서울시 마포구 서교동',
				buyer_postcode:'123-456'
			},function(rsp){
				console.log(rsp);
				if(rsp.success){
					var msg = "결제가 완료되었습니다.";
					msg += '고유ID:'+rsp.imp_uid;
					msg += '상점 거래ID:'+rsp.merchant_uid;
					msg += '결제 금액:' + rsp.paid_amount;
					msg += '카드 승인번호 :' + rsp.apply_num;
					//alert(msg);
					//location.href = "payok.html";
					//document.getElementById("orderinput").submit();
				}else{
					var msg = "결제에 실패하였습니다.";
					msg += '에러내용:'+rsp.error_msg;
					alert(msg);
				}	
			});
	 });
});

  
  </script>
</head>
<body>

<c:forEach var="c" items="${product }">
<form action="/mypage/orderinsert.do" method="post" id="orderinput">
	<h2>제품정보</h2>
	<!--  상품명: <input type="text" readonly="readonly" value="${c.p }"><br> -->
	수량: <input type="text" readonly="readonly" name="qty" value="${c.basketQty }"><br>
	주문가격: <input type="text" readonly="readonly" name="totalPrice" value="${c.totalPrice }"><br>
	배송비: <input type="text" readonly="readonly" name= "deliveryFee" value="${c.deliveryFee }"><br>
	합계: <input type="text" readonly="readonly" id="orderTot" name="orderTot" value="${c.lastprice }"><br>
	
	유저번호 : <input type="hidden" readonly="readonly" name="userNo" value="${userNo }"><br>
	<!-- 
	<input type="text" readonly="readonly" value="${p.productName }"><br>
 	<input type="hidden" name="productNo" value="${productNo }">
	 -->
	 
	<h2>배송 정보</h2>
	수령인 : <input type="text" name="receiverName"><br>
	연락처 : <input type="text" name="receiverPhone"><br>
	주소	 : <input type="text" name="deliveryAddress1"> <br>
			<input type="text" name="deliveryAddress2"><br>
			<input type="text" name="deliveryAddress3"><br>
	배송요청사항 : <input type="text" name="deliveryMsg"><br>
	

	<button id="check_module" type="button">결제</button>
</form>

</c:forEach>
</body>
</html>