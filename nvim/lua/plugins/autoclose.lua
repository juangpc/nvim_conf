local autoclose_status, autoclose = pcall(require, 'autoclose')
if not autoclose_status then
    print("Problemwith autoclose plugin.")
    return
end

autoclose.setup()

