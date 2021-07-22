export const sendInquiry = (inquiry) => {
  return async () => {
    const sendRequest = async () => {
      const response = await fetch(process.env.NEXT_PUBLIC_SEND_INQUIRY_URL, {
        method: "POST",
        body: JSON.stringify(inquiry),
      });

      if (!response.ok) {
        throw new Error("Sending inquiry failed.");
      }
    };

    try {
      await sendRequest();
      alert("Inquiry sent succesfully!");
    } catch (error) {
      alert(error.message);
    }
  };
};
