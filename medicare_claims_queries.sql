Count Total Claims

SELECT COUNT(*) AS total_claims 
FROM `medicare_claims_errors.medicare_claims_data`;

Count Approvals vs. Denials
SELECT `Review Decision`, COUNT(*) AS claim_count
FROM `medicare_claims_errors.medicare_claims_data`
GROUP BY `Review Decision`;

Identify the Most Common Error Codes
SELECT `Error Code`, COUNT(*) AS frequency
FROM `medicare_claims_errors.medicare_claims_data`
WHERE `Error Code` IS NOT NULL AND `Error Code` <> '-'
GROUP BY `Error Code`
ORDER BY frequency DESC
LIMIT 10;

Find Providers with the Most Overturned Claims

SELECT `Provider Type`, COUNT(*) AS overturned_count
FROM `medicare_claims_errors.medicare_claims_data`
WHERE `Error Code` = 'Overturned'
GROUP BY `Provider Type`
ORDER BY overturned_count DESC
LIMIT 5;

Analyze Claims by Provider Type

SELECT `Provider Type`, COUNT(*) AS total_claims
FROM `medicare_claims_errors.medicare_claims_data`
GROUP BY `Provider Type`
ORDER BY total_claims DESC;

