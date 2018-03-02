within ThreePhase.Branches.MonoTri.TransformerFcn;
function Y_D
  input Real X;
  input Real R;
  input Real tap;
  output Real[1, 32] V;

protected
  parameter Real sGser=((1/tap)/sqrt(3))*(R/(R*R + X*X));
  parameter Real sBser=((1/tap)/sqrt(3))*(-X/(R*R + X*X));
  parameter Real mGser=((1/tap)/sqrt(3))*(-R/(R*R + X*X));
  parameter Real mBser=((1/tap)/sqrt(3))*(X/(R*R + X*X));
  parameter Real sGshk=((2 - tap*sqrt(3))/(3*tap*tap))*(R/(R*R + X*X));
  parameter Real sBshk=((2 - tap*sqrt(3))/(3*tap*tap))*(-X/(R*R + X*X));
  parameter Real mGshk=((tap*sqrt(3) - 1)/(3*tap*tap))*(R/(R*R + X*X));
  parameter Real mBshk=((tap*sqrt(3) - 1)/(3*tap*tap))*(-X/(R*R + X*X));
  parameter Real nGshk=((-1)/(3*tap*tap))*(R/(R*R + X*X));
  parameter Real nBshk=((-1)/(3*tap*tap))*(-X/(R*R + X*X));
  parameter Real sGshm=((2*tap - sqrt(3))/(3*tap))*(R/(R*R + X*X));
  parameter Real sBshm=((2*tap - sqrt(3))/(3*tap))*(-X/(R*R + X*X));
  parameter Real mGshm=(-1/3)*(R/(R*R + X*X));
  parameter Real mBshm=(-1/3)*(-X/(R*R + X*X));
  parameter Real nGshm=((sqrt(3) - tap)/(3*tap))*(R/(R*R + X*X));
  parameter Real nBshm=((sqrt(3) - tap)/(3*tap))*(-X/(R*R + X*X));

  //Writing the Y_ser1 matrix according to Simulight
  parameter Real Gaaser=sGser;
  parameter Real Baaser=sBser;
  parameter Real Gabser=mGser;
  parameter Real Babser=mBser;
  parameter Real Gacser=0;
  parameter Real Bacser=0;
  parameter Real Gbaser=0;
  parameter Real Bbaser=0;
  parameter Real Gbbser=sGser;
  parameter Real Bbbser=sBser;
  parameter Real Gbcser=mGser;
  parameter Real Bbcser=mBser;
  parameter Real Gcaser=mGser;
  parameter Real Bcaser=mBser;
  parameter Real Gcbser=0;
  parameter Real Bcbser=0;
  parameter Real Gccser=sGser;
  parameter Real Bccser=sBser;

  //Writing the Y_ser2 matrix according to Simulight
  parameter Real Gaaser2=Gaaser;
  parameter Real Baaser2=Baaser;
  parameter Real Gabser2=Gbaser;
  parameter Real Babser2=Bbaser;
  parameter Real Gacser2=Gcaser;
  parameter Real Bacser2=Bcaser;
  parameter Real Gbaser2=Gabser;
  parameter Real Bbaser2=Babser;
  parameter Real Gbbser2=Gbbser;
  parameter Real Bbbser2=Bbbser;
  parameter Real Gbcser2=Gcbser;
  parameter Real Bbcser2=Bcbser;
  parameter Real Gcaser2=Gacser;
  parameter Real Bcaser2=Bacser;
  parameter Real Gcbser2=Gbcser;
  parameter Real Bcbser2=Bbcser;
  parameter Real Gccser2=Gccser;
  parameter Real Bccser2=Bccser;

  //Writing the Y_sht_k matrix according to Simulight
  parameter Real Gaask=sGshk;
  parameter Real Baask=sBshk;
  parameter Real Gabsk=mGshk;
  parameter Real Babsk=mBshk;
  parameter Real Gacsk=nGshk;
  parameter Real Bacsk=nBshk;
  parameter Real Gbask=nGshk;
  parameter Real Bbask=nBshk;
  parameter Real Gbbsk=sGshk;
  parameter Real Bbbsk=sBshk;
  parameter Real Gbcsk=mGshk;
  parameter Real Bbcsk=mBshk;
  parameter Real Gcask=mGshk;
  parameter Real Bcask=mBshk;
  parameter Real Gcbsk=nGshk;
  parameter Real Bcbsk=nBshk;
  parameter Real Gccsk=sGshk;
  parameter Real Bccsk=sBshk;

  //Writing the Y_sht_m matrix according to Simulight
  parameter Real Gaasm=sGshm;
  parameter Real Baasm=sBshm;
  parameter Real Gabsm=mGshm;
  parameter Real Babsm=mBshm;
  parameter Real Gacsm=nGshm;
  parameter Real Bacsm=nBshm;
  parameter Real Gbasm=nGshm;
  parameter Real Bbasm=nBshm;
  parameter Real Gbbsm=sGshm;
  parameter Real Bbbsm=sBshm;
  parameter Real Gbcsm=mGshm;
  parameter Real Bbcsm=mBshm;
  parameter Real Gcasm=mGshm;
  parameter Real Bcasm=mBshm;
  parameter Real Gcbsm=nGshm;
  parameter Real Bcbsm=nBshm;
  parameter Real Gccsm=sGshm;
  parameter Real Bccsm=sBshm;

  //Calculating the parameters for the MonoxTri interface

  parameter Real G1=(Gaask + Gaaser + Gbbsk + Gbbser + Gccsk + Gccser)/3;
  parameter Real B1=(Baask + Baaser + Bbbsk + Bbbser + Bccsk + Bccser)/3;
  parameter Real G2=(Gbask + Gbaser + Gacsk + Gacser + Gcbsk + Gcbser)/3;
  parameter Real B2=(Bbask + Bbaser + Bacsk + Bacser + Bcbsk + Bcbser)/3;
  parameter Real G3=(Gabsk + Gabser + Gbcsk + Gbcser + Gcask + Gcaser)/3;
  parameter Real B3=(Babsk + Babser + Bbcsk + Bbcser + Bcask + Bcaser)/3;

  //Calculating the element of Matrix A
  parameter Real Ar=(2*G1 - G2 - sqrt(3)*B2 - G3 + sqrt(3)*B3)/2;
  parameter Real Ai=(2*B1 - B2 + sqrt(3)*G2 - B3 - sqrt(3)*G3)/2;

  //Calculating elements of Matrix MB
  parameter Real MB1r=-(2*Gaaser - Gbaser - sqrt(3)*Bbaser - Gcaser + sqrt(3)*
      Bcaser)/6;
  parameter Real MB1i=-(2*Baaser - Bbaser + sqrt(3)*Gbaser - Bcaser - sqrt(3)*
      Gcaser)/6;
  parameter Real MB2r=-(2*Gabser - Gbbser - sqrt(3)*Bbbser - Gcbser + sqrt(3)*
      Bcbser)/6;
  parameter Real MB2i=-(2*Babser - Bbbser + sqrt(3)*Gbbser - Bcbser - sqrt(3)*
      Gcbser)/6;
  parameter Real MB3r=-(2*Gacser - Gbcser - sqrt(3)*Bbcser - Gccser + sqrt(3)*
      Bccser)/6;
  parameter Real MB3i=-(2*Bacser - Bbcser + sqrt(3)*Gbcser - Bccser - sqrt(3)*
      Gccser)/6;

  //Calculating elements of Matrix C
  parameter Real C1r=-(2*Gaaser2 - Gabser2 + sqrt(3)*Babser2 - Gacser2 - sqrt(3)
      *Bacser2)/2;
  parameter Real C1i=-(2*Baaser2 - Babser2 - sqrt(3)*Gabser2 - Bacser2 + sqrt(3)
      *Gacser2)/2;
  parameter Real C2r=-(2*Gbaser2 - Gbbser2 + sqrt(3)*Bbbser2 - Gbcser2 - sqrt(3)
      *Bbcser2)/2;
  parameter Real C2i=-(2*Bbaser2 - Bbbser2 - sqrt(3)*Gbbser2 - Bbcser2 + sqrt(3)
      *Gbcser2)/2;
  parameter Real C3r=-(2*Gcaser2 - Gcbser2 + sqrt(3)*Bcbser2 - Gccser2 - sqrt(3)
      *Bccser2)/2;
  parameter Real C3i=-(2*Bcaser2 - Bcbser2 - sqrt(3)*Gcbser2 - Bccser2 + sqrt(3)
      *Gccser2)/2;

  //Calculating elements of Matrix D
  parameter Real D11r=Gaaser2 + Gaasm;
  parameter Real D11i=Baaser2 + Baasm;
  parameter Real D12r=Gabser2 + Gabsm;
  parameter Real D12i=Babser2 + Babsm;
  parameter Real D13r=Gacser2 + Gacsm;
  parameter Real D13i=Bacser2 + Bacsm;
  parameter Real D21r=Gbaser2 + Gbasm;
  parameter Real D21i=Bbaser2 + Bbasm;
  parameter Real D22r=Gbbser2 + Gbbsm;
  parameter Real D22i=Bbbser2 + Bbbsm;
  parameter Real D23r=Gbcser2 + Gbcsm;
  parameter Real D23i=Bbcser2 + Bbcsm;
  parameter Real D31r=Gcaser2 + Gcasm;
  parameter Real D31i=Bcaser2 + Bcasm;
  parameter Real D32r=Gcbser2 + Gcbsm;
  parameter Real D32i=Bcbser2 + Bcbsm;
  parameter Real D33r=Gccser2 + Gccsm;
  parameter Real D33i=Bccser2 + Bccsm;
algorithm
  V := [Ar, Ai, MB1r, MB1i, MB2r, MB2i, MB3r, MB3i, C1r, C1i, C2r, C2i, C3r,
    C3i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i,
    D31r, D31i, D32r, D32i, D33r, D33i];

end Y_D;
