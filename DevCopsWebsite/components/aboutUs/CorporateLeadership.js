import CorporateLeadershipItem from "./CorporateLeadershipItem";
import karan from "./../../public/karan.png";
import dhyata from "./../../public/dhyata.jpeg";
import dhairya from "./../../public/dhairya.jpeg";
import yatin from "./../../public/yatin.jpeg";
import styles from "./../../styles/globals.module.css";

const CorporateLeadership = () => {
  return (
    <div className={`row ${styles.rowContent}`}>
      <div className="col-12">
        <h2>Corporate Leadership</h2>

        <div id="accordion">
          <CorporateLeadershipItem
            class="show"
            id="karan"
            image={karan}
            linkedIn="https://www.linkedin.com/in/karan-sandhu28/"
            github="https://github.com/sandhukaran28"
            header="Karan Sandhu"
            role="Data Engineer"
            detail="Hi, I’m Karan. Currently I’m perusing B.E. Computer science at Chitkara university. I love exploring technology and I’m a passionate learner, always willing to learn something new in tech. In this project, I have worked on UI and setting up firebase in our app for realtime data updation and user authentication."
          />

          <CorporateLeadershipItem
            id="yatin"
            image={yatin}
            linkedIn="https://www.linkedin.com/in/yatin-ahuja-b5372818a/"
            github="https://github.com/y-ahuja"
            header="Yatin Ahuja"
            role="Flutter Developer"
            detail="Hi, I am Yatin Ahuja. Currently I’m perusing B.E. Computer science at Chitkara university. I am a Android and Fluttter developer and want to explore everything in tech field."
          />

          <CorporateLeadershipItem
            id="dhyata"
            image={dhyata}
            linkedIn="https://www.linkedin.com/in/dhyata-garg-474a39200/"
            github="https://github.com/DhyataGarg"
            header="Dhyata"
            role="Website Developer"
            detail="
              Hi, I am Dhyata. I am currently pursuing B.E in Computer Science Engineering from Chitkara University. I am a MERN stack developer. I have contributed as the website developer in this project. I am very excited to learn new things in this field.  My goal is to explore this field to a greater depth and to achieve new heights in the present world of science and technology."
          />

          <CorporateLeadershipItem
            id="dhairya"
            image={dhairya}
            linkedIn="https://www.linkedin.com/in/dhairya-taneja-94817a200/"
            github="https://github.com/Dhairya0012"
            header="Dhairya Taneja"
            role="Flutter Developer"
            detail="Hi, I am Dhairya Taneja. Currently I’m perusing B.E. Computer science at Chitkara university. I am a Java and Fluttter developer and want to explore everything in tech field."
          />
        </div>
      </div>
    </div>
  );
};

export default CorporateLeadership;
