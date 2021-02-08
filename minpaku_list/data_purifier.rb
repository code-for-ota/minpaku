require 'csv'
require 'nkf'
require 'geocoder'
require 'dotenv'

def address_splitter(address)
    rex = /(...??[都道府県])((?:旭川|伊達|石狩|盛岡|奥州|田村|南相馬|那須塩原|東村山|武蔵村山|羽村|十日町|上越|富山|野々市|大町|蒲郡|四日市|姫路|大和郡山|廿日市|下松|岩国|田川|大村)市|.+?郡(?:玉村|大町|.+?)[町村]|.+?市.+?区|.+?[市区町村])(.+)/
    # ["東京都", "大田区", "大森東三丁目8番3号"] のように都道府県、市区町村、その他で出力される
    # https://qiita.com/zakuroishikuro/items/066421bce820e3c73ce9
    return address.match(rex).captures
end

def add_tokyo(address)
    return "東京都" + address
end

def remove_special_characters(address)
    return address.delete("\"").chomp
end    

def convert_to_hankaku(address)
    return address.tr('０-９', '0-9').sub(/号.*/m, "")
end

def remove_room_number(address)
    if address.include?("－")
        address = address.sub(/－.*/m,"")
    end
    # 部屋番号が含まれていたらその部分を削除
    address += "号"
    # 上の処理で消えた号を末尾に追加
    return address
end

def row_builder(data, address)
    prefecture, city, address_details = address_splitter(address)
    name = data[2]
    type = data[1]
    location = Geocoder.search(address).first
    postal_code = location.postal_code
    latitude = location.latitude
    longitude = location.longitude

    row = [
        name,
        postal_code,
        prefecture,
        city,
        address_details,
        latitude,
       longitude,
       type
    ]

    return row
end

def purify(file_path)
    puts "purifying " + file_path

    Dotenv.load
    Geocoder.configure(lookup: :google, api_key: ENV['GOOGLEMAP_API_KEY'])

    export_csv = CSV.generate do |csv|
        previous_address = ""
        CSV.foreach(file_path, headers: true) do |data|
            address = data[0]

            # [FIXME]東京都を挿入している。元ファイルに含めるべき。
            address = add_tokyo(address)
            address = remove_special_characters(address)
            address = convert_to_hankaku(address)
            address = remove_room_number(address)

            # [FIXME]直前の住所との重複を削除しているだけ、住所の重複ではない
            if address == previous_address
                next
            end
            previous_address = address

            row = row_builder(data, address)

            csv << row

            puts row
            sleep(0.2)
        end
    end
    puts file_path + " was purified"
    return export_csv
end

purify(ARGV[0])