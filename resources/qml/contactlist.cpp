#include "contactlist.h"

ContactList::ContactList(QObject *parent)
    : QObject{parent}
{
    cItems.append({QStringLiteral("Navya Padiyar"), QStringLiteral("9383733632")});
    cItems.append({QStringLiteral("Namitha Maayi"), QStringLiteral("+49 38383732")});
    cItems.append({QStringLiteral("Nidhi Padiyar"), QStringLiteral("9383738383")});
}

QVector<ContactItem> ContactList::items() const
{
    return cItems;
}
