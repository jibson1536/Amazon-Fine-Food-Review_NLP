# 🥯Amazon Fine Food Reviews — NLP & Text Analytics

A comprehensive **Natural Language Processing (NLP)** analysis of Amazon fine food reviews, comparing **Positive (4–5 ★)** vs **Negative (1–2 ★)** sentiment classes. The analysis covers the full text analytics pipeline — from preprocessing to topic modelling and word embeddings — and is presented as a fully reproducible R Markdown report.

---

## 📊 Project Overview

| Attribute | Value |
|---|---|
| Dataset | Amazon Fine food  Reviews |
| Total reviews analysed | 20,000|
| Positive reviews (4–5 ★) | 10,000 |
| Negative reviews (1–2 ★) |10,000 (24.2%) |
| Language | R (R Markdown) |
| Output | Interactive HTML Report |

---

## 🗂️ Repository Structure

```
├── amazon_reviews_analysis.Rmd   # Main analysis — knit this to generate the report
├── reviews_clean.csv             # Pre-filtered dataset (Positive & Negative only)
├── custom.css                   # Custom HTML report styling
|-- data_filter.py                # Sampled 20k reviews from the large dataset and classified to positive and negative. and excluded neutral
├── run_analysis.R                # Setup script — installs packages & knits the report
|-- amazon_review_NLP.Rproj
└── README.md                     # You are here
```

---

## ⚙️ How to Run

### Prerequisites
- R (≥ 4.1.0)
- RStudio (recommended)

### Steps

**1. Clone the repository**
```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

**2. Install packages & knit (one command)**
```r
source("run_analysis.R")
```

Or manually in RStudio:
- Open `amazon_reviews_analysis.Rmd`
- Click **Knit → Knit to HTML**

**3. Open the report**

The output file `Amazon_Reviews_NLP_Report.html` will appear in the same folder. Open it in any browser.

> ⚠️ **First run only:** the `textdata` package will prompt you to confirm downloading the AFINN and Bing sentiment lexicons. Type `1` and press Enter when prompted.

---

## 🔬 Methods & Analysis Steps

| # | Step | Techniques / Tools |
|---|---|---|
| 1 | **Data Loading & Class Definition** | Rating-based binary split (≥4 = Positive, ≤2 = Negative) |
| 2 | **Text Preprocessing** | Lowercasing, tokenisation, number & punctuation removal, stop-word removal, Porter stemming |
| 3 | **Word Frequency Analysis** | Top-10 word bar charts, log-odds ratio diverging chart |
| 4 | **Word Clouds** | Unigram, bi-gram, and comparison clouds |
| 5 | **Word Co-occurrence Networks** | Pairwise co-occurrence, Fruchterman-Reingold layout |
| 6 | **Sentiment Analysis** | AFINN normalised scores, Bing lexicon breakdown, density & violin plots |
| 7 | **Topic Modelling (LDA)** | Latent Dirichlet Allocation (k=4 per class), document-topic heatmap |
| 8 | **Word Embeddings (Word2Vec)** | CBOW model (dim=100), nearest-neighbour queries, PCA 2-D projection |
| 9 | **Insight Integration** | Cross-method comparison table, business & marketing implications |
| 10 | **Report** | Fully reproducible R Markdown HTML report with tabbed sections |

---

## 📦 R Packages Used

```r
tidyverse, tidytext, tm, SnowballC, wordcloud, wordcloud2,
RColorBrewer, ggplot2, igraph, ggraph, widyr, scales,
topicmodels, textdata, sentimentr, word2vec,
knitr, kableExtra, viridis, ggwordcloud, plotly, DT
```

---

## 💡 Key Findings

- **Positive reviews** cluster around themes of *quality*, *ease of use*, *fast delivery*, and *value for money*
- **Negative reviews** converge on a tight semantic cluster of *broken → return → customer service*, pointing to systemic quality-control issues
- The mean normalised AFINN sentiment gap between classes is **~0.73 points**, indicating fundamentally different product experiences
- LDA identified 4 distinct topics per class — positive topics cover *Performance*, *Delivery*, *Entertainment*, and *Design*; negative topics reveal *Hardware Failures*, *Returns*, *Performance Issues*, and *Software/Connectivity*
- Word2Vec embeddings confirm that *"quality"* associates with durability-related terms in positive reviews, while *"broken"* clusters tightly with failure-related vocabulary in negative ones

---

## 📚 References

1. Blei, D. M., Ng, A. Y., & Jordan, M. I. (2003). *Latent Dirichlet Allocation*. JMLR, 3, 993–1022.
2. Mikolov, T. et al. (2013). *Efficient Estimation of Word Representations in Vector Space*. arXiv:1301.3781.
3. Silge, J., & Robinson, D. (2017). *Text Mining with R: A Tidy Approach*. O'Reilly. [tidytextmining.com](https://www.tidytextmining.com)
4. Nielsen, F. Å. (2011). *A new ANEW: Evaluation of a word list for sentiment analysis in microblogs*. arXiv:1103.2903.
5. Csardi, G., & Nepusz, T. (2006). *The igraph software package*. InterJournal Complex Systems, 1695.

---

## 👤 Author --- MUJEEB OLALEKAN ODEKUNLE

Made with R & ❤️ · Feel free to fork, adapt, and build on this analysis.
