require 'csv'
require 'nkf'

def purify(file_path)
    puts "purifying " + file_path

    export_csv = CSV.generate do |csv|
        previous_address = ""
        CSV.foreach(file_path, headers: true) do |data|
            # [FIXME]東京都を挿入している。元ファイルに含めるべき。
            # 「"」と改行を削除
            address = "東京都" + data[0].delete("\"").chomp
            # 全角を半角にする
            address = address.tr('０-９', '0-9').sub(/号.*/m, "")
            if address.include?("－")
                address = address.sub(/－.*/m,"")
            end
            # 部屋番号が含まれていたらその部分を削除
            address += "号"
            # 上の処理で消えた号を末尾に追加

            # [FIXME]直前の住所との重複を削除しているだけ、住所の重複ではない
            if address == previous_address
                next
            end
            previous_address = address

            row = [
                address,
                data[1],
                data[2]
            ]
            csv << row
        end
    end
    puts file_path + " was purified"
    return export_csv
end