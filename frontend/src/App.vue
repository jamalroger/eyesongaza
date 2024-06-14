<template>
    <div class="main-section">
        <div class="img-war">

            <img src="/war.png" class="" alt="" />
            <img src="/fog.png" class="img-white-bg" alt="" />
        </div>
        <!----------------- LOGO  ----------------->
        <div class="states">
            <div id="logo" style="padding:10px">
                <img src="/logo.png" class="" alt="" style="width: 200px;" />
            </div>
            <!----------------- STATE  ----------------->
            <div class="hr"></div>

            <div class="header">
                <span class="live-icon"></span>
                <span class="">LIVE STATS</span>
            </div>
            <div class="totals" v-if="isLoaded">
                {{ stats.toLocaleString("en-US") }}
            </div>
            <!-- LOADER -->
            <div v-if="!isLoaded">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" height="80px">
                    <circle fill="#c60812" stroke="#c60812" stroke-width="15" r="15" cx="40" cy="65">
                        <animate attributeName="cy" calcMode="spline" dur="2" values="65;135;65;"
                            keySplines=".5 0 .5 1;.5 0 .5 1" repeatCount="indefinite" begin="-.4"></animate>
                    </circle>
                    <circle fill="#c60812" stroke="#c60812" stroke-width="15" r="15" cx="100" cy="65">
                        <animate attributeName="cy" calcMode="spline" dur="2" values="65;135;65;"
                            keySplines=".5 0 .5 1;.5 0 .5 1" repeatCount="indefinite" begin="-.2"></animate>
                    </circle>
                    <circle fill="#c60812" stroke="#c60812" stroke-width="15" r="15" cx="160" cy="65">
                        <animate attributeName="cy" calcMode="spline" dur="2" values="65;135;65;"
                            keySplines=".5 0 .5 1;.5 0 .5 1" repeatCount="indefinite" begin="0"></animate>
                    </circle>
                </svg>
            </div>
            <p>Join the Humans saying No to Genocide</p>
        </div>

        <h2 class="title">
            Stand with Palestine <br />
            Stop Genocide.
        </h2>
        <div class="main-margin"></div>
        <!--------------------------- FORM ---------------------------->
        <form @submit.prevent="addUser" v-if="!submited">
            <input type="text" v-model="name" class="name" placeholder="Your name" />
            <span class="err-msg" v-if="errorMsg">This field is required</span>
            <div class="main-margin"></div>
            <input type="text" class="comment" v-model="comment" placeholder="Comment (optional)" />
            <div class="main-margin"></div>
            <button class="danger">
                I Stand against Genocide</button>
            <div class="main-margin"></div>
        </form>
        <!--------------------------- IF FORM SUBMITED ---------------------------->
        <div class="submited" v-if="submited">
            <svg width="92" height="92" viewBox="0 0 92 92" fill="none" xmlns="http://www.w3.org/2000/svg">
                <rect x="0.699902" y="0.787793" width="90.6" height="90.6" rx="45.3" stroke="#D1E0F0"
                    stroke-width="0.6" />
                <path
                    d="M27.4845 14.395C26.9908 14.7286 26.2703 15.5959 26.1235 16.0228C26.0968 16.1162 25.8967 16.0762 25.5898 15.9428C24.9226 15.6226 24.3222 15.756 23.5884 16.4098C22.3875 17.4639 21.9872 19.3319 22.6143 20.9597C22.6677 21.1064 22.5743 21.2265 22.2941 21.3466C21.8138 21.5468 20.9999 22.4007 20.7997 22.9211C20.3194 24.1753 20.3994 25.7764 21.0132 27.1641L21.3334 27.8979L20.9331 28.0447C20.3861 28.2315 20.2793 28.5918 20.2793 30.2596C20.2793 31.0468 20.1859 33.2484 20.0659 35.1564C19.9458 37.1178 19.8791 39.7864 19.9057 41.3075L19.9458 43.976L20.7197 45.5505C21.1333 46.4177 22.2941 48.5126 23.2815 50.2204L25.0694 53.316L26.2035 56.7184C27.9781 62.0955 29.6326 65.965 31.2471 68.4734C32.1811 69.9278 33.7022 71.3021 36.224 72.9566C37.8918 74.0507 41.2409 76.4791 43.3491 78.1069C43.5092 78.227 43.5092 78.2003 43.3624 77.9201C43.0155 77.253 41.9347 75.9454 40.5604 74.531C39.4129 73.3569 38.7725 72.8232 37.0246 71.6757C33.5821 69.3941 32.5681 68.2066 30.3532 63.8435C29.179 61.5351 28.2717 59.3469 26.9908 55.7043C26.0167 52.9691 25.8166 52.5421 23.0947 47.3384C22.5743 46.3377 21.9872 45.0835 21.8004 44.5364C21.2934 43.1221 21.2534 41.0539 21.6003 35.063C21.7604 32.3678 21.8805 29.9794 21.8805 29.7526C21.8805 29.3523 21.8805 29.3523 22.6143 29.3523C23.3749 29.3523 24.1621 29.6058 24.5757 29.9794C24.7625 30.1529 24.8159 30.4064 24.8159 31.1936C24.8159 32.4478 25.0961 33.5153 25.7632 34.8495L26.2836 35.8903L26.3637 38.5322C26.4437 41.134 26.4437 41.1607 26.1502 41.5476C25.9767 41.7611 25.5364 42.068 25.1628 42.2415C24.3489 42.6151 24.6024 42.8018 25.6031 42.5617C26.3103 42.4016 26.7373 42.4683 27.1242 42.8018C27.2576 42.9219 28.1383 44.0427 29.0856 45.2836C30.0196 46.5378 31.0203 47.7787 31.3005 48.0322L31.7942 48.4992L31.2338 47.4318C30.62 46.271 29.0589 43.8559 27.9648 42.3615L27.2843 41.4275L27.3243 39.5195L27.3777 37.6248L28.3918 39.0525C30.3398 41.8278 31.0603 42.8952 31.4072 43.6024C31.8209 44.4297 32.2078 45.8307 33.422 51.021C34.356 54.9972 34.8097 56.3315 35.9838 58.573C37.8785 62.1489 40.2535 65.3645 43.1756 68.3266C44.5099 69.6743 44.6833 69.8077 47.472 71.4088C51.1012 73.5036 54.8639 75.5985 56.1715 76.2389L57.1722 76.7326L56.7052 76.319C56.4517 76.0921 54.2768 74.5844 51.8751 72.9699C46.3112 69.2339 45.7241 68.7936 44.0162 67.0324C41.2676 64.1904 38.7324 60.6412 37.0913 57.3322C35.9838 55.1173 35.6636 54.1432 34.3693 49.2998C32.7282 43.1621 32.5681 42.8152 29.0989 37.4247C28.2583 36.1038 27.3377 34.5827 27.0708 34.049C26.0167 31.9808 26.0701 29.6859 27.1909 28.2982L27.4444 27.9913L31.3005 31.8341L35.1566 35.6901L36.1706 37.7583C37.6116 40.6803 40.1334 44.3763 40.2669 43.7492C40.3469 43.3356 38.4122 38.7323 36.9845 35.957C36.3975 34.8095 36.184 34.5693 32.3012 30.6199C28.5119 26.7771 28.1783 26.4836 27.7113 26.4436C27.3777 26.4169 27.0575 26.4969 26.7639 26.6837L26.3103 26.9506L25.8833 25.9365C25.1228 24.1086 25.1895 22.3206 26.0568 21.4133L26.4837 20.9597L32.488 25.8965C35.797 28.6051 38.7191 31.0468 38.986 31.3137C39.2662 31.5939 39.92 32.6346 40.5337 33.8088C42.7086 37.9451 44.5899 40.9472 45.6173 41.9479C46.8182 43.1221 46.538 42.3615 43.4024 36.1304C42.1215 33.582 40.8539 31.1936 40.5871 30.8334C40.2535 30.3797 38.0253 28.4717 33.889 25.0826C27.0041 19.4386 27.3377 19.7989 27.3243 18.0643C27.3243 17.0636 27.5912 16.3164 28.1383 15.8227C28.4185 15.5692 28.4318 15.5692 28.7253 15.836C28.8855 15.9828 31.9943 18.6647 35.6236 21.8003C39.2528 24.9358 42.3884 27.7245 42.5752 27.9913C42.7753 28.2715 43.4558 29.379 44.0963 30.4864C47.4586 36.2505 50.3407 40.5469 51.3014 41.2674L51.6349 41.5209L51.5149 41.1874C50.9278 39.6396 44.3498 27.6978 43.5759 26.7905C43.3491 26.5103 41.0274 24.4555 38.4256 22.2139C34.8097 19.0917 33.6755 18.0376 33.6488 17.7841C33.5821 17.3171 33.9557 16.3831 34.356 16.0095L34.6762 15.7026L35.1165 16.0495C35.3567 16.2363 38.4656 18.9049 42.0148 21.9737L48.486 27.551L49.6602 29.7526C51.7417 33.622 53.4896 36.3973 54.984 38.2386C56.1448 39.6663 56.932 40.2534 58.4398 40.8138C59.0535 41.0406 59.1203 41.0539 58.84 40.8538C57.8527 40.16 56.5584 39.0525 56.1448 38.5455C55.5977 37.8784 50.4341 28.0714 50.4341 27.7111C50.4341 27.3109 50.9545 26.4302 51.5282 25.8832C51.9952 25.4162 53.0092 24.9358 53.156 25.0959C53.1827 25.1226 53.7698 26.8972 54.477 29.0321C55.6645 32.688 55.7845 32.9949 56.7052 34.5026C61.2284 41.8812 62.9363 44.91 63.3499 46.2977C63.51 46.818 63.7635 48.5393 63.977 50.6341C64.3239 53.9698 65.0845 59.6405 65.3513 60.8013C65.4181 61.1082 65.6182 61.5218 65.7783 61.7353C66.312 62.4291 70.8352 67.0724 71.5291 67.6595C72.6232 68.5801 72.343 68.1265 68.9272 63.5899C67.0058 61.0148 66.9391 60.8947 66.7657 59.9874C66.4588 58.3996 65.9251 54.4501 65.4581 50.2338C65.2046 48.0055 64.911 45.9641 64.7909 45.6305C64.2572 44.1895 61.8155 39.8798 58.253 34.089C57.1589 32.3144 57.0655 32.1009 56.1581 29.2856C54.9573 25.5363 54.4503 24.1353 54.1968 23.8417C54.05 23.6683 53.7965 23.6149 53.1827 23.6149C51.7684 23.6149 50.3807 24.5089 49.8203 25.7898C49.6869 26.0967 49.5668 26.3635 49.5535 26.3902C49.5268 26.4302 40.507 18.6914 36.5576 15.249C35.1833 14.0614 34.823 13.928 34.0358 14.3416C33.4754 14.6218 32.5948 15.6759 32.3946 16.303L32.2078 16.8368L30.58 15.4224C28.712 13.8079 28.4718 13.7279 27.4845 14.395ZM25.5097 17.1703C25.6431 17.3304 25.7499 17.8108 25.7899 18.5046L25.87 19.5987L25.483 19.8389C25.0561 20.0924 24.3756 20.9597 24.2155 21.4667C24.1221 21.7603 24.1087 21.7736 23.9886 21.5468C23.7752 21.1732 23.6951 19.1851 23.8686 18.638C24.0687 18.0643 24.896 16.9435 25.1361 16.9435C25.2295 16.9435 25.403 17.0502 25.5097 17.1703ZM23.8419 23.3881C23.8285 24.669 24.0554 25.5629 24.7625 27.084C25.363 28.3382 25.363 28.3516 25.1495 28.8453L24.9493 29.3523L24.3356 28.8853C24.0153 28.6318 23.4416 28.3249 23.068 28.1915C22.4542 27.9646 22.3875 27.8979 22.1473 27.2308C21.7737 26.2568 21.6803 25.136 21.8805 24.282C22.094 23.4014 23.108 22.2406 23.575 22.3607C23.8285 22.4274 23.8552 22.5341 23.8419 23.3881Z"
                    fill="#3F5873" />
            </svg>
            <h1>Submitted, Thank You!</h1>
            <div class="main-margin"></div>
            <p style="color:#3F5873">
                Share your budge on your social Media to help your friends help
            </p>
            <div class="main-margin"></div>
            <button class="danger" @click="downloadBadge">
                <svg v-if="isLoading" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" height="80px">
                    <circle fill="#ffffff" stroke="#ffffff" stroke-width="15" r="15" cx="40" cy="65">
                        <animate attributeName="cy" calcMode="spline" dur="2" values="65;135;65;"
                            keySplines=".5 0 .5 1;.5 0 .5 1" repeatCount="indefinite" begin="-.4"></animate>
                    </circle>
                    <circle fill="#ffffff" stroke="#ffffff" stroke-width="15" r="15" cx="100" cy="65">
                        <animate attributeName="cy" calcMode="spline" dur="2" values="65;135;65;"
                            keySplines=".5 0 .5 1;.5 0 .5 1" repeatCount="indefinite" begin="-.2"></animate>
                    </circle>
                    <circle fill="#ffffff" stroke="#ffffff" stroke-width="15" r="15" cx="160" cy="65">
                        <animate attributeName="cy" calcMode="spline" dur="2" values="65;135;65;"
                            keySplines=".5 0 .5 1;.5 0 .5 1" repeatCount="indefinite" begin="0"></animate>
                    </circle>
                </svg>

                <span v-if="!isLoading"> Share your badge </span>

            </button>
            <div class="main-margin"></div>

            <div v-if="petition" class="badge" id="badge">
                <div class="head">
                    <!-- <span class="top"> -->
                    All <span class="red">eyes</span> <br />
                    <!-- </span> -->
                    <!-- <span class="bottom"> -->
                    <!-- <img class="eyes" src="./assets/eyes.jpg" alt="eyes gaza"> -->
                    <i class="fa-solid fa-eye eyes red"></i>n Gaza
                    <!-- </span> -->
                </div>
                <div class="main">
                    <div class="byMsg">
                        <div class="by">
                            I'm <span class="name">{{ petition.name }}</span>
                        </div>
                        <div class="msg">
                            {{ petition.comment }}
                        </div>
                    </div>

                    <div class="join">
                        <span class="joinMsg">
                            Join & Get your badge
                        </span>
                        <span class="link" id="link">
                            <i class="fa-solid fa-arrow-right"></i>
                            http://palestinianblood.org/
                        </span>
                    </div>

                    <div class="data">
                        <div class="more">
                            More than
                        </div>
                        <div class="count">
                            {{ stats.toLocaleString("en-US") }}
                        </div>
                        <div class="people">
                            <i class="fa-solid fa-user"></i>
                            People Partipated
                        </div>
                    </div>
                    <div class="social">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-tiktok"></i>
                        <i class="fa-brands fa-x-twitter"></i>
                        <i class="fa-brands fa-linkedin-in"></i>
                        <span class="slash">
                            / All_eyes_on_Gaza
                        </span>
                    </div>
                </div>
                <div class="footer">
                    @ From the river to the sea palestine will be free
                </div>
            </div>

        </div>
        <div class="main-margin"></div>
        <!--------------------------- DONATION ---------------------------->
        <div class="hr"></div>
        <div class="donations">
            <p class="dn">Donations go to the following organisations </p>
            <div>
                <div v-for="(organisation, index) in oraganisations" :key="index" class="organisation">
                    <a :href="organisation.link" target="_blank">
                        <img :src="organisation.logo" v-if="organisation.logo" />
                        {{ organisation.name }}
                    </a>
                </div>

            </div>
        </div>
    </div>

</template>

<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import { toPng } from "html-to-image";

// * DATA
let petition = ref(null);
let name = ref();
let comment = ref();
let submited = ref(false);
let isLoaded = ref(false);
let isLoading = ref(false);

let stats = ref(0);
let errorMsg = ref(false);
let oraganisations = ref([
    {
        name: "",
        logo: "https://www.anera.org/wp-content/uploads/2019/02/anera_logo_02.05.19.png.webp",
        link: "https://www.anera.org/where-we-work/palestine/gaza/",
    },
    {
        name: "",
        logo: "https://www.worldvision.org.uk/media/wmsbk5pz/wv-logo.svg",
        link: "https://www.worldvision.org.uk/emergencies/middle-east-appeal/",
    },
    {
        name: "",
        logo: "https://i.stci.uk/sites/www.savethechildren.net/themes/stcui/img/stc_logo.svg",
        link: "https://www.savethechildren.net/",
    },
    {
        name: "InterNational Rescue Committee",
        logo: "",
        link: "https://www.rescue.org/topic/gaza-crisis",
    },
    {
        name: "",
        logo: "https://www.doctorswithoutborders.org/themes/custom/msf/logo.svg",
        link: "https://www.doctorswithoutborders.org/what-we-do/where-we-work/palestine",
    },
    {
        name: "",
        logo: "https://nvlupin.blob.core.windows.net/images/van/EA/EA002/1/63736/images/MECA_logo.jpg",
        link: "https://secure.everyaction.com/b00t33wD-EOVJ1cNTyHixg2",
    },
    {
        name: "",
        logo: "https://www.palestinercs.org/public/images/headerLogoen1.png",
        link: "https://www.palestinercs.org/en",
    },

    {
        name: "",
        logo: "https://d2r0txsugik6oi.cloudfront.net/neon/resource/pcrf1/images/logo(2).png",
        link: "https://pcrf1.app.neoncrm.com/forms/gaza-recovery",
    },
    {
        name: "Ouena",
        logo: "",
        link: "https://www.instagram.com/ouena_collective/?igsh=bG16emxrYTF1Mm93",
    },
    {
        name: "MATW PROJECT",
        logo: "",
        link: "https://www.matwproject.org/crisis-and-emergencies/palestine?gad_source=1&gclid=Cj0KCQjwsPCyBhD4ARIsAPaaRf0O_wP-NzDXvdMo_idXhgFTf-Y_F0QjeHaYw9YL86ticEXFE6iWbrMaAv7uEALw_wcB",
    },
]);

// * METHODS
function addUser() {
    if (name.value) {
        errorMsg.value = false;
        axios
            .post(
                "https://palastineblood.org/api/petition/add",
                {
                    name: name.value,
                    comment: comment.value,
                }
            )
            .then((response) => {
                console.log(response.data);
                submited.value = true;
                stats.value = response.data.number;
                localStorage.setItem('id', response.data.id)
            });
    } else {
        errorMsg.value = false;
    }

}


function getStates() {
    axios
        .get("https://palastineblood.org/api/status", {
            params: {
                id: localStorage.getItem('id')
            }
        })
        .then(function (response) {

            stats.value = response.data.number;
            isLoaded.value = true;

            if (response.data.petition) {
                submited.value = true;
                petition.value = response.data.petition;
            }

        })
        .catch(function (error) {
            console.log("error : " + error);
        });
}


function downloadBadge() {

    isLoading.value = true;
    const element = document.getElementById('badge');
    toPng(element)
        .then((dataUrl) => {
            const link = document.createElement('a');
            link.download = petition.name + '-alleyesongaza.png';
            link.href = dataUrl;
            link.click();
            isLoading.value = false;

        })
        .catch((error) => {
            console.error('oops, something went wrong!', error);
        });

}
// * HOOKS
onMounted(() => {
    getStates();
    setInterval(() => {
        getStates();
    }, 10 * 1000);
});
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap");

