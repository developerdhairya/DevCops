import styles from "./../../styles/Home.module.css";
import { Fragment } from "react";
import CarouselItem from "./CarouselItem";
import CarouselControls from "./CarouselControls";
import sketchToImage from "./../../public/sketchToImage.jpeg";
import complaintPortal from "./../../public/complaintPortal.jpg";
import security from "./../../public/security.jpeg";
const Carousel = () => {
  return (
    <Fragment>
      <div className={`row ${styles.rowContent}`}>
        <div className="col  px-0">
          <div
            id="mycarousel"
            className={`carousel slide ${styles.carousel}`}
            data-ride="carousel"
          >
            <div className="carousel-inner" role="listbox">
              <div className={`carousel-item active ${styles.carouselItem}`}>
                <CarouselItem
                  class="justify-content-md-start"
                  image={sketchToImage}
                  heading="Sketch to Image"
                  content="This feature converts sketch of suspects drawn in drawing area to real image using extremely powerful machine learning algorithms from the flask server submitted with the project.....The server need to run on local:host of PC by following the steps provided in ServerSetupSteps.docs file provided and the app needs to be run on android emulator in the PC in order to fetch data from api as the server is not deployed currently due to paid plan requiremeny exceeding 100 mb limit."
                />
              </div>
              <div className={`carousel-item ${styles.carouselItem}`}>
                <CarouselItem
                  class="justify-content-md-end"
                  image={security}
                  heading="Security"
                  content="There is two factor Authentication (2FA) works by adding an additional layer of security to the online accounts. i.e API verification and the OTP verification based on Mobile number. If the app detects unusual numbers of failed attempts the system restricts the login from that particular mobile number for some time to avoid any hacking attempt."
                />
              </div>
              <div className={`carousel-item ${styles.carouselItem}`}>
                <CarouselItem
                  class="justify-content-md-start"
                  image={complaintPortal}
                  heading="Complaint Portal"
                  content="Now one can register a complaint easily just by some clicks and adding minute details like image,case description,national id etc.and can track the status of his/her complaint by going to my complaint section and can see the regular updates on the investigation done by the cops."
                />
              </div>
            </div>
            <CarouselControls />
          </div>
        </div>
      </div>
    </Fragment>
  );
};

export default Carousel;
