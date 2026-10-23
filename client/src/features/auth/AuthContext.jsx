import { createContext, useCallback, useMemo, useState } from "react";
import * as authApi from "./api.js";

export const AuthContext = createContext(null);

function getSavedUser() {
  try {
    const value = localStorage.getItem("svit.user");
    return value ? JSON.parse(value) : null;
  } catch {
    localStorage.removeItem("svit.user");
    return null;
  }
}

export function AuthProvider({ children }) {
  const [user, setUser] = useState(getSavedUser);
  const [isLoading] = useState(false);

  const saveSession = useCallback((response) => {
    const { token, accessToken, user: nextUser } = response;
    if (!nextUser) throw new Error("The server response did not include a user.");
    if (token || accessToken) localStorage.setItem("svit.accessToken", token || accessToken);
    localStorage.setItem("svit.user", JSON.stringify(nextUser));
    setUser(nextUser);
    return nextUser;
  }, []);

  const signIn = useCallback(async (credentials) => saveSession(await authApi.login(credentials)), [saveSession]);
  const signUp = useCallback(async (details) => saveSession(await authApi.register(details)), [saveSession]);
  const logout = useCallback(() => {
    localStorage.removeItem("svit.accessToken");
    localStorage.removeItem("svit.user");
    setUser(null);
  }, []);

  const value = useMemo(
    () => ({ user, isLoading, signIn, signUp, logout }),
    [user, isLoading, signIn, signUp, logout],
  );

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}
