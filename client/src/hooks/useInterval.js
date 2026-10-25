import { useEffect } from "react";

export function useInterval(callback, delay) {
  useEffect(() => {
    if (delay === null) return undefined;
    const interval = window.setInterval(callback, delay);
    return () => window.clearInterval(interval);
  }, [callback, delay]);
}
