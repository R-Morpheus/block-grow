import React, {useEffect, useState} from 'react';
import {useMUD} from "../MUDContext";
import {useComponentValue} from "@latticexyz/react";
import videoCard from "../img/videocard.svg"
import videoCardGreen from "../img/videocardgreen.svg"
import DataList from "./DataList";


const MiningFarm = () => {

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



  const valueList = [
    {nameData: 'Level', valueData: useComponentValue(MiningLevel, singletonEntity)?.value,},
    {nameData: 'Work', valueData: useComponentValue(MiningWork, singletonEntity)?.value,},
    {nameData: 'Balance', valueData: useComponentValue(Balance, singletonEntity)?.value,},
    {nameData: 'Start Time', valueData: useComponentValue(StartTime, singletonEntity)?.value,},
    {nameData: 'Finish Time', valueData: useComponentValue(CloseTime, singletonEntity)?.value,},
    {nameData: 'Base Time', valueData: useComponentValue(BaseTime, singletonEntity)?.value,},
  ]


  interface AnimatedNumberProps {
    initialValue: number;
  }

  const AnimatedNumber: React.FC<AnimatedNumberProps> = ({ initialValue }) => {
    const [number, setNumber] = useState(initialValue);

    useEffect(() => {
      const interval = setInterval(() => {
        setNumber(prevNumber => prevNumber + 1);
      }, 1000);

      return () => {
        clearInterval(interval);
      };
    }, []);

    return (
      <div className="text-4xl animate-bounce">{number}</div>
    );
  };


  return (
    <div>
      <header className='flex justify-around border border-black'>
        <h1>MiningFarm</h1>
        <div>TokenList</div>
      </header>
      <div className='flex justify-around w-full h-full'>
        <div className='border border-black w-full h-full flex justify-center'>
          {/*<img src={work ? videoCardGreen : videoCard} alt="videocard" className='w-52'/>*/}
        </div>
        <div className='border border-black w-full h-full flex flex-col justify-center p-2'>
          {valueList.map((value) => (
            <DataList dataName={value.nameData} dataValue={value.valueData}/>
          ))}
        </div>

        <div className='border border-black w-full h-full flex justify-center'>
            store
        </div>
      </div>
    </div>
  );
};

export default MiningFarm;