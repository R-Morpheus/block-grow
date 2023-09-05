// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";

import { MiningFarms, PlayerEntity, MiningEquipment, MiningLevel, Token, TokenData, Portfolio } from "../codegen/Tables.sol";
import { LibMiningFarm } from "../miningFarm/LibMiningFarm.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";
import { addressToEntityKey } from "../addressToEntityKey.sol";

contract SpawnSystem is System {

  function spawn() public returns (string memory) {
    uint256 day = 86400;
    bytes32[] memory farms;
    bytes32[] memory tokens;
    bytes32 farmEntity = getUniqueEntity();

    bytes32 owner = addressToEntityKey(_msgSender());
    PlayerEntity.set(owner, true);

    MiningLevel.set(farmEntity, 1);
    MiningEquipment.set(owner, farmEntity);
    MiningFarms.set(owner, farms);
    MiningFarms.push(owner, farmEntity);

    bytes32 tokenEntity = getUniqueEntity();
    string memory nameToken = "ETH";
    uint256 memory factor = 0.000625;
    Token.set(owner, tokenEntity, factor / day, nameToken);

    bytes32 portfolioEntity = getUniqueEntity();
    Portfolio.set(owner, portfolioEntity, tokens);
    // TODO change system to any portfolios
    Portfolio.pushList(owner, tokenEntity);

    return "player spawned!";
  }
}