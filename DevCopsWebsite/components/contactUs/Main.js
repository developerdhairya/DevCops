import { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { sendInquiry } from "../../store/sendInquiry";
import Container from "../layout/Container";
import Breadcrumb from "./../layout/Breadcrumb";
import LocationInfo from "./LocationInfo";
import InquiryForm from "./InquiryForm";
import { inquiryActions } from "../../store/inquiry";

const Main = () => {
  const dispatch = useDispatch();
  const inquiry = useSelector((state) => state.inquiry);

  useEffect(() => {
    if (inquiry.inquiry == "" || !inquiry.inquiry) {
      return;
    }
    dispatch(sendInquiry(inquiry));

    dispatch(
      inquiryActions.setInquiry({
        email: "",
        name: "",
        contatNo: "",
        inquiry: "",
      })
    );
  }, [dispatch, inquiry]);

  return (
    <Container>
      <Breadcrumb content="Contact Us" />
      <LocationInfo />
      <InquiryForm />
    </Container>
  );
};

export default Main;
