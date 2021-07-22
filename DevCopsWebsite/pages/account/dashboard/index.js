import Head from "next/head";
import { Fragment, useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { useRouter } from "next/router";
import Navbar from "./../../../components/layout/Navbar";
import Main from "../../../components/dashboard/Main";
import { fetchAppData } from "../../../store/fetchData";
import { parseCookies } from "../../../lib/parseCookies";
import { authActions } from "./../../../store/auth";

function Dashboard(props) {
  const dispatch = useDispatch();
  const router = useRouter();
  const isAuth = useSelector((state) => state.auth.isLoggedIn);

  useEffect(async () => {
    await dispatch(authActions.login(props.initialToken));

    if (props.initialToken === "null") {
      router.replace("/");
    }
  }, []);

  useEffect(() => {
    dispatch(fetchAppData());
  }, [dispatch]);

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

Dashboard.getInitialProps = ({ req }) => {
  const cookies = parseCookies(req);
  return {
    initialToken: cookies.token,
  };
};

export default Dashboard;
