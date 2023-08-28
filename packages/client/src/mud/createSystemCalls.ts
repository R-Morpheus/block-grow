import { runQuery, Has, HasValue, getComponentValueStrict, getComponentValue } from "@latticexyz/recs";
import { awaitStreamValue } from "@latticexyz/utils";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  { playerEntity, singletonEntity, worldSend }: SetupNetworkResult,
  { StartTime, CloseTime, BaseTime, PlayerEntity, MiningFarms }: ClientComponents
) {
  const upgradeLevelFarm = async () => {
    await worldSend("upgradeLevelFarm", [singletonEntity]);
  };
  const startFarm = async () => {
    await worldSend("startFarm", [singletonEntity]);

  };
  const finishFarm = async () => {
    await worldSend("finishFarm", [singletonEntity, playerEntity]);
  };

  return {
    upgradeLevelFarm,
    startFarm,
    finishFarm
  };
}
