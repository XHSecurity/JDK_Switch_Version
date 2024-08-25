@echo off
echo.
echo.
echo  运行前请检查环境变量配置
echo  Config部分的配置为实际JDK环境位置
echo.
echo.
echo  程序下载地址
echo  https://github.com/XHSecurity/JDK_Switch_Version
echo.
echo.


rem --- Base Config 配置JDK的安装目录 ---
:init 
set JAVA_HOME8=C:\Program Files\Java\jdk1.8.0_202
set JAVA_HOME17=C:\Program Files\Java\jdk-17.0.4.1
:start 
echo ============================
echo ==== 当前使用的JDK版本 =====
echo ============================
java -version 
echo. 
echo ================================
echo ===== 当前已安装的JDK版本  =====
echo ================================
echo --------------------------------
echo -- 序号 ---------- JDK版本 -----
echo --------------------------------
echo --  1   ----------- JDK8 ------- 
echo --------------------------------
echo --  2   ----------- JDK17 ------
echo --------------------------------
echo.
:select
set /p opt=选择JDK版本，请输入你选择版本对应的序号：
if %opt%==1 (
    set TARGET_JAVA_HOME=%JAVA_HOME8%
)
if %opt%==2 (
    set TARGET_JAVA_HOME=%JAVA_HOME17%
)

echo.
echo 当前选择的Java路径:%TARGET_JAVA_HOME%
echo.

wmic ENVIRONMENT where "name='JAVA_HOME'" delete
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%TARGET_JAVA_HOME%"

rem -- refresh env ---
call "C:\Users\xhsecurity\Downloads\JDK多版本切换配置\SwitchVersion V1.0\RefreshEnv.exe"

echo.
echo.
echo 请按任意键退出程序!   
echo.
pause>nul

@echo on
