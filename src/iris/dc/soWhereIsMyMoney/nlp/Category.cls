Class dc.soWhereIsMyMoney.nlp.Category
{

ClassMethod Suggestion(description As %String) [ Language = python ]
{
  import iris
  from sklearn.model_selection import train_test_split
  from sklearn.feature_extraction.text import CountVectorizer
  from sklearn.feature_extraction.text import TfidfTransformer
  from sklearn.svm import LinearSVC

  rs = iris.sql.exec('SELECT Category->ID as category_id, Category->Name as category, Description as description FROM dc_soWhereIsMyMoney."Transaction" ')
  df = rs.dataframe()

  X_train, _, y_train, _ = train_test_split(df['description'], df['category'], random_state = 0)
  count_vect = CountVectorizer(min_df=5, encoding='utf8', ngram_range=(1, 2), stop_words='english')
  X_train_counts = count_vect.fit_transform(X_train)
  tfidf_transformer = TfidfTransformer(norm='l2',sublinear_tf=True)
  X_train_tfidf = tfidf_transformer.fit_transform(X_train_counts)
  model = LinearSVC()
  model.fit(X_train_tfidf, y_train)

  return model.predict(count_vect.transform([description]))[0]
}

}
