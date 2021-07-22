import { createSlice } from "@reduxjs/toolkit";
import Cookie from "js-cookie";

const initialAuthState = {
  token: "null",
  isLoggedIn: false,
};

const authSlice = createSlice({
  name: "auth",
  initialState: initialAuthState,
  reducers: {
    login(state, action) {
      state.token = action.payload;
      state.isLoggedIn =
        action.payload !== "null" &&
        action.payload != "undefined" &&
        action.payload != undefined;
      Cookie.set("token", action.payload);
    },
    logout(state) {
      state.token = "null";
      state.isLoggedIn = false;
      Cookie.set("token", "null");
    },
  },
});

export const authActions = authSlice.actions;
export default authSlice.reducer;
