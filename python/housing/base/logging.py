import logging

class Logger:
    def __init__(self,id):
        self.id = id
        self.name,self.env = self.id.split('-')
        self.fmt = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
        self.formatter = logging.Formatter(self.fmt)
        self.logger = logging.getLogger(self.id)
        self.logger.handlers.clear()

        if self.env=='dev':
            from sys import stdout
            self.level = logging.DEBUG
            self.feed = stdout
        elif self.env=='qa':
            from io import StringIO
            self.level = logging.INFO
            self.feed = StringIO()
        elif self.env=='prod':
            from io import StringIO
            self.level = logging.WARNING
            self.feed = StringIO()
        else:
            raise Exception('Unknown environment - dev, qa, prod.')

        self.handler = logging.StreamHandler(self.feed)
        self.handler.setFormatter(self.formatter)
        self.handler.setLevel(self.level)
        self.logger.addHandler(self.handler)
