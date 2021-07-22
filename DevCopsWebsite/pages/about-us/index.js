import Head from "next/head";
import { Fragment, useEffect } from "react";
import Navbar from "./../../components/layout/Navbar";
import Header from "../../components/layout/Header";
import Footer from "../../components/layout/Footer";
import Main from "../../components/aboutUs/Main";
import LoginModal from "./../../components/homepage/LoginModal";
import { useDispatch } from "react-redux";
import { authActions } from "./../../store/auth";
import { parseCookies } from "../../lib/parseCookies";

function AboutUs(props) {
  const dispatch = useDispatch();
  useEffect(async () => {
    await dispatch(authActions.login(props.initialToken));
  }, []);

  return (
    <Fragment>
      <Head>
        <title>DevCops</title>
      </Head>
      <Navbar />
      <Header />
      <Main />
      <Footer />
      <LoginModal />
    </Fragment>
  );
}

AboutUs.getInitialProps = ({ req }) => {
  const cookies = parseCookies(req);
  return {
    initialToken: cookies.token,
  };
};

export default AboutUs;
