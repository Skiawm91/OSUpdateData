@echo off
cd ..\..\etc
call info.bat
call ver.bat
echo ========================================
echo : Sakura系統資訊v2.00                :x:
echo ========================================
echo :                                      
echo :           電腦名稱: %home%           
echo :           系統型號: OneOS            
echo :           版本: %ver2%               
echo :           組建: %ver%                
echo :           通道: %osdata%             
echo :           啟用狀態: %keys%           
echo :           狀態: %copyorno%         
echo ========================================
echo.%taskbar%
echo.
pause
cls