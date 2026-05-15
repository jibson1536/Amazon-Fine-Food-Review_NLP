import pandas as pd

df = pd.read_csv("AmazonFineFoodReviews.csv")
df['class'] = df['Score'].apply(
    lambda x: 'Positive' if x >= 4 else ('Negative' if x <= 2 else 'Neutral')
)
df_filtered = df[df['class'] != 'Neutral']

pos = df_filtered[df_filtered['class'] == 'Positive'].sample(n=10000, random_state=42)
neg = df_filtered[df_filtered['class'] == 'Negative'].sample(n=10000, random_state=42)

final = pd.concat([pos, neg]).sample(frac=1, random_state=42).reset_index(drop=True)
final[['Text', 'Score', 'class']].to_csv("reviews_20k.csv", index=False)
print(final['class'].value_counts())