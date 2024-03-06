import React from "react";
import "./Button.css";
import { useHistory } from "react-router-dom";
const Butt = ({ name }) => {
  let history = useHistory();
  return (
    <>
      <button
        onClick={() => {
          history.push("/Signup");
        }}
        className="button"
      >
        {name}
      </button>
    </>
  );
};

export default Butt;
