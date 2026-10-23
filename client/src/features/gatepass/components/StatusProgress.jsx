const stages = ["Pending", "Approved", "Completed"];

export default function StatusProgress({ status = "pending" }) {
  const current = stages.findIndex((stage) => stage.toLowerCase() === status.toLowerCase());
  return (
    <ol className="steps" aria-label="Gate pass status">
      {stages.map((stage, index) => <li className={index <= current ? "step step-active" : "step"} key={stage}>{stage}</li>)}
    </ol>
  );
}
