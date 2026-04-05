-- Fly by TienAnh script
function flyBy(rocket, targets)
    for _, target in ipairs(targets) do
        -- Logic to fly rocket by target
        print("Flying by " .. target)
    end
end

-- Example usage
local rocket = {name = "Rocket 1"}
local targets = {"Earth", "Mars", "Venus"}
flyBy(rocket, targets)