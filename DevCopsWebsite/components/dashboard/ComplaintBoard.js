import { useRouter } from "next/router";
import { Fragment, useState, useEffect } from "react";
import { useSelector } from "react-redux";
import ComplaintDescription from "./ComplaintDescription";
import SeeComplaints from "./SeeComplaints";
import styles from "./../../styles/dashboard.module.css";

const ComplaintBoard = () => {
  const [currentComplaints, setCurrentComplaints] = useState([]);

  function openNav() {
    $("#sidebar").addClass("col-md-5 col-lg-3");
    $("#sidebar").removeClass("d-none");
    $("#board").removeClass("col-md-12");
    $("#board").addClass("d-none d-md-block col-md-7 col-lg-9");
    $("#openbtn").addClass("d-sm-none");
  }
  const router = useRouter();

  const category = router.query.complaint;

  const complaintList = useSelector((state) => state.data.complaints);

  useEffect(() => {
    setCurrentComplaints(complaintList[category]);
  }, [complaintList, category]);

  let content;
  try {
    Object.keys(currentComplaints).map((complaint, index) => {
      content = (
        <div>
          {content}
          <ComplaintDescription
            key={index}
            category={category}
            caseId={complaint}
            name={currentComplaints[complaint]["Complaint"]}
            priority={currentComplaints[complaint]["Priority"]}
            status={currentComplaints[complaint]["Status"]}
            description={currentComplaints[complaint]["Description"]}
          />
        </div>
      );
    });
  } catch (err) {
    content = <div className="text-center">Loading...</div>;
  }

  return (
    <Fragment>
      <div
        className={`col-md-7 col-lg-9 d-none d-md-block border border-secondary ${styles.mainCol}`}
        id="board"
      >
        <button
          id="openbtn"
          className={`d-sm-none ${styles.openbtn}`}
          onClick={openNav}
        >
          <i className="fa fa-chevron-right"></i>
        </button>

        {category ? (
          <Fragment>
            <h3 className="m-3 text-center">{category}</h3>
            <hr />
            <div className={styles.scrollableBox}>{content}</div>
          </Fragment>
        ) : (
          <SeeComplaints />
        )}
      </div>
    </Fragment>
  );
};

export default ComplaintBoard;
