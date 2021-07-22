import { Fragment, useRef } from "react";
import { useRouter } from "next/router";
import globalStyles from "./../../styles/globals.module.css";
import styles from "./../../styles/Home.module.css";
import { useDispatch } from "react-redux";
import { authActions } from "./../../store/auth";

const LoginModal = () => {
  const router = useRouter();
  const dispatch = useDispatch();
  const emailInputRef = useRef();
  const passwordInputRef = useRef();

  const submitHandler = (event) => {
    event.preventDefault();

    const enteredEmail = emailInputRef.current.value;
    const enteredPassword = passwordInputRef.current.value;

    const url = process.env.NEXT_PUBLIC_AUTHENTICATION_KEY;

    fetch(url, {
      method: "POST",
      body: JSON.stringify({
        email: enteredEmail,
        password: enteredPassword,
        returnSecureToken: true,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((res) => {
        if (res.ok) {
          return res.json();
        } else {
          return res.json().then((data) => {
            let errorMessage = "Authentication failed!";
            throw new Error(errorMessage);
          });
        }
      })
      .then((data) => {
        dispatch(authActions.login(data.idToken));
        $("#loginModal").modal("toggle");
        router.replace("/account/dashboard");
      })
      .catch((error) => {
        alert(error.message);
      });
  };
  return (
    <Fragment>
      <div id="loginModal" className="modal fade" role="dialog">
        <div className="modal-dialog modal-lg" role="content">
          <div className="modal-content">
            <div
              className={`modal-header ${globalStyles.bgBlue} ${styles.modalHeader}`}
            >
              <h4 className="modal-title">Login As a Cop</h4>
              <button
                type="button"
                className={`close ${styles.close}`}
                data-dismiss="modal"
              >
                &times;
              </button>
            </div>
            <div className="modal-body">
              <form onSubmit={submitHandler}>
                <div className="form-group">
                  <label htmlFor="email">Email:</label>
                  <input
                    type="email"
                    className="form-control"
                    id="email"
                    placeholder="Enter email"
                    name="email"
                    ref={emailInputRef}
                  />
                </div>
                <div className="form-group">
                  <label htmlFor="pwd">Password:</label>
                  <input
                    type="password"
                    className="form-control"
                    id="pwd"
                    placeholder="Enter password"
                    name="pwd"
                    ref={passwordInputRef}
                  />
                </div>

                <button
                  type="button"
                  className={`btn btn-secondary btn-sm ml-auto ${globalStyles.bgOrange}`}
                  data-dismiss="modal"
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  className={`btn btn-sm ml-1 ${globalStyles.bgGreen}`}
                >
                  Sign in
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </Fragment>
  );
};

export default LoginModal;
