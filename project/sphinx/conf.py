import os

project = os.environ.get('SCL_PROJECT_NAME', 'SCL Toolkit')
author = 'ScL Contributors'
version = os.environ.get('SCL_VERSION', '')
release = version
copyright = '2025, ScL Contributors'

extensions = ['myst_parser']

_xml_dir = os.environ.get('SCL_DOXYGEN_XML', '')
if _xml_dir:
    extensions += ['breathe']
    breathe_projects = {'api': _xml_dir}
    breathe_projects_for_auto = {'api': _xml_dir}
    breathe_default_project = 'api'
    breathe_domain_by_extension = {'h': 'cpp', 'hpp': 'cpp'}

highlight_language = 'cpp'

html_theme = 'furo'
html_static_path = ['_static']
html_js_files = ['scl_config.js', 'scl_nav.js']
html_css_files = ['scl_nav.css']

html_theme_options = {
    'navigation_with_keys': True,
}

source_suffix = {'.rst': 'restructuredtext', '.md': 'markdown'}
master_doc = 'index'

myst_enable_extensions = ['colon_fence', 'deflist']
myst_all_links_external = True

if not _xml_dir:
    exclude_patterns = ['index_api.rst', '_api']
    suppress_warnings = ['myst.xref_missing']
else:
    # Doxygen 1.15 uses 'head' instead of 'title' in docsect2 elements.
    # Patch breathe until it is updated for the new XML schema.
    try:
        from breathe.renderer import sphinxrenderer as _sr
        from docutils import nodes as _nodes
        def _patched_visit_docsectN(self, node):
            title_text = getattr(node, 'title', None) or getattr(node, 'head', '') or ''
            section = _nodes.section()
            section["ids"].append(self.get_refid(node.id))
            section += _nodes.title(title_text, title_text)
            section += self.create_doxygen_target(node)
            section += self.render_iterable(node.content_)
            return [section]
        _sr.SphinxRenderer.visit_docsectN = _patched_visit_docsectN
        for _k in ('docsect1', 'docsect2', 'docsect3'):
            _sr.SphinxRenderer.methods[_k] = _patched_visit_docsectN
    except Exception:
        pass


def setup(app):
    if _xml_dir:
        app.connect('builder-inited', _generate_api_pages)


def _generate_api_pages(app):
    import xml.etree.ElementTree as ET
    import shutil

    xml_dir = os.environ.get('SCL_DOXYGEN_XML', '')
    index_xml = os.path.join(xml_dir, 'index.xml')
    if not os.path.exists(index_xml):
        return

    api_dir = os.path.join(app.srcdir, '_api')
    if os.path.exists(api_dir):
        shutil.rmtree(api_dir)
    os.makedirs(api_dir)

    root = ET.parse(index_xml).getroot()

    compounds = {}
    for c in root.findall('compound'):
        compounds[c.get('refid')] = (c.get('kind'), c.findtext('name') or '')

    group_info = {}
    for refid, (kind, name) in compounds.items():
        if kind != 'group':
            continue
        gxml = os.path.join(xml_dir, refid + '.xml')
        inner_groups, inner_classes = [], []
        title = name
        if os.path.exists(gxml):
            try:
                cd = ET.parse(gxml).getroot().find('.//compounddef')
                if cd is not None:
                    title = cd.findtext('title') or name
                    inner_groups = [ig.get('refid') for ig in cd.findall('innergroup')]
                    inner_classes = [
                        (ic.get('refid'), ic.text or '')
                        for ic in cd.findall('innerclass')
                        if not (ic.text or '').startswith('std::')
                    ]
            except Exception:
                pass
        group_info[refid] = {'name': name, 'title': title,
                             'inner_groups': inner_groups, 'inner_classes': inner_classes}

    all_child_groups = {r for info in group_info.values() for r in info['inner_groups']}
    top_groups = sorted(
        [r for r in group_info if r not in all_child_groups],
        key=lambda r: group_info[r]['title']
    )

    def safe(name):
        return (name.replace('::', '__').replace('<', '').replace('>', '')
                    .replace(' ', '_').replace(',', '_').replace('&', ''))

    def write_class_rst(refid, name):
        fname = safe(name)
        with open(os.path.join(api_dir, fname + '.rst'), 'w', encoding='utf-8') as f:
            f.write(f'{name}\n{"=" * len(name)}\n\n')
            f.write(f'.. doxygenclass:: {name}\n')
            f.write('   :project: api\n')
            f.write('   :members:\n')
            f.write('   :protected-members:\n')
            f.write('   :undoc-members:\n')
        return '_api/' + fname

    def write_group_rst(refid):
        info = group_info[refid]
        title, gname = info['title'], info['name']
        fname = safe(gname)
        sub_pages = [write_group_rst(r) for r in info['inner_groups'] if r in group_info]
        cls_pages = [write_class_rst(r, n) for r, n in info['inner_classes']]
        all_sub = sub_pages + cls_pages
        with open(os.path.join(api_dir, fname + '.rst'), 'w', encoding='utf-8') as f:
            f.write(f'{title}\n{"=" * len(title)}\n\n')
            f.write(f'.. doxygengroup:: {gname}\n')
            f.write('   :project: api\n\n')
            if all_sub:
                f.write('.. toctree::\n   :hidden:\n\n')
                for p in all_sub:
                    f.write(f'   {p}\n')
        return '_api/' + fname

    top_paths = [write_group_rst(r) for r in top_groups]

    with open(os.path.join(app.srcdir, 'index.rst'), 'w', encoding='utf-8') as f:
        f.write('API Reference\n=============\n\n')
        f.write('.. toctree::\n   :maxdepth: 2\n\n')
        for p in top_paths:
            f.write(f'   {p}\n')
