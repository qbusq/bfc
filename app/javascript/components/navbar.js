const initUpdateNavbarOnScroll = () => {
  const height = document.getElementById('banner').offsetHeight;
  const navbar = document.querySelector('.navbar');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= height) {
        navbar.classList.add('navbar-white');
      } else {
        navbar.classList.remove('navbar-white');
      }
    });
  }
}

const initUpdateNavbar = () => {
  const navbar = document.querySelector('.navbar');
  if (navbar) {
    navbar.classList.add('navbar-white-unfixed');
  }
}

export { initUpdateNavbarOnScroll };
export { initUpdateNavbar };

