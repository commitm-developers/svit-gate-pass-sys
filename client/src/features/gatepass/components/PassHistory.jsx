import EmptyState from "../../../components/common/EmptyState.jsx";
import Loader from "../../../components/ui/Loader.jsx";
import { usePasses } from "../hooks/usePasses.js";
import PassCard from "./PassCard.jsx";

export default function PassHistory() {
  const { data, isLoading, isError } = usePasses();
  if (isLoading) return <Loader label="Loading passes..." />;
  if (isError) return <EmptyState title="Passes could not be loaded" description="Please try again later." />;
  const passes = Array.isArray(data) ? data : data?.passes || [];
  if (!passes.length) return <EmptyState title="No gate passes yet" description="Your submitted requests will show up here." />;
  return <div className="stack">{passes.map((pass) => <PassCard key={pass._id || pass.id} pass={pass} />)}</div>;
}
