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

  function testStartFarm() public {
    bool work = MiningWork.get(farmEntity);
    assert(work == false);
    LibMiningFarm.startFarm(farmEntity);

    bool newWork = MiningWork.get(farmEntity);
    assert(newWork == true);
  }

  function testUpgradeFarm() public {
    LibMiningFarm.startFarm(farmEntity);

    uint8 baseLevel = MiningLevel.get(farmEntity);
    assertTrue(baseLevel == 0);

    LibMiningFarm.upgradeFarm(farmEntity, baseLevel + 1);

    uint8 newLevel = MiningLevel.get(farmEntity);
    assertTrue(newLevel == 1);
  }

  function testFinishFarm() public {
    LibMiningFarm.startFarm(farmEntity);
    bool work = MiningWork.get(farmEntity);
    assertTrue(work == true);

    vm.warp(block.timestamp + 1);

    LibMiningFarm.finishFarm(farmEntity);

    uint256 startTime = StartTime.get(farmEntity);
    uint256 closeTime = CloseTime.get(farmEntity);
    assertTrue(closeTime > startTime);

    bool newWork = MiningWork.get(farmEntity);
    assertTrue(newWork == false);
  }
}
