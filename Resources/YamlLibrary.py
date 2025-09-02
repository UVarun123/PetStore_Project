import yaml

class YamlLibrary:
    def load_yaml(self, filepath):
        with open(filepath, 'r') as f:
            return yaml.safe_load(f)
