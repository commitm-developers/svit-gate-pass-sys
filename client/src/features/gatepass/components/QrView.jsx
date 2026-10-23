export default function QrView({ value }) {
  return (
    <div className="qr-view" role="img" aria-label={value ? `Pass code ${value}` : "QR code not available"}>
      <span>{value || "QR code will appear after approval"}</span>
    </div>
  );
}
