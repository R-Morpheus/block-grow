import { getComponentValue } from "@latticexyz/recs";
import { awaitStreamValue } from "@latticexyz/utils";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  { playerEntity, singletonEntity, worldSend, txReduced$ }: SetupNetworkResult,
  { StartTime, CloseTime, BaseTime }: ClientComponents
) {
  const upgradeLevelFarm = async () => {
    const tx = await worldSend("upgradeLevelFarm", [singletonEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };
  const startFarm = async () => {
    const tx = await worldSend("startFarm", [singletonEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };
  const finishFarm = async () => {
    const tx = await worldSend("finishFarm", [singletonEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };

  return {
    upgradeLevelFarm,
    startFarm,
    finishFarm
  };
}
