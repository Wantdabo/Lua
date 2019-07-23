require("common/view_define")
require("common/game_enum")
require("common/base_class")
require("common/base_ctrl")
require("common/base_view")

local require_list = {
	"common/config_manager",
	"common/view_manager",
	"game/role_exp/role_exp_ctrl",
}

function Init()
	for _, v in ipairs(require_list) do
		require(v)
	end
	Config.New()
	ViewManager.New()
	RoleExpCtrl.New()
end

function main()
	Init()
	print("------------------------- View DEMO")
	ViewManager:Open(View.RoleExpView)
	ViewManager:Close(View.RoleExpView)
	print("------------------------- Config DEMO")
	local cfg = Config:GetConfig(GAME_ENUM.CONFIG.ROLE_EXP_CONFIG)
	for _, v in ipairs(cfg) do
		print("LEVEL:" .. v.level, "EXP:" .. v.exp)
	end
end

main()