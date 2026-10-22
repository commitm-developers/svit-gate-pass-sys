import { useRef, useState } from "react";
import { FaFileUpload, FaRedo } from "react-icons/fa";

const FileUpload = ({ onFileSelect }) => {
  const inputRef = useRef(null);

  const [preview, setPreview] = useState(null);

  const handleFile = (e) => {
    const file = e.target.files[0];

    if (!file) return;

    setPreview(URL.createObjectURL(file));

    if (onFileSelect) {
      onFileSelect(file);
    }

    console.log("Selected File:", file);
  };

  const changeFile = () => {
    setPreview(null);

    if (inputRef.current) {
      inputRef.current.value = "";
    }

    if (onFileSelect) {
      onFileSelect(null);
    }
  };

  return (
    <div className="border-2 border-dashed border-gray-300 hover:border-blue-500 transition-all duration-300 rounded-2xl bg-secondary h-60 p-4">

      <h2 className="text-lg font-bold text-center">
        Upload College ID
      </h2>

      {!preview ? (
        <div className="flex flex-col items-center justify-center h-40">

          <FaFileUpload className="text-5xl text-gray-700 mb-4" />

          <button
            type="button"
            onClick={() => inputRef.current.click()}
            className="bg-blue-600 hover:bg-blue-700 transition text-white px-5 py-2 rounded-lg font-medium shadow"
          >
            Choose File
          </button>

          <input
            ref={inputRef}
            type="file"
            accept="image/*"
            onChange={handleFile}
            className="hidden"
          />

        </div>
      ) : (
        <div className="flex flex-col items-center justify-center h-40">

          <img
            src={preview}
            alt="College ID"
            className="w-44 h-28 object-contain rounded-lg border shadow bg-white p-1"
          />

          <button
            type="button"
            onClick={changeFile}
            className="mt-3 flex items-center gap-2 bg-orange-500 hover:bg-orange-600 transition text-white px-4 py-2 rounded-lg text-sm"
          >
            <FaRedo />
            Change File
          </button>

        </div>
      )}
    </div>
  );
};

export default FileUpload;