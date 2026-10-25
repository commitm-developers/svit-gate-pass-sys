import Button from "../ui/Button.jsx";
import Modal from "../ui/Modal.jsx";

export default function ConfirmDialog({
  open,
  title = "Are you sure?",
  message,
  onCancel,
  onConfirm,
}) {
  return (
    <Modal open={open} title={title} onClose={onCancel}>
      <p>{message}</p>
      <div className="dialog-actions">
        <Button variant="secondary" onClick={onCancel}>
          Cancel
        </Button>
        <Button onClick={onConfirm}>Confirm</Button>
      </div>
    </Modal>
  );
}
