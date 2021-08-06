# FiveM and RedM population density control

Control the ped and vehicle density for all clients.

# Configuration

Each multiplier is a number between 0.0 (no population) and 1.0 (max population).

## FiveM and RedM

| Multiplier                                 | Controls                   |
|--------------------------------------------|----------------------------|
| `Config.densityMultipliers.ambientPeds`    | All types of ambient peds  |
| `Config.densityMultipliers.scenarioPeds`   | All types of scenario peds |
| `Config.densityMultipliers.vehicles`       | All types of vehicles      |
| `Config.densityMultipliers.parkedVehicles` | Parked vehicles            |
| `Config.densityMultipliers.randomVehicles` | Moving vehicles            |

## RedM only

| Multiplier                                  | Controls             |
|---------------------------------------------|----------------------|
| `Config.densityMultipliers.ambientAnimals`  | Ambient animal peds  |
| `Config.densityMultipliers.ambientHumans`   | Ambient human peds   |
| `Config.densityMultipliers.scenarioAnimals` | Scenario animal peds |
| `Config.densityMultipliers.scenarioHumans`  | Scenario human peds  |

# Exports

## Client-side

### getMultiplier

```lua
value = exports.popdensity:getMultiplier(name)
```

Get the current value of a density multiplier on a specific client.

### setMultiplier

```lua
exports.popdensity:setMultiplier(name, value)
```

Set the value of a density multiplier on a specific client.

### resetMultiplier

```lua
exports.popdensity:resetMultipler(name)
```

Reset a density multiplier to its default value on a specific client.
