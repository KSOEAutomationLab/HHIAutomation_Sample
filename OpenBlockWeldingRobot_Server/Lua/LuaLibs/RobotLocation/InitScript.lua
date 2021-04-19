require "FunctionWrapper"
require "TouchSensingData"
require "WeldCondition"
require "WeldPoseData"
require "Libraries"
require "Lib_Fillet"
require "Lib_CellWeld"
require "RobotPoseData_Archieve_Sample"
require "PresetData"

function CheckHelperResetStatus(event, line)
    CurrentFlag = Helper.error_reset
    if CurrentFlag == true then EXIT() end
end

function EXIT()
    if Helper.error_message == '' then
        error("Error ")
    else
        ErrorMessage = "Error: " .. Helper.error_message
        error(ErrorMessage)
    end
end

debug.sethook(CheckHelperResetStatus, "l")

SimulationFlag = false

RobotLocation = "RobotLocation"
