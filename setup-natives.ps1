$ErrorActionPreference = "Stop"

Write-Host "=== Copper Native Library Extractor ===" -ForegroundColor Cyan

$gradleCache = "$env:USERPROFILE\.gradle\caches\modules-2\files-2.1"
$nativeDir = Join-Path $PSScriptRoot "libs\natives"

# Make sure destination exists
New-Item -ItemType Directory -Force $nativeDir | Out-Null

Write-Host "[1/4] Searching Gradle cache..." -ForegroundColor Yellow

$nativeJars = Get-ChildItem `
    -Path $gradleCache `
    -Recurse `
    -Filter "*-natives-windows.jar" `
    -File

if ($nativeJars.Count -eq 0) {
    Write-Host "ERROR: No Windows native JARs found." -ForegroundColor Red
    exit 1
}

Write-Host "Found $($nativeJars.Count) native JAR(s)." -ForegroundColor Green

# Find Java's jar executable
$javaJar = Get-Command jar -ErrorAction SilentlyContinue

if (-not $javaJar) {
    Write-Host "ERROR: 'jar.exe' was not found in PATH." -ForegroundColor Red
    Write-Host "Make sure JDK 25 is installed and JAVA_HOME/PATH is configured." -ForegroundColor Yellow
    exit 1
}

Write-Host "[2/4] Extracting native libraries..." -ForegroundColor Yellow

$tempRoot = Join-Path $env:TEMP "Copper-Natives"

if (Test-Path $tempRoot) {
    Remove-Item $tempRoot -Recurse -Force
}

New-Item -ItemType Directory -Force $tempRoot | Out-Null

foreach ($jar in $nativeJars) {

    Write-Host "  -> $($jar.Name)" -ForegroundColor Gray

    $tempDir = Join-Path $tempRoot ([guid]::NewGuid().ToString())

    New-Item -ItemType Directory -Force $tempDir | Out-Null

    Push-Location $tempDir

    try {
        & $javaJar.Source xf $jar.FullName

        if ($LASTEXITCODE -ne 0) {
            Write-Host "     FAILED" -ForegroundColor Red
            continue
        }
    }
    finally {
        Pop-Location
    }
}

Write-Host "[3/4] Copying DLLs..." -ForegroundColor Yellow

$dlls = Get-ChildItem `
    -Path $tempRoot `
    -Recurse `
    -Filter "*.dll" `
    -File

if ($dlls.Count -eq 0) {
    Write-Host "ERROR: No DLLs were found inside the native JARs." -ForegroundColor Red
    exit 1
}

foreach ($dll in $dlls) {

    $destination = Join-Path $nativeDir $dll.Name

    Copy-Item `
        -Path $dll.FullName `
        -Destination $destination `
        -Force

    Write-Host "  + $($dll.Name)" -ForegroundColor Green
}

Write-Host "[4/4] Cleaning temporary files..." -ForegroundColor Yellow

Remove-Item $tempRoot -Recurse -Force

Write-Host ""
Write-Host "=== DONE ===" -ForegroundColor Cyan
Write-Host "Extracted $($dlls.Count) DLL(s)." -ForegroundColor Green
Write-Host "Destination: $nativeDir" -ForegroundColor Gray