import 'package:flutter/material.dart';
import 'Quote.dart';
void main() => runApp(MaterialApp(
  home : QuoteList(),
));


class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  String text='';
  List<Quote> quotes = [];
  var msgController = TextEditingController();


  bool shouldDisplay = false;



  Widget quoteTemplate(quote){
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 4.0),
            IconButton(
                onPressed: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                },
                icon: Icon(Icons.delete)
            ),
          ],
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],

      ),
      body: Container(
        child: Column(
            children: quotes.map((quote)=>quoteTemplate(quote)).toList(),
          ),
      ),
      floatingActionButton: Row(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(

            onPressed: (){

              setState(() {
                shouldDisplay=!shouldDisplay;
              });
              if(text!=''){
                setState(() {
                  quotes.add( Quote(text: "$text"));
                });
                msgController.clear();
                text='';
              }

            },
              child: Icon(Icons.add),
          ),
          Expanded(
            child:TextField(
              controller: msgController,
              maxLength: 10,
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}


