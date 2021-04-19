--EXECUTE("0")

--격자용 터치방향을 정의함
--면은 전면, 좌측면, 우측면, 좌측바닥면, 우측바닥면으로 나뉨
--바닥면은 곡면으로 보고 좌측,우측 방향이 다르다고 가정해서 구분함
--첫번쨰 기호는 F(front), L(left), R(right), BL(BottomLeft), BR(BottomRight), 
--BLC(BottomLeftCorner), BRC(BottomRightCorner),BLP(BottomLeftCollarPlate), BRP(BottomRightCollarPlate)
--두번쨰 기호는 이상적인 직각 부재, 로봇 설치상태에서 해당 방향 나타냄
--터치방향변수의 인자는 6개임. 앞에 3, 뒤에 3 해서 두개의 방향벡터를 뜻함
--새 자동작업이 시작되면 두 벡터 모두 기본방향으로 초기화됨
--터치센싱 작업 중 필요시 다중터치를 통해 해당 방향을 찾고, 변수의 뒷쪽벡터로 갱신
--방향탐색 터치함수에서는 앞뒤 벡터가 동일하면 해당방향을 탐색하는 터치를 추가로 수행해서 찾은 값을 뒷쪽에 넣고
--다르면 이전에 찾았다고 보고 생략함


axis_Mx = {1,0,0}
axis_My = {0,1,0}
axis_Mz = {0,0,1}
axis_Lx = {1,0,0}
axis_Ly = {0,1,0}
axis_Lz = {0,0,1}
axis_Rx = {1,0,0}
axis_Ry = {0,1,0}
axis_Rz = {0,0,1}

TD_F_X =   {axis_Mx[1], axis_Mx[2], axis_Mx[3], axis_Mx[1], axis_Mx[2], axis_Mx[3]}
TD_F_Z =   {axis_Mz[1], axis_Mz[2], axis_Mz[3], axis_Mz[1], axis_Mz[2], axis_Mz[3]}
TD_F_Y =   {axis_My[1], axis_My[2], axis_My[3], axis_My[1], axis_My[2], axis_My[3]}
TD_L_Z =   {axis_Lz[1], axis_Lz[2], axis_Lz[3], axis_Lz[1], axis_Lz[2], axis_Lz[3]}
TD_L_X =   {axis_Lx[1], axis_Lx[2], axis_Lx[3], axis_Lx[1], axis_Lx[2], axis_Lx[3]}
TD_R_Z =   {axis_Rz[1], axis_Rz[2], axis_Rz[3], axis_Rz[1], axis_Rz[2], axis_Rz[3]}
TD_R_X =   {axis_Rx[1], axis_Rx[2], axis_Rx[3], axis_Rx[1], axis_Rx[2], axis_Rx[3]}
TD_BL_X =  {axis_Mx[1], axis_Mx[2], axis_Mx[3], axis_Mx[1], axis_Mx[2], axis_Mx[3]}
TD_BL_Y =  {axis_My[1], axis_My[2], axis_My[3], axis_My[1], axis_My[2], axis_My[3]}
TD_BR_X =  {axis_Mx[1], axis_Mx[2], axis_Mx[3], axis_Mx[1], axis_Mx[2], axis_Mx[3]}
TD_BR_Y =  {axis_My[1], axis_My[2], axis_My[3], axis_My[1], axis_My[2], axis_My[3]}
TD_BLP_X =  {axis_Mx[1], axis_Mx[2], axis_Mx[3], axis_Mx[1], axis_Mx[2], axis_Mx[3]}
TD_B_X =  {axis_Mx[1], axis_Mx[2], axis_Mx[3], axis_Mx[1], axis_Mx[2], axis_Mx[3]}
TD_BRP_X =  {axis_Mx[1], axis_Mx[2], axis_Mx[3], axis_Mx[1], axis_Mx[2], axis_Mx[3]}
TD_LC_Y = {axis_Ly[1], axis_Ly[2], axis_Ly[3], axis_Ly[1], axis_Ly[2], axis_Ly[3]}
TD_LC_Z = {axis_Lz[1], axis_Lz[2], axis_Lz[3], axis_Lz[1], axis_Lz[2], axis_Lz[3]}
TD_LC_X = {axis_Lx[1], axis_Lx[2], axis_Lx[3], axis_Lx[1], axis_Lx[2], axis_Lx[3]}
TD_RC_Y = {axis_Ry[1], axis_Ry[2], axis_Ry[3], axis_Ry[1], axis_Ry[2], axis_Ry[3]}
TD_RC_Z = {axis_Rz[1], axis_Rz[2], axis_Rz[3], axis_Rz[1], axis_Rz[2], axis_Rz[3]}
TD_RC_X = {axis_Rx[1], axis_Rx[2], axis_Rx[3], axis_Rx[1], axis_Rx[2], axis_Rx[3]}
TD_LP_Y = {axis_Ly[1], axis_Ly[2], axis_Ly[3], axis_Ly[1], axis_Ly[2], axis_Ly[3]}
TD_LP_Z = {axis_Lz[1], axis_Lz[2], axis_Lz[3], axis_Lz[1], axis_Lz[2], axis_Lz[3]}
TD_LP_X = {axis_Lx[1], axis_Lx[2], axis_Lx[3], axis_Lx[1], axis_Lx[2], axis_Lx[3]}
TD_RP_Y = {axis_Ry[1], axis_Ry[2], axis_Ry[3], axis_Ry[1], axis_Ry[2], axis_Ry[3]}
TD_RP_Z = {axis_Rz[1], axis_Rz[2], axis_Rz[3], axis_Rz[1], axis_Rz[2], axis_Rz[3]}
TD_RP_X = {axis_Rx[1], axis_Rx[2], axis_Rx[3], axis_Rx[1], axis_Rx[2], axis_Rx[3]}

