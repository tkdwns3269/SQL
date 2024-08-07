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

/*
    [Çüº¯È¯ ÇÔ¼ö]
    *TO_CHAR : ¼ýÀÚÅ¸ÀÔ ¶Ç´Â ³¯Â¥Å¸ÀÔÀÇ °ªÀ» ¹®ÀÚÅ¸ÀÔÀ¸·Î º¯È¯½ÃÄÑÁÖ´Â ÇÔ¼ö
    
    [Ç¥Çö¹ý]
    TO_CHAR(¼ýÀÚ|¹®ÀÚ, {Æ÷¸ä})
*/

--¼ýÀÚ ->¹®ÀÚ
SELECT TO_CHAR(1234) FROM DUAL;
SELECT TO_CHAR(12,'999999') FROM DUAL; -- 9ÀÇ ÀÚ¸®¼ö¸¸Å­ °ø°£ È®º¸, ¿À¸¥ÂÊ Á¤·Ä
SELECT TO_CHAR(12,'000000') FROM DUAL; -- 0ÀÇ ÀÚ¸®¼ö¸¸Å­ °ø°£ È®º¸, ºóÄ­À» 0À¸·Î Ã¤¿ò
SELECT TO_CHAR(2000000, 'L9999999') FROM DUAL; -- ÇöÀç ¼³ÀüµÈ ³ª¶óÀÇ ·ÎÄÃ È­Æó´ÜÀ§ ³ªÅ¸³¿

SELECT TO_CHAR(3500000, 'L9,999,999') FROM DUAL;

--³¯Â¥Å¸ÀÔ -> ¹®ÀÚÅ¸ÀÔ
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL; -- AM, PM ¾î¶² °ÍÀ» »ç¿ëÇÏ°Ç Çü½ÄÀ» Á¤ÇØÁÖ´Â °ÍÀÌ±â¿¡ µ¿ÀÏÇÏ°Ô ³ªÅ¸³²
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY DY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON, YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY"³â" MM"¿ù" DD"ÀÏ" HH:MI:SS') FROM DUAL;

--»ç¿øµéÀÇ ÀÌ¸§, ÀÔ»ç³¯Â¥(0000³â 00¿ù 00ÀÏ) Á¶È¸
SELECT EMP_NAME, TO_CHAR(HIRE_DATE, 'YYYY"³â" MM"¿ù" DD"ÀÏ"') 
FROM EMPLOYEE;

--³âµµ¿Í °ü·ÃµÈ Æ÷¸ä
SELECT TO_CHAR (SYSDATE, 'YYYY'),
        TO_CHAR (SYSDATE, 'YY'),
        TO_CHAR (SYSDATE, 'RRRR'), --RR·êÀÌ µû·Î Á¸ÀçÇÑ´Ù -> 50³â ÀÌ»ó°ªÀÌ +100EX)1954
        TO_CHAR (SYSDATE, 'YEAR')
FROM DUAL;

SELECT HIRE_DATE, TO_CHAR(HIRE_DATE, 'YY'), TO_CHAR(HIRE_DATE, 'RR') FROM EMPLOYEE;

--¿ù°ú °ü·ÃµÈ Æ÷¸ä
SELECT TO_CHAR(SYSDATE, 'MM'),
        TO_CHAR(SYSDATE, 'MON'),
        TO_CHAR(SYSDATE, 'MONTH')
FROM DUAL;

--ÀÏ¿¡ °ü·ÃµÈ Æ÷¸ä
SELECT TO_CHAR(SYSDATE, 'DDD'), --¿À´ÃÀÌ ÀÌ¹ø³âµµ¿¡ ¸î¹øÂ° ÀÏ¼ö
        TO_CHAR(SYSDATE, 'DD'), --¿À´Ã ÀÏÀÚ
        TO_CHAR(SYSDATE, 'D') --¿äÀÏ -> ¼ýÀÚ
FROM DUAL;

--¿äÀÏÀ» ³ªÅ¸³»´Â Æ÷¸ä
SELECT TO_CHAR(SYSDATE, 'DAY'),
        TO_CHAR(SYSDATE, 'DY')
FROM DUAL;

------------------------------------------------------------------

/*
    TO_DATE :¼ýÀÚÅ¸ÀÔ ¶Ç´Â ¹®ÀÚÅ¸ÀÔÀ» ³¯Â¥Å¸ÀÔÀ¸·Î º¯°æÇÏ´Â ÇÔ¼ö
    
    TO_DATE(¼ýÀÚ | ¹®ÀÚ , {Æ÷¸ä}) -> DATE
    
*/

SELECT TO_DATE(20100101) FROM DUAL;
SELECT TO_DATE(240807) FROM DUAL; --50³â ¹Ì¸¸Àº ÀÚµ¿À¸·Î 20XXÀ¸·Î ¼³Á¤ 50³â ÀÌ»óÀº 19XXÀ¸·Î ¼³Á¤µÈ´Ù.

SELECT TO_DATE(020505) FROM DUAL; --¼ýÀÚ´Â 0À¸·Î ½ÃÀÛÇÒ ¼ö ¾ø´Ù.
SELECT TO_DATE('020505') FROM DUAL;

SELECT TO_DATE('020505 120500') FROM DUAL;
SELECT TO_DATE('020505 120500','YYMMDD HH24MISS') FROM DUAL;

/*
    TO_NUMBER :¹®ÀÚÅ¸ÀÔÀÇ µ¥ÀÌÅÍ¸¦ ¼ýÀÚÅ¸ÀÔÀ¸·Î º¯È¯½ÃÄÑÁÖ´Â ÇÔ¼ö
    
    [Ç¥Çö¹ý]
    TO_NUMBER(¹®ÀÚ,{Æ÷¸ä})
*/

SELECT TO_NUMBER('05123456789') FROM DUAL;

SELECT '100000' + '55000' FROM DUAL;
SELECT '100,000' + '55,000' FROM DUAL;
SELECT TO_NUMBER('100,000', '999,999') + TO_NUMBER('55,000','99,000') FROM DUAL;

/*
    [NULLÃ³¸® ÇÔ¼ö]
*/

--*NVL (ÄÃ·³, ÇØ´çÄÃ·³ÀÌ NULLÀÏ °æ¿ì º¸¿©ÁÙ °ª)
SELECT EMP_NAME, NVL(BONUS, 0)
FROM EMPLOYEE;

--Àü »ç¿øÀÇ ÀÌ¸§, º¸³Ê½º Æ÷ÇÔ ¿¬ºÀ Á¶È¸
SELECT EMP_NAME, (SALARY + (SALARY * NVL(BONUS,0))) *12
FROM EMPLOYEE;

--*NVL2(ÄÃ·³, ¹ÝÈ¯°ª 1, ¹ÝÈ¯°ª 2)
--¹ÝÈ¯°ª1 : ÇØ´çÄÃ·³ÀÌ Á¸ÀçÇÒ °æ¿ì º¸¿©ÁÙ °ª
--¹ÝÈ¯°ª2 : ÇØ´çÄÃ·³ÀÌ NULLÀÏ°æ¿ì º¸¿©ÁÙ °ª
SELECT EMP_NAME, BONUS, NVL2(BONUS, 'o', 'x')
FROM EMPLOYEE;

--*NULLIF(ºñ±³´ë»ó1, ºñ±³´ë»ó2)
-- µÎ °ªÀÌ ÀÏÄ¡ÇÏ¸é NULL ÀÏÄ¡ÇÏÁö ¾ÊÀ¸¸é ºñ±³´ë»ó1 ¹ÝÈ¯
SELECT NULLIF('123', '123') FROM DUAL;
SELECT NULLIF('123', '456') FROM DUAL;

-------------------------------------------------
/*
    [¼±ÅÃÇÔ¼ö]
    *DECODE(ºñ±³ÇÏ°íÀÚÇÏ´Â ´ë»ó(ÄÃ·³, ¿¬»ê½Ä, ÇÔ¼ö½Ä), ºñ±³°ª1, °á°ú°ª1, ºñ±³°ª2, °á°ú°ª2...)
    
*/

--»ç¹ø, »ç¿ø¸í, ÁÖ¹Î¹øÈ£, ¼ºº°
SELECT EMP_ID, EMP_NAME, EMP_NO, 
        DECODE(SUBSTR(EMP_NO, 8, 1), '1', '³²', '2','¿©', '3','³²','4','¿©', '¿Ü°èÀÎ') AS "¼ºº°"
FROM EMPLOYEE;

--Á÷¿øÀÇ ¼º¸í, ±âÁ¸±Þ¿©, ÀÎ»óµÈ ±Þ¿© Á¶È¸ * °¢ Á÷±Þº°·Î ÀÎ»óÇØ¼­ Á¶È¸
--J7ÀÎ »ç¿øÀº ±Þ¿©¸¦ 10%ÀÎ»ó (SALARY * 1.1)
--J6ÀÎ »ç¿øÀº ±Þ¿©¸¦ 15%ÀÎ»ó (SALARY * 1.15) 
--J5ÀÎ »ç¿øÀº ±Þ¿©¸¦ 20%ÀÎ»ó (SALARY * 1.2)
--±×¿Ü »ç¿øµéÀº ±Þ¿©¸¦ 5%ÀÎ»ó (SALARY * 1.05)

SELECT EMP_NAME, SALARY AS "ÀÎ»óÀü",
        DECODE(JOB_CODE, 
        'J7', SALARY * 1.1,
        'J6', SALARY * 1.15,
        'J5', SALARY * 1.2,
         SALARY * 1.05) AS "ÀÎ»óÈÄ"      
FROM EMPLOYEE;

/*
    *CASE WHEN THEN
    
    CASE
        WHEN Á¶°Ç½Ä 1 THEN °á°ú°ª 1
        WHEN Á¶°Ç½Ä 2 THEN °á°ú°ª 2
        ...
        ELSE °á°ú°ª
    END
*/

SELECT EMP_NAME, SALARY,
        CASE 
            WHEN SALARY >=5000000 THEN '°í±Þ'
            WHEN SALARY >=3500000 THEN 'Áß±Þ'
            ELSE 'ÃÊ±Þ'
        END
FROM EMPLOYEE;


------------------------------------------------------

--1. SUM(¼ýÀÚÅ¸ÀÔÄÃ·³) : ÇØ´çÄ¿·³ °ªµéÀÇ ÃÑ ÇÕ°è¸¦ ±¸·¡¼­ ¹ÝÈ¯ÇØÁÖ´Â ÇÔ¼ö

--±Ù·ÎÀÚÅ×ÀÌºíÀÇ Àü»ç¿øÀÇ ÃÑ ±Þ¿©¸¦ ±¸ÇØ¶ó
SELECT SUM(SALARY)
FROM EMPLOYEE;

--³²ÀÚ»ç¿øµéÀÇ ÃÑ ±Þ¿©¸¦ ±¸ÇØ¶ó
SELECT SALARY
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN('1','3');

--ºÎ¼­ ÄÚµå°¡ D5ÀÎ »ç¿øµéÀÇ ÃÑ ¿¬ºÀ(±Þ¿© * 12)
SELECT SUM(SALARY*12)
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

--2. AVG(NUMBER) : ÇØ´ç ÄÃ·³°ªµéÀÇ Æò±ÕÀ» ±¸·¡¼­ ¹ÝÈ¯
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEE;

--3. MIN(¸ðµç Å¸ÀÔ°¡´É) : ÇØ´ç ÄÃ·³°ª Áß °¡Àå ÀÛÀº °ªÀ» ±¸ÇØ¼­ ¹ÝÈ¯
SELECT MIN(EMP_NAME), MIN(SALARY), MIN(HIRE_DATE)
FROM EMPLOYEE;

--4. MAX(¸ðµç Å¸ÀÔ °¡´É) : ÇØ´ç ÄÃ·³°ªµé Áß °¡Àå Å« °ªÀ» ±¸ÇØ¼­ ¹ÝÈ¯
SELECT MAX(EMP_NAME), MAX(SALARY), MAX(HIRE_DATE)
FROM EMPLOYEE;

--5. COUNT(* | ÄÃ·³ | DISTINCT ÄÃ·³) : ÇØ´ç Á¶°Ç¿¡ ¸Â´Â ÇàÀÇ °¹¼ö¸¦ ¼¼¼­ ¹ÝÈ¯
--COUNT(*) : Á¶È¸µÈ °á°ú¿¡ ¸ðµç ÇàÀÇ °¹¼ö¸¦ ¼¼¼­ ¹ÝÈ¯
--COUNT(ÄÃ·³) : Á¦½ÃÇÑ ÇØ´ç ÄÃ·³°ªÀÌ NULLÀÌ ¾Æ´Ñ °Í¸¸ ÇàÀÇ ¼ö¸¦ ¼¼¼­ ¹ÝÈ¯
--COUNT(DISRINCT ÄÃ·³) : ÇØ´ç ÄÃ·³°ª Áßº¹À» Á¦°ÅÇÑ ÈÄ ÇàÀÇ °¹¼ö¸¦ ¼¼¼­ ¹ÝÈ¯

--ÀüÃ¼ »ç¿ø ¼ö
SELECT COUNT(*) FROM EMPLOYEE;

SELECT COUNT(*)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = '2';

--º¸³Ê½º¸¦ ¹Þ´Â »ç¿ø ¼ö
SELECT COUNT(*)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

SELECT COUNT(BONUS)
FROM EMPLOYEE;

--ÇöÀç »ç¿øµéÀÌ ÃÑ ¸î°³ÀÇ ºÎ¼­¿¡ ºÐÆ÷µÇ¾î ÀÖ´ÂÁö¸¦ ±¸ÇØ¶ó
SELECT COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE;

--¿¬½À¹®Á¦

--1.1. JOB Å×ÀÌºíÀÇ ¸ðµç Á¤º¸ Á¶È¸
SELECT *
FROM JOB;

--2. JOB Å×ÀÌºíÀÇ Á÷±Þ ÀÌ¸§ Á¶È¸
SELECT JOB_NAME
FROM JOB;

--3. DEPARTMENT Å×ÀÌºíÀÇ ¸ðµç Á¤º¸ Á¶È¸
SELECT *
FROM DEPARTMENT;

--4. EMPLOYEEÅ×ÀÌºíÀÇ Á÷¿ø¸í, ÀÌ¸ÞÀÏ, ÀüÈ­¹øÈ£, °í¿ëÀÏ Á¶È¸
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE
FROM EMPLOYEE;

--5. EMPLOYEEÅ×ÀÌºíÀÇ ÀÔ»çÀÏ, »ç¿ø ÀÌ¸§, ¿ù±Þ Á¶È¸
SELECT HIRE_DATE, EMP_NAME, SALARY
FROM EMPLOYEE;

--6. EMPLOYEEÅ×ÀÌºí¿¡¼­ ÀÌ¸§, ¿¬ºÀ, ÃÑ¼ö·É¾×(º¸³Ê½ºÆ÷ÇÔ), ½Ç¼ö·É¾×(ÃÑ¼ö·É¾× - (¿¬ºÀ*¼¼±Ý 3%)) Á¶È¸
SELECT EMP_NAME, SALARY * 12 AS ¿¬ºÀ, (SALARY+ (SALARY * NVL(BONUS,0))) * 12 AS ÃÑ¼ö·É¾×,
(SALARY+ (SALARY * NVL(BONUS,0))) * 12 - ((SALARY + (SALARY * NVL(BONUS,0))) * 12 * 0.03) AS ½Ç¼ö·É¾×
FROM EMPLOYEE;

