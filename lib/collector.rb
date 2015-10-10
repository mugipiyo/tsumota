# ファイル収集用クラス
class Collector

  # 探索基底パスを設定し初期化
  def initialize(root_path)
    # TODO : パス文字を意識せずに動くようにしたい...(windowsでも)
    @root_path = Pathname.new(root_path)

  end

  # 基底パス配下を探索し、ファイルごとに受け取ったprocを呼ぶ
  def collect
    @root_path.each_child {|pathname|
      register pathname.relative_path_from(@root_path)
    }
  end

  # 降るパス
  def register(pathname)
    item = Item.new({relative_path: pathname.to_s})
    if item.save
      p "register : #{pathname.to_s}"
    else
      p "already exists : #{pathname.to_s}"
    end
  end
end