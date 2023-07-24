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
      keySchema: {},
      schema: EntityId,
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
      schema: EntityId,
    },
    MiningEquipment:{
      keySchema: {},
      schema: EntityId,
    },
    Market:{
      keySchema: {},
      schema: EntityId,
    },
    Event:{
      keySchema: {},
      schema: EntityId,
    },
  },
});