* {
    font-family: "Inter", sans-serif;
}

/* body{
  background-image: url('https://foreignpolicy.com/wp-content/uploads/2023/11/gaza-israel-hamas-war-GettyImages-1774031826.jpg?w=800?quality=80');
  background-repeat: no-repeat;
  background-size: cover  ;
} */

:root {
    --main-color-text: #3f5873;
    --main-radius: 50px;
    --main-height: 45px;
    --main-margin-bottom: 18px;
    --main-border-color: #d1e0f0;
    --main-padding: 10px;
    --main-red: #c60812;
}

.danger {
    /* background-color: white; */
    /* color: #517194; */
    display: flex;
    align-items: center;
    justify-content: center;
    /* border: 1px solid #D1E0F0; */
    background-color: var(--main-red);
    color: #fff;
}

.danger svg {

    margin-right: 10px;
}

.light {
    background-color: white;
    border: 1px solid var(--main-border-color);
    color: var(--main-color-text);
}

hr {
    background-color: var(--main-border-color);
    height: 2px;
}

input,
button {
    height: var(--main-height);
    width: 100%;
    border: none;
    border-radius: var(--main-radius);
    /* padding: var(--main-padding); */
}

input {
    padding-left: 20px;
    border: 1px solid var(--main-border-color) !important;
    outline: none;
    width: calc(100% - 20px) !important;
}

.err-msg {
    color: var(--main-red);
    font-size: 14px;
    text-align: left;
    font-weight: 500;
    display: inline-block;
    margin-top: 5px;
    margin-left: 10px;
}

.name {
    color: #000;
    font-size: 14px;
}

.name:focus {
    border: 1px solid black !important;
    font-weight: 800;
}

.name:focus::placeholder {
    color: black;
}

.name::placeholder {
    color: #517194 !important;
}

button {
    font-weight: 700;
}

.title {
    color: #000;
    font-weight: 700;
    font-size: 28px;
    text-align: left;
    text-align: center;
}

.main-margin {
    margin-bottom: var(--main-margin-bottom);
}

.comment {
    background-color: var(--main-border-color);
    color: var(--main-color-text) !important;
}

.hr {
    background-color: var(--main-border-color);
    height: 1px;
    width: 100%;
}

/* STATES */

.states .header {
    display: flex;
    align-items: flex-start;
    justify-content: center;
    gap: 10px;
    margin-bottom: 10px;
    margin-top: 10px;
}

.states .header .circle {
    height: 11px;
    width: 11px;
    border-radius: 50%;
    background-color: var(--main-red);
}

.states .header span {
    color: var(--main-red);
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 2px;
}

.states .totals {
    color: #000;
    font-size: 3em;
    text-align: justify;
    font-weight: 700;
    margin-bottom: 15px;
    text-align: center;
}

.states p {
    color: var(--main-color-text);
    font-size: 13px;
    font-weight: 500;
    text-align: left;
    text-align: center;

}

.submited h1 {
    font-size: 28px;
    font-weight: 700;
}

.submited p {
    margin: 0;
    color: var(--main-color-text);
}

.flex-center-center {
    display: flex;
    justify-content: center;
    align-items: center;
}

.gap-10 {
    gap: 10px;
}

.gap-5 {
    gap: 5px;
}

.donations h4 {
    color: var(--main-color-text);
    margin-bottom: 0px;
}

/* ORGANISATIONS */
.organisation {
    border: 1px solid var(--main-border-color);
    padding: 10px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 700;
    font-size: 15px;
    color: var(--main-color-text);
    margin-top: 5px;
    margin-bottom: 5px;
}

.organisation img {
    margin-bottom: 10px;
    height: 100%;
    width: 100%;
    object-fit: contain;
}

@media (max-width: 768px) {
    #app {
        padding: 25px;
        text-align: center;
    }

    #logo {
        width: 100%;
    }

    .main-section {
        width: 100%;
    }

    form,
    input,
    button {
        width: 100%;
    }

    form {
        text-align: left;
    }
}

@media (min-width: 769px) {
    body {
        height: 100vh;
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #app {
        width: 50%;
        margin: auto;
        text-align: center !important;
        border: 1px solid var(--main-border-color);
        padding: 25px;
        border-radius: var(--main-radius);
    }
}

.img-war {
    position: absolute;
    z-index: -1;
    width: 100%;
    height: 50%;
    left: 0;
    top: -5px;
    opacity: 0.5;
}

.img-war img {
    object-fit: cover;


    width: 100%;
    height: 100%;
    box-shadow: inset 0px -20px 20px 0px white;
    height: 100%;

}

.img-war .img-white-bg {

    position: absolute;
    top: -48%;
    left: 0;
    z-index: 4;
    height: 74vh;
}

.states {
    padding: 20px;
    background: white;
    border-radius: 20px;
    border: 1px solid #d1e0f0;

}

.dn {
    font-size: 20px;
    color: #3F5873;
    font-weight: bold;
}

.live-icon {
    display: inline-block;
    position: relative;
    top: calc(50% - 5px);
    background-color: red;
    width: 10px;
    height: 10px;
    margin-left: 20px;
    border: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: 50%;
    z-index: 1;
}

.live-icon:before {
    content: "";
    display: block;
    position: absolute;
    background-color: rgba(255, 0, 0, 0.6);
    width: 100%;
    height: 100%;
    border-radius: 50%;
    -webkit-animation: live 2s ease-in-out infinite;
    animation: live 2s ease-in-out infinite;
    z-index: -1;
}

@-webkit-keyframes live {
    0% {
        transform: scale(1, 1);
    }

    100% {
        transform: scale(3.5, 3.5);
        background-color: rgba(255, 0, 0, 0);
    }
}

@keyframes live {
    0% {
        transform: scale(1, 1);
    }

    100% {
        transform: scale(3.5, 3.5);
        background-color: rgba(255, 0, 0, 0);
    }
}

.badge {
    /* width: 100vw;
    height: 100vh; */
    background-image: url(/mainPic.jpeg);
    background-repeat: no-repeat;
    background-size: 100vw 100vh;
    padding-top: 45px;
    display: flex;
    flex-direction: column;
    color: #fff;
    bottom: 0px;
    height: 100%;
    left: 0px;
}

/* head */
.badge .head {
    display: block;
    width: fit-content;
    font-size: clamp(3rem, 5vw, 4rem);
    font-weight: 600;
    margin: auto;
    margin-bottom: 17vh;
    font-style: italic;
    line-height: 30px;
    padding-inline: 20px;
}

.badge .head .eyes {
    /* mix-blend-mode: multiply; */
    margin-top: 10px;
}

/* head */
/* Main */
.badge .main {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-evenly;
    gap: 20px;
    flex: 1;
    padding-inline: 20px;

}

.badge .main .byMsg .by {
    font-size: clamp(2.2rem, 3vw, 2.5rem);
    font-style: italic;
    font-weight: 500;
    letter-spacing: -0.34px;
    text-align: center;
    margin-bottom: 5px;
}

.badge .main .byMsg .by .name {
    color: #fef000;
}

.badge .main .byMsg .msg {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 5px;
    font-size: clamp(0.6rem, 3vw, 1rem);
    font-weight: 200;
}

.badge .main .byMsg .msg svg {
    width: fit-content;
    height: 16px;
    stroke: #fff;

}

.badge .main .join {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 5px;
}

/* font-size: clamp(0.6rem, 3vw, 1rem); */

.badge .main .join .joinMsg {
    font-size: clamp(1rem, 2vw, 1rem);
    font-weight: 400;

    /* display: flex;
        align-items: center;
        justify-content: center;
        gap: 5px;
        font-size: clamp(0.6rem, 3vw, 1rem); */
}


.badge .main .join .link {
    padding: 2px 10px;
    background: #318621;
    display: flex;
    align-items: center;
    height: 32px;
    border-radius: 13px;
    font-size: clamp(1rem, 2vw, 1rem);
    text-decoration: none;
    gap: 5px;
}


.badge .main .join .link i {
    font-size: 14px;
}

.badge .main .data {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 5px;
}

.badge .main .data .more {
    font-size: clamp(0.6rem, 1.5vw, 0.9rem);
    font-weight: 300;
    color: #8b8786;
    letter-spacing: -0.76px;
}

.badge .main .data .count {
    font-size: clamp(3rem, 4vw, 5rem);
    font-weight: 700;
}

.badge .main .data .people {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: clamp(0.8rem, 2vw, 1.5rem);
    font-weight: 200;
}

.badge .main .social {
    display: flex;
    align-items: center;
    gap: 5px;
    /* font-size: clamp(1rem, 2vh, 3rem); */
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: clamp(1rem, 2vh, 3rem);
    font-weight: 300;

}

.badge .footer {
    background: #3e3e3e;
    padding: 10px 20px;
    text-align: center;
    font-size: clamp(0.5rem, 1.6vh, 5rem);
}

.badge .red {
    color: #a71126;
}
</style>
