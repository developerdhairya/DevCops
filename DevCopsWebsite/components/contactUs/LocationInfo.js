import styles from "./../../styles/globals.module.css";
import Address from "../layout/Address";

const LocationInfo = () => {
  return (
    <div className={`row ${styles.rowContent}`}>
      <div className="col-12">
        <h3>Location Information</h3>
      </div>
      <div className="col-12 col-sm-4 offset-sm-1">
        <Address />
      </div>
      <div className="col-12 col-sm-6 offset-sm-1"></div>
    </div>
  );
};

export default LocationInfo;
