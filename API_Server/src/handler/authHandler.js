// /src/handler/authHandler.js
const { firebase, firebaseConfig } = require("../utils/firebase");
const admin = require("firebase-admin");
const {
  getAuth,
  signInWithEmailAndPassword,
  updatePassword,
  signOut,
} = require("firebase/auth");
const { sequelize } = require("../utils/database");
const axios = require("axios");
const { ref } = require("firebase/database");
const auth = getAuth();

const registerUser = async (request, h) => {
  try {
    const { email, password, displayName } = request.payload;

    // Create the user using Firebase Admin SDK
    const userRecord = await admin.auth().createUser({
      email,
      password,
    });

    // Update the user's display name (username in this case)
    const result = await admin.auth().updateUser(userRecord.uid, {
      displayName: displayName,
    });

    const userCredential = await signInWithEmailAndPassword(
      auth,
      email,
      password
    );

    const user = userCredential.user;
    const accessToken = await user.getIdToken();
    const replacements = [displayName];
    const username = displayName;
    const refreshToken = user.stsTokenManager.refreshToken;

    if (result != null) {
      await sequelize.query("INSERT INTO user_data (username) VALUES (?)", {
        replacements,
      });
      return h
        .response({
          uid: userRecord.uid,
          accessToken: accessToken,
          refreshToken: refreshToken,
          username: username,
          message: "User registered successfully",
        })
        .code(201);
    }
  } catch (error) {
    console.error("Error registering user:", error);
    return h.response({ error: error.message }).code(500);
  }
};

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
    const replacements = [username];
    const refreshToken = user.stsTokenManager.refreshToken;

    // Get ID token
    const accessToken = await user.getIdToken();

    // Return user information and token in the response
    if (userCredential != null) {
      const [result] = await sequelize.query(
        ` SELECT 
        m.major_id,
        m.major_name,
        m.major_description
      FROM 
        major m 
      JOIN 
        user_major um on m.major_id = um.major_major_id
      JOIN
        user_data u on um.user_user_id = u.user_id
      WHERE 
        u.username = ?`,
        {
          replacements,
        }
      );
      return h
        .response({
          uid,
          username,
          accessToken,
          recommendedMajor: result,
          refreshToken: refreshToken,
        })
        .code(200);
    }
  } catch (error) {
    console.error("Login error:", error);
    return h.response({ error: error.message }).code(401);
  }
};

const changePassword = async (request, h) => {
  const { newPassword } = request.payload;

  try {
    const user = auth.currentUser;

    if (!user) {
      throw new Error("No user is currently logged in.");
    }

    await updatePassword(user, newPassword);

    return h.response({ message: "Password updated successfully" }).code(200);
  } catch (error) {
    console.error("Error updating password:", error);
    return h.response({ error: error.message }).code(500);
  }
};

const refreshToken = async (request, h) => {
  const { refreshToken } = request.payload;

  try {
    console.log(`Refreshing token with refreshToken: ${refreshToken}`); // Debug log
    console.log(`Using API Key: ${firebaseConfig.apiKey}`); // Debug log to check apiKey

    // Make a POST request to Firebase Auth REST API to refresh the token
    const response = await axios.post(
      `https://securetoken.googleapis.com/v1/token?key=${firebaseConfig.apiKey}`,
      {
        grant_type: "refresh_token",
        refresh_token: refreshToken,
      }
    );

    console.log("Firebase token refresh response:", response.data); // Log response data

    const { id_token: accessToken, refresh_token: newRefreshToken } =
      response.data;

    // Return the new ID token and refresh token
    return h.response({ accessToken, refreshToken: newRefreshToken }).code(200);
  } catch (error) {
    console.error("Error refreshing token:", error);
    return h.response({ error: "Invalid refresh token" }).code(401);
  }
};
const logoutUserHandler = async (request, h) => {
  try {
    await signOut(auth); // Wait for signOut operation to complete
    // Sign-out successful.
    return h.response({ message: "Sign-out successful." }).code(200);
  } catch (error) {
    // Handle errors
    console.error("Sign-out error:", error);
    return h
      .response({ error: "An error occurred during sign-out." })
      .code(500);
  }
};

module.exports = {
  registerUser,
  loginUser,
  refreshToken,
  changePassword,
  logoutUserHandler,
};
