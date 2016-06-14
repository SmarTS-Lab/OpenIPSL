within iPSL.Electrical.Machines.Eurostag;
model DYNModelM2S_INIT "Initialization model for synchronous mahine M2S.
                  Developed by RTE and adapted by AIA. 2014/03/10"
  Modelica.Blocks.Interfaces.RealOutput pin_CM;
  Modelica.Blocks.Interfaces.RealOutput pin_EFD;
  Modelica.Blocks.Interfaces.RealOutput pin_LAMBDAF;
  Modelica.Blocks.Interfaces.RealOutput pin_LAMBDAD;
  Modelica.Blocks.Interfaces.RealOutput pin_LAMBDAQ1;
  Modelica.Blocks.Interfaces.RealOutput pin_LAMBDAQ2;
  Modelica.Blocks.Interfaces.RealOutput pin_LAMBDAAD;
  Modelica.Blocks.Interfaces.RealOutput pin_LAMBDAAQ;
  Modelica.Blocks.Interfaces.RealOutput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealOutput pin_TETA;
  Modelica.Blocks.Interfaces.RealOutput pin_IQ;
  Modelica.Blocks.Interfaces.RealOutput pin_ID;
  Modelica.Blocks.Interfaces.RealOutput pin_UR;
  Modelica.Blocks.Interfaces.RealOutput pin_UI;
  Modelica.Blocks.Interfaces.RealOutput pin_TerminalVoltage;
  Modelica.Blocks.Interfaces.RealOutput pin_FieldCurrent;
  Modelica.Blocks.Interfaces.RealOutput pin_ActivePowerPNALT;
  Modelica.Blocks.Interfaces.RealOutput pin_ActivePowerPN;
  Modelica.Blocks.Interfaces.RealOutput pin_ActivePowerSNREF;
  Modelica.Blocks.Interfaces.RealOutput pin_ReactivePowerPNALT;
  Modelica.Blocks.Interfaces.RealOutput pin_ReactivePowerPN;
  Modelica.Blocks.Interfaces.RealOutput pin_ReactivePowerSNREF;
  Modelica.Blocks.Interfaces.RealOutput pin_Current;
  Modelica.Blocks.Interfaces.RealOutput pin_ActivePowerSN;
  Modelica.Blocks.Interfaces.RealOutput pin_ReactivePowerSN;
  //external parameters
  parameter Real XD "Direct reactance";
  parameter Real XPD "Direct trans. reactance";
  parameter Real XSD "Direct subtrans. reactance";
  parameter Real TPD0 "Direct trans. time const";
  parameter Real TSD0 "Direct subtrans. time const";
  parameter Real TX "Damping time constant";
  parameter Real XQ "Quadrat reactance";
  parameter Real XPQ "Quadrat trans. reactance";
  parameter Real XSQ "Quadrat subtrans. reactance";
  parameter Real TPQ0 "Quadrat trans. time const";
  parameter Real TSQ0 "Quadrat subtrans. time const";
  parameter Real IENR;
  parameter Real SNREF;
  parameter Real SN;
  //  puissance apparente nominale (SNOMG)
  parameter Real PN;
  parameter Real PNALT;
  parameter Real sNTfo = if transformerIncluded then 100 else 0;
  parameter Real ur0;
  parameter Real ui0;
  parameter Real p0;
  parameter Real q0;
   parameter Boolean transformerIncluded = false;
  parameter Real uNResTfo = if  transformerIncluded then 24   else 0;
  parameter Real uNomNw = if  transformerIncluded then 24  else 0;
  parameter Real uNMacTfo = if  transformerIncluded then 400 else 0;
  parameter Real uBMac = if  transformerIncluded then 400 else 0;
  parameter Real rTfoIn = if  transformerIncluded then 0  else 0;
  parameter Real xTfoIn = if  transformerIncluded then 0.136 else 0;
  parameter Real nDSat;
  //(fixed = false);
  parameter Real nQSat;
  //(fixed = false);
  parameter Real mDSatIn;
  //(fixed = false);
  parameter Real mQSatIn;
  //(fixed = false);
  parameter Real rStatIn;
  parameter Real lStatIn;
  parameter Real omega_0;
  parameter Real pPuWLMDV;
  parameter Real ONE=1;
  parameter Real mrc=0;
  parameter Real PI=3.14159265;
  parameter Integer IWLMDV=3;
  parameter Boolean Saturated=true;
  iPSL.Electrical.Machines.Eurostag.PwExtIntParameters extern(
    rStatIn_=rStatIn,
    lStatIn_=lStatIn,
    xDPu_=XD,
    xpDPu_=XPD,
    xppDPu_=XSD,
    tpDO_=TPD0,
    tppDO_=TSD0,
    xQPu_=XQ,
    xpQPu_=XPQ,
    xppQPu_=XSQ,
    tpQO_=TPQ0,
    tppQO_=TSQ0,
    tX_=TX,
    IENR=IENR);
  // INTERNAL PARAMETERS (COMPUTED) per-unit in the machine SN base.
  parameter Real mD0Pu=extern.mD0Pu_ "d axis mutual inductance p.u. in the machine SN base";
  parameter Real mQ0Pu=extern.mQ0Pu_ "q axis mutual inductance p.u. in the machine SN base";
  //parameter Real pNom(fixed = false);
  parameter Real lDPu=extern.lD "d axis damper winding leakage p.u. in the machine SN base";
  parameter Real rRotIn=extern.rf "Rotor resistance p.u. in the machine SN base";
  parameter Real lRotIn=extern.lf "Rotor leakage p.u. in the machine SN base";
  parameter Real rQ1Pu=extern.rQ1 "q axis damper 1 winding resistance p.u. in the machine SN base";
  parameter Real lQ1Pu=extern.lQ1 "q axis damper 1 winding leakeage p.u. in the machine SN base";
  parameter Real rQ2Pu=extern.rQ2 "q axis damper 2 winding resistance p.u. in the machine SN base";
  parameter Real lQ2Pu=extern.lQ2 "q axis damper 2 winding leakeage p.u. in the machine SN base";
  parameter Real mCanPu=extern.mrc "CANAY's inductance p.u. in the machine SN base";
  //parameter Real omega0(fixed=false);
  // Computed parameters
  parameter Real yScaleNom=SNREF/SN;
  // YSCALE
  parameter Real rStatNom=rStatIn*yScaleNom;
  // YI = RESARM * YSCALE;
  parameter Real lStatNom=lStatIn*yScaleNom;
  // YLAMDI = READST * YSCALE
  parameter Real lQINom=lStatIn*yScaleNom;
  // YLQI = REAQST avec REAQST=READST (puing1.f)
  parameter Real mQ0Nom=mQ0Pu*yScaleNom;
  // YMQI = FMUQST(INB2) * YSCALE (YMQINS)
  parameter Real mD0Nom=mD0Pu*yScaleNom;
  // YMDI = FMUDST(INB2) * YSCALE (YMDINS)
  parameter Real urNom=1.0;
  // YE
  parameter Real uiNom=0.0;
  // YF
  parameter Real qPuWLMDV=(SN^2 - pPuWLMDV^2)^(1/2);
  // QUNIT (pucalif.f)
  parameter Real pNomWLMDV=pPuWLMDV/SNREF;
  // YPG (pucalif.f)
  parameter Real qNomWLMDV=qPuWLMDV/SNREF;
  // YQG (pucalif.f)
  parameter Real irNom=pNomWLMDV*urNom + qNomWLMDV*uiNom;
  // YIR (pucalif.f)
  parameter Real iiNom=pNomWLMDV*uiNom - qNomWLMDV*urNom;
  // YII
  parameter Real omegaNom=1.0;
  // OMEGA
  parameter Real rTfoNom=0.0;
  // YTI
  parameter Real xTfoNom=0.0;
  // YXTI
  // per unitage complementaire, calcul de rrTfo (puingc.f)
  // ------------------------------------------------------
  parameter Real ri=if  transformerIncluded then uNResTfo/uNomNw/(uNMacTfo/uBMac) else 1.;
  parameter Real rs=if  transformerIncluded then (uNResTfo/uNomNw)^2*SNREF/sNTfo else 1.;
  parameter Real mSalNom=mD0Nom - mQ0Nom;
  parameter Real xQNom0=mQ0Nom + lQINom;
  parameter Real tetaNomNum0=uiNom + omegaNom*(xTfoNom + xQNom0)*irNom + (rTfoNom + rStatNom)*iiNom;
  parameter Real tetaNomDenom0=urNom + (rTfoNom + rStatNom)*irNom - omegaNom*(xTfoNom + xQNom0)*iiNom;
  parameter Real lambdaADNom0=-(urNom + (rStatNom + rTfoNom)*irNom + omegaNom*(lStatNom + xTfoNom)*(-iiNom))/omegaNom;
  parameter Real lambdaAQNom0=((-uiNom) + (rStatNom + rTfoNom)*(-iiNom) - omegaNom*(lQINom + xTfoNom)*irNom)/omegaNom;
  parameter Real lambdaADNom20=lambdaADNom0*lambdaADNom0;
  parameter Real lambdaAQNom20=lambdaAQNom0*lambdaAQNom0;
  Real u2(start=1.0);
  Real tetaNomNum(start=tetaNomNum0);
  Real tetaNomDenom(start=tetaNomDenom0);
  Real tetaNom(start=0);
  Real iDNom(start=-iiNom);
  Real iQNom(start=irNom);
  // YIQ
  Real uDNom(start=-uiNom);
  // YUD
  Real uQNom(start=urNom);
  // YUQ
  Real lambdaADNom(start=lambdaADNom0);
  // YLAMAD
  Real lambdaAQNom(start=lambdaAQNom0);
  // YLAMAQ
  Real lambdaADNom2(start=lambdaADNom0*lambdaADNom0);
  // YV72
  Real lambdaAQNom2(start=lambdaAQNom0*lambdaAQNom0);
  // YV82
  Real ENom2(start=lambdaADNom20 + lambdaAQNom20);
  // YNN2
  Real mDSNom;
  // YXADS
  Real mQSNom;
  // YXAQS
  Real cosNuNom2;
  // YCODQ2
  Real sinNuNom2;
  // YSIDQ2
  Real mINom;
  // YMC
  Real mDNom(start=mD0Nom);
  // YMDI / YMDINS
  Real mQNom(start=mQ0Nom);
  // YMQI / YMQINS
  Real ifNom(start=1.0);
  Real mDVPu(start=1.0);
  Real rStat(start=rStatIn);
  Real lStat(start=lStatIn);
  Real lD(start=lDPu);
  Real lQI(start=lStatIn);
  Real lRot(start=lRotIn);
  Real mQ0(start=mQ0Pu);
  Real lQ1(start=lQ1Pu);
  Real lQ2(start=lQ2Pu);
  Real mD0(start=mD0Pu);
  Real mCan(start=mCanPu);
  Real xQ;
  // YXQ  = mQ + lQI
  Real teta0Num;
  // YNUM
  Real teta0Denom;
  // YDENOM
  Real uD0(start=-ui0);
  // YUD
  Real uQ0(start=ur0);
  // YUQ
  Real lambdaAD02;
  // YV72
  Real lambdaAQ02;
  // YV82
  Real E02;
  // YNN2
  Real cosNu2;
  // YCODQ2
  Real sinNu2;
  // YSIDQ2
  Real mD(start=mD0Pu);
  // YMDINS
  Real mQ(start=mQ0Pu);
  // YMQINS
  Real if0(start=1.0);
  Real DET(start=1.0);
  Real u1r(start=ur0);
  Real u1i(start=ui0);
  Real mSal;
  // YMSAL
  // variables conservées par le compilateur:
  // ---------------------------------------
  parameter Real ir0_0=p0*ur0 + q0*ui0;
  parameter Real ii0_0=p0*ui0 - q0*ur0;
  Real ir0(start=ir0_0);
  Real ii0(start=ii0_0);
  Real mDSat(start=mDSatIn);
  Real mQSat(start=mQSatIn);
  Real xQNom(start=xQNom0);
  Real yScale(start=SNREF/SN);
  Real rrTfo(start=ri);
  Real rTfo(start=rTfoIn*rs);
  Real xTfo(start=xTfoIn*rs);
  parameter Real xQ0=mQ0Pu - lStatIn;
  Real mDV(start=1.0);
  Real teta0(start=0.0);
  // YTETA = ATAN2(YNUM,YDENOM)
  Real tetaInterne0(start=0.0);
  Real iD0(start=-ii0_0);
  // YID
  Real iQ0(start=ir0_0);
  // YIQ
  parameter Real lambdaAD0_0=-(ur0 + (rStatIn + rTfoIn)*ir0_0 + (lStatIn + xTfoIn)*(-ii0_0))/omega_0;
  parameter Real lambdaAQ0_0=((-ui0) + (rStatIn + rTfoIn)*(-ii0_0) - (lStatIn + xTfoIn)*ir0_0)/omega_0;
  Real lambdaAD0(start=lambdaAD0_0);
  // YLAMAD
  Real lambdaAQ0(start=lambdaAQ0_0);
  // YLAMAQ
  parameter Real E0_0=(lambdaAD0_0*lambdaAD0_0 + lambdaAQ0_0*lambdaAQ0_0)^(1/2);
  Real E0(start=E0_0);
  Real mDS0(start=1.0);
  // YXADS
  Real mQS0(start=1.0);
  // YXAQS
  Real mI0(start=1.0);
  // YMC
  Real lambdaQ10(start=1.0);
  Real lambdaQ20(start=1.0);
  Real lambdaD0(start=1.0);
  // YLAMD
  Real lambdaF0(start=1.0);
  // YLAMF
  Real cm0(start=1.0);
  Real efd0(start=1.0);
  Real lMD0(start=1.0);
  Real lMQ0(start=1.0);
  Real mD_0(start=1.0);
  Real mQ_0(start=1.0);
  Real urReg0(start=ur0);
  Real uiReg0(start=ui0);
  Real ir;
  Real ii;
equation
  // per unitage des donnees d'entree
  // --------------------------------
  //  - (ur0Nw, ui0Nw) en kV*Ub/Un -> (ur0, ui0) en kV/Un
  //  - (p0Nw, q0Nw)   en MW/MVAr  -> (p0, q0)   en MW/MVAr/SNREF
  //                               -> (ir0, ii0) en kA*Un/SNREF
  u2 = ur0*ur0 + ui0*ui0;
  // YN = YE*YE + YF*YF
  ONE*ir0 = (p0*ur0 + q0*ui0)/u2;
  // YIR
  ONE*ii0 = (p0*ui0 - q0*ur0)/u2;
  // YII
  ONE*rrTfo = ri;
  // YRI = RTFO
  ONE*rTfo = rTfoIn*rs;
  // RESTFO(INB3) = RESTFO(INB3) * YS
  ONE*xTfo = xTfoIn*rs;
  // REATFO(INB3) = REATFO(INB3) * YS
  ONE*mDSat = mDSatIn/ri^nDSat;
  // RMD
  ONE*mQSat = mQSatIn/ri^nQSat;
  // RMQ
  // calcul de WLMDV (FMUDMA) (pucalif.f)
  // ------------------------------------
  //{
  xQNom = mQNom + lQINom;
  // YXQ
  tetaNomNum = uiNom + omegaNom*(xTfoNom + xQNom)*irNom + (rTfoNom + rStatNom)*iiNom;
  // YNUM
  tetaNomDenom = urNom + (rTfoNom + rStatNom)*irNom - omegaNom*(xTfoNom + xQNom)*iiNom;
  // YDENOM
  //tetaNom = atan2(tetaNomNum,tetaNomDenom); // YTETA
  tetaNom = 2*atan(tetaNomNum/(sqrt(tetaNomNum*tetaNomNum + tetaNomDenom*tetaNomDenom) + tetaNomDenom));
  iDNom = sin(tetaNom)*irNom - cos(tetaNom)*iiNom;
  // YID
  iQNom = cos(tetaNom)*irNom + sin(tetaNom)*iiNom;
  // YIQ
  uDNom = sin(tetaNom)*urNom - cos(tetaNom)*uiNom;
  // YUD
  uQNom = cos(tetaNom)*urNom + sin(tetaNom)*uiNom;
  // YUQ
  lambdaADNom = -(uQNom + (rStatNom + rTfoNom)*iQNom + omegaNom*(lStatNom + xTfoNom)*iDNom)/omegaNom;
  // YLAMAD
  lambdaAQNom = (uDNom + (rStatNom + rTfoNom)*iDNom - omegaNom*(lQINom + xTfoNom)*iQNom)/omegaNom;
  // YLAMAQ
  lambdaADNom2 = lambdaADNom*lambdaADNom;
  // YV72
  lambdaAQNom2 = lambdaAQNom*lambdaAQNom;
  // YV82
  ENom2 = lambdaADNom2 + lambdaAQNom2;
  // YNN2
  mDSNom = mD0Nom/(1. + mDSat*ENom2^(nDSat/2.));
  // YXADS
  mQSNom = mQ0Nom/(1. + mQSat*ENom2^(nQSat/2.));
  // YXAQS
  cosNuNom2 = lambdaADNom2/ENom2;
  // YCODQ2
  sinNuNom2 = lambdaAQNom2/ENom2;
  // YSIDQ2
  mINom = mDSNom*cosNuNom2 + mQSNom*sinNuNom2;
  // YMC
  mDNom = mINom + mSalNom*sinNuNom2;
  mQNom = mINom - mSalNom*cosNuNom2;
  //}
  ifNom = lambdaADNom/mDNom - iDNom;
  // YRIF
  //mDVPu = -1. / (ifNom * yScaleNom); // FMUDMA (calcule dans puingc.f)
  if Saturated == false and IWLMDV == 2 then
    mDVPu = mD0Pu;
  elseif Saturated == true and IWLMDV == 2 then
    mDVPu = mD0Pu/(1 + mDSatIn);
  elseif IWLMDV == 1 then
    mDVPu = mD0Pu;
  else
    mDVPu = -1./(ifNom*yScaleNom);
    // FMUDMA (calcule dans puingc.f)
  end if;
  // per unitage de parametres (park2.f)
  // -----------------------------------
  ONE*yScale = if  transformerIncluded then SNREF/SN*rrTfo*rrTfo else SNREF/SN;
  // YSCALE
  rStat = rStatIn*yScale;
  // YI = RESARM * yScale;
  lStat = lStatIn*yScale;
  // YLAMDI = READST * yScale
  lD = lDPu*yScale;
  // YLDI = READDI * YSCALE
  lQI = lStatIn*yScale;
  // YLQI = REAQST avec REAQST=READST (puing1.f)
  lRot = lRotIn*yScale;
  // YLFI = lRotIn * yScale;
  mQ0 = mQ0Pu*yScale;
  // YMQI = FMUQST(INB2) * YSCALE (YMQINS)
  lQ1 = lQ1Pu*yScale;
  // YLQ1I
  lQ2 = lQ2Pu*yScale;
  // YLQ2I
  mD0 = mD0Pu*yScale;
  // YMDI = FMUDST(INB2) * YSCALE (YMDINS)
  ONE*mDV = mDVPu*yScale;
  // YMDIM
  mCan = mCanPu*yScale;
  // YMRCI = mCan * yScale;
  // calcul des valeurs initiales des variables machine (park2.f)
  // ------------------------------------------------------------
  mSal = mD0 - mQ0;
  //{
  xQ = mQ + lQI;
  // YXQ  = mQ + lQI
  teta0Num = ui0 + omega_0*(xTfo + xQ)*ir0 + (rTfo + rStat)*ii0;
  // YNUM
  teta0Denom = ur0 + (rTfo + rStat)*ir0 - omega_0*(xTfo + xQ)*ii0;
  // YDENOM
  //expression ange moitié
  //ONE*teta0 = atan2(teta0Num ,teta0Denom); // YTETA = ATAN2(YNUM,YDENOM)
  ONE*teta0 = 2*atan(teta0Num/(sqrt(teta0Num*teta0Num + teta0Denom*teta0Denom) + teta0Denom));
  ONE*iD0 = sin(teta0)*ir0 - cos(teta0)*ii0;
  // YID
  ONE*iQ0 = cos(teta0)*ir0 + sin(teta0)*ii0;
  // YIQ
  uD0 = sin(teta0)*ur0 - cos(teta0)*ui0;
  // YUD
  uQ0 = cos(teta0)*ur0 + sin(teta0)*ui0;
  // YUQ
  // expression angle moitié
  //ONE*tetaInterne0 = atan2(uD0,uQ0);
  ONE*tetaInterne0 = 2*atan(uD0/(sqrt(uD0*uD0 + uQ0*uQ0) + uQ0));
  ONE*lambdaAD0 = -(uQ0 + (rStat + rTfo)*iQ0 + (lStat + xTfo)*iD0)/omega_0;
  // YLAMAD
  ONE*lambdaAQ0 = (uD0 + (rStat + rTfo)*iD0 - (lQI + xTfo)*iQ0)/omega_0;
  // YLAMAQ
  lambdaAD02 = lambdaAD0*lambdaAD0;
  // YV72
  lambdaAQ02 = lambdaAQ0*lambdaAQ0;
  // YV82
  E02 = lambdaAD02 + lambdaAQ02;
  // YNN2
  ONE*E0 = sqrt(E02);
  ONE*mDS0 = mD0/(1. + mDSat*E02^(nDSat/2));
  // YXADS
  ONE*mQS0 = mQ0/(1. + mQSat*E02^(nQSat/2));
  // YXAQS
  cosNu2 = lambdaAD02/E02;
  // YCODQ2
  sinNu2 = lambdaAQ02/E02;
  // YSIDQ2
  ONE*mI0 = mDS0*cosNu2 + mQS0*sinNu2;
  // YMC
  mD = mI0 + mSal*sinNu2;
  mQ = mI0 - mSal*cosNu2;
  //}
  if0 = lambdaAD0/mD - iD0;
  // YRIF
  ONE*lambdaQ10 = lambdaAQ0;
  ONE*lambdaQ20 = lambdaAQ0;
  ONE*lambdaD0 = lambdaAD0 + mCan*if0;
  // YLAMD
  ONE*lambdaF0 = lambdaAD0 + (lRot + mCan)*if0;
  // YLAMF
  ONE*cm0 = ((-lambdaAD0*iQ0) + lambdaAQ0*iD0)*SNREF/PN;
  // YCM
  ONE*efd0 = -mDV*if0/rrTfo;
  // YEFD = - YMDIM * YRIF / YRI
  DET = lRot*lD + mCan*(lRot + lD);
  ONE*lMD0 = lambdaAD0/(iD0 + lD*lambdaF0/DET + lRot*lambdaD0/DET);
  ONE*lMQ0 = lambdaAQ0/(iQ0 + lambdaQ10/lQ1 + lambdaQ20/lQ2);
  ONE*mD_0 = mDS0;
  ONE*mQ_0 = mQS0;
  // calcul du ureg0
  u1r = ur0 + rTfo*ir0 - xTfo*ii0;
  u1i = ui0 + rTfo*ii0 + xTfo*ir0;
  ONE*urReg0 = 1/rrTfo*u1r;
  ONE*uiReg0 = 1/rrTfo*u1i;
  ir = -(sin(pin_TETA)*pin_ID + cos(pin_TETA)*pin_IQ);
  ii = -((-cos(pin_TETA)*pin_ID) + sin(pin_TETA)*pin_IQ);
  pin_TerminalVoltage = sqrt((pin_UR - rTfo*ir + xTfo*ii)*(pin_UR - rTfo*ir + xTfo*ii) + (pin_UI - rTfo*ii - xTfo*ir)*(pin_UI - rTfo*ii - xTfo*ir))*1/rrTfo;
  pin_CM = cm0;
  pin_EFD = efd0;
  pin_LAMBDAF = lambdaF0;
  pin_LAMBDAD = lambdaD0;
  pin_LAMBDAQ1 = lambdaQ10;
  pin_LAMBDAQ2 = lambdaQ20;
  pin_LAMBDAAD = lambdaAD0;
  pin_LAMBDAAQ = lambdaAQ0;
  pin_OMEGA = omega_0;
  pin_TETA = teta0;
  pin_IQ = iQ0;
  pin_ID = iD0;
  pin_UR = ur0;
  pin_UI = ui0;
  pin_ActivePowerPN = (pin_UR*(-ir) + pin_UI*(-ii))*SNREF/PN;
  if PNALT == 0 then
    pin_ActivePowerPNALT = 0;
    pin_ReactivePowerPNALT = 0;
  else
    pin_ActivePowerPNALT = (pin_UR*(-ir) + pin_UI*(-ii))*SNREF/PNALT;
    pin_ReactivePowerPNALT = (pin_UI*(-ir) - pin_UR*(-ii))*SNREF/PNALT;
  end if;
  pin_ActivePowerSNREF = pin_UR*(-ir) + pin_UI*(-ii);
  pin_ReactivePowerPN = (pin_UI*(-ir) - pin_UR*(-ii))*SNREF/PN;
  pin_ReactivePowerSNREF = pin_UI*(-ir) - pin_UR*(-ii);
  pin_Current = sqrt(ir*ir + ii*ii);
  //ActivePower SN
  pin_ActivePowerSN = (pin_UR*(-ir) + pin_UI*(-ii))*SNREF/SN;
  //ReactivePower SN
  pin_ReactivePowerSN = (pin_UI*(-ir) - pin_UR*(-ii))*SNREF/SN;
  //Field Current
  if mDSatIn == 0 and mQSatIn == 0 and nDSat == 0 and nQSat == 0 then
    pin_FieldCurrent = -mDV/rrTfo*((mD0 + lD + mrc)*pin_LAMBDAF - (mD0 + mrc)*pin_LAMBDAD - mD0*lD*pin_ID)/((mD0 + mrc)*(lRot + lD) + lRot*lD);
  else
    pin_FieldCurrent = -mDV/rrTfo*((lD + mrc)*pin_LAMBDAF - mrc*pin_LAMBDAD - lD*pin_LAMBDAAD)/(mrc*(lRot + lD) + lRot*lD);
  end if;
  annotation (Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end DYNModelM2S_INIT;
