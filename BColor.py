class BColors(object):
    """
    打印的字串顏色
    """
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


class SystemStatus(object):
    """
    打印狀態訊息上色
    """
    WARNING = BColors.WARNING + '[WRONG] ' + BColors.ENDC
    INFO = BColors.HEADER + '[INFO] ' + BColors.ENDC
    ERROR = BColors.FAIL + '[ERROR] ' + BColors.ENDC
