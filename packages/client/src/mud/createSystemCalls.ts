import { getComponentValue } from "@latticexyz/recs";
import { awaitStreamValue } from "@latticexyz/utils";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  { worldSend, txReduced$, singletonEntity }: SetupNetworkResult,
  { Counter, StartTime, CloseTime, BaseTime }: ClientComponents
) {
  const increment = async () => {
    const tx = await worldSend("increment", []);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(Counter, singletonEntity);
  };
  const startTime = async () => {
    const tx = await worldSend("startTime", [singletonEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(StartTime, singletonEntity);
  };
  const closeTime = async () => {
    const tx = await worldSend("closeTime", [singletonEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(CloseTime, singletonEntity);
  };
  const executeBaseTime = async () => {
    const tx = await worldSend("executeBaseTime", [singletonEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(BaseTime, singletonEntity);
  };

  return {
    increment,
    startTime,
    closeTime,
    executeBaseTime
  };
}
