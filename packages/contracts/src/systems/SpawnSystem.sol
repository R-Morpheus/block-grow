// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { MiningFarms, Player, PlayerEntity } from "../codegen/Tables.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";
import { addressToEntityKey } from "../addressToEntityKey.sol";

contract SpawnSystem is System {

  function spawn() public {
    bytes32 player = addressToEntityKey(_msgSender());
    bytes32 playerEntity = getUniqueEntity();
    bytes32 farmEntity = getUniqueEntity();

    Player.set(player, true);
    PlayerEntity.set(player, playerEntity);
    MiningFarms.push(farmEntity, 1);
  }
}