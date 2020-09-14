setlocal enableDelayedExpansion 

@echo off
ECHO Running LOTR TCG foilmaker sequence

set MODDIR=C:\base\modifiers
set CHARDIR=C:\base\characters
set SITEDIR=C:\base\sites
set RINGDIR=C:\base\rings

for /F %%x in ('dir /B/D %MODDIR%') do (
  ECHO %%x 
  python foilmaker.py lotrtcg_modifier C:/foil/modifiers/ C:/base/modifiers/%%x
)

for /F %%x in ('dir /B/D %CHARDIR%') do (
  python foilmaker.py lotrtcg_character C:/foil/characters/ C:/base/characters/%%x
)

for /F %%x in ('dir /B/D %SITEDIR%') do (
  python foilmaker.py lotrtcg_site C:/foil/sites/ C:/base/sites/%%x
)

for /F %%x in ('dir /B/D %RINGDIR%') do (
  python foilmaker.py lotrtcg_ring C:/foil/rings/ C:/base/rings/%%x
)

PAUSE

