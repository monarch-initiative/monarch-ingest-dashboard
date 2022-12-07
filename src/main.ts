import { createApp, ref } from 'vue'
import './style.css'
import App from './App.vue'
import { fetchAllData } from './data';


fetchAllData();

createApp(App).mount('#app')
