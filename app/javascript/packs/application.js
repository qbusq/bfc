import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';


initMapbox();
=======
import {initUpdateNavbarOnScroll} from "../components/navbar";
import {initUpdateNavbar} from "../components/navbar";
import {boxMadeClickable} from "../components/user_show";
boxMadeClickable();


if (window.location.pathname=='/') {
  initUpdateNavbarOnScroll()
} else {
  initUpdateNavbar()
}

import { initSelect2 } from '../plugins/init_select2';
initSelect2();

