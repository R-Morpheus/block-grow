// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { Balance, MiningLevel, MiningWork, MiningEquipment, BaseTime, Token } from "../codegen/Tables.sol";
import { LibTime } from "../time/LibTime.sol";
import { LibMiningFarm } from "../miningFarm/LibMiningFarm.sol";

library LibBalance {
  error LibBalance__FarmAlreadyUse();

    function getBalance(bytes32 playerEntity) internal view returns (uint256 balance){
//      bytes32 tokenEntity = Token.getTokenEntity(playerEntity);
      balance = Balance.get(playerEntity);
      return balance;
    }


  function setBalance(bytes32 playerEntity) internal {
    bytes32 farmEntity = MiningEquipment.get(playerEntity);
    if(MiningWork.get(farmEntity) == true){
      revert LibBalance__FarmAlreadyUse();
    }
    uint8 level = MiningLevel.get(farmEntity);
    uint256 baseTime = BaseTime.get(farmEntity);
//    bytes32 tokenEntity = Token.getTokenEntity(playerEntity);
    uint256 balance = Balance.get(playerEntity);
    uint256 newBalance = (baseTime * level) + balance;

    Balance.set(playerEntity, newBalance);
  }
}