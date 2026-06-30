# Clinic Operations Tracker

This project focuses on handling imperfect data relationships using advanced SQL joins and unions. Using a simulated clinic dataset (tracking doctors and incoming patient appointments), the queries isolate scheduling gaps, calculate staff workloads, and flag unassigned records.

## Database Structure

The project uses two tables linked by a shared `doctor_id` key:

1. **`doctors`**: Doctor names and their medical specialties.
2. **`appointments`**: Patient names, appointment times, and their assigned physician.

The dataset intentionally includes data mismatches to simulate real-world operations: doctors with no appointments scheduled, and patients who booked online but haven't been assigned a provider yet.

***

## Key Skills & Query Examples

### 1. Linking Tables Together (`LEFT JOIN`)
* Swapped table positions to control which dataset acts as the primary "anchor."
* Learned how to preserve unmatched rows from the primary table while filling missing values from the secondary table with `NULL`.

### 2. Finding Missing Information (Anti-Joins)
* Combined a `LEFT JOIN` with a `WHERE ... IS NULL` filter to isolate operational errors, such as specific patients who are without an assigned doctor.

### 3. Counting Workloads (`GROUP BY` & `HAVING`)
* Counts the exact number of appointments each doctor and specialty has today.
* Uses column-specific counts (like `COUNT(appointment_id)`) so that doctors with an empty schedule show up as `0` instead of accidentally counting as `1`.
* Uses `HAVING` and `ORDER BY` to filter out and rank the busiest or slowest departments.

### 4. Vertical Data Stacking (`UNION` & `UNION ALL`)
* Combined separate queries into a single output by stacking rows vertically.
* Used `UNION ALL` to merge lists quickly while preserving duplicate rows, and regular `UNION` to automatically filter out identical duplicates.
* Applied structural alignment rules, ensuring that column counts and data types matched perfectly across different tables.

### 5. Custom Status Lables (`CASE WHEN`)
* Used conditional `if/else` logic to automatically flag rows as either `'Confirmed'` or `'Needs Action'` based on whether a doctor is assigned.

***

## Tools Used
* **SQLite:** For database creation and query execution.
* **DbVisualizer:** For writing scripts and auditing spreadsheet outputs.
