#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "contactmodel.h"
#include "historymodel.h"
#include <qqmlcontext.h>

#include <QLocale>
#include <QTranslator>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    //Creates a ContactModel and adds a few Contact objects to it.
    ContactModel cModel;
    cModel.addContact(Contact("Aman Verma", "1111199999"));
    cModel.addContact(Contact("Amma", "1234567890"));
    cModel.addContact(Contact("Ananya Sharma", "1111199988"));
    cModel.addContact(Contact("Bhavya", "1111199900"));
    cModel.addContact(Contact("Deepika Padukone", "1111199911"));
    cModel.addContact(Contact("Gagan Sharma", "1111155555"));
    cModel.addContact(Contact("Manoj Mishra", "0099999999"));
    cModel.addContact(Contact("Shreya Hegde", "0123456789"));

    Historymodel hModel;
    hModel.addHistory(History(Contact("Amma", "1234567890"), "Fri 13:30"));
    hModel.addHistory(History(Contact("Ananya Sharma", "1111199988"), "Thu 18:30"));
    hModel.addHistory(History(Contact("Bhavya", "1111199900"), "Thu 06:04"));
    hModel.addHistory(History(Contact("Amma", "1111199999"), "Tue 11:00"));
    hModel.addHistory(History(Contact("Bhavya", "1111199900"), "Mon 12:30"));
    hModel.addHistory(History(Contact("Manoj Mishra", "0099999999"), "Sun 16:45"));
    hModel.addHistory(History(Contact("Shreya Hegde", "0123456789"), "Sun 14:30"));

    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "infotainment-system_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("contactModel", QVariant::fromValue(&cModel));
    engine.rootContext()->setContextProperty("historyModel", QVariant::fromValue(&hModel));
    engine.addImportPath("qrc:/qml");
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