--7. EMPLOYEEÅ×ÀÌºí¿¡¼­ SAL_LEVELÀÌ S1(¿ù±ÞÀÌ 600¸¸~1000¸¸)ÀÎ »ç¿øÀÇ ÀÌ¸§, ¿ù±Þ, °í¿ëÀÏ, ¿¬¶ôÃ³ Á¶È¸
SELECT EMP_NAME, SALARY, HIRE_DATE, PHONE
FROM EMPLOYEE
WHERE SALARY BETWEEN 6000000 AND 10000000;

--8. EMPLOYEEÅ×ÀÌºí¿¡¼­ ½Ç¼ö·É¾×(6¹ø Âü°í)ÀÌ 5Ãµ¸¸¿ø ÀÌ»óÀÎ »ç¿øÀÇ ÀÌ¸§, ¿ù±Þ, ½Ç¼ö·É¾×, °í¿ëÀÏ Á¶È¸
SELECT EMP_NAME, SALARY, (SALARY+ (SALARY * NVL(BONUS,0))) * 12 
- ((SALARY + (SALARY * NVL(BONUS,0))) * 12 * 0.03) AS "½Ç¼ö·É¾×", HIRE_DATE
FROM EMPLOYEE
WHERE (SALARY+ (SALARY * NVL(BONUS,0))) * 12 
- ((SALARY + (SALARY * NVL(BONUS,0))) * 12 * 0.03) >=50000000;

--9. EMPLOYEEÅ×ÀÌºí¿¡ ¿ù±ÞÀÌ 4000,000ÀÌ»óÀÌ°í JOB_CODE°¡ J2ÀÎ »ç¿øÀÇ ÀüÃ¼ ³»¿ë Á¶È¸
SELECT *
FROM EMPLOYEE
WHERE SALARY > 4000000 AND JOB_CODE = 'J2';

--10. EMPLOYEEÅ×ÀÌºí¿¡ DEPT_CODE°¡ D9ÀÌ°Å³ª D5ÀÎ »ç¿ø Áß
-- °í¿ëÀÏÀÌ 02³â 1¿ù 1ÀÏº¸´Ù ºü¸¥ »ç¿øÀÇ ÀÌ¸§, ºÎ¼­ÄÚµå, °í¿ëÀÏ Á¶È¸
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE ='D9' OR DEPT_CODE ='D5') AND HIRE_DATE < '02/01/01';

--11. EMPLOYEEÅ×ÀÌºí¿¡ °í¿ëÀÏÀÌ 90/01/01 ~ 01/01/01ÀÎ »ç¿øÀÇ ÀüÃ¼ ³»¿ëÀ» Á¶È¸
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

--12. EMPLOYEEÅ×ÀÌºí¿¡¼­ ÀÌ¸§ ³¡ÀÌ '¿¬'À¸·Î ³¡³ª´Â »ç¿øÀÇ ÀÌ¸§ Á¶È¸
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%¿¬';

--13. EMPLOYEEÅ×ÀÌºí¿¡¼­ ÀüÈ­¹øÈ£ Ã³À½ 3ÀÚ¸®°¡ 010ÀÌ ¾Æ´Ñ »ç¿øÀÇ ÀÌ¸§, ÀüÈ­¹øÈ£¸¦ Á¶È¸
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

--14. EMPLOYEEÅ×ÀÌºí¿¡¼­ ¸ÞÀÏÁÖ¼Ò '_'ÀÇ ¾ÕÀÌ 4ÀÚÀÌ¸é¼­ DEPT_CODE°¡ D9 ¶Ç´Â D6ÀÌ°í
-- °í¿ëÀÏÀÌ 90/01/01 ~ 00/12/01ÀÌ°í, ±Þ¿©°¡ 270¸¸ ÀÌ»óÀÎ »ç¿øÀÇ ÀüÃ¼¸¦ Á¶È¸
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '____$_%' ESCAPE '$'  
AND (DEPT_CODE = 'D9' OR DEPT_CODE ='D6')
AND HIRE_DATE BETWEEN '90/01/01' AND '00/12/01'
AND SALARY >= 2700000;

--15. EMPLOYEEÅ×ÀÌºí¿¡¼­ »ç¿ø ¸í°ú Á÷¿øÀÇ ÁÖ¹Î¹øÈ£¸¦ ÀÌ¿ëÇÏ¿© »ý³â, »ý¿ù, »ýÀÏ Á¶È¸
SELECT EMP_NAME,
        SUBSTR(EMP_NO,1,2) AS »ý³â,
        SUBSTR(EMP_NO,3,2) AS »ý¿ù,
        SUBSTR(EMP_NO,5,2) AS »ýÀÏ
FROM EMPLOYEE;

--16. EMPLOYEEÅ×ÀÌºí¿¡¼­ »ç¿ø¸í, ÁÖ¹Î¹øÈ£ Á¶È¸ (´Ü, ÁÖ¹Î¹øÈ£´Â »ý³â¿ùÀÏ¸¸ º¸ÀÌ°Ô ÇÏ°í, '-'´ÙÀ½ °ªÀº '*'·Î ¹Ù²Ù±â)
--SELECT EMP_NAME, SUBSTR(EMP_NO,1,7) || '*******'
SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 7), 14, '*')
FROM EMPLOYEE;

--17. EMPLOYEEÅ×ÀÌºí¿¡¼­ »ç¿ø¸í, ÀÔ»çÀÏ-¿À´Ã, ¿À´Ã-ÀÔ»çÀÏ Á¶È¸
 --(´Ü, °¢ º°ÄªÀº ±Ù¹«ÀÏ¼ö1, ±Ù¹«ÀÏ¼ö2°¡ µÇµµ·Ï ÇÏ°í ¸ðµÎ Á¤¼ö(³»¸²), ¾ç¼ö°¡ µÇµµ·Ï Ã³¸®)
SELECT EMP_NAME, FLOOR(ABS(HIRE_DATE-SYSDATE)) AS ±Ù¹«ÀÏ¼ö1 ,
                  FLOOR(ABS(SYSDATE - HIRE_DATE)) AS ±Ù¹«ÀÏ¼ö2
FROM EMPLOYEE;

--18. EMPLOYEEÅ×ÀÌºí¿¡¼­ »ç¹øÀÌ È¦¼öÀÎ Á÷¿øµéÀÇ Á¤º¸ ¸ðµÎ Á¶È¸
SELECT *
FROM EMPLOYEE
WHERE MOD(EMP_ID ,2) = 1; --ÀÚµ¿Çüº¯È¯ ÇØÁÜ
--WHERE MOD(TO_NUMBER(EMP_ID) ,2) = 1;

--19. EMPLOYEEÅ×ÀÌºí¿¡¼­ ±Ù¹« ³â¼ö°¡ 20³â ÀÌ»óÀÎ Á÷¿ø Á¤º¸ Á¶È¸
SELECT *
FROM EMPLOYEE
--WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) > 240;
WHERE ADD_MONTHS(HIRE_DATE, 240) < SYSDATE;

--20. EMPLOYEE Å×ÀÌºí¿¡¼­ »ç¿ø¸í, ±Þ¿© Á¶È¸ (´Ü, ±Þ¿©´Â '\9,000,000' Çü½ÄÀ¸·Î Ç¥½Ã)
SELECT EMP_NAME, TO_CHAR(SALARY, 'L9,999,999')
FROM EMPLOYEE;

--21. EMPLOYEEÅ×ÀÌºí¿¡¼­ Á÷¿ø ¸í, ºÎ¼­ÄÚµå, »ý³â¿ùÀÏ, ³ªÀÌ(¸¸) Á¶È¸
-- (´Ü, »ý³â¿ùÀÏÀº ÁÖ¹Î¹øÈ£¿¡¼­ ÃßÃâÇØ¼­ 00³â 00¿ù 00ÀÏ·Î Ãâ·ÂµÇ°Ô ÇÏ¸ç
-- ³ªÀÌ´Â ÁÖ¹Î¹øÈ£¿¡¼­ Ãâ·ÂÇØ¼­ ³¯Â¥µ¥ÀÌÅÍ·Î º¯È¯ÇÑ ´ÙÀ½ °è»ê)
SELECT EMP_NAME, DEPT_CODE,
    SUBSTR(EMP_NO,1,2) || '³â' || SUBSTR(EMP_NO,1,2) || '¿ù' || SUBSTR(EMP_NO,1,2) || 'ÀÏ' AS »ýÀÏ,
    ABS(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'YY')))
    FROM EMPLOYEE;
--22. EMPLOYEEÅ×ÀÌºí¿¡¼­ ºÎ¼­ÄÚµå°¡ D5, D6, D9ÀÎ »ç¿ø¸¸ Á¶È¸ÇÏµÇ D5¸é ÃÑ¹«ºÎ, D6¸é ±âÈ¹ºÎ, D9¸é ¿µ¾÷ºÎ·Î Ã³¸®
-- (´Ü, ºÎ¼­ÄÚµå ¿À¸§Â÷¼øÀ¸·Î Á¤·Ä)
SELECT EMP_ID, EMP_NAME, DEPT_CODE,
        DECODE(DEPT_CODE, 'D5', 'ÃÑ¹«ºÎ', 'D6', '±âÈ¹ºÎ', 'D9', '¿µ¾÷ºÎ')
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6','D9')
ORDER BY DEPT_CODE;

---23. EMPLOYEEÅ×ÀÌºí¿¡¼­ »ç¹øÀÌ 201¹øÀÎ »ç¿ø¸í, ÁÖ¹Î¹øÈ£ ¾ÕÀÚ¸®, ÁÖ¹Î¹øÈ£ µÞÀÚ¸®, 
-- ÁÖ¹Î¹øÈ£ ¾ÕÀÚ¸®¿Í µÞÀÚ¸®ÀÇ ÇÕ Á¶È¸
SELECT EMP_NAME,
        SUBSTR(EMP_NO,1,6) AS ¾ÕÀÚ¸®,
        SUBSTR(EMP_NO, 8) AS µÞÀÚ¸®,
        SUBSTR(EMP_NO,1,6) + SUBSTR(EMP_NO, 8)
FROM EMPLOYEE
WHERE EMP_ID = 201;
--24. EMPLOYEEÅ×ÀÌºí¿¡¼­ ºÎ¼­ÄÚµå°¡ D5ÀÎ Á÷¿øÀÇ º¸³Ê½º Æ÷ÇÔ ¿¬ºÀ ÇÕ Á¶È¸
SELECT SUM((SALARY + (SALARY * NVL(BONUS,0))) *12)
FROM EMPLOYEE
WHERE DEPT_CODE= 'D5';
--25. EMPLOYEEÅ×ÀÌºí¿¡¼­ Á÷¿øµéÀÇ ÀÔ»çÀÏ·ÎºÎÅÍ ³âµµ¸¸ °¡Áö°í °¢ ³âµµº° ÀÔ»ç ÀÎ¿ø¼ö Á¶È¸
-- ÀüÃ¼ Á÷¿ø ¼ö, 2001³â, 2002³â, 2003³â, 2004³â
SELECT COUNT(*) AS ÀüÃ¼Á÷¿ø¼ö,
        COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2001, 1, NULL)) AS "2001³â",
        COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2002, 1, NULL)) AS "2002³â",
        COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2003, 1, NULL)) AS "2003³â",
        COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2004, 1, NULL)) AS "2004³â"
FROM EMPLOYEE;