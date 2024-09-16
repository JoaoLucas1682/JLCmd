

@echo off
chcp 65001 >nul
echo Iniciando o JLCmd... 
setlocal
:adminprocess
echo Inicializando
NET SESSION >NUL 2>&1
if %errorLevel% == 0 (
  goto startprompt
  echo. Erro: O JLCmd parou de funcionar
  timeout -t -1 /nobreak
) else (

 goto adminrun
)

:adminrun
echo Tentando executar como administrador...
call :runAsAdmin
echo. Não foi possível executar no Adminstrador.
echo. Para executar como adminstrador, clique com o botão direito nesse arquivo, clique em Executar como adminstrador, e na janela UAC, clique no Sim, se pedir senha, coloque a senha, e pronto.
echo.
echo Pressione qualquer tecla para sair.
pause >nul
goto exit

:runAsAdmin
if exist "temp.vbs" del "temp.vbs"
(
echo Set UAC = CreateObject^("Shell.Application"^)
echo UAC.ShellExecute "cmd.exe", "/c %~nx0", "", "runas", 1
) > temp.vbs
cscript temp.vbs
timeout /t 3 /nobreak >nul
if exist "temp.vbs" del "temp.vbs"
goto startprompt

echo Inicializando recursos



goto startprompt

:startprompt
:: Config
set datever="2024.05.19 - 2024.06.16"
set verd="2024.06.16"
if exist "%temp%/_jlcmd" del %temp%\_jlcmd\*.* & ren %temp%\_jlcmd jlcmd-noused-%RANDOM%
mkdir %temp%/_jlcmd
set dirjc="%temp%/_jlcmd"
set sdrivedir=%systemdrive%\
SET "RootDir=%~d0" >> 7174.bat

COLOR 0F
:prompt
cls
title Adminstrador - Prompt de Comando JL
echo Bem-vindo ao Prompt de Comando JL 2024.06 (Versão Inicial)!
echo Digite 'help' para começar. Hoje é %date%
goto cmd
:cmd
echo.

set "choice=" & rem Esse comando aqui limpa o input do script 2024.05.20
set /p choice="$%USERNAME%@%CD%> "
if not defined choice (
    goto cmd
)
ver >nul
call :%choice% 2>nul || echo. Erro: Esse comando é inválido!
pause
goto cmd


:ver
echo. Prompt de Comando do Joao Lucas (CMDJL), feito em Batch
echo. Versão %verd%
goto cmd

:gidf
echo. Gerando uma pasta com número aleatório...
mkdir %RANDOM%
echo. [JLCmd] JLCmd criou uma pasta em %CD%
goto cmd

:help
echo Ajuda
echo. ------------- BASICO ---------- %datever%
echo ver: Mostrar a versão do CMDJL
echo exit: Saia do programa
echo clear: Limpar a tela
echo prompt: Limpa a tela e aparece o texto de início
echo ls: Lista todos os diretórios desta pasta
echo gidf: Gerar uma pasta de números aleatórios, como (%RANDOM%) 
echo mkdir: Cria diretórios 
echo drl: Apresenta um menu onde tem Desligar, Reiniciar ou Sair
echo cb: (Come Back), Volta um diretorio
echo cd: Vai para um diretório

echo shutdown: Desliga o PC em X segundos (X é o número onde você vai escolher)
echo restart: Reinicia o PC em X segundos (X é o número onde você vai escolher)

echo youtube: Acessa o site do YouTube no seu navegador
echo acesssite: Acessa a url do site que você colocar
echo listprog: Lista todos os programas instalados no seu computador
echo updprog: Atualiza todos os programas de uma vez só

echo tree: Exibe graficamente a estrutura de diretórios de uma unidade ou caminho.
echo exlistprog: Exporta uma lista completa de seus programas instalados no computador
echo color: Configura as cores padrão de primeiro plano e tela de fundo do console
echo title: Define o título da janela para uma sessão do %~nx0 (JLCmd)

 
echo crurl: Cria um Atalho da Internet para um site em só uma etapa

echo gamesnw: Procura jogos instalados do JLCmd
echo.

echo. ------------ AVANÇADO --------- %datever%
echo logcomptuer: Faz um arquivo com todos os detalhes possíveis do seu computador (em etapas)
echo tasklist: Listar programas em execução 
echo wificonnect: Conectar numa Rede
echo killtaskp: Fechar processo por PID
echo killtaskm: Fechar processo por nome de programa
echo repair: Reparar computador 
echo ruefi: Reinicia o PC para entrar na UEFI
echo systeminfo: Exibe a configuração e propriedades específicas da máquina.
echo systeminformation: A mesma coisa do comando systeminfo, mas exibe em texto.
echo gsinf: Gera um arquivo de texto em %userprofile%
echo.
echo ebdm: Abreviado (EnaBle Development Mode), Habilita recursos de desenvolvedor no computador (não recomendado)
echo. 


echo. ---- SUPER MEGA AVANÇADO ---- .....
REM super mega avançado foi criado em 16/06/2024
echo recoverymenu: Exibe uma lista de funções para a Recuperação do Windows

goto cmd
rem Basicos comandos

:mkdir
set "makedirs="
echo. Para usar, digite um ou mais nomes, por exemplo (jlcmd jlplugins jldata), e cada nome, o diretório será criado com os nomes, não use nomes com espaços, por exemplo: (Joao Lucas), mais sim, (JoaoLucas ou Joao_Lucas)

echo Digite um ou mais nomes aqui:

set /p makedirs="$%CD%>"

mkdir %makedirs%
goto cmd

:cb
echo Antes: %CD%
cd..
echo Agora: %CD%
goto cmd

:cd
echo Em que diretório você vai ir?
set "dircdinput="
set /p dircdinput="$%CD%::GoTo> "
echo Indo para %dircdinput%
cd %dircdinput%
set "dircdinput="
goto cmd


rem Outros

:gamesnw

if not exist %cd%\games (
echo A pasta de jogos do JLCmd não foi encontrada, Tente estas opções:

echo 1. Verifique se a pasta não foi movida, se ela foi movida, move esta pasta para %cd%\
echo 2. Veja se o JLCmd não foi corrompido,
echo  | Ou se você fechou o JLCmd forçado durante a instalação ou acabou a energia, entre outras.
echo  | Dica: Se aconteceu isto, reinstale o JLCmd com o programa de criar pendrive JLCmd, usando a segunda opção no programa.
echo 3. Verifique se você instalou e tá rodando o JLCmd no PenDrive o no seu disco.

echo Se nenhuma das opções resolver, verifique se você fez correto.
goto cmd
) else (
 goto gamesnw-home
)
goto cmd
:gamesnw-home
echo Aguarde, estamos preparando as coisas aqui...
echo Verificando a pasta
if not exist ".games\*" (
    echo A pasta de jogos está vazia.
) else (
    echo Detectamos arquivos na pasta de jogos
)
goto cmd
:repair

sfc /scannow
goto cmd

:killtaskp
set "ktpid="
set /p ktpid="PID>"
:ktpidconfir
echo. Tem certeza que deseja encerrar o processo %ktpid%? (Y/N)
set "ktpidconfirm="
set /p ktpidconfirm=">"
if /i "%ktpidconfirm%"=="Y" (
    echo Encerrando o processo...
    taskkill /F /PID %ktpid%
    set "ktpid="
    goto cmd
) else if /i "%ktpidconfirm%"=="N" (
  echo Recusando...
  set "ktpid="
  goto cmd
) else (
    echo Resposta inválida.
    goto ktpidconfir
    goto cmd
)
goto cmd

:killtaskm
set "ktmanl="
set /p ktmanl="Nome do processo>"
:ktmanlconfir
echo. Tem certeza que deseja encerrar o processo %ktmanl%? (Y/N)
set "ktmanlconfirm="
set /p ktmanlconfirm=">"
if /i "%ktmanlconfirm%"=="Y" (
    echo Encerrando o processo...
    taskkill /F /IM %ktmanl%
    set "ktmanl="
    goto cmd
) else if /i "%ktmanlconfirm%"=="N" (
  echo Recusando...
  set "ktmanl="
  goto cmd
) else (
    echo Resposta inválida.
    goto ktmanlconfir
    goto cmd
)
goto cmd

:wificonnect
cls
goto wificonnectinput

:wificonnectinput


set "wfssid="
set /p wfssid="SSID> "
set "wfpassword="
set /p wfpassword="Senha> "
goto wificonnectconfirm
:wificonnectconfirm

SSID: %wfssid%
Senha: %wfpassword%
echo. Tem certeza que está correto?
timeout -t 0
echo. Conectando a %wfssid%
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%password%
echo. Conectado a %ssid%



echo. Pronto

echo. 
goto cmd



:ls
echo. 
echo Diretorio: %CD%
echo.

dir


goto cmd

:crurl
echo Assistente para Atalhos da internet
echo -----------------------------------
echo Vamos te ajudar para criação de atalhos para
echo a internet.
echo Insere a URL do site para criar o atalho
set "awebsiteurl="
set /p awebsiteurl="$crurl::websiteurl> "
echo Criando o arquivo, o local dele será em %~dp0/Atalho_da_internet.url
echo (
[InternetShortcut]
IDList=
URL=%awebsiteurl%
IconIndex=13
IconFile=C:\Windows\System32\shell32.dll
) >> ./Atalho_Da_Internet.url
echo Processo concluído! Veja o arquivo no local que eu falei.
goto cmd

:clear
cls
goto cmd

:ren
echo. Diretorio: %CD%
echo JLRename 
set "namefrn=" & rem Esse comando aqui limpa o input do script 2024.05.20
set /p namefrn="Nome do arquivo (com extensão)> "
if not defined namefrn (
    goto cmd
)
set "rento=" & rem esse comando aqui limpa o input do script 2024.05.20
set /p rento="Novo nome com extensão> "
ver >nul
ren %namefrn% %rento%
pause
goto cmd



:drl
echo Escolha uma opção:
echo 1. Reiniciar
echo 2. Desligar
echo 3. Logout
echo 4. Cancelar

set "drlopt="
set /p drlopt="$%COMPTUERNAME%>"

if "%drlopt%"=="1" (
    echo Se você tem mais contas de usuario rodando nesse dispositivo, avise eles antes de prosseguir.
    echo Digite "reiniciar" (sem aspas) para prosseguir e pressione Enter
    set "rslg="
    set /p rslg=">"
    if %rslg%=="reiniciar" shutdown /r /t 0
    else goto cmd
) else if "%drlopt%"=="2" (
   echo Se você tem mais contas de usuario rodando nesse dispositivo, avise eles antes de prosseguir.
    echo Digite "desligar" (sem aspas) para prosseguir e pressione Enter
    set "dslg="
    set /p dslg=">"
    if %dslg%=="desligar" shutdown /r /t 0
    else goto cmd
) else if "%drlopt%"=="3" (
      echo Deseja sair dessa conta de usuário? (Y/N)
    set "lslg="
    set /p lslg=">"
    if "%lslg%"=="Y" shutdown /l
    if "%lslg%"=="y" shutdown /l
    if "%lslg%"=="N" goto cmd
    if "%lslg%"=="n" goto cmd
   echo. Erro: A letra que você inseriu está errada!
    goto cmd


) else if "%drlopt%"=="4" (
    echo. %USERNAME% cancelou o desligamento do dispositivo.
    goto cmd
    goto prompt
) else (
    echo Opção inválida, Escolha 1, 2, 3 ou 4
    goto drl
    echo. Erro: Não foi possível ser redirecionado pro menu, digite drl novamente.
    goto cmd
)
endlocal
:systeminformation
echo.
echo System Information
echo ------------------
echo Hostname: %COMPUTERNAME%
echo Local Username: %USERNAME%
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type"
echo.

echo Hardware Information
echo ------------------
echo CPU Info:
wmic cpu get name
echo.
echo RAM Info:
wmic memorychip get manufacturer
systeminfo | findstr /C:"Total Physical Memory"
echo.
echo Disk Drives:
wmic diskdrive get caption
setlocal enabledelayedexpansion

for /f "tokens=2 delims==" %%A in ('wmic diskdrive get size /value ^| find "Size"') do (
    set "size=%%A"
    set "sizeMB="
    for /f %%B in ('powershell -command "[math]::floor(!size! / (1024*1024))"') do set "sizeMB=%%B"
    echo Size in MB: !sizeMB!
)
endlocal
echo.
echo GPU Info:
dxdiag /t "%temp%\dxdiag_output.txt"
findstr /i "Chip Type: Memory: Approx. Total Memory:" "%temp%\dxdiag_output.txt"
del "%temp%\dxdiag_output.txt"
echo.
echo Checking internet availability...

ping google.com -n 1 > nul

if %errorlevel% == 0 (
    echo Internet is available. successfully pinged google.com.
) else (
    echo Internet is not available. failed to ping google.com.
)
echo.

setlocal
goto cmd

:logcomptuer
echo Bem-vindo ao assistente de criação de resumos de computadores
echo Aqui você cria um arquivo com todos os detalhes do seu computador, e aí você pode ver tudo desde do nome seu de usuário, nome do computador entre outros.
echo Etapa 1/4
echo Precisamos algumas informações o que você quer e o que você não quer.
echo Você quer que informações poucas sensíveis, como:
echo * Nome de usuário
echo * Informações da RAM (Mémoria do computador)
echo * Versão do Windows
echo * Internet ativa ou desativada
goto cmd

:shutdown
echo ATENÇÃO: Tenha certeza que o JLCmd esteja no adminstrador, e você também seja o adminstrador deste computador (%COMPTUERNAME%), se não o computador não vai desligar.
set "xsec="
echo Quantos segundos você precisa antes de desligar o computador? (deixe 1 para instantâneo)
set /p xsec="$shutdown> "

echo ATENÇÃO
echo Se você não salvar seu trabalho (ou se alguem está usando este computador), vai desligar o seu computador, perdendo todos os trabalhos não salvos, Por favor, avise para seus amigos que estão usando este computador.
echo Tem certeza que você vai desligar este computador em %xsec% segundos? (y/n)
set "desli="
set /p desli="$shutdown:%COMPTUERNAME%-%xsec%Seconds> "
call desli-%desli%
goto cmd

:desli-y
shutdown -s -t %xsec% -c "Desligamento do computador"
echo Não foi possivel desligar o computador.
goto cmd

:desli-n
echo. Recusado.
goto cmd

:restart
echo ATENÇÃO: Tenha certeza que o JLCmd esteja no adminstrador, e você também seja o adminstrador deste computador (%COMPTUERNAME%), se não o computador não vai reiniciar.
set "xsecr="
echo Quantos segundos você precisa antes de reiniciar o computador? (deixe 1 para instantâneo)
set /p xsecr="$restart> "

echo ATENÇÃO
echo Se você não salvar seu trabalho (ou se alguem está usando este computador), vai desligar o seu computador, perdendo todos os trabalhos não salvos, Por favor, avise para seus amigos que estão usando este computador.
echo Tem certeza que você vai reiniciar este computador em %xsec% segundos? (y/n)
set "reini="
set /p reini="$restart:%COMPTUERNAME%-%xsecr%Seconds> "
call desli-%reini%
goto cmd

:reini-y
shutdown -r -t %xsecr% -c "Reinicialização do computador"
echo Não foi possivel reiniciar o computador.
goto cmd

:reini-n
echo. Recusado.
goto cmd

:ruefi
echo Por favor, verifique se o prompt de comando está no adminstrador, se não o computador não vai na UEFI.

echo Deseja entrar na UEFI do seu computador? (y/n)
set "ruefit="
set /p ruefit="$ruefi::%COMPTUERNAME%> "

call ruefin-%ruefit%
goto cmd

:ruefin-y
shutdown /r /fw
echo Não foi possivel entrar na UEFI
goto cmd

:ruefin-n
echo. Recusado.
goto cmd

:acesssite
echo Digite a URL do Site (sem https://)
set "acsite="
set /p acsite="$acesssite> "

echo Abrindo %acsite%
start "" "https://%acsite%"
goto cmd

:listprog
winget list
goto cmd

:updprog
winget upgrade --all
goto cmd

:exlistprog
winget export -o listprog.json
echo. Para ver sua lista de programas em json, vá até o local %~dp0
goto cmd

:systeminfo
systeminfo
goto cmd

:tree
tree
goto cmd

:color
echo (
 Atributos de cor são especificados por DOIS dígitos hexadecimais. O primeiro
corresponde à cor de tela de fundo; o segundo à cor de primeiro plano. Cada
dígito pode ter apenas um dos seguintes valores:

    0 = Preto        8 = Cinza
    1 = Azul         9 = Azul claro
    2 = Verde        A = Verde claro
    3 = Verde-água   B = Verde-água claro
    4 = Vermelho     C = Vermelho claro
    5 = Roxo         D = Lilás
    6 = Amarelo      E = Amarelo claro
    7 = Branco       F = Branco brilhante

Caso nenhum argumento seja passado, este comando restaurará a cor de
antes do CMD.EXE ser executado. Este valor vem ou da janela atual do
console, ou da opção /T da linha de comando, ou do valor de DefaultColor
no Registro.

O comando COLOR altera ERRORLEVEL para 1 se for tentado se executar o
comando COLOR com as mesmas cores de primeiro plano e de tela de
fundo.
)

echo Digite o numero ou letra para aplicar para o texto
set "ppcolor="
set /p ppcolor="$color::textcolor> "

echo Digite o numero para aplicar pro plano de fundo
set "wppcolor="
set /p wppcolor="$color::wallpapercolor> "

echo Colorindo com base de seus numeros...
color %wppcolor%%ppcolor%

goto cmd

:youtube
echo Acessando o site www.youtube.com
start "" "https://www.youtube.com"
goto cmd


:gsinf
echo Iniciando o processo...
if exist %userprofile%/%COMPTUERNAME%-IS.txt (
 del /s /q %userprofile%/%COMPTUERNAME%-°°°info.txt
 echo >> %userprofile%/%COMPTUERNAME%-info.txt
)

echo Gerando arquivo...

echo ############################################################
echo ####                                                    ####
echo #######              %COMPTUERNAME% INFO             #######   
echo ####                                                    ####
echo ############################################################  
echo.
echo 


whoami > %COMPUTERNAME%-IS.txt
whoami /priv >> %COMPUTERNAME%-IS.txt
echo %username% >> %COMPUTERNAME%-IS.txt
net user >> %COMPUTERNAME%-IS.txt
cmdkey /list >> %COMPUTERNAME%-IS.txt


systeminfo >> %COMPUTERNAME%-IS.txt
getmac >> %COMPUTERNAME%-IS.txt
dir C:\ >> %COMPUTERNAME%-IS.txt
dir C:\Users >> %COMPUTERNAME%-IS.txt
dir C:\"Program Files" >> %COMPUTERNAME%-IS.txt
dir C:\"Program Files (x86)" >> %COMPUTERNAME%-IS.txt
tasklist >> %COMPUTERNAME%-IS.txt
wmic startup list full >> %COMPUTERNAME%-IS.txt


ipconfig /all >> %COMPUTERNAME%-IS.txt
net share >> %COMPUTERNAME%-IS.txt
ping 8.8.8.8 >> %COMPUTERNAME%-IS.txt
tracert 8.8.8.8 >> %COMPUTERNAME%-IS.txt
netsh lan show interfaces >> %COMPUTERNAME%-IS.txt
netsh wlan show networks mode=bssid >> %COMPUTERNAME%-IS.txt
netsh wlan show profiles >> %COMPUTERNAME%-IS.txt
netsh wlan export profile folder=. key=clear
netstat -ao >> %COMPUTERNAME%-IS.txt
net view >> %COMPUTERNAME%-IS.txt
arp -a >> %COMPUTERNAME%-IS.txt
ipconfig /displaydns >> %COMPUTERNAME%-IS.txt


wmic product get /format:csv > %COMPUTERNAME%-IS.csv
exit

goto cmd

rem Comandos de programas do Windows

:ipconfig
ipconfig
goto cmd

:systeminfo
systeminfo
goto cmd

:tasklist
tasklist
goto cmd


:ebmd
rem DeveloperMode
color 04
echo Pera aí, você optou para o Modo de Desenvolvimento do Windows
echo O Modo de desenvolvimento do Windows é uma ferramenta do JLCmd onde executa vários comandos para transformar seu computador em um ambiente de desenvolvimento e manutenção, mas o que você não pode fazer é:
echo Fechar o programa na metade do progresso
echo Desligar o PC antes do programa finalizar
echo Ter um Windows 11 Pro pirata

echo.
echo E você precisa ter esses requisitos mínimos:
echo Windows 11 Pro versão 23H2 (especificamente a compilação 22631.3527)
echo 8 GB de RAM
echo Conta de usuário de adminstrador
echo.
echo E mais uma coisa:
echo O JLCmd precisa rodar em adminstrador.


echo Inclusive tenha muita responsabilidade com o quê você está fazendo, pois não dá reverter esta situação. Antes, crie um ponto de restauração para caso se dar problema, você poderá voltar no ponto onde você estava. Nós não temos responsabilidade e suporte para caso danifique seu computador, porque a ferramenta não vai dar problema (caso você faça direito)
echo Você leu e tem esses requisitos e responsabilidades? (Y/N)
set "ebmd-ch="
set /p ebmd-ch="$developermode::%COMPTUERNAME%> "
if "%ebmd-ch%"=="Y" goto ebmd-dm
if "%ebmd-ch%"=="y" goto ebmd-dm
if "%ebmd-ch%"=="n" goto cmd
if "%ebmd-ch%"=="N" goto cmd
echo Opção inválida!
goto cmd


:ebmd-dm

reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul 2>&1
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul 2>&1
echo Modo Escuro foi ativado
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feed" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f >nul 2>&1
echo Noticias e interesses desativado
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode " /t REG_DWORD /d 2 /f >nul 2>&1
echo ID de Anúncio resetado e desabilitado
set "key=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows" >nul
reg add "%key%\WindowsUpdate" /v "" /t REG_SZ /d "" /f >nul
reg add "%key%\WindowsUpdate\AU" /v "" /t REG_SZ /d "" /f >nul
reg add "%key%\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul
echo Automatico Windows Update desabilitado
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f >nul 2>&1
echo Pesquisa do Bing desabilitada
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul 2>&1
echo Cortana desabilitada
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d 1 /f >nul 2>&1
echo Botão MeetNow foi desabilitado
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_DWORD /d 0 /f >nul 2>&1
echo Aceleração de mouse foi desabilitada
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f >nul 2>&1
echo Barra de pesquisa desabilitada
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
echo O download automático de aplicativos promovidos foi desativado.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
sc config DiagTrack start= disabledsc config dmwappushservice start= disabled >nul 2>&1
sc delete DiagTrack >nul 2>&1
sc delete dmwappushservice >nul 2>&1
echo A telemetria foi desativada.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f >nul 2>&1
echo O Explorer agora mostra extensões de arquivo.

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f >nul 2>&1
echo Explorer agora mostra arquivos ocultos.
powercfg -h off
echo A hibernação foi desativada.
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d 0 /f > nul 2>&1
echo A otimização de entrega foi desativada.
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /t REG_DWORD /d 1 /f > nul 2>&1
echo O serviço de localização foi desativado.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "Game DVR" /t REG_DWORD /d 1 /f >nul 2>&1
echo O Game DVR foi desativado.
del /q/f/s %TEMP%\* >nul 2>&1
echo Temp files have been deleted.
echo Interrompendo o serviço Windows Update...
net stop wuauserv >nul 2>&1

echo Limpando atualizações do Windows...
RD /S /Q "C:\Windows\SoftwareDistribution" >nul 2>&1

echo Limpeza concluída! Reativando o serviço Windows Update...
sc config wuauserv start=auto >nul 2>&1
net start wuauserv >nul 2>&1
echo O serviço Windows Update foi reativado.
echo Reiniciando o Explorer para aplicar algumas coisas
taskkill /f /im explorer.exe
start explorer.exe
echo Pronto! O Explorer foi atualizado
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Windows Defender" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Windows Defender" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "WindowsDefender" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f >nul 2>&1
echo O Windows Defender foi desativado!!!.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
echo E as mensagens de alerta de baixo disco foi desabilitada
echo.
echo Reinicie seu PC para aplicar os efeitos.
echo.
echo OK.
pause
goto cmd




:: super mega avançado
:recoverymenu
title Adminstrator - Recuperação do Windows (JLCmd)
ECHO ~~~~~~~~~~~ Recuperação do Windows ~~~~~~~~~~~~~
echo.
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO ~  1. Checar o setor de disco                  ~
ECHO ~  2. Abrir Windows Memory Diagnostic          ~
ECHO ~  3. Recuperação de disco                     ~
ECHO ~  4. Formatar seu disco de sistema (não recomendado)
ECHO ~  5. Criptografar unidade com o BitLocker     ~
ECHO ~  6. Abrir Defrag                             ~
ECHO ~  7. Abrir a Ferramenta de remoção de software Malicioso do Windows
echo ~  8. Tomar as medidas recomendadas do JLCmd   ~
echo ~  E. Sair do Menu de recuperação              ~
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SET ipsxr= & SET /p ipsxr= & IF /I "%ipsxr%"==" " GOTO :Menu
IF "%ipsxr%"==" " GOTO cmd
IF /I "%ipsxr%"=="1" chkdsk /F /R /X & GOTO cmd
IF /I "%ipsxr%"=="2" %SystemDrive%\Windows\system32\MDSched.exe & GOTO cmd
IF /I "%ipsxr%"=="3" recover %SystemDrive% & GOTO cmd
IF /I "%ipsxr%"=="4" format %SystemDrive% /FS:NTFS /X /P:2 & GOTO cmd
IF /I "%ipsxr%"=="5" %SystemDrive%\Windows\System32\BitLockerWizard.exe & GOTO cmd
IF /I "%ipsxr%"=="6" defrag /C /H /V & GOTO cmd
IF /I "%ipsxr%"=="7" %SystemDrive%/Windows/system32/MRT.exe & GOTO cmd
IF /I "%ipsxr%"=="8" goto rcovery-md
IF /I "%ipsxr%"=="E" GOTO cmd
goto cmd

:rcovery-md
echo Estas medidas de recomendadas vai ajudar MUITO seu PC, mas, você precisa ser um usuário que tenha os privilégios de adminstrador, (no caso ser o dono da sua organização ou ser um usuário que é adminstrador do PC).
echo Pressione Enter para continuar...
pause >nul
echo OK, vamos rodar as ferramentas, tome um café, brinque um pouco ou faça outras coisas no seu computador, depois de terminar o processo, reinicie o computador.
sfc /scannow


echo Criando o arquivo DISM_Repair.bat...
(
echo @echo off
echo echo Verificando a saúde da imagem do sistema...
echo DISM /Online /Cleanup-Image /CheckHealth
echo echo Escaneando a imagem do sistema em busca de corrupção...
echo DISM /Online /Cleanup-Image /ScanHealth
echo echo Tentando reparar a imagem do sistema...
echo DISM /Online /Cleanup-Image /RestoreHealth
echo if %%errorlevel%% neq 0 (
echo     echo Houve um erro ao reparar a imagem do sistema.
echo     echo Por favor, considere usar uma mídia de instalação do Windows para realizar o reparo.
echo ) else (
echo     echo A imagem do sistema foi reparada com sucesso.
echo )
echo pause
) > "%~dp0\DISM_Repair.bat"

echo Executando DISM_Repair.bat como administrador...
powershell -Command "Start-Process cmd -ArgumentList '/c %~dp0\DISM_Repair.bat' -Verb RunAs"

echo Deletando o arquivo DISM_Repair.bat...
del /s /q "%~dp0/DISM_Repair.bat"

echo Avisando para o %USERNAME% de %COMPTUERNAME% que terminou  o processo
echo MsgBox "O processo de reparo do sistema foi concluido! Reinicie o computador para aplicar os efeitos", 64, "RecoveryMenu - JLCmd" >> "%~dp0/msg0194.vbs"
echo Executando o arquivo VBS...
cscript //nologo "%~dp0/msg0194.vbs"
echo Deletando o arquivo VBS
del /s /q "%~dp0/msg0194.vbs"
goto cmd
:exit
echo Saindo...
endlocal
exit

