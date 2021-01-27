<? if(!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) die();

$arDefaultUrlTemplates404 = [
    'groupslist'    => '',
    'groupdetail' => '#GROUP_ID#/',
];

$arDefaultVariableAliases404 = array();
$arDefaultVariableAliases    = array();
$arComponentVariables        = array("GROUP_ID");

$SEF_FOLDER                  = "";
$arUrlTemplates              = array();


if($arParams['SEF_MODE'] == "Y"){

    $arVariables = array();
    // если мы находимся в режиме ЧПУ, то первое что мы делаем - сформируем массив шаблонов URL адресов
    // для этого мы объединим массив шаблоново по умолчанюи и те значения, которые установлены в параметрах
    $arUrlTemplates = CComponentEngine::MakeComponentUrlTemplates($arDefaultUrlTemplates404,$arParams['SEF_URL_TEMPLATES']);

    $arVariableAliases = CComponentEngine::MakeComponentVariableAliases($arDefaultVariableAliases404,$arParams['VARIABLE_ALIASES']);


    // дальше определим шаблон текущей страницы переменна $componentPage
    $engine = new CComponentEngine($this);
    $componentPage = $engine->guessComponentPath(
        $arParams["SEF_FOLDER"],
        $arUrlTemplates,
        $arVariables
    );

    if(!$componentPage){
        $componentPage = "groupslist";
    }

    // инициализируем переменные
    CComponentEngine::initComponentVariables($componentPage, $arComponentVariables, $arVariableAliases, $arVariables);

    $arResult = array(
        "FOLDER" => $arParams["SEF_FOLDER"],
        "URL_TEMPLATES" => $arUrlTemplates,
        "VARIABLES" => $arVariables,
        "ALIASES" => $arVariableAliases,
    );

} else {
    $arVariableAliases = CComponentEngine::MakeComponentVariableAliases($arDefaultVariableAliases,$arParams['VARIABLE_ALIASES']);
    CComponentEngine::InitComponentVariables(false,$arComponentVariables,$arVariableAliases,$arVariables);

    $componentPage = "";
    if(isset($arVariables['GROUP_ID']) && intval($arVariables['GROUP_ID'])>0){
        $componentPage = "groupdetail";
    } else {
        $componentPage = "groupslist";
    }

    $arResult = array(
        "FOLDER" => "",
        "URL_TEMPLATES" => array(
            "groupslist" => htmlspecialcharsbx($APPLICATION->GetCurPage()),
            "groupdetail" => htmlspecialcharsbx($APPLICATION->GetCurPage() . "?" . $arVariables['GROUP_ID'] . "=#GROUP_ID#")
        ),
        "VARIABLES" => $arVariables,
        "ALIASES" => $arVariableAliases
    );
}

$this->IncludeComponentTemplate($componentPage);