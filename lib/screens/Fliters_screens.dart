import 'package:flutter/material.dart';
import '../widgets/maindrawer.dart';

class FlitersScreen extends StatefulWidget {
  static const routeName = '/Filters';
  final Function SaveFilter ;
  final Map<String , bool> CurrentFilter ;
  FlitersScreen(this.CurrentFilter ,this.SaveFilter);

  @override
  _FlitersScreenState createState() => _FlitersScreenState();
}
class _FlitersScreenState extends State<FlitersScreen> {
  bool _glutenFree =false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState(){
   _glutenFree = widget.CurrentFilter['gluten'];
   _lactoseFree = widget.CurrentFilter['lactose'];
   _vegan = widget.CurrentFilter['vegan'];
   _vegetarian = widget.CurrentFilter['vegetarian'];
   super.initState();
  }

  Widget buildSwitchListile(String title , String description , bool currentValue , Function updateValue)
  {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged:updateValue
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Your FLiters"),actions:[
        IconButton(
          icon: Icon(Icons.save),
          onPressed :(){
           final Map<String , bool > selectedFilters={
             'gluten':_glutenFree,
             'lactose':_lactoseFree,
             'vegan':_vegan,
             'vegetarian':_vegetarian,
           };
           widget.SaveFilter(selectedFilters);
          },
        )
      ],
      ),
      body: Column(
         children:[
         Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection.", style: Theme.of(context).textTheme.title),),
         Expanded(
            child: ListView(
              children:[
                buildSwitchListile(
                'Gluten-free',
                'Only include gluten-free meals.',
                _glutenFree,
                (newValue){
                    setState(() {
                      _glutenFree = newValue;
                    });
                 },
                ),
                buildSwitchListile(
                  'Lactosa-free',
                  'Only include lactosa-free meals.',
                  _lactoseFree,
                   (newValue){
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListile(
                  '_vegan',
                  'Only include gluten-free meals.',
                  _vegan,
                      (newValue){
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                buildSwitchListile(
                  'vegetarian',
                  'Only include gluten-free meals.',
                  _vegetarian,
                      (newValue){
                      setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}