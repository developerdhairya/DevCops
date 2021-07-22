import React from "react";
import MenuButtons from "./MenuButtons";
import styles from "./../../styles/dashboard.module.css";
import { useSelector } from "react-redux";

const ComplaintMenu = () => {
  const categories = useSelector((state) => state.data.categories);
  function closeNav() {
    $("#sidebar").removeClass("col-md-5 col-lg-3");
    $("#sidebar").addClass("d-none");
    $("#board").addClass("col-md-12");
    $("#board").removeClass("d-none d-md-block col-md-7 col-lg-9");
    $("#openbtn").removeClass("d-sm-none");
  }

  return (
    <div
      className={`col-md-5 col-lg-3 border border-secondary ${styles.mainCol}`}
      id="sidebar"
    >
      <div className="row">
        <h3 className="col-9 m-3">Categories</h3>
        <button className={`col-2 ${styles.closebtn}`} onClick={closeNav}>
          ×
        </button>
      </div>
      <div className={styles.scrollableBox}>
        {categories.map((category, index) => {
          return <MenuButtons key={index} name={category} onClick={closeNav} />;
        })}
      </div>
    </div>
  );
};

export default ComplaintMenu;
