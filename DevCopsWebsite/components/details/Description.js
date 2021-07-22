import styles from "./../../styles/globals.module.css";
import useFetchData from "../../hooks/useFetchData";

const Description = () => {
  const details = useFetchData();

  return (
    <div className={`row ${styles.rowContent}`}>
      <div className="col-sm-6">
        <img
          style={{ maxHeight: "100%", maxWidth: "100%" }}
          src={details.complaintDetails["Image"]}
        />
      </div>
      <div className="col-sm-6">
        <h5>{details.category}</h5>
        <p>
          <strong>{details.complaintDetails["Date&Time"]}</strong>
        </p>
        <p className="text-justify">
          {details.complaintDetails["Description"]}
        </p>
      </div>
    </div>
  );
};

export default Description;
