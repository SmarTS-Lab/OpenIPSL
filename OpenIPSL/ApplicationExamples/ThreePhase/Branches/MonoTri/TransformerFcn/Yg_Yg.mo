within ThreePhase.Branches.MonoTri.TransformerFcn;
function Yg_Yg
  input Real X;
  input Real R;
  input Real tap;
  output Real[1, 32] V;
protected
  parameter Real Gser=(1/tap)*(R/(R*R + X*X));
  parameter Real Bser=(1/tap)*(-X/(R*R + X*X));

  parameter Real Gshk=(1/tap)*((1/tap) - 1)*(R/(R*R + X*X));
  parameter Real Bshk=(1/tap)*((1/tap) - 1)*(-X/(R*R + X*X));

  parameter Real Gshm=(1 - (1/tap))*(R/(R*R + X*X));
  parameter Real Bshm=(1 - (1/tap))*(-X/(R*R + X*X));

  //Writing the Y_ser matrix according to Simulight
  parameter Real Gaaser=Gser;
  parameter Real Baaser=Bser;
  parameter Real Gabser=0;
  parameter Real Babser=0;
  parameter Real Gacser=0;
  parameter Real Bacser=0;
  parameter Real Gbaser=0;
  parameter Real Bbaser=0;
  parameter Real Gbbser=Gser;
  parameter Real Bbbser=Bser;
  parameter Real Gbcser=0;
  parameter Real Bbcser=0;
  parameter Real Gcaser=0;
  parameter Real Bcaser=0;
  parameter Real Gcbser=0;
  parameter Real Bcbser=0;
  parameter Real Gccser=Gser;
  parameter Real Bccser=Bser;

  //Writing the Y_sht_k matrix according to Simulight
  parameter Real Gaask=Gshk;
  parameter Real Baask=Bshk;
  parameter Real Gabsk=0;
  parameter Real Babsk=0;
  parameter Real Gacsk=0;
  parameter Real Bacsk=0;
  parameter Real Gbask=0;
  parameter Real Bbask=0;
  parameter Real Gbbsk=Gshk;
  parameter Real Bbbsk=Bshk;
  parameter Real Gbcsk=0;
  parameter Real Bbcsk=0;
  parameter Real Gcask=0;
  parameter Real Bcask=0;
  parameter Real Gcbsk=0;
  parameter Real Bcbsk=0;
  parameter Real Gccsk=Gshk;
  parameter Real Bccsk=Bshk;

  //Writing the Y_sht_m matrix according to Simulight
  parameter Real Gaasm=Gshm;
  parameter Real Baasm=Bshm;
  parameter Real Gabsm=0;
  parameter Real Babsm=0;
  parameter Real Gacsm=0;
  parameter Real Bacsm=0;
  parameter Real Gbasm=0;
  parameter Real Bbasm=0;
  parameter Real Gbbsm=Gshm;
  parameter Real Bbbsm=Bshm;
  parameter Real Gbcsm=0;
  parameter Real Bbcsm=0;
  parameter Real Gcasm=0;
  parameter Real Bcasm=0;
  parameter Real Gcbsm=0;
  parameter Real Bcbsm=0;
  parameter Real Gccsm=Gshm;
  parameter Real Bccsm=Bshm;

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
  parameter Real C1r=-(2*Gaaser - Gabser + sqrt(3)*Babser - Gacser - sqrt(3)*
      Bacser)/2;
  parameter Real C1i=-(2*Baaser - Babser - sqrt(3)*Gabser - Bacser + sqrt(3)*
      Gacser)/2;
  parameter Real C2r=-(2*Gbaser - Gbbser + sqrt(3)*Bbbser - Gbcser - sqrt(3)*
      Bbcser)/2;
  parameter Real C2i=-(2*Bbaser - Bbbser - sqrt(3)*Gbbser - Bbcser + sqrt(3)*
      Gbcser)/2;
  parameter Real C3r=-(2*Gcaser - Gcbser + sqrt(3)*Bcbser - Gccser - sqrt(3)*
      Bccser)/2;
  parameter Real C3i=-(2*Bcaser - Bcbser - sqrt(3)*Gcbser - Bccser + sqrt(3)*
      Gccser)/2;

  //Calculating elements of Matrix D
  parameter Real D11r=Gaaser + Gaasm;
  parameter Real D11i=Baaser + Baasm;
  parameter Real D12r=Gabser + Gabsm;
  parameter Real D12i=Babser + Babsm;
  parameter Real D13r=Gacser + Gacsm;
  parameter Real D13i=Bacser + Bacsm;
  parameter Real D21r=Gbaser + Gbasm;
  parameter Real D21i=Bbaser + Bbasm;
  parameter Real D22r=Gbbser + Gbbsm;
  parameter Real D22i=Bbbser + Bbbsm;
  parameter Real D23r=Gbcser + Gbcsm;
  parameter Real D23i=Bbcser + Bbcsm;
  parameter Real D31r=Gcaser + Gcasm;
  parameter Real D31i=Bcaser + Bcasm;
  parameter Real D32r=Gcbser + Gcbsm;
  parameter Real D32i=Bcbser + Bcbsm;
  parameter Real D33r=Gccser + Gccsm;
  parameter Real D33i=Bccser + Bccsm;
algorithm
  V := [Ar, Ai, MB1r, MB1i, MB2r, MB2i, MB3r, MB3i, C1r, C1i, C2r, C2i, C3r,
    C3i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i,
    D31r, D31i, D32r, D32i, D33r, D33i];

end Yg_Yg;
