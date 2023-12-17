import type { NextApiRequest, NextApiResponse } from "next";

import { getServerSession } from "@calcom/features/auth/lib/getServerSession";
import { defaultResponder } from "@calcom/lib/server";

export default defaultResponder(async function handler(req: NextApiRequest, res: NextApiResponse) {
  console.log("))))))(()) config", process.env);
  const result = await getServerSession({ req, res });
  return result;
});
