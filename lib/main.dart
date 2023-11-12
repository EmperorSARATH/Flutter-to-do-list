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
  final List<Quote> quotes = [];

  var msgController = TextEditingController();


  bool shouldDisplay = false;

  Widget quoteTemplate(quote){
    return Card(
      color:   quote.isActive=="true" ? Colors.green : Colors.deepPurple,
      shadowColor: Colors.orange,
      margin: EdgeInsets.all(14.0),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              quote.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.0),
            IconButton(
                onPressed: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[500],
                  size: 26.0,
                ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if(quote.isActive=="true"){
                    quote.isActive=quote.isActive="false";
                  }
                  else{
                    quote.isActive=quote.isActive="true";
                  }
                });
              },
              icon: Icon(
                Icons.done,
                color: Colors.white,
                size: 26.0,
              ),
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
        title: const Text('To-do List'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,

      ),
      body: SingleChildScrollView(
        child: Column(
            children:
            quotes.map((quote)=>quoteTemplate(quote)).toList(),
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
                if(quotes.length<6) {
                  setState(() {
                    quotes.add(Quote(text: "$text", isActive:"false"));
                  });
                }
                msgController.clear();
                text='';
              }
            },
              child: Icon(Icons.add),
          ),

          Expanded(
            child:TextField(
              cursorWidth: 3,
              controller: msgController,
              maxLength: 20,
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


