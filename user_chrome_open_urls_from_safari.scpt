property url_list : {}

tell application "Safari"
	set all_windows to every window
	repeat with the_window in all_windows
		set all_tabs to every tab of the_window
		repeat with the_tab in all_tabs
			set tab_url to URL of the_tab
			set end of url_list to tab_url
		end repeat
	end repeat
	-- 关闭所有标签页
	close every tab of every window
	
	-- 退出 Safari
	quit
end tell


tell application "Google Chrome"
	activate
	-- 遍历每个 URL 地址
	repeat with the_url in url_list
		-- 创建新的标签页并加载 URL 地址
		tell window 1 to make new tab with properties {URL:the_url}
		
		-- 等待页面加载完成
		-- repeat until (loading of active tab of window 1 is false)
		--     delay 1
		-- end repeat
	end repeat
end tell
