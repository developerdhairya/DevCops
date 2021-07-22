import { useDispatch } from "react-redux";
import { dataActions } from "../../../store/data";
import useFetchData from "./../../../hooks/useFetchData";
import styles from "./../../../styles/globals.module.css";

const CaseResolved = () => {
  const dispatch = useDispatch();
  const details = useFetchData();

  const resolveCaseHandler = () => {
    dispatch(
      dataActions.updateStatus({
        category: details.category,
        caseId: details.caseId,
        status: "Resolved",
      })
    );
  };

  return (
    <div className="row d-flex justify-content-end">
      <div className="col-auto">
        <button
          className={`btn mb-4 mb-sm-1 mb-md-0 ${styles.bgGreen}`}
          onClick={resolveCaseHandler}
          disabled={
            details.complaintDetails["Progress"] !== "100" ? true : false
          }
        >
          Case Resolved
        </button>
      </div>
    </div>
  );
};
export default CaseResolved;
