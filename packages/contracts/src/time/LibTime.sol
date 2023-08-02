// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { StartTime, CloseTime, BaseTime } from "../codegen/Tables.sol";

library LibTime {
    function getStartTime(bytes32 userEntity) internal view returns (uint256 startTime) {
        StartTime.set(userEntity, block.timestamp);
        startTime = StartTime.get(userEntity);
        return startTime;
    }

    function getCloseTime(bytes32 userEntity) internal view returns (uint256 closeTime) {
        CloseTime.set(userEntity, block.timestamp);
        closeTime = CloseTime.get(userEntity);
        return closeTime;
    }

    function getBaseTime(bytes userEntity) internal view returns (uint256 baseTime) {
        uint256 startTime = StartTime.get(userEntity);
        uint256 closeTime = CloseTime.get(userEntity);
        baseTime = closeTime - startTime;
        BaseTime.set(userEntity, baseTime);
        return baseTime;
    }
}