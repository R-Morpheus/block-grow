import { useComponentValue } from "@latticexyz/react";
import { useMUD } from "./MUDContext";
import {useEffect, useState} from "react";
import MiningFarm from "./components/MiningFarm";
import { runQuery, Has, HasValue, getComponentValueStrict, getComponentValue } from "@latticexyz/recs";


export const App = () => {
  const {
    components: {
      StartTime,
      CloseTime,
      BaseTime ,
      Balance,
      MiningWork,
      MiningLevel,
      MiningEquipment,
      PlayerEntity,
    },
    systemCalls: { startFarm, finishFarm, upgradeLevelFarm },
    network: { singletonEntity , playerEntity, world },
  } = useMUD();

  const startTimes = useComponentValue(StartTime, singletonEntity);
  const closeTimes = useComponentValue(CloseTime, singletonEntity);
  const baseTimes = useComponentValue(BaseTime, singletonEntity);
  const balances = useComponentValue(Balance, playerEntity);

  const data = useMUD()
  console.log('data', data)
  const matchingEntities = runQuery([Has(PlayerEntity)])
  console.log('entityes', matchingEntities)


  return (
    <>
      <MiningFarm/>
    </>
  );
};
