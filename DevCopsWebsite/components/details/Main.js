import { useEffect } from "react";
import Container from "../layout/Container";
import CaseHeader from "./CaseHeader";
import Description from "./Description";
import SenderDetails from "./SenderDetails";
import Middle from "./Middle";
import ProgressChart from "./Progress/ProgressChart";
import styles from "./../../styles/dashboard.module.css";
import { useDispatch } from "react-redux";
import { dataActions } from "../../store/data";
import { sendAppData } from "../../store/fetchData";
import useFetchData from "../../hooks/useFetchData";
import globalStyles from "./../../styles/globals.module.css";

let iSInitial = true;

const Main = () => {
  const dispatch = useDispatch();
  const details = useFetchData();
  const caseStatus = details.complaintDetails["Status"];

  const startInvestigationHandler = () => {
    dispatch(
      dataActions.updateStatus({
        category: details.category,
        caseId: details.caseId,
        status: "In Progress",
      })
    );
  };

  useEffect(() => {
    if (iSInitial) {
      iSInitial = false;
      return;
    }
    dispatch(sendAppData(details.complaintList));
  }, [dispatch, details.complaintList]);

  let content;

  if (caseStatus === "New Case") {
    content = <Middle onClick={startInvestigationHandler} />;
  } else if (caseStatus === "In Progress") {
    content = <ProgressChart />;
  } else if (caseStatus === "Resolved") {
    content = (
      <div className="row d-flex justify-content-end  mb-5 px-3 mb-md-0">
        <div className="col-auto">
          <button
            className={`btn ${globalStyles.bgGreen}`}
            onClick={window.print}
          >
            Print
          </button>
        </div>
      </div>
    );
  }

  return (
    <Container>
      <div className={`row text-center ${styles.rowHeader}`}>
        <div className={`col-12 p-2 ${styles.mainCol}`}>
          <CaseHeader />
          <div className={` ${styles.scrollableBox}`}>
            <Description />
            <SenderDetails />
            {content}
          </div>
        </div>
      </div>
    </Container>
  );
};

export default Main;
