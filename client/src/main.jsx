import { StrictMode } from "react";
import { BrowserRouter } from "react-router-dom";
import { createRoot } from "react-dom/client";
import { Provider } from "react-redux";

import "@fontsource/poppins/400.css";
import "@fontsource/poppins/700.css";

import "./index.css";
import App from "./App.jsx";
import { store } from "./Redux/Store.js";

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <BrowserRouter>
      <Provider store={store}>
        <App />
      </Provider>
    </BrowserRouter>
  </StrictMode>,
);
