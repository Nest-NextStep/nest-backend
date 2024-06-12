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
const auth = getAuth();
const AuthQuery = require("../queries/authQueries");

const registerUser = async (request, h) => {
  try {
    const { email, password, displayName } = request.payload;

    const userRecord = await admin.auth().createUser({
      email,
      password,
    });

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
      await sequelize.query(AuthQuery.postUsernameQuery, {
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

    const userCredential = await signInWithEmailAndPassword(
      auth,
      email,
      password
    );

    const user = userCredential.user;
    const { uid, displayName } = user;
    const username = displayName;
    const replacements = [username];
    const refreshToken = user.stsTokenManager.refreshToken;

    const accessToken = await user.getIdToken();

    if (userCredential != null) {
      const [result] = await sequelize.query(AuthQuery.getMajorQuery, {
        replacements,
      });

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
    console.log(`Refreshing token with refreshToken: ${refreshToken}`);
    console.log(`Using API Key: ${firebaseConfig.apiKey}`);

    const response = await axios.post(
      `https://securetoken.googleapis.com/v1/token?key=${firebaseConfig.apiKey}`,
      {
        grant_type: "refresh_token",
        refresh_token: refreshToken,
      }
    );

    console.log("Firebase token refresh response:", response.data);

    const { id_token: accessToken, refresh_token: newRefreshToken } =
      response.data;

    return h.response({ accessToken, refreshToken: newRefreshToken }).code(200);
  } catch (error) {
    console.error("Error refreshing token:", error);
    return h.response({ error: "Invalid refresh token" }).code(401);
  }
};
const logoutUserHandler = async (request, h) => {
  try {
    await signOut(auth);

    return h.response({ message: "Sign-out successful." }).code(200);
  } catch (error) {
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
