document.addEventListener("DOMContentLoaded", () => {
  const userDropdown = document.querySelector(".js-header-dropdown");
  const dropdownMenu = document.querySelector(".header__dropdown");

  if (userDropdown && dropdownMenu) {
    console.log("header.js が読み込まれました");
    userDropdown.addEventListener("click", (event) => {
      event.stopPropagation(); // 他のクリックイベントを防ぐ
      dropdownMenu.classList.toggle("is-active");
    });

    document.addEventListener("click", (event) => {
      if (!userDropdown.contains(event.target)) {
        dropdownMenu.classList.remove("is-active");
      }
    });
  }
});
