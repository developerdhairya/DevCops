import { Fragment } from "react";

const Address = () => {
  return (
    <Fragment>
      <h5>Our Address</h5>
      <address>
        Chandigarh-Patiala National Highway (NH- 64)
        <br />
        Village, Jansla, Rajpura, Punjab
        <br />
        INDIA
        <br />
        <i className="fa fa-phone"></i>: +91 6283116966
        <br />
        <i className="fa fa-fax"></i>: +91 6239084311
        <br />
        <i className="fa fa-envelope"></i>:
        <a href="mailto:dhyatagarg09@gmail.com"> dhyatagarg09@gmail.com</a>
      </address>
    </Fragment>
  );
};

export default Address;
