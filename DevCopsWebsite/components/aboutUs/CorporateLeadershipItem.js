const CorporateLeadershipItem = (props) => {
  return (
    <div className="card">
      <div className="card-header" role="tab" id={`${props.id}head`}>
        <h3 className="mb-0">
          <a data-toggle="collapse" data-target={`#${props.id}`}>
            {props.header} <small>{props.role}</small>
          </a>
        </h3>
      </div>
      <div
        className={`collapse ${props.class}`}
        id={props.id}
        data-parent="#accordion"
      >
        <div className="card-body row">
          <img
            src={props.image}
            alt={props.header}
            className="col-12 col-sm-6 col-md-4 col-lg-2 offset-sm-3 offset-md-0"
          />
          <div className="col-12 col-md-8 col-lg-10">
            <div className="row">
              <p className="col-12 text-justify">{props.detail}</p>
              <div className="col-12 text-center">
                <a
                  className="btn btn-social-icon btn-linkedin"
                  href={props.linkedIn}
                >
                  <i className="fa fa-linkedin"></i>
                </a>

                <a
                  className="btn btn-social-icon btn-github"
                  href={props.github}
                >
                  <i className="fa fa-github"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default CorporateLeadershipItem;
