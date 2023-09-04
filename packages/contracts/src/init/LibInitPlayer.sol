// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";

import { MiningFarms, PlayerEntity, MiningEquipment, Token, MiningLevel } from "../codegen/Tables.sol";
import { LibMiningFarm } from "../miningFarm/LibMiningFarm.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";
import { addressToEntityKey } from "../addressToEntityKey.sol";

library LibInitPlayer {
  function spawn() public {
    bytes32[] memory farms;

    bytes32 ownerEntity = addressToEntityKey(_msgSender());
    PlayerEntity.set(ownerEntity, true);

    bytes32 farmEntity = getUniqueEntity();
    MiningEquipment.set(ownerEntity, farmEntity);

    MiningLevel.set(farmEntity, 1);

    MiningFarms.set(ownerEntity, farms);

    MiningFarms.push(ownerEntity, farmEntity);
  }
}