import { useComponentValue } from "@latticexyz/react";
import { useMUD } from "./MUDContext";
import {useEffect, useState} from "react";

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

  const counter = useComponentValue(Counter, singletonEntity);
  const startTimes = useComponentValue(StartTime, singletonEntity);
  const closeTimes = useComponentValue(CloseTime, singletonEntity);
  const baseTimes = useComponentValue(BaseTime, singletonEntity);
  const balances = useComponentValue(Balance, playerEntity);

  const miningWorks = useComponentValue(MiningWork, singletonEntity);
  const miningLevels = useComponentValue(MiningLevel, singletonEntity);
  const miningEquipments = useComponentValue(MiningEquipment, singletonEntity);





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


      <div className='border border-amber-950'>
        <div>
          miningLevels: <span>{miningLevels?.value ?? "??"}</span>
        </div>
        <div>
          startTimes: <span>{String(startTimes?.value) ?? "??"}</span>
        </div>
        <div>
          closeTimes: <span>{String(closeTimes?.value) ?? "??"}</span>
        </div>
        <div>
          baseTimes: <span>{String(baseTimes?.value) ?? "??"}</span>
        </div>
        <div>
          balances: <span>{String(balances?.value) ?? "??"}</span>
        </div>
        <div>
          miningWorks: <span>{String(miningWorks?.value) ?? "??"}</span>
        </div>
      </div>









      {/*<div>*/}
      {/*  time: <span>{String(localSeconds) ?? "??"}</span> sec*/}
      {/*</div>*/}
      {/*<button*/}
      {/*  type="button"*/}
      {/*  onClick={handleIncrementTime}*/}
      {/*>*/}
      {/*  Increment Time*/}
      {/*</button>*/}

      {/*<div>*/}
      {/*  incremental game*/}
      {/*  <div>*/}
      {/*    time: <span>{String(startTimes?.value) ?? "??"}</span>*/}
      {/*  </div>*/}
      {/*  <button*/}
      {/*    type="button"*/}
      {/*    onClick={async (event) => {*/}
      {/*      event.preventDefault();*/}
      {/*      console.log("new starttime value:", await startTime());*/}
      {/*    }}*/}
      {/*  >*/}
      {/*    time*/}
      {/*  </button>*/}
      {/*  <div>*/}
      {/*    time: <span>{String(closeTimes?.value) ?? "??"}</span>*/}
      {/*  </div>*/}
      {/*  <button*/}
      {/*    type="button"*/}
      {/*    onClick={async (event) => {*/}
      {/*      event.preventDefault();*/}
      {/*      console.log("new closetime value:", await closeTime());*/}
      {/*    }}*/}
      {/*  >*/}
      {/*    time*/}
      {/*  </button>*/}
      {/*  <div>*/}
      {/*    time: <span>{String(baseTimes?.value) ?? "??"}</span>*/}
      {/*  </div>*/}
      {/*  <button*/}
      {/*    type="button"*/}
      {/*    onClick={async (event) => {*/}
      {/*      event.preventDefault();*/}
      {/*      console.log("new basetime value:", await executeBaseTime());*/}
      {/*    }}*/}
      {/*  >*/}
      {/*    time*/}
      {/*  </button>*/}
      {/*</div>*/}
    </>
  );
};
