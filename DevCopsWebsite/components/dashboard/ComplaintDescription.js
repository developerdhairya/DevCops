import Indicator from "./../layout/Indicators";
import Link from "next/link";
import { IndicatorLogic } from "./../layout/IndicatorLogic";
import styles from "./../../styles/globals.module.css";

const ComplaintDescription = (props) => {
  const indicators = IndicatorLogic(props.priority, props.status);

  return (
    <div className="mb-2">
      <div className="row">
        <h6 className="col-12 order-sm-first col-sm-7 col-lg-4 text-center">
          {props.caseId}
        </h6>
        <h4 className="col-12 order-sm-last col-lg-4  text-center">
          {props.name}
        </h4>
        <div className="col-12 col-sm-5 order-first order-lg-last col-lg-4 d-flex justify-content-end">
          {props.status !== "Resolved" && (
            <Indicator
              title={props.priority}
              class="fa-circle"
              color={indicators[0]}
            />
          )}

          <Indicator
            title={props.status}
            class={indicators[1][0]}
            color={indicators[1][1]}
          />
        </div>
      </div>
      <p className="text-justify">{props.description}</p>
      <div className="d-flex justify-content-end mb-4 m-sm-1">
        <Link
          href={`/account/dashboard/${props.category}/${props.caseId}/details`}
        >
          <a role="button" className={`btn col-auto ${styles.bgOrange}`}>
            Case Details
          </a>
        </Link>
      </div>

      <hr />
    </div>
  );
};

export default ComplaintDescription;
