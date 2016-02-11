within iPSL.Electrical.Machines.Eurostag;
model PwExtIntParameters "Transformation of external parameters to internal parameters for M2S synchronous machine.
                  2014/03/10"
  parameter Real omega0_=2*3.14159265*50;
  parameter Real epsilon=0.0000000001;
  //external parameters
  parameter Real rStatIn_;
  parameter Real lStatIn_ "stator leakage (READST)";
  parameter Real xDPu_ "direct reactance (FXD)";
  parameter Real xpDPu_ "direct transient reactance (FXPD)";
  parameter Real xppDPu_ "direct subtransient reactance (FXSD)";
  parameter Real tpDO_;
  parameter Real tppDO_;
  parameter Real xQPu_ "quadrature reactance";
  parameter Real xpQPu_ "transient reactance quadrature";
  parameter Real xppQPu_ "subtransient reactance quadrature";
  parameter Real tpQO_;
  parameter Real tppQO_;
  parameter Real tX_;
  parameter Real IENR;
  //axis d
  parameter Real tpd=xpDPu_*tpDO_/xDPu_;
  parameter Real tppd=xppDPu_*tppDO_/xpDPu_;
  parameter Real B1d=(tpDO_ + tppDO_)*omega0_;
  parameter Real B2d=(tpd + tppd)*omega0_;
  parameter Real C1d=tpDO_*tppDO_*omega0_*omega0_;
  parameter Real C2d=tpd*tppd*omega0_*omega0_;
  parameter Real mD0Pu_=xDPu_ - lStatIn_;
  parameter Real wtx=omega0_*tX_;
  parameter Real Ad=(xDPu_*B2d - lStatIn_*B1d)/mD0Pu_;
  parameter Real Bd=if tX_ > 0 then (xDPu_*C2d - lStatIn_*C1d)/mD0Pu_ else C2d - C1d*lStatIn_/xDPu_;
  parameter Real Cd=xDPu_*(B1d - B2d)/mD0Pu_*mD0Pu_;
  parameter Real Dd=(C1d - C2d)/(B1d - B2d);
  parameter Real denom1=(Dd*Ad - Dd*Dd - Bd)*Cd;
  parameter Real denom2=Dd*Cd*Ed;
  parameter Real xd=mD0Pu_*lStatIn_/xDPu_;
  parameter Real Pd=B1d/mD0Pu_ - B2d/xd;
  parameter Real Qd=1/xd - 1/mD0Pu_;
  parameter Real determ=1 - 4*Bd*lStatIn_*Qd*Qd/(xd*Pd*Pd);
  parameter Real rad=sqrt(determ);
  parameter Real V1d=-0.5*Pd*(1 + rad)/Qd;
  parameter Real V2d=-0.5*Pd*(1 - rad)/Qd;
  parameter Real denom3=xd*V1d;
  parameter Real U1d=Bd*lStatIn_/denom3;
  parameter Real denom4=xd*V2d;
  parameter Real U2d=Bd*lStatIn_/denom4;
  parameter Real Z1d=Bd*lStatIn_ + mD0Pu_*(B2d + Pd/Qd)*V1d;
  parameter Real Z2d=Bd*lStatIn_ + mD0Pu_*(B2d + Pd/Qd)*V2d;
  parameter Real denom5=(U1d - V1d)*mD0Pu_;
  parameter Real E1d=(C1d - Z1d/xd)/denom5;
  parameter Real denom6=(U2d - V2d)*mD0Pu_;
  parameter Real E2d=(C1d - Z2d/xd)/denom6;
  parameter Real rf1d=1/E1d;
  parameter Real rf2d=1/E2d;
  parameter Real alf=(tpd*mD0Pu_ - tpDO_*xd)/(tpDO_ - tpd);
  parameter Real arf=(mD0Pu_ + alf)/(tpDO_*omega0_);
  parameter Real err1d=abs(arf - rf1d);
  parameter Real err2d=abs(arf - rf2d);
  parameter Real Vd=if err1d < err2d then V1d else V2d;
  parameter Real Ud=if err1d < err2d then U1d else U2d;
  parameter Real Ed=if tX_ > 0 then Cd*rf - 1 elseif err1d < err2d then E1d else E2d;
  parameter Real rf=if tX_ > 0 then (Ad*Dd + wtx*wtx - 2*wtx*Dd - Bd)/denom1 elseif err1d < err2d then rf1d else rf2d;
  parameter Real Fd=(B2d + Pd/Qd)/xd - Ed;
  parameter Real rD=if tX_ > 0 then rf/Ed else 1/Fd;
  parameter Real lD=if tX_ > 0 then wtx*rD else Ud*rD;
  parameter Real lf=if tX_ > 0 then rf*(Dd*Cd*rf - wtx)/Ed else Vd*rf;
  parameter Real mrc=if tX_ > 0 then (Bd*Ed - wtx*Dd*Cd*rf + wtx*wtx)/denom2 else 0;
  //axe q
  parameter Real tpq=xpQPu_*tpQO_/xQPu_;
  parameter Real tppq=if IENR == 4 then xppQPu_*tppQO_/xpQPu_ else xppQPu_*tppQO_/xQPu_;
  parameter Real B1q=(tpQO_ + tppQO_)*omega0_;
  parameter Real B2q=(tpq + tppq)*omega0_;
  parameter Real C1q=tpQO_*tppQO_*omega0_*omega0_;
  parameter Real C2q=tpq*tppq*omega0_*omega0_;
  parameter Real mQ0Pu_=xQPu_ - lStatIn_;
  parameter Real xq=mQ0Pu_*lStatIn_/xQPu_;
  parameter Real Pq=B1q/mQ0Pu_ - B2q/xq;
  parameter Real Qq=1/xq - 1/mQ0Pu_;
  parameter Real Bq=C2q - C1q*lStatIn_/xQPu_;
  parameter Real determ2=1 - 4*Bq*lStatIn_*Qq*Qq/(xq*Pq*Pq);
  parameter Real rad2=sqrt(determ2);
  parameter Real V1q=-0.5*Pq*(1 + rad2)/Qq;
  parameter Real V2q=-0.5*Pq*(1 - rad2)/Qq;
  parameter Real denom7=if IENR == 4 then xq*V1q else 1;
  parameter Real U1q=Bq*lStatIn_/denom7;
  parameter Real denom8=if IENR == 4 then xq*V2q else 1;
  parameter Real U2q=Bq*lStatIn_/denom8;
  parameter Real Z1q=Bq*lStatIn_ + mQ0Pu_*(B2q + Pq/Qq)*V1q;
  parameter Real Z2q=Bq*lStatIn_ + mQ0Pu_*(B2q + Pq/Qq)*V2q;
  parameter Real denom9=if IENR == 4 then (U1q - V1q)*mQ0Pu_ else 1;
  parameter Real E1q=(C1q - Z1q/xq)/denom9;
  parameter Real denom10=if IENR == 4 then (U2q - V2q)*mQ0Pu_ else 1;
  parameter Real E2q=if IENR == 4 then (C1q - Z2q/xq)/denom10 else 1;
  parameter Real rf1q=1/E1q;
  parameter Real rf2q=1/E2q;
  parameter Real alfq=if IENR == 4 then (tpq*mQ0Pu_ - tpQO_*xq)/(tpQO_ - tpq) else 0;
  parameter Real arfq=if IENR == 4 then (mQ0Pu_ + alfq)/(tpQO_*omega0_) else 0;
  parameter Real err1q=abs(arfq - rf1q);
  parameter Real err2q=abs(arfq - rf2q);
  parameter Real Vq=if err1q < err2q then V1q else V2q;
  parameter Real Uq=if err1q < err2q then U1q else U2q;
  parameter Real Eq=if err1q < err2q then E1q else E2q;
  parameter Real rQ1=if IENR == 4 then if err1q < err2q then rf1q else rf2q else (mQ0Pu_ + lQ1)/(omega0_*tppQO_);
  parameter Real Fq=(B2q + Pq/Qq)/xq - Eq;
  parameter Real rQ2=if IENR == 4 then 1/Fq else 0;
  parameter Real lQ2=if IENR == 4 then Uq*rQ2 else 100000000;
  parameter Real lQ1=if IENR == 4 then Vq*rQ1 else (tppq*mQ0Pu_ - tppQO_*Y)/(tppQO_ - tppq);
  parameter Real lq=lStatIn_;
  parameter Real Y=mQ0Pu_*lq/xQPu_;
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
end PwExtIntParameters;
