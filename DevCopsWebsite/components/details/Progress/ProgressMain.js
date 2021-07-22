import { useState, Fragment } from "react";
import ProgressForm from "./ProgressForm";

import Progress from "./Progress";
const ProgressMain = () => {
  const [isEditProgress, setIsEditProgress] = useState(false);

  const startEdittingHandler = () => {
    setIsEditProgress(true);
  };

  const stopEdittingHandler = () => {
    setIsEditProgress(false);
  };

  return (
    <Fragment>
      {!isEditProgress ? (
        <Progress onClick={startEdittingHandler} />
      ) : (
        <ProgressForm stopEditting={stopEdittingHandler} />
      )}
    </Fragment>
  );
};

export default ProgressMain;
