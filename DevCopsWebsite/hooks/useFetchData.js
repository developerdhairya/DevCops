import { useRouter } from "next/router";
import { useSelector } from "react-redux";
import { useState, useEffect } from "react";

const useFetchData = () => {
  const router = useRouter();

  const [complaintDetails, setComplaintDetails] = useState([]);
  const caseId = router.query.caseId;
  const category = router.query.complaint;

  const complaintList = useSelector((state) => state.data.complaints);

  useEffect(() => {
    try {
      setComplaintDetails(complaintList[category][caseId]);
    } catch (err) {}
  }, [complaintList, category]);

  return { complaintList, complaintDetails, category, caseId };
};

export default useFetchData;
