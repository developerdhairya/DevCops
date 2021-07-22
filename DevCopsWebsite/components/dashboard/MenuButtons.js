import Link from "next/link";

const MenuButtons = (props) => {
  let onClickHandler;
  if (screen.width < 768) {
    onClickHandler = props.onClick;
  }

  return (
    <div className="row">
      <div className="col-12">
        <Link href={`/account/dashboard/${props.name}`}>
          <a
            role="button"
            className="btn btn-success btn-block text-left mb-2"
            onClick={onClickHandler}
          >
            {props.name}
          </a>
        </Link>
      </div>
    </div>
  );
};

export default MenuButtons;
