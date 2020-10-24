setlocal enableDelayedExpansion 

@echo off

ECHO Copying foils to destination dirs

set FOILDIR=C:\foiljpg

set MODDIR=%FOILDIR%\modifiers
set CHARDIR=%FOILDIR%\characters
set SITEDIR=%FOILDIR%\sites
set RINGDIR=%FOILDIR%\rings

set FOTRDIR=%FOILDIR%\fotr
set MOMDIR=%FOILDIR%\mom
set ROTELDIR=%FOILDIR%\rotel
set TTDIR=%FOILDIR%\ttt
set BOHDDIR=%FOILDIR%\bohd
set EOFDIR=%FOILDIR%\eof
set ROTKDIR=%FOILDIR%\rotk
set SOGDIR=%FOILDIR%\sog
set MDDIR=%FOILDIR%\md
set REFDIR=%FOILDIR%\ref

set SHDIR=%FOILDIR%\sh
set BRDIR=%FOILDIR%\br
set BLDIR=%FOILDIR%\bll
set HUDIR=%FOILDIR%\hu
set ROSDIR=%FOILDIR%\ros
set TDDIR=%FOILDIR%\td

set EMEDIR=%FOILDIR%\eme
set WRDIR=%FOILDIR%\wc
set AEDIR=%FOILDIR%\ae
set FADIR=%FOILDIR%\fa
set TADIR=%FOILDIR%\ta
set KADIR=%FOILDIR%\ka
set SADIR=%FOILDIR%\sa
set PROMODIR=%FOILDIR%\promo
set SPECDIR=%FOILDIR%\special


for /F %%x in ('dir /B/D %MODDIR%') do (
  set "str=%%x"
  If NOT "!str!"=="!str:fotr=!" (
	xcopy /y %MODDIR%\!str! %FOTRDIR%
  ) else If NOT "!str!"=="!str:mom=!" (
	xcopy /y %MODDIR%\!str! %MOMDIR%
  ) else If NOT "!str!"=="!str:rotel=!" (
	xcopy /y %MODDIR%\!str! %ROTELDIR%
  ) else If NOT "!str!"=="!str:ttt=!" (
	xcopy /y %MODDIR%\!str! %TTDIR%
  ) else If NOT "!str!"=="!str:bohd=!" (
	xcopy /y %MODDIR%\!str! %BOHDDIR%
  ) else If NOT "!str!"=="!str:eof=!" (
	xcopy /y %MODDIR%\!str! %EOFDIR%
  ) else If NOT "!str!"=="!str:rotk=!" (
	xcopy /y %MODDIR%\!str! %ROTKDIR%
  ) else If NOT "!str!"=="!str:sog=!" (
	xcopy /y %MODDIR%\!str! %SOGDIR%
  ) else If NOT "!str!"=="!str:md=!" (
	xcopy /y %MODDIR%\!str! %MDDIR%
  ) else If NOT "!str!"=="!str:ref=!" (
	xcopy /y %MODDIR%\!str! %REFDIR%
  ) else If NOT "!str!"=="!str:sh=!" (
	xcopy /y %MODDIR%\!str! %SHDIR%
  ) else If NOT "!str!"=="!str:br=!" (
	xcopy /y %MODDIR%\!str! %BRDIR%
  ) else If NOT "!str!"=="!str:bll=!" (
	xcopy /y %MODDIR%\!str! %BLDIR%
  ) else If NOT "!str!"=="!str:hu=!" (
	xcopy /y %MODDIR%\!str! %HUDIR%
  ) else If NOT "!str!"=="!str:ros=!" (
	xcopy /y %MODDIR%\!str! %ROSDIR%
  ) else If NOT "!str!"=="!str:td=!" (
	xcopy /y %MODDIR%\!str! %TDDIR%
  ) else If NOT "!str!"=="!str:eme=!" (
	xcopy /y %MODDIR%\!str! %EMEDIR%
  ) else If NOT "!str!"=="!str:wc=!" (
	xcopy /y %MODDIR%\!str! %WRDIR%
  ) else If NOT "!str!"=="!str:ae=!" (
	xcopy /y %MODDIR%\!str! %AEDIR%
  ) else If NOT "!str!"=="!str:fa=!" (
	xcopy /y %MODDIR%\!str! %FADIR%
  ) else If NOT "!str!"=="!str:ta=!" (
	xcopy /y %MODDIR%\!str! %TADIR%
  ) else If NOT "!str!"=="!str:ka=!" (
	xcopy /y %MODDIR%\!str! %KADIR%
  ) else If NOT "!str!"=="!str:sa=!" (
	xcopy /y %MODDIR%\!str! %SADIR%
  ) else If NOT "!str!"=="!str:promo=!" (
	xcopy /y %MODDIR%\!str! %PROMODIR%
  ) else If NOT "!str!"=="!str:special=!" (
	xcopy /y %MODDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:master=!" (
	xcopy /y %MODDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:psq=!" (
	xcopy /y %MODDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:vip=!" (
	xcopy /y %MODDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:bid=!" (
	xcopy /y %MODDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:me=!" (
	xcopy /y %MODDIR%\!str! %SPECDIR%
  )
)

