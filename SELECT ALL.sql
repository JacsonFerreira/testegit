SELECT DISTINCT CT.DTRECEB
	, MS.VLTOTAL
	, CT.*
FROM MOV_PEDIDO MP WITH (NOLOCK)
INNER JOIN MOV_ITPED MIP WITH (NOLOCK)
	ON MIP.CODFIL = MP.CODFIL
		AND MIP.TIPOPED = MP.TIPOPED
		AND MIP.NUMPEDVEN = MP.NUMPEDVEN
INNER JOIN MOV_SAIDA MS WITH (NOLOCK)
	ON MS.CODFIL = MP.CODFIL
		AND MS.TPNOTA = MP.TPNOTA
		AND MS.NUMPEDVEN = MP.NUMPEDVEN
		AND MP.TIPOPED = MS.TIPOPED
INNER JOIN MOV_ITSAIDA MIS WITH (NOLOCK)
	ON MIS.CODFIL = MS.CODFIL
		AND MIS.TPNOTA = MS.TPNOTA
		AND MIS.NUMNOTA = MS.NUMNOTA
		AND MIS.SERIE = MIS.SERIE
		AND MIS.DTNOTA = MS.DTNOTA
		AND MIS.CODITPROD = MIP.CODITPROD
INNER JOIN CRC_TITULO CT WITH (NOLOCK)
	ON CT.CODFIL = MS.CODFIL
		AND CT.TIPOPED = MS.TIPOPED
		AND CT.NUMPED = MS.NUMPEDVEN
INNER JOIN CRC_LANCTO CL WITH (NOLOCK)
	ON CL.CODFIL = CT.CODFIL
		AND CL.NUMTIT = CT.NUMTIT
		AND CL.NUMNOTA = MS.NUMNOTA
INNER JOIN CAD_CLIENTE CC WITH (NOLOCK)
	ON CC.CODCLI = MS.CODCLI
INNER JOIN CAD_ITPROD CP WITH (NOLOCK)
	ON CP.CODITPROD = MIS.CODITPROD
INNER JOIN CAD_FORNE CFO WITH (NOLOCK)
	ON CFO.CODFORNE = CP.CODFORNE
INNER JOIN CAD_LINHA CLI WITH (NOLOCK)
	ON CLI.CODLINHA = CP.CODLINHA
INNER JOIN CAD_FAMILIA CFA WITH (NOLOCK)
	ON CFA.CODFAM = CP.CODFAM
		AND CFA.CODLINHA = CP.CODLINHA
INNER JOIN CAD_GRUPO CG WITH (NOLOCK)
	ON CG.CODGRUPO = CP.CODGRUPO
		AND CG.CODFAM = CP.CODFAM
INNER JOIN CAD_SUBGRUP CSG WITH (NOLOCK)
	ON CSG.CODSUBGP = CP.CODSUBGP
		AND CSG.CODFAM = CP.CODFAM
INNER JOIN CAD_CONDPG CPA WITH (NOLOCK)
	ON CPA.CODFIL = MS.CODFIL
		AND CPA.CONDPGTO = MS.CONDPGTO
WHERE MS.CODFIL = 1
	AND CT.TIPOPED = 0
	AND MS.NUMNOTA = 801006
	AND MS.DTNOTA > '01/01/2018'
	--AND CL.NUMLANCTO > 3  
	/*
SELECT * FROM CAD_CONDPG
SELECT TIPOPED,NUMPEDVEN, * FROM MOV_SAIDA WHERE NUMNOTA=846794 
SELECT NUMPEDCLI,* FROM MOV_SAIDA  WHERE NUMNOTA=846794 
SELECT NUMPEDCLI,NUMPEDVEN,TIPOPED, * FROM MOV_SAIDA WHERE NUMNOTA=846794
SELECT NUMPEDCLI,TIPOPED, * FROM MOV_PEDIDO WHERE NUMPEDVEN=846794
SELECT CODPROD,CODITPROD,* FROM CAD_ITPROD WHERE CODITPROD IN ('70690',	'103128',	'103772',	'103775',	'103792',	'105460',	'116481',	'117824',	'120429',	'120781',	'121735',	'123923',	'126007',	'128165',	'129695',	'129746',	'129802',	'130572',	'132048',	'132189',	'132193')
SELECT * FROM MOV_SAIDA WHERE DTNOTA > '01/01/2019' AND TIPOPED=0
*/
