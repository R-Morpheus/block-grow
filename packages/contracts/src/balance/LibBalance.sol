// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { Balance, MiningLevel, MiningWork, MiningEquipment, BaseTime, Token, Portfolio } from "../codegen/Tables.sol";
import { LibTime } from "../time/LibTime.sol";
import { LibMiningFarm } from "../miningFarm/LibMiningFarm.sol";

library LibBalance {
  error LibBalance__FarmAlreadyUse();

    function getBalance(bytes32 playerEntity) internal view returns (uint256){
      bytes32 portfolioEntity = Portfolio.getEntityPortfolio(playerEntity);
      return Balance.get(playerEntity, portfolioEntity);
    }


  function setBalance(bytes32 playerEntity) internal {
    bytes32 farmEntity = MiningEquipment.get(playerEntity);

    if(MiningWork.getWork(farmEntity) == true){
      revert LibBalance__FarmAlreadyUse();
    }

    bytes32 portfolioEntity = Portfolio.getEntityPortfolio(playerEntity);
    bytes32 tokenEntity = MiningWork.getToken(farmEntity);

    uint8 level = MiningLevel.get(farmEntity);
    uint256 baseTime = BaseTime.get(farmEntity);
    uint256 balance = Balance.get(playerEntity, portfolioEntity);
    uint256 tokenBalance = Token.getFactor(playerEntity, tokenEntity);

    uint256 newBalance = (baseTime * level) + balance;

    Balance.set(playerEntity, portfolioEntity , newBalance);
  }

  function __sumOfTokens(bytes32 playerEntity, bytes32[] memory tokens) internal  returns(uint256 balance){
    for (uint256 i; i < tokens.length; i++) {
      bytes32 tokenEntity = Portfolio.getItemList(playerEntity, i);
      // TODO set keyshema to two entity TOKEN_TABLE
      uint256 tokenBalance = Token.getFactor(playerEntity, tokenEntity);
      balance + tokenBalance;
    }
    return balance;
  }
}