#let par_space = 0.5em
#let sep_space = par_space + 0.2em
#let color = rgb("#336699")

#let format_date(start_date: none, end_date: none) = {
  let date = {
    if end_date == none {
        start_date
      } else if start_date == none {
        end_date
      } else {
        start_date + " - " + end_date
      }
  }

  [*#date*]
}

#let format_detail(el) = {
  let display = box(image(height: 0.7em, "images/" + el.image + ".svg")) + " " + el.text
  if el.link != none {
    link(el.link, display)
  }
  else {
    display
  }
}

#let entry(name, location, start_date: none, end_date: none, description) = {
  grid(
    columns: (3fr, 1fr),
    column-gutter: 1cm,
    {
      set align(left)
      [*#name*] + [ --- #location]
    },
    {
      set align(right)
      format_date(start_date: start_date, end_date: end_date)
    }
  )
  if description != none {
    block(above: sep_space, description)
  }
}


#set page(margin: (x: 1.5cm, y: 0.5cm))
#set text(11pt, font: "Fira Sans")
#set par(leading: par_space)
#set list(indent: 1em)

#show link: underline

#show heading.where(level: 1): i => {
  set align(left)
  let title = smallcaps(i.body)

  set block(above: 1em)
    set text(weight: "light", size: 1.2em, fill: color)
    stack(
      dir: ttb,
      spacing: 2mm,
      title,
      line(length: 100%, stroke: color + 2pt)
  )
}

#show heading.where(level: 2): i => {
  set align(left)
  let title = smallcaps(i.body)
  set block(above: 0.8em)
  set text(weight: "light", size: 1em, fill: color)
  title
}

#let contact_data = (
  (
    "image": "email",
    "text": "jcristharif@gmail.com",
    "link": "mailto://jcristharif@gmail.com"
  ),
  (
    "image": "github",
    "text": "jcrist",
    "link": "https://github.com/jcrist"
  ),
  (
    "image": "website",
    "text": "jcristharif.com",
    "link": "https://jcristharif.com"
  ),
  (
    "image": "location",
    "text": "Saint Paul, MN",
    "link": none
  )
)

#align(center)[
  #smallcaps(text(size: 2.5em, fill: color)[Jim Crist-Harif]) \

  #{
    if contact_data != none and contact_data.len() > 0 {
      contact_data.map(format_detail).join(" | ")
    }
  }
]

= Summary

An experienced software engineer and manager with a proven track record of
developing OSS data analytics tools that users love.

#grid(columns: (1fr, 1fr))[
== Languages
- Proficient: Python | Cython | C
- Capable: SQL | Go | Java

== Technologies
- K8s | Apache YARN | HPC Schedulers
- DuckDB | Polars | Dask | Ibis
][
== Interests
- Data Analytics Tooling
- API Design / Developer Experience
- Distributed Systems
- Open Source Community Health
]

= Experience
#entry(
  "Engineering Manager",
  "Voltron Data",
  start_date: "Jun 2022",
  end_date: "Oct 2024",
)[
  - Led the team developing `ibis`, an ergonomic dataframe API wrapping 20+ SQL
    databases.
  - Interfaced with Product and Leadership to turn product requirements into
    engineering tasks.
  - Authored Ibis's backend wrapping Voltron Data's distributed GPU engine.
  - Created `ibis-ml`, an ML framework for preprocessing and feature
    engineering using Ibis.
]

#entry(
  "Senior Software Engineer",
  "Coiled",
  start_date: "Aug 2021",
  end_date: "May 2022",
)[

  - Led an effort to revamp dask's parquet support, improving performance by up
    to 8x.
  - Optimized dask's networking layer, reducing RPC latency by 2x.
]

#entry(
  "Senior Software Engineer",
  "Prefect",
  start_date: "Apr 2020",
  end_date: "May 2021",
)[
  - Led development of Prefect's core workflow framework.
  - Interfaced actively with users and customers, helping resolve issues and
    improve user experience.
  - Optimized Prefect's `dask` integration, allowing for resilient and scalable
    execution of large workflows.
]

#entry(
  "Senior Software Engineer",
  "Anaconda",
  start_date: "Jun 2015",
  end_date: "Apr 2020",
)[
  - Core contributor to `dask` & `distributed`, a parallel and distributed
    compute framework for Python. Wrote much of the original implementation
    of `dask` and `dask-ml`.
  - Created #link("https://datashader.org/")[datashader], a high performance
    plotting library for large data.
  - Identified and resolved issues deploying Python in enterprise Hadoop
    environments. This resulted in the development of several new tools,
    including a
    #link("https://jupyterhub-on-hadoop.readthedocs.io/en/latest/")[complete
    JupyterHub deployment].
  - Created and led development of
    #link("https://gateway.dask.org/")[dask-gateway], a tool for managing and
    deploying Dask in multi-user enterprise environments. Helped several large
    organizations deploy `dask-gateway` to serve hundreds of users.
  - Executed `dask` consulting engagements, helping several Fortune 500
    companies use `dask` in production. ]

= Open Source
- #link("https://dask.org")[Dask] steering council member
- #link("https://ibis-project.org")[Ibis] steering council member
- Creator and lead maintainer of
  #link("https://jcristharif.com/msgspec/")[msgspec], currently the fastest
  JSON validation library for Python.
- Presented #link("https://jcristharif.com/talks.html")[talks and tutorials] at
  30+ past conferences including Strata, PyCon, SciPy & PyData.
- Past mentor for #link("https://summerofcode.withgoogle.com/")[Google Summer
  of Code].

= Education
#entry(
  "MSc. Mechanical Engineering (unfinished)",
  "University of Minnesota",
  start_date: "Sep 2013",
  end_date: "May 2015",
  "Designed novel state estimation algorithm for linear actuator system."
)
#entry(
  "BSc. Mechanical Engineering",
  "University of Minnesota",
  start_date: "Sep 2009",
  end_date: "May 2013",
  none,
)
