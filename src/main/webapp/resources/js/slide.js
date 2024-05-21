document.addEventListener('DOMContentLoaded', function() {
  
  
  var sliders = document.querySelectorAll(".slider");
  var prevButton = document.querySelector('.main-custom-prev');
  var nextButton = document.querySelector('.main-custom-next');
			
    sliders.forEach(function (slider) {
          $(slider).slick({
            infinite: true,
            speed: 300,
            slidesToShow: 1,
            adaptiveHeight: true,
	        slidesToScroll: 1,
			autoplay: true,
			autoplaySpeed: 2000,
          });
           
			  
		    prevButton.addEventListener('click', function() {
		    $(slider).slick('slickPrev');
		  });
		
		  nextButton.addEventListener('click', function() {
		    $(slider).slick('slickNext');
		  });
        });
        
    });
        
        
document.addEventListener('DOMContentLoaded', function() {
        

  const swiperEl = document.querySelector(".mySwiper");
        Object.assign(swiperEl, {
            slidesPerView: 1,
            spaceBetween: 10,
            breakpoints: {
               	625: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                },
                920: {
                    slidesPerView: 3,
                    spaceBetween: 40,
                },
                1250: {
                    slidesPerView: 4,
                    spaceBetween: 50,
                },
            },
            navigation: {
                nextEl: ".custom-next",
                prevEl: ".custom-prev",
            },
        });
        swiperEl.initialize();
        
  const swiper2 = document.querySelector(".mySwiper2");
        Object.assign(swiper2, {
            slidesPerView: 1,
            spaceBetween: 10,
            breakpoints: {
                625: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                },
                920: {
                    slidesPerView: 3,
                    spaceBetween: 40,
                },
                1250: {
                    slidesPerView: 4,
                    spaceBetween: 50,
                },
            },
            navigation: {
                nextEl: ".custom-next2",
                prevEl: ".custom-prev2",
            },
        });
swiper2.initialize();



const swiper3 = document.querySelector(".mySwiper3");
        Object.assign(swiper3, {
            slidesPerView: 1,
            spaceBetween: 10,
            breakpoints: {
                625: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                },
                920: {
                    slidesPerView: 3,
                    spaceBetween: 40,
                },
                1250: {
                    slidesPerView: 4,
                    spaceBetween: 50,
                },
            },
            navigation: {
                nextEl: ".custom-next3",
                prevEl: ".custom-prev3",
            },
        });
swiper3.initialize();


const swiper4 = document.querySelector(".mySwiper4");
        Object.assign(swiper4, {
            slidesPerView: 1,
            spaceBetween: 10,
            breakpoints: {
                625: {
                    slidesPerView: 1,
                    spaceBetween: 20,
                },
                920: {
                    slidesPerView: 3,
                    spaceBetween: 40,
                },
                1250: {
                    slidesPerView: 4,
                    spaceBetween: 50,
                },
            },
            navigation: {
                nextEl: ".custom-next4",
                prevEl: ".custom-prev4",
            },
        });
swiper4.initialize();

   
        
const reviewswiper = document.querySelector(".reviewSwiper");
Object.assign(reviewswiper, {
    slidesPerView: 1,
    spaceBetween: 10,
    breakpoints: {
        640: {
            slidesPerView: 1,
            spaceBetween: 20,
        },
        768: {
            slidesPerView: 2	,
            spaceBetween: 40,
        },
        1024: {
            slidesPerView: 3,
            spaceBetween: 50,
        },
    },
    navigation: {
        nextEl: ".custom-nextre",
        prevEl: ".custom-prevre",
    },
});
reviewswiper.initialize();
  
  
});
        