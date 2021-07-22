import dashboard from "./../../public/dashboard.png";
import Image from "next/image";

const SeeComplaints = () => {
  return (
    <div>
      <h2 className="text-center align-self-center">
        Find Your Complaints Here!
      </h2>
      <div className="d-flex justify-content-center mt-5">
        <Image src={dashboard} height="400px" width="400px" />
      </div>
    </div>
  );
};

export default SeeComplaints;
