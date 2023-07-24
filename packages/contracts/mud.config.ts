import { mudConfig } from "@latticexyz/world/register";

const EntityId = "bytes32" as const
const EntityIdArray = "bytes32[]" as const
const EntityIdSet = "bytes32[]" as const

const entityKey = {
  primaryKeys: {
    entity: EntityId,
  },
} as const

const entityRelation = {
  ...entityKey,
  schema: EntityId,
} as const

export default mudConfig({
  tables: {
    Counter: {
      keySchema: {},
      schema: "uint32",
    },
    User:{
      ...entityKey,
      schema: "bool",
    },
    Balance:{
      ...entityKey,
      schema: "uint256",
    },
    Blockchain:{
      keySchema: {},
      schema: EntityId,
    },
    Block:{
      keySchema: {},
      schema: EntityId,
    },
    Transaction:{
      keySchema: {},
      schema: EntityId,
    },
    CryptoCurrency:{
      keySchema: {},
      schema: "uint256",
    },
    Portfolio: {
      ...entityKey,
      schema: EntityIdArray,
    },
    MiningEquipment:{
      ...entityKey,
      schema: EntityId,
    },
    Market:{
      ...entityKey,
      schema: EntityIdArray,
    },
    Event:{
      keySchema: {},
      schema: 'uint48',
    },
  },
});
