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

  function upgradeLevelFarm(bytes32 farmEntity) public{
    uint8 level = MiningLevel.get(farmEntity);
    LibMiningFarm.upgradeFarm(farmEntity, level + 1);
  }

  function startFarm(bytes32 farmEntity) public {
    LibMiningFarm.startFarm(farmEntity);
  }

  function finishFarm(bytes32 farmEntity, bytes32 playerEntity) public{
    LibMiningFarm.finishFarm(farmEntity);

    uint8 level = MiningLevel.get(farmEntity);
    uint256 baseTime = LibTime.executeBaseTime(farmEntity);
    uint256 balance = Balance.get(playerEntity);
    uint256 newBalance = (baseTime * level) + balance;

    Balance.set(playerEntity, newBalance);
  }
}