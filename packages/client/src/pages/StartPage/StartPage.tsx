import React from 'react';
import Header from "./Header";
import AnimationComponent from "./AnimationComponent";

const StartPage = () => {
  return (
    <div className='w-full h-full relative'>
      <Header/>
      <div className='absolute left-0 top-56 text-white w-1/3 h-1/3'>
        <AnimationComponent/>
      </div>
      <div className='absolute right-0 top-0 text-white w-1/3 h-1/3'>
        <AnimationComponent/>
      </div>
    </div>
  );
};

export default StartPage;