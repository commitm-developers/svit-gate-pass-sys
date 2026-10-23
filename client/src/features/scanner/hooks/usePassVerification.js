import { useMutation } from "@tanstack/react-query";
import { verifyPass } from "../api.js";

export function usePassVerification() {
  return useMutation({ mutationFn: verifyPass });
}
