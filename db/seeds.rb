Admin.create!(
  email: 'admin@admin',
  password: 'adminadmin'
)

Customer.create!(
  last_name: 'oshima',
  first_name: 'taishu',
  last_name_kana: 'オオシマ',
  first_name_kana: 'タイシュウ',
  email: 'a@gmail.com',
  password: 'aaaaaa',
  postal_code: '1234567',
  address: '横浜市南区永田東１−２４−２３',
  phone_number: '08067750276'
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

Genre.create!(
  name: 'Red Wine'
)

Genre.create!(
  name: 'White Wine'
)

Genre.create!(
  name: 'Rose Wine'
)

