POSE_HOME = RPD_CLONE(POSE_TCP_B_M)
POINT_START = TP_GET("PL3")
POINT_END = TP_GET("PR3")
LIBFILLET:DefaultPoseReset() --RPD_TCP_xxx 포즈 들을 기준값으로 초기화
LIBFILLET:DefaultPoseChange_Horizontal(POINT_START, POINT_END) --수평용접 시작-종료점, 각 면 형상정보로 기본자세 변경
POSE_START = RPD_CLONE(RPD_TCP_B_L)
POSE_END = RPD_CLONE(RPD_TCP_B_R)
WLineID = "WB0"
WPosition = "2F"



POSE_START_Ready = RPD_Shift_Tool_Z(RPD_P1A1(2, 100, POINT_START, POSE_START), -30)
POSE_END_Ready = RPD_Shift_Tool_Z(RPD_P1A1(2, 100, POINT_END, POSE_END), -30)
BeforePoselist = FIND_MID_PATH(POSE_HOME, POSE_START_Ready, TCP_MOVEPOSE_LIST)
AfterPoselist  = FIND_MID_PATH(POSE_END_Ready, POSE_HOME, TCP_MOVEPOSE_LIST)
WCondition = WC_CREATE(WLineID, WPosition, "", 0, 0, 0, 0, 1)

MainConList = {}

WPD_START = WPD_P1A1(POINT_START, POSE_START)
--WPD_ADDBACKUP_RPD(POINT_START, 1, POSE_START)
--WPD_ADDBACKUP_RPD(POINT_START, 2, POSE_START)
WPD_END = WPD_P1A1(POINT_END, POSE_END)
--WPD_ADDBACKUP_RPD(POINT_END, 1, POSE_END)
--WPD_ADDBACKUP_RPD(POINT_END, 2, POSE_END)
MainConList[1] = {1, WPD_START, WPD_START, WPD_END, nil}


--용접방향에 따라 정방향용접 or 역방향용접데이터 생성
if LIBFILLET:FindWeldDir(POINT_START, POINT_END) then
    LIBFILLET:MakeWeldInfo_Forward(BeforePoselist, AfterPoselist, WCondition, MainConList)
else
    LIBFILLET:MakeWeldInfo_Reverse(BeforePoselist, AfterPoselist, WCondition, MainConList)
end
