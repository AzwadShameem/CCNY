import firebase from 'firebase';

const firebaseConfig = {
    apiKey: "AIzaSyCCyzMjgFBdfQIOxgdztlE8yovuJ54tRUU",
    authDomain: "web-design-final-project-35d93.firebaseapp.com",
    projectId: "web-design-final-project-35d93",
    storageBucket: "web-design-final-project-35d93.appspot.com",
    messagingSenderId: "637822059138",
    appId: "1:637822059138:web:8952dfdb6492ffc9fd2a9b"
  };

const firebaseApp = firebase.initializeApp(firebaseConfig);
const db = firebaseApp.firestore();
const auth = firebase.auth();

export {db, auth};