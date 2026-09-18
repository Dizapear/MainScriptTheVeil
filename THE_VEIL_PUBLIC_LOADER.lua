local MAIN_URL = "https://main-script-the-veil-private-git-main-dizapear.vercel.app/api/main"

local ok, source = pcall(function()
    return game:HttpGet(MAIN_URL, true)
end)

if not ok then
    warn("[THE VEIL] HTTP error:", source)
    return
end

print("[THE VEIL] First 200 chars:")
print(source:sub(1, 200))

local fn, err = loadstring(source)
if not fn then
    warn("[THE VEIL] Compile error:", err)
    return
end

local ran, runtimeErr = pcall(fn)
if not ran then
    warn("[THE VEIL] Runtime error:", runtimeErr)
end
