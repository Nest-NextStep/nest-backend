// /src/utils/firebase.js
const admin = require("firebase-admin");
const firebase = require("firebase/app");
require("dotenv").config();
require("firebase/auth");

const serviceAccount = require("../../nest-capstoneproject-b773f7925885.json"); // Path to your service account key

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const firebaseConfig = {
  apiKey: process.env.FIREBASE_API_KEY,
  authDomain: process.env.FIREBASE_AUTH_DOMAIN,
  projectId: process.env.FIREBASE_PROJECT_ID,
  storageBucket: process.env.FIREBASE_STORAGE_BUCKET,
  messagingSenderId: process.env.FIREBASE_MESSAGING_SENDER_ID,
  appId: process.env.FIREBASE_APP_ID,
};

firebase.initializeApp(firebaseConfig);

module.exports = { admin, firebase, firebaseConfig };
