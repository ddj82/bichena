window.addEventListener("DOMContentLoaded", (event) => {
  // Simple-DataTables
  // https://github.com/fiduswriter/Simple-DataTables/wiki

  const datatablesSimple = document.getElementById("datatablesSimple");
  if (datatablesSimple) {
    new simpleDatatables.DataTable(datatablesSimple);
  }

  // Toggle the side navigation
  const sidebarToggle = document.body.querySelector("#sidebarToggle");
  if (sidebarToggle) {
    sidebarToggle.addEventListener("click", (event) => {
      event.preventDefault();
      document.body.classList.toggle("sb-sidenav-toggled");
      localStorage.setItem(
        "sb|sidebar-toggle",
        document.body.classList.contains("sb-sidenav-toggled")
      );
    });
  }

  // Add event listener to sidebar links
  const sidebarLinks = document.querySelectorAll("#layoutSidenav_nav .nav-link");

  sidebarLinks.forEach((link) => {
    link.addEventListener("click", (event) => {
      // Check if the link is clicked when the sidebar is toggled on small screens
      if (window.innerWidth <= 991 && document.body.classList.contains("sb-sidenav-toggled")) {
        event.preventDefault();
        document.body.classList.remove("sb-sidenav-toggled");

        // Get the href attribute of the clicked link
        const href = link.getAttribute("href");

        // Set the src attribute of the iframe to the href value
        const iframe = document.getElementById("contentFrame");
        iframe.src = href;
      }
    });
  });
});
