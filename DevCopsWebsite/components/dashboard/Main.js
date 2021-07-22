import Container from "../layout/Container";
import ComplaintMenu from "./ComplaintMenu";
import ComplaintBoard from "./ComplaintBoard";
import styles from "./../../styles/dashboard.module.css";

const Main = () => {
  return (
    <Container>
      <div className={`row ${styles.rowHeader}`}>
        <ComplaintMenu />
        <ComplaintBoard />
      </div>
    </Container>
  );
};

export default Main;
