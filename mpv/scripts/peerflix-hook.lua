local utils = require 'mp.utils'
local msg = require 'mp.msg'

-- OPTIONS
local keep_file_after_streaming = false

local peerflix = {
    path = "peerflix",
    searched = false
}

local wait_for_file_to_exist_script = [[
until [ -f /tmp/peerflix.lock ];
do
    sleep 1;
done;

rm /tmp/peerflix.lock;
]]

local peerflix_is_running = false

mp.add_hook("on_load", 20, function ()
    local url = mp.get_property("stream-open-filename")
    if (url:find("magnet:") == 1)  or (url:find("peerflix://") == 1) then -- Support for .torrent files will come, someday
        -- search for peerflix in mpv's config folder
        if not (peerflix.searched) then
            local peerflix_mcd = mp.find_config_file("peerflix")
            if not (peerflix_mcd == nil) then
                msg.verbose("found peerflix")
                peerflix.path = peerflix_mcd
            end
            peerflix.searched = false
        end
        
        if (url:find("peerflix://") == 1) then
            url = url:sub(12)
        end
        
        msg.warn("Starting peerflix")
        
        -- utils.subprocess can't execute peerflix without blocking
        if (keep_file_after_streaming) then
            os.execute(peerflix.path .. " -q -p 8888 --on-listening 'touch /tmp/peerflix.lock' " .. url .. " &")
        else
            os.execute(peerflix.path .. " -q -r -p 8888 --on-listening 'touch /tmp/peerflix.lock' " .. url .. " &")
        end
        peerflix_is_running = true
        
        msg.warn("Waiting for server")
        -- There's probably a better way to do this...
        os.execute("echo '" .. wait_for_file_to_exist_script .. "' | bash -")
        
        msg.warn("Server is up")
        mp.set_property("stream-open-filename", "http://localhost:8888")
    end
end)

mp.add_hook("on_unload", 10, function ()
    if (peerflix_is_running) then
        os.execute("killall peerflix") -- Should get a way to get the PID, but using $! seems to fail.
    end
end)
