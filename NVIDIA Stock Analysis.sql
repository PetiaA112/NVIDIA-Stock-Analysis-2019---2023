SELECT *
  FROM [Project].[dbo].[NVIDIA Monthly Price change 2019 - 2023 ]

  ------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   --Adding Price_Gap column to see the difference between open and closing price 
  ALTER TABLE [Project].[dbo].[NVIDIA Monthly Price change 2019 - 2023 ]
  DROP COLUMN PRICE_GAP
  ALTER TABLE [Project].[dbo].[NVIDIA Monthly Price change 2019 - 2023 ]
  ADD PRICE_GAP INT
------------------------------------------------------------------------------------
UPDATE [Project].[dbo].[NVIDIA Monthly Price change 2019 - 2023]
SET PRICE_GAP = [CLOSE] - [OPEN];

SELECT *
  FROM [Project].[dbo].[NVIDIA Monthly Price change 2019 - 2023 ]
------------------------------------------------------------------------------------

-- Lowest and Highest PRICE_GAP BY EACH MONTH
SELECT YEAR, MONTH,  MIN(PRICE_GAP) AS MIN_PRICE_GAP
FROM [Project].[dbo].[NVIDIA Monthly Price change 2019 - 2023 ]
GROUP BY YEAR, month,  PRICE_GAP
ORDER BY  YEAR DESC, MIN_PRICE_GAP
--Lowest Gap
--2023 April ( - 30 )          --2022 April ( -88 )            --2021 December ( - 38 )      --2020 October ( - 12 )             --2019 August ( 0 )

--Highest Gap
--2023 May ( 100)              -- 2022 July ( 33 )             -- 2021 November ( 70 )       --2020 August ( 26 )                --2019 October ( 7 )



                                                 --Adding new column HIGH_AND_LOW_GAP to shows difference between high and low points 
  ALTER TABLE [Project].[dbo].[NVIDIA Monthly Price change 2019 - 2023 ]
  ADD HIGH_AND_LOW_GAP INT
  ---------------------------------------------------------------------------
  UPDATE [Project].[dbo].[NVIDIA Monthly Price change 2019 - 2023 ]
  SET HIGH_AND_LOW_GAP = [LOW]-[HIGH]; 
  ---------------------------------------------------------------------------
  SELECT *
  FROM [Project].[dbo].[NVIDIA Monthly Price change 2019 - 2023 ]
  ---------------------------------------------------------------------------
--Lowest  HIGH_AND_LOW_GAP BY EACH MONTH
SELECT YEAR, MONTH, MIN(HIGH_AND_LOW_GAP) AS MIN_HIGH_AND_LOW_GAP
FROM [Project].[dbo].[NVIDIA Monthly Price change 2019 - 2023]
GROUP BY YEAR, MONTH
ORDER BY YEAR DESC,  MIN_HIGH_AND_LOW_GAP asc
--Lowest Gap
--2023 May ( - 147 )            --2022 January ( -98 )          --2021 November ( - 94 )      --2020 September ( - 30 )         --2019 December ( -10 )

--Highest Gap
--2023 April ( -19 )            --2022 September ( -26 )        --2021 January ( -14 )        --2020 January ( - 7 )            --2019 July ( -4 )



                                                               --Market Volume
--Lowest Volume BY EACH MONTH
SELECT YEAR, MONTH, MIN(VOLUME) AS MIN_VOLUME
FROM [Project].[dbo].[NVIDIA Monthly Price change 2019 - 2023]
GROUP BY YEAR, MONTH
ORDER BY YEAR DESC, MIN_VOLUME ASC
--Lowest
--2023 August ( 563964491 )    --2022 December ( 894615139 )   --2021 October ( 497107602 )   --2020  December ( 512283188 )   -- 2019 July ( 406028264 )

--Highest 
--2023 May ( 1169781884 )      --2022 May ( 1383301875 )       --2021 December ( 1106280599 ) --2020 September ( 1586047080 )  --2019 August ( 954937076 )
------------------------------------------------------------------------------------------------------------------------------------------------------------




                                                                --SUMMARY--  

--( The closest numbers to 0 indicates the smallest change , except the Market Volume which represent the total volume of stock (VALUE OF SHARE * TOTAL NUMBER OF SHARES = TOTAL MARKET VOLUME)

                                    --WHICH MONTHS HAS THE LOWEST  AND HIGHEST PRICE GAP DURING 2019 - 2023 ? 
										 --( GAP MEASURED BETWEEN OPENING AND CLOSING MARKET PRICE )

--Lowest Gap
--2023 April ( - 30 )          --2022 April ( -88 )            --2021 December ( - 38 )      --2020 October ( - 12 )             --2019 August ( 0 )

--Highest Gap
--2023 May ( 100)              -- 2022 July ( 33 )             -- 2021 November ( 70 )       --2020 August ( 26 )                --2019 October ( 7 )
-- The Lowest Gap can be observed in April month, which steadily increased from 2019 to 2022 then dropped down to ( -30 ) in year 2023 
--The highest price gap compared to lowest gap has fluctuated during 2019 - 2023

-----------------------------------------------------------------------------------------------------------------------------------------------------------


                                             --WHICH MONTHS HAS THE LOWEST  AND HIGHEST GAP DURING 2019 - 2023 ? 
											 --( CLOSING MARKET PRICE USED AS REFERENCE TO MEASURE THE GAP ) 

--Lowest Gap
--2023 May ( - 147 )            --2022 January ( -98 )          --2021 November ( - 94 )      --2020 September ( - 30 )         --2019 December ( -10 )

--Highest Gap
--2023 April ( 19 )            --2022 September ( 26 )        --2021 January ( 14 )        --2020 January (  7 )            --2019 July ( 4 )
--The Lowest gap has steadily increased from 2019 ( -10 ) to 2023 ( -147 ) years, the smallest change can be observed between 2021 November ( - 94 ) and 2022 January (-98 )
--Steadily increase of highest gap between 2019 - 2022, followed by drop in 2023 
--Overall the highest and lowest gap indicates market volatility. The lowest market volatility can be observed in the year 2019, and the highest in 2022 as in this year both
-- indicators for Highest and Lowest gap are far from 0
-----------------------------------------------------------------------------------------------------------------------------------------------------------

                                                            
						                --WHICH MONTHS HAVE THE LOWEST  AND HIGHEST MARKET VOLUME 2019 - 2023 ? 	
															--VOLUME BY EACH MONTH--

--Lowest 
--2023 August ( 563964491 )    --2022 December ( 894615139 )   --2021 October ( 497107602 )   --2020  December ( 512283188 )   -- 2019 July ( 406028264 )

--Highest
--2023 May ( 1169781884 )      --2022 May ( 1383301875 )       --2021 December ( 1106280599 ) --2020 September ( 1586047080 )  --2019 August ( 954937076 )
--Stock has reached the lowest volume in 2019 July and highest in 2020 September.

-----------------------------------------------------------------------------------------------------------------------------------------------------------

