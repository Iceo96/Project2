@echo on
echo ==== CI Script Started ====
:: Step 1: go to root directory
cd c:\ci
rmdir /q /s Project2

:: Step 2: Clone Git Repositry
git clone https://github.com/Iceo96/Project2.git

:: Step 2: Check if HTML exists
if exist C:\ci\Project2\Project1.php (
    echo HTML file exists.
) else (
    echo ERROR: HTML file missing!
    exit /b 1
)

:: Step 3: Copy files to XAMPP test server
if not exist C:\xampp\htdocs\test\project2 (
    mkdir C:\xampp\htdocs\test\project2
)

xcopy C:\ci\Project2\Project1.php C:\xampp\htdocs\test\project2\ /Y

echo ==== CI Script Finished ====
pause
