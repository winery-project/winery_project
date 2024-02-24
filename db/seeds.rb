Admin.create!(
  email: 'admin@admin',
  password: 'adminadmin'
)

customer = Customer.create!(
  last_name: 'サンプル',
  first_name: '太郎',
  last_name_kana: 'サンプル',
  first_name_kana: 'タロウ',
  email: 'a@gmail.com',
  password: 'aaaaaa',
  postal_code: '1234567',
  address: '神奈川県鎌倉市南区',
  phone_number: '000-0000-0000'
)

Delivery.create!(
  customer_id: customer.id,
  name: '配送先太郎',
  postal_code: '111-1111',
  address: '沖縄県国際通り３丁目'
)

country_us = Country.create!(
  name: "The United States",
  flag_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/the_us.jpeg")), filename: 'the_us.jpeg')
)

country_dk = Country.create!(
  name: "Denmark",
  flag_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/denmark.jpeg")), filename: 'denmark.jpeg')
)

country_jp = Country.create!(
  name: "Japan",
  flag_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/japan.jpeg")), filename: 'japan.jpeg')
)

country_fr = Country.create!(
  name: "France",
  flag_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/france.jpeg")), filename: 'france.jpeg')
)


company_1 = Company.create!(
  name: "Pernod Ricard",
  introduction: "The world's leading premium spirits company, serving up the world's favourite drinks brands in more than 160 countries.",
  email: "pernod_ricard@gmail.com",
  phone_number: "03-5802-2756",
  country_id: country_fr.id,
  logo_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/pernod_ricard.jpeg")), filename: 'pernod_ricard.jpeg')
)

genre_1 = Genre.create!(
  name: 'Red Wine'
)

Genre.create!(
  name: 'White Wine'
)

Genre.create!(
  name: 'Rose Wine'
)

wine_1= Wine.create!(
  genre_id: genre_1.id,
  company_id: company_1.id,
  country_id: country_fr.id,
  name: "Romanée Conti",
  introduction: "Worlds's most famous and expensive French wine. Romanee Conti produces only 5000 to 6000 wines in a year, that is one of the reasons why they get highly priced.",
  maturity: 5,
  fruity: 3,
  bitter: 4,
  smooth: 4,
  aftertaste: 5,
  flavor: 4,
  price: 1900000,
  is_sold: true,
)