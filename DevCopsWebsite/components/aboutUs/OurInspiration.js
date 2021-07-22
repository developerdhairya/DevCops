import styles from "./../../styles/globals.module.css";

const OurInspiration = () => {
  return (
    <div className={`row ${styles.rowContent}`}>
      <div className="col-12 col-md-6">
        <h2>Our History</h2>
        <p className="text-justify">
          In the current era, the rate of crimes is increasing day by day which
          is leading to difficulty in managing enormous number of cases. Various
          kinds of problems are faced today like control room emergency numbers
          remain engaged, For getting information about our case details we have
          specifically visit police station. Moreover managing information about
          case for the cop is quite difficult. For all these problems, we came
          with the idea of Devcops, through which public can register their
          complaints, check status of it on the mobile only and send enquiries
          about the case. On the cop side, information can be updated about case
          in realtime. Additionally, by this app cops can create sketch of the
          culprit at any time for which earlier they needed to head back the
          station and using special tools.
        </p>
      </div>
      <div className="col-md">
        <div className="card">
          <h3 className={`card-header ${styles.bgBlue}`}>Facts At a Glance</h3>
          <div className="card-body align-self-center">
            <dl className="row">
              <dt className="col-6">Started</dt>
              <dd className="col-6">26 Jun, 2021</dd>
              <dt className="col-6">Initiative by</dt>
              <dd className="col-6">DevCops</dd>
              <dt className="col-6">Team Members</dt>
              <dd className="col-6">4</dd>
            </dl>
          </div>
        </div>
      </div>
    </div>
  );
};
export default OurInspiration;
