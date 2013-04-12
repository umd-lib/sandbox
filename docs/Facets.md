# Facet Navigation

The facet navigation can be applied to a set of documents of a document type with a set of fields. 
The configuration is to add a node of type "hippofacnav:facetnavigation" and add necessary properties
to associate the documents and facets to be navigated. 
Once the facet node is configured, Hippo generates the child navigation nodes (navigation tree) based on the configuration.
The navigation tree contains the facets, the number of documents and documents for the facet.
In this web site, a "right-facet-navigation" component displays a search box and
a navigation tree that can be fitted in the right side bar of the subsite.
This document explains how the component is defined and how to use it.
Here are examples of pages containing the facet navigation at right side bar are:

* [Newsroom](http://localhost:8080/site/news)
* [GIS Data Sets](http://localhost:8080/site/gis/dataset)
* [GIS Data Layers](http://localhost:8080/site/gis/datalayer)
* [MD Maps](http://localhost:8080/site/mdmap/search)

## Faceted node configuration
For the facet configuration detail, check the Hippo site 
[Faceted Navigation Configuration](http://www.onehippo.org/7_7/library/concepts/faceted-navigation/faceted-navigation-configuration.html).
The node is created from the cms console. In general, the node is under
the folder where the documents are. Here are examples from our website:

* /content/documents/public/news/faceted
* /content/documents/public/library-staff/faceted
* /content/documents/public/gov-info-gis/gis-data-repository//faceted
* /content/documents/public/maryland-maps/maps/faceted

The faceted node configuration contains the following properties:

* hippofacnav:facets
> Specify the multiple facets that are in the navigation. 

* hippofacnav:facetnodenames
> Specify the facet names for each facet in the hippofacnav:facets.

* hippofacnav:sortorder
> Specify the value of descending or ascending

* hippofacnav:sortby
> Specify the field to use for sorting the documents.

* hippo:docbase
> Specify the top folder of the documents for navigation

* hippofacnav:filters 
> Specify the document type for the documents that will be navigated.

## Template
The "right-facet-navigation" template is implemented
to render the data for the facet navigation. 
The template accepts ${facetnav} from the component class. 
The ${facetnav} is a facet navigation node. 
The template traverses down the navigation node to get the data and renders the data.
Its render path is 

* rendering path

>[jsp/components/right-facet-navigation.jsp](../site/src/main/webapp/WEB-INF/jsp/components/right-facet-navigation.jsp)

## Component

The right facet navigation component is created for re-use in the page design.
Any page has a right region can configure to have the right facet navigation component. 
There are parameters that the page can set to customize the behavior of the component.

* Component class: [edu.umd.lib.hippo.components.common.FacetNavigation](../site/src/main/java/edu/umd/lib/hippo/components/common/FacetNavigation.java)
* Template: right-facet-navigation
* Available parameters:
 * facetTitle: tilt to show 
 * placeHolderMessage: the message to show in the search box
 * showSearchHelper: 1 to show the helper message

## Include the right-facet-navigation component in a page

The component is usually included in the "right" region of a page. 
Here is an example of the HST page: gis-itemlist.

hst:pages/gis-itemlist component structure:

  gis-itemlist
	| (hst:referencecomponent = hst:pages/gis)
	|
	\-> main
	    | (hst:template = subsite.main)
	    |
	    |
	    +-> content
	    |     (hst:referencecomponent = hst:components/gis-itemlist)
	    |     
	    |
	    \-> right
	          (hst:referencecomponents = right-facet-navigation)
	          (hst:parameternames: facetTitle, placeholderMsg, showSearchHelper)
	          (hst:parametervalues: ...)
	          


## HST Pages Contain Facet Navigation

* [gis-itemlist](GIS.md)
* mdmap-itemlist
* AboutNews









