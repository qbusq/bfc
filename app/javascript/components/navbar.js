const initUpdateNavbarOnScroll = () => {
  const height = document.getElementById('banner').offsetHeight;
  const navbar = document.querySelector('.navbar');
  const navbar_items = document.querySelectorAll('.navbar-item');
  const carrot = document.querySelector('.fas');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= height) {
        navbar.classList.add('navbar-white');
        carrot.classList.add('black');
        carrot.classList.remove('white');
        navbar_items.forEach((navbar_item) => {
        navbar_item.classList.add('navbar-item-black');
        navbar_item.classList.remove('navbar-item-white');
        navbar_item.classList.add('navbar-item-black:hover');
        navbar_item.classList.remove('navbar-item-white:hover');
        });
      } else {
        navbar.classList.remove('navbar-white');
        carrot.classList.remove('black');
        carrot.classList.add('white');
        navbar_items.forEach((navbar_item) => {
        navbar_item.classList.remove('navbar-item-black');
        navbar_item.classList.add('navbar-item-white');
        navbar_item.classList.remove('navbar-item-black:hover');
        navbar_item.classList.add('navbar-item-white:hover');
        });
      }
    });
  }
}

const initUpdateNavbar = () => {
  const navbar = document.querySelector('.navbar');
  const navbar_items = document.querySelectorAll('.navbar-item');
  const carrot = document.querySelector('.fas');
  if (navbar) {
    navbar.classList.add('navbar-white-unfixed');
    navbar_items.forEach((navbar_item) => {
      navbar_item.classList.add('navbar-item-black');
    });
    carrot.classList.add('black');
  }
}

export { initUpdateNavbarOnScroll };
export { initUpdateNavbar };


