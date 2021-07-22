const Indicator = (props) => {
  return (
    <span
      data-toggle="tooltip"
      data-placement="top"
      title={props.title}
      className="mx-2"
    >
      <i className={`fa ${props.class}`} style={{ color: props.color }}></i>
    </span>
  );
};

export default Indicator;
