module.exports = {
    config: {
        backgroundColor: '#263238',
        cursorBlink: true,
        cursorShape: 'BEAM',
        fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
        fontSize: 12,
        padding: '12px 14px',
        scrollback: 10000,
        shell: 'zsh',
        shellArgs: ['--login'],
        updateChannel: 'canary',
    },
    plugins: [
        'hyper-final-say',
        'hyper-hide-scroll',
        'hyper-hide-title',
        'hyperterm-material-theme',
    ],
};
