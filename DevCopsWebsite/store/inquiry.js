import { createSlice } from "@reduxjs/toolkit";

const initialInquiryState = { email: "", name: "", contatNo: "", inquiry: "" };

const inquirySlice = createSlice({
  name: "inquiry",
  initialState: initialInquiryState,
  reducers: {
    setInquiry(state, action) {
      state.email = action.payload.emailid;
      state.name = `${action.payload.firstname} ${action.payload.lastname}`;
      state.contatNo = `${action.payload.areacode} ${action.payload.telnum}`;
      state.inquiry = action.payload.inquiry;
    },
  },
});

export const inquiryActions = inquirySlice.actions;
export default inquirySlice.reducer;
