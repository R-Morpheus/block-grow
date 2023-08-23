import React from 'react';

interface DataListProps {
  dataName: string,
  dataValue: number | bigint | boolean | undefined;
}

const DataList = ({dataName, dataValue }: DataListProps) => {
  return (
    <div className='m-1 flex justify-between'>
      <span className='w-1/2'>{dataName}</span>
      <span className='w-1/2'>{String(dataValue) ?? "??"}</span>
    </div>
  );
};

export default DataList;
