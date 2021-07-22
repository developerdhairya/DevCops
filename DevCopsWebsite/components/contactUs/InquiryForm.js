import styles from "./../../styles/globals.module.css";
import { useDispatch } from "react-redux";
import { inquiryActions } from "../../store/inquiry";
import Input from "./Input";

const InquiryForm = () => {
  const dispatch = useDispatch();

  async function onSubmitHandler(event) {
    event.preventDefault();
    const formData = {};
    Array.from(event.currentTarget.elements).forEach((field) => {
      if (!field.name) return;
      formData[field.name] = field.value;
    });

    try {
      await fetch("/api/mail", {
        method: "POST",
        body: JSON.stringify(formData),
      });
    } catch (err) {
      console.log(err);
    }

    dispatch(inquiryActions.setInquiry(formData));
  }

  return (
    <div className={`row ${styles.rowContent}`}>
      <div className="col-12">
        <h3>Send us your Inquiry</h3>
      </div>
      <div className="col-12 col-md-10">
        <form onSubmit={onSubmitHandler}>
          <Input
            inputId="firstname"
            label="First Name"
            inputType="text"
            name="firstname"
            placeholder="First Name"
            required={true}
          />

          <Input
            inputId="lastname"
            label="Last Name"
            inputType="text"
            name="lastname"
            placeholder="Last Name"
            required={false}
          />

          <div className="form-group row">
            <label htmlFor="telnum" className="col-12 col-md-3 col-form-label">
              Contact No.
            </label>
            <div className="col-5 col-md-3">
              <input
                type="tel"
                className="form-control"
                id="areacore"
                name="areacode"
                placeholder="Area Code"
              />
            </div>

            <div className="col-7 col-md-6">
              <input
                type="tel"
                className="form-control"
                id="telnum"
                name="telnum"
                placeholder="Tel. Number"
                maxLength="10"
                minLength="10"
              />
            </div>
          </div>

          <Input
            inputId="emailid"
            label="Email"
            inputType="email"
            name="emailid"
            placeholder="abc@example.com"
            required={true}
          />

          <div className="form-group row">
            <label htmlFor="inquiry" className="col-md-3 col-form-label">
              Your Inquiry <span style={{ color: "red" }}>*</span>
            </label>
            <div className="col-md-9">
              <textarea
                className="form-control"
                id="inquiry"
                name="inquiry"
                rows="12"
                required
              ></textarea>
            </div>
          </div>

          <div className="form-group row">
            <div className="offset-md-3 col-md-10">
              <button type="submit" className={`btn ${styles.bgGreen}`}>
                Send Inquiry
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
};

export default InquiryForm;
