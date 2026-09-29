function brewup --wraps='brew update && brew upgrade && brew upgrade --cask --greedy' --description 'alias brewup=brew update && brew upgrade && brew upgrade --cask --greedy'
    brew update && brew upgrade && brew upgrade --cask --greedy $argv
end
