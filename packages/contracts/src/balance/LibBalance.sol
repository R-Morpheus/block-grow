// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { Balance, MiningLevel } from "../codegen/Tables.sol";
import { LibTime } from "../time/LibTime.sol";
import { LibMiningFarm } from "../miningFarm/LibMiningFarm.sol";

library LibBalance {

    function getBalance(bytes32 userEntity) internal view returns (uint256 balance){
        balance = Balance.get(userEntity);
        return balance;
    }


    
}