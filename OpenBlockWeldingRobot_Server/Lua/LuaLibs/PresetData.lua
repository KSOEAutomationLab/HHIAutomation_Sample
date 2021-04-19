
TouchSpeed = 5
TouchBackLength = 20
TouchBackLength_CollarPlate = 8


TouchBackSpeed = 100

TOUCH_TO_X = TouchSensingData:createData(100, TouchSpeed, 1, 1, 0, 0, 10, TouchBackSpeed, 1, -1, 0, 0)
TOUCH_TO_Y = TouchSensingData:createData(100, TouchSpeed, 1, 0, 1, 0, 10, TouchBackSpeed, 1, 0, -1, 0)
TOUCH_TO_Z = TouchSensingData:createData(100, TouchSpeed, 1, 0, 0, 1, 10, TouchBackSpeed, 1, 0, 0, -1)

TOUCH_TO_XM = TouchSensingData:createData(100, TouchSpeed, 1, -1, 0, 0, 10, TouchBackSpeed, 1, 1, 0, 0)
TOUCH_TO_YM = TouchSensingData:createData(100, TouchSpeed, 1, 0, -1, 0, 10, TouchBackSpeed, 1, 0, 1, 0)
TOUCH_TO_ZM = TouchSensingData:createData(100, TouchSpeed, 1, 0, 0, -1, 10, TouchBackSpeed, 1, 0, 0, 1)

TOUCH_TO_X_SHORT_BACK = TouchSensingData:createData(100, TouchSpeed, 1, 1, 0, 0, 5, TouchBackSpeed, 1, -1, 0, 0)
TOUCH_TO_Y_SHORT_BACK = TouchSensingData:createData(100, TouchSpeed, 1, 0, 1, 0, 5, TouchBackSpeed, 1, 0, -1, 0)
TOUCH_TO_Z_SHORT_BACK = TouchSensingData:createData(100, TouchSpeed, 1, 0, 0, 1, 5, TouchBackSpeed, 1, 0, 0, -1)

TOUCH_TO_XM_SHORT_BACK = TouchSensingData:createData(100, TouchSpeed, 1, -1, 0, 0, 5, TouchBackSpeed, 1, 1, 0, 0)
TOUCH_TO_YM_SHORT_BACK = TouchSensingData:createData(100, TouchSpeed, 1, 0, -1, 0, 5, TouchBackSpeed, 1, 0, 1, 0)
TOUCH_TO_ZM_SHORT_BACK = TouchSensingData:createData(100, TouchSpeed, 1, 0, 0, -1, 5, TouchBackSpeed, 1, 0, 0, 1)

TOUCH_TO_X_LONG = TouchSensingData:createData(200, TouchSpeed, 1, 1, 0, 0, 20, TouchBackSpeed, 1, -1, 0, 0)
TOUCH_TO_Y_LONG = TouchSensingData:createData(200, TouchSpeed, 1, 0, 1, 0, 20, TouchBackSpeed, 1, 0, -1, 0)
TOUCH_TO_Z_LONG = TouchSensingData:createData(200, TouchSpeed, 1, 0, 0, 1, 20, TouchBackSpeed, 1, 0, 0, -1)

TOUCH_TO_XM_LONG = TouchSensingData:createData(200, TouchSpeed, 1, -1, 0, 0, 20, TouchBackSpeed, 1, 1, 0, 0)
TOUCH_TO_YM_LONG = TouchSensingData:createData(200, TouchSpeed, 1, 0, -1, 0, 20, TouchBackSpeed, 1, 0, 1, 0)
TOUCH_TO_ZM_LONG = TouchSensingData:createData(200, TouchSpeed, 1, 0, 0, -1, 20, TouchBackSpeed, 1, 0, 0, 1)

TOUCH_TO_X_40BACK = TouchSensingData:createData(100, TouchSpeed, 1, 1, 0, 0, 40, TouchBackSpeed, 1, -1, 0, 0)
TOUCH_TO_Y_40BACK = TouchSensingData:createData(100, TouchSpeed, 1, 0, 1, 0, 40, TouchBackSpeed, 1, 0, -1, 0)
TOUCH_TO_Z_40BACK = TouchSensingData:createData(100, TouchSpeed, 1, 0, 0, 1, 40, TouchBackSpeed, 1, 0, 0, -1)

TOUCH_TO_XM_40BACK = TouchSensingData:createData(100, TouchSpeed, 1, -1, 0, 0, 40, TouchBackSpeed, 1, 1, 0, 0)
TOUCH_TO_YM_40BACK = TouchSensingData:createData(100, TouchSpeed, 1, 0, -1, 0, 40, TouchBackSpeed, 1, 0, 1, 0)
TOUCH_TO_ZM_40BACK = TouchSensingData:createData(100, TouchSpeed, 1, 0, 0, -1, 40, TouchBackSpeed, 1, 0, 0, 1)

TOUCH_TO_X_LONG_40BACK = TouchSensingData:createData(200, TouchSpeed, 1, 1, 0, 0, 40, TouchBackSpeed, 1, -1, 0, 0)
TOUCH_TO_Y_LONG_40BACK = TouchSensingData:createData(200, TouchSpeed, 1, 0, 1, 0, 40, TouchBackSpeed, 1, 0, -1, 0)
TOUCH_TO_Z_LONG_40BACK = TouchSensingData:createData(200, TouchSpeed, 1, 0, 0, 1, 40, TouchBackSpeed, 1, 0, 0, -1)

TOUCH_TO_XM_LONG_40BACK = TouchSensingData:createData(200, TouchSpeed, 1, -1, 0, 0, 40, TouchBackSpeed, 1, 1, 0, 0)
TOUCH_TO_YM_LONG_40BACK = TouchSensingData:createData(200, TouchSpeed, 1, 0, -1, 0, 40, TouchBackSpeed, 1, 0, 1, 0)
TOUCH_TO_ZM_LONG_40BACK = TouchSensingData:createData(200, TouchSpeed, 1, 0, 0, -1, 40, TouchBackSpeed, 1, 0, 0, 1)

--기본 이동속도
TCP_DEFAULTSPEED=300
JOINT_DEFAULTSPEED=40

TouchCali = 1 -- 터치센싱할때 로봇이 바로 멈추지 못하고 밀고가는 거리. 터치값 읽어온 뒤 보정값으로 사용
HOME = RPD_TCP_B_M:clone()
S95_SaveRobotTCPPose = {}
for i=0, 15 do
    S95_SaveRobotTCPPose[i]=HOME:clone()
end

S96_SaveRobotTCPPose = {}
for i=0, 15 do
    S96_SaveRobotTCPPose[i]=HOME:clone()
end

S97_SaveRobotTCPPose = {}
for i=0, 1 do
    S97_SaveRobotTCPPose[i]=HOME:clone()
end

S98_SaveRobotTCPPose = {}
for i=0, 1 do
    S98_SaveRobotTCPPose[i]=HOME:clone()
end

S99_SaveRobotTCPPose = {}
for i=0, 1 do
    S99_SaveRobotTCPPose[i]=HOME:clone()
end



-- 중간경로생성용 리스트. 포즈는 17개. 왼쪽 상단자세에서 시작해서 왼쪽하단, 중앙, 오른쪽하단을 거쳐 오른쪽 상단까지 연속한 자세임
-- 어떤 포즈에서 목표 포즈까지 이동하고자 할떄 
-- 1. 현재 포즈와 가장 가까운 기준포즈 인덱스 구함
-- 2. 목표 포즈와 가장 가까운 기준포즈 인덱스 구함
-- 3. 시작인덱스포즈 + 시작-종료 중간인덱스 포즈 중 두번째인덱스가 1인포즈 + 종료인덱스 포즈 이렇게 포즈테이블을 만들어서 이동
TCP_MOVEPOSE_LIST = {{RPD_CLONE(POSE_TCP_L_U_MOVE), 0, 0},
                     {RPD_CLONE(POSE_TCP_L_MU_MOVE), 0, 0},
                     {RPD_CLONE(POSE_TCP_L_M_MOVE), 0, 0},
                     {RPD_CLONE(POSE_TCP_L_MB_MOVE), 0, 0},
                     {RPD_CLONE(POSE_TCP_L_B_MOVE), 0, 0},
                     {RPD_CLONE(POSE_TCP_B_LL), 1, 1},
                     {RPD_CLONE(POSE_TCP_B_L), 0, 1},
                     {RPD_CLONE(POSE_TCP_B_ML), 0, 1},
                     {RPD_CLONE(POSE_TCP_B_M), 0, 1},
                     {RPD_CLONE(POSE_TCP_B_MR), 0, 1},
                     {RPD_CLONE(POSE_TCP_B_R), 0, 2},
                     {RPD_CLONE(POSE_TCP_B_RR), 1, 2},
                     {RPD_CLONE(POSE_TCP_R_B_MOVE), 0, 2},
                     {RPD_CLONE(POSE_TCP_R_MB_MOVE), 0, 2},
                     {RPD_CLONE(POSE_TCP_R_M_MOVE), 0, 2},
                     {RPD_CLONE(POSE_TCP_R_MU_MOVE), 0, 2},
                     {RPD_CLONE(POSE_TCP_R_U_MOVE), 0, 2} }



