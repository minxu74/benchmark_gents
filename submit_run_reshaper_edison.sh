#!/usr/bin/env bash

#SBATCH -q debug
#SBATCH -N 1
#SBATCH -t 00:30:00
#SBATCH -J benchmark_ncclimo
#SBATCH -o my_job.o%j
#SBATCH -A m2467


cd /global/cscratch1/sd/minxu/tmp/test_ncclimo/reshaper/test

inpdir=/global/cscratch1/sd/minxu/archive/F_acmev03_enso_ne30_knl_cesmmach_co2cyc_pmpet_25yr_climpac/lnd/hist/

/bin/rm -f /global/homes/m/minxu/scratch/tmp/test_ncclimo/reshaper/test/data2/*.nc
s2smake --output_prefix="/global/homes/m/minxu/scratch/tmp/test_ncclimo/reshaper/test/data2/testpyreshaper_" \
        --output_suffix="000101-002712.nc" -m "time" -m "time_bounds" \
        --time_series="ALT,AR,BTRAN,CH4PROD,DENIT,EFLX_LH_TOT,ELAI,ER,ESAI,FAREA_BURNED,\
FCEV,FCH4,FCH4TOCO2,FCOV,FCTR,FGEV,FGR,FGR12,FH2OSFC,FINUNDATED,FIRA,FIRE,FLDS,FPG,FPI,\
FPSN,FROST_TABLE,FSA,FSAT,FSDS,FSH,FSM,FSNO,FSR,F_DENIT,F_NIT,GPP,\
GROSS_NMIN,H2OSFC,H2OSNO,HR,HTOP,LAND_USE_FLUX,LEAFC,FROOTC,NDEP_TO_SMINN,NBP,NEE,NEP,\
NET_NMIN,NFIX_TO_SMINN,NPP,Q2M,QCHARGE,QDRAI,QOVER,QRUNOFF,QRGWL,QSNOMELT,\
QSOIL,QVEGE,QVEGT,RAIN,RH2M,SMIN_NO3,SMIN_NH4,SNOW,SNOWDP,SNOWICE,SNOWLIQ,SNOW_DEPTH,\
SNOW_SINKS,SNOW_SOURCES,SOMHR,TG,TSA,TSAI,TLAI,TV,QBOT,TBOT,\
AGNPP,FROOTC_ALLOC,LEAFC_ALLOC,WOODC_ALLOC,WOOD_HARVESTC,\
CH4_SURF_AERE_SAT,CH4_SURF_AERE_UNSAT,CH4_SURF_DIFF_SAT,\
CH4_SURF_DIFF_UNSAT,CH4_SURF_EBUL_SAT,CONC_CH4_SAT,\
CONC_CH4_UNSAT,FCH4_DFSAT,MR,TOTCOLCH4,ZWT_CH4_UNSAT,\
FSDSND,FSDSNI,FSDSVD,FSDSVI,\
TWS,VOLR,WA,ZWT_PERCH,ZWT,WIND,COL_FIRE_CLOSS,\
F_DENIT_vr,F_NIT_vr,H2OSOI,O_SCALAR,SOILICE,SOILLIQ,SOILPSI,TLAKE,TSOI,T_SCALAR,W_SCALAR,\
SOIL1N,SOIL2N,SOIL3N,SOIL1C,SOIL2C,SOIL3C,TOTVEGC,TOTVEGN,TOTECOSYSC,TOTLITC,TOTLITC_1m,TOTLITN_1m,TOTSOMC,TOTSOMC_1m,TOTSOMN_1m,CWDC,PBOT"\
        --specfile=reshape.s2s $inpdir/*.clm2.h0.25[78]*.nc $inpdir/*.clm2.h0.259[0-6]-*.nc
srun -n 24 -N 1 s2srun --verbosity=0 reshape.s2s 
