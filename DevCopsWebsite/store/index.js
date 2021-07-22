import { configureStore } from "@reduxjs/toolkit";
import dataReducer from "./data";
import inquiryReducer from "./inquiry";
import authReducer from "./auth";

const store = configureStore({
  reducer: { auth: authReducer, data: dataReducer, inquiry: inquiryReducer },
});

export default store;
