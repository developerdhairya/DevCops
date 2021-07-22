import styles from "./../../styles/globals.module.css";
import Container from "./Container";
import logo from "./../../public/logo.jpeg";

const Header = () => {
  return (
    <header className={`jumbotron ${styles.jumbotron}`}>
      <Container>
        <div className={`row ${styles.rowHeader}`}>
          <div className="col-12 col-sm-6">
            <h1>DevCops</h1>
            <p className="text-justify">
              DevCops is an initiative to make our country a better place to
              live. It serves as a platform, where citizens are provided with
              the basic functionality of registering a new complaint, monitoring
              progress of their complaints with a few clicks and
              simultaneously cops can investigate the cases.
            </p>
          </div>
          <div className="col-12 col-sm-3 align-self-center text-center">
            <img src={logo} width="200px" height="100px" />
          </div>

          <div className="col-12 col-sm-3 align-self-center">
            <a
              role="button"
              className={`btn btn-block btn-sm ${styles.bgOrange}`}
              id="downloadAppBtn"
              href="https://github.com/DhyataGarg/DevCops-App/raw/main/app-release.apk"
            >
              <i className="fa fa-download"></i> <span>Download App</span>
            </a>
          </div>
        </div>
      </Container>
    </header>
  );
};

export default Header;
