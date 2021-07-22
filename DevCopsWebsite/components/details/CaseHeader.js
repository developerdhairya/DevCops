import useFetchData from "../../hooks/useFetchData";
import Indicator from "./../layout/Indicators";
import { IndicatorLogic } from "../layout/IndicatorLogic";

const CaseHeader = () => {
  const details = useFetchData();
  const priority = details.complaintDetails["Priority"];
  const status = details.complaintDetails["Status"];

  const indicators = IndicatorLogic(priority, status);

  return (
    <div className="row m-3">
      <p className=" col-12 order-sm-first col-sm-6 col-md-4 p-0 mb-0 align-items-center">
        {details.caseId}
      </p>
      <h4 className=" col-12 col-sm-12 col-md-4 order-sm-last">
        {details.complaintDetails["Complaint"]}
      </h4>
      <div className="col-12 col-sm-6 col-md-4 order-first order-md-last d-flex justify-content-end align-self-center  p-0 c">
        {details.complaintDetails["Status"] !== "Resolved" && (
          <Indicator title={priority} class="fa-circle" color={indicators[0]} />
        )}

        <Indicator
          title={status}
          class={indicators[1][0]}
          color={indicators[1][1]}
        />
      </div>
    </div>
  );
};

export default CaseHeader;
