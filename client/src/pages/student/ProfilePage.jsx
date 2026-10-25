import PageHeader from "../../components/layout/PageHeader.jsx";
import { useAuth } from "../../features/auth/hooks/useAuth.js";
import ProfileSteps from "../../features/profile/components/ProfileSteps.jsx";
import CameraCapture from "../../features/profile/components/CameraCapture.jsx";
import CertificateUpload from "../../features/profile/components/CertificateUpload.jsx";

export default function ProfilePage() {
  const { user } = useAuth();
  return (
    <>
      <PageHeader title="My profile" description="Keep your student information up to date." />
      <section className="card profile-panel">
        <ProfileSteps />
        <h2>{user?.name || "Student profile"}</h2>
        <p>{user?.email}</p>
        <div className="profile-fields">
          <CameraCapture />
          <CertificateUpload />
        </div>
      </section>
    </>
  );
}
