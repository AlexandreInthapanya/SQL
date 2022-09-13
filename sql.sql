SELECT train.ID, train.conducteur_ID,train.nom,client.id,client.nom,client.age,client.C_B
FROM train
INNER JOIN places ON train.id=places.train_id INNER JOIN ticket ON ticket.place_id=places.id INNER JOIN commande ON commande.ticket_id=ticket.commande_id INNER JOIN client ON client.id=commande.client_id;
WHERE id=1

SELECT nomTable(column),....
FROM nomTable1
INNER JOIN nomTable3(liaison) 
ON  nomTable1.id(id table join)=nomTable3.nomTable1_id(id premiere table)

(diagramme john)
SELECT train.name AS trame,users.name AS client
FROM users
INNER JOIN orders
ON users.id=Order.Client_id
INNER JOIN ticket
ON orders.id=ticket.Order_id
INNER JOIN places
ON ticket.id=places.Ticket_id
INNER JOIN train
ON places.Ticket_id=train.id
WHERE users=3;
GROUP BY train.id
