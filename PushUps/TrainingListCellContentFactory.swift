//
//  TrainingListCellContentFactory.swift
//  PushUps
//
//  Created by Andrew Walker on 03/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

internal final class TrainingListCellContentFactory {
    
    // MARK: - Lifecycle
    
    /**
     Restricts ability to create instance. Intended as singleton.
     */
    private init() {}

    // MARK: - Internal Functions
    
    internal static func createLevelSections(from levels: [Level], selectedStage: Stage?) -> [SectionContent] {
        var sections = [SectionContent]()
        
        for (index, level) in levels.enumerated() {
            let section = TrainingListCellContentFactory.createLevelSection(from: level, index: index, selectedStage: selectedStage)
            sections.append(section)
        }
        
        return sections
    }
    
    private static func createLevelSection(from level: Level, index: Int, selectedStage: Stage?) -> SectionContent {
        let section = LevelSectionContent(level: level)
        let levelNumber = index + 1
        let headerText = "Level \(levelNumber)"
        let headerView = TitleHeaderFooterView(text: headerText)
        section.add(headerView: headerView)
        
        for (index, stage) in level.stages.enumerated() {
            let isSelected = stage.id == selectedStage?.id
            let content = TrainingListCellContentFactory.createStageCellContent(from: stage, index: index, isSelected: isSelected)
            section.add(content: content)
        }
        
        return section
    }
    
    private static func createStageCellContent(from stage: Stage, index: Int, isSelected: Bool) -> CellContent {
        let stageNumber = index + 1
        let content = StageCellContent(stage: stage, number: stageNumber)
        content.isSelected = isSelected
        return content
    }
    
}