TABLE_SET_ARRAY("TD_F_X", "double", 6, TD_F_X)
TABLE_SET_ARRAY("TD_F_Z", "double", 6, TD_F_Z)
TABLE_SET_ARRAY("TD_F_Y", "double", 6, TD_F_Y)
TABLE_SET_ARRAY("TD_L_Z", "double", 6, TD_L_Z)
TABLE_SET_ARRAY("TD_L_X", "double", 6, TD_L_X)
TABLE_SET_ARRAY("TD_R_Z", "double", 6, TD_R_Z)
TABLE_SET_ARRAY("TD_R_X", "double", 6, TD_R_X)
TABLE_SET_ARRAY("TD_BL_X", "double", 6, TD_BL_X)
TABLE_SET_ARRAY("TD_BL_Y", "double", 6, TD_BL_Y)
TABLE_SET_ARRAY("TD_BR_X", "double", 6, TD_BR_X)
TABLE_SET_ARRAY("TD_BR_Y", "double", 6, TD_BR_Y)
TABLE_SET_ARRAY("TD_BLP_X", "double", 6, TD_BLP_X)
TABLE_SET_ARRAY("TD_B_X", "double", 6, TD_B_X)
TABLE_SET_ARRAY("TD_BRP_X", "double", 6, TD_BRP_X)
TABLE_SET_ARRAY("TD_LC_Y", "double", 6, TD_LC_Y)
TABLE_SET_ARRAY("TD_LC_Z", "double", 6, TD_LC_Z)
TABLE_SET_ARRAY("TD_LC_X", "double", 6, TD_LC_X)
TABLE_SET_ARRAY("TD_RC_Y", "double", 6, TD_RC_Y)
TABLE_SET_ARRAY("TD_RC_Z", "double", 6, TD_RC_Z)
TABLE_SET_ARRAY("TD_RC_X", "double", 6, TD_RC_X)
TABLE_SET_ARRAY("TD_LP_Y", "double", 6, TD_LP_Y)
TABLE_SET_ARRAY("TD_LP_Z", "double", 6, TD_LP_Z)
TABLE_SET_ARRAY("TD_LP_X", "double", 6, TD_LP_X)
TABLE_SET_ARRAY("TD_RP_Y", "double", 6, TD_RP_Y)
TABLE_SET_ARRAY("TD_RP_Z", "double", 6, TD_RP_Z)
TABLE_SET_ARRAY("TD_RP_X", "double", 6, TD_RP_X)


