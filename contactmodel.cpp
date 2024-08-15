#include "contactmodel.h"

//constructor, Initializes a Contact with name and number
Contact::Contact(const QString &name, const QString &number)
    : m_name(name), m_number(number)
{

}

//returns the name and number of contact
QString Contact::name() const
{
    return m_name;
}

QString Contact::number() const
{
    return m_number;
}

//constructor, Initializes the model, optionally with a parent object.
ContactModel::ContactModel(QObject *parent)
    : QAbstractListModel(parent)
{

}

//Adds a contact to the model, ensuring that the UI updates to show the new data.
void ContactModel::addContact(const Contact &contact)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_contacts << contact;
    endInsertRows();
}

//Returns the total number of contacts in the model.
int ContactModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_contacts.count();
}

//Retrieves data for a specific role (either NameRole or NumberRole) based on the row index.
QVariant ContactModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_contacts.count())
        return QVariant();

    const Contact &contact = m_contacts[index.row()];
    if (role == NameRole)
        return contact.name();
    else if (role == NumberRole)
        return contact.number();
    return QVariant();
}

//Provides a mapping between roles and their string identifiers, which QML will use to bind data.
QHash<int, QByteArray> ContactModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[NumberRole] = "number";
    return roles;
}

