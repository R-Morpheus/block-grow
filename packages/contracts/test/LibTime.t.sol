// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { MudTest } from "@latticexyz/store/src/MudTest.sol";

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

  function testStartTime() public {
    LibTime.startTime(farmEntity);
    uint256 startTime = StartTime.get(farmEntity);
    assertTrue(startTime > 0);
  }


    function _initValue() internal {
      LibMiningFarm.startFarm(farmEntity);
      LibMiningFarm.upgradeFarm(farmEntity, 1);
    }

    function testCloseTime() public {
    LibTime.startTime(farmEntity);
    LibTime.closeTime(farmEntity);
    uint256 storedCloseTime = CloseTime.get(farmEntity);
    assert(storedCloseTime > 0);
  }

  function testExecuteBaseTime() public {
    LibTime.startTime(farmEntity);
    LibTime.closeTime(farmEntity);

    uint256 startTime = StartTime.get(farmEntity);
    uint256 closeTime = StartTime.get(farmEntity);
    assert(startTime > closeTime);

    uint256 baseTime = LibTime.executeBaseTime(farmEntity);
    assert(baseTime > 0);
  }
}
