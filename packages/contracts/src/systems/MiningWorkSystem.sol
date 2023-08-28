// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { Balance, MiningLevel, MiningWork, MiningEquipment, BaseTime, PlayerEntity } from "../codegen/Tables.sol";
import { LibTime } from "../time/LibTime.sol";
import { LibMiningFarm } from "../miningFarm/LibMiningFarm.sol";
import { LibBalance } from "../balance/LibBalance.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";
import { addressToEntityKey } from "../addressToEntityKey.sol";

contract MiningWorkSystem is System {

  function upgradeLevelFarm(bytes32 playerEntity) public{
    bytes32 farmEntity = MiningEquipment.get(playerEntity);
    uint8 level = MiningLevel.get(farmEntity);
    LibMiningFarm.upgradeFarm(farmEntity, level + 1);
  }

  function startFarm(bytes32 playerEntity) public {
    bytes32 farmEntity = MiningEquipment.get(playerEntity);
    LibMiningFarm.startFarm(farmEntity);
  }

  function finishFarm(bytes32 playerEntity) public{
    bytes32 farmEntity = MiningEquipment.get(playerEntity);
    LibMiningFarm.finishFarm(farmEntity);
    LibBalance.setBalance(playerEntity);
  }
}