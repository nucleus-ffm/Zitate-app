import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'quote.dart';
import 'quote_card.dart';
import 'quoteList.dart';

void main() => runApp(MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Widget> quoteList = List();

  void _removeQuote(index) {
    setState(() {
      quoteList.removeAt(index);
    });
  }

  List<Widget> _getQuotes() {

    List<Quote> quotes = getQuoteList();

    for (int x = 0; x < quotes.length; x++) {
      quoteList.add(
        Positioned(
          top: 30,
          child: Draggable(
            onDragEnd: (drag) {
              _removeQuote(x);
            },
            childWhenDragging: Container(),
            feedback: QuoteCard(
              quote: quotes[x],
              delete: () {},
            ),
            child: QuoteCard(
              quote: quotes[x],
              delete: () {},
            ),
          ),
        ),
      );
    }

    return quoteList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quoteList = _getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('tolle Zitate'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(
                () {
                  quoteList.clear();
                  quoteList = _getQuotes();
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: quoteList,
        ),
      ),
    );
  }
}

