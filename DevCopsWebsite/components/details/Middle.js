import EditPriority from "./EditPriority";
import styles from "./../../styles/globals.module.css";

const Middle = (props) => {
  return (
    <div className="row mb-5 d-flex justify-content-end">
      <div className="mx-2">
        <EditPriority />
      </div>
      <div className="mx-3">
        <button className={`btn ${styles.bgGreen}`} onClick={props.onClick}>
          Start Investigation
        </button>
      </div>
    </div>
  );
};

export default Middle;
