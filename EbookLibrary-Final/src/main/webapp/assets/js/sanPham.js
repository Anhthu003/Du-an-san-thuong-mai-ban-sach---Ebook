
//6.Slide card sản phẩm
document.addEventListener("DOMContentLoaded", function () {
    const card = document.querySelector('.panel3 .card');
    const lastImage = card.querySelector('.image-container img:last-child');
  
    card.addEventListener('mouseenter', function () {
      lastImage.classList.add('show');
    });
  
    card.addEventListener('mouseleave', function () {
      lastImage.classList.remove('show');
    });
  });