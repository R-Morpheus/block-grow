import { useComponentValue } from "@latticexyz/react";
import { useMUD } from "./MUDContext";
import {useEffect, useState} from "react";
import MiningFarm from "./components/MiningFarm";

export const App = () => {
  const {
    components: {
      Counter,
      StartTime,
      CloseTime,
      BaseTime ,
      Balance,
      MiningWork,
      MiningLevel,
      MiningEquipment
    },
    systemCalls: { increment, startFarm, finishFarm, upgradeLevelFarm },
    network: { singletonEntity , playerEntity },
  } = useMUD();

  const startTimes = useComponentValue(StartTime, singletonEntity);
  const closeTimes = useComponentValue(CloseTime, singletonEntity);
  const baseTimes = useComponentValue(BaseTime, singletonEntity);
  const balances = useComponentValue(Balance, playerEntity);

  const miningWorks = useComponentValue(MiningWork, singletonEntity);
  const miningLevels = useComponentValue(MiningLevel, singletonEntity);





  // const [localSeconds, setLocalSeconds] = useState(0);

  // useEffect(() => {
  //   const interval = setInterval(() => {
  //     setLocalSeconds(prev => prev + 1);
  //   }, 1000);
  //
  //   return () => clearInterval(interval);
  // }, []);


  // const handleIncrementTime = async () => {
  //   try {
  //     setLocalSeconds(prev => prev + 1);
  //     const newValue = await startTime();
  //     setLocalSeconds(Number(newValue));
  //   } catch (error) {
  //     console.error("Ошибка при обновлении времени:", error);
  //   }
  // }


  const data = useMUD()
  console.log(data)

  return (
    <>
      <div>

        <button
          type="button"
          onClick={async (event) => {
            event.preventDefault();
            console.log("new starttime value:", await startFarm());}}
          className=' m-5 border-2 border-amber-950'>
          start farm

        </button>
        <button
          type="button"
          onClick={async (event) => {
            event.preventDefault();
            console.log("new starttime value:", await upgradeLevelFarm());}}
          className='m-5 border-2 border-amber-950'>
          upgrade farm
        </button>
        <button
          type="button"
          onClick={async (event) => {
            event.preventDefault();
            console.log("new starttime value:", await finishFarm());}}
          className='m-5 border-2 border-amber-950'>
          finish farm
        </button>
      </div>
      <MiningFarm/>
    </>
  );
};
