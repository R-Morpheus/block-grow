// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { MiningEquipment, MiningLevel, MiningWork, StartTime, CloseTime, BaseTime } from "../codegen/Tables.sol";
import { LibTime } from "../time/LibTime.sol";
import { System } from "@latticexyz/world/src/System.sol";

contract MiningFarmSystem is System {
  error LibMiningFarm__FarmAlreadyUse(bytes32 farmEntity);
  error LibMiningFarm__FarmAlreadyFinish(bytes32 farmEntity);
  error LibMiningFarm__InvalidLevel(bytes32 farmEntity);

  function startFarm(bytes32 farmEntity) internal {
    if (MiningWork.get(farmEntity) == true){
      revert LibMiningFarm__FarmAlreadyUse(farmEntity);
    }
    LibTime.startTime(farmEntity);
    MiningWork.set(farmEntity, true);
  }

  function upgradeFarm(bytes32 farmEntity, uint8 level) internal {
    uint8 baseLevel = MiningLevel.get(farmEntity);
    if (baseLevel == level || baseLevel > level) {
      revert LibMiningFarm__InvalidLevel(farmEntity);
    }
    MiningLevel.set(farmEntity, level);
  }

  function finishFarm(bytes32 farmEntity) internal {
//      bool work = MiningWork.get(farmEntity);
//        if (work == false){
//            revert LibMiningFarm__FarmAlreadyFinish(farmEntity);
//        }

    LibTime.closeTime(farmEntity);
    MiningWork.set(farmEntity, false);
  }
}