WITH combined_data AS (
    -- Combine all failure reasons and calculate their frequencies for the 'retail' table only
    SELECT 'no_budget' AS failure_reason, SUM(IFNULL(no_budget, 0)) AS frequency FROM retail
    UNION ALL
    SELECT 'competition', SUM(IFNULL(competition, 0)) FROM retail
    UNION ALL
    SELECT 'poor_market_fit', SUM(IFNULL(poor_market_fit, 0)) FROM retail
    UNION ALL
    SELECT 'acquisition_stagnation', SUM(IFNULL(acquisition_stagnation, 0)) FROM retail
    UNION ALL
    SELECT 'monetization_failure', SUM(IFNULL(monetization_failure, 0)) FROM retail
    UNION ALL
    SELECT 'niche_limits', SUM(IFNULL(niche_limits, 0)) FROM retail
    UNION ALL
    SELECT 'execution_flaws', SUM(IFNULL(execution_flaws, 0)) FROM retail
    UNION ALL
    SELECT 'trend_shifts', SUM(IFNULL(trend_shifts, 0)) FROM retail
    UNION ALL
    SELECT 'regulatory_pressure', SUM(IFNULL(regulatory_pressure, 0)) FROM retail
    UNION ALL
    SELECT 'overhype', SUM(IFNULL(overhype, 0)) FROM retail
),
total AS (
    -- Calculate the total frequency for the 'retail' table
    SELECT SUM(frequency) AS total_frequency
    FROM combined_data
)
SELECT 
    cd.failure_reason,
    SUM(cd.frequency) AS frequency,
    ROUND((SUM(cd.frequency) / t.total_frequency) * 100, 2) AS percentage,
    ROW_NUMBER() OVER (ORDER BY SUM(cd.frequency) DESC) AS `rank`
FROM 
    combined_data cd
JOIN 
    total t
GROUP BY 
    cd.failure_reason
ORDER BY 
    `rank` ASC;
