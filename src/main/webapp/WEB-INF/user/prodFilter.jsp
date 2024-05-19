<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
document.querySelectorAll('.form-check-input').forEach(function(input) {
    input.addEventListener('change', function(e) {
        let selectedFilterType;
        if (this.closest('.dropdown')) {
            selectedFilterType = this.closest('.dropdown').querySelector('button').getAttribute('data-filter-type');
        } else if (this.closest('.list-card-body')) {
            selectedFilterType = this.closest('.list-card-body').getAttribute('data-filter-type');
        }
    });
});
</script>
<div class="total">총 ${totalCnt}건의 결과가 있어요.</div>

	<div class="row">
		<c:choose>
			<c:when test="${prodFilteredList eq null }">
				<c:forEach items="${prodList}" var="list">
					<div class="col-sm-6 col-md-4 col-lg-3">
						<div class="prod" onclick="location.href = 'prodOne.ko?p_no=${list.p_no}';">
							<div class="list-image-wrapper">
								<span class="list-image-span1"> 
									<span class="list-image-span2"> 
										<img class="float" src="img/${list.p_img}" title="productimg" alt="productimg" />
									</span>
								</span>
								<div class="product-desc">
									<div class="product-title">
										<div>${list.p_name}</div>
									</div>
									<div>
										<span class="product-price">${list.p_price}</span>원
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach items="${prodFilteredList}" var="list">
					<div class="col-sm-6 col-md-4 col-lg-3">
						<div class="prod" onclick="location.href = 'prodOne.ko?p_no=${list.p_no}';">
							<div class="list-image-wrapper">
								<span class="list-image-span1"> 
									<span class="list-image-span2"> 
										<img class="float" src="img/${list.p_img}" title="productimg" alt="productimg" />
									</span>
								</span>
								<div class="product-desc">
									<div class="product-title">
										<div>${list.p_name}</div>
									</div>
									<div>
										<span class="product-price">${list.p_price}</span>원
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
</div>
<!-- 페이징 처리 -->
<ul class="pagination list-pagination">
	<c:choose>
		<c:when test="${pagination.currPageNo == 1}">
			<!-- 현재 페이지가 첫 번째 페이지인 경우 -->
			<span>이전</span>
		</c:when>
		<c:otherwise>
			<!-- 이전 페이지로 이동하는 링크 -->
			<a href="#" onclick="goToPage(${pagination.currPageNo - 1})"
				class="btn btn-primary btn-xs">이전</a>
		</c:otherwise>
	</c:choose>
	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
		<c:choose>
			<c:when test="${page eq pagination.currPageNo}">
				<span>${page}</span>
			</c:when>
			<c:otherwise>
				<a href="#" onclick="goToPage(${page})" class="">${page}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:choose>
		<c:when test="${pagination.currPageNo == pagination.pageCnt}">
			<!-- 현재 페이지가 마지막 페이지인 경우 -->
			<span>다음</span>
		</c:when>
		<c:otherwise>
			<!-- 다음 페이지로 이동하는 링크 -->
			<a href="#" onclick="goToPage(${pagination.currPageNo + 1})" class="btn btn-primary btn-xs">다음</a>
		</c:otherwise>
	</c:choose>
</ul>
	
<div class="list-side-menu" id="list-sideMenu">
	<div class="list-sidemenu-logo-imagewrapper">
		<span class="list-sidemenu-image-span1"> 
			<span class="list-sidemenu-image-span2"> 
				<img class="list-sidemenu-image" src="img/imgProdlist/비채나 상품페이지.png" />
			</span>
		</span>
	</div>
<!-- ul 태그 시작 -->
<ul class="pagination list-pagination">
	<c:choose>
		<c:when test="${pagination.currPageNo == 1}">
			<!-- 현재 페이지가 첫 번째 페이지인 경우 -->
			<span>이전</span>
		</c:when>
		<c:otherwise>
			<!-- 이전 페이지로 이동하는 링크 -->
			<a href="#" onclick="goToPage(${pagination.currPageNo - 1})" class="btn btn-primary btn-xs">이전</a>
		</c:otherwise>
	</c:choose>
	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
		<c:choose>
			<c:when test="${page eq pagination.currPageNo}">
				<span>${page}</span>
			</c:when>
			<c:otherwise>
				<a href="#" onclick="goToPage(${page})" class="">${page}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${pagination.currPageNo == pagination.pageCnt}">
			<!-- 현재 페이지가 마지막 페이지인 경우 -->
			<span>다음</span>
		</c:when>
		<c:otherwise>
			<!-- 다음 페이지로 이동하는 링크 -->
			<a href="#" onclick="goToPage(${pagination.currPageNo + 1})" class="btn btn-primary btn-xs">다음</a>
		</c:otherwise>
	</c:choose>
</ul>