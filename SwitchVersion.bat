@echo off
echo.
echo.
echo  ����ǰ���黷����������
echo  Config���ֵ�����Ϊʵ��JDK����λ��
echo.
echo.
echo  �������ص�ַ
echo  https://github.com/XHSecurity
echo.
echo.


rem --- Base Config ����JDK�İ�װĿ¼ ---
:init 
set JAVA_HOME8=C:\Program Files\Java\jdk1.8.0_202
set JAVA_HOME17=C:\Program Files\Java\jdk-17.0.4.1
:start 
echo ============================
echo ==== ��ǰʹ�õ�JDK�汾 =====
echo ============================
java -version 
echo. 
echo ================================
echo ===== ��ǰ�Ѱ�װ��JDK�汾  =====
echo ================================
echo --------------------------------
echo -- ��� ---------- JDK�汾 -----
echo --------------------------------
echo --  1   ----------- JDK8 ------- 
echo --------------------------------
echo --  2   ----------- JDK17 ------
echo --------------------------------
echo.
:select
set /p opt=ѡ��JDK�汾����������ѡ��汾��Ӧ����ţ�
if %opt%==1 (
    set TARGET_JAVA_HOME=%JAVA_HOME8%
)
if %opt%==2 (
    set TARGET_JAVA_HOME=%JAVA_HOME17%
)

echo.
echo ��ǰѡ���Java·��:%TARGET_JAVA_HOME%
echo.

wmic ENVIRONMENT where "name='JAVA_HOME'" delete
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%TARGET_JAVA_HOME%"

rem -- refresh env ---
call "C:\Users\xhsecurity\Downloads\JDK��汾�л�����\SwitchVersion V1.0\RefreshEnv.exe"

echo.
echo.
echo �밴������˳�����!   
echo.
pause>nul

@echo on