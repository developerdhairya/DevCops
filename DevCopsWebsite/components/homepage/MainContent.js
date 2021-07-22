import Container from "../layout/Container";
import Carousel from "./Carousel";
import Features from "./Features";

const MainContent = () => {
  return (
    <Container>
      <Carousel />
      <Features />
    </Container>
  );
};

export default MainContent;
