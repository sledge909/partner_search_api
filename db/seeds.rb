service = Service.create!(name: 'flooring')
wood = Skill.create!(name: 'wood', service: Service.last)
tile = Skill.create!(name: 'tile', service: Service.last)
carpet = Skill.create!(name: 'carpet', service: Service.last)

partner = Partner.create!(name: 'Partner 1', address: '199 Upper Chorlton Rd, Manchester, M16 0BH', operating_radius: 5, rating: 5)
partner.services << service
partner.skills. << wood

partner2 = Partner.create!(name: 'Partner 2', address: '89 Albany Rd, Manchester, M21 0BN', operating_radius: 10, rating: 6)
partner2.services << service
partner2.skills << [wood, carpet]

partner3 = Partner.create!(name: 'Partner 3', address: '374-376 Barlow Moor Rd, Manchester, M21 8AZ', operating_radius: 10, rating: 7)
partner3.services << service
partner3.skills << [wood, carpet, tile]

partner4 = Partner.create!(name: 'Partner 4', address: '1 Acres Road, Manchester, M21 9EB', operating_radius: 15, rating: 8)
partner4.services << service
partner4.skills << [wood, carpet]

partner5 = Partner.create!(name: 'Partner 5', address: '4 Clifden Mews, London, E5 0LR', operating_radius: 10, rating: 2)
partner5.services << service
partner5.skills << [wood, carpet, tile]
