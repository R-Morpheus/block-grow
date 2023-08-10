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

contract LibTimeTest is MudTest {
  IWorld public world;
  bytes32 internal farmEntity = keccak256("farmEntity");

  function setUp() public virtual override {
    super.setUp();
    vm.startPrank(worldAddress);
  }

  function testStartTime() public {
    LibTime.startTime(farmEntity);
    uint256 startTime = StartTime.get(farmEntity);
    assertTrue(startTime > 0);
  }

    function testCloseTime() public {
    LibTime.startTime(farmEntity);
    LibTime.closeTime(farmEntity);
    uint256 storedCloseTime = CloseTime.get(farmEntity);
    assert(storedCloseTime > 0);
  }

  function testExecuteBaseTime() public {
    LibTime.startTime(farmEntity);
    uint256 startTime = StartTime.get(farmEntity);

    vm.warp(block.timestamp + 1);

    LibTime.closeTime(farmEntity);
    uint256 closeTime = CloseTime.get(farmEntity);
    assert(startTime < closeTime);

    uint256 baseTime = LibTime.executeBaseTime(farmEntity);
    assert(baseTime > 0);
  }
}
