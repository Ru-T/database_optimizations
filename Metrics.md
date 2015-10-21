## Part One - Analysis

#Pre indices
* rake db:seed - 3070.717426 seconds

* Page load:
- Top of page - Rails: Total time before HTML is generated: 2087.742464 s
- Bottom of page - Rails: Total time before HTML is generated: 2089.611497 s
** Idle time in browser should equal run time in Rails

# Post indices
* rake db:migrate - 5.7900s

* Page load:
- Top of page - Rails: Total time before HTML is generated: 19.607232 s
- Bottom of page - Rails: Total time before HTML is generated: 21.016825 s
- Completed 200 OK in 21295ms (Views: 1461.0ms | ActiveRecord: 8348.3ms)

# Further enhancements
- Runtime:
- rake db:migrate -
- rake db:seed -
- Was there an improvement or a worsening of runtime? By what percent and why?
- Which is faster: (a) running rake db:seed without indices and then running a migration to add indices, or (b) adding indices during your initial rake db:migrate, then running rake db:seed?

# Database Size

- Size of database: 569.5 MB
- Size of development log: 743.4 MB
- One method for reducing the size of one of these, yet keeping your data intact: Log rotation
- Do you think that this is smaller, about right, or larger than the size of databases you'll be working with in your career? Larger - normally, databases dealing with customer info should be under 500 MB


# Memory

* Pre indices
- Memory used before HTML is generated: 217 MB
- Memory used after HTML is generated: 295 MB

* Post indices
- Memory used before HTML is generated: 422 MB
- Memory used after HTML is generated: 430 MB

* If you reload a page again and again (with no code changes in between reloads), does memory used stay the same? Have you ever been able to make memory used go down?
