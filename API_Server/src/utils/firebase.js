// /src/utils/firebase.js
const admin = require("firebase-admin");
const firebase = require("firebase/app");
require("firebase/auth");

const serviceAccount = require("../../nest-capstoneproject-b773f7925885.json"); // Path to your service account key

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const firebaseConfig = {
  apiKey: "AIzaSyCV_hBc6IsrVC12gmjMsC71N5vB6GqVcAk",
  authDomain: "nest-capstoneproject.firebaseapp.com",
  projectId: "nest-capstoneproject",
  storageBucket: "nest-capstoneproject.appspot.com",
  messagingSenderId: "699147608099",
  appId: "1:699147608099:web:cad96ee0b58d93c770d196",
};

firebase.initializeApp(firebaseConfig);

module.exports = { admin, firebase, firebaseConfig };
