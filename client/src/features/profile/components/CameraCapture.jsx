import { useRef, useState } from "react";
import Button from "../../../components/ui/Button.jsx";

export default function CameraCapture({ onCapture }) {
  const videoRef = useRef(null);
  const [stream, setStream] = useState(null);
  const [error, setError] = useState("");

  async function startCamera() {
    try {
      const media = await navigator.mediaDevices.getUserMedia({ video: true });
      videoRef.current.srcObject = media;
      await videoRef.current.play();
      setStream(media);
      setError("");
    } catch {
      setError("Camera access is unavailable. Check your browser permissions.");
    }
  }

  function capture() {
    const video = videoRef.current;
    if (!video?.videoWidth) return;
    const canvas = document.createElement("canvas");
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    canvas.getContext("2d").drawImage(video, 0, 0);
    onCapture?.(canvas.toDataURL("image/png"));
    stream?.getTracks().forEach((track) => track.stop());
    setStream(null);
  }

  return (
    <div className="camera-capture">
      <video ref={videoRef} playsInline muted aria-label="Camera preview" />
      {error && <p className="field-error">{error}</p>}
      {stream ? <Button onClick={capture}>Capture photo</Button> : <Button variant="secondary" onClick={startCamera}>Open camera</Button>}
    </div>
  );
}
