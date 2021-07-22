import { Fragment } from "react";
import FeatureDetails from "./FeatureDetails";
import easyManagement from "./../../public/easyManagement.jpeg";
import details from "./../../public/details.jpg";
import inquiry from "./../../public/inquiry.jpg";
const Features = () => {
  return (
    <Fragment>
      <FeatureDetails
        featureName="Dashboard"
        image={easyManagement}
        shortDes="Manageable content is king"
        content="This website has different dashboards for proper and easy management of cases and ongoing investigations. Indicators tell the case priority and case status, by which one can have the whole idea of a case at one sight only."
      />
      <FeatureDetails
        divClass="order-sm-first"
        imgClass="order-sm-last"
        featureName="Details Page"
        image={details}
        shortDes="All in the details"
        content="Every case has a dedicated details page, which shows the case id, image, description and other details of the page. Cops can easily perform various actions such as changing the progress of investigation, setting priority of case and adding details."
      />
      <FeatureDetails
        featureName="Inquiry Section"
        image={inquiry}
        shortDes="We are just a click away"
        content="You can send us your inquiry in the contact us section. We will revert back to you as soon as possible. This set an easy way to connect with us and ask all your queries regarding DevCops website and app."
      />
    </Fragment>
  );
};

export default Features;
