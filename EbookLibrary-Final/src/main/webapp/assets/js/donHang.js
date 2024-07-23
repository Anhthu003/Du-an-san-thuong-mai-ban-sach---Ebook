const tatCa = document.getElementById("tatCa");
const vanChuyen = document.getElementById("vanChuyen");
const choGiaoHang = document.getElementById("choGiaoHang");
const hoanThanh = document.getElementById("hoanThanh");
const daHuy = document.getElementById("daHuy");
const traHang = document.getElementById("traHang");

tatCa.classList.add("activeMenu3");

tatCa.addEventListener("click", () => {
    tatCa.classList.add("activeMenu3");
    vanChuyen.classList.remove("activeMenu3");
    choGiaoHang.classList.remove("activeMenu3");
    hoanThanh.classList.remove("activeMenu3");
    daHuy.classList.remove("activeMenu3");
    traHang.classList.remove("activeMenu3");
});

vanChuyen.addEventListener("click", () => {
    tatCa.classList.remove("activeMenu3");
    vanChuyen.classList.add("activeMenu3");
    choGiaoHang.classList.remove("activeMenu3");
    hoanThanh.classList.remove("activeMenu3");
    daHuy.classList.remove("activeMenu3");
    traHang.classList.remove("activeMenu3");
});
choGiaoHang.addEventListener("click", () => {
    vanChuyen.classList.remove("activeMenu3");
    tatCa.classList.remove("activeMenu3");
    choGiaoHang.classList.add("activeMenu3");
    hoanThanh.classList.remove("activeMenu3");
    daHuy.classList.remove("activeMenu3");
    traHang.classList.remove("activeMenu3");
});

hoanThanh.addEventListener("click", () => {
    vanChuyen.classList.remove("activeMenu3");
    tatCa.classList.remove("activeMenu3");
    choGiaoHang.classList.remove("activeMenu3");
    hoanThanh.classList.add("activeMenu3");
    daHuy.classList.remove("activeMenu3");
    traHang.classList.remove("activeMenu3");
});

daHuy.addEventListener("click", () => {
    vanChuyen.classList.remove("activeMenu3");
    tatCa.classList.remove("activeMenu3");
    choGiaoHang.classList.remove("activeMenu3");
    hoanThanh.classList.remove("activeMenu3");
    daHuy.classList.add("activeMenu3");
    traHang.classList.remove("activeMenu3");
});
traHang.addEventListener("click", () => {
    vanChuyen.classList.remove("activeMenu3");
    tatCa.classList.remove("activeMenu3");
    choGiaoHang.classList.remove("activeMenu3");
    hoanThanh.classList.remove("activeMenu3");
    daHuy.classList.remove("activeMenu3");
    traHang.classList.add("activeMenu3");
});