#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QAbstractListModel>
#include <QObject>

class Contact
{
public:
    Contact(const QString &name, const QString &number); //contructor to initialize Contact object
    QString name() const; //returns the name of the contact
    QString number() const; //returns the number of the contact

private:
    QString m_name; //stores the name of the contact
    QString m_number; //stores the number of the contact
};

class ContactModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum ContactRoles {
        NameRole = Qt::UserRole + 1,
        NumberRole
    };

    explicit ContactModel(QObject *parent = nullptr); // Constructor

    void addContact(const Contact &contact); // Adds a contact to the model

    int rowCount(const QModelIndex & parent = QModelIndex()) const; // Returns the number of rows (contacts)

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const; // Returns data based on role

protected:
    QHash<int, QByteArray> roleNames() const; // Returns role names for QML binding

private:
    QList<Contact> m_contacts; // Stores the list of contacts

signals:

};

#endif // CONTACTMODEL_H
