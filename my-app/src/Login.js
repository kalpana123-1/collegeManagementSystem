import React, { useState } from "react";
import axios from "axios";
import "./Login.css";

function Login() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [emailError, setEmailError] = useState('');
  const [pinError, setPinError] = useState('');

  const handleLogin = (setUsername, setPassword) => {
    console.log("Login clicked with:", { setUsername, setPassword });

    // Check if the user has entered both fields correctly
    if ("" === setUsername) {
      setEmailError("Please enter your email");
      return;
    }
    if ("" === setPassword) {
      setPinError("Please enter a password");
      return;
    }

    axios({
      method: "post",
      url: "http://127.0.0.1:5000/login",
      body: { username: setPassword, password: setPassword },
    })
      .then((res) => {
        // setData(res.data.data);
        console.log("logged in successfully", setUsername);
      })
      .catch((err) => console.error(err));
  };

  return (
    <div>
      <h2>Login</h2>
      <form>
        <label>
          Username:
          <input
            type="text"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </label>
        <br />
        <label>
          Password:
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </label>
        <br />
        {emailError && <div style={{ color: "red" }}>{emailError}</div>}
        {pinError && <div style={{ color: "red" }}>{pinError}</div>}
        <button
          type="button"
          className="button"
          onClick={() => handleLogin(setUsername, setPassword)}
        >
          Login
        </button>
      </form>
    </div>
  );
}

export default Login;
