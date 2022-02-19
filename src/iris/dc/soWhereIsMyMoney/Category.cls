Class dc.soWhereIsMyMoney.Category Extends %Persistent
{

Index IdxName On Name [ Unique ];

/// Category Name
Property Name As %String [ Required ];

/// Category Type (Expense or Income)
Property Type As %String(DISPLAYLIST = ",Income,Expense", VALUELIST = ",I,E") [ InitialExpression = "E", Required ];

ClassMethod FindOrCreateByName(name As %String, Output category As dc.soWhereIsMyMoney.Category) As %Status
{
  Set sc = $$$OK
  Set category = ..IdxNameOpen(name)
  If ($IsObject(category)) Return sc
  Set category = ..%New()
  Set category.Name = name
  Return category.%Save()
}

Storage Default
{
<Data name="CategoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Type</Value>
</Value>
</Data>
<DataLocation>^dc.soWhereIsMyMoney.CategoryD</DataLocation>
<DefaultData>CategoryDefaultData</DefaultData>
<IdLocation>^dc.soWhereIsMyMoney.CategoryD</IdLocation>
<IndexLocation>^dc.soWhereIsMyMoney.CategoryI</IndexLocation>
<StreamLocation>^dc.soWhereIsMyMoney.CategoryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
