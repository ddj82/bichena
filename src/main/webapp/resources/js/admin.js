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
    // Uncomment Below to persist sidebar toggle between refreshes
    // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
    //     document.body.classList.toggle('sb-sidenav-toggled');
    // }
    sidebarToggle.addEventListener("click", (event) => {
      event.preventDefault();
      document.body.classList.toggle("sb-sidenav-toggled");
      localStorage.setItem(
        "sb|sidebar-toggle",
        document.body.classList.contains("sb-sidenav-toggled")
      );
    });
  }

  // Close sidebar when clicking outside of it or on a link
  document.addEventListener("click", (event) => {
    const sidebar = document.getElementById("layoutSidenav_nav");
    const sidebarToggle = document.getElementById("sidebarToggle");
    const sidebarLinks = document.querySelectorAll("#layoutSidenav_nav .nav-link");
    
    if (
      window.innerWidth <= 991 &&
      document.body.classList.contains("sb-sidenav-toggled") &&
      sidebar &&
      sidebarToggle &&
      !sidebar.contains(event.target) &&
      event.target !== sidebarToggle &&
      !Array.from(sidebarLinks).some(link => link.contains(event.target))
    ) {
      document.body.classList.remove("sb-sidenav-toggled");
      localStorage.setItem("sb|sidebar-toggle", false);
    }
  });

  // Prevent default behavior of sidebarToggle when clicked
  if (sidebarToggle) {
    sidebarToggle.addEventListener("click", (event) => {
      event.preventDefault();
    });
  }

  // Close sidebar when clicking on a link
  const sidebarLinks = document.querySelectorAll("#layoutSidenav_nav .nav-link");
  sidebarLinks.forEach(link => {
    link.addEventListener("click", () => {
      if (window.innerWidth <= 991) {
        document.body.classList.remove("sb-sidenav-toggled");
        localStorage.setItem("sb|sidebar-toggle", false);
      }
    });
  });
});
