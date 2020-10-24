setlocal enableDelayedExpansion 

@echo off
ECHO Running LOTR TCG foilmaker sequence

set BASEDIR=C:\base

set MODDIR=%BASEDIR%\modifiers
set CHARDIR=%BASEDIR%\characters
set SITEDIR=%BASEDIR%\sites
set RINGDIR=%BASEDIR%\rings

for /F %%x in ('dir /B/D %MODDIR%') do (
  ECHO %%x 
  python foilmaker.py lotrtcg_modifier C:/foil/modifiers/ %MODDIR%/%%x
)

for /F %%x in ('dir /B/D %CHARDIR%') do (
  python foilmaker.py lotrtcg_character C:/foil/characters/ %CHARDIR%/%%x
)

for /F %%x in ('dir /B/D %SITEDIR%') do (
  python foilmaker.py lotrtcg_site C:/foil/sites/ %SITEDIR%/%%x
)

for /F %%x in ('dir /B/D %RINGDIR%') do (
  python foilmaker.py lotrtcg_ring C:/foil/rings/ %RINGDIR%/%%x
)

PAUSE
