// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { MudTest } from "@latticexyz/store/src/MudTest.sol";
import { console } from "forge-std/console.sol";
import { addressToEntityKey } from "../src/addressToEntityKey.sol";

import { IWorld } from "../src/codegen/world/IWorld.sol";
import { Balance, MiningLevel, MiningWork, MiningEquipment, StartTime, CloseTime, BaseTime} from "../src/codegen/Tables.sol";
import { LibTime } from "../src/time/LibTime.sol";
import { LibBalance } from "../src/balance/LibBalance.sol";
import { LibMiningFarm } from "../src/miningFarm/LibMiningFarm.sol";

contract LibBalanceTest is MudTest {
    IWorld public world;
    bytes32 internal farmEntity = keccak256("farmEntity");
    bytes32 internal userEntity = addressToEntityKey(msg.sender);

  function setUp() public virtual override {
    super.setUp();
    vm.startPrank(worldAddress);
  }

  function testAddBalance() public {
    bytes32 tokenEntity = MiningWork.getToken(userEntity);
    LibMiningFarm.startFarm(farmEntity, tokenEntity);

    vm.warp(block.timestamp + 5);

    LibMiningFarm.finishFarm(farmEntity);

    LibMiningFarm.upgradeFarm(farmEntity, 3);

    LibTime.executeBaseTime(farmEntity);
    LibBalance.setBalance(userEntity);

    uint256 balance = LibBalance.getBalance(userEntity);

    console.log('LOGS');
    console.log(balance);
    assertTrue(balance > 0);

  }
}
