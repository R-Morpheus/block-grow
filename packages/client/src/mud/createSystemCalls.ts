import { getComponentValue } from "@latticexyz/recs";
import { awaitStreamValue } from "@latticexyz/utils";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  { playerEntity, singletonEntity, worldSend, txReduced$ }: SetupNetworkResult,
  { Counter, StartTime, CloseTime, BaseTime }: ClientComponents
) {
  const increment = async () => {
    const tx = await worldSend("increment", []);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(Counter, singletonEntity);
  };
  const upgradeLevelFarm = async () => {
    const tx = await worldSend("upgradeLevelFarm", [singletonEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(StartTime, singletonEntity);
  };
  const startFarm = async () => {
    const tx = await worldSend("startFarm", [singletonEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(CloseTime, singletonEntity);
  };
  const finishFarm = async () => {
    const tx = await worldSend("finishFarm", [singletonEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(BaseTime, singletonEntity);
  };

  return {
    increment,
    upgradeLevelFarm,
    startFarm,
    finishFarm
  };
}
