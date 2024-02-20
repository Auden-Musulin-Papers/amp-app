# bin/bash

denormalize-indices -f "./data/editions/*/*.xml" -i "./data/indices/*.xml" -m ".//tei:rs[@ref]/@ref|//tei:quote[@source]/@source" -x ".//tei:titleStmt/tei:title[@level='a']/text()"