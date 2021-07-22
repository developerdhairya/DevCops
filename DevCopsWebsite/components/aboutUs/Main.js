import Container from "../layout/Container";
import Breadcrumb from "./../layout/Breadcrumb";
import OurInspiration from "./OurInspiration";
import Quote from "./Quote";
import CorporateLeadership from "./CorporateLeadership";
const Main = () => {
  return (
    <Container>
      <Breadcrumb content="About US" />
      <OurInspiration />
      <Quote />
      <CorporateLeadership />
    </Container>
  );
};

export default Main;
