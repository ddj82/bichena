<%@ include file="../../common/navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Cache-Control" content="no-store" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css" />
    <title>상품 리스트</title>
    <style>

 	div.prod img {
        width: 200px;
      }

      span.prod {
        cursor: pointer;
      }

      .filter-box {
        width: 100%;
        max-width: 1140px;
        display: flex;
        margin: 0 auto;
        justify-content: flex-start;
        padding: 30px 0;
      }
      .filter {
        display: flex;
      }

      .list-dropdown-menu {
        width: 350px;
        padding: 20px 20px;
        position: absolute;
        top: 50px;
        box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px 0px;
        border-radius: 10px;
        z-index: 200;
      }

      .prod {
        margin-bottom: 50px;
      }
      .product-desc {
        display: flex;
        flex-direction: column;
        padding-top: 20px;
      }

      .filter-box-row {
        box-sizing: border-box;
        display: flex;
        flex-flow: wrap;
        width: 100%;
        margin: 0 auto;
      }
      .form-check {
        display: flex;
        align-items: center;
        height: 50px;
        max-width: 50%;
      }

      .btn {
        border: 1px solid #bcbcbc;
        margin-right: 30px;
      }
      .btn img {
        margin-left: 20px;
        width: 14px;
        height: 14px;
      }

      input[class="form-check-input"] {
        display: inline-block;
        width: 20px;
        height: 20px;
        border: 2px solid #bcbcbc;
        cursor: pointer;
      }

      .form-check-label {
        display: flex;
        align-items: center;
/*         padding: 20px; */
      }

      .form-check-label p {
        padding-left: 10px;
        margin: 18px 0;
      }

      .total {
        display: flex;
        margin-bottom: 20px;
      }

      .product-title,
      .product-price,
      .jumbotron-subtitle {
        font-family: "Noto Sans KR", sans-serif;
        font-optical-sizing: auto;
        font-weight: 500;
        font-style: normal;
      }
      .product-price {
        letter-spacing: 0.6px !important;
        font-weight: 700;
      }

      .jumbotron-title {
        font-size: 20px;
        font-weight: 700;
      }

      .list-container {
        margin-top: 60px;
        width: 100%;
        max-width: 1144px;
        margin: 0px auto;
      }
      .list-pagination {
        display: flex;
        justify-content: center;
        margin: 0 auto;
      }

      .list-image-wrapper {
        width: 100%;
        height: 100%;
        position: relative;
        overflow: hidden;
        border-radius: 10px;
      }
      .list-image-span1 {
        box-sizing: border-box;
        display: block;
        overflow: hidden;
        width: initial;
        height: initial;
        background: none;
        opacity: 1;
        border: 0px;
        margin: 0px;
        padding: 0px;
        position: relative;
      }
      .list-image-span2 {
        box-sizing: border-box;
        display: block;
        width: initial;
        height: initial;
        background: none;
        opacity: 1;
        border: 0px;
        margin: 0px;
        padding: 100% 0px 0px;
      }
      .list-image-span2 img {
        position: absolute;
        inset: 0px;
        box-sizing: border-box;
        padding: 0px;
        border: none;
        margin: auto;
        display: block;
        width: 0px;
        height: 0px;
        min-width: 100%;
        max-width: 100%;
        min-height: 100%;
        max-height: 100%;
        object-fit: cover;
        object-position: center bottom;

        transform: scale(1);
        transition: none 0.3s ease 0s;
      }

      .jumbotron {
        margin-top: 60px;
        max-height: 150px;
        padding: 10px;
        background-color: #bef5be;
        display: block;
        align-items: center;
      }

      .jumbotron-left {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
        padding-left: 80px;
      }

      .jumbotron-right {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        padding-right: 30px;
      }

      .jumbotron img {
        width: 120px;
        height: 100%;
      }
      .filter-button {
        display: none;
      }

      input:focus {
        outline: none;
      }

      a {
        color: black;
      }

      a:hover {
        cursor: pointer;
        color: black;
      }

      .list-bottom-line {
        display: block;
        width: 100%;
        border-bottom: 1px solid #e0e0e0;
        margin: 20px 0;
      }

      @media (max-width: 876px) {
        .filter-box {
          display: none;
        }

        .list-side-menu {
          position: fixed;
          top: 0;
          right: -300px;
          /* 초기에는 화면 밖에 위치하도록 설정 */
          width: 300px;
          /* 사이드 메뉴의 너비 */
          height: 100%;
          /* 화면의 높이 */
          background-color: white;
          /* 사이드 메뉴의 배경색 */
          transition: right 0.3s ease;
          /* 변화를 부드럽게 만들기 위한 transition 속성 추가 */
          z-index: 9999;
          /* 다른 요소 위에 표시되도록 z-index 설정 */

          display: flex;
          /* 내용을 수직으로 배치하기 위해 flex로 변경 */
          flex-direction: column;
          /* 내용을 수직으로 배치 */
          padding-top: 50px;
          /* 내용이 화면에 가려지지 않도록 padding 추가 */
          overflow-y: scroll;
        }
        .show-list-side-menu .list-side-menu {
          right: 0 !important;
          /* 화면에 나타나도록 위치 조정 */
        }
        .show-list-side-menu {
          display: block !important;
        }
        .top-box {
          position: relative;
        }

        .filter-button {
          position: absolute;
          right: 0;
          display: block;
        }
        .filter-icon {
          width: 20px;
        }
        a.login {
          display: none;
        }
        .list-side-menu .list-navbar-nav-side {
          list-style: none;
          /* 리스트 스타일 제거 */
          padding: 0;
          /* 내부 패딩 제거 */
        }
        .list-side-menu {
          margin-bottom: 10px;
          /* 각 항목 사이의 간격 조절 */
        }
        .list-side-menu {
          color: #333;
          /* 링크 색상 설정 */
          text-decoration: none;
          /* 밑줄 제거 */
          display: block;
          /* 링크를 블록 요소로 설정하여 전체 너비를 차지하도록 함 */
        }
        .list-side-menu {
          color: #000;
          /* 호버 시 색상 변경 */
        }
        .list-side-menu-overlay {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.5);
          /* 검은색 반투명 배경 */
          z-index: 9998;
          /* 다른 요소 위에 표시되도록 설정 */
          display: none;
          /* 초기에는 보이지 않도록 설정 */
        }
        .show-list-side-menu .list-side-menu-overlay {
          display: block;
          /* 사이드 메뉴가 열렸을 때만 보이도록 함 */
        }

        .list-side-bottom-line {
          border-bottom: 1px solid #e0e0e0;
        }
        .list-card-header {
          display: flex;
          justify-content: center;
          margin-bottom: 0;
          background-color: white;
          border-bottom: none;
          padding: 20px 0;
        }
        .list-card {
          background-color: #fff;
          border: none;
        }
        .list-card-body {
          background-color: ghostwhite;
          border-top: 1px solide rgba(0.5);
          cursor: pointer;
          padding: 1rem;
          font-size: 15px;
          display: flex;
          align-items: center;
          justify-content: center;
          color: #707070;
        }
        .list-card-body img {
          width: 32px;
          height: 32px;
          margin-right: 10px;
        }
        .list-navbar-toggler {
          font-size: 16px;
          padding-left: 4px;
        }
        .list-collapse-one .list-card-body {
          padding-left: 5.5rem;
          justify-content: flex-start;
        }

        .list-sidemenu-logo-imagewrapper {
          width: 100%;
          position: relative;
          overflow: hidden;
          border-radius: 10px;
        }

        .list-sidemenu-image-span1 {
          box-sizing: border-box;
          display: block;
          overflow: hidden;
          width: initial;
          height: initial;
          background: none;
          opacity: 1;
          border: 0px;
          margin: 0px;
          padding: 0px;
          position: relative;
        }

        .list-sidemenu-image-span2 {
          box-sizing: border-box;
          display: block;
          width: initial;
          height: initial;
          background: none;
          opacity: 1;
          border: 0px;
          margin: 0px;
          padding: 100% 0px 0px;
        }

        .list-sidemenu-image {
          position: absolute;
          inset: 0px;
          box-sizing: border-box;
          padding: 0px;
          border: none;
          margin: auto;
          display: block;
          width: 200px;
          height: 0px;
          min-width: 100%;
          max-width: 100%;
          min-height: 100%;
          max-height: 100%;
          object-fit: cover;
          object-position: center bottom;

          transform: scale(1);
          transition: none 0.3s ease 0s;
        }
      }

      @media (min-width: 876px) {
        .list-side-menu {
          display: none;
        }
      }
    </style>
    <script>
