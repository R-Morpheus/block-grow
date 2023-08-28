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
    PlayerEntity:{
      ...entityKey,
      schema: "bool",
    },
    Balance:{
      ...entityKey,
      schema: {
        token: EntityId,
        balance: "uint256",
      },
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
    MiningFarms:{
      ...entityKey,
      schema: EntityIdSet,
    },
    Token: {
      ...entityKey,
      schema: {
        name: 'string',
        tokenEntity: EntityId,
      }
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
