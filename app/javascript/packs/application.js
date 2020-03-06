import "bootstrap";

import {initUpdateNavbarOnScroll} from "../components/navbar";
import {initUpdateNavbar} from "../components/navbar";

if (window.location.pathname=='/') {
  initUpdateNavbarOnScroll()
} else {
  initUpdateNavbar()
}

import { initSelect2 } from '../plugins/init_select2';
initSelect2();