for /F %%x in ('dir /B/D %CHARDIR%') do (
  set "str=%%x"
  If NOT "!str!"=="!str:fotr=!" (
	xcopy /y %CHARDIR%\!str! %FOTRDIR%
  ) else If NOT "!str!"=="!str:mom=!" (
	xcopy /y %CHARDIR%\!str! %MOMDIR%
  ) else If NOT "!str!"=="!str:rotel=!" (
	xcopy /y %CHARDIR%\!str! %ROTELDIR%
  ) else If NOT "!str!"=="!str:ttt=!" (
	xcopy /y %CHARDIR%\!str! %TTDIR%
  ) else If NOT "!str!"=="!str:bohd=!" (
	xcopy /y %CHARDIR%\!str! %BOHDDIR%
  ) else If NOT "!str!"=="!str:eof=!" (
	xcopy /y %CHARDIR%\!str! %EOFDIR%
  ) else If NOT "!str!"=="!str:rotk=!" (
	xcopy /y %CHARDIR%\!str! %ROTKDIR%
  ) else If NOT "!str!"=="!str:sog=!" (
	xcopy /y %CHARDIR%\!str! %SOGDIR%
  ) else If NOT "!str!"=="!str:md=!" (
	xcopy /y %CHARDIR%\!str! %MDDIR%
  ) else If NOT "!str!"=="!str:ref=!" (
	xcopy /y %CHARDIR%\!str! %REFDIR%
  ) else If NOT "!str!"=="!str:sh=!" (
	xcopy /y %CHARDIR%\!str! %SHDIR%
  ) else If NOT "!str!"=="!str:br=!" (
	xcopy /y %CHARDIR%\!str! %BRDIR%
  ) else If NOT "!str!"=="!str:bll=!" (
	xcopy /y %CHARDIR%\!str! %BLDIR%
  ) else If NOT "!str!"=="!str:hu=!" (
	xcopy /y %CHARDIR%\!str! %HUDIR%
  ) else If NOT "!str!"=="!str:ros=!" (
	xcopy /y %CHARDIR%\!str! %ROSDIR%
  ) else If NOT "!str!"=="!str:td=!" (
	xcopy /y %CHARDIR%\!str! %TDDIR%
  ) else If NOT "!str!"=="!str:eme=!" (
	xcopy /y %CHARDIR%\!str! %EMEDIR%
  ) else If NOT "!str!"=="!str:wc=!" (
	xcopy /y %CHARDIR%\!str! %WRDIR%
  ) else If NOT "!str!"=="!str:ae=!" (
	xcopy /y %CHARDIR%\!str! %AEDIR%
  ) else If NOT "!str!"=="!str:fa=!" (
	xcopy /y %CHARDIR%\!str! %FADIR%
  ) else If NOT "!str!"=="!str:ta=!" (
	xcopy /y %CHARDIR%\!str! %TADIR%
  ) else If NOT "!str!"=="!str:ka=!" (
	xcopy /y %CHARDIR%\!str! %KADIR%
  ) else If NOT "!str!"=="!str:sa=!" (
	xcopy /y %CHARDIR%\!str! %SADIR%
  ) else If NOT "!str!"=="!str:promo=!" (
	xcopy /y %CHARDIR%\!str! %PROMODIR%
  ) else If NOT "!str!"=="!str:special=!" (
	xcopy /y %CHARDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:master=!" (
	xcopy /y %CHARDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:psq=!" (
	xcopy /y %CHARDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:vip=!" (
	xcopy /y %CHARDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:bid=!" (
	xcopy /y %CHARDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:me=!" (
	xcopy /y %CHARDIR%\!str! %SPECDIR%
  )
)

for /F %%x in ('dir /B/D %SITEDIR%') do (
  set "str=%%x"
  If NOT "!str!"=="!str:fotr=!" (
	xcopy /y %SITEDIR%\!str! %FOTRDIR%
  ) else If NOT "!str!"=="!str:mom=!" (
	xcopy /y %SITEDIR%\!str! %MOMDIR%
  ) else If NOT "!str!"=="!str:rotel=!" (
	xcopy /y %SITEDIR%\!str! %ROTELDIR%
  ) else If NOT "!str!"=="!str:ttt=!" (
	xcopy /y %SITEDIR%\!str! %TTDIR%
  ) else If NOT "!str!"=="!str:bohd=!" (
	xcopy /y %SITEDIR%\!str! %BOHDDIR%
  ) else If NOT "!str!"=="!str:eof=!" (
	xcopy /y %SITEDIR%\!str! %EOFDIR%
  ) else If NOT "!str!"=="!str:rotk=!" (
	xcopy /y %SITEDIR%\!str! %ROTKDIR%
  ) else If NOT "!str!"=="!str:sog=!" (
	xcopy /y %SITEDIR%\!str! %SOGDIR%
  ) else If NOT "!str!"=="!str:md=!" (
	xcopy /y %SITEDIR%\!str! %MDDIR%
  ) else If NOT "!str!"=="!str:ref=!" (
	xcopy /y %SITEDIR%\!str! %REFDIR%
  ) else If NOT "!str!"=="!str:sh=!" (
	xcopy /y %SITEDIR%\!str! %SHDIR%
  ) else If NOT "!str!"=="!str:br=!" (
	xcopy /y %SITEDIR%\!str! %BRDIR%
  ) else If NOT "!str!"=="!str:bll=!" (
	xcopy /y %SITEDIR%\!str! %BLDIR%
  ) else If NOT "!str!"=="!str:hu=!" (
	xcopy /y %SITEDIR%\!str! %HUDIR%
  ) else If NOT "!str!"=="!str:ros=!" (
	xcopy /y %SITEDIR%\!str! %ROSDIR%
  ) else If NOT "!str!"=="!str:td=!" (
	xcopy /y %SITEDIR%\!str! %TDDIR%
  ) else If NOT "!str!"=="!str:eme=!" (
	xcopy /y %SITEDIR%\!str! %EMEDIR%
  ) else If NOT "!str!"=="!str:wc=!" (
	xcopy /y %SITEDIR%\!str! %WRDIR%
  ) else If NOT "!str!"=="!str:ae=!" (
	xcopy /y %SITEDIR%\!str! %AEDIR%
  ) else If NOT "!str!"=="!str:fa=!" (
	xcopy /y %SITEDIR%\!str! %FADIR%
  ) else If NOT "!str!"=="!str:ta=!" (
	xcopy /y %SITEDIR%\!str! %TADIR%
  ) else If NOT "!str!"=="!str:ka=!" (
	xcopy /y %SITEDIR%\!str! %KADIR%
  ) else If NOT "!str!"=="!str:sa=!" (
	xcopy /y %SITEDIR%\!str! %SADIR%
  ) else If NOT "!str!"=="!str:promo=!" (
	xcopy /y %SITEDIR%\!str! %PROMODIR%
  ) else If NOT "!str!"=="!str:special=!" (
	xcopy /y %SITEDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:master=!" (
	xcopy /y %SITEDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:psq=!" (
	xcopy /y %SITEDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:vip=!" (
	xcopy /y %SITEDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:bid=!" (
	xcopy /y %SITEDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:me=!" (
	xcopy /y %SITEDIR%\!str! %SPECDIR%
  )
)

