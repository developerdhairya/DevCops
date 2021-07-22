import { useDispatch } from "react-redux";
import { dataActions } from "../../store/data";
import useFetchData from "../../hooks/useFetchData";
import styles from "./../../styles/globals.module.css";

const EditPriority = () => {
  const dispatch = useDispatch();
  const details = useFetchData();

  const setPriority = (event) => {
    const priority = event.target.value;
    dispatch(
      dataActions.updatePriority({
        category: details.category,
        caseId: details.caseId,
        priority,
      })
    );
  };

  return (
    <div className="btn-group">
      <button
        type="button"
        className={`btn btn-block dropdown-toggle ${styles.bgOrange}`}
        data-toggle="dropdown"
        aria-haspopup="true"
        aria-expanded="false"
      >
        Edit Case Priority
      </button>
      <ul className="dropdown-menu">
        <li>
          <button
            className="btn btn-light dropdown-item"
            value="High"
            onClick={setPriority}
          >
            High
          </button>
        </li>
        <li>
          <button
            className="btn btn-light dropdown-item"
            value="Medium"
            onClick={setPriority}
          >
            Medium
          </button>
        </li>
        <li>
          <button
            className="btn btn-light dropdown-item"
            value="Low"
            onClick={setPriority}
          >
            Low
          </button>
        </li>
      </ul>
    </div>
  );
};

export default EditPriority;
