local MRTNI = LibStub("AceAddon-3.0"):NewAddon("MRTNI", "AceConsole-3.0")
local AceGUI = LibStub("AceGUI-3.0")
local JSON = LibStub("LibJSON-1.0")

local frameShown = false
local textStore = ""

function MRTNI:OnInitialize()
    self:RegisterChatCommand("mrtni", "ChatCommand")
end

function MRTNI:strsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

local function showFrame()
    if frameShown then
        return
    end
    frameShown = true

    local frame = AceGUI:Create("Frame")
    frame:SetTitle("MRT Notes JSON Importer")
    frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget); frameShown = false; end)
    frame:SetLayout("List")

    local editbox = AceGUI:Create("MultiLineEditBox")
    editbox:SetLabel("Insert JSON here:")
    editbox:DisableButton(true)
    editbox:SetFocus(true)
    editbox:SetFullWidth(true)
    editbox:SetHeight(360)
    editbox:SetMaxLetters(99999999)
    editbox:SetCallback("OnEnterPressed", function(widget, event, text) textStore = text end)
    editbox:SetCallback("OnTextChanged", function(widget, event, text) textStore = text end)
    frame:AddChild(editbox)

    local setbutton = AceGUI:Create("Button")
    setbutton:SetText("Set Notes")
    setbutton:SetWidth(100)
    setbutton:SetCallback("OnClick", function() MRTNI:ConvertInputToMRTNotes(textStore, frame); end)
    frame:AddChild(setbutton)

    local fetchbutton = AceGUI:Create("Button")
    fetchbutton:SetText("Fetch Notes")
    fetchbutton:SetWidth(100)
    fetchbutton:SetCallback("OnClick", function() MRTNI:ConvertMRTNotesToInput(editbox); end)
    frame:AddChild(fetchbutton)
    end

function MRTNI:ChatCommand()
    showFrame()
end

function MRTNI:ConvertInputToMRTNotes(t, frame)
    -- Delete the existing notes
    VMRT.Note.Black = {}
    VMRT.Note.BlackNames = {}

    -- Make the new notes
    local i = 1
    local status, parsedTable = pcall(JSON.Deserialize, t)
    if not status then
        frame:SetStatusText(MRTNI:strsplit(parsedTable, ":")[3] .. MRTNI:strsplit(parsedTable, ":")[4])
    else
        for k, v in pairs(parsedTable) do
            VMRT.Note.BlackNames[i] = k
            VMRT.Note.Black[i] = v
            i = i + 1
        end
        AceGUI:Release(frame)
    end
end

function MRTNI:ConvertMRTNotesToInput(editbox)
    if #VMRT.Note.BlackNames == 0 then
        editbox:SetText("Cannot read notes. Please update notes in /mrt, or paste JSON here to set mrt notes.")
        return
    end
    print(#VMRT.Note.BlackNames)
    local i = 0
    local t = {}
    for _ in pairs(VMRT.Note.BlackNames) do
        i = i + 1
        t[VMRT.Note.BlackNames[i]] = VMRT.Note.Black[i]
    end
    textStore = JSON.Serialize(t)
    editbox:SetText(textStore)
end