for /F %%x in ('dir /B/D %RINGDIR%') do (
  set "str=%%x"
  If NOT "!str!"=="!str:fotr=!" (
	xcopy /y %RINGDIR%\!str! %FOTRDIR%
  ) else If NOT "!str!"=="!str:mom=!" (
	xcopy /y %RINGDIR%\!str! %MOMDIR%
  ) else If NOT "!str!"=="!str:rotel=!" (
	xcopy /y %RINGDIR%\!str! %ROTELDIR%
  ) else If NOT "!str!"=="!str:ttt=!" (
	xcopy /y %RINGDIR%\!str! %TTDIR%
  ) else If NOT "!str!"=="!str:bohd=!" (
	xcopy /y %RINGDIR%\!str! %BOHDDIR%
  ) else If NOT "!str!"=="!str:eof=!" (
	xcopy /y %RINGDIR%\!str! %EOFDIR%
  ) else If NOT "!str!"=="!str:rotk=!" (
	xcopy /y %RINGDIR%\!str! %ROTKDIR%
  ) else If NOT "!str!"=="!str:sog=!" (
	xcopy /y %RINGDIR%\!str! %SOGDIR%
  ) else If NOT "!str!"=="!str:md=!" (
	xcopy /y %RINGDIR%\!str! %MDDIR%
  ) else If NOT "!str!"=="!str:ref=!" (
	xcopy /y %RINGDIR%\!str! %REFDIR%
  ) else If NOT "!str!"=="!str:sh=!" (
	xcopy /y %RINGDIR%\!str! %SHDIR%
  ) else If NOT "!str!"=="!str:br=!" (
	xcopy /y %RINGDIR%\!str! %BRDIR%
  ) else If NOT "!str!"=="!str:bll=!" (
	xcopy /y %RINGDIR%\!str! %BLDIR%
  ) else If NOT "!str!"=="!str:hu=!" (
	xcopy /y %RINGDIR%\!str! %HUDIR%
  ) else If NOT "!str!"=="!str:ros=!" (
	xcopy /y %RINGDIR%\!str! %ROSDIR%
  ) else If NOT "!str!"=="!str:td=!" (
	xcopy /y %RINGDIR%\!str! %TDDIR%
  ) else If NOT "!str!"=="!str:eme=!" (
	xcopy /y %RINGDIR%\!str! %EMEDIR%
  ) else If NOT "!str!"=="!str:wc=!" (
	xcopy /y %RINGDIR%\!str! %WRDIR%
  ) else If NOT "!str!"=="!str:ae=!" (
	xcopy /y %RINGDIR%\!str! %AEDIR%
  ) else If NOT "!str!"=="!str:fa=!" (
	xcopy /y %RINGDIR%\!str! %FADIR%
  ) else If NOT "!str!"=="!str:ta=!" (
	xcopy /y %RINGDIR%\!str! %TADIR%
  ) else If NOT "!str!"=="!str:ka=!" (
	xcopy /y %RINGDIR%\!str! %KADIR%
  ) else If NOT "!str!"=="!str:sa=!" (
	xcopy /y %RINGDIR%\!str! %SADIR%
  ) else If NOT "!str!"=="!str:promo=!" (
	xcopy /y %RINGDIR%\!str! %PROMODIR%
  ) else If NOT "!str!"=="!str:special=!" (
	xcopy /y %RINGDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:master=!" (
	xcopy /y %RINGDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:psq=!" (
	xcopy /y %RINGDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:vip=!" (
	xcopy /y %RINGDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:bid=!" (
	xcopy /y %RINGDIR%\!str! %SPECDIR%
  ) else If NOT "!str!"=="!str:me=!" (
	xcopy /y %RINGDIR%\!str! %SPECDIR%
  )
)

PAUSE
