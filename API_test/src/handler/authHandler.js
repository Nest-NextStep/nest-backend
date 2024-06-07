// /src/handler/authHandler.js
const { admin, firebase } = require('../utils/firebase');

const registerUser = async (request, h) => {
  try {
    const { email, password } = request.payload;
    const userRecord = await admin.auth().createUser({
      email,
      password,
    });
    return h.response({ uid: userRecord.uid, message: 'User registered successfully' }).code(201);
  } catch (error) {
    console.error(error);
    return h.response({ error: error.message }).code(500);
  }
};

const loginUser = async (request, h) => {
  try {
    const { email, password } = request.payload;
    const userCredential = await firebase.auth().signInWithEmailAndPassword(email, password);
    const idToken = await userCredential.user.getIdToken();
    return h.response({ idToken }).code(200);
  } catch (error) {
    console.error(error);
    return h.response({ error: error.message }).code(401);
  }
};

module.exports = { registerUser, loginUser };
