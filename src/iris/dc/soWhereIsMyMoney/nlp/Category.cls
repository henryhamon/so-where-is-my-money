Class dc.soWhereIsMyMoney.nlp.Category
{

ClassMethod Train() [ Language = python ]
{
  import iris
  import pandas as pd

  from sklearn.model_selection import train_test_split
  from sklearn.feature_extraction.text import CountVectorizer
  from sklearn.feature_extraction.text import TfidfTransformer
  from sklearn.svm import LinearSVC

  rs = iris.sql.exec('SELECT Category->ID as category_id, Category->Name as category, Description as description FROM dc_soWhereIsMyMoney."Transaction" ')
  df = rs.dataframe()

  X_train, X_test, y_train, y_test = train_test_split(df['description'], df['category'], random_state = 0)
  count_vect = CountVectorizer()
  X_train_counts = count_vect.fit_transform(X_train)
  tfidf_transformer = TfidfTransformer()
  X_train_tfidf = tfidf_transformer.fit_transform(X_train_counts)
  model = LinearSVC()
  model.fit(X_train_tfidf, y_train)
  ##print(model.predict(count_vect.transform(["Martineli's diner"]))[0])
  ##print(model.predict(count_vect.transform(["Wally Mart"])))
}

ClassMethod Suggestion(description As %String) [ Language = python ]
{
  return ""
}

}
