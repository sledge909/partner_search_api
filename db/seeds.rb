service = Service.create!(name: 'flooring')
wood = Skill.create!(name: 'wood', service: Service.last)
tile = Skill.create!(name: 'tile', service: Service.last)
carpet = Skill.create!(name: 'carpet', service: Service.last)

partner = Partner.create!(name: 'Best Flooring', address: '1 Acres Road, Manchester, M21 9EB', operating_radius: 5, rating: 5)
partner.services << service
partner.skills. << wood

partner2 = Partner.create!(name: 'The Flooring Co', address: '35 Acres Road, Manchester, M21 9EB', operating_radius: 10, rating: 6)
partner2.services << service
partner2.skills << [wood, carpet]

partner3 = Partner.create!(name: 'Flooring Ltd', address: '4 Clifden Mews, London, E5 0LR', operating_radius: 15, rating: 7)
partner3.services << service
partner3.skills << [wood, carpet, tile]
