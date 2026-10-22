import React from "react";
import logo from "../../assets/logo.png";
import { FaUserPlus } from "react-icons/fa";

function AuthHeader() {
  return (
    <header className="fixed top-0 left-0 z-50 w-full bg-white shadow">
      <div className="mx-auto flex h-13 items-center justify-between px-4 sm:px-6 lg:h-18 lg:px-8">

        {/* Logo */}
        <img
          src={logo}
          alt="Logo"
          className="w-28 sm:w-32 md:w-36 lg:w-40 xl:w-44"
        />

        {/* Icon */}
        <button
          type="button"
          className="flex h-10 w-10 items-center justify-center rounded-full transition hover:bg-white/10 md:h-11 md:w-11"
        >
          <FaUserPlus className="text-xl text-black md:text-2xl" />
        </button>

      </div>
    </header>
  );
}

export default AuthHeader;