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
    Portfolio:{
      ...entityKey,
      schema: {
        entityPortfolio: EntityId,
        list: EntityIdArray,
      },
    },
    Balance:{
      keySchema: {
        owner: EntityId,
        portfolio: EntityId,
      },
      schema: {
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
      schema: {
        token: EntityId,
        work: 'bool',
      }
    },
    MiningFarms:{
      ...entityKey,
      schema: EntityIdSet,
    },
    Token: {
      keySchema: {
        owner: EntityId,
        token: EntityId,
      },
      schema: {
        factor: "uint256",
        name: 'string',
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
