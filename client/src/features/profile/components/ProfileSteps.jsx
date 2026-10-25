const steps = ["Personal details", "Student information", "Documents"];

export default function ProfileSteps({ currentStep = 0 }) {
  return (
    <ol className="steps" aria-label="Profile completion">
      {steps.map((step, index) => (
        <li className={index <= currentStep ? "step step-active" : "step"} key={step}>
          <span>{index + 1}</span>
          {step}
        </li>
      ))}
    </ol>
  );
}
