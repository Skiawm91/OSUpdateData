color %themelod%
echo ========================================
echo :          Sakura系統資訊v2.00         :
echo ========================================
echo :                                     
echo : 電腦名稱: %home%           
echo : 系統型號: OneOS            
echo : 版本: %ver2%               
echo : 組建: "%ver%"                
echo : 通道: %osdata%             
echo : 啟用狀態: %keys%           
echo : 狀態: %copyorno%      
echo :   
echo ========================================
echo :        :                             :
echo :        :             %date% :
echo :        :                             :
call Button 1 13 %buttonc% "Menu" 31 9 %buttonc% " OK " X _Var_Box _Var_Hover
%getbutton% /M %_Var_Box% /H %_Var_Hover%
cls