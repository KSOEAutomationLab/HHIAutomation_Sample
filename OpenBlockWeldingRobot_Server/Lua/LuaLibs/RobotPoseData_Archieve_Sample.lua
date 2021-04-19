require "RobotPoseData"

RPD_TCP_BACK = RobotPoseData:create(3, 150, -1, 0, 0, 0, 0, 0);

RPD_Joint_Middle2 = RobotPoseData:create(1, 20, 0.00, -70.00, -110.00, -90.00, 90.00, 0.00)

RPD_Joint_R_APPROACH = RobotPoseData:create(1, 20, 45.73, -66.52, -87.62, -152.74, 62.42, 70.31)

RPD_Joint_Compact       = RobotPoseData:create(1, 40, 0, -65, -60, -185, 90, 0)



--터치 및 용접 기준자세를 POSE_TCP_xxx 로 선언. 이거는 나중에도 바꾸면 안됨
--POSE_TCP_xxx 를 RPD_TCP_xxx 로 복사해서 터치 및 용접에서 사용. 아무것도 안할땐 복사한거 그대로 사용. 필요하면 회전시켜서 사용

POSE_TCP_L_U             = RobotPoseData:create(2, 100, 850, 200, 400, -68.83,-18.75,-52.10) -- 위로 20도
POSE_TCP_L_MU            = RobotPoseData:create(2, 100, 850, 200, 350, -79.37,-19.68,-48.62) -- 위로 10도
POSE_TCP_L_M             = RobotPoseData:create(2, 100, 850, 200, 250, -90, -20, -45) -- 기준자세
POSE_TCP_L_MB            = RobotPoseData:create(2, 100, 850, 200, 200, -100.63,-19.68,-41.38) -- 아래로 10도
POSE_TCP_L_B             = RobotPoseData:create(2, 100, 850, 200, 150, -105.92,  -19.29,  -39.62) -- 아래로 15도

POSE_TCP_L_U_MOVE        = RobotPoseData:create(2, 100, 650, 100, 400, -68.83,-18.75,-52.10)
POSE_TCP_L_MU_MOVE       = RobotPoseData:create(2, 100, 650, 100, 350, -79.37,-19.68,-48.62)
POSE_TCP_L_M_MOVE        = RobotPoseData:create(2, 100, 650, 100, 250, -90, -20, -45)
POSE_TCP_L_MB_MOVE       = RobotPoseData:create(2, 100, 650, 100, 200, -100.63,-19.68,-41.38)
POSE_TCP_L_B_MOVE        = RobotPoseData:create(2, 100, 650, 100, 150, -105.92,  -19.29,  -39.62)

POSE_TCP_B_LL            = RobotPoseData:create(2, 100, 650, 100, 100, -130.89, 20.7, -67.79) -- 좌로 45도
POSE_TCP_B_L             = RobotPoseData:create(2, 100, 650, 100, 100, -130.89, 20.7, -67.79) -- 좌로 30도
POSE_TCP_B_ML            = RobotPoseData:create(2, 100, 650, 0, 100, -133.22, 14.00, -75.57) -- 좌로 20도
POSE_TCP_B_M             = RobotPoseData:create(2, 100, 650, -100, 100, -135, 0, -90)
POSE_TCP_B_MR            = RobotPoseData:create(2, 100, 650, -200, 100, -133.22, -14, -104.43) -- 우로 20도
POSE_TCP_B_R             = RobotPoseData:create(2, 100, 650, -300, 100, -130.89, -20.70, -112.21) -- 우로 30도
POSE_TCP_B_RR            = RobotPoseData:create(2, 100, 650, -300, 100, -130.89, -20.70, -112.21) -- 우로 45도

POSE_TCP_R_B             = RobotPoseData:create(2, 100, 850, -400, 150, -105.92,  -19.29,  -129.62) -- 아래로 15도
POSE_TCP_R_MB            = RobotPoseData:create(2, 100, 850, -400, 200, -100.63,  -19.68,  -131.38) -- 아래로 10도
POSE_TCP_R_M             = RobotPoseData:create(2, 100, 850, -400, 250, -90, -20, -135) -- 기준자세
POSE_TCP_R_MU            = RobotPoseData:create(2, 100, 850, -400, 350, -79.37,  -19.68,  -138.62) -- 위로 10도
POSE_TCP_R_U             = RobotPoseData:create(2, 100, 850, -400, 400, -74.08,  -19.29,  -140.38) -- 위로 20도

POSE_TCP_R_B_MOVE        = RobotPoseData:create(2, 100, 650, -300, 150, -105.34,  -48.97,  -123.31)
POSE_TCP_R_MB_MOVE       = RobotPoseData:create(2, 100, 650, -300, 200, -97.75,  -49.74,  -129.07)
POSE_TCP_R_M_MOVE        = RobotPoseData:create(2, 100, 650, -300, 250, -90, -50, -135)
POSE_TCP_R_MU_MOVE       = RobotPoseData:create(2, 100, 650, -300, 350, -82.25,  -49.74,  -140.93)
POSE_TCP_R_U_MOVE        = RobotPoseData:create(2, 100, 650, -300, 400, -74.66,  -48.97,  -146.69)


--POSE_TCP_xxx를 RPD_TCP_xxx로 복사함
LIBFILLET:DefaultPoseReset()