import { useComponentValue } from "@latticexyz/react";
import { useMUD } from "./MUDContext";
import {useEffect, useState} from "react";

export const App = () => {
  const {
    components: { Counter, StartTime, CloseTime, BaseTime },
    systemCalls: { increment, closeTime, startTime, executeBaseTime },
    network: { singletonEntity },
  } = useMUD();

  const counter = useComponentValue(Counter, singletonEntity);
  const startTimes = useComponentValue(StartTime, singletonEntity);
  const closeTimes = useComponentValue(CloseTime, singletonEntity);
  const baseTimes = useComponentValue(BaseTime, singletonEntity);

  const [localSeconds, setLocalSeconds] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      setLocalSeconds(prev => prev + 1);
    }, 1000);

    return () => clearInterval(interval);
  }, []);


  const handleIncrementTime = async () => {
    try {
      setLocalSeconds(prev => prev + 1);
      const newValue = await startTime();
      setLocalSeconds(Number(newValue));
    } catch (error) {
      console.error("Ошибка при обновлении времени:", error);
    }
  }


  const data = useMUD()
  console.log(data)

  return (
    <>
      <div>
        Counter: <span>{counter?.value ?? "??"}</span>
      </div>
      <button
        type="button"
        onClick={async (event) => {
          event.preventDefault();
          console.log("new counter value:", await increment());
        }}
      >
        Increment
      </button>

      <div>
        time: <span>{String(localSeconds) ?? "??"}</span> sec
      </div>
      <button
        type="button"
        onClick={handleIncrementTime}
      >
        Increment Time
      </button>

      <div>
        incremental game
        <div>
          time: <span>{String(startTimes?.value) ?? "??"}</span>
        </div>
        <button
          type="button"
          onClick={async (event) => {
            event.preventDefault();
            console.log("new starttime value:", await startTime());
          }}
        >
          time
        </button>
        <div>
          time: <span>{String(closeTimes?.value) ?? "??"}</span>
        </div>
        <button
          type="button"
          onClick={async (event) => {
            event.preventDefault();
            console.log("new closetime value:", await closeTime());
          }}
        >
          time
        </button>
        <div>
          time: <span>{String(baseTimes?.value) ?? "??"}</span>
        </div>
        <button
          type="button"
          onClick={async (event) => {
            event.preventDefault();
            console.log("new basetime value:", await executeBaseTime());
          }}
        >
          time
        </button>
      </div>
    </>
  );
};
