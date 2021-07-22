import { Fragment } from "react";

const CarouselConrols = () => {
  return (
    <Fragment>
      <ol className="carousel-indicators">
        <li data-target="#mycarousel" data-slide-to="0" className="active"></li>
        <li data-target="#mycarousel" data-slide-to="1"></li>
        <li data-target="#mycarousel" data-slide-to="2"></li>
      </ol>
      <a
        className="carousel-control-prev"
        href="#mycarousel"
        role="button"
        data-slide="prev"
      >
        <span className="carousel-control-prev-icon"></span>
      </a>
      <a
        className="carousel-control-next"
        href="#mycarousel"
        role="button"
        data-slide="next"
      >
        <span className="carousel-control-next-icon"></span>
      </a>
    </Fragment>
  );
};

export default CarouselConrols;
