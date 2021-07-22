const SocialLinks = (props) => {
  return (
    <a className={`btn btn-social-icon ${props.btnClass}`} href={props.href}>
      <i className={`fa ${props.iconClass}`}></i>
    </a>
  );
};

export default SocialLinks;
