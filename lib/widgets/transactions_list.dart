import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transactions> transaction;
  final Function deleteTransaction;
  TransactionList(this.transaction, this.deleteTransaction);

  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(children: [
            Text("No transaction added yet"),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Expanded(
                child: Image.asset(
                  'accets/images/waterfall.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ])
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: FittedBox(
                        child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Text('\$${transaction[index].amount}'))),
                  ),
                  title: Text(
                    transaction[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transaction[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width >= 400
                      ? FlatButton.icon(
                          onPressed: () =>
                              deleteTransaction(transaction[index].id),
                          icon: Icon(Icons.delete),
                          label: Text("Delete"),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteTransaction(transaction[index].id),
                        ),
                ),
              );
            },
            itemCount: transaction.length,
          );
  }
}
