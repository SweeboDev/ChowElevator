-- config.lua

Config = {}

-- Define the locations and floors
Config.Locations = {
    ["location1"] = {
        coords = {
            {position = vec3(-83.32, -844.5, 39.54), floor = "Floor 1"},
            {position = vec3(-87.23, -839.06, 218.31), floor = "Floor 2"},
            {position = vec3(100.0, 200.0, 60.0), floor = "Floor 3"}
        }
    },
    ["location2"] = {
        coords = {
            {position = vec3(200.0, 300.0, 20.0), floor = "Floor 1"},
            {position = vec3(200.0, 300.0, 40.0), floor = "Floor 2"},
            {position = vec3(200.0, 300.0, 60.0), floor = "Floor 3"}
        }
    }
}
