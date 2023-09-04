// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";

import { MiningFarms, PlayerEntity, MiningEquipment, MiningLevel } from "../codegen/Tables.sol";
import { LibMiningFarm } from "../miningFarm/LibMiningFarm.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";
import { addressToEntityKey } from "../addressToEntityKey.sol";

contract SpawnSystem is System {

  function spawn() public returns (string memory) {
    bytes32[] memory farms;
    bytes32 farmEntity = getUniqueEntity();

    bytes32 owner = addressToEntityKey(_msgSender());
    PlayerEntity.set(owner, true);

    MiningLevel.set(farmEntity, 1);
    MiningEquipment.set(owner, farmEntity);
    MiningFarms.set(owner, farms);
    MiningFarms.push(owner, farmEntity);
    return "spawn!";
  }
}