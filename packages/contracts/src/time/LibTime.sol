// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { StartTime, CloseTime, BaseTime } from "../codegen/Tables.sol";

library LibTime {
    function startTime(bytes32 farmEntity) internal {
      uint256 startTime = block.timestamp;
      StartTime.set(farmEntity, startTime);
    }

    function closeTime(bytes32 farmEntity) internal {
        CloseTime.set(farmEntity, block.timestamp);
    }

    function executeBaseTime(bytes32 farmEntity) internal returns (uint256 baseTime) {
        uint256 startTime = StartTime.get(farmEntity);
        uint256 closeTime = CloseTime.get(farmEntity);
        baseTime = closeTime - startTime;
        BaseTime.set(farmEntity, baseTime);
        return baseTime;
    }
}