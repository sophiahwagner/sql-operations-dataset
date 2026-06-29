# Clinic Operations Tracker

This project focuses on handling imperfect data relationships using advanced SQL joins. Using a simulated clinic dataset (tracking doctors and incoming patient appointments), the queries isolate scheduling gaps, calculate staff workloads, and flag unassigned records.

## Database Structure

The project uses two tables linked by a shared `doctor_id` key:

1. **`doctors`**: Doctor names and their medical specialties.
2. **`appointments`**: Patient names, appointment times, and their assigned physician.

The dataset intentionally includes data mismatches to simulate real-world operations: doctors with no appointments scheduled, and patients who booked online but haven't been assigned a provider yet.

***

## Key Skills & Query Examples

### 1. Handling Unmatched Data (`LEFT JOIN`)
* Swapped table positions to control which dataset acts as the primary "anchor."
* Learned how to preserve unmatched rows from the primary table while filling missing values from the secondary table with `NULL`.

### 2. Finding Gaps (Anti-Joins)
* Combined a `LEFT JOIN` with a `WHERE ... IS NULL` filter to isolate operational errors, such as specific patients who are without an assigned doctor.

### 3. Workload Aggregation (`GROUP BY` with Column Counts)
* Grouped scheduling data to calculate appointment volume per doctor and specialty.
* Used specific column counting (e.g., `COUNT(appointment_id)`) instead of `COUNT(*)` to ensure underutilized staff accurately report a workload of `0` instead of `1`.

### 4. Ranking and Filtering Summaries (`HAVING` & `ORDER BY`)
* Used `HAVING` to filter calculated aggregates, pinpointing specific medical departments with low utilization.
* Applied `ORDER BY` to rank clinical specialties by their total patient traffic from highest to lowest.

### 5. Automated Data Labeling (`CASE WHEN`)
* Built a triage system using conditional `if/else` logic to automatically flag rows as either `'Confirmed'` or `'Needs Action'` based on whether a doctor is assigned.

***

## Tools Used
* **SQLite:** For database creation and query execution.
* **DbVisualizer:** For writing scripts and auditing spreadsheet outputs.
