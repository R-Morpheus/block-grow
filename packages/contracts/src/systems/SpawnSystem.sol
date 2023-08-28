// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { MiningFarms, PlayerEntity, PlayerEntityData, MiningEquipment } from "../codegen/Tables.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";
import { addressToEntityKey } from "../addressToEntityKey.sol";

contract SpawnSystem is System {

  function spawn() public {
    bytes32 owner = addressToEntityKey(_msgSender());
    PlayerEntity.set(owner, true);

    bytes32 farmEntity = getUniqueEntity();
    MiningEquipment.set(owner, farmEntity);

    MiningFarms.push(owner, farmEntity);
  }
}