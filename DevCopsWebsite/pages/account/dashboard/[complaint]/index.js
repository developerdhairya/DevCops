import Head from "next/head";
import { useSelector, useDispatch } from "react-redux";
import { Fragment, useEffect } from "react";
import Navbar from "./../../../../components/layout/Navbar";
import Main from "./../../../../components/dashboard/Main";
import { fetchAppData } from "../../../../store/fetchData";
import { useRouter } from "next/router";
import { parseCookies } from "../../../../lib/parseCookies";
import { authActions } from "./../../../../store/auth";

function Complaints(props) {
  const dispatch = useDispatch();
  const router = useRouter();
  const categories = useSelector((state) => state.data.categories);
  const isAuth = useSelector((state) => state.auth.isLoggedIn);
  const category = router.query.complaint;

  useEffect(async () => {
    await dispatch(authActions.login(props.initialToken));
    await dispatch(fetchAppData());

    if (props.initialToken === "null") {
      router.replace("/");
    }
  }, [dispatch, categories]);

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

Complaints.getInitialProps = ({ req }) => {
  const cookies = parseCookies(req);
  return {
    initialToken: cookies.token,
  };
};

export default Complaints;
