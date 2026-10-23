import Input from "../../../components/ui/Input.jsx";

export default function CertificateUpload({ onChange }) {
  return (
    <Input label="Student certificate" type="file" accept=".pdf,image/*"
      onChange={(event) => onChange?.(event.target.files?.[0] || null)} />
  );
}
