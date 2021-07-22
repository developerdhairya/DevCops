import styles from "./../../styles/Home.module.css";

const Mobile = (props) => {
  return (
    <div className={` align-self-center mx-md-3 ${styles.mobile}`}>
      <img src={props.image} alt={props.alt} />
    </div>
  );
};

export default Mobile;
