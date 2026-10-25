import Button from "../ui/Button.jsx";

export default function ErrorState({ message = "Something went wrong.", onRetry }) {
  return (
    <section className="error-state" role="alert">
      <p>{message}</p>
      {onRetry && (
        <Button variant="secondary" onClick={onRetry}>
          Try again
        </Button>
      )}
    </section>
  );
}
