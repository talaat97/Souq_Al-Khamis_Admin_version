importScripts('https://www.gstatic.com/firebasejs/10.11.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.11.0/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: "AIzaSyCyV34YcgxVHWXE18WeShl4Elh_nJz2cuk",
  authDomain: "ecommerce-fe1eb.firebaseapp.com",
  projectId: "ecommerce-fe1eb",
  storageBucket: "ecommerce-fe1eb.firebasestorage.app",
  messagingSenderId: "615173374977",
  appId: "1:615173374977:web:53a65d2530f3292000ac00"
});

const messaging = firebase.messaging();



// messaging.onBackgroundMessage((payload) => {
//   console.log('Received background message ', payload);
//   const notificationTitle = payload.notification.title;
//   const notificationOptions = {
//     body: payload.notification.body,
//     icon: payload.notification.icon
//   };

//   self.registration.showNotification(notificationTitle, notificationOptions);
// });