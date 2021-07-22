import { createSlice } from "@reduxjs/toolkit";

const initialDataState = { categories: [], complaints: [] };

const dataSlice = createSlice({
  name: "data",
  initialState: initialDataState,
  reducers: {
    setCategories(state, action) {
      state.categories = action.payload;
    },
    setComplaints(state, action) {
      state.complaints = action.payload;
    },
    editProgress(state, action) {
      const { category, caseId, progress, progressDescription } =
        action.payload;
      state.complaints[category][caseId]["Progress"] = progress;
      state.complaints[category][caseId]["Progress Description"] =
        progressDescription;
    },
    updateStatus(state, action) {
      const { category, caseId, status } = action.payload;
      state.complaints[category][caseId]["Status"] = status;
    },
    updatePriority(state, action) {
      const { category, caseId, priority } = action.payload;
      state.complaints[category][caseId]["Priority"] = priority;
    },
  },
});

export const dataActions = dataSlice.actions;
export default dataSlice.reducer;
