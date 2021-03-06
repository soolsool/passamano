<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파사마노:::리뷰</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<link rel="stylesheet" href="/resources/css/mypage/selectreview.css">
</head>
<body>
	<div id="wrap">
		<!--  헤더 메뉴 부분 시작 -->
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<%@ include file="../common/header.jsp"%>
			</div>
			<div class="col-2"></div>
		</div>
		<!--  헤더 메뉴 부분 끝 -->
		<!--  본문 시작 -->
		<div class="row">

			<div class="col-2"></div>
			<div class="col-8">
				<div class="col-2 wrapper">
					<div class="side-menu text-center">
						<div class="profile-area my-3 py-2">
							<!--  실제 회원 프로필 이미지 들어가는 곳 -->
							<div class="thumb">
								<img src="../resources/images/userprofile/${userInfo.profileFilename}"
									class="my-2 profile-img">
								<form class="img-form" action="/mypage/updateProfileImg.do"
									method="POST" enctype="multipart/form-data">
									<input type="file" class="file" name="uploadFile"
										onchange="changeValue(this)">
								</form>
							</div>

							<!--  회원 이름 보여주기 -->
							<p class="mb-2 fs-4 fw-bold">${userInfo.nickName}님</p>
							<p class="mb-2 fs-5 fw-light">
								<a href="/mypage/profile.do">프로필 관리</a>
							</p>
						</div>

						<nav class="my-3">
							<ul class="nav flex-column">
								<li class="order-title nav-item my-2">
									<a href="/mypage/home.do" class="nav-link order-title-link">
										주문/배송/리뷰
									</a>
								</li>
								<li class="basket nav-item my-2 ">
									<a href="/mypage/cart.do" class="nav-link">
										장바구니
									</a>
								</li>
								<li class="zzim nav-item my-2">
									<a href="/mypage/zzim.do" class="nav-link">
										찜한 상품
									</a>
								</li>
								<li class="select-review nav-item my-2 clicked">
									<a href="/mypage/selectreview.do" class="nav-link">
										내가 쓴 리뷰
									</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>


				<div class="col-10 content text-center">
					<!-- 실제 본문 영역 시작 -->
					<div class="mypage-item">
						<br>
						<div class="month-wrapper" style="max-width: 80%;">
							<button class="btn-month all-month">전체</button>
							<button class="btn-month one-month">1개월</button>
							<button class="btn-month three-month">3개월</button>
							<button class="btn-month six-month">6개월</button>
						</div>
						<c:forEach items="${selectReview}" var="sr">
							<div class="first-card mb-3" style="max-width: 90%;">

								<div class="first-card-header">
									<input type="hidden" class="month" value="<fmt:formatDate value='${sr.reviewDate}' pattern='MM'/>" date="<fmt:formatDate value='${sr.reviewDate}' pattern='dd'/>" year="<fmt:formatDate value='${sr.reviewDate}' pattern='yyyy'/>">
									<p></p>
								</div>
								<div class="second-card mb-3" style="max-width: 100%;">
									<div class="orderlist-body">
										<table>
											<tr>
												<td class="product-img"><a
													href='/product.do?productNo=${sr.productNo }'> <img
														src="../resources/images/productimage/${sr.imageName }"
														width="120" height="90">
												</a></td>
												<td class="product-detail">
													<p class="card-text">
														<a href='/product.do?productNo=${sr.productNo }'>
															${sr.productName }, ${sr.detailQty }개<br> <strong>${sr.payPrice }원</strong>
												</a>
														</p>
												</td>
											</tr>
										</table>
									</div>
									<div class="select-review-wrapper">
										<table>
											<tr>
												<td></td>
												<td>
													<div class="review-img">
														<c:if test="${not empty sr.reviewImg}">
															<img width=400px src="../resources/images/reviewimage/${sr.reviewImg}">
														</c:if>
													<div>
												</td>
											</tr>
											<tr>
												<td class="title">평점</td>
												<td class="eval">
												<input type="hidden"
													class="evaluation" name="evaluation"
													value="${sr.reviewEvaluation}">
													<p class="star star1">☆</p>
													<p class="star star2">☆</p>
													<p class="star star3">☆</p>
													<p class="star star4">☆</p>
													<p class="star star5">☆</p></td>
											</tr>
											<tr>
												<td class="title">제목</td>
												<td>${sr.reviewTitle}</td>
											</tr>
											<tr>
												<td class="review-content title">내용</td>
												<td>${sr.reviewContent }</td>
											</tr>

											<tr>
												<td class="button">
													<div class="btn-wrap">
														<form action="/mypage/deleteReview.do" onsubmit="return check()">
															<input type="hidden" name="reviewNo"
																value="${sr.reviewNo}"> <input type="submit"
																class="btn-delete" value="삭제하기">
														</form>
													</div>
												</td>
												<td></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- 실제 본문 영역 끝 -->
				</div>
			</div>
			<div class="col-2"></div>
		</div>


		<!--  본문 시작 -->
		<!--  풋터 끝부분 시작 -->
		<div class="row">

			<div class="col-2"></div>
			<div class="col-8">
				<%@ include file="../common/footer.jsp"%>
			</div>
			<div class="col-2"></div>

		</div>
		<!--  풋터 끝부분 끝 -->
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
<script type="text/javascript">
	var sidebar = document.querySelectorAll('.nav-item');
	var eval=document.querySelectorAll(".evaluation");
	var monthList = document.querySelectorAll(".month");

	$(".profile-img").click(function() {
		$(".file").click();
	});

	function changeValue() {
		$(".img-form").submit();
	}
	
	eval.forEach(function(e){
		if(e.value==1){
			$(e).closest(".eval").children(".star1").html("★");
		}
		else if(e.value==2){
			$(e).closest(".eval").children(".star1").html("★");
			$(e).closest(".eval").children(".star2").html("★");
		}
		else if(e.value==3){
			$(e).closest(".eval").children(".star1").html("★");
			$(e).closest(".eval").children(".star2").html("★");
			$(e).closest(".eval").children(".star3").html("★");
		}
		else if(e.value==4){
			$(e).closest(".eval").children(".star").html("★");
			$(e).closest(".eval").children(".star5").html("☆");
		}
		else if(e.value==5){
			$(e).closest(".eval").children(".star").html("★");
		}
	});
	
	$(".all-month").click(function(){
		$(".first-card").show();
		$(".btn-month").removeClass("clicked-month");
		$(".all-month").addClass("clicked-month");
	});
	
	$(".one-month").click(function() {
		var d = new Date();
		var date = d.getDate();
		var month = d.getMonth() + 1;
		var year = d.getFullYear();
		
		$(".btn-month").removeClass("clicked-month");
		$(".one-month").addClass("clicked-month");
		$(".first-card").show();
		monthList.forEach(function(m) {
		if(year==$(m).attr('year')||(year-1==$(m).attr('year')&&month-1==0)){
		if(month-1==0){
			if((Number)(m.value)==12){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<12){
				$(m).closest(".first-card").hide();
			}
		}
		else{
			if((Number)(m.value)==month-1){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<month-1){
				$(m).closest(".first-card").hide();
			}
		
		}	
		}
		});
	});
	
	$(".three-month").click(function(){
		var d = new Date();
		var date = d.getDate();
		var month = d.getMonth() + 1;
		var year = d.getFullYear();
		
		$(".btn-month").removeClass("clicked-month");
		$(".three-month").addClass("clicked-month");
		$(".first-card").show();
		monthList.forEach(function(m) {
		if(year==$(m).attr('year')||(year-1==$(m).attr('year')&&month-3==0)||(year-1==$(m).attr('year')&&month-3==-1)||(year-1==$(m).attr('year')&&month-3==-2)){
		if(month-3==0){
			if((Number)(m.value)==12){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<12){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-3==-1){
			if((Number)(m.value)==11){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<11){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-3==-2){
			if((Number)(m.value)==10){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<10){
				$(m).closest(".first-card").hide();
			}
		}
		else{
			if((Number)(m.value)==month-3){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<month-3){
				$(m).closest(".first-card").hide();
			}
		
		}	
		}
		});
	});
	
	$(".six-month").click(function(){
		
		var d = new Date();
		var date = d.getDate();
		var month = d.getMonth() + 1;
		var year = d.getFullYear();
		
		$(".btn-month").removeClass("clicked-month");
		$(".six-month").addClass("clicked-month");
		$(".first-card").show();
		monthList.forEach(function(m) {
		if(year==$(m).attr('year')||(year-1==$(m).attr('year')&&month-6==0)||(year-1==$(m).attr('year')&&month-6==-1)||
				(year-1==$(m).attr('year')&&month-6==-2)||(year-1==$(m).attr('year')&&month-6==-3)||(year-1==$(m).attr('year')&&month-6==-4)||
				(year-1==$(m).attr('year')&&month-6==-5)){
		if(month-6==0){
			if((Number)(m.value)==12){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<12){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-1){
			if((Number)(m.value)==11){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<11){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-2){
			if((Number)(m.value)==10){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<10){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-3){
			if((Number)(m.value)==9){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<9){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-4){
			if((Number)(m.value)==8){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<8){
				$(m).closest(".first-card").hide();
			}
		}
		else if(month-6==-5){
			if((Number)(m.value)==7){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<7){
				$(m).closest(".first-card").hide();
			}
		}
		else{
			if((Number)(m.value)==month-6){
				if((Number)($(m).attr('date'))<date){
				$(m).closest(".first-card").hide();
				}
			}
			else if((Number)(m.value)<month-6){
				$(m).closest(".first-card").hide();
			}
		
		}	
		}
		});
	});
	function check(){
		var re=confirm("정말로 삭제하시겠습니까?");
		if (re) {
			alert("삭제가 완료되었습니다.");
		}
		else{
				return false;
		}
	}


	$(".select-review").click();
	$(".all-month").click();
</script>
</html>