/* Autogenerated file. Do not edit manually. */

import { TableId } from "@latticexyz/common";
import { defineComponent, Type as RecsType, World } from "@latticexyz/recs";

export function defineContractComponents(world: World) {
  return {
    Counter: (() => {
      const tableId = new TableId("", "Counter");
      return defineComponent(
        world,
        {
          value: RecsType.Number,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    StartTime: (() => {
      const tableId = new TableId("", "StartTime");
      return defineComponent(
        world,
        {
          value: RecsType.BigInt,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    CloseTime: (() => {
      const tableId = new TableId("", "CloseTime");
      return defineComponent(
        world,
        {
          value: RecsType.BigInt,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    BaseTime: (() => {
      const tableId = new TableId("", "BaseTime");
      return defineComponent(
        world,
        {
          value: RecsType.BigInt,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Player: (() => {
      const tableId = new TableId("", "Player");
      return defineComponent(
        world,
        {
          value: RecsType.Boolean,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Balance: (() => {
      const tableId = new TableId("", "Balance");
      return defineComponent(
        world,
        {
          value: RecsType.BigInt,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Blockchain: (() => {
      const tableId = new TableId("", "Blockchain");
      return defineComponent(
        world,
        {
          value: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Block: (() => {
      const tableId = new TableId("", "Block");
      return defineComponent(
        world,
        {
          value: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Transaction: (() => {
      const tableId = new TableId("", "Transaction");
      return defineComponent(
        world,
        {
          value: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    CryptoCurrency: (() => {
      const tableId = new TableId("", "CryptoCurrency");
      return defineComponent(
        world,
        {
          value: RecsType.BigInt,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    MiningEquipment: (() => {
      const tableId = new TableId("", "MiningEquipment");
      return defineComponent(
        world,
        {
          value: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    MiningLevel: (() => {
      const tableId = new TableId("", "MiningLevel");
      return defineComponent(
        world,
        {
          value: RecsType.Number,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    MiningWork: (() => {
      const tableId = new TableId("", "MiningWork");
      return defineComponent(
        world,
        {
          value: RecsType.Boolean,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Market: (() => {
      const tableId = new TableId("", "Market");
      return defineComponent(
        world,
        {
          value: RecsType.StringArray,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Event: (() => {
      const tableId = new TableId("", "Event");
      return defineComponent(
        world,
        {
          value: RecsType.Number,
        },
        {
          metadata: {
            contractId: tableId.toHex(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
  };
}
