import { useEffect } from "react";
import { X } from "lucide-react";
import Button from "./Button.jsx";

export default function Modal({ open, title, onClose, children }) {
  useEffect(() => {
    if (!open) return undefined;
    function onKeyDown(event) {
      if (event.key === "Escape") onClose?.();
    }
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
  }, [open, onClose]);

  if (!open) return null;
  return (
    <div className="modal-backdrop" role="presentation" onMouseDown={(event) => {
      if (event.target === event.currentTarget) onClose?.();
    }}>
      <section className="modal card" role="dialog" aria-modal="true" aria-labelledby="modal-title">
        <div className="row-between"><h2 id="modal-title">{title}</h2><Button variant="ghost" aria-label="Close" onClick={onClose}><X size={18} /></Button></div>
        {children}
      </section>
    </div>
  );
}
