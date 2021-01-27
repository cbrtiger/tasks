<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
use \Bitrix\Main\Localization\Loc;

$arComponentParameters = array(
    "PARAMETERS" => array(
        "HEADING_OF_PAGE" => array(
            "NAME" => Loc::getMessage("HEADING_OF_PAGE"),
            "DESCRIPTION" => Loc::getMessage("HEADING_OF_PAGE_DESCRIPTION"),
            "TYPE" => "STRING",
            "DEFAULT" => ""
        ),
        "CACHE_TIME" => array("DEFAULT" => 36000000)
    )
);