-- THE VEIL by anothurz - Public Loader

local MAIN_URL = "https://main-script-the-veil-private.vercel.app/api/main"

local ok, source = pcall(function()
    return game:HttpGet(MAIN_URL, true)
end)

if not ok or type(source) ~= "string" or #source < 10 then
    warn("[THE VEIL] Failed to download main script:", source)
    return
end

local fn, compileErr = loadstring(source)

if not fn then
    warn("[THE VEIL] Main script compile error:", compileErr)
    return
end

local ran, runtimeErr = pcall(fn)

if not ran then
    warn("[THE VEIL] Main script runtime error:", runtimeErr)
end
