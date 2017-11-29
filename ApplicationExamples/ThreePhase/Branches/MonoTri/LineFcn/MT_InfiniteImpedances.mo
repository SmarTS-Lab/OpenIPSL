within ThreePhase.Branches.MonoTri.LineFcn;
function MT_InfiniteImpedances
  input Real[1, 18] Yser;
  input Real[1, 18] Ysht;
  output Real[1, 32] Y;
  //Writing the Y_ser matrix
protected
  parameter Real Gaaser=Yser[1, 1];
  parameter Real Baaser=Yser[1, 2];
  parameter Real Gabser=Yser[1, 3];
  parameter Real Babser=Yser[1, 4];
  parameter Real Gacser=Yser[1, 5];
  parameter Real Bacser=Yser[1, 6];
  parameter Real Gbaser=Yser[1, 7];
  parameter Real Bbaser=Yser[1, 8];
  parameter Real Gbbser=Yser[1, 9];
  parameter Real Bbbser=Yser[1, 10];
  parameter Real Gbcser=Yser[1, 11];
  parameter Real Bbcser=Yser[1, 12];
  parameter Real Gcaser=Yser[1, 13];
  parameter Real Bcaser=Yser[1, 14];
  parameter Real Gcbser=Yser[1, 15];
  parameter Real Bcbser=Yser[1, 16];
  parameter Real Gccser=Yser[1, 17];
  parameter Real Bccser=Yser[1, 18];
  //Writing the Y_sht matrix
  parameter Real Gaasht=Ysht[1, 1];
  parameter Real Baasht=Ysht[1, 2];
  parameter Real Gabsht=Ysht[1, 3];
  parameter Real Babsht=Ysht[1, 4];
  parameter Real Gacsht=Ysht[1, 5];
  parameter Real Bacsht=Ysht[1, 6];
  parameter Real Gbasht=Ysht[1, 7];
  parameter Real Bbasht=Ysht[1, 8];
  parameter Real Gbbsht=Ysht[1, 9];
  parameter Real Bbbsht=Ysht[1, 10];
  parameter Real Gbcsht=Ysht[1, 11];
  parameter Real Bbcsht=Ysht[1, 12];
  parameter Real Gcasht=Ysht[1, 13];
  parameter Real Bcasht=Ysht[1, 14];
  parameter Real Gcbsht=Ysht[1, 15];
  parameter Real Bcbsht=Ysht[1, 16];
  parameter Real Gccsht=Ysht[1, 17];
  parameter Real Bccsht=Ysht[1, 18];
  //Calculating the parameters for the MonoxTri interface
  //Calculating some auxiliary variables
  parameter Real G1=(Gaasht + Gaaser + Gbbsht + Gbbser + Gccsht + Gccser)/3;
  parameter Real B1=(Baasht + Baaser + Bbbsht + Bbbser + Bccsht + Bccser)/3;
  parameter Real G2=(Gbasht + Gbaser + Gacsht + Gacser + Gcbsht + Gcbser)/3;
  parameter Real B2=(Bbasht + Bbaser + Bacsht + Bacser + Bcbsht + Bcbser)/3;
  parameter Real G3=(Gabsht + Gabser + Gbcsht + Gbcser + Gcasht + Gcaser)/3;
  parameter Real B3=(Babsht + Babser + Bbcsht + Bbcser + Bcasht + Bcaser)/3;
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
  parameter Real D11r=Gaaser + Gaasht;
  parameter Real D11i=Baaser + Baasht;
  parameter Real D12r=Gabser + Gabsht;
  parameter Real D12i=Babser + Babsht;
  parameter Real D13r=Gacser + Gacsht;
  parameter Real D13i=Bacser + Bacsht;
  parameter Real D21r=Gbaser + Gbasht;
  parameter Real D21i=Bbaser + Bbasht;
  parameter Real D22r=Gbbser + Gbbsht;
  parameter Real D22i=Bbbser + Bbbsht;
  parameter Real D23r=Gbcser + Gbcsht;
  parameter Real D23i=Bbcser + Bbcsht;
  parameter Real D31r=Gcaser + Gcasht;
  parameter Real D31i=Bcaser + Bcasht;
  parameter Real D32r=Gcbser + Gcbsht;
  parameter Real D32i=Bcbser + Bcbsht;
  parameter Real D33r=Gccser + Gccsht;
  parameter Real D33i=Bccser + Bccsht;
algorithm
  Y := [Ar, Ai, MB1r, MB1i, MB2r, MB2i, MB3r, MB3i, C1r, C1i, C2r, C2i, C3r,
    C3i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i,
    D31r, D31i, D32r, D32i, D33r, D33i];
end MT_InfiniteImpedances;
