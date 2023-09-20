import { getComponentValue } from "@latticexyz/recs";
import { awaitStreamValue } from "@latticexyz/utils";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";
import {PromiseOrValue} from "contracts/types/ethers-contracts/common";
import {BytesLike, Overrides} from "ethers";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  {worldSend, txReduced$ }: SetupNetworkResult,
  { StartTime, CloseTime, BaseTime }: ClientComponents
) {
  const upgradeLevelFarm = async (id: PromiseOrValue<BytesLike>) => {
    const tx = await worldSend("upgradeLevelFarm", [id]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };
  const startFarm = async (id: PromiseOrValue<BytesLike>) => {
    const tx = await worldSend("startFarm", [id]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };
  const finishFarm = async (id: PromiseOrValue<BytesLike>) => {
    const tx = await worldSend("finishFarm", [id]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };

  const spawn = async (id: Overrides & {from?: PromiseOrValue<string> | undefined}) => {
    const tx = await worldSend("spawn", [id]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };

  return {
    upgradeLevelFarm,
    startFarm,
    finishFarm,
    spawn
  };
}
