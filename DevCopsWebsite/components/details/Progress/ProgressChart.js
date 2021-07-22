import ProgressHeader from "./ProgressHeader";
import ProgressMain from "./ProgressMain";
import CaseResolved from "./CaseResolved";
const ProgressChart = () => {
  return (
    <div className={`row my-5`}>
      <div className="col-12">
        <ProgressHeader />
        <ProgressMain />
        <CaseResolved />
      </div>
    </div>
  );
};

export default ProgressChart;
