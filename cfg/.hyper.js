module.exports = {
    config: {
        updateChannel: 'stable',
        fontSize: 12,
        fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
        cursorShape: 'BEAM',
        cursorBlink: true,
        backgroundColor: '#263238',
        padding: '12px 14px',
        shell: 'zsh',
        shellArgs: ['--login'],
    },
    plugins: [
        'hyperterm-material-theme',
        'hyper-final-say',
        'hyper-hide-scroll',
        'hyper-hide-title',
    ],
};
