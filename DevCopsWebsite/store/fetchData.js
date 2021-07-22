import { dataActions } from "./data";

export const fetchAppData = () => {
  return async (dispatch) => {
    const fetchData = async () => {
      const response = await fetch(process.env.NEXT_PUBLIC_FETCH_DATA_URL);

      if (!response.ok) {
        throw new Error("Could not fetch data!");
      }

      const data = await response.json();
      return data;
    };

    try {
      const appData = await fetchData();
      let categories = [];
      Object.keys(appData).map((item, index) => {
        categories.push(item);
      });

      dispatch(dataActions.setCategories(categories));

      dispatch(dataActions.setComplaints(appData));
    } catch (error) {
      console.log(error);
    }
  };
};

export const sendAppData = (complaintList) => {
  return async () => {
    const sendRequest = async () => {
      const response = await fetch(process.env.NEXT_PUBLIC_FETCH_DATA_URL, {
        method: "PUT",
        body: JSON.stringify(complaintList),
      });

      if (!response.ok) {
        throw new Error("Sending data failed.");
      }
    };

    try {
      await sendRequest();
    } catch (error) {
      console.log(error);
    }
  };
};
