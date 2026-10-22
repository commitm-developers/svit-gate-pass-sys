import { Routes, Route } from "react-router-dom";
import AuthLayout from "./Layout/AuthLayout";
import Signin from "./components/Login/Signin";
import Signup from "./components/Login/Signup";


function App() {
  return (
    <>
     
       <Routes>
        <Route element={<AuthLayout />}>
          <Route path="/" element={<Signin />} />
          <Route path="/signup" element={<Signup />} />
        </Route>
      </Routes>
      
    </>
  );
}

export default App;
