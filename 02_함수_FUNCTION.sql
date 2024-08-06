SELECT EMP_ID, EMP_NAME, SALARY --3
FROM EMPLOYEE                   --1 ½ÇÇà ¼ø¼­
WHERE DEPT_CODE IS NULL;        --2
-- NULLÀ» ºñ±³ÇÒ ¶§´Â IS NULL ¶Ç´Â IS NOT NULL·Î ÇØ¾ßÇÑ´Ù.

/*
    <ORDER BYÀý>
    SELECT·Î °¡Àå ¸¶Áö¸· ÁÙ¿¡ ÀÛ¼º, ½ÇÇà¼ø¼­ ¶ÇÇÑ °¡Àå ¸¶Áö¸·¿¡ ½ÇÇàµÈ´Ù.
    
    [Ç¥Çö¹ý]
    SELECT Á¶È¸ÇÒ ÄÃ·³...
    FROM Á¶È¸ÇÒ Å×ÀÌºí
    WHERE Á¶°Ç½Ä
    ORDER BY Á¤·Ä±âÁØ µÉ ÄÃ·³ | º°Äª | ÄÃ·³¼ø¹ø [ASC | DESC] [NULLS FIRST | NULLS LAST]
    
    -ASC : ¿À¸§Â÷¼ø (ÀÛÀº °ªÀ¸·Î ½ÃÀÛÇØ¼­ °ªÀÌ Á¡Á¡ Ä¿Áö´Â °Í) ->±âº»°ª
    -DESC : ³»¸²Â÷¼ø (Å« °ªÀ¸·Î ½ÃÀÛÇØ¼­ °ªÀÌ Á¡Á¡ ÁÙ¾îµå´Â °Í)
    
    -NULLÀº ±âº»ÀûÀ¸·Î °¡Àå Å« °ªÀ¸·Î ºÐ·ùÇØ¼­ Á¤·ÄÇÑ´Ù.
    -NULLS FIRST : Á¤·ÄÇÏ°íÀÚ ÇÏ´Â ÄÃ·³ °ª¿¡ NULLÀÌ ÀÖÀ»°æ¿ì ÇØ´ç µ¥ÀÌÅÍ ¸Ç ¾Õ¿¡ ¹èÄ¡(DESCÀÏ¶§ ±âº»°ª)
    -NULLS LAST : Á¤·ÄÇÏ°íÀÚ ÇÏ´Â ÄÃ·³ °ª¿¡ NULLÀÌ ÀÖÀ»°æ¿ì ÇØ´ç µ¥ÀÌÅÍ ¸Ç ¸¶Áö¸·¿¡ ¹èÄ¡(ASCÀÏ¶§ ±âº»°ª)
    
*/

SELECT *
FROM EMPLOYEE
--ORDER BY BONUS; --±âº»°ªÀÌ ¿À¸§Â÷¼ø
--ORDER BY BONUS ASC;
--ORDER BY BONUS ASC NULLS FIRST;
--ORDER BY BONUS DESC; -- NULLS FIRST ±âº»°ª
ORDER BY BONUS DESC, SALARY ASC;
--Á¤·Ä ±âÁØ¿¡ ÄÃ·³°ªÀÌ µ¿ÀÏÇÒ °æ¿ì ±× ´ÙÀ½Â÷¼øÀ» À§ÇØ¼­ ¿©·¯°³¸¦ Á¦½ÃÇÒ ¼ö ÀÖ´Ù.

--Àü »ç¿øÀÇ »ç¿ø¸í, ¿¬ºÀ(º¸³Ê½º Á¦¿Ü) Á¶È¸(ÀÌ ¶§ ¿¬ºÀº° ³»¸²Â÷¼ø Á¤·Ä)
SELECT EMP_NAME, SALARY * 12 AS "¿¬ºÀ"
FROM EMPLOYEE
--ORDER BY SALARY * 12 DESC;
--ORDER BY ¿¬ºÀ DESC;
ORDER BY 2 DESC; --¼ø¹ø »ç¿ë°¡´É ¿À¶óÅ¬Àº ÀüºÎ 1ºÎÅÍ ½ÃÀÛ

/*
    <ÇÔ¼ö FUNCTION>
    Àü´ÞµÈ ÄÃ·³ °ªÀ» ¹Þ¾Æ¼­ ÇÔ¼ö¸¦ ½ÇÇàÇÑ °á°ú¸¦ ¹ÝÈ¯
    
    -´ÜÀÏÇà ÇÔ¼ö : N°³ÀÇ °ªÀ» ÀÐ¾îµé¿©¼­ N°³ÀÇ °á°ú°ªÀ» ¸®ÅÏ (¸ÅÇà¸¶´Ù ÇÔ¼ö ½ÇÇà °á°ú¸¦ ¹ÝÈ¯)
    -±×·ìÇÔ¼ö : N°³ÀÇ °ªÀ» ÀÐ¾îµé¿©¼­ 1°³ÀÇ °á°ú°ªÀ» ¸®ÅÏ(±×·ìÀ» Áö¾î¼­ ±×·ìº°·Î ÇÔ¼ö ½ÇÇà °á°ú¸¦ ¹ÝÈ¯)
    
    >>SELECT Àý¿¡ ´ÜÀÏÇà ÇÔ¼ö¶û ±×·ìÇÔ¼ö¸¦ ÇÔ²² »ç¿ëÇÏÁö ¸øÇÔ
    -> °á°ú ÇàÀÇ °¹¼ö°¡ ´Ù¸£±â ¶§¹®
    
    >>ÇÔ¼ö¸¦ »ç¿ëÇÒ ¼ö ÀÖ´Â À§Ä¡ : SELECTÀý WHEREÀý ORDER BYÀý HAVINGÀý
*/

--===========================<´ÜÀÏÇà ÇÔ¼ö>===============================

/*
    <¹®ÀÚÃ³¸®ÇÔ¼ö>
    
    *LENGTH(ÄÃ·³ | '¹®ÀÚ¿­') : ÇØ´ç ¹®ÀÚ¿­ÀÇ ±ÛÀÚ¼ö¸¦ ¹ÝÈ¯
    *LENGTHB(ÄÃ·³ | '¹®ÀÚ¿­') : ÇØ´ç ¹®ÀÚ¿­ÀÇ ¹ÙÀÌÆ® ¼ö¸¦ ¹ÝÈ¯
    
    'ÃÖ' '³ª' '¤¡' ÇÑ±ÛÀº ±ÛÀÚ´ç 3BYTE
    ¿µ¹®ÀÚ, ¼ýÀÚ, Æ¯¼ö¹®ÀÚ ±ÛÀÚ´ç 1BYTE
    
*/

SELECT LENGTH('¿À¶óÅ¬'), LENGTHB('¿À¶óÅ¬')
FROM DUAL;


SELECT LENGTH('ORACLE') , LENGTHB('ORACLE')
FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME)
FROM EMPLOYEE;

/*
    *INSTR
    ¹®ÀÚ¿­·ÎºÎÅÍ Æ¯Á¤ ¹®ÀÚÀÇ ½ÃÀÛÀ§Ä¡¸¦ Ã£¾Æ¼­ ¹ÝÈ¯
    
    INSTR(ÄÃ·³ | '¹®ÀÚ¿­', 'Ã£°íÀÚÇÏ´Â ¹®ÀÚ', (['Ã£À» À§Ä¡ÀÇ ½ÃÀÛ°ª, ¼ø¹ø']) -> °á°ú´Â NUMBER
*/
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL; --¾ÕÂÊ¿¡ ÀÖ´Â Ã¹ B´Â 3¹øÂ° À§Ä¡ÇØ ÀÖ´Ù.
--Ã£À» À§Ä¡ ½ÃÀÛ°ª: 1, ¼ø¹ø 1=> ±âº»°ª
SELECT INSTR('AABAACAABBAA', 'B',1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; --µÚ¿¡¼­ºÎÅÍ Ã£¾Æ¼­ ÀÐÀ» ¶§´Â ¾Õ¿¡¼­ºÎÅÍ ÀÐ¾îÁØ´Ù.
SELECT INSTR('AABAACAABBAA', 'B',1,2) FROM DUAL; --¼ø¹øÀ» Á¦½ÃÇÏ·Á¸é À§Ä¡ÀÇ ½ÃÀÛ°ªÀ» Ç¥½ÃÇØ¾ßÇÑ´Ù.
SELECT INSTR('AABAACAABBAA', 'B',1,3) FROM DUAL;

SELECT EMAIL, INSTR(EMAIL, '_' , 1, 1), INSTR(EMAIL, '@')
FROM EMPLOYEE;

/*
    SUBSTR
    ¹®ÀÚ¿­¿¡¼­ Æ¯Á¤ ¹®ÀÚ¿­À» ÃßÃâÇØ¼­ ¹ÝÈ¯
    
    [Ç¥Çö¹ý]
    SUBSTR{STRING, POSITION, (LENGTH)}
    -STRING : ¹®ÀÚÅ¸ÀÔ ÄÃ·³ | '¹®ÀÚ¿­'
    -POSITION : ¹®ÀÚ¿­ ÃßÃâÇÒ ½ÃÀÛÀ§Ä¡ °ª
    -LENTH :ÃßÃâÇÒ ¹®ÀÚ °¹¼ö(»ý·«ÇÏ¸é ³¡±îÁö)
    
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL; -- 7¹øÂ° À§Ä¡ºÎÅÍ ³¡±îÁö ÃßÃâ
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL; --SHOW ME
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) AS "¼ºº°"
FROM EMPLOYEE;

--»ç¿øµéÁß ¿©»ç¿øµé¸¸ EMP_NO, EMP_NAME Á¶È¸
SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4'
ORDER BY EMP_NAME;

--ÇÔ¼ö ÁßÃ³»ç¿ë °¡´É
--ÀÌ¸ÞÀÏÀÇ ¾ÆÀÌµðºÎºÐ ÃßÃâ
--»ç¿ø¸ñ·Ï¿¡¼­ »ç¿ø¸í, ÀÌ¸ÞÀÏ, ¾ÆÀÌµð Á¶È¸
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL , 1, INSTR(EMAIL , '@') -1)
FROM EMPLOYEE;

----------------------------------------------------------------

/*
    *LPAD/RPAD
    ¹®ÀÚ¿­À» Á¶È¸ÇÒ ¶§ ÅëÀÏ°¨ÀÖ°Ô Á¶È¸ÇÏ°íÀÚ ÇÒ ¶§ »ç¿ë
    
    [Ç¥Çö¹ý]
    LPAD / RPAD (STRING , ÃÖÁ¾ÀûÀ¸·Î ¹ÝÈ¯ÇÒ ¹®ÀÚ¿­ÀÇ ±æÀÌ, [µ¡ºÙÀÌ°íÀÚ ÇÏ´Â ¹®ÀÚ])
    
    ¹®ÀÚ¿­¿¡ µ¡ºÙÀÌ°íÀÚ ÇÏ´Â ¹®ÀÚ¸¦ ¿ÞÂÊ ¶Ç´Â ¿À¸¥ÂÊ¿¡ ºÙ¿©¼­ ÃÖÁ¾ N±æÀÌ¸¸Å­ ¹®ÀÚ¿­À» ¹ÝÈ¯
*/
--20¸¸Å­ÀÇ ±æÀÌ Áß EAMILÄÃ·³°ªÀº ¿À¸¥ÂÊÀ¸·Î Á¤·ÄÇÏ°í ³ª¸ÓÁö ºÎºÐÀº °ø¹éÀ¸·Î Ã¤¿î´Ù.
SELECT EMP_NAME, LPAD(EMAIL, 20)
FROM EMPLOYEE;

SELECT EMP_NAME, LPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

--»ç¿øµéÀÇ »ç¿ø¸í, ÁÖ¹Îµî·Ï¹øÈ£ Á¶È¸("701011-1XXXXXXX")
SELECT EMP_NAME, SUBSTR(EMP_NO, 1,8) || 'XXXXXX'
--SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14, 'X')
FROM EMPLOYEE;

----------------------------------------------------------------

/*
    *LTRIM/ RTRIM
    ¹®ÀÚ¿­¿¡¼­ Æ¯Á¤ ¹®ÀÚ¸¦ Á¦°ÅÇÑ ³ª¸ÓÁö¸¦ ¹ÝÈ¯
    
    LTRIM/RTRIM(STRING, [Á¦°ÅÇÏ°íÀÚ ÇÏ´Â ¹®ÀÚµé])
    
    ¹®ÀÚ¿­ÀÇ ¿ÞÂÊ È¤Àº ¿À¸¥ÂÊ¿¡¼­ Á¦°ÅÇÏ°íÀÚ ÇÏ´Â ¹®ÀÚµéÀ» Ã£¾Æ¼­ Á¦°ÅÇÑ ³ª¸ÓÁö ¹®ÀÚ¿­ ¹ÝÈ¯
*/

SELECT LTRIM('       K      H    ') FROM DUAL;
SELECT LTRIM('ACBABCAABCKKH', 'ABC') FROM DUAL;
SELECT RTRIM('51354321KH543542' , '0123456789') FROM DUAL;

----------------------------------------------------------------

/*
    *TRIM
    ¹®ÀÚ¿­ÀÇ ¾Õ/µÚ/¾çÂÊ¿¡ ÀÖ´Â ÁöÁ¤ÇÑ ¹®ÀÚµéÀ» Á¦°ÅÇÑ ³ª¸ÓÁö ¹®ÀÚ¿­ ¹ÝÈ¯
    TRIM([LEADING | TRAILING | BOTH] Á¦°ÅÇÏ°íÀÚ ÇÏ´Â ¹®ÀÚ¿­ FROM ¹®ÀÚ¿­)
*/

SELECT TRIM('          K        H          ') FROM DUAL; --¾çÂÊ¿¡ ÀÖ´Â °ø¹é Á¦°Å
SELECT TRIM('Z' FROM 'ZZZZZZKHZZZZZZZZZZZ') FROM DUAL;

SELECT TRIM(LEADING 'Z' FROM 'ZZZZZZZZZZZZKHZZZZZZZZ') FROM DUAL; --LTRIM
SELECT TRIM(TRAILING 'Z' FROM 'ZZZZZZZZZZZZKHZZZZZZZZ') FROM DUAL; --RTRIM

----------------------------------------------------------------
/*
    *LOWER/ UPPER/ INITCAP
    LOWER : ´Ù ¼Ò¹®ÀÚ·Î º¯°æÇÑ ¹®ÀÚ¿­ ¹ÝÈ¯
    UPPER : ´Ù ´ë¹®ÀÚ·Î º¯°æÇÑ ¹®ÀÚ¿­ ¹ÝÈ¯
    INITCAP : ¶ç¾î¾²±â ±âÁØ Ã¹±ÛÀÚ¸¶´Ù ´ëºÐÀÚ·Î º¯°æÇÑ ¹®ÀÚ¿­ ¹ÝÈ¯
    
*/

SELECT LOWER('Welcom To my KH') FROM DUAL;
SELECT UPPER('Welcom To my KH') FROM DUAL;
SELECT INITCAP('welcom to my kH') FROM DUAL;

----------------------------------------------------------------
/*
    *CONCAT
    ¹®ÀÚ¿­ µÎ°³ Àü´Þ¹Þ¾Æ ÇÏ³ª·Î ÇÕÄ£ ÈÄ ¹ÝÈ¯
    CONCAT(STRING1, STRING2)
    
*/

SELECT CONCAT('°¡³ª´Ù', 'ABC') FROM DUAL;
SELECT '°¡³ª´Ù' || 'ABC' FROM DUAL;

----------------------------------------------------------------
/*
    *REPLACE
    Æ¯Á¤ ¹®ÀÚ¿­¿¡¼­ Æ¯Á¤ºÎºÐÀ» ´Ù¸¥ ºÎºÐÀ¸·Î ±³Ã¼
    REPLACE(¹®ÀÚ¿­, Ã£À» ¹®ÀÚ¿­, º¯°æÇÒ ¹®ÀÚ¿­)
    
*/
SELECT EMAIL, REPLACE(EMAIL, 'KH.or.kr', 'gmail.com')
FROM EMPLOYEE;

----------------------------------------------------------------
/*
    <¼ýÀÚ Ã³¸®ÇÔ¼ö>
    
    *ABS
    ¼ýÀÚÀÇ Àý´ë°ªÀ» ±¸ÇØÁÖ´Â ÇÔ¼ö

*/

SELECT ABS(-10), ABS(-6.3) FROM DUAL;

----------------------------------------------------------------

/*
    *MOD
    µÎ ¼ö¸¦ ³ª´« ³ª¸ÓÁö°ªÀ» ¹ÝÈ¯
    MOD(NUMBER,NUMBER)
*/

SELECT MOD(10,3) FROM DUAL;
SELECT MOD(10.9,3) FROM DUAL;

----------------------------------------------------------------

/*
    *ROUND
    ¹Ý¿Ã¸²ÇÑ °á°ú¸¦ ¹ÝÈ¯
    ROUND(NUMBER, [À§Ä¡])
*/

SELECT ROUND(123.456) FROM DUAL; --±âº»Áö¼ö´Â ¼Ò¼öÁ¡ Ã¹¹øÂ° ÀÚ¸®¿¡¼­ ¹Ý¿Ã¸²
SELECT ROUND(123.456, 1) FROM DUAL; -- ¾ç¼ö·Î Áõ°¡ÇÒ¼ö·Ï ¼Ò¼öÁ¡ µÚ·Î ÇÑÄ­¾¿ ÀÌµ¿
SELECT ROUND(123.456, -1) FROM DUAL; --À½¼ö·Î °¨¼ÒÇÒ¼ö·Ï ¼Ò¼öÁ¡ ¾ÕÀÚ¸®·Î ÀÌµ¿

----------------------------------------------------------------

/*
    *CEIL
    ¿Ã¸²Ã³¸®¸¦ À§ÇÑ ÇÔ¼ö
    CEIL(NUMBER)
*/

SELECT CEIL(123.456) FROM DUAL;

----------------------------------------------------------------

/*
    TRUNC
    ¹ö¸²Ã³¸® ÇÔ¼ö
    
    TRUNC(NUMBER,[À§Ä¡])
*/

SELECT TRUNC(123.952) FROM DUAL;
SELECT TRUNC(123.952,1) FROM DUAL;
SELECT TRUNC(123.952, -1) FROM DUAL;

------------------------------¹®Á¦----------------------------------
--°Ë»öÇÏ°íÀÚ ÇÏ´Â ³»¿ë
--JOB_CODE°¡ J7ÀÌ°Å³ª J6ÀÌ¸é¼­ SALARY°ªÀÌ 200¸¸¿ø ÀÌ»óÀÌ°í
--BONUS°¡ ÀÖ°í ¿©ÀÚÀÎ »ç¿øÀÇ ÀÌ¸§, ÁÖ¹Î¹øÈ£, Á÷±ÞÄÚµå, ±Þ¿©, º¸³Ê½º¸¦ Á¶È¸ÇÏ°í ½Í´Ù.

SELECT EMP_NAME AS ÀÌ¸§ , EMP_NO AS ÁÖ¹Î¹øÈ£ , SALARY AS ±Þ¿© , BONUS AS º¸³Ê½º, JOB_CODE AS Á÷±ÞÄÚµå
FROM EMPLOYEE
WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J6') AND SALARY >= 2000000 
AND BONUS IS NOT NULL AND (SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4');

-----------------------------------------------------------------------

/*
    <³¯Â¥ Ã³¸®ÇÔ¼ö>
    
*/

-- *SYSDATE: ½Ã½ºÅÛÀÇ ÇöÀç ³¯Â¥ ¹× ½Ã°£À» ¹ÝÈ¯
SELECT SYSDATE FROM DUAL;

-- *MONTHS_BETWEEN: µÎ ³¯Â¥ »çÀÌÀÇ °³¿ù ¼ö
-- »ç¿øµéÀÇ »ç¿ø¸í, ÀÔ»çÀÏ, ±Ù¹« ÀÏ¼ö, ±Ù¹« °³¿ù¼ö Á¶È¸
SELECT EMP_NAME, HIRE_DATE, FLOOR(SYSDATE - HIRE_DATE),
        CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
FROM EMPLOYEE;

--------------------------------------------------------

--*ADD_MONTHS : Æ¯Á¤ ³¯Â°¿¡ NUMBER °³¿ù¼ö¸¦ ´õÇØ¼­ ¹ÝÈ¯
SELECT ADD_MONTHS(SYSDATE, 4) FROM DUAL;

--±Ù·ÎÀÚ Å×ÀÌºí¿¡¼­ »ç¿ø¸í, ÀÔ»çÀÏ, ÀÔ»çÈÄ 3°³¿ùÀÇ ³¯Â¥ Á¶È¸
SELECT EMP_NAME AS »ç¿ø¸í , HIRE_DATE AS ÀÔ»çÀÏ, ADD_MONTHS(HIRE_DATE, 3) AS "ÀÔ»çÈÄ 3°³¿ù"
FROM EMPLOYEE;

-- *NEXT_DAY(DATE, ¿äÀÏ(¹®ÀÚ | ¼ýÁö)) : Æ¯Á¤³¯Â¥ ÀÌÈÄ °¡Àå °¡±î¿î ¿äÀÏÀÇ ³¯Â¥¸¦ ¹ÝÈ¯
SELECT NEXT_DAY(SYSDATE, 'Åä¿äÀÏ') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 'Åä') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL;

-- 1:ÀÏ, ~7: Åä
SELECT NEXT_DAY(SYSDATE, 7) FROM DUAL;

--¾ð¾î º¯°æ
ALTER SESSION SET NLS_LANGUAGE = KOREAN;
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;

-- *LAST_DAY(DATE) : ÇØ´ç¿ùÀÇ ¸¶Áö¸· ³¯Â¥ ±¸ÇØ¼­ ¹ÝÈ¯
SELECT LAST_DAY(SYSDATE) FROM DUAL;

/*
    *EXTRACT : Æ¯Á¤ ³¯Â¥·ÎºÎÅÍ ³â|¿ù|ÀÏ °ªÀ» ÃßÃâÇØ¼­ ¹ÝÈ¯ÇÏ´Â ÇÔ¼ö
    
    [Ç¥Çö¹ý]
    EXTRACT(YEAR FROM DATE) : ¿¬µµ¸¸ ÃßÃâ
    EXTRACT(MONTH FROM DATE) : ¿ù ¸¸ Ãß­Œ
    EXTRACT(DAY FROM DATE) : ÀÏ ¸¸ ÃßÃâ
*/

-- »ç¿øÀÇ »ç¿ø¸í, ÀÔ»ç³âµµ, ÀÔ»ç¿ù, ÀÔ»çÀÏÀ» Á¶È¸
SELECT EMP_NAME,
        EXTRACT(YEAR FROM HIRE_DATE) AS ÀÔ»ç³âµµ,
        EXTRACT(MONTH FROM HIRE_DATE) AS ÀÔ»ç¿ù,
        EXTRACT(DAY FROM HIRE_DATE) AS ÀÔ»çÀÏ
FROM EMPLOYEE
ORDER BY 2, 3, 4;
        