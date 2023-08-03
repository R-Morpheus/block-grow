// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { MiningEquipment, MiningLevel, MiningWork, StartTime, CloseTime, BaseTime } from "../codegen/Tables.sol";
import { LibTime } from "../time/LibTime.sol";

library LibMiningFarm {
    error LibMiningFarm__FarmAlreadyUse(bytes32 farmEntity);
    error LibMiningFarm__FarmAlreadyFinish(bytes32 farmEntity);
    error LibMiningFarm__InvalidLevel(bytes32 farmEntity);

    function startFarm(bytes32 farmEntity, bytes32 userEntity) internal {
        if (MiningWork.get(farmEntity) == true){
            revert LibMiningFarm__FarmAlreadyUse(farmEntity);
        }
        LibTime.getStartTime(userEntity);
        MiningWork.set(farmEntity, true);
    }

    function upgradeFarm(bytes32 farmEntity, uint8 level) internal{
        if (MiningLevel.get(farmEntity) == level){
            revert LibMiningFarm__InvalidLevel(farmEntity);
        }
        MiningLevel.set(farmEntity, level);
    }

    function finishFarm(bytes32 farmEntity, bytes32 userEntity) internal{
        if (MiningWork.get(farmEntity) == false){
            revert LibMiningFarm__FarmAlreadyFinish(farmEntity);
        }
        LibTime.getCloseTime(userEntity);
        MiningWork.set(farmEntity, false);
    }
}