import { useRef } from "react";
import { useDispatch } from "react-redux";
import { dataActions } from "./../../../store/data";
import ProgressBar from "./ProgressBar";
import EditPriority from "./../EditPriority";
import useFetchData from "../../../hooks/useFetchData";
import styles from "./../../../styles/globals.module.css";

const ProgressForm = (props) => {
  const dispatch = useDispatch();
  const details = useFetchData();
  const progressInputRef = useRef();
  const progressDescriptionRef = useRef();

  const saveProgressHandler = (event) => {
    event.preventDefault();
    props.stopEditting();
    if (progressInputRef.current.value !== "") {
      dispatch(
        dataActions.editProgress({
          category: details.category,
          caseId: details.caseId,
          progress: progressInputRef.current.value,
          progressDescription: progressDescriptionRef.current.value,
        })
      );
    }
  };

  return (
    <div className="row">
      <div className="col-12">
        <form onSubmit={saveProgressHandler}>
          <div className="col-12 px-0">
            <div className="row my-5">
              <ProgressBar />
              <div className="col-12 col-sm-6 col-lg-2 my-2">
                <button
                  className={`btn btn-sm-block ${styles.bgGreen}`}
                  onClick={saveProgressHandler}
                >
                  Save Progress
                </button>
              </div>
              <div className="col-12 col-sm-6 col-lg-3 my-2">
                <EditPriority />
              </div>
            </div>
          </div>
          <div className="form-group row">
            <label
              htmlFor="progess"
              className="col-md-2 col-form-label offset-sm-1"
            >
              Progress
            </label>
            <div className="col-md-8">
              <input
                ref={progressInputRef}
                type="number"
                min="0"
                max="101"
                className="form-control text-center"
                id="progess"
                name="progess"
                placeholder="0"
              />
            </div>
          </div>

          <div className="form-group row">
            <label
              htmlFor="description"
              className="col-md-2 col-form-label offset-sm-1"
            >
              Description
            </label>
            <div className="col-md-8">
              <textarea
                ref={progressDescriptionRef}
                className="form-control"
                id="description"
                name="description"
                rows="12"
              ></textarea>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
};

export default ProgressForm;
