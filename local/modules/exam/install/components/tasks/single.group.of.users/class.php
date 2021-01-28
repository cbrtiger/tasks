<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();

class SingleGroupOfUsers extends \CBitrixComponent {

    public function getUsersGroupInfo(){
        $dbGroup = \Bitrix\Main\GroupTable::getList(array(
            "select" => array("ID","NAME","DESCRIPTION"),
            "filter" => array("ID" => $this->arParams['GROUP_IDENTIFIER'])
        ));
        $arResult['USERS_GROUP_INFO'] = $dbGroup -> fetch();
        if(!$arResult['USERS_GROUP_INFO']){
            Bitrix\Iblock\Component\Tools::process404(
                'Не найден', //Сообщение
                true, // Нужно ли определять 404-ю константу
                true, // Устанавливать ли статус
                true, // Показывать ли 404-ю страницу
                false // Ссылка на отличную от стандартной 404-ю
            );
        }
        $arResult['TITLE'] = $arResult['USERS_GROUP_INFO']['NAME'];
        return $arResult;
    }

    public function executeComponent(){
        if($this->startResultCache()){
            $this->arResult = array_merge($this->arResult,$this->getUsersGroupInfo());
            $this->setResultCacheKeys(array("TITLE"));
            $this->includeComponentTemplate();
        }
        global $APPLICATION;
        $APPLICATION->SetTitle("Группа: "  . $this->arResult['TITLE']);
    }

}