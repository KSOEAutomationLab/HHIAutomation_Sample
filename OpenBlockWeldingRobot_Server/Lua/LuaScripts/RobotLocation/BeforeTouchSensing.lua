-- 터치센싱 시작 전 실행되는 스크립트
-- 여기에서는 터치센싱 할건지 안할건지 HMI 입력에 따라 터치센싱스크립트 1번 호출 수행

DTOFF()
WireCutOX = DI_GET(128)
DirSearch = DI_GET(130)

-- 이게 트루이면 터치 후 찾은 위치로 이동한뒤 복귀함
TouchResultCheck = false

if (WireCutOX == 1) then EXECUTE("1") end

