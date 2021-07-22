const Input = (props) => {
  return (
    <div className="form-group row">
      <label htmlFor={props.inputId} className="col-md-3 col-form-label">
        {props.label}
        {props.required && <span style={{ color: "red" }}> *</span>}
      </label>
      <div className="col-md-9">
        <input
          type={props.inputType}
          className="form-control"
          id={props.inputId}
          name={props.name}
          placeholder={props.placeholder}
          required={props.required}
        />
      </div>
    </div>
  );
};

export default Input;
