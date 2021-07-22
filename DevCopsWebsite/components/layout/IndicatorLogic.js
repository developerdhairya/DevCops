export const IndicatorLogic = (priority, status) => {
  let priorityIndicator;

  if (priority === "High") {
    priorityIndicator = "red";
  } else if (priority === "Medium") {
    priorityIndicator = "orange";
  } else if (priority === "Low") {
    priorityIndicator = "yellow";
  }

  let statusIndicator = ["", ""];

  if (status === "Resolved") {
    statusIndicator = ["fa-check-circle", "green"];
  } else if (status === "In Progress") {
    statusIndicator = ["fa-exclamation-circle", "orange"];
  } else if (status === "New Case") {
    statusIndicator = ["fa-minus-circle", "red"];
  }

  return [priorityIndicator, statusIndicator];
};
