import { useRouter } from "next/router";
import { Fragment } from "react";
import Link from "next/link";
import styles from "./../../styles/globals.module.css";
import { useSelector, useDispatch } from "react-redux";
import { authActions } from "../../store/auth";
import logo from "./../../public/logo.jpeg";

const Navbar = () => {
  const router = useRouter();
  const dispatch = useDispatch();
  const isAuth = useSelector((state) => state.auth.isLoggedIn);

  const logoutHandler = async () => {
    await dispatch(authActions.logout());
    router.replace("/");
  };

  return (
    <Fragment>
      <nav
        className={`navbar navbar-dark navbar-expand-md fixed-top ${styles.bgBlue}`}
      >
        <div className="container">
          <button
            className="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#Navbar"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <Link href="/">
            <a className="navbar-brand mr-auto">
              <img src={logo} width="100px" heigth="70px" />
            </a>
          </Link>

          <div className="collapse navbar-collapse" id="Navbar">
            <ul className="navbar-nav mr-auto">
              <li
                className={`nav-item ml-md-5 ${
                  router.pathname == "/" ? "active" : ""
                }`}
              >
                <Link href="/">
                  <a className="nav-link">
                    <span className="fa fa-home fa-lg"></span> Home
                  </a>
                </Link>
              </li>
              <li
                className={`nav-item ${
                  router.pathname == "/about-us" ? "active" : ""
                }`}
              >
                <Link href="/about-us">
                  <a className="nav-link">
                    <span className="fa fa-info fa-lg"></span> About
                  </a>
                </Link>
              </li>
              <li
                className={`nav-item ${
                  router.pathname == "/contact-us" ? "active" : ""
                }`}
              >
                <Link href="/contact-us">
                  <a className="nav-link">
                    <span className="fa fa-address-card fa-lg"></span> Contact
                  </a>
                </Link>
              </li>

              {isAuth && (
                <li
                  className={`nav-item ${
                    router.pathname == "/account/dashboard" ||
                    router.pathname == "/account/dashboard/[complaint]"
                      ? "active"
                      : ""
                  }`}
                >
                  <Link href="/account/dashboard">
                    <a className="nav-link">
                      <span className="fa fa-list-alt fa-lg"></span> Dashboard
                    </a>
                  </Link>
                </li>
              )}
            </ul>
            {!isAuth ? (
              <span
                className="navbar-text"
                id="loginButton"
                data-toggle="modal"
                data-target="#loginModal"
              >
                <a>
                  <span className="fa fa-sign-in"></span> Login
                </a>
              </span>
            ) : (
              <span
                className="navbar-text"
                id="logoutButton"
                role="button"
                onClick={logoutHandler}
              >
                <a>
                  <span className="fa fa-sign-out"></span>
                  Logout
                </a>
              </span>
            )}
          </div>
        </div>
      </nav>
    </Fragment>
  );
};

export default Navbar;
