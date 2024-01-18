--[[
    AUTHOR: Sebastien Bock
    DESCRIPTION: A Script to fix the Throttle and Mixture problem with Airfoillabs Cessna 172 and custome build quadrants
]]
DEBUG = false
throttle_ratio = dataref_table("sim/cockpit2/engine/actuators/throttle_ratio")
mix_ratio = dataref_table("sim/cockpit2/engine/actuators/mixture_ratio")
dataref("acf_author", "sim/aircraft/view/acf_author", "readonly")
dataref("acf_ui_name", "sim/aircraft/view/acf_ui_name", "readonly")

df_c172_thr_ratio = XPLMFindDataRef( "C172/cockpit/ped/throttle")
df_c172_mix_ratio = XPLMFindDataRef( "C172/cockpit/ped/mixture")
if df_c172_thr_ratio then
    dataref("c172_thr_ratio", "C172/cockpit/ped/throttle", "writable")
end
if df_c172_mix_ratio then
    dataref("c172_mix_ratio", "C172/cockpit/ped/mixture", "writable")
end

require("graphics")

if DEBUG then
    if not SUPPORTS_FLOATING_WINDOWS then
        logMsg("imgui not supported by your FlyWithLua version")
        return
    end
    debug_wnd = float_wnd_create(275, 600, 1, true)
    float_wnd_set_title(debug_wnd, "Debug Window")
    float_wnd_set_imgui_builder(debug_wnd, "debug_on_build")
    float_wnd_set_position(debug_wnd, 100, 75)

    function debug_hide_wnd()
        if debug_wnd then	
            float_wnd_destroy(debug_wnd)
        end
    end

    function debug_on_build(debug_wnd, x, y)
        imgui.TextUnformatted("Aircraft")
        imgui.TextUnformatted(acf_ui_name)
        imgui.TextUnformatted(acf_author)
        imgui.Separator()
        imgui.TextUnformatted("Throttle Ratio")
        if throttle_ratio then
            imgui.TextUnformatted(throttle_ratio[0])
        else
            imgui.TextUnformatted("--")
        end
        imgui.TextUnformatted("C172 Throttle Ratio")
        if c172_thr_ratio then
            imgui.TextUnformatted(c172_thr_ratio)       
        else
            imgui.TextUnformatted("--")
        end
        imgui.Separator()
        imgui.TextUnformatted("Mix Ratio")
        if mix_ratio then
            imgui.TextUnformatted(mix_ratio[0])
        else
            imgui.TextUnformatted("--")
        end
        imgui.TextUnformatted("C172 Mix Ratio")
        if c172_mix_ratio then
            imgui.TextUnformatted(c172_mix_ratio)       
        else
            imgui.TextUnformatted("--")
        end
        imgui.Separator()
    end
end

if acf_author == "Airfoillabs" and df_c172_thr_ratio and df_c172_mix_ratio then
    function Loop_every_frame()
        if not (throttle_ratio[0]==c172_thr_ratio) then
            c172_thr_ratio = throttle_ratio[0]
        end
        if not (mix_ratio[0]==c172_mix_ratio or mix_ratio[0]==0) then
            c172_mix_ratio = mix_ratio[0]
        end
    end
    do_every_frame("Loop_every_frame()")
end