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

  const miningWorks = useComponentValue(MiningWork, singletonEntity);
  const miningLevels = useComponentValue(MiningLevel, singletonEntity);

  const data = useMUD()
  console.log('data', data)
  const matchingEntities = runQuery([
    Has(PlayerEntity),
  ])
  console.log('entityes', matchingEntities)

  return (
    <div className='bg-gray-900 text-gray-100 min-h-screen'>
      <header>
        <button type="button" onClick={async (event) => {
            event.preventDefault();
            await startFarm();}}
          className='m-5 border border-gray-100 p-1'>
          START
        </button>
        <button type="button" onClick={async (event) => {
            event.preventDefault();
            console.log("new starttime value:", await upgradeLevelFarm());}}
          className='m-5 border border-gray-100 p-1'>
          UPGRADE
        </button>
        <button type="button" onClick={async (event) => {
            event.preventDefault();
            console.log("new starttime value:", await finishFarm());}}
          className='m-5 border border-gray-100 p-1'>
          FINISH
        </button>
      </header>
      <MiningFarm/>
    </div>
  );
};
