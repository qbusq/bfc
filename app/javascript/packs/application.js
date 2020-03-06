import "bootstrap";
import {initUpdateNavbarOnScroll} from "../components/navbar";
import {initUpdateNavbar} from "../components/navbar";

if (window.location.pathname=='/') {
  initUpdateNavbarOnScroll()
} else {
  initUpdateNavbar()
}
