import { mudConfig, resolveTableId } from "@latticexyz/world/register";

const EntityId = "bytes32" as const
const EntityIdArray = "bytes32[]" as const
const EntityIdSet = "bytes32[]" as const

const entityKey = {
  keySchema: {
    entity: EntityId,
  },
} as const;

const entityRelation = {
  ...entityKey,
  schema: EntityId,
} as const;


export default mudConfig({
  tables: {
    Counter: {
      keySchema: {},
      schema: "uint32",
    },
    StartTime:{
      ...entityKey,
      schema: "uint256",
    },
    CloseTime:{
      ...entityKey,
      schema: 'uint256'
    },
    BaseTime:{
      ...entityKey,
      schema: 'uint256'
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
    MiningEquipment:{
      ...entityKey,
      schema: EntityId,
    },
    MiningLevel:{
      ...entityKey,
      schema: 'uint8',
    },
    MiningWork:{
      ...entityKey,
      schema: 'bool',
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
  modules: [
    {
      name: "KeysInTableModule",
      root: true,
      args: [resolveTableId("StartTime")],
    },
    {
      name: "UniqueEntityModule",
      root: true,
      args: [],
    },
  ],
});
