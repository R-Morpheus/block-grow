import React from 'react';
import tokens from "../../utils/Cryptocurrency Price - How To Read Cryptocurrency Charts_.jpeg";
import grafic from "../../utils/Biggest Crypto Gainers Today - December 14.jpeg";

const Images = () => {
  return (
    <div className='w-2/3 h-1/3 flex items-center flex-col'>
      <div className='flex items-center justify-around'>
        <div className='flex flex-col justify-between items-start w-2/3 h-2/3 bg-[#545454] rounded-tl-3xl rounded-br-3xl rounded-bl-3xl p-10 text-start mr-2'>

          <div className='h-0.5 bg-white w-10 mt-16'></div>
          <span className='text-[14px]'>
            Unleash your inner crypto tycoon in the
            thrilling world of BlockGrow! Dive into blockchain and cryptocurrencies,
            blending economic strategy, risk management, and multiplayer prowess.
          </span>
          </div>

        <img src={tokens} className='grayscale w-1/3 h-2/3 rounded-tl-3xl rounded-br-3xl rounded-bl-3xl' alt="grafic"/>
      </div>
      <div>
        <img src={grafic} className='grayscale w-1/3 h-2/3' alt="grafic"/>

        <div className='h-0.5 bg-white w-1/4 mb-5'></div>
        <span>
            Unleash your inner crypto tycoon in the
            thrilling world of BlockGrow! Dive into blockchain and cryptocurrencies,
            blending economic strategy, risk management, and multiplayer prowess.
          </span>
      </div>
      </div>
  );
};

export default Images;