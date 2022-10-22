ActiveRecord::Base.connection.execute("truncate table #{Company.table_name} restart identity;")
ActiveRecord::Base.connection.execute("truncate table #{Job.table_name} restart identity;")
ActiveRecord::Base.connection.execute("truncate table #{Geek.table_name} restart identity;")
ActiveRecord::Base.connection.execute("truncate table #{Apply.table_name} restart identity;")

Company.create!([
                  {name: "8base", location: "Майами"},
                  {name: "Google", location: "Москва"},
                  {name: "EPAM", location: "Санкт-Петербург"}
                ])
Job.create!([
              {name: "QA Engineer", place: "Москва", company_id: Company.find_by_name("8base").id},
              {name: "Front-end", place: "Москва", company_id: Company.find_by_name("EPAM").id},
              {name: "Back-end", place: "Москва", company_id: Company.find_by_name("EPAM").id},
              {name: "DevOps", place: "Москва", company_id: Company.find_by_name("Google").id},
            ])
Geek.create!([
               {name: "Никита", stack: "123", resume: "1111"},
               {name: "Михаил", stack: "123", resume: "1111"},
               {name: "Екатерина", stack: "123", resume: "1111"},
             ])
Apply.create!([
                {job_id: 1, geek_id: 1},
                {job_id: 1, geek_id: 2},
                {job_id: 2, geek_id: 2}
              ])