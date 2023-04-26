var editor = new LoadEditor({
  aot: {
    title: "Text Annotations",
    variants: [
      {
        opt: "del",
        opt_slider: "deleted-slider",
        title: "Deleted",
        color: "red",
        html_class: "del",
        css_class: "strikethrough",
        hide: {
          hidden: true,
          class: "del",
        },
        chg_citation: "citation-url",
        features: {
          all: false,
          class: "features-1",
        },
      },
      {
        opt: "udl",
        opt_slider: "underlined-slider",
        title: "Underlined",
        color: "blue",
        html_class: "hi-underline",
        css_class: "underline",
        hide: {
          hidden: false,
          class: "hi-underline",
        },
        chg_citation: "citation-url",
        features: {
          all: false,
          class: "features-1",
        },
      },
      {
        opt: "wsp",
        opt_slider: "whitespace-slider",
        title: "Original white spaces",
        color: "green",
        html_class: "space",
        css_class: "whitespace",
        hide: {
          hidden: true,
          class: "space",
        },
        chg_citation: 1,
        features: {
          all: false,
          class: "features-1",
        },
      },
      {
        opt: "ucl",
        opt_slider: "unclear-slider",
        title: "Unclear",
        color: "grey",
        html_class: "abbr",
        css_class: "unclear",
        hide: {
          hidden: false,
          class: "abbr",
        },
        chg_citation: "citation-url",
        features: {
          all: false,
          class: "features-1",
        },
      },
      {
        opt: "tf",
        opt_slider: "text-features-slider",
        title: "Original text features",
        color: "grey",
        html_class: "undefined",
        css_class: "undefined",
        hide: {
          hidden: false,
          class: "undefined",
        },
        chg_citation: "citation-url",
        features: {
          all: true,
          class: "features-1",
        },
      },
      {
        opt: "ef",
        opt_slider: "entities-features-slider",
        title: "All Entities",
        color: "grey",
        html_class: "undefined",
        css_class: "undefined",
        chg_citation: "citation-url",
        hide: {
          hidden: false,
          class: "undefined",
        },
        features: {
          all: true,
          class: "features-2",
        },
      },
      {
        opt: "prs",
        color: "pink",
        title: "Persons",
        html_class: "persons",
        css_class: "pers",
        hide: {
          hidden: true,
          class: "persons .entity",
        },
        chg_citation: "citation-url",
        features: {
          all: false,
          class: "features-2",
        },
      },
      {
        opt: "plc",
        color: "gold",
        title: "Places",
        html_class: "places",
        css_class: "plc",
        hide: {
          hidden: true,
          class: "places .entity",
        },
        chg_citation: "citation-url",
        features: {
          all: false,
          class: "features-2",
        },
      },
      {
        opt: "wrk",
        color: "turquoise",
        title: "Literature",
        html_class: "works",
        css_class: "wrk",
        chg_citation: "citation-url",
        hide: {
          hidden: true,
          class: "works .entity",
        },
        features: {
          all: false,
          class: "features-2",
        },
      },
      {
        opt: "org",
        color: "lila",
        title: "Institutions",
        html_class: "orgs",
        css_class: "org",
        hide: {
          hidden: true,
          class: "orgs .entity",
        },
        chg_citation: "citation-url",
        features: {
          all: false,
          class: "features-2",
        },
      },
      {
        opt: "eve",
        color: "lime",
        title: "Events",
        html_class: "event",
        css_class: "eve",
        hide: {
          hidden: true,
          class: "event .entity",
        },
        chg_citation: "citation-url",
        features: {
          all: false,
          class: "features-2",
        },
      },
    ],
    span_element: {
      css_class: "badge-item",
    },
    active_class: "activated",
    rendered_element: {
      label_class: "switch",
      slider_class: "i-slider round",
    },
  },
  ff: {
    name: "Change font family",
    variants: [
      {
        opt: "ff",
        title: "Font family",
        urlparam: "font",
        chg_citation: "citation-url",
        fonts: {
          default: "default",
          font1: "Times-New-Roman",
          font2: "Courier-New",
          font3: "Arial-serif",
        },
        paragraph: "p, a",
        p_class: "yes-index",
        css_class: "",
      },
    ],
    active_class: "active",
    html_class: "custom-select",
  },
  fs: {
    name: "Create full size mode",
    variants: [
      {
        opt: "ef",
        title: "Full screen on/off",
        urlparam: "fs",
        chg_citation: "citation-url",
        hide: "hide-reading",
        to_hide: "fade",
      },
    ],
    active_class: "active",
    render_class: "nav-link btn btn-round",
    render_svg:
      "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-fullscreen' viewBox='0 0 16 16'><path d='M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z'/></svg>",
  },
  fos: {
    name: "Change font size",
    variants: [
      {
        opt: "fs",
        title: "Font size",
        urlparam: "fos",
        chg_citation: "citation-url",
        sizes: {
          default: "default",
          font_size_14: "14",
          font_size_18: "18",
          font_size_22: "22",
          font_size_26: "26",
        },
        paragraph: "p, a",
        p_class: "yes-index",
        css_class: "font-size-",
      },
    ],
    active_class: "active",
    html_class: "custom-select",
  },
  is: {
    name: "enable/disable image viewer",
    variants: [
      {
        opt: "es",
        title: "Facsimile on/off",
        urlparam: "img",
        chg_citation: "citation-url",
        fade: "fade",
        column_small: {
          class: "col-md-3",
          percent: "25",
        },
        column_full: {
          class: "col-md-12",
          percent: "100",
        },
        hide: {
          hidden: true,
          class_to_hide: "osd-viewer",
          class_to_show: "text-re",
          class_parent: "pagination-tab",
          resize: "resize-hide",
        },
        image_size: "1000px",
      },
    ],
    active_class: "active",
    rendered_element: {
      a_class: "nav-link btn btn-round",
      svg: "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-image' viewBox='0 0 16 16'><path d='M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z'/><path d='M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z'/></svg>",
    },
  },
  il: {
    name: "load images in OSD viewer",
    opt: "image-loader",
    title: "Faksimiles",
    urlparam: "tab",
    chg_citation: "citation-url",
    pag_link: ".pagination .nav-tabs .nav-item .nav-link",
    pag_tab: ".pagination-tab.tab-pane",
    img_size: "1000px",
    url: "https://iiif.acdh.oeaw.ac.at/iiif/images/amp/",
    url_param: ".jp2/full/full/0/default.jpg",
    osd_target: "container",
    img_source: "container2",
    img_types: ["telegram", "note", "envelope", "sheet", "letter", 
              "card", "nan", "photo", "photograph", "invitation_card"],
    active_class: "active",
    inactive_class: "fade",
    bootstrap_class: "show",
  },
  ep: {
    name: "Tab Pagination",
    opt: "edition-pagination",
    title: "Tab Pagination",
    urlparam: "tab",
    chg_citation: "citation-url",
    pag_link: ".pagination-link",
    pag_tab: ".pagination-tab.tab-pane",
    img_size: "1000px",
    active_class: "active",
    inactive_class: "fade",
    bootstrap_class: "show",
    url: "https://iiif.acdh.oeaw.ac.at/iiif/images/amp/",
    url_param: ".jp2/full/full/0/default.jpg",
    osd_target: "container",
    img_source: "container2",
  },
  wr: true,
  up: true,
});
