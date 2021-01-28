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

    function __construct()
    {
        $arModuleVersion = array();

        include(__DIR__.'/version.php');

        $this->MODULE_VERSION = $arModuleVersion["VERSION"];
        $this->MODULE_VERSION_DATE = $arModuleVersion["VERSION_DATE"];

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
        return true;
    }

    function UnInstallFiles()
    {
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