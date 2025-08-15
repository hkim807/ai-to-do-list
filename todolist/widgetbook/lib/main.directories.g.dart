// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_workspace/catalog/button_table_view.dart'
    as _widgetbook_workspace_catalog_button_table_view;
import 'package:widgetbook_workspace/catalog/design_reference.dart'
    as _widgetbook_workspace_catalog_design_reference;
import 'package:widgetbook_workspace/catalog/design_system_overview.dart'
    as _widgetbook_workspace_catalog_design_system_overview;
import 'package:widgetbook_workspace/catalog/design_tokens_catalog.dart'
    as _widgetbook_workspace_catalog_design_tokens_catalog;
import 'package:widgetbook_workspace/design_system/accordion_usecases.dart'
    as _widgetbook_workspace_design_system_accordion_usecases;
import 'package:widgetbook_workspace/design_system/button_usecases.dart'
    as _widgetbook_workspace_design_system_button_usecases;
import 'package:widgetbook_workspace/design_system/check_chip_usecases.dart'
    as _widgetbook_workspace_design_system_check_chip_usecases;
import 'package:widgetbook_workspace/design_system/choice_chip_usecases.dart'
    as _widgetbook_workspace_design_system_choice_chip_usecases;
import 'package:widgetbook_workspace/design_system/dropdown_usecases.dart'
    as _widgetbook_workspace_design_system_dropdown_usecases;
import 'package:widgetbook_workspace/design_system/input_field_usecases.dart'
    as _widgetbook_workspace_design_system_input_field_usecases;
import 'package:widgetbook_workspace/design_system/matrix_usecases.dart'
    as _widgetbook_workspace_design_system_matrix_usecases;
import 'package:widgetbook_workspace/design_system/primary_button_usecases.dart'
    as _widgetbook_workspace_design_system_primary_button_usecases;
import 'package:widgetbook_workspace/design_system/progress_bar_usecase.dart'
    as _widgetbook_workspace_design_system_progress_bar_usecase;
import 'package:widgetbook_workspace/design_system/task_composer_usecases.dart'
    as _widgetbook_workspace_design_system_task_composer_usecases;
import 'package:widgetbook_workspace/design_system/task_demo_screen_usecases.dart'
    as _widgetbook_workspace_design_system_task_demo_screen_usecases;
import 'package:widgetbook_workspace/design_system/task_dropdown_usecases.dart'
    as _widgetbook_workspace_design_system_task_dropdown_usecases;
import 'package:widgetbook_workspace/design_system/todo_usecases.dart'
    as _widgetbook_workspace_design_system_todo_usecases;
import 'package:widgetbook_workspace/features/auth/auth_screen_usecases.dart'
    as _widgetbook_workspace_features_auth_auth_screen_usecases;
import 'package:widgetbook_workspace/features/auth/sign_up_usecases.dart'
    as _widgetbook_workspace_features_auth_sign_up_usecases;
import 'package:widgetbook_workspace/features/start/start_screen_usecases.dart'
    as _widgetbook_workspace_features_start_start_screen_usecases;
import 'package:widgetbook_workspace/features/survey/survey_done_usecases.dart'
    as _widgetbook_workspace_features_survey_survey_done_usecases;
import 'package:widgetbook_workspace/features/survey/survey_intro_usecases.dart'
    as _widgetbook_workspace_features_survey_survey_intro_usecases;
import 'package:widgetbook_workspace/features/survey/survey_question_usecases.dart'
    as _widgetbook_workspace_features_survey_survey_question_usecases;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'design_system',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'components',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'All Variants Grid',
                builder: _widgetbook_workspace_design_system_button_usecases
                    .allVariantsGrid,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Neutral - Default',
                builder: _widgetbook_workspace_design_system_button_usecases
                    .neutralDefault,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Neutral - Disabled',
                builder: _widgetbook_workspace_design_system_button_usecases
                    .neutralDisabled,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Subtle - Default',
                builder: _widgetbook_workspace_design_system_button_usecases
                    .subtleDefault,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Subtle - Disabled',
                builder: _widgetbook_workspace_design_system_button_usecases
                    .subtleDisabled,
              ),
            ],
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsCheckChip',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Check Chip – Variants',
              builder: _widgetbook_workspace_design_system_check_chip_usecases
                  .checkChipVariants,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsCheckbox',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Checkbox',
              builder: _widgetbook_workspace_design_system_todo_usecases
                  .checkboxUsecase,
            ),
          ),
          _widgetbook.WidgetbookComponent(
            name: 'DsChoiceChip',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Selected',
                builder:
                    _widgetbook_workspace_design_system_choice_chip_usecases
                        .selectedChip,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Table',
                builder:
                    _widgetbook_workspace_design_system_choice_chip_usecases
                        .tableChip,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Unselected',
                builder:
                    _widgetbook_workspace_design_system_choice_chip_usecases
                        .unselectedChip,
              ),
            ],
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsDropdown',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder: _widgetbook_workspace_design_system_dropdown_usecases
                  .dropdownDefault,
            ),
          ),
          _widgetbook.WidgetbookComponent(
            name: 'DsPrimaryButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Primary – Default',
                builder:
                    _widgetbook_workspace_design_system_primary_button_usecases
                        .primaryDefault,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Primary – Disabled',
                builder:
                    _widgetbook_workspace_design_system_primary_button_usecases
                        .primaryDisabled,
              ),
            ],
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsProgressBar',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder: _widgetbook_workspace_design_system_progress_bar_usecase
                  .progressDefault,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsTag',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Tag – colors',
              builder:
                  _widgetbook_workspace_design_system_todo_usecases.tagUsecase,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsTaskItem',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Task item',
              builder: _widgetbook_workspace_design_system_todo_usecases
                  .taskItemUsecase,
            ),
          ),
          _widgetbook.WidgetbookComponent(
            name: 'DsTextField',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _widgetbook_workspace_design_system_input_field_usecases
                        .inputDefault,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Disabled',
                builder:
                    _widgetbook_workspace_design_system_input_field_usecases
                        .inputDisabled,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Error',
                builder:
                    _widgetbook_workspace_design_system_input_field_usecases
                        .inputError,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Placeholder',
                builder:
                    _widgetbook_workspace_design_system_input_field_usecases
                        .inputPlaceholder,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'features',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'AuthScreen',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _widgetbook_workspace_features_auth_auth_screen_usecases
                .authScreenDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Start Screen',
            builder: _widgetbook_workspace_features_start_start_screen_usecases
                .startScreen,
          ),
        ],
      ),
      _widgetbook.WidgetbookLeafComponent(
        name: 'TaskDemoScreen',
        useCase: _widgetbook.WidgetbookUseCase(
          name: 'Task Demo Screen',
          builder: _widgetbook_workspace_design_system_task_demo_screen_usecases
              .taskDemoScreen,
        ),
      ),
      _widgetbook.WidgetbookFolder(
        name: 'auth',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'SignUpScreen',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder: _widgetbook_workspace_features_auth_sign_up_usecases
                    .signUpDefault,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Submitting State',
                builder: _widgetbook_workspace_features_auth_sign_up_usecases
                    .signUpSubmitting,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'With Validation Errors',
                builder: _widgetbook_workspace_features_auth_sign_up_usecases
                    .signUpWithErrors,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'survey',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'SurveyDoneScreen',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_workspace_features_survey_survey_done_usecases
                      .surveyDoneDefault,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'SurveyIntroScreen',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_workspace_features_survey_survey_intro_usecases
                      .surveyIntroDefault,
            ),
          ),
          _widgetbook.WidgetbookComponent(
            name: 'SurveyQuestionScreen',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Survey Question - Area',
                builder:
                    _widgetbook_workspace_features_survey_survey_question_usecases
                        .surveyQuestionArea,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Survey Question - Deadline',
                builder:
                    _widgetbook_workspace_features_survey_survey_question_usecases
                        .surveyQuestionDeadline,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Survey Question - Time',
                builder:
                    _widgetbook_workspace_features_survey_survey_question_usecases
                        .surveyQuestionTime,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'material',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'Scaffold',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Accordion - Empty State',
            builder: _widgetbook_workspace_design_system_accordion_usecases
                .accordionEmpty,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Accordion - Quadrants',
            builder: _widgetbook_workspace_design_system_accordion_usecases
                .accordionQuadrants,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Button Design System Table',
            builder: _widgetbook_workspace_catalog_button_table_view
                .buttonDesignSystemTable,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Design System – Overview',
            builder: _widgetbook_workspace_catalog_design_system_overview
                .designSystemOverview,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Design Tokens Catalog',
            builder: _widgetbook_workspace_catalog_design_tokens_catalog
                .designTokensCatalog,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Matrix - Basic',
            builder:
                _widgetbook_workspace_design_system_matrix_usecases.matrixBasic,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Matrix - With Composer',
            builder: _widgetbook_workspace_design_system_matrix_usecases
                .matrixWithComposer,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Composer - Default',
            builder: _widgetbook_workspace_design_system_task_composer_usecases
                .taskComposerDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Composer - Long Text',
            builder: _widgetbook_workspace_design_system_task_composer_usecases
                .taskComposerLongText,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Composer - With Values',
            builder: _widgetbook_workspace_design_system_task_composer_usecases
                .taskComposerWithValues,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Input Dropdown - Default State',
            builder: _widgetbook_workspace_design_system_task_dropdown_usecases
                .taskInputDropdownDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Input Dropdown - Empty State',
            builder: _widgetbook_workspace_design_system_task_dropdown_usecases
                .taskInputDropdownEmpty,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Input Dropdown - Integration Example',
            builder: _widgetbook_workspace_design_system_task_dropdown_usecases
                .taskInputDropdownIntegration,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Input Dropdown - With Pre-selected Values',
            builder: _widgetbook_workspace_design_system_task_dropdown_usecases
                .taskInputDropdownWithValues,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookLeafComponent(
        name: 'Image',
        useCase: _widgetbook.WidgetbookUseCase(
          name: 'Input Field – Figma reference',
          builder: _widgetbook_workspace_catalog_design_reference
              .inputDesignReference,
        ),
      ),
    ],
  ),
];
