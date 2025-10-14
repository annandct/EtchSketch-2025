---
layout: page
title: Research Staff
nav_order: 2
description: A listing of all the course staff members.
---
<!--
Staff information is stored in the `_staffers` directory and rendered according to the layout file, `_layouts/staffer.html`.
-->
# Researcher Staff

{% assign external = site.staffers | where: 'role', 'External' %}
{% assign researcher = site.staffers | where: 'role', 'Researcher' %}
{% assign num_researcher = researcher | size %}
{% if num_researcher != 0 %}

## Experimenters 

{% for staffer in researcher %}
{{ staffer }}
{% endfor %}
{% endif %}

## Collaborators


{% for staffer in external %}
{{ staffer }}
{% endfor %}

