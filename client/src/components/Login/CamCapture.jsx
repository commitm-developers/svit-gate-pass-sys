import { useRef, useState, useEffect } from "react";
import { FaCamera, FaRedo } from "react-icons/fa";

const CameraCapture = ({ onCapture }) => {
  const videoRef = useRef(null);
  const canvasRef = useRef(null);

  const [stream, setStream] = useState(null);
  const [cameraOpen, setCameraOpen] = useState(false);
  const [capturedImage, setCapturedImage] = useState(null);

  // Open Camera
  const openCamera = async () => {
    try {
      const mediaStream = await navigator.mediaDevices.getUserMedia({
        video: {
          facingMode: "user",
        },
        audio: false,
      });

      setStream(mediaStream);
      setCameraOpen(true);

      if (videoRef.current) {
        videoRef.current.srcObject = mediaStream;
      }
    } catch (error) {
      console.error(error);
      alert("Unable to access camera.");
    }
  };

  // Attach Stream
  useEffect(() => {
    if (cameraOpen && stream && videoRef.current) {
      videoRef.current.srcObject = stream;
    }
  }, [cameraOpen, stream]);

  // Stop Camera
  const stopCamera = () => {
    if (stream) {
      stream.getTracks().forEach((track) => track.stop());
    }

    setStream(null);
    setCameraOpen(false);
  };

  // Capture Photo
  const capturePhoto = () => {
    const video = videoRef.current;
    const canvas = canvasRef.current;

    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;

    const ctx = canvas.getContext("2d");
    ctx.drawImage(video, 0, 0);

    const image = canvas.toDataURL("image/png");

    setCapturedImage(image);

    if (onCapture) {
      onCapture(image);
    }

    stopCamera();
  };

  // Retake
  const retakePhoto = () => {
    setCapturedImage(null);
    openCamera();
  };

  // Cleanup
  useEffect(() => {
    return () => {
      if (stream) {
        stream.getTracks().forEach((track) => track.stop());
      }
    };
  }, [stream]);

  return (
    <div className="border-2 border-dashed border-gray-300 hover:border-blue-500 transition-all duration-300 rounded-2xl bg-secondary h-60 p-4">

      <h2 className="text-lg font-bold text-center">
        Capture Live Photo
      </h2>

      {!cameraOpen && !capturedImage && (
        <div className="flex flex-col items-center justify-center h-40">

          <FaCamera className="text-5xl text-gray-700 mb-4" />

          <button
            type="button"
            onClick={openCamera}
            className="bg-blue-600 hover:bg-blue-700 transition text-white px-5 py-2 rounded-lg font-medium shadow"
          >
            Open Camera
          </button>

        </div>
      )}

      {cameraOpen && (
        <div className="flex flex-col items-center justify-center h-40">

          <video
            ref={videoRef}
            autoPlay
            playsInline
            className="w-44 h-28 object-cover rounded-lg border shadow"
          />

          <div className="flex gap-2 mt-3">

            <button
              type="button"
              onClick={capturePhoto}
              className="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-lg text-sm"
            >
              Capture
            </button>

            <button
              type="button"
              onClick={stopCamera}
              className="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-lg text-sm"
            >
              Cancel
            </button>

          </div>

        </div>
      )}

      {capturedImage && (
        <div className="flex flex-col items-center justify-center h-40">

          <img
            src={capturedImage}
            alt="Captured"
            className="w-44 h-28 object-cover rounded-lg border shadow"
          />

          <button
            type="button"
            onClick={retakePhoto}
            className="mt-3 flex items-center gap-2 bg-orange-500 hover:bg-orange-600 transition text-white px-4 py-2 rounded-lg text-sm"
          >
            <FaRedo />
            Retake
          </button>

        </div>
      )}

      <canvas ref={canvasRef} className="hidden" />

    </div>
  );
};

export default CameraCapture;