-- Unlimited military factories per line (unlimited_mil_factories_hoi4)
-- Raises the number of military factories one equipment production line can take.
-- Vanilla (1.19.3): MAX_MIL_FACTORIES_PER_LINE = 150, RAILWAY_GUN_MAX_MIL_FACTORIES_PER_LINE = 5
-- The "zzz_" prefix makes this file load after other defines files, so it wins.
-- Equipment with its own max_military_factories would ignore this define; the mod's DLL makes the
-- game ignore that key instead, so every equipment uses the value below.

NDefines.NProduction.MAX_MIL_FACTORIES_PER_LINE = 999
NDefines.NProduction.RAILWAY_GUN_MAX_MIL_FACTORIES_PER_LINE = 999
