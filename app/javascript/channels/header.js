document.addEventListener("DOMContentLoaded", () => {
  const userDropdown = document.querySelector(".js-header-dropdown");
  const dropdownMenu = document.querySelector(".header__dropdown");

  if (userDropdown && dropdownMenu) {
    userDropdown.addEventListener("click", (event) => {
      dropdownMenu.classList.toggle("is-active");
    });

    document.addEventListener("click", (event) => {
      if (!userDropdown.contains(event.target)) {
        dropdownMenu.classList.remove("is-active");
      }
    });
  }
});
