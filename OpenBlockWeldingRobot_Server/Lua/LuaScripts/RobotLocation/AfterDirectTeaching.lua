
--직접교시 종료 후 호출되는 스크립트
--직접교시 값으로 회전추정해서 터치방향, 자세 1차 조정

DTOFF()
Perpendicular = DI_GET(129)


--추정에 사용되는 변수 초기화. 좌수직, 수평, 우수직 3개로 나눠서 직접교시정보가 있는지 검색
local L1 = nil
local L2 = nil
local R1 = nil
local R2 = nil
local BL = nil
local BR = nil
local temp = nil

--좌수직 시작
temp = DP_GET("DL6")
if temp then L1 = RPD_CLONE(temp) end
temp = DP_GET("DL5")
if temp then L1 = RPD_CLONE(temp) end
temp = DP_GET("DL1")
if temp then L1 = RPD_CLONE(temp) end
temp = DP_GET("DL2")
if temp then L1 = RPD_CLONE(temp) end
temp = DP_GET("DL3")
if temp then L1 = RPD_CLONE(temp) end

--좌수직 종료
temp = DP_GET("DL7")
if temp then L2 = RPD_CLONE(temp) end
temp = DP_GET("DL0")
if temp then L2 = RPD_CLONE(temp) end

--우수직 시작
temp = DP_GET("DR6")
if temp then R1 = RPD_CLONE(temp) end
temp = DP_GET("DR5")
if temp then R1 = RPD_CLONE(temp) end
temp = DP_GET("DR1")
if temp then R1 = RPD_CLONE(temp) end
temp = DP_GET("DR2")
if temp then R1 = RPD_CLONE(temp) end
temp = DP_GET("DR3")
if temp then R1 = RPD_CLONE(temp) end

--우수직 종료
temp = DP_GET("DR7")
if temp then R2 = RPD_CLONE(temp) end
temp = DP_GET("DR0")
if temp then R2 = RPD_CLONE(temp) end



--바닥 시작
temp = DP_GET("DL5")
if temp then BL = RPD_CLONE(temp) end
temp = DP_GET("DL4")
if temp then BL = RPD_CLONE(temp) end
temp = DP_GET("DL3")
if temp then BL = RPD_CLONE(temp) end

--바닥 종료
temp = DP_GET("DR5")
if temp then BR = RPD_CLONE(temp) end
temp = DP_GET("DR4")
if temp then BR = RPD_CLONE(temp) end
temp = DP_GET("DR3")
if temp then BR = RPD_CLONE(temp) end


--방향계산용 변수선언
local M_Rmatrix = {1, 0, 0, 0, 1, 0, 0, 0, 1}
local L_Rmatrix = {1, 0, 0, 0, 1, 0, 0, 0, 1}
local R_Rmatrix = {1, 0, 0, 0, 1, 0, 0, 0, 1}
local v_x
local v_y
local v_z



--중간(바닥 및 전면)회전행렬
--바닥쪽 좌우 직접교시 정보가 있는경우
--      - Y방향 : 바닥쪽 좌우 직접교시데이터로 생성
--      - Z방향     1 좌우 수직 직접교시데이터가 없을때 : 베이스 Z방향
--                  2 좌우 수직 직접교시데이터가 있을때
--                          2.1 부재가 직각설정이면 좌우 수직방향 평균만큼 반영
--                          2.2 부재가 직각설정이 아니면 좌우 수직방향 평균의 절반만큼 반영
--      - X방향 : 위에서 구해진 Y,Z방향에 수직

--Y방향 계산
if (BL) and (BR) then --바닥용접선 직접교시 정보가 있는경우 

    --양 끝 직접교시데이터로 벡터 만듬
    v_y = CALC_TWO_POINT_TO_UNIT_VEC({BR.f1, BR.f2, BR.f3},{BL.f1, BL.f2, BL.f3})
    
elseif (L2) and (R2) then --바닥용접선정보는 없고 좌우 수직정보는 있는경우

    --양쪽 수직 직접교시데이터에서 높이정보는 제외하고 x,y 방향만 따옴
    v_y = CALC_TWO_POINT_TO_UNIT_VEC({L2.f1, L2.f2, 0},{R2.f1, R2.f2, 0})

else
    --둘다 아니면 그냥 베이스y방향 그대로 사용
    v_y={0,1,0}
end

--찾은 벡터를 베이스 y방향과 예각인 방향으로 갱신
if Calc_VectorDotProduct(v_y, {0,1,0}) < 0 then
    v_y[1] = -v_y[1]
    v_y[2] = -v_y[2]
    v_y[3] = -v_y[3]
end


--z방향 계산
if (R1) and (R2) and (L1) and (L2) then
    --좌우 수직이 다있으면 좌우 수직 평균
    local tempv1 = CALC_TWO_POINT_TO_UNIT_VEC({R2.f1, R2.f2, R2.f3},{R1.f1, R1.f2, R1.f3})
    local tempv2 = CALC_TWO_POINT_TO_UNIT_VEC({L2.f1, L2.f2, L2.f3},{L1.f1, L1.f2, L1.f3})
    v_z = CALC_UNIT_VEC({tempv1[1]+tempv2[1],tempv1[2]+tempv2[2],tempv1[3]+tempv2[3]})
    PRINT("1")
    PRINT("R2")
    PRINT(tostring(R2.f1))
    PRINT(tostring(R2.f2))
    PRINT(tostring(R2.f3))
    PRINT("R1")
    PRINT(tostring(R1.f1))
    PRINT(tostring(R1.f2))
    PRINT(tostring(R1.f3))
    PRINT("L2")
    PRINT(tostring(L2.f1))
    PRINT(tostring(L2.f2))
    PRINT(tostring(L2.f3))
    PRINT("L1")
    PRINT(tostring(L1.f1))
    PRINT(tostring(L1.f2))
    PRINT(tostring(L1.f3))

    PRINT("tempv1")
    PRINT(tostring(tempv1[1]))
    PRINT(tostring(tempv1[2]))
    PRINT(tostring(tempv1[3]))
    PRINT("tempv2")
    PRINT(tostring(tempv2[1]))
    PRINT(tostring(tempv2[2]))
    PRINT(tostring(tempv2[3]))
    PRINT("v_z")
    PRINT(tostring(v_z[1]))
    PRINT(tostring(v_z[2]))
    PRINT(tostring(v_z[3]))
elseif (R1) and (R2) then
    --좌측 수직만 있을때
    v_z = CALC_TWO_POINT_TO_UNIT_VEC({R2.f1, R2.f2, R2.f3},{R1.f1, R1.f2, R1.f3})
    PRINT("2")
elseif (L1) and (L2) then
    --우측 수직만 있을때
    v_z = CALC_TWO_POINT_TO_UNIT_VEC({L2.f1, L2.f2, L2.f3},{L1.f1, L1.f2, L1.f3})
    PRINT("3")
else
    --둘다 아니면 그냥 베이스z방향 그대로 사용
    v_z={0,0,1}
    PRINT("4")
end

if Perpendicular==0 then --수직격자가 아니면 x,y성분은 절반만 반영함
    v_z = CALC_UNIT_VEC({v_z[1]/2, v_z[2]/2, v_z[3]})
end

--찾은 벡터를 베이스 z방향과 예각인 방향으로 갱신
if Calc_VectorDotProduct(v_z, {0,0,1}) < 0 then
    v_z[1] = -v_z[1]
    v_z[2] = -v_z[2]
    v_z[3] = -v_z[3]
end

--위에서 구한 y,z와 수직한 x방향 구함. 여기서 y,z는 수직한 상태가 아닐수도 있기때문에 Z방향 수직하게 다시 갱신해서 회전행렬만듬
v_x = CALC_UNIT_VEC(CALC_VEC_CROSS(v_y, v_z))
v_z = CALC_UNIT_VEC(CALC_VEC_CROSS(v_x, v_y))
v_y = CALC_UNIT_VEC(v_y)
M_Rmatrix = {   v_x[1], v_y[1], v_z[1],
                v_x[2], v_y[2], v_z[2],
                v_x[3], v_y[3], v_z[3] }







--왼쪽수직용 회전행렬
--z방향 절반만 반영해서 일치시킨다음 y방향도 절반만 반영한거에 외적해서 x구함. 다시 수직한 y 구함
if (L1) and (L2) then
    v_z = CALC_TWO_POINT_TO_UNIT_VEC({L2.f1, L2.f2, L2.f3},{L1.f1, L1.f2, L1.f3})
else
    v_z={0,0,1}
end

--찾은 벡터를 베이스 z방향과 예각인 방향으로 갱신
if Calc_VectorDotProduct(v_z, {0,0,1}) < 0 then
    v_z[1] = -v_z[1]
    v_z[2] = -v_z[2]
    v_z[3] = -v_z[3]
end

--Y방향 계산
if (BL) and (BR) then --바닥용접선 직접교시 정보가 있는경우 
    --양 끝 직접교시데이터로 벡터 만듬
    v_y = CALC_TWO_POINT_TO_UNIT_VEC({BR.f1, BR.f2, BR.f3},{BL.f1, BL.f2, BL.f3})
elseif (L2) and (R2) then --바닥용접선정보는 없고 좌우 수직정보는 있는경우
    --양쪽 수직 직접교시데이터에서 높이정보는 제외하고 x,y 방향만 따옴
    v_y = CALC_TWO_POINT_TO_UNIT_VEC({L2.f1, L2.f2, 0},{R2.f1, R2.f2, 0})
else
    v_y={0,1,0}
end

--찾은 벡터를 베이스 y방향과 예각인 방향으로 갱신
if Calc_VectorDotProduct(v_y, {0,1,0}) < 0 then
    v_y[1] = -v_y[1]
    v_y[2] = -v_y[2]
    v_y[3] = -v_y[3]
end

if Perpendicular==0 then --수직격자가 아니면 Z축, Y축 x,y성분은 절반만 반영함
    v_z = CALC_UNIT_VEC({v_z[1]/2, v_z[2]/2, v_z[3]})
    v_y = CALC_UNIT_VEC({v_y[1]/2, v_y[2]/2, v_y[3]})
end

--위에서 구한 y,z와 수직한 x방향 구함. 여기서 y,z는 수직한 상태가 아님
v_x = CALC_UNIT_VEC(CALC_VEC_CROSS(v_y, v_z))
v_y = CALC_UNIT_VEC(CALC_VEC_CROSS(v_z, v_x))
v_y = CALC_UNIT_VEC(v_y)
L_Rmatrix = {v_x[1], v_y[1], v_z[1],
             v_x[2], v_y[2], v_z[2],
             v_x[3], v_y[3], v_z[3]}

            
             



--오른쪽수직용 회전행렬
--z방향 절반만 반영해서 일치시킨다음 y방향도 절반만 반영한거에 외적해서 x구함. 다시 수직한 y 구함
if (R1) and (R2) then
    v_z = CALC_TWO_POINT_TO_UNIT_VEC({R2.f1, R2.f2, R2.f3},{R1.f1, R1.f2, R1.f3})
else
    v_z={0,0,1}
end

--찾은 벡터를 베이스 z방향과 예각인 방향으로 갱신
if Calc_VectorDotProduct(v_z, {0,0,1}) < 0 then
    v_z[1] = -v_z[1]
    v_z[2] = -v_z[2]
    v_z[3] = -v_z[3]
end

--Y방향 계산
if (BL) and (BR) then --바닥용접선 직접교시 정보가 있는경우 
    --양 끝 직접교시데이터로 벡터 만듬
    v_y = CALC_TWO_POINT_TO_UNIT_VEC({BR.f1, BR.f2, BR.f3},{BL.f1, BL.f2, BL.f3})
elseif (L2) and (R2) then --바닥용접선정보는 없고 좌우 수직정보는 있는경우
    --양쪽 수직 직접교시데이터에서 높이정보는 제외하고 x,y 방향만 따옴
    v_y = CALC_TWO_POINT_TO_UNIT_VEC({L2.f1, L2.f2, 0},{R2.f1, R2.f2, 0})
else
    v_y={0,1,0}
end

--찾은 벡터를 베이스 y방향과 예각인 방향으로 갱신
if Calc_VectorDotProduct(v_y, {0,1,0}) < 0 then
    v_y[1] = -v_y[1]
    v_y[2] = -v_y[2]
    v_y[3] = -v_y[3]
end

if Perpendicular==0 then --수직격자가 아니면 Z축, Y축 x,y성분은 절반만 반영함
    v_z = CALC_UNIT_VEC({v_z[1]/2, v_z[2]/2, v_z[3]})
    v_y = CALC_UNIT_VEC({v_y[1]/2, v_y[2]/2, v_y[3]})
end

--위에서 구한 y,z와 수직한 x방향 구함. 여기서 y,z는 수직한 상태가 아님
v_x = CALC_UNIT_VEC(CALC_VEC_CROSS(v_y, v_z))
v_y = CALC_UNIT_VEC(CALC_VEC_CROSS(v_z, v_x))
v_y = CALC_UNIT_VEC(v_y)
R_Rmatrix = {v_x[1], v_y[1], v_z[1],
             v_x[2], v_y[2], v_z[2],
             v_x[3], v_y[3], v_z[3]}



-- 구한 왼쪽, 중간, 오른쪽 회전매트릭스 방향으로 각 터치방향 갱신
axis_Mx = {M_Rmatrix[1], M_Rmatrix[4], M_Rmatrix[7]}
axis_My = {M_Rmatrix[2], M_Rmatrix[5], M_Rmatrix[8]}
axis_Mz = {M_Rmatrix[3], M_Rmatrix[6], M_Rmatrix[9]}
axis_Lx = {L_Rmatrix[1], L_Rmatrix[4], L_Rmatrix[7]}
axis_Ly = {L_Rmatrix[2], L_Rmatrix[5], L_Rmatrix[8]}
axis_Lz = {L_Rmatrix[3], L_Rmatrix[6], L_Rmatrix[9]}
axis_Rx = {R_Rmatrix[1], R_Rmatrix[4], R_Rmatrix[7]}
axis_Ry = {R_Rmatrix[2], R_Rmatrix[5], R_Rmatrix[8]}
axis_Rz = {R_Rmatrix[3], R_Rmatrix[6], R_Rmatrix[9]}

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



--기준자세 갱신. 위에서 구한 좌,우,중앙 회전행렬로 각 자세 회전시킴
LIBFILLET:Rotate_LV_DefaultPose(L_Rmatrix)
LIBFILLET:Rotate_H_DefaultPose(M_Rmatrix)
LIBFILLET:Rotate_RV_DefaultPose(R_Rmatrix)


-----------------------------------------------------------------------------------
--여기 밑으로는 테스트코드. 제대로 자세가 회전했는지 확인하는용도임
-----------------------------------------------------------------------------------
testpose1 = RPD_CLONE(POSE_TCP_L_U_MOVE)
testpose2 = RPD_CLONE(POSE_TCP_B_LL)
testpose3 = RPD_CLONE(POSE_TCP_B_RR)
testpose4 = RPD_CLONE(POSE_TCP_R_U_MOVE)

if BL then
    testpose2 = RPD_CLONE(BL) 
    testpose1 = RPD_CLONE(BL) 
    testpose1.f3 = testpose1.f3+400
end
if BR then 
    testpose3 = RPD_CLONE(BR) 
    testpose4 = RPD_CLONE(BR)
    testpose4.f3 = testpose4.f3+400
end
if L1 then testpose2 = RPD_CLONE(L1) end
if R1 then testpose3 = RPD_CLONE(R1) end
if L2 then testpose1 = RPD_CLONE(L2) end
if R2 then testpose4 = RPD_CLONE(R2) end

TABLE_SET("ppp", "double", Perpendicular)
TABLE_SET_ARRAY("M_Rmatrix", "double", 9, M_Rmatrix)
TABLE_SET_ARRAY("L_Rmatrix", "double", 9, L_Rmatrix)
TABLE_SET_ARRAY("R_Rmatrix", "double", 9, R_Rmatrix)
--LIBFILLET:DefaultPoseMoveTest(testpose1, testpose2, testpose3, testpose4)

--테스트코드 끝 -------------------------------------------------------------------------