import styles from "./../../styles/globals.module.css";
const FeatureDetails = (props) => {
  return (
    <div className={`row ${styles.rowContent} align-items-center`}>
      <div
        className={`col-12 col-sm-6  ${props.divClass} col-lg-3 text-center`}
      >
        <h2 className="d-lg-none px-0 col-12 mt-0">{props.featureName}</h2>

        <h3>{props.shortDes}</h3>
      </div>
      <div className="col-12 col-sm-6 order-sm-first col-lg">
        <div className="media  justify-content-center">
          <img
            className={`d-flex img-thumbnail  align-self-center ${props.imgClass} `}
            src={props.image}
            alt="feature name"
          />
          <div className="media-body d-none d-lg-block">
            <h2 className="order-first col-12 mt-0">{props.featureName}</h2>
            <p className="text-justify px-3">{props.content}</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default FeatureDetails;
