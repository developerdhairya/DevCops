import Mobile from "./Mobile";
import { Fragment } from "react";
const CarouselItem = (props) => {
  return (
    <Fragment>
      <div
        style={{ minWidth: "100%", minHeight: "100%" }}
        className={`d-flex justify-content-center ${props.class}`}
      >
        <Mobile image={props.image} alt="Mobile" />
      </div>
      <div className="carousel-caption d-none d-md-block">
        <h2>{props.heading}</h2>
        <p>{props.content}</p>
      </div>
    </Fragment>
  );
};

export default CarouselItem;
