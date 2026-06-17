local ADDON_NAME = ...
local FastNotificationRemove = LibStub("AceAddon-3.0"):NewAddon("FastNotificationRemove", "AceEvent-3.0")

local defaults = {
    profile = {
        removeSettingsBadges = true,
        removeMicroMenuNotifications = true,
        debug = false,
    }
}

local L = {}
do
    local locale = GetLocale()
    local strings = {
        enUS = {
            PAGE_TITLE = "FastNotificationRemove",
            PAGE_DESC = "Removes NEW badges in Blizzard settings and hides menu notifications automatically.",
            LABEL_SECTION = "General",
            OPT_SETTINGS = "Remove Settings NEW badges",
            OPT_SETTINGS_DESC = "Hides NEW markers in Blizzard's settings categories.",
            OPT_MENU = "Remove micro menu notifications",
            OPT_MENU_DESC = "Hides notifications on the main menu / micro menu button.",
            OPT_DEBUG = "Enable debug",
            OPT_DEBUG_DESC = "Shows debug messages in chat for testing.",
            BTN_APPLY = "Apply now",
            STATUS_APPLIED = "Changes applied.",
        },
        deDE = {
            PAGE_TITLE = "FastNotificationRemove",
            PAGE_DESC = "Entfernt NEW-Badges in den Blizzard-Einstellungen und blendet Menü-Benachrichtigungen automatisch aus.",
            LABEL_SECTION = "Allgemein",
            OPT_SETTINGS = "Settings NEW-Badges entfernen",
            OPT_SETTINGS_DESC = "Blendet neue Markierungen in den Blizzard-Einstellungskategorien aus.",
            OPT_MENU = "Micro-Menü Benachrichtigungen entfernen",
            OPT_MENU_DESC = "Blendet Benachrichtigungen am Hauptmenü- bzw. Micro-Menü-Button aus.",
            OPT_DEBUG = "Debug aktivieren",
            OPT_DEBUG_DESC = "Zeigt Debug-Meldungen zum Testen im Chat an.",
            BTN_APPLY = "Jetzt anwenden",
            STATUS_APPLIED = "Änderungen angewendet.",
        },
        frFR = {
            PAGE_TITLE = "FastNotificationRemove",
            PAGE_DESC = "Supprime les badges NEW dans les paramètres Blizzard et masque automatiquement les notifications du menu.",
            LABEL_SECTION = "Général",
            OPT_SETTINGS = "Supprimer les badges NEW des paramètres",
            OPT_SETTINGS_DESC = "Masque les marqueurs NEW dans les catégories de paramètres de Blizzard.",
            OPT_MENU = "Supprimer les notifications du micro-menu",
            OPT_MENU_DESC = "Masque les notifications sur le bouton du menu principal / micro-menu.",
            OPT_DEBUG = "Activer le debug",
            OPT_DEBUG_DESC = "Affiche des messages de debug dans le chat pour les tests.",
            BTN_APPLY = "Appliquer maintenant",
            STATUS_APPLIED = "Modifications appliquées.",
        },
        esES = {
            PAGE_TITLE = "FastNotificationRemove",
            PAGE_DESC = "Elimina las insignias NEW de los ajustes de Blizzard y oculta automáticamente las notificaciones del menú.",
            LABEL_SECTION = "General",
            OPT_SETTINGS = "Quitar insignias NEW de ajustes",
            OPT_SETTINGS_DESC = "Oculta los marcadores NEW en las categorías de ajustes de Blizzard.",
            OPT_MENU = "Quitar notificaciones del micromenú",
            OPT_MENU_DESC = "Oculta las notificaciones del botón del menú principal / micromenú.",
            OPT_DEBUG = "Activar depuración",
            OPT_DEBUG_DESC = "Muestra mensajes de depuración en el chat para pruebas.",
            BTN_APPLY = "Aplicar ahora",
            STATUS_APPLIED = "Cambios aplicados.",
        },
        esMX = {
            PAGE_TITLE = "FastNotificationRemove",
            PAGE_DESC = "Elimina las insignias NEW de la configuración de Blizzard y oculta automáticamente las notificaciones del menú.",
            LABEL_SECTION = "General",
            OPT_SETTINGS = "Quitar insignias NEW de configuración",
            OPT_SETTINGS_DESC = "Oculta los marcadores NEW en las categorías de configuración de Blizzard.",
            OPT_MENU = "Quitar notificaciones del micromenú",
            OPT_MENU_DESC = "Oculta las notificaciones del botón del menú principal / micromenú.",
            OPT_DEBUG = "Activar depuración",
            OPT_DEBUG_DESC = "Muestra mensajes de depuración en el chat para pruebas.",
            BTN_APPLY = "Aplicar ahora",
            STATUS_APPLIED = "Cambios aplicados.",
        },
        itIT = {
            PAGE_TITLE = "FastNotificationRemove",
            PAGE_DESC = "Rimuove i badge NEW nelle impostazioni Blizzard e nasconde automaticamente le notifiche del menu.",
            LABEL_SECTION = "Generale",
            OPT_SETTINGS = "Rimuovi badge NEW dalle impostazioni",
            OPT_SETTINGS_DESC = "Nasconde gli indicatori NEW nelle categorie delle impostazioni Blizzard.",
            OPT_MENU = "Rimuovi notifiche del micro menu",
            OPT_MENU_DESC = "Nasconde le notifiche sul pulsante del menu principale / micro menu.",
            OPT_DEBUG = "Abilita debug",
            OPT_DEBUG_DESC = "Mostra messaggi di debug in chat per i test.",
            BTN_APPLY = "Applica ora",
            STATUS_APPLIED = "Modifiche applicate.",
        },
        ptBR = {
            PAGE_TITLE = "FastNotificationRemove",
            PAGE_DESC = "Remove os badges NEW nas configurações da Blizzard e oculta automaticamente as notificações do menu.",
            LABEL_SECTION = "Geral",
            OPT_SETTINGS = "Remover badges NEW das configurações",
            OPT_SETTINGS_DESC = "Oculta os marcadores NEW nas categorias de configurações da Blizzard.",
            OPT_MENU = "Remover notificações do micro menu",
            OPT_MENU_DESC = "Oculta as notificações no botão do menu principal / micro menu.",
            OPT_DEBUG = "Ativar debug",
            OPT_DEBUG_DESC = "Mostra mensagens de debug no chat para testes.",
            BTN_APPLY = "Aplicar agora",
            STATUS_APPLIED = "Alterações aplicadas.",
        },
        ruRU = {
            PAGE_TITLE = "FastNotificationRemove",
            PAGE_DESC = "Удаляет значки NEW в настройках Blizzard и автоматически скрывает уведомления меню.",
            LABEL_SECTION = "Общее",
            OPT_SETTINGS = "Убрать значки NEW в настройках",
            OPT_SETTINGS_DESC = "Скрывает метки NEW в категориях настроек Blizzard.",
            OPT_MENU = "Убрать уведомления микроменю",
            OPT_MENU_DESC = "Скрывает уведомления на кнопке главного меню / микроменю.",
            OPT_DEBUG = "Включить отладку",
            OPT_DEBUG_DESC = "Показывает отладочные сообщения в чате для тестирования.",
            BTN_APPLY = "Применить сейчас",
            STATUS_APPLIED = "Изменения применены.",
        },
        koKR = {
            PAGE_TITLE = "FastNotificationRemove",
            PAGE_DESC = "블리자드 설정의 NEW 배지를 제거하고 메뉴 알림을 자동으로 숨깁니다.",
            LABEL_SECTION = "일반",
            OPT_SETTINGS = "설정 NEW 배지 제거",
            OPT_SETTINGS_DESC = "블리자드 설정 카테고리의 NEW 표시를 숨깁니다.",
            OPT_MENU = "마이크로 메뉴 알림 제거",
            OPT_MENU_DESC = "메인 메뉴 / 마이크로 메뉴 버튼의 알림을 숨깁니다.",
            OPT_DEBUG = "디버그 활성화",
            OPT_DEBUG_DESC = "테스트용 디버그 메시지를 대화창에 표시합니다.",
            BTN_APPLY = "지금 적용",
            STATUS_APPLIED = "변경 사항이 적용되었습니다.",
        },
        zhCN = {
            PAGE_TITLE = "FastNotificationRemove",
            PAGE_DESC = "移除暴雪设置中的 NEW 标记，并自动隐藏菜单通知。",
            LABEL_SECTION = "常规",
            OPT_SETTINGS = "移除设置中的 NEW 标记",
            OPT_SETTINGS_DESC = "隐藏暴雪设置分类中的 NEW 标记。",
            OPT_MENU = "移除微型菜单通知",
            OPT_MENU_DESC = "隐藏主菜单 / 微型菜单按钮上的通知。",
            OPT_DEBUG = "启用调试",
            OPT_DEBUG_DESC = "在聊天窗口显示调试信息以便测试。",
            BTN_APPLY = "立即应用",
            STATUS_APPLIED = "更改已应用。",
        },
        zhTW = {
            PAGE_TITLE = "FastNotificationRemove",
            PAGE_DESC = "移除暴雪設定中的 NEW 標記，並自動隱藏選單通知。",
            LABEL_SECTION = "一般",
            OPT_SETTINGS = "移除設定中的 NEW 標記",
            OPT_SETTINGS_DESC = "隱藏暴雪設定分類中的 NEW 標記。",
            OPT_MENU = "移除微型選單通知",
            OPT_MENU_DESC = "隱藏主選單 / 微型選單按鈕上的通知。",
            OPT_DEBUG = "啟用除錯",
            OPT_DEBUG_DESC = "在聊天視窗顯示除錯訊息以供測試。",
            BTN_APPLY = "立即套用",
            STATUS_APPLIED = "變更已套用。",
        },
    }
    local selected = strings[locale] or strings.enUS
    setmetatable(L, { __index = selected })
end

local function dprint(...)
    if FastNotificationRemove.db and FastNotificationRemove.db.profile.debug then
        print("|cff00ff98FastNotificationRemove:|r", ...)
    end
end

local function HideCategoryBadge(button)
    if button and button.NewFeature then
        button.NewFeature:SetShown(false)
    end
end

-- Midnight 12.x is much stricter about taint/secret values.
-- Do NOT write into Blizzard globals like NewSettingsSeen here.
-- We only hide the visual badges after Blizzard has built/refreshed them.
local function CanTouchVisualUI()
    return not InCombatLockdown()
end

local function HideVisualFrame(frame)
    if frame and CanTouchVisualUI() then
        frame:Hide()
    end
end

local function CreateSimpleCheckbox(parent, x, y, text, tooltip, checked, onClick)
    local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    cb:SetPoint("TOPLEFT", x, y)
    cb:SetSize(24, 24)
    cb:SetChecked(checked and true or false)
    cb.tooltipText = tooltip

    local label = parent:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    label:SetPoint("LEFT", cb, "RIGHT", 8, 0)
    label:SetWidth(520)
    label:SetJustifyH("LEFT")
    label:SetJustifyV("MIDDLE")
    label:SetWordWrap(true)
    label:SetText(text)

    cb.Label = label
    cb:SetScript("OnClick", function(button)
        if onClick then
            onClick(button:GetChecked() and true or false)
        end
    end)

    return cb
end

function FastNotificationRemove:RemoveSettingsNotifications()
    if not self.db.profile.removeSettingsBadges then
        return
    end

    if not CanTouchVisualUI() then
        return
    end

    if SettingsPanel and SettingsPanel.CategoryList and SettingsPanel.CategoryList.CategoryButtons then
        for button in pairs(SettingsPanel.CategoryList.CategoryButtons) do
            HideCategoryBadge(button)
        end
    end

    if SettingsCategoryListButtonMixin and not self._hookedCategoryButtonMixin then
        hooksecurefunc(SettingsCategoryListButtonMixin, "RefreshNewFeature", function(button)
            if FastNotificationRemove.db and FastNotificationRemove.db.profile.removeSettingsBadges and CanTouchVisualUI() then
                HideCategoryBadge(button)
            end
        end)
        self._hookedCategoryButtonMixin = true
    end

    -- Hide the NEW marker on the ESC/Game Menu after Blizzard refreshes its buttons.
    -- Important: we do not change CurrentVersionHasNewUnseenSettings() data anymore.
    if GameMenuFrameMixin and not self._hookedGameMenuMixin then
        hooksecurefunc(GameMenuFrameMixin, "InitButtons", function(menu)
            if FastNotificationRemove.db and FastNotificationRemove.db.profile.removeSettingsBadges and CanTouchVisualUI() then
                HideVisualFrame(menu and menu.NewOptionsFrame)
            end
        end)
        self._hookedGameMenuMixin = true
    end

    if GameMenuFrame then
        HideVisualFrame(GameMenuFrame.NewOptionsFrame)
    end
end

function FastNotificationRemove:RemoveMicroMenuNotifications()
    if not self.db.profile.removeMicroMenuNotifications then
        return
    end

    if not CanTouchVisualUI() then
        return
    end

    if MainMenuMicroButton then
        HideVisualFrame(MainMenuMicroButton.Alert)
        HideVisualFrame(MainMenuMicroButton.NotificationOverlay)
    end

    if type(UpdateMicroButtons) == "function" and not self._hookedUpdateMicroButtons then
        hooksecurefunc("UpdateMicroButtons", function()
            if FastNotificationRemove.db and FastNotificationRemove.db.profile.removeMicroMenuNotifications then
                C_Timer.After(0, function()
                    if MainMenuMicroButton and CanTouchVisualUI() then
                        HideVisualFrame(MainMenuMicroButton.Alert)
                        HideVisualFrame(MainMenuMicroButton.NotificationOverlay)
                    end
                end)
            end
        end)
        self._hookedUpdateMicroButtons = true
    end
end

function FastNotificationRemove:RefreshAll()
    self:RemoveSettingsNotifications()
    self:RemoveMicroMenuNotifications()
end

function FastNotificationRemove:CreateOptionsCanvas()
    if self.optionsCategory or not Settings then
        return
    end

    local panel = CreateFrame("Frame", ADDON_NAME .. "OptionsPanel")

    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalHuge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(L.PAGE_TITLE)

    local subtitle = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
    subtitle:SetWidth(700)
    subtitle:SetJustifyH("LEFT")
    subtitle:SetText(L.PAGE_DESC)

    local section = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    section:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", 0, -22)
    section:SetText(L.LABEL_SECTION)

    local cb1 = CreateSimpleCheckbox(
        panel, 16, -110,
        L.OPT_SETTINGS,
        L.OPT_SETTINGS_DESC,
        self.db.profile.removeSettingsBadges,
        function(value)
            self.db.profile.removeSettingsBadges = value
            self:RefreshAll()
        end
    )

    local cb2 = CreateSimpleCheckbox(
        panel, 16, -146,
        L.OPT_MENU,
        L.OPT_MENU_DESC,
        self.db.profile.removeMicroMenuNotifications,
        function(value)
            self.db.profile.removeMicroMenuNotifications = value
            self:RefreshAll()
        end
    )

    local cb3 = CreateSimpleCheckbox(
        panel, 16, -182,
        L.OPT_DEBUG,
        L.OPT_DEBUG_DESC,
        self.db.profile.debug,
        function(value)
            self.db.profile.debug = value
        end
    )

    local applyButton = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    applyButton:SetSize(140, 24)
    applyButton:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 4, -18)
    applyButton:SetText(L.BTN_APPLY)
    applyButton:SetScript("OnClick", function()
        self:RefreshAll()
        if self.db.profile.debug then
            print("|cff00ff98FastNotificationRemove:|r " .. L.STATUS_APPLIED)
        end
    end)

    local category = Settings.RegisterCanvasLayoutCategory(panel, L.PAGE_TITLE, L.PAGE_TITLE)
    Settings.RegisterAddOnCategory(category)

    self.optionsPanel = panel
    self.optionsCategory = category
end

function FastNotificationRemove:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("FastNotificationRemoveDB", defaults, true)
end

function FastNotificationRemove:OnEnable()
    self:RegisterEvent("PLAYER_LOGIN", "RefreshAll")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "RefreshAll")
    self:RegisterEvent("SETTINGS_LOADED", "RefreshAll")
    self:RegisterEvent("ADDON_LOADED", "OnAddonLoaded")

    self:CreateOptionsCanvas()
    self:RefreshAll()
end

function FastNotificationRemove:OnAddonLoaded(_, addonName)
    if addonName == "Blizzard_Settings" then
        self:CreateOptionsCanvas()
        self:RefreshAll()
    end
end
