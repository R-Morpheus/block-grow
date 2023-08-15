// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { Balance, MiningLevel, MiningWork, MiningEquipment, BaseTime } from "../codegen/Tables.sol";
import { LibTime } from "../time/LibTime.sol";
import { LibMiningFarm } from "../miningFarm/LibMiningFarm.sol";
import { System } from "@latticexyz/world/src/System.sol";


 contract BalanceSystem is System {
  error LibBalance__FarmAlreadyUse();

  function getBalance(bytes32 userEntity) internal view returns (uint256 balance){
    balance = Balance.get(userEntity);
    return balance;
  }


  function addBalance(bytes32 userEntity, bytes32 farmEntity) internal {
    if(MiningWork.get(farmEntity) == true){
      revert LibBalance__FarmAlreadyUse();
    }
    LibMiningFarm.finishFarm(farmEntity);

    uint8 level = MiningLevel.get(farmEntity);
    uint256 baseTime = BaseTime.get(farmEntity);
    uint256 balance = Balance.get(userEntity);
    uint256 newBalance = (baseTime * level) + balance;

    Balance.set(userEntity, newBalance);
  }
}