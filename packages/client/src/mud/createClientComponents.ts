import { SetupNetworkResult } from "./setupNetwork";
import { overridableComponent } from "@latticexyz/recs";

export type ClientComponents = ReturnType<typeof createClientComponents>;

export function createClientComponents({ components }: SetupNetworkResult) {
  return {
    ...components,
    StartTime: overridableComponent(components.StartTime),
    CloseTime: overridableComponent(components.CloseTime),
    BaseTime: overridableComponent(components.BaseTime),
    Balance: overridableComponent(components.Balance),
    MiningWork: overridableComponent(components.MiningWork),
    MiningLevel: overridableComponent(components.MiningLevel),
    MiningEquipment: overridableComponent(components.MiningEquipment),
    PlayerEntity: overridableComponent(components.PlayerEntity),
    MiningFarms: overridableComponent(components.MiningFarms),
  };
}
