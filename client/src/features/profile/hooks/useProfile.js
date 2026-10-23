import { useQuery } from "@tanstack/react-query";
import { getProfile } from "../api.js";

export function useProfile() {
  return useQuery({ queryKey: ["profile"], queryFn: getProfile });
}