//       $(".form-check-input").click(function (e) {
//     	  console.log('체크박스 체크시 함수 시작');
//         let selectedFilterType = $(this).closest(".dropdown").find("button").text().trim(); 
//         // 해당 체크박스의 부모 요소인 dropdown의 button의 텍스트를 가져와서 필터의 종류로 사용합니다.
//         let selectedFilter = e.target.value; // 체크박스의 값
//         if (selectedFilter == "전체보기") {
//         	console.log('전체보기 if문');
//           location.href = "prodList.ko";
//         } else {
//           // 선택한 필터의 값을 쿼리 매개변수로 사용하여 서버로 요청 보내기
//           location.href = "getFilteredProducts.ko?selectedFilterType=" + selectedFilterType + "&selectedFilter=" + selectedFilter;
//         }
//       });

//       $(document).ready(function () {
//         $(".list-navbar-toggler").click(function () {
//           $(".list-side-menu").toggleClass("show-list-side-menu");
//           $("body").toggleClass("show-list-side-menu"); // body에도 클래스를 추가하여 함께 동작하도록 함

//           // side-menu가 활성화되었을 때 body의 overflow를 hidden으로 설정
//           if ($(".list-side-menu").hasClass("show-list-side-menu")) {
//             $("body").css("overflow", "hidden");
//           }
//         });

//         // 각 card의 collapse 요소가 표시될 때 애니메이션 효과를 추가합니다.
//         $(".list-card").on("show.bs.collapse", function () {
//           $(this).find(".collapse").slideDown(400); // 400ms의 애니메이션 속도로 슬라이드 다운합니다.
//         });

//         // 각 card의 collapse 요소가 숨겨질 때 애니메이션 효과를 추가합니다.
//         $(".list-card").on("hide.bs.collapse", function () {
//           $(this).find(".collapse").slideUp(400); // 400ms의 애니메이션 속도로 슬라이드 업합니다.
//         });
//       });

//       $(document).mouseup(function (e) {
//         var sideMenu = $(".list-side-menu");
//         // 만약 사이드 메뉴가 열려있고 클릭한 부분이 사이드 메뉴 바깥이면 사이드 메뉴를 닫음
//         if (
//           sideMenu.hasClass("show-list-side-menu") &&
//           !sideMenu.is(e.target) &&
//           sideMenu.has(e.target).length === 0
//         ) {
//           sideMenu.removeClass("show-list-side-menu");
//           $("body").removeClass("show-list-side-menu");

//           $("body").css("overflow", "auto");
//         }
//       });
document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.form-check-input').forEach(function (checkbox) {
    checkbox.addEventListener('click', function (e) {
      console.log('체크박스 체크시 함수 시작');
      let selectedFilterType = this.closest('.dropdown').querySelector('button').textContent.trim();
      let selectedFilter = e.target.value;
      if (selectedFilter == '전체보기') {
        console.log('전체보기 if문');
        location.href = 'prodList.ko';
      } else {
        location.href = 'getFilteredProducts.ko?selectedFilterType=' + selectedFilterType + '&selectedFilter=' + selectedFilter;
      }
    });
  });

  document.querySelectorAll('.list-navbar-toggler').forEach(function (toggler) {
    toggler.addEventListener('click', function () {
      let sideMenu = document.querySelector('.list-side-menu');
      sideMenu.classList.toggle('show-list-side-menu');
      document.body.classList.toggle('show-list-side-menu');

      if (sideMenu.classList.contains('show-list-side-menu')) {
        document.body.style.overflow = 'hidden';
      }
    });
  });

  document.querySelectorAll('.list-card').forEach(function (card) {
    card.addEventListener('show.bs.collapse', function () {
      this.querySelector('.collapse').style.transition = 'all 400ms';
      this.querySelector('.collapse').style.display = 'block';
    });

    card.addEventListener('hide.bs.collapse', function () {
      this.querySelector('.collapse').style.transition = 'all 400ms';
      this.querySelector('.collapse').style.display = 'none';
    });
  });

  document.addEventListener('mouseup', function (e) {
    let sideMenu = document.querySelector('.list-side-menu');
    if (sideMenu.classList.contains('show-list-side-menu') && !sideMenu.contains(e.target)) {
      sideMenu.classList.remove('show-list-side-menu');
      document.body.classList.remove('show-list-side-menu');
      document.body.style.overflow = 'auto';
    }
  });
});


    </script>
  </head>
  <body>
    <div class="container list-container">
      <div class="jumbotron">
        <div class="row jumbotron-grid">
          <div class="jumbotron-left col-6">
            <p class="jumbotron-title">전체상품</p>
            <p class="jumbotron-subtitle">
              비채나만의 특별한 전통주를 지금 만나보세요.
            </p>
          </div>
          <div class="jumbotron-right col-6">
            <img src="img/imgProdlist/비채나 상품페이지.png" />
          </div>
        </div>
      </div>
      <div class="list-bottom-line"></div>
      <div class="top-box">
        <div class="filter-box">
          <!-- 주종 필터 -->
          <div class="dropdown">
            <button type="button" class="btn" data-toggle="dropdown">
              주종 <img src="img/imgProdlist/arrow-down-sign-to-navigate.png" />
            </button>
            <div class="dropdown-menu list-dropdown-menu">
              <div class="row filter-box-row">
                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" value="전체보기" onclick=""/>
                    <p>전체보기</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" value="탁주" />
                    <p>탁주</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" value="약·청주" />
                    <p>약·청주</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" value="과실주" />
                    <p>과실주</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" value="증류주" />
                    <p>증류주</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" value="기타" />
                    <p>기타</p>
                  </label>
                </div>
              </div>
            </div>
          </div>

          <!-- 단맛 필터 -->
          <div class="dropdown">
            <button type="button" class="btn" data-toggle="dropdown">
              단맛 <img src="img/imgProdlist/arrow-down-sign-to-navigate.png" />
            </button>
            <div class="dropdown-menu list-dropdown-menu">
              <div class="row filter-box-row">
                <div class="form-check col-4">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="강"
                    />
                    <p>강</p>
                  </label>
                </div>

                <div class="form-check col-4">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="중"
                    />
                    <p>중</p>
                  </label>
                </div>

                <div class="form-check col-4">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="약"
                    />
                    <p>약</p>
                  </label>
                </div>
              </div>
            </div>
          </div>

          <!-- 신맛 필터 -->
          <div class="dropdown">
            <button type="button" class="btn" data-toggle="dropdown">
              신맛 <img src="img/imgProdlist/arrow-down-sign-to-navigate.png" />
            </button>
            <div class="dropdown-menu list-dropdown-menu">
              <div class="row filter-box-row">
                <div class="form-check col-4">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="강"
                    />
                    <p>강</p>
                  </label>
                </div>

                <div class="form-check col-4">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="중"
                    />
                    <p>중</p>
                  </label>
                </div>

                <div class="form-check col-4">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="약"
                    />
                    <p>약</p>
                  </label>
                </div>
              </div>
            </div>
          </div>

          <!-- 탄산 필터 -->
          <div class="dropdown">
            <button type="button" class="btn" data-toggle="dropdown">
              탄산 <img src="img/imgProdlist/arrow-down-sign-to-navigate.png" />
            </button>
            <div class="dropdown-menu list-dropdown-menu">
              <div class="row filter-box-row">
                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="강"
                    />
                    <p>강</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="중"
                    />
                    <p>중</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="약"
                    />
                    <p>약</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="없음"
                    />
                    <p>없음</p>
                  </label>
                </div>
              </div>
            </div>
          </div>

          <!-- 원료 필터 -->
          <div class="dropdown">
            <button type="button" class="btn" data-toggle="dropdown">
              원료 <img src="img/imgProdlist/arrow-down-sign-to-navigate.png" />
            </button>
            <div class="dropdown-menu list-dropdown-menu">
              <div class="row filter-box-row">
                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="과일"
                    />
                    <p>과일</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="꽃"
                    />
                    <p>꽃</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="견과"
                    />
                    <p>견과</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="약재"
                    />
                    <p>약재</p>
                  </label>
                </div>

                <div class="form-check col-6">
                  <label class="form-check-label">
                    <input
                      type="checkbox"
                      class="form-check-input"
                      value="기타"
                    />
                    <p>기타</p>
                  </label>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="filter-button">
          <button
            class="navbar-toggler list-navbar-toggler"
            type="button"
            aria-label="Toggle side menu"
          >
            <img class="filter-icon" src="img/imgProdlist/filter.png" /> 필터
          </button>
        </div>
      </div>

      <div class="total">총 ${totalCnt}건의 결과가 있어요.</div>

      <div class="row">
        <c:choose>
          <c:when test="${prodFilteredList eq null }">
            <c:forEach items="${prodList}" var="list">
              <div class="col-sm-6 col-md-4 col-lg-3">
                <div
                  class="prod"
                  onclick="location.href = 'prodOne.ko?p_no=${list.p_no}';"
                >
                  <div class="list-image-wrapper">
                    <span class="list-image-span1">
                      <span class="list-image-span2">
                        <img
                          class="float"
                          src="img/${list.p_img}"
                          title="productimg"
                          alt="productimg"
                        />
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
                <div
                  class="prod"
                  onclick="location.href = 'prodOne.ko?p_no=${list.p_no}';"
                >
                  <div class="list-image-wrapper">
                    <span class="list-image-span1">
                      <span class="list-image-span2">
                        <img
                          class="float"
                          src="img/${list.p_img}"
                          title="productimg"
                          alt="productimg"
                        />
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
          <li class="page-item"><a class="page-link">이전</a></li>
        </c:when>
        <c:otherwise>
          <!-- 이전 페이지로 이동하는 링크 -->
          <li class="page-item">
            <a
              class="page-link"
              href="prodList.ko?currPageNo=${pagination.currPageNo - 1}"
              >이전</a
            >
          </li>
        </c:otherwise>
      </c:choose>

      <c:forEach
        begin="${pagination.startPage}"
        end="${pagination.endPage}"
        var="page"
      >
        <c:choose>
          <c:when test="${page eq pagination.currPageNo}">
            <li class="page-item active">
              <a class="page-link" href="#">${page}</a>
            </li>
          </c:when>
          <c:otherwise>
            <li class="page-item">
              <a class="page-link" href="prodList.ko?currPageNo=${page}"
                >${page}</a
              >
            </li>
          </c:otherwise>
        </c:choose>
      </c:forEach>

      <c:choose>
        <c:when test="${pagination.currPageNo == pagination.pageCnt}">
          <!-- 현재 페이지가 마지막 페이지인 경우 -->
          <li class="page-item"><a class="page-link" href="#">다음</a></li>
        </c:when>
        <c:otherwise>
          <!-- 다음 페이지로 이동하는 링크 -->
          <li class="page-item">
            <a
              class="page-link"
              href="prodList.ko?currPageNo=${pagination.currPageNo + 1}"
              >다음</a
            >
          </li>
        </c:otherwise>
      </c:choose>
    </ul>

    <div class="list-side-menu" id="list-sideMenu">
      <div class="list-sidemenu-logo-imagewrapper">
        <span class="list-sidemenu-image-span1">
          <span class="list-sidemenu-image-span2">
            <img
              class="list-sidemenu-image"
              src="img/imgProdlist/비채나 상품페이지.png"
            />
          </span>
        </span>
      </div>

      <ul class="navbar-nav list-navbar-nav-side">
        <div id="accordion">
          <div class="card list-card">
            <div class="list-side-bottom-line"></div>
            <div class="card-header list-card-header">
              <a
                class="card-link collapsed"
                data-toggle="collapse"
                href="#collapseOne"
                aria-expanded="false"
                aria-controls="collapseOne"
              >
                주 종
              </a>
            </div>

            <div
              id="collapseOne"
              class="collapse list-collapse-one"
              data-parent="#accordion"
              onclick="location.href='prodList.ko';"
            >
              <div class="card-body list-card-body">
                <img
                  src="${pageContext.request.contextPath}/img/navbar/all_product.png"
                />
                전체상품
              </div>
            </div>

            <div
              id="collapseOne"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '주종' + '&selectedFilter=' + '탁주';"
            >
              <div class="card-body list-card-body">
                <img
                  src="${pageContext.request.contextPath}/img/navbar/icon_takju.png"
                />
                탁주
              </div>
            </div>

            <div
              id="collapseOne"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '주종' + '&selectedFilter=' + '과실주';"
            >
              <div class="card-body list-card-body">
                <img
                  src="${pageContext.request.contextPath}/img/navbar/icon_gwashilju.png"
                />
                과실주
              </div>
            </div>

            <div
              id="collapseOne"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '주종' + '&selectedFilter=' + '약·청주';"
            >
              <div class="card-body list-card-body">
                <img
                  src="${pageContext.request.contextPath}/img/navbar/icon_cheongju.png"
                />
                약·청주
              </div>
            </div>

            <div
              id="collapseOne"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '주종' + '&selectedFilter=' + '증류주';"
            >
              <div class="card-body list-card-body">
                <img
                  src="${pageContext.request.contextPath}/img/navbar/icon_jeungryuju.png"
                />
                증류주
              </div>
            </div>

            <div
              id="collapseOne"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '주종' + '&selectedFilter=' + '기타';"
            >
              <div class="card-body list-card-body">
                <img
                  src="${pageContext.request.contextPath}/img/navbar/icon_merchandise_listing.png"
                />
                기타
              </div>
            </div>
          </div>
          <div class="list-side-bottom-line"></div>
          <div class="card list-card">
            <div class="card-header list-card-header">
              <a
                class="collapsed card-link"
                data-toggle="collapse"
                href="#collapseTwo"
              >
                단 맛
              </a>
            </div>
            <div
              id="collapseTwo"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '단맛' + '&selectedFilter=' + '강';"
            >
              <div class="card-body list-card-body">강</div>
            </div>
            <div
              id="collapseTwo"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '단맛' + '&selectedFilter=' + '중';"
            >
              <div class="card-body list-card-body">중</div>
            </div>
            <div
              id="collapseTwo"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '단맛' + '&selectedFilter=' + '약';"
            >
              <div class="card-body list-card-body">약</div>
            </div>
          </div>
          <div class="list-side-bottom-line"></div>
          <div class="card list-card">
            <div class="card-header list-card-header">
              <a
                class="collapsed card-link"
                data-toggle="collapse"
                href="#collapseThree"
              >
                신 맛
              </a>
            </div>
            <div
              id="collapseThree"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '신맛' + '&selectedFilter=' + '강';"
            >
              <div class="card-body list-card-body">강</div>
            </div>
            <div
              id="collapseThree"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '신맛' + '&selectedFilter=' + '중';"
            >
              <div class="card-body list-card-body">중</div>
            </div>
            <div
              id="collapseThree"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '신맛' + '&selectedFilter=' + '약';"
            >
              <div class="card-body list-card-body">약</div>
            </div>
          </div>
          <div class="list-side-bottom-line"></div>
          <div class="card list-card">
            <div class="card-header list-card-header">
              <a
                class="collapsed card-link"
                data-toggle="collapse"
                href="#collapseFour"
              >
                탄 산
              </a>
            </div>
            <div
              id="collapseFour"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '탄산' + '&selectedFilter=' + '강';"
            >
              <div class="card-body list-card-body">강</div>
            </div>
            <div
              id="collapseFour"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '탄산' + '&selectedFilter=' + '중';"
            >
              <div class="card-body list-card-body">중</div>
            </div>
            <div
              id="collapseFour"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '탄산' + '&selectedFilter=' + '약';"
            >
              <div class="card-body list-card-body">약</div>
            </div>
            <div
              id="collapseFour"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '탄산' + '&selectedFilter=' + '없음';"
            >
              <div class="card-body list-card-body">없음</div>
            </div>
          </div>
          <div class="list-side-bottom-line"></div>
          <div class="card list-card">
            <div class="card-header list-card-header">
              <a
                class="collapsed card-link"
                data-toggle="collapse"
                href="#collapseFive"
              >
                원 료
              </a>
            </div>
            <div
              id="collapseFive"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '원료' + '&selectedFilter=' + '과일';"
            >
              <div class="card-body list-card-body">과일</div>
            </div>
            <div
              id="collapseFive"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '원료' + '&selectedFilter=' + '꽃';"
            >
              <div class="card-body list-card-body">꽃</div>
            </div>
            <div
              id="collapseFive"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '원료' + '&selectedFilter=' + '견과';"
            >
              <div class="card-body list-card-body">견과</div>
            </div>
            <div
              id="collapseFive"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '원료' + '&selectedFilter=' + '약재';"
            >
              <div class="card-body list-card-body">약재</div>
            </div>
            <div
              id="collapseFive"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href = 'getFilteredProducts.ko?selectedFilterType='+ '원료' + '&selectedFilter=' + '기타';"
            >
              <div class="card-body list-card-body">기타</div>
            </div>
          </div>
        </div>
      </ul>
    </div>

    <!-- 기타 메뉴 항목 추가 -->

    <div class="list-side-menu-overlay"></div>


  </body>
</html>
