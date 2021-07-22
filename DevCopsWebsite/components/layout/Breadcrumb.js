import Link from "next/link";

const Breadcrumb = (props) => {
  return (
    <div className="row">
      <ol className="col-12 breadcrumb">
        <li className="breadcrumb-item">
          <Link href="/">
            <a>Home</a>
          </Link>
        </li>
        <li className="breadcrumb-item active">{props.content}</li>
      </ol>
      <div className="col-12">
        <h3>{props.content}</h3>
        <hr />
      </div>
    </div>
  );
};

export default Breadcrumb;
