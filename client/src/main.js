import { createApp } from 'vue'
import './index.css'
import App from './App.vue'
import router from './router'

/* import the fontawesome core */
import { library } from '@fortawesome/fontawesome-svg-core'

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

/* import specific icons */
import { faUsersGear, faUsersRectangle, faCloud, faComments, faCalendarDays, faClipboard, faPaperclip, faPencil, faList, faEye, faMoneyBill, faChartColumn, faGlobe, faGears, faWifi, faAddressBook, faHandshake, faBusinessTime, faLayerGroup, faGauge, faPhoneVolume, faDatabase, faBarsProgress, faHourglassHalf, faSitemap } from '@fortawesome/free-solid-svg-icons'
import { faFolderOpen } from '@fortawesome/free-regular-svg-icons'
/* add icons to the library */

library.add(faFolderOpen, faUsersGear, faUsersRectangle, faCloud, faComments, faCalendarDays, faClipboard, faPaperclip, faPencil, faList, faEye, faMoneyBill, faChartColumn, faGlobe, faGears, faWifi, faAddressBook, faHandshake, faBusinessTime, faLayerGroup, faGauge, faPhoneVolume, faDatabase, faBarsProgress, faHourglassHalf, faSitemap)

createApp(App)
  .use(router)
  .component('font-awesome-icon', FontAwesomeIcon)
  .mount('#app')
