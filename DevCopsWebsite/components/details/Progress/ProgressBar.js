import useFetchData from "../../../hooks/useFetchData";

const ProgressBar = () => {
  const details = useFetchData();

  return (
    <div className="col-12 col-sm-10 offset-sm-1 col-lg-6 align-self-center mb-3 mb-sm-0">
      <div className="progress">
        <div
          className="progress-bar bg-success progress-bar-striped progress-bar-animated"
          role="progressbar"
          aria-valuenow={details.complaintDetails["Progress"]}
          aria-valuemin="0"
          aria-valuemax="100"
          style={{ width: `${details.complaintDetails["Progress"]}%` }}
        ></div>
      </div>
    </div>
  );
};

export default ProgressBar;
