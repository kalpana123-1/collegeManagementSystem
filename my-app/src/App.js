import { useState } from "react";
import axios from "axios";
import "./App.css";

function App() {
  const [data, setData] = useState({});
  const fetchData = () => {
    axios({
      method: "get",
      url: "http://127.0.0.1:5000/students",
    })
      .then((res) => setData(res.data.data))
      .catch((err) => console.error(err));
  };
  return (
    <div className="App">
      <header className="App-header">
        <button onClick={() => fetchData()}>Fetch</button>
      </header>
      {data && data?.length ? (
        <table>
          <thead>
            <tr>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Email</th>
              <th>Password</th>
              <th>Blood Group</th>
              <th>Date of Birth</th>
              <th>Phone Number</th>
              <th>Emergency Contact</th>
              <th>Address Line 1</th>
              <th>Address Line 2</th>
              <th>Street No</th>
              <th>City</th>
              <th>State</th>
              <th>Country</th>
              <th>Pincode</th>
            </tr>
          </thead>
          <tbody>
           { data?.map(student =>
            <tr>
              {student?.map((info, index) => (
                index !==0  && <td>{info}</td>
              ))}
            </tr>
            )}
          </tbody>
        </table>
      ) : null}
    </div>
  );
}

export default App;
