<?
use Bitrix\Main\Localization\Loc;

Loc::loadMessages(__FILE__);

Class exam extends CModule
{
    var $MODULE_ID = "exam";
    var $MODULE_VERSION;
    var $MODULE_VERSION_DATE;
    var $MODULE_NAME;
    var $MODULE_DESCRIPTION;
    var $MODULE_CSS;
    var $MODULE_GROUP_RIGHTS = "Y";
    private $INSTALL_DIR;


    function __construct()
    {
        $arModuleVersion = array();

        include(__DIR__.'/version.php');

        $this->MODULE_VERSION = $arModuleVersion["VERSION"];
        $this->MODULE_VERSION_DATE = $arModuleVersion["VERSION_DATE"];
        $this->INSTALL_DIR = dirname(__file__);

        $this->MODULE_NAME = "Задачка";
        $this->MODULE_DESCRIPTION = "Модуль задачи выводит комплексный компонент с группами пользователей";
    }


    function InstallDB($install_wizard = true)
    {
        RegisterModule("exam");
        return true;
    }

    function UnInstallDB($arParams = Array())
    {
        UnRegisterModule("exam");
        return true;
    }

    function InstallEvents()
    {
        return true;
    }

    function UnInstallEvents()
    {
        return true;
    }

    function InstallFiles()
    {
        CopyDirFiles(
            $this->INSTALL_DIR . '/components',
            $_SERVER['DOCUMENT_ROOT'] . '/bitrix/components',
            true,
            true
        );

        return true;
    }

    function UnInstallFiles()
    {
        DeleteDirFilesEx("/bitrix/components/tasks");
        return true;
    }

    function DoInstall()
    {
        $this->InstallFiles();
        $this->InstallDB(false);
    }

    function DoUninstall()
    {
        $this->UnInstallDB(false);
    }
}
?>