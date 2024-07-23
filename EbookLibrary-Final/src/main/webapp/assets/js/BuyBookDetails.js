//1.show đánh giá sao
document.addEventListener("DOMContentLoaded", function() {
	const navLinks = document.querySelectorAll(".DG-link");
	const all = document.getElementById("all");
	all.classList.remove("DG-link");
	all.classList.add("Active");
	navLinks.forEach(link => {
		link.addEventListener("click", function(event) {
			event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ a
			const rating = this.getAttribute("href").substring(1); // Lấy giá trị đánh giá từ href

			//Xóa lớp Active từ tất cả các liên kết và thêm lại lớp DG - link
			navLinks.forEach(link => {
				link.classList.remove("Active");
				link.classList.add("DG-link");
			});

			// Thêm lớp Active vào liên kết được nhấp và xóa lớp DG-link
			this.classList.add("Active");
			this.classList.remove("DG-link");

			// Sử dụng pushState để thay đổi URL mà không tải lại trang
			history.pushState({ rating: rating }, null, `#${rating}`);

			updateContent();
		});
	});
})

//2.Hover fill ảnh 
const imgItems = document.querySelectorAll(".imgItem");
const imgActive = document.getElementById("imgActive");
// Lặp qua từng phần tử 'imgItem'
imgItems.forEach(imgItem => {
	imgItem.addEventListener("mouseover", function() {
		// Lấy thuộc tính 'src' của 'imgItem' được di chuột vào
		const imgSrc = this.getAttribute("src");
		// Đặt thuộc tính 'src' của 'imgActive' để khớp với 'src' của 'imgItem' được di chuột vào
		imgActive.setAttribute("src", imgSrc);
	});
});

//3.Tăng giảm số lượng
function increaseValue(index) {
	var value = parseInt(document.getElementById('btnradio1').value, 10);
	value = isNaN(value) ? 0 : value;
	if (value < index) {
		value++;
	} else {
		document.getElementById('btnradio1').value = index;
		return;
	}
	document.getElementById('btnradio1').value = value;
}

function changeValue(index) {
	var value = parseInt(document.getElementById('btnradio1').value, 10);
	value = isNaN(value) ? 0 : value;
	if (value > index) {
		document.getElementById('btnradio1').value = index;
	}
}

function decreaseValue() {
	var value = parseInt(document.getElementById('btnradio1').value, 10);
	value = isNaN(value) ? 0 : value;
	if (value > 1) {
		value--;
		document.getElementById('btnradio1').value = value;
	}
}


//4.modal khi click dô ảnh 
const imgSlides = document.querySelectorAll(".imgSlide");
const carouselItem = document.querySelectorAll(".carousel-item");
const imgShowSlides = document.querySelectorAll(".imgShowSlide");
const showItems = document.querySelectorAll(".show-item");
const carouselElement = document.getElementById('carouselExampleControlsNoTouching');

// Function to update the active thumbnail
function updateActiveThumbnail() {
	const activeSlide = carouselElement.querySelector('.carousel-item.active img').getAttribute('src');
	imgShowSlides.forEach((img) => {
		if (img.getAttribute("src") === activeSlide) {
			img.classList.add('ActiveSlide');
		} else {
			img.classList.remove('ActiveSlide');
		}
	});
}
// Function to fill slides in the carousel
function fillSlides(imgSrc1) {
	for (let i = 0; i < imgShowSlides.length; i++) {
		imgSlides[i].setAttribute("src", imgShowSlides[i].getAttribute("src"));
	}
	for (let i = 0; i < imgSlides.length; i++) {
		if (imgSlides[i].getAttribute("src") === imgSrc1) {
			carouselItem[i].className += " active";
		} else {
			carouselItem[i].className = carouselItem[i].className.replace(" active", "");
		}
	}
}

for (let j = 0; j < imgItems.length; j++) {
	imgItems[j].addEventListener("click", function() {
		const imgSrc1 = imgItems[j].getAttribute("src");

		//fill show ảnh
		for (let i = 0; i < imgItems.length; i++) {
			imgShowSlides[i].setAttribute("src", imgItems[i].getAttribute("src"));
			if (imgShowSlides[i].getAttribute("src") === imgSrc1) {
				imgShowSlides[i].className += " ActiveSlide"
			}
		}
		fillSlides(imgSrc1);
		updateActiveThumbnail();
		// Hiển thị modal
		const modal = new bootstrap.Modal(document.getElementById('exampleModal'));
		modal.show();
	});
};

for (let j = 0; j < imgShowSlides.length; j++) {
	imgShowSlides[j].addEventListener("click", function() {
		const imgSrc = imgShowSlides[j].getAttribute("src");

		fillSlides(imgSrc);
		updateActiveThumbnail();
	});
}
// Cập nhật thumbnail đang hoạt động khi carousel thay đổi slide
carouselElement.addEventListener('slid.bs.carousel', updateActiveThumbnail);

// Lắng nghe sự kiện hidden modal để xóa class ActiveSlide và thiết lập lại trạng thái
const modalElement = document.getElementById('exampleModal');
modalElement.addEventListener('hidden.bs.modal', function() {
	// Xóa class ActiveSlide khỏi tất cả các thumbnail khi modal được đóng
	imgShowSlides.forEach((imgShowSlide) => {
		imgShowSlide.classList.remove('ActiveSlide');
	});

	// Thiết lập lại trạng thái của các ảnh trong carousel
	imgSlides.forEach((imgSlide) => {
		imgSlide.setAttribute("src", "");
	});

	// Đặt lại carousel về slide đầu tiên
	const carousel = bootstrap.Carousel.getInstance(carouselElement);
	carousel.to(0);
});

// Cập nhật thumbnail đang hoạt động ngay khi carousel khởi tạo
carouselElement.addEventListener('slid.bs.carousel', updateActiveThumbnail);


//5. điều hướng card sản phẩm
const slider = document.querySelector('.slider');
let isDown = false;
let startX;
let scrollLeft;
slider.addEventListener('mousedown', (e) => {
	isDown = true;
	startX = e.pageX - slider.offsetLeft;
	scrollLeft = slider.scrollLeft;
	console.log("1");
});

slider.addEventListener('mouseleave', () => {
	isDown = false;
});

slider.addEventListener('mouseup', () => {
	isDown = false;
});

slider.addEventListener('mousemove', (e) => {
	if (!isDown) return;
	e.preventDefault();
	const x = e.pageX - slider.offsetLeft;
	const walk = (x - startX) * 2; // The multiplication factor controls the speed of the scroll
	slider.scrollLeft = scrollLeft - walk;
});

//6.Slide card sản phẩm
document.addEventListener("DOMContentLoaded", function() {
	const card = document.querySelector('.panel3 .card');
	const lastImage = card.querySelector('.image-container img:last-child');

	card.addEventListener('mouseenter', function() {
		lastImage.classList.add('show');
	});

	card.addEventListener('mouseleave', function() {
		lastImage.classList.remove('show');
	});
});
