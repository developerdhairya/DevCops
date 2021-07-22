import ProgressBar from "./ProgressBar";
import EditPriority from "./../EditPriority";
import styles from "./../../../styles/globals.module.css";

const Progress = (props) => {
  return (
    <div className="row my-5">
      <ProgressBar />
      <div className="col-12 col-sm-6 col-lg-2 my-2">
        <button
          className={`btn btn-sm-block ${styles.bgOrange}`}
          onClick={props.onClick}
        >
          Edit Progress
        </button>
      </div>
      <div className="col-12 col-sm-6 col-lg-3 my-2">
        <EditPriority />
      </div>
    </div>
  );
};

export default Progress;
