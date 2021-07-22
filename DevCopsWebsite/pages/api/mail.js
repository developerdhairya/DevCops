import mail from "@sendgrid/mail";
require("dotenv").config();

mail.setApiKey(process.env.SENDGRID_API);

export default (req, res) => {
  const body = JSON.parse(req.body);

  const message = `
 Hi ${body.firstname} ${body.lastname}\r\n
  ${body.emailid}\r\n
  Thank you for your inquiry. Please expect a response from us as soon as possible.\r\n\r\n
   Here are your inquiry details:\r\n
   Name: ${body.firstname} ${body.lastname}\r\n
   Email: ${body.emailid}\r\n
   Contact No.: ${body.areacode} ${body.telnum}\r\n
   inquiry: ${body.inquiry}\r\n
`;

  const data = {
    to: body.emailid,
    from: "dhyatagarg09@gmail.com",
    subject: "DevCops inquiry response",
    text: message,
    html: message.replace(/\r\n/g, "<br>"),
  };

  mail.send(data).catch((e) => console.log(e));

  res.status(200).json({ status: "OK" });
};
