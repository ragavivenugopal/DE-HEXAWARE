# Hotel Booking Analysis (OYO)

## 1. Problem Understanding
We analyzed hotel booking data to understand:
- **Booking patterns** (popular cities, booking lead time, stay duration)
- **Revenue insights** (average room rates, cancellation impact)
- **Operational recommendations** (city-wise hotel acquisition strategy)

---

## 2. Database Design & Setup
### Tables Created
1. **`hotels`**
   - `hotel_id` (Primary Key)
   - `city` (Location of the hotel)

2. **`bookings`**
   - Booking details (`booking_id`, `customer_id`, `status`, `check_in`, `check_out`, etc.)
   - **Foreign Key:** `hotel_id` (references `hotels.hotel_id`)

### Constraints Applied
- **Primary Key (PK):** Ensures `hotel_id` in `hotels` is unique
- **Foreign Key (FK):** Ensures `bookings.hotel_id` only references existing hotels
- **NOT NULL:** Critical fields (`hotel_id`, `booking_id`, `dates`) are mandatory

---

## 3. Data Cleaning & Validation
Before analysis, we ensured:

✔ **No NULL hotel_ids** (required for FK constraint)  
✔ **No orphaned bookings** (all `hotel_id` values exist in `hotels` table)  
✔ **Date formats standardized** (`check_in`, `check_out`, `date_of_booking`)  

---

## 4. Key Insights Derived
### A. Booking Trends
- **Top Cities:** Bangalore, Gurgaon, Delhi had the most bookings
- **Kolkata** had significantly fewer bookings
- **Booking Lead Time:**
  - ~50% bookings made on the **same day** as check-in
  - ~85% booked **within 4 days** of check-in
  - Very few **long-term advance bookings** (1-2 months prior)

### B. Stay & Room Patterns
- **80% bookings** were for **1-night stays**
- Most bookings involved **single rooms**

### C. Revenue & Pricing
- **High Avg. Room Rates:** Pune, Kolkata, Mumbai → Potential for expansion
- **Cancellation Impact:** High cancellation rates in most cities (except Pune)

---

## 5. Strategic Recommendations
1. **Expand in High-Revenue Cities:**
   - Acquire more hotels in **Pune, Kolkata, Mumbai** (higher room rates)
2. **Reduce Cancellations:**
   - Investigate reasons for cancellations (except Pune, which performs well)
3. **Promote Early Bookings:**
   - Incentivize customers to book in advance for better revenue predictability

---

## 6. Tools & Techniques Used
- **Database:** Microsoft SQL Server (SSMS)
- **Data Import:** Excel → CSV → SSMS Import Wizard
- **SQL Features:**
  - **CTEs** (for complex queries)
  - **Joins** (linking `bookings` & `hotels`)
  - **Aggregate Functions** (`SUM`, `AVG`, `COUNT`)
  - **Date Functions** (`DATEDIFF`, `DATENAME`)

---

## Conclusion
This analysis helped identify **booking trends**, **revenue opportunities**, and **operational improvements** for Oyo's hotel business. By focusing on high-demand cities and reducing cancellations, the company can optimize revenue and customer satisfaction.



** Note:** No SQL queries were included in this theoretical summary—only the approach and findings. For query details, refer to the separate `Analysis_Queries.sql` file.
