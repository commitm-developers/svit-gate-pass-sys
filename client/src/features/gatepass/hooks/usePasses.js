import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { createPass, getPasses } from "../api.js";

export function usePasses() {
  return useQuery({ queryKey: ["gate-passes"], queryFn: getPasses });
}

export function useCreatePass() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: createPass,
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["gate-passes"] }),
  });
}
