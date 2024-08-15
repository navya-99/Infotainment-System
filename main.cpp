#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "contactmodel.h"
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
    ContactModel model;
    model.addContact(Contact("Navya Padiyar", "0099999999"));
    model.addContact(Contact("Nidhi Padiyar", "123456789"));
    model.addContact(Contact("Amma", "1111199999"));

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
    engine.rootContext()->setContextProperty("contactModel", QVariant::fromValue(&model));
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
