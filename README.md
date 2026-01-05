🧠 **Mental Health Monitoring App**

A holistic Flutter application designed to track, analyze, and improve mental well-being through academic, physical, and emotional data points.

------------------------------------------------------------------------------------------------------------------------------------------------------------


🚀 **Key Features**

**1. Health & Activity Dashboard**
**Real-time Status Cards:** Visual feedback on current Mood and Stress levels.

Biometric Tracking: Displays Heart Beat (BP) and Sleep Time (hrs) for physical health monitoring.

**Time-Series Analytics:**

**Sleep Records:** A line chart visualizing sleep consistency over time.

**Screen Time:** A weekly bar chart tracking digital usage patterns.

**2. Specialized Stress Quests**
The app features categorized questionnaires to predict stress based on specific life areas:

**Academic Quest:** Evaluates GPA trends, module workload, and attendance to predict academic burnout.

**Physical Quest:** Analyzes exercise habits, work-life balance, and social support systems.

**3. Wellness Marketplace (Ecommerce)**
**Curated Products:** A built-in shop for mental wellness tools like therapy lamps and stress-relief journals.

**Service Booking:** Access to professional counseling and meditation sessions.

**4. Interactive UI Components**
**Liquid Progress Indicators:** Dynamic wave animations used in questionnaires to show completion status (e.g., 78%, 85%, 93%).

**Analyzing Popups:** A 3-second data processing animation with a filling liquid circle used before revealing results.

------------------------------------------------------------------------------------------------------------------------------------------------------------


**🛠 Tech Stack & Dependencies**

**The app is built using Flutter and relies on the following core libraries:**
**Package                                         Purpose**
**fl_chart**                             Rendering line and bar charts for health data.
**liquid_progress_indicator_v2**         Linear and circular wave-style progress animations.
**flutter_riverpod or provider**         Suggested for managing state across the 10+ questionnaire screens.

------------------------------------------------------------------------------------------------------------------------------------------------------------


**📂 File Structure**

**academic.dart:** Landing page for academic stress evaluation.

**a-q1.dart to a-q14.dart:** The academic burnout questionnaire flow.

**physical-q/:**

**p-q1.dart to p-q10.dart:** The physical and lifestyle stress questionnaire.

**wareable.dart:** The physical activities overview and daily routine tracker.

**time-series.dart:** The main health metrics dashboard.

**a-predict.dart / p-predict.dart:** Result pages showing hardcoded or dynamic stress predictions.

------------------------------------------------------------------------------------------------------------------------------------------------------------

**📈 UI/UX Design Principles**

**Color Psychology:** Uses calming blues for progress and growth, and soft greens for low-stress status cards.

**Gamification:** Transforms traditional medical forms into "Quests" to increase user engagement.

**Data Visualization:** Simplifies complex health data into scannable charts for immediate insight.

------------------------------------------------------------------------------------------------------------------------------------------------------------
