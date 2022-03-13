Class dc.soWhereIsMyMoney.Transaction Extends %Persistent
{

Index IdxCategory On Category;

/// Transaction description
Property Description As %String [ Required ];

/// Created at
Property CreatedAt As %DateTime;

/// Updated at
Property UpdatedAt As %DateTime;

/// Transaction amount
Property Amount As %Numeric [ Required ];

/// Trasaction Category
Relationship Category As dc.soWhereIsMyMoney.Category [ Cardinality = one, Inverse = Transactions, Required ];

Method %OnBeforeSave(insert As %Boolean) As %Status [ Private, ServerOnly = 1 ]
{
  If (insert) {
    Set ..CreatedAt = $Horolog
  }
  Set ..UpdatedAt = $Horolog
  Quit $$$OK
}

ClassMethod Log(amount As %Numeric, description As %String, category As %String = "") As %Status
{
  Set tSC = $$$OK
  Set transaction = ..%New()
  Set transaction.Amount = amount
  Set transaction.Description = description
  Set:(category="") category = ##class(dc.soWhereIsMyMoney.nlp.Category).Suggestion(description)
  Try {
    $$$ThrowOnError(transaction.%Save())
  } Catch ex {
    Set tSC=ex.AsStatus()
  }
  Quit tSC
}

Storage Default
{
<Data name="TransactionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Description</Value>
</Value>
<Value name="3">
<Value>CreatedAt</Value>
</Value>
<Value name="4">
<Value>UpdatedAt</Value>
</Value>
<Value name="5">
<Value>Amount</Value>
</Value>
<Value name="6">
<Value>Category</Value>
</Value>
</Data>
<DataLocation>^dc.soWhereIsMyAC70.TransactionD</DataLocation>
<DefaultData>TransactionDefaultData</DefaultData>
<IdLocation>^dc.soWhereIsMyAC70.TransactionD</IdLocation>
<IndexLocation>^dc.soWhereIsMyAC70.TransactionI</IndexLocation>
<StreamLocation>^dc.soWhereIsMyAC70.TransactionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
