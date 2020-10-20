import 'package:flutter/material.dart';

import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
      author: 'Osca Whild',
      text:
          'Lernen ist wie Rudern gegen den Strom. Hört man damit auf, treibt man zurück',
    ),
    Quote(
      author: 'Benjamin Franklin',
      text: 'Die ganz Schlauen sehen um fünf Ecken und sind geradeaus blind',
    ),
    Quote(
      author: 'Mahatma Gandhi',
      text: 'Sei du selbst die Veränderung, die du dir wünschst für diese Welt',
    ),
    Quote(
      author: '',
      text:
          'Der einzige, der einen Ozelotpelz wirklich braucht, ist der Ozelot',
    ),
    Quote(
      author: 'Carmen Sylva',
      text:
          'Glück ist das einzige, was wir anderen geben können, ohne es selbst zu haben',
    ),
    Quote(
      author: 'Mahatma Gandhi',
      text:
          'Die Geschichte lehrt die Menschen, dass die Geschichte die Menschen nichts lehrt',
    ),
    Quote(
      author: 'Nelson Mandela',
      text:
          'Frei zu sein bedeutet nicht nur, seine eigenen Fesseln zu lösen, sondern ein Leben zu führen, das auch die Freiheit anderer respektiert und fördert.',
    ),
    Quote(
      author: 'Albert Einstein',
      text:
          'Wenn die meisten sich schon armseliger Kleider und Möbel schämen, wie viel mehr sollten wir uns da erst armseliger Ideen und Weltanschauungen schämen.',
    )
  ];
  List<Quote> quoteList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quoteList.addAll(quotes);
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
                  quoteList.addAll(quotes);
                },
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: quoteList
              .map(
                (quote) => QuoteCard(
                  quote: quote,
                  delete: () {
                    setState(
                      () {
                        quoteList.remove(quote);
                      },
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
