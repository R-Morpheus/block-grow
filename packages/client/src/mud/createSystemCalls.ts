import { awaitStreamValue } from "@latticexyz/utils";
import { Entity } from "@latticexyz/recs";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";



export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  {worldSend, txReduced$, playerEntity }: SetupNetworkResult,
  { StartTime, CloseTime, BaseTime }: ClientComponents
) {
  const upgradeLevelFarm = async (ownerEntity: Entity | undefined) => {
    const tx = await worldSend("upgradeLevelFarm", [ownerEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };
  const startFarm = async (ownerEntity: Entity | undefined) => {
    const tx = await worldSend("startFarm", [ownerEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };
  const finishFarm = async (ownerEntity: Entity | undefined) => {
    const tx = await worldSend("finishFarm", [ownerEntity]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };

  return {
    upgradeLevelFarm,
    startFarm,
    finishFarm,
  };
}
