<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파사마노PASSAMANO</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/commonStyle.css">
<link rel="stylesheet" href="/resources/css/seller/productlist.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		let arr;
		$.ajax({url:"/listCategory.do", success:function(data){
			arr = data;
			//console.log(data);
			$.each(data, function(i, cate){
				if(cate.categoryRef == 0){
					let cate1 = $("<option></option>").html(cate.categoryName).attr("value",cate.categoryNo);
					$(".category1").append(cate1);	
				}
			});
			
		}});
		
		
		$(".category1").change(function(){
			let categoryNo = $(this).val();
			$(".category2").empty();
			$.each(arr,function(i, item){
				if(categoryNo == item.categoryRef){
					let cate2 = $("<option></option>").html(item.categoryName).attr("value",item.categoryNo);
					$(".category2").append(cate2);	
				}
			});
			
		});
	});
	
</script>
</head>
<body>
	<!--  헤더 메뉴 부분 시작 -->
	<div class="row">
		<div class="col-2">
		</div>
		<div class="col-8">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div class="col-2">
		</div>
	</div>
	<!--  헤더 메뉴 부분 끝 -->
	<!--  본문 시작 -->
	<div class="row">
	
		<div class="col-2">
		</div>
		<div class="col-8">
		<div class="row">
			<div class="col-2">
				<div class="side-menu text-center">
					<div class="profile-area my-3 py-2">
						<!--  실제 판매자 프로필 이미지 들어가는 곳 -->
						<img src="../resources/images/userprofile/${loginUser.profileFilename}" width="100px" style="border-radius:50%" class="my-2">
						<!--  판매자 이름 보여주기 -->
						<p class="mb-2 fs-4 fw-bold">${loginUser.nickName}님</p>
						<p class="mb-2 fs-5 fw-light">
							<a href="/mypage/profile.do">프로필 관리</a>
						</p>
					</div>
					
					<nav class="my-3">
						<div class="dropdown">
							<a class="nav-link dropdown-toggle my-1" href="#" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
								상품 관리
							</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						    	<li>
						    		<a class="dropdown-item text-center" href="/seller/insertProduct.do">상품 등록</a>
								</li>
						    	<li>
						    		<a class="dropdown-item text-center" href="/seller/listProduct.do">상품 목록</a>
								</li>
							</ul>
						</div>
						<ul class="nav flex-column">
						  <li class="nav-item my-2">
						    <a class="nav-link" href="/seller/listOrder.do">주문 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="/seller/listSales.do">매출 관리</a>
						  </li>
						  <li class="nav-item my-2">
						    <a class="nav-link" href="/seller/listReview.do">리뷰 관리</a>
						  </li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-10">
			<!-- 실제 본문 영역 시작 -->
				<div class="tableTitle mt-5">
					<h4 class="fw-light">
						상품등록
					</h4>
				</div>
				<hr class="pt-0.5">
				<form action="/seller/insertProduct.do" method="post" enctype="multipart/form-data" class="row g-3">
				<br>
					<div class="w-75">
						<div class="row mb-3">
							<label for="id" class="col-sm-3 col-form-label text-end">상품명</label>
							<div class="col-sm-9">	
								<input type="text" class="form-control" id="productName" name="productName">
							</div>	
						</div>
						
						<div class="row mb-3">
							<label for="productPrice" class="col-sm-3 col-form-label text-end">가격</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="productPrice" name="productPrice">
							</div>
							<label for="productQty" class="col-sm-3 col-form-label text-end">수량</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="productQty" name="productQty">
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="category1" class="col-sm-3 form-label text-end">1차분류</label>
							<div class="col-sm-3">
								<select id="category1" class="category1 form-select">
									<option selected value="">전체</option>
								</select>
							</div>
							<label for="category2" class="col-sm-3 form-label text-end">2차분류</label>
							<div class="col-sm-3">
								<select id="cateogry2" class="category2 form-select" name="categoryNo">
									<option selected value="">전체</option>
								</select>
							</div>
						</div>	
						
						<div class="row mb-3">
							<label for="productContent" class="col-sm-3 form-label text-end">내용</label>
							<div class="col-sm-9">
								<textarea rows="10" cols="80" id="productContent" name="productContent"></textarea>
							</div>
						</div>
						<div class="row mb-3">
							<label for="productfile" class="col-sm-3 form-label text-end">상품 사진</label>
							<div class="col-sm-9">
								<input type="file" class="form-control" name="uploadFile" id="productfile">
							</div>
						</div>	
						
						<div class="d-flex justify-content-center buttonArea">
							<button type="submit" class="btn btn-outline-success d-block mx-2">등록</button>
							<button type="reset" class="btn btn-outline-success d-block mx-2">취소</button>	
						</div>
					</div>
	
				</form>
			<!-- 실제 본문 영역 끝 -->
			</div>
			</div>
		</div>
		<div class="col-2">
		</div>

	</div>

	<!--  풋터 끝부분 시작 -->
	<div class="row">
	
		<div class="col-2">
		</div>
		<div class="col-8">
			<%@ include file="../common/footer.jsp" %>
		</div>
		<div class="col-2">
		</div>

	</div>
	<!--  풋터 끝부분 끝 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</body>
</html>