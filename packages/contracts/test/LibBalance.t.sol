// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { MudTest } from "@latticexyz/store/src/MudTest.sol";

import { console } from "forge-std/console.sol";

import { IWorld } from "../src/codegen/world/IWorld.sol";
import { Balance, MiningLevel, MiningWork, MiningEquipment,
StartTime, CloseTime, BaseTime,
StartTimeTableId, CloseTimeTableId, BaseTimeTableId }
from "../src/codegen/Tables.sol";
import { LibTime } from "../src/time/LibTime.sol";
import { LibBalance } from "../src/balance/LibBalance.sol";
import { LibMiningFarm } from "../src/miningFarm/LibMiningFarm.sol";

contract LibBalanceTest is MudTest {
//  IWorld public world;
//  bytes32 internal farmEntity = keccak256("farmEntity");
//  bytes32 internal userEntity = keccak256("userEntity");
//
//  function setUp() public virtual override {
//    super.setUp();
//    vm.startPrank(worldAddress);
//  }
//
//  function testAddBalance() public {
//    LibMiningFarm.startFarm(farmEntity);
//
//    vm.warp(block.timestamp + 1);
//
//    LibMiningFarm.finishFarm(farmEntity);
//
//    LibMiningFarm.upgradeFarm(farmEntity, 1);
//
//    LibTime.executeBaseTime(farmEntity);
//    LibBalance.addBalance(userEntity, farmEntity);
//
//    uint256 balance = LibBalance.getBalance(userEntity);
//
//    assertTrue(balance == 1);
//
//  }

}
