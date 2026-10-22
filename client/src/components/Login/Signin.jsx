import React, { useState } from "react";
import { useForm } from "react-hook-form";
import { Link } from "react-router-dom";

function Signin() {
  const [role, setRole] = useState("student");

  const {
    register,
    handleSubmit,
    reset,
    formState: { errors, isSubmitting },
  } = useForm();

  const onSubmit = async (data) => {
    console.log("Sending Data...");

    console.log({
      username: data.username,
      password: data.password,
      FacultyRole: data.facultyrole,
    });

    // API call simulate waiting, block
    await new Promise((resolve) => setTimeout(resolve, 2000));

    console.log("Data Sent Successfully");

    reset();
  };

  return (
    <>
      {/* Main */}
      <div className="bg-secondary flex justify-center py-5 px-4 mt-20 lg:mt-0 lg:grow lg:flex lg:items-center lg:pt-18 lg:pb-4 lg:h-[calc(100vh-72px)]">
        <div className="bg-white w-full max-w-md rounded-xl shadow-lg p-6 lg:max-w-135 lg:p-8">
          <form onSubmit={handleSubmit(onSubmit)}>
            {/* Tabs */}
            <div className="flex bg-gray-100 rounded-lg p-1 mb-6 lg:mb-5">
              <button
                type="button"
                onClick={() => setRole("student")}
                className={`w-1/2 py-2 lg:py-2 rounded-md font-semibold lg:text-lg transition-all duration-300 ${
                  role === "student"
                    ? "bg-blue-600 text-white shadow"
                    : "text-gray-600"
                }`}
              >
                Student
              </button>

              <button
                type="button"
                onClick={() => setRole("faculty")}
                className={`w-1/2 py-2 lg:py-2 rounded-md font-semibold lg:text-lg transition-all duration-300 ${
                  role === "faculty"
                    ? "bg-blue-600 text-white shadow"
                    : "text-gray-600"
                }`}
              >
                Faculty
              </button>
            </div>

            {/* Heading */}
            <h2 className="text-3xl lg:text-3xl font-bold text-center">
              {role === "student" ? "Student Login" : "Faculty Login"}
            </h2>

            <p className="text-center text-gray-500 mt-2 lg:mt-1 mb-6 lg:mb-5">
              Enter your credentials to access the portal
            </p>

            {/* Username */}
            <div className="mb-4 lg:mb-4">
              <label className="font-semibold text-sm lg:text-base">Username</label>

              <div className="border rounded-lg mt-2 lg:mt-1 px-3 py-3 lg:px-4 lg:py-3">
                <input
                  type="text"
                  placeholder="Enter your username"
                  className="w-full outline-none lg:text-lg"
                  {...register("username", {
                    required: "Username is required",
                    minLength: {
                      value: 7,
                      message: "Minimum 7 characters required",
                    },
                    maxLength: {
                      value: 50,
                      message: "Maximum 50 characters allowed",
                    },
                  })}
                />
              </div>

              {errors.username && (
                <p className="text-red-500 text-sm mt-1">
                  {errors.username.message}
                </p>
              )}
            </div>

            {/* Password */}
            <div className="mb-6 lg:mb-5">
              <label className="font-semibold text-sm lg:text-base">Password</label>

              <div className="border rounded-lg mt-2 lg:mt-1 px-3 py-3 lg:px-4 lg:py-3">
                <input
                  type="password"
                  placeholder="Enter your password"
                  className="w-full outline-none lg:text-lg"
                  {...register("password", {
                    required: "Password is required",
                    minLength: {
                      value: 7,
                      message: "Minimum 7 characters required",
                    },
                    maxLength: {
                      value: 50,
                      message: "Maximum 50 characters allowed",
                    },
                  })}
                />
              </div>

              {errors.password && (
                <p className="text-red-500 text-sm mt-1">
                  {errors.password.message}
                </p>
              )}
            </div>

            {role === "faculty" && (
              <div className="mb-6 lg:mb-5">
                <label className="font-semibold text-sm lg:text-base">Role</label>

                <div className="border rounded-lg mt-2 lg:mt-1 px-3 py-3 lg:px-4 lg:py-3">
                  <select
                    className="w-full outline-none bg-transparent lg:text-lg"
                    {...register("facultyrole", {
                      required: "Please select your Role",
                    })}
                  >
                    <option value="">Select Role</option>

                    <option value="HOD">HOD</option>
                    <option value="Rector">Rector</option>
                    <option value="Security">Security</option>
                  </select>
                </div>

                {errors.role && (
                  <p className="text-red-500 text-sm mt-1">
                    {errors.role.message}
                  </p>
                )}
              </div>
            )}

            {/* Login Button */}
            <button
              type="submit"
              disabled={isSubmitting}
              className={`w-full py-3 lg:py-3 rounded-lg font-semibold lg:text-lg text-white transition ${
                isSubmitting
                  ? "bg-gray-400 cursor-not-allowed"
                  : "bg-blue-600 hover:bg-blue-700"
              }`}
            >
              {isSubmitting ? "Logging in..." : "Login"}
            </button>

            <hr className="my-6 lg:my-5" />

            {/* Register */}

            <div className="text-center text-sm lg:text-base">
              <div>Don't have an account?</div>

              {role === "student" ? (
                <Link
                  to="/signup"
                  className="text-blue-600 font-semibold hover:underline"
                >
                  Register Now
                </Link>
              ) : (
                <button
                  type="button"
                  onClick={() =>
                    alert(
                      "Faculty registration is not allowed. Please contact the administrator.",
                    )
                  }
                  className="text-blue-600 font-semibold"
                >
                  Register Now
                </button>
              )}
            </div>
          </form>
        </div>
      </div>
    </>
  );
}

export default Signin;
