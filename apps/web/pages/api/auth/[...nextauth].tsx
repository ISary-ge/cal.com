import { getServerSession } from "@calcom/features/auth/lib/getServerSession";
import { defaultResponder } from "@calcom/lib/server";

export default defaultResponder(async function handler(req: NextApiRequest, res: NextApiResponse) {
  const result = await getServerSession({ req, res });
  return result;
});
