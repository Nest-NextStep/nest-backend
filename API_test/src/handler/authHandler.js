// /src/handler/authHandler.js
const { firebase } = require("../utils/firebase");
const admin = require("firebase-admin");
const { getAuth, signInWithEmailAndPassword } = require("firebase/auth");

const registerUser = async (request, h) => {
  try {
    const { email, password, username } = request.payload;

    // Create the user using Firebase Admin SDK
    const userRecord = await admin.auth().createUser({
      email,
      password,
    });

    // Update the user's display name (username in this case)
    await admin.auth().updateUser(userRecord.uid, {
      displayName: username,
    });

    // Return success response
    return h
      .response({
        uid: userRecord.uid,
        message: "User registered successfully",
      })
      .code(201);
  } catch (error) {
    console.error("Error registering user:", error);
    return h.response({ error: error.message }).code(500);
  }
};

const auth = getAuth();
const loginUser = async (request, h) => {
  try {
    const { email, password } = request.payload;

    // Using signInWithEmailAndPassword to authenticate user
    const userCredential = await signInWithEmailAndPassword(
      auth,
      email,
      password
    );

    // Retrieve user details
    const user = userCredential.user;
    const { uid, displayName } = user;
    const username = displayName;

    // Get ID token
    const accessToken = await user.getIdToken();

    // Return user information and token in the response
    return h
      .response({
        uid,
        username,
        accessToken,
      })
      .code(200);
  } catch (error) {
    console.error("Login error:", error);
    return h.response({ error: error.message }).code(401);
  }
};

module.exports = { registerUser, loginUser };
