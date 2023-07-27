import React from 'react';
import MyTrail from "./MyTrail";


const Header = () => {
  return (
    <div className='flex items-center flex-col w-full h-full bg-gray-950 text-white'>
      <div className='flex justify-between w-full text-sm'>
        <div className='m-10'>
          BlockGrow
        </div>
        <div className='m-10 flex justify-evenly'>
          <a className='mx-2 cursor-pointer'>Home</a>
          <a className='mx-2 cursor-pointer'>Features</a>
          <a className='mx-2 cursor-pointer'>Contact</a>
        </div>
      </div>
      <div className='border-white border p-10 w-2/3 h-1/3 flex justify-center items-center rounded-2xl'>
        <MyTrail>
          <h1 className='text-[180px]'>Grow</h1>
        </MyTrail>
      </div>
    </div>
  );
};

export default Header;