const initUpdateNavbarOnScroll = () => {
  const height = document.getElementById('banner').offsetHeight;
  const navbar = document.querySelector('.navbar');
  const navbar_items = document.querySelectorAll('.navbar-item');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= height) {
        navbar.classList.add('navbar-white');
        navbar_items.forEach((navbar_item) => {
        navbar_item.classList.add('navbar-item-black');
        });
      } else {
        navbar.classList.remove('navbar-white');
        navbar_items.forEach((navbar_item) => {
        navbar_item.classList.remove('navbar-item-black');
        });
      }
    });
  }
}

const initUpdateNavbar = () => {
  const navbar = document.querySelector('.navbar');
  const navbar_items = document.querySelectorAll('.navbar-item');
  if (navbar) {
    navbar.classList.add('navbar-white-unfixed');
    navbar_items.forEach((navbar_item) => {
      navbar_item.classList.add('navbar-item-black');
    });
  }
}

export { initUpdateNavbarOnScroll };
export { initUpdateNavbar };


