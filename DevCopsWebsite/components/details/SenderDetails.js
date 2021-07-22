import styles from "./../../styles/globals.module.css";
import useFetchData from "../../hooks/useFetchData";

const SenderDetails = () => {
  const details = useFetchData();
  return (
    <div className={`row ${styles.rowContent}`}>
      <div className="col-12">
        <h3>Sender's Details</h3>
        <div className="table-responsive">
          <table className="table table-striped">
            <thead className="thead-dark">
              <tr>
                <th>&nbsp;</th>
                <th>Details</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th>Name</th>
                <td>{details.complaintDetails["Sender"]}</td>
              </tr>
              <tr>
                <th>Address</th>
                <td>{details.complaintDetails["Location"]}</td>
              </tr>
              <tr>
                <th>Contact No.</th>
                <td>{details.complaintDetails["ContactNo"]}</td>
              </tr>
              <tr>
                <th>Aadhar Card</th>
                <td>{details.complaintDetails["AadharCard"]}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default SenderDetails;
