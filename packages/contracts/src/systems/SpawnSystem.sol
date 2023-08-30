// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { MiningFarms, PlayerEntity, MiningEquipment, Token, MiningLevel } from "../codegen/Tables.sol";
import { LibMiningFarm } from "../miningFarm/LibMiningFarm.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";
import { addressToEntityKey } from "../addressToEntityKey.sol";

contract SpawnSystem is System {
  function spawn(address owner) public {
    bytes32[] memory farms;

    bytes32 ownerEntity = addressToEntityKey(owner);
    PlayerEntity.set(ownerEntity, true);

    bytes32 farmEntity = getUniqueEntity();
    MiningEquipment.set(ownerEntity, farmEntity);

    MiningLevel.set(farmEntity, 1);

    MiningFarms.set(ownerEntity, farms);

    MiningFarms.push(ownerEntity, farmEntity);
  }
}