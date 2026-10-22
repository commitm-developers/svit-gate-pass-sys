import React from 'react';
import AuthHeader from "../components/Header/AuthHeader";
import AuthFooter from "../components/Footer/AuthFooter";
import { Outlet } from "react-router-dom";



function AuthLayout() {
  return (
    <div className="min-h-screen flex flex-col justify-between bg-secondary">
      <AuthHeader/>
      <div className="grow flex flex-col">
        <Outlet/>
      </div>
      <AuthFooter/>
    </div>
  )
}

export default AuthLayout
