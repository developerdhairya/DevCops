import styles from "./../../styles/globals.module.css";
import Container from "./Container";
import Link from "next/link";
import Address from "./Address";
import SocialLinks from "./SocialLinks";
const Footer = () => {
  return (
    <footer className={styles.footer}>
      <Container>
        <div className="row">
          <div className="col-4 offset-1 col-sm-2">
            <h5>Links</h5>
            <ul className="list-unstyled">
              <li>
                <Link href="/">
                  <a>Home</a>
                </Link>
              </li>
              <li>
                <Link href="/about-us">
                  <a>About</a>
                </Link>
              </li>
              <li>
                <Link href="/contact-us">
                  <a>Contact</a>
                </Link>
              </li>
            </ul>
          </div>
          <div className="col-7 col-sm-5">
            <Address />
          </div>
          <div className="col-12 col-sm-4 align-self-center">
            <div className="text-center">
              <SocialLinks
                btnClass="btn-google"
                iconClass="fa-google-plus"
                href="http://google.com/+"
              />
              <SocialLinks
                btnClass="btn-facebook"
                iconClass="fa-facebook"
                href="http://www.facebook.com/profile.php?id="
              />

              <SocialLinks
                btnClass="btn-linkedin"
                iconClass="fa-linkedin"
                href="http://www.linkedin.com/in/"
              />

              <SocialLinks
                btnClass="btn-twitter"
                iconClass="fa-twitter"
                href="http://twitter.com/"
              />

              <SocialLinks
                btnClass="btn-google"
                iconClass="fa-youtube"
                href="http://youtube.com/"
              />

              <SocialLinks
                btnClass=""
                iconClass="fa-envelope-o"
                href="mailto:"
              />
            </div>
          </div>
        </div>
        <div className="row justify-content-center">
          <div className="col-auto">
            <p>© Copyright 2021 DevCops</p>
          </div>
        </div>
      </Container>
    </footer>
  );
};

export default Footer;
