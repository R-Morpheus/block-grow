// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { MiningEquipment, MiningLevel, MiningWork, StartTime, CloseTime, BaseTime, Token } from "../codegen/Tables.sol";
import { LibTime } from "../time/LibTime.sol";

library LibMiningFarm {
    error LibMiningFarm__FarmAlreadyUse(bytes32 farmEntity);
    error LibMiningFarm__FarmAlreadyFinish(bytes32 farmEntity);
    error LibMiningFarm__InvalidLevel(bytes32 farmEntity);

    function startFarm(bytes32 farmEntity, bytes32 tokenEntity) internal {
        if (MiningWork.getWork(farmEntity) == true){
            revert LibMiningFarm__FarmAlreadyUse(farmEntity);
        }
        LibTime.startTime(farmEntity);
        MiningWork.set(farmEntity, tokenEntity, true);
    }

    function upgradeFarm(bytes32 farmEntity, uint8 level) internal {
      uint8 baseLevel = MiningLevel.get(farmEntity);
        if (baseLevel == 0) {
            revert LibMiningFarm__InvalidLevel(farmEntity);
        }
        if (MiningWork.getWork(farmEntity) == true){
            revert LibMiningFarm__FarmAlreadyUse(farmEntity);
        }
        MiningLevel.set(farmEntity, level);
    }

    function finishFarm(bytes32 farmEntity) internal {
      bool work = MiningWork.getWork(farmEntity);
        if (work == false){
            revert LibMiningFarm__FarmAlreadyFinish(farmEntity);
        }
        LibTime.closeTime(farmEntity);
        MiningWork.setWork(farmEntity, false);
    }
}