// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { StartTime, CloseTime, BaseTime } from "../codegen/Tables.sol";
import { System } from "@latticexyz/world/src/System.sol";

contract TimeSystem is System {
  function startTime(bytes32 farmEntity) public returns (uint256) {
    uint256 startTime = block.timestamp;
    StartTime.set(farmEntity, startTime);
    return StartTime.get(farmEntity);
  }

  function closeTime(bytes32 farmEntity) public returns (uint256) {
    CloseTime.set(farmEntity, block.timestamp);
    return CloseTime.get(farmEntity);

  }

  function executeBaseTime(bytes32 farmEntity) public returns (uint256 baseTime) {
    uint256 startTime = StartTime.get(farmEntity);
    uint256 closeTime = CloseTime.get(farmEntity);
    baseTime = closeTime - startTime;
    BaseTime.set(farmEntity, baseTime);
    return baseTime;
  }
}