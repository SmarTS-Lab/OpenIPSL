within ThreePhase.Branches.Transformer;
package TransfConnection

  function Yg_Yg
    input Real X;
    input Real R;
    input Real tap;
    output Real[12, 12] PiMatrix;
  protected
    parameter Real Gser=(1/tap)*(R/(R*R + X*X));
    parameter Real Bser=(1/tap)*(-X/(R*R + X*X));
    parameter Real Gshk=(1/tap)*((1/tap) - 1)*(R/(R*R + X*X));
    parameter Real Bshk=(1/tap)*((1/tap) - 1)*(-X/(R*R + X*X));
    parameter Real Gshm=(1 - (1/tap))*(R/(R*R + X*X));
    parameter Real Bshm=(1 - (1/tap))*(-X/(R*R + X*X));
    parameter Real zero=1e-6;

    //Writing the Y_ser matrix according to Simulight
    parameter Real[6, 6] Y_ser=[Gser, -Bser, zero, zero, zero, zero; Bser, Gser,
        zero, zero, zero, zero; zero, zero, Gser, -Bser, zero, zero; zero, zero,
        Bser, Gser, zero, zero; zero, zero, zero, zero, Gser, -Bser; zero, zero,
        zero, zero, Bser, Gser];

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real[6, 6] Yshtk=[Gshk, -Bshk, zero, zero, zero, zero; Bshk, Gshk,
        zero, zero, zero, zero; zero, zero, Gshk, -Bshk, zero, zero; zero, zero,
        Bshk, Gshk, zero, zero; zero, zero, zero, zero, Gshk, -Bshk; zero, zero,
        zero, zero, Bshk, Gshk];

    //Writing the Y_sht_m matrix according to Simulight
    parameter Real[6, 6] Yshtm=[Gshm, -Bshm, zero, zero, zero, zero; Bshm, Gshm,
        zero, zero, zero, zero; zero, zero, Gshm, -Bshm, zero, zero; zero, zero,
        Bshm, Gshm, zero, zero; zero, zero, zero, zero, Gshm, -Bshm; zero, zero,
        zero, zero, Bshm, Gshm];

    //Calculating the parameters for the Transformer
    //Writing the matrix A (Yser1+Yshtk)
    parameter Real[6, 6] A=Y_ser + Yshtk;

    //Writing the matrix B (-Yser1)
    parameter Real[6, 6] B=-Y_ser;

    //Writing the matrix MC (-Yser2)
    parameter Real[6, 6] C=-Y_ser;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real[6, 6] D=Y_ser + Yshtm;

  algorithm
    PiMatrix := [A, B; C, D];
  end Yg_Yg;

  function D_D
    input Real X;
    input Real R;
    input Real tap;
    output Real[12, 12] PiMatrix;
  protected
    parameter Real sGser=((1/tap)/3)*(2*R/(R*R + X*X));
    parameter Real sBser=((1/tap)/3)*(-2*X/(R*R + X*X));
    parameter Real mGser=((1/tap)/3)*(-R/(R*R + X*X));
    parameter Real mBser=((1/tap)/3)*(X/(R*R + X*X));
    parameter Real sGshk=((1 - tap)/(3*tap*tap))*(2*R/(R*R + X*X));
    parameter Real sBshk=((1 - tap)/(3*tap*tap))*(-2*X/(R*R + X*X));
    parameter Real mGshk=((1 - tap)/(3*tap*tap))*(-R/(R*R + X*X));
    parameter Real mBshk=((1 - tap)/(3*tap*tap))*(X/(R*R + X*X));

    //Writing the Y_ser matrix according to Simulight
    parameter Real[6, 6] Y_ser=[sGser, -sBser, mGser, -mBser, mGser, -mBser;
        sBser, sGser, mBser, mGser, mBser, mGser; mGser, -mBser, sGser, -sBser,
        mGser, -mBser; mBser, mGser, sBser, sGser, mBser, mGser; mGser, -mBser,
        mGser, -mBser, sGser, -sBser; mBser, mGser, mBser, mGser, sBser, sGser];

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real[6, 6] Yshtk=[sGshk, -sBshk, mGshk, -mBshk, mGshk, -mBshk;
        sBshk, sGshk, mBshk, mGshk, mBshk, mGshk; mGshk, -mBshk, sGshk, -sBshk,
        mGshk, -mBshk; mBshk, mGshk, sBshk, sGshk, mBshk, mGshk; mGshk, -mBshk,
        mGshk, -mBshk, sGshk, -sBshk; mBshk, mGshk, mBshk, mGshk, sBshk, sGshk];

    //Writing the Y_sht_m matrix according to Simulight
    parameter Real[6, 6] Yshtm=zeros(6, 6);

    //Calculating the parameters for the Transformer
    //Writing the matrix A (Yser1+Yshtk)
    parameter Real[6, 6] A=Y_ser + Yshtk;

    //Writing the matrix B (-Yser1)
    parameter Real[6, 6] B=-Y_ser;

    //Writing the matrix MC (-Yser2)
    parameter Real[6, 6] C=-Y_ser;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real[6, 6] D=Y_ser + Yshtm;
  algorithm
    PiMatrix := [A, B; C, D];
  end D_D;

  function Y_Y
    input Real X;
    input Real R;
    input Real tap;
    output Real[12, 12] PiMatrix;
  protected
    parameter Real sGser=((1/tap)/3)*(2*R/(R*R + X*X));
    parameter Real sBser=((1/tap)/3)*(-2*X/(R*R + X*X));
    parameter Real mGser=((1/tap)/3)*(-R/(R*R + X*X));
    parameter Real mBser=((1/tap)/3)*(X/(R*R + X*X));
    parameter Real sGshk=((1 - tap)/(3*tap*tap))*(2*R/(R*R + X*X));
    parameter Real sBshk=((1 - tap)/(3*tap*tap))*(-2*X/(R*R + X*X));
    parameter Real mGshk=((1 - tap)/(3*tap*tap))*(-R/(R*R + X*X));
    parameter Real mBshk=((1 - tap)/(3*tap*tap))*(X/(R*R + X*X));

    //Writing the Y_ser matrix according to Simulight
    parameter Real[6, 6] Y_ser=[sGser, -sBser, mGser, -mBser, mGser, -mBser;
        sBser, sGser, mBser, mGser, mBser, mGser; mGser, -mBser, sGser, -sBser,
        mGser, -mBser; mBser, mGser, sBser, sGser, mBser, mGser; mGser, -mBser,
        mGser, -mBser, sGser, -sBser; mBser, mGser, mBser, mGser, sBser, sGser];

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real[6, 6] Yshtk=[sGshk, -sBshk, mGshk, -mBshk, mGshk, -mBshk;
        sBshk, sGshk, mBshk, mGshk, mBshk, mGshk; mGshk, -mBshk, sGshk, -sBshk,
        mGshk, -mBshk; mBshk, mGshk, sBshk, sGshk, mBshk, mGshk; mGshk, -mBshk,
        mGshk, -mBshk, sGshk, -sBshk; mBshk, mGshk, mBshk, mGshk, sBshk, sGshk];

    //Writing the Y_sht_m matrix according to Simulight
    parameter Real[6, 6] Yshtm=zeros(6, 6);

    //Calculating the parameters for the Transformer
    //Writing the matrix A (Yser1+Yshtk)
    parameter Real[6, 6] A=Y_ser + Yshtk;

    //Writing the matrix B (-Yser1)
    parameter Real[6, 6] B=-Y_ser;

    //Writing the matrix MC (-Yser2)
    parameter Real[6, 6] C=-Y_ser;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real[6, 6] D=Y_ser + Yshtm;
  algorithm
    PiMatrix := [A, B; C, D];
  end Y_Y;

  function D_Yg
    input Real X;
    input Real R;
    input Real tap;
    output Real[12, 12] PiMatrix;
  protected
    parameter Real sGser=(1/tap/sqrt(3))*(R/(R*R + X*X));
    parameter Real sBser=(1/tap/sqrt(3))*(-X/(R*R + X*X));
    parameter Real mGser=(1/tap/sqrt(3))*(-R/(R*R + X*X));
    parameter Real mBser=(1/tap/sqrt(3))*(X/(R*R + X*X));
    parameter Real sGshk=((2/3/tap/tap) - (1/tap/sqrt(3)))*(R/(R*R + X*X));
    parameter Real sBshk=((2/3/tap/tap) - (1/tap/sqrt(3)))*(-X/(R*R + X*X));
    parameter Real mGshk=((1/3/tap/tap))*(-R/(R*R + X*X));
    parameter Real mBshk=((1/3/tap/tap))*(X/(R*R + X*X));
    parameter Real nGshk=((1/sqrt(3)/tap) - (1/3/tap/tap))*(R/(R*R + X*X));
    parameter Real nBshk=((1/sqrt(3)/tap) - (1/3/tap/tap))*(-X/(R*R + X*X));
    parameter Real sGshm=(1 - (1/tap/sqrt(3)))*(R/(R*R + X*X));
    parameter Real sBshm=(1 - (1/tap/sqrt(3)))*(-X/(R*R + X*X));
    parameter Real mGshm=(1/tap/sqrt(3))*(R/(R*R + X*X));
    parameter Real mBshm=(1/tap/sqrt(3))*(-X/(R*R + X*X));
    parameter Real zero=1e-6;

    //Writing the Y_ser1 matrix according to Simulight
    parameter Real[6, 6] Y_ser1=[sGser, -sBser, zero, zero, mGser, -mBser;
        sBser, sGser, zero, zero, mBser, mGser; mGser, -mBser, sGser, -sBser,
        zero, zero; mBser, mGser, sBser, sGser, zero, zero; zero, zero, mGser,
        -mBser, sGser, -sBser; zero, zero, mBser, mGser, sBser, sGser];

    //Writing the Y_ser2 matrix according to Simulight
    parameter Real[6, 6] Y_ser2=[sGser, -sBser, mGser, -mBser, zero, zero;
        sBser, sGser, mBser, mGser, zero, zero; zero, zero, sGser, -sBser,
        mGser, -mBser; zero, zero, sBser, sGser, mBser, mGser; mGser, -mBser,
        zero, zero, sGser, -sBser; mBser, mGser, zero, zero, sBser, sGser];

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real[6, 6] Yshtk=[sGshk, -sBshk, mGshk, -mBshk, nGshk, -nBshk;
        sBshk, sGshk, mBshk, mGshk, nBshk, nGshk; nGshk, -nBshk, sGshk, -sBshk,
        mGshk, -mBshk; nBshk, nGshk, sBshk, sGshk, mBshk, mGshk; mGshk, -mBshk,
        nGshk, -nBshk, sGshk, -sBshk; mBshk, mGshk, nBshk, nGshk, sBshk, sGshk];

    //Writing the Y_sht_m matrix according to Simulight
    parameter Real[6, 6] Yshtm=[sGshm, -sBshm, mGshm, -mBshm, zero, zero; sBshm,
        sGshm, mBshm, mGshm, zero, zero; zero, zero, sGshm, -sBshm, mGshm, -
        mBshm; zero, zero, sBshm, sGshm, mBshm, mGshm; mGshm, -mBshm, zero,
        zero, sGshm, -sBshm; mBshm, mGshm, zero, zero, sBshm, sGshm];

    //Calculating the parameters for the Transformer
    //Writing the matrix A (Yser1+Yshtk)
    parameter Real[6, 6] A=Y_ser1 + Yshtk;

    //Writing the matrix B (-Yser1)
    parameter Real[6, 6] B=-Y_ser1;

    //Writing the matrix MC (-Yser2)
    parameter Real[6, 6] C=-Y_ser2;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real[6, 6] D=Y_ser2 + Yshtm;
  algorithm
    PiMatrix := [A, B; C, D];
  end D_Yg;

  function Yg_D
    input Real X;
    input Real R;
    input Real tap;
    output Real[12, 12] PiMatrix;

  protected
    parameter Real sGser=(1/tap/sqrt(3))*(R/(R*R + X*X));
    parameter Real sBser=(1/tap/sqrt(3))*(-X/(R*R + X*X));
    parameter Real mGser=(1/tap/sqrt(3))*(-R/(R*R + X*X));
    parameter Real mBser=(1/tap/sqrt(3))*(X/(R*R + X*X));
    parameter Real sGshk=((1/tap) - (1/sqrt(3)))/tap*(R/(R*R + X*X));
    parameter Real sBshk=((1/tap) - (1/sqrt(3)))/tap*(-X/(R*R + X*X));
    parameter Real sGshm=((2/3) - (1/tap/sqrt(3)))*(R/(R*R + X*X));
    parameter Real sBshm=((2/3) - (1/tap/sqrt(3)))*(-X/(R*R + X*X));
    parameter Real mGshm=(1/3)*(-R/(R*R + X*X));
    parameter Real mBshm=(1/3)*(X/(R*R + X*X));
    parameter Real nGshm=((1/tap/sqrt(3)) - (1/3))*(R/(R*R + X*X));
    parameter Real nBshm=((1/tap/sqrt(3)) - (1/3))*(-X/(R*R + X*X));
    parameter Real zero=1e-6;

    //Writing the Y_ser1 matrix according to Simulight
    parameter Real[6, 6] Y_ser1=[sGser, -sBser, mGser, -mBser, zero, zero;
        sBser, sGser, mBser, mGser, zero, zero; zero, zero, sGser, -sBser,
        mGser, -mBser; zero, zero, sBser, sGser, mBser, mGser; mGser, -mBser,
        zero, zero, sGser, -sBser; mBser, mGser, zero, zero, sBser, sGser];

    //Writing the Y_ser2 matrix according to Simulight
    parameter Real[6, 6] Y_ser2=[sGser, -sBser, zero, zero, mGser, -mBser;
        sBser, sGser, zero, zero, mBser, mGser; mGser, -mBser, sGser, -sBser,
        zero, zero; mBser, mGser, sBser, sGser, zero, zero; zero, zero, mGser,
        -mBser, sGser, -sBser; zero, zero, mBser, mGser, sBser, sGser];

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real[6, 6] Yshtk=[sGshk, -sBshk, sGser, -sBser, zero, zero; sBshk,
        sGshk, sBser, sGser, zero, zero; zero, zero, sGshk, -sBshk, sGser, -
        sBser; zero, zero, sBshk, sGshk, sBser, sGser; sGser, -sBser, zero,
        zero, sGshk, -sBshk; sBser, sGser, zero, zero, sBshk, sGshk];

    //Writing the Y_sht_m matrix according to Simulight
    parameter Real[6, 6] Yshtm=[sGshm, -sBshm, mGshm, -mBshm, nGshm, -nBshm;
        sBshm, sGshm, mBshm, mGshm, nBshm, nGshm; nGshm, -nBshm, sGshm, -sBshm,
        mGshm, -mBshm; nBshm, nGshm, sBshm, sGshm, mBshm, mGshm; mGshm, -mBshm,
        nGshm, -nBshm, sGshm, -sBshm; mBshm, mGshm, nBshm, nGshm, sBshm, sGshm];

    //Calculating the parameters for the Transformer
    //Writing the matrix A (Yser1+Yshtk)
    parameter Real[6, 6] A=Y_ser1 + Yshtk;

    //Writing the matrix B (-Yser1)
    parameter Real[6, 6] B=-Y_ser1;

    //Writing the matrix MC (-Yser2)
    parameter Real[6, 6] C=-Y_ser2;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real[6, 6] D=Y_ser2 + Yshtm;
  algorithm
    PiMatrix := [A, B; C, D];
  end Yg_D;
  // PAREI AQUI

  function Y_D
    input Real X;
    input Real R;
    input Real tap;
    output Real[12, 12] PiMatrix;

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
    parameter Real zero=1e-6;

    //Writing the Y_ser1 matrix according to Simulight
    parameter Real[6, 6] Y_ser1=[sGser, -sBser, mGser, -mBser, zero, zero;
        sBser, sGser, mBser, mGser, zero, zero; zero, zero, sGser, -sBser,
        mGser, -mBser; zero, zero, sBser, sGser, mBser, mGser; mGser, -mBser,
        zero, zero, sGser, -sBser; mBser, mGser, zero, zero, sBser, sGser];

    //Writing the Y_ser2 matrix according to Simulight
    parameter Real[6, 6] Y_ser2=[sGser, -sBser, zero, zero, mGser, -mBser;
        sBser, sGser, zero, zero, mBser, mGser; mGser, -mBser, sGser, -sBser,
        zero, zero; mBser, mGser, sBser, sGser, zero, zero; zero, zero, mGser,
        -mBser, sGser, -sBser; zero, zero, mBser, mGser, sBser, sGser];

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real[6, 6] Yshtk=[sGshk, -sBshk, mGshk, -mBshk, nGshk, -nBshk;
        sBshk, sGshk, mBshk, mGshk, nBshk, nGshk; nGshk, -nBshk, sGshk, -sBshk,
        mGshk, -mBshk; nBshk, nGshk, sBshk, sGshk, mBshk, mGshk; mGshk, -mBshk,
        nGshk, -nBshk, sGshk, -sBshk; mBshk, mGshk, nBshk, nGshk, sBshk, sGshk];

    //Writing the Y_sht_m matrix according to Simulight
    parameter Real[6, 6] Yshtm=[sGshm, -sBshm, mGshm, -mBshm, nGshm, -nBshm;
        sBshm, sGshm, mBshm, mGshm, nBshm, nGshm; nGshm, -nBshm, sGshm, -sBshm,
        mGshm, -mBshm; nBshm, nGshm, sBshm, sGshm, mBshm, mGshm; mGshm, -mBshm,
        nGshm, -nBshm, sGshm, -sBshm; mBshm, mGshm, nBshm, nGshm, sBshm, sGshm];

    //Calculating the parameters for the Transformer
    //Writing the matrix A (Yser1+Yshtk)
    parameter Real[6, 6] A=Y_ser1 + Yshtk;

    //Writing the matrix B (-Yser1)
    parameter Real[6, 6] B=-Y_ser1;

    //Writing the matrix MC (-Yser2)
    parameter Real[6, 6] C=-Y_ser2;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real[6, 6] D=Y_ser2 + Yshtm;
  algorithm
    PiMatrix := [A, B; C, D];
  end Y_D;

  function D_Y
    input Real X;
    input Real R;
    input Real tap;
    output Real[12, 12] PiMatrix;

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
    parameter Real zero=1e-6;

    //Writing the Y_ser1 matrix according to Simulight
    parameter Real[6, 6] Y_ser1=[sGser, -sBser, mGser, -mBser, zero, zero;
        sBser, sGser, mBser, mGser, zero, zero; zero, zero, sGser, -sBser,
        mGser, -mBser; zero, zero, sBser, sGser, mBser, mGser; mGser, -mBser,
        zero, zero, sGser, -sBser; mBser, mGser, zero, zero, sBser, sGser];

    //Writing the Y_ser2 matrix according to Simulight
    parameter Real[6, 6] Y_ser2=[sGser, -sBser, zero, zero, mGser, -mBser;
        sBser, sGser, zero, zero, mBser, mGser; mGser, -mBser, sGser, -sBser,
        zero, zero; mBser, mGser, sBser, sGser, zero, zero; zero, zero, mGser,
        -mBser, sGser, -sBser; zero, zero, mBser, mGser, sBser, sGser];

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real[6, 6] Yshtk=[sGshk, -sBshk, mGshk, -mBshk, nGshk, -nBshk;
        sBshk, sGshk, mBshk, mGshk, nBshk, nGshk; nGshk, -nBshk, sGshk, -sBshk,
        mGshk, -mBshk; nBshk, nGshk, sBshk, sGshk, mBshk, mGshk; mGshk, -mBshk,
        nGshk, -nBshk, sGshk, -sBshk; mBshk, mGshk, nBshk, nGshk, sBshk, sGshk];

    //Writing the Y_sht_m matrix according to Simulight
    parameter Real[6, 6] Yshtm=[sGshm, -sBshm, mGshm, -mBshm, nGshm, -nBshm;
        sBshm, sGshm, mBshm, mGshm, nBshm, nGshm; nGshm, -nBshm, sGshm, -sBshm,
        mGshm, -mBshm; nBshm, nGshm, sBshm, sGshm, mBshm, mGshm; mGshm, -mBshm,
        nGshm, -nBshm, sGshm, -sBshm; mBshm, mGshm, nBshm, nGshm, sBshm, sGshm];

    //Calculating the parameters for the Transformer
    //Writing the matrix A (Yser1+Yshtk)
    parameter Real[6, 6] A=Y_ser1 + Yshtk;

    //Writing the matrix B (-Yser1)
    parameter Real[6, 6] B=-Y_ser1;

    //Writing the matrix MC (-Yser2)
    parameter Real[6, 6] C=-Y_ser2;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real[6, 6] D=Y_ser2 + Yshtm;

  algorithm
    PiMatrix := [A, B; C, D];
  end D_Y;

  function Yg_Y
    input Real X;
    input Real R;
    input Real tap;
    output Real[12, 12] PiMatrix;
  protected
    parameter Real sGser=((1/tap)/3)*(2*R/(R*R + X*X));
    parameter Real sBser=((1/tap)/3)*(-2*X/(R*R + X*X));
    parameter Real mGser=((1/tap)/3)*(-R/(R*R + X*X));
    parameter Real mBser=((1/tap)/3)*(X/(R*R + X*X));
    parameter Real sGshk=((3 - 2*tap)/(3*tap*tap))*(R/(R*R + X*X));
    parameter Real sBshk=((3 - 2*tap)/(3*tap*tap))*(-X/(R*R + X*X));
    parameter Real mGshk=(1/(3*tap))*(R/(R*R + X*X));
    parameter Real mBshk=(1/(3*tap))*(-X/(R*R + X*X));
    parameter Real sGshm=((tap - 1)/(3*tap))*(2*R/(R*R + X*X));
    parameter Real sBshm=((tap - 1)/(3*tap))*(-2*X/(R*R + X*X));
    parameter Real mGshm=((tap - 1)/(3*tap))*(-R/(R*R + X*X));
    parameter Real mBshm=((tap - 1)/(3*tap))*(X/(R*R + X*X));

    //Writing the Y_ser matrix according to Simulight
    parameter Real[6, 6] Y_ser=[sGser, -sBser, mGser, -mBser, mGser, -mBser;
        sBser, sGser, mBser, mGser, mBser, mGser; mGser, -mBser, sGser, -sBser,
        mGser, -mBser; mBser, mGser, sBser, sGser, mBser, mGser; mGser, -mBser,
        mGser, -mBser, sGser, -sBser; mBser, mGser, mBser, mGser, sBser, sGser];

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real[6, 6] Yshtk=[sGshk, -sBshk, mGshk, -mBshk, mGshk, -mBshk;
        sBshk, sGshk, mBshk, mGshk, mBshk, mGshk; mGshk, -mBshk, sGshk, -sBshk,
        mGshk, -mBshk; mBshk, mGshk, sBshk, sGshk, mBshk, mGshk; mGshk, -mBshk,
        mGshk, -mBshk, sGshk, -sBshk; mBshk, mGshk, mBshk, mGshk, sBshk, sGshk];

    //Writing the Y_sht_m matrix according to Simulight
    parameter Real[6, 6] Yshtm=[sGshm, -sBshm, mGshm, -mBshm, mGshm, -mBshm;
        sBshm, sGshm, mBshm, mGshm, mBshm, mGshm; mGshm, -mBshm, sGshm, -sBshm,
        mGshm, -mBshm; mBshm, mGshm, sBshm, sGshm, mBshm, mGshm; mGshm, -mBshm,
        mGshm, -mBshm, sGshm, -sBshm; mBshm, mGshm, mBshm, mGshm, sBshm, sGshm];

    //Calculating the parameters for the Transformer
    //Writing the matrix A (Yser1+Yshtk)
    parameter Real[6, 6] A=Y_ser + Yshtk;

    //Writing the matrix B (-Yser1)
    parameter Real[6, 6] B=-Y_ser;

    //Writing the matrix C (-Yser2)
    parameter Real[6, 6] C=-Y_ser;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real[6, 6] D=Y_ser + Yshtm;

  algorithm
    PiMatrix := [A, B; C, D];
  end Yg_Y;

  function Y_Yg
    input Real X;
    input Real R;
    input Real tap;
    output Real[12, 12] PiMatrix;
  protected
    parameter Real sGser=((1/tap)/3)*(2*R/(R*R + X*X));
    parameter Real sBser=((1/tap)/3)*(-2*X/(R*R + X*X));
    parameter Real mGser=((1/tap)/3)*(-R/(R*R + X*X));
    parameter Real mBser=((1/tap)/3)*(X/(R*R + X*X));
    parameter Real sGshk=((1 - tap)/(3*tap*tap))*(2*R/(R*R + X*X));
    parameter Real sBshk=((1 - tap)/(3*tap*tap))*(-2*X/(R*R + X*X));
    parameter Real mGshk=((1 - tap)/(3*tap*tap))*(-R/(R*R + X*X));
    parameter Real mBshk=((1 - tap)/(3*tap*tap))*(X/(R*R + X*X));
    parameter Real sGshm=((3*tap - 2)/(3*tap))*(R/(R*R + X*X));
    parameter Real sBshm=((3*tap - 2)/(3*tap))*(-X/(R*R + X*X));
    parameter Real mGshm=(1/(3*tap))*(R/(R*R + X*X));
    parameter Real mBshm=(1/(3*tap))*(-X/(R*R + X*X));

    //Writing the Y_ser matrix according to Simulight
    parameter Real[6, 6] Y_ser=[sGser, -sBser, mGser, -mBser, mGser, -mBser;
        sBser, sGser, mBser, mGser, mBser, mGser; mGser, -mBser, sGser, -sBser,
        mGser, -mBser; mBser, mGser, sBser, sGser, mBser, mGser; mGser, -mBser,
        mGser, -mBser, sGser, -sBser; mBser, mGser, mBser, mGser, sBser, sGser];

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real[6, 6] Yshtk=[sGshk, -sBshk, mGshk, -mBshk, mGshk, -mBshk;
        sBshk, sGshk, mBshk, mGshk, mBshk, mGshk; mGshk, -mBshk, sGshk, -sBshk,
        mGshk, -mBshk; mBshk, mGshk, sBshk, sGshk, mBshk, mGshk; mGshk, -mBshk,
        mGshk, -mBshk, sGshk, -sBshk; mBshk, mGshk, mBshk, mGshk, sBshk, sGshk];

    //Writing the Y_sht_m matrix according to Simulight
    parameter Real[6, 6] Yshtm=[sGshm, -sBshm, mGshm, -mBshm, mGshm, -mBshm;
        sBshm, sGshm, mBshm, mGshm, mBshm, mGshm; mGshm, -mBshm, sGshm, -sBshm,
        mGshm, -mBshm; mBshm, mGshm, sBshm, sGshm, mBshm, mGshm; mGshm, -mBshm,
        mGshm, -mBshm, sGshm, -sBshm; mBshm, mGshm, mBshm, mGshm, sBshm, sGshm];

    //Calculating the parameters for the Transformer
    //Writing the matrix A (Yser1+Yshtk)
    parameter Real[6, 6] A=Y_ser + Yshtk;

    //Writing the matrix B (-Yser1)
    parameter Real[6, 6] B=-Y_ser;

    //Writing the matrix MC (-Yser2)
    parameter Real[6, 6] C=-Y_ser;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real[6, 6] D=Y_ser + Yshtm;

  algorithm
    PiMatrix := [A, B; C, D];
  end Y_Yg;
end TransfConnection;
