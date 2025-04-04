WITH combined_data AS (
    -- Combine all failure reasons and calculate their frequencies across the tables
    SELECT 'no_budget' AS failure_reason, SUM(IFNULL(no_budget, 0)) AS frequency FROM manufacturing
    UNION ALL
    SELECT 'no_budget', SUM(IFNULL(no_budget, 0)) FROM retail
    UNION ALL
    SELECT 'no_budget', SUM(IFNULL(no_budget, 0)) FROM healthcare
    UNION ALL
    SELECT 'no_budget', SUM(IFNULL(no_budget, 0)) FROM information
    UNION ALL
    SELECT 'no_budget', SUM(IFNULL(no_budget, 0)) FROM food_service
    UNION ALL
    SELECT 'no_budget', SUM(IFNULL(no_budget, 0)) FROM finance_insurance

    UNION ALL
    SELECT 'competition', SUM(IFNULL(competition, 0)) FROM manufacturing
    UNION ALL
    SELECT 'competition', SUM(IFNULL(competition, 0)) FROM retail
    UNION ALL
    SELECT 'competition', SUM(IFNULL(competition, 0)) FROM healthcare
    UNION ALL
    SELECT 'competition', SUM(IFNULL(competition, 0)) FROM information
    UNION ALL
    SELECT 'competition', SUM(IFNULL(competition, 0)) FROM food_service
    UNION ALL
    SELECT 'competition', SUM(IFNULL(competition, 0)) FROM finance_insurance

    UNION ALL
    SELECT 'poor_market_fit', SUM(IFNULL(poor_market_fit, 0)) FROM manufacturing
    UNION ALL
    SELECT 'poor_market_fit', SUM(IFNULL(poor_market_fit, 0)) FROM retail
    UNION ALL
    SELECT 'poor_market_fit', SUM(IFNULL(poor_market_fit, 0)) FROM healthcare
    UNION ALL
    SELECT 'poor_market_fit', SUM(IFNULL(poor_market_fit, 0)) FROM information
    UNION ALL
    SELECT 'poor_market_fit', SUM(IFNULL(poor_market_fit, 0)) FROM food_service
    UNION ALL
    SELECT 'poor_market_fit', SUM(IFNULL(poor_market_fit, 0)) FROM finance_insurance

    UNION ALL
    SELECT 'acquisition_stagnation', SUM(IFNULL(acquisition_stagnation, 0)) FROM manufacturing
    UNION ALL
    SELECT 'acquisition_stagnation', SUM(IFNULL(acquisition_stagnation, 0)) FROM retail
    UNION ALL
    SELECT 'acquisition_stagnation', SUM(IFNULL(acquisition_stagnation, 0)) FROM healthcare
    UNION ALL
    SELECT 'acquisition_stagnation', SUM(IFNULL(acquisition_stagnation, 0)) FROM information
    UNION ALL
    SELECT 'acquisition_stagnation', SUM(IFNULL(acquisition_stagnation, 0)) FROM food_service
    UNION ALL
    SELECT 'acquisition_stagnation', SUM(IFNULL(acquisition_stagnation, 0)) FROM finance_insurance

    UNION ALL
    SELECT 'monetization_failure', SUM(IFNULL(monetization_failure, 0)) FROM manufacturing
    UNION ALL
    SELECT 'monetization_failure', SUM(IFNULL(monetization_failure, 0)) FROM retail
    UNION ALL
    SELECT 'monetization_failure', SUM(IFNULL(monetization_failure, 0)) FROM healthcare
    UNION ALL
    SELECT 'monetization_failure', SUM(IFNULL(monetization_failure, 0)) FROM information
    UNION ALL
    SELECT 'monetization_failure', SUM(IFNULL(monetization_failure, 0)) FROM food_service
    UNION ALL
    SELECT 'monetization_failure', SUM(IFNULL(monetization_failure, 0)) FROM finance_insurance

    UNION ALL
    SELECT 'niche_limits', SUM(IFNULL(niche_limits, 0)) FROM manufacturing
    UNION ALL
    SELECT 'niche_limits', SUM(IFNULL(niche_limits, 0)) FROM retail
    UNION ALL
    SELECT 'niche_limits', SUM(IFNULL(niche_limits, 0)) FROM healthcare
    UNION ALL
    SELECT 'niche_limits', SUM(IFNULL(niche_limits, 0)) FROM information
    UNION ALL
    SELECT 'niche_limits', SUM(IFNULL(niche_limits, 0)) FROM food_service
    UNION ALL
    SELECT 'niche_limits', SUM(IFNULL(niche_limits, 0)) FROM finance_insurance

    UNION ALL
    SELECT 'execution_flaws', SUM(IFNULL(execution_flaws, 0)) FROM manufacturing
    UNION ALL
    SELECT 'execution_flaws', SUM(IFNULL(execution_flaws, 0)) FROM retail
    UNION ALL
    SELECT 'execution_flaws', SUM(IFNULL(execution_flaws, 0)) FROM healthcare
    UNION ALL
    SELECT 'execution_flaws', SUM(IFNULL(execution_flaws, 0)) FROM information
    UNION ALL
    SELECT 'execution_flaws', SUM(IFNULL(execution_flaws, 0)) FROM food_service
    UNION ALL
    SELECT 'execution_flaws', SUM(IFNULL(execution_flaws, 0)) FROM finance_insurance

    UNION ALL
    SELECT 'trend_shifts', SUM(IFNULL(trend_shifts, 0)) FROM manufacturing
    UNION ALL
    SELECT 'trend_shifts', SUM(IFNULL(trend_shifts, 0)) FROM retail
    UNION ALL
    SELECT 'trend_shifts', SUM(IFNULL(trend_shifts, 0)) FROM healthcare
    UNION ALL
    SELECT 'trend_shifts', SUM(IFNULL(trend_shifts, 0)) FROM information
    UNION ALL
    SELECT 'trend_shifts', SUM(IFNULL(trend_shifts, 0)) FROM food_service
    UNION ALL
    SELECT 'trend_shifts', SUM(IFNULL(trend_shifts, 0)) FROM finance_insurance

    UNION ALL
    SELECT 'regulatory_pressure', SUM(IFNULL(regulatory_pressure, 0)) FROM manufacturing
    UNION ALL
    SELECT 'regulatory_pressure', SUM(IFNULL(regulatory_pressure, 0)) FROM retail
    UNION ALL
    SELECT 'regulatory_pressure', SUM(IFNULL(regulatory_pressure, 0)) FROM healthcare
    UNION ALL
    SELECT 'regulatory_pressure', SUM(IFNULL(regulatory_pressure, 0)) FROM information
    UNION ALL
    SELECT 'regulatory_pressure', SUM(IFNULL(regulatory_pressure, 0)) FROM food_service
    UNION ALL
    SELECT 'regulatory_pressure', SUM(IFNULL(regulatory_pressure, 0)) FROM finance_insurance

    UNION ALL
    SELECT 'overhype', SUM(IFNULL(overhype, 0)) FROM manufacturing
    UNION ALL
    SELECT 'overhype', SUM(IFNULL(overhype, 0)) FROM retail
    UNION ALL
    SELECT 'overhype', SUM(IFNULL(overhype, 0)) FROM healthcare
    UNION ALL
    SELECT 'overhype', SUM(IFNULL(overhype, 0)) FROM information
    UNION ALL
    SELECT 'overhype', SUM(IFNULL(overhype, 0)) FROM food_service
    UNION ALL
    SELECT 'overhype', SUM(IFNULL(overhype, 0)) FROM finance_insurance
),
total AS (
    SELECT SUM(frequency) AS total_frequency FROM combined_data
)
SELECT 
    failure_reason,
    SUM(frequency) AS frequency,
    ROUND((SUM(frequency) / total_frequency) * 100, 2) AS percentage,
    ROW_NUMBER() OVER (ORDER BY SUM(frequency) DESC) AS `rank`  -- Ranking in descending order of frequency (highest frequency gets rank 1)
FROM 
    combined_data, total
GROUP BY 
    failure_reason
ORDER BY 
    `rank` ASC;  -- Sorting the final output by rank (rank 1 will be at the top)
