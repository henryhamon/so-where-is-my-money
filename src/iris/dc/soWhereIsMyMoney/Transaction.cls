Class dc.soWhereIsMyMoney.Transaction Extends %Persistent
{

Property Description As %String [ Required ];

Property CreatedAt As %DateTime;

Property UpdatedAt As %DateTime;

Property Amount As %Numeric [ Required ];

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
