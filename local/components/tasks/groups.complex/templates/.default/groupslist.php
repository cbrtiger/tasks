<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>
<?$APPLICATION->IncludeComponent(
    "tasks:groups.of.users",
    "groupslist",
    Array(
        "CACHE_TIME" => "36000000",
        "CACHE_TYPE" => "A",
        "HEADING_OF_PAGE" => "Кастомный заголовок",
        "URL_TEMPLATES_GROUPDETAIL" => $arResult['URL_TEMPLATES']['groupdetail'],
        "URL_TEMPLATES_GROUPSLIST" => $arResult['URL_TEMPLATES']['groupslist']
    )
);?>
