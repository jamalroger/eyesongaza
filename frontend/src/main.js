
import { createApp } from 'vue'
import App from './App.vue'

import Flicking from "@egjs/vue3-flicking/dist/flicking.esm";
import "@egjs/vue3-flicking/dist/flicking.css";
// Or, if you have to support IE9
import "@egjs/vue3-flicking/dist/flicking-inline.css";


const app = createApp(App);

app.component("flicking-slider", Flicking);
app.mount('#app')
