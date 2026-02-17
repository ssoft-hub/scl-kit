# Sphinx configuration for ScL Toolkit documentation

project = "ScL Toolkit"
copyright = "ScL Authors"
author = "ScL Authors"
version = "0.1"
release = "0.1.0"

# Extensions
extensions = [
    "breathe",
    "sphinx.ext.autosectionlabel",
]

# Breathe configuration (bridge to Doxygen XML)
import os

# Resolve path relative to this conf.py → ../../docs/_doxygen/xml
_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))

breathe_projects = {
    "scl": os.path.join(_root, "docs/_doxygen/xml"),
}
breathe_default_project = "scl"
breathe_default_members = ("members", "undoc-members")

# Theme
html_theme = "sphinx_rtd_theme"
html_theme_options = {
    "navigation_depth": 3,
    "collapse_navigation": False,
}

# Source settings
master_doc = "index"
exclude_patterns = ["_build", "_doxygen"]
