import Head from "next/head";
import { Fragment, useEffect } from "react";
import Navbar from "./../../../../../components/layout/Navbar";
import Main from "./../../../../../components/details/Main";
import { useDispatch, useSelector } from "react-redux";
import { useRouter } from "next/router";
import { fetchAppData } from "./../../../../../store/fetchData";
import { authActions } from "../../../../../store/auth";
import { parseCookies } from "./../../../../../lib/parseCookies";

function Details(props) {
  const dispatch = useDispatch();
  const router = useRouter();
  const isAuth = useSelector((state) => state.auth.isLoggedIn);

  useEffect(async () => {
    await dispatch(authActions.login(props.initialToken));
    await dispatch(fetchAppData());

    if (props.initialToken === "null") {
      router.replace("/");
    }
  }, []);

  return (
    <Fragment>
      <Head>
        <title>DevCops</title>
      </Head>
      {isAuth ? (
        <Fragment>
          <Navbar />
          <Main />
        </Fragment>
      ) : (
        <div></div>
      )}
    </Fragment>
  );
}

Details.getInitialProps = ({ req }) => {
  const cookies = parseCookies(req);
  return {
    initialToken: cookies.token,
  };
};

export default Details;
