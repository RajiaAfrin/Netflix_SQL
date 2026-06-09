# Netflix Content Analysis Using SQL

## Project Background

Netflix is one of the world's largest streaming platforms, offering movies, TV shows, documentaries, and original content across multiple countries and genres. Understanding content distribution, audience targeting, genre popularity, and regional contributions is critical for content strategy and platform growth.

This SQL project analyzes Netflix's content library to uncover patterns in content type, ratings, genres, countries, actors, and release trends. The goal is to generate insights into Netflix's catalog composition and identify factors that contribute to its global content strategy.

Insights and recommendations are provided on the following key areas:

- Content Library Overview
- Ratings & Audience Targeting
- Country-Level Content Distribution
- Genre Performance
- Actor Analysis
- Content Classification

This project was created using **PostgreSQL and pgAdmin 4**.

## Data Structure & Initial Checks

The dataset contains **8,807 Netflix titles** and **12 attributes**.

### Netflix Table

Important fields include:

- show_id
- type
- title
- director
- cast
- country
- date_added
- release_year
- rating
- duration
- listed_in
- description

### Initial Data Checks

The project began with:

- Movies vs TV Shows count
- Rating distribution analysis
- Content release year analysis
- Country-level content exploration
- Genre analysis
- Director and actor analysis
- Missing value identification
- Text-based content classification

## Executive Summary

### Overview of Findings

The analysis reveals that Netflix's content library is heavily concentrated in a few major markets, particularly the United States and India. Content distribution is strongly oriented toward mature audiences, with **TV-MA** being the most common rating for both Movies and TV Shows.

Genre analysis shows that Netflix heavily invests in **International TV Shows**, **Romantic Movies**, and **Children & Family Movies**, reflecting its focus on serving diverse global audiences.

Actor analysis highlights the dominance of established Indian actors within Netflix's Indian content library, while content classification suggests that the vast majority of titles fall into non-violent and non-harmful content categories.

## Insights Deep Dive

### 1. Ratings & Audience Targeting

The most common rating across both content types was:

| Content Type | Most Common Rating |
|--------------|-------------------|
| Movie | TV-MA |
| TV Show | TV-MA |

This indicates that Netflix's catalog is largely targeted toward mature audiences and adult viewers.

### 2. Country-Level Content Distribution

The top countries contributing content to Netflix were:

| Country | Total Titles |
|----------|------------:|
| United States | 3,211 |
| India | 1,008 |
| United Kingdom | 628 |
| Canada | 271 |

The United States dominates Netflix's content library, contributing more than three times the number of titles available from India.

### 3. Longest Movie on Netflix

The longest movie identified in the dataset was:

- **Black Mirror: Bandersnatch**

This title stands out as one of the platform's most unique and extended viewing experiences.

### 4. Genre Analysis

The most common genres included:

| Genre | Total Titles |
|---------|------------:|
| International TV Shows | 774 |
| Romantic Movies | 613 |
| Children & Family Movies | 605 |
| Docuseries | 221 |
| Spanish-Language TV Shows | 172 |

The results indicate that Netflix invests heavily in international programming and family-friendly entertainment while maintaining a strong documentary presence.

### 5. Top Indian Actors on Netflix

The actors appearing most frequently in Netflix's Indian movie catalog were:

| Actor | Total Titles |
|----------|------------:|
| Anupam Kher | 40 |
| Shah Rukh Khan | 34 |
| Naseeruddin Shah | 31 |
| Akshay Kumar | 29 |
| Om Puri | 29 |
| Amitabh Bachchan | 28 |
| Paresh Rawal | 28 |
| Boman Irani | 27 |
| Kareena Kapoor | 25 |
| Ajay Devgn | 21 |

These actors represent some of the most prominent contributors to Netflix's Indian content library.

### 6. Content Classification Analysis

Content descriptions were categorized using keyword-based text analysis.

Keywords such as:

- kill
- violence

were used to classify content.

Results:

| Category | Total Titles |
|------------|------------:|
| Good | 8,465 |
| Bad | 342 |

Approximately **96%** of Netflix titles were classified as "Good" under the classification logic used in this project.

## Recommendations

Based on the findings, I would recommend the following:

### 1. Continue Investing in International Content

International TV Shows represent the largest genre category in the dataset, demonstrating strong global content demand.

### 2. Maintain Strong Presence in Key Markets

The United States and India contribute a significant share of Netflix's catalog and should remain strategic priorities for content acquisition and production.

### 3. Expand High-Performing Genres

Genres such as Romantic Movies, Children & Family Movies, and Docuseries show strong representation and may offer opportunities for continued growth.

### 4. Leverage Established Talent

Popular actors such as Anupam Kher, Shah Rukh Khan, and Akshay Kumar continue to appear frequently in successful Indian content and can be leveraged to attract regional audiences.

### 5. Monitor Content Diversity

While mature-rated content dominates the platform, maintaining a balanced mix of family-friendly and youth-oriented programming can help broaden audience reach.

## Assumptions and Caveats

- Country counts are based on the countries listed within the dataset.
- Some titles are associated with multiple countries and genres.
- Content classification is based solely on keyword matching within descriptions.
- Results reflect the dataset provided and may not represent Netflix's current catalog.
- Missing values in director and cast information may impact some analyses.

## Tools Used

- PostgreSQL
- pgAdmin 4
- SQL
- Data Cleaning
- Data Exploration
- Text Analysis
- Business Analysis
