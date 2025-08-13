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
import 'package:widgetbook_workspace/accordion_usecases.dart'
    as _widgetbook_workspace_accordion_usecases;
import 'package:widgetbook_workspace/auth_screen_usecases.dart'
    as _widgetbook_workspace_auth_screen_usecases;
import 'package:widgetbook_workspace/button_table_view.dart'
    as _widgetbook_workspace_button_table_view;
import 'package:widgetbook_workspace/button_usecases.dart'
    as _widgetbook_workspace_button_usecases;
import 'package:widgetbook_workspace/check_chip_usecases.dart'
    as _widgetbook_workspace_check_chip_usecases;
import 'package:widgetbook_workspace/choice_chip_usecases.dart'
    as _widgetbook_workspace_choice_chip_usecases;
import 'package:widgetbook_workspace/design_reference.dart'
    as _widgetbook_workspace_design_reference;
import 'package:widgetbook_workspace/design_system_overview.dart'
    as _widgetbook_workspace_design_system_overview;
import 'package:widgetbook_workspace/design_tokens_catalog.dart'
    as _widgetbook_workspace_design_tokens_catalog;
import 'package:widgetbook_workspace/dropdown_usecases.dart'
    as _widgetbook_workspace_dropdown_usecases;
import 'package:widgetbook_workspace/goal_picker_usecase.dart'
    as _widgetbook_workspace_goal_picker_usecase;
import 'package:widgetbook_workspace/input_field_usecases.dart'
    as _widgetbook_workspace_input_field_usecases;
import 'package:widgetbook_workspace/matrix_usecases.dart'
    as _widgetbook_workspace_matrix_usecases;
import 'package:widgetbook_workspace/primary_button_usecases.dart'
    as _widgetbook_workspace_primary_button_usecases;
import 'package:widgetbook_workspace/progress_bar_usecase.dart'
    as _widgetbook_workspace_progress_bar_usecase;
import 'package:widgetbook_workspace/sign_up_usecases.dart'
    as _widgetbook_workspace_sign_up_usecases;
import 'package:widgetbook_workspace/start_screen_usecases.dart'
    as _widgetbook_workspace_start_screen_usecases;
import 'package:widgetbook_workspace/task_composer_usecases.dart'
    as _widgetbook_workspace_task_composer_usecases;
import 'package:widgetbook_workspace/task_demo_screen_usecases.dart'
    as _widgetbook_workspace_task_demo_screen_usecases;
import 'package:widgetbook_workspace/task_dropdown_usecases.dart'
    as _widgetbook_workspace_task_dropdown_usecases;
import 'package:widgetbook_workspace/todo_usecases.dart'
    as _widgetbook_workspace_todo_usecases;

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
                builder: _widgetbook_workspace_button_usecases.allVariantsGrid,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Neutral - Default',
                builder: _widgetbook_workspace_button_usecases.neutralDefault,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Neutral - Disabled',
                builder: _widgetbook_workspace_button_usecases.neutralDisabled,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Subtle - Default',
                builder: _widgetbook_workspace_button_usecases.subtleDefault,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Subtle - Disabled',
                builder: _widgetbook_workspace_button_usecases.subtleDisabled,
              ),
            ],
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsCheckChip',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Check Chip – Variants',
              builder:
                  _widgetbook_workspace_check_chip_usecases.checkChipVariants,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsCheckbox',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Checkbox',
              builder: _widgetbook_workspace_todo_usecases.checkboxUsecase,
            ),
          ),
          _widgetbook.WidgetbookComponent(
            name: 'DsChoiceChip',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Selected',
                builder:
                    _widgetbook_workspace_choice_chip_usecases.selectedChip,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Table',
                builder: _widgetbook_workspace_choice_chip_usecases.tableChip,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Unselected',
                builder:
                    _widgetbook_workspace_choice_chip_usecases.unselectedChip,
              ),
            ],
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsDropdown',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder: _widgetbook_workspace_dropdown_usecases.dropdownDefault,
            ),
          ),
          _widgetbook.WidgetbookComponent(
            name: 'DsPrimaryButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Primary – Default',
                builder: _widgetbook_workspace_primary_button_usecases
                    .primaryDefault,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Primary – Disabled',
                builder: _widgetbook_workspace_primary_button_usecases
                    .primaryDisabled,
              ),
            ],
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsProgressBar',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder:
                  _widgetbook_workspace_progress_bar_usecase.progressDefault,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsTag',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Tag – colors',
              builder: _widgetbook_workspace_todo_usecases.tagUsecase,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'DsTaskItem',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Task item',
              builder: _widgetbook_workspace_todo_usecases.taskItemUsecase,
            ),
          ),
          _widgetbook.WidgetbookComponent(
            name: 'DsTextField',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _widgetbook_workspace_input_field_usecases.inputDefault,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Disabled',
                builder:
                    _widgetbook_workspace_input_field_usecases.inputDisabled,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Error',
                builder: _widgetbook_workspace_input_field_usecases.inputError,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Placeholder',
                builder:
                    _widgetbook_workspace_input_field_usecases.inputPlaceholder,
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
            builder: _widgetbook_workspace_accordion_usecases.accordionEmpty,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Accordion - Quadrants',
            builder:
                _widgetbook_workspace_accordion_usecases.accordionQuadrants,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Button Design System Table',
            builder:
                _widgetbook_workspace_button_table_view.buttonDesignSystemTable,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Design System – Overview',
            builder: _widgetbook_workspace_design_system_overview
                .designSystemOverview,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Design Tokens Catalog',
            builder:
                _widgetbook_workspace_design_tokens_catalog.designTokensCatalog,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Matrix - Basic',
            builder: _widgetbook_workspace_matrix_usecases.matrixBasic,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Matrix - With Composer',
            builder: _widgetbook_workspace_matrix_usecases.matrixWithComposer,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Sign Up - Error',
            builder: _widgetbook_workspace_sign_up_usecases.signUpError,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Sign Up - Idle',
            builder: _widgetbook_workspace_sign_up_usecases.signUpIdle,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Sign Up - Typing',
            builder: _widgetbook_workspace_sign_up_usecases.signUpTyping,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Composer - Default',
            builder: _widgetbook_workspace_task_composer_usecases
                .taskComposerDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Composer - Long Text',
            builder: _widgetbook_workspace_task_composer_usecases
                .taskComposerLongText,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Composer - With Values',
            builder: _widgetbook_workspace_task_composer_usecases
                .taskComposerWithValues,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Input Dropdown - Default State',
            builder: _widgetbook_workspace_task_dropdown_usecases
                .taskInputDropdownDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Input Dropdown - Empty State',
            builder: _widgetbook_workspace_task_dropdown_usecases
                .taskInputDropdownEmpty,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Input Dropdown - Integration Example',
            builder: _widgetbook_workspace_task_dropdown_usecases
                .taskInputDropdownIntegration,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Task Input Dropdown - With Pre-selected Values',
            builder: _widgetbook_workspace_task_dropdown_usecases
                .taskInputDropdownWithValues,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'screens',
    children: [
      _widgetbook.WidgetbookLeafComponent(
        name: 'AuthScreen',
        useCase: _widgetbook.WidgetbookUseCase(
          name: 'Auth Screen',
          builder: _widgetbook_workspace_auth_screen_usecases.authScreen,
        ),
      ),
      _widgetbook.WidgetbookLeafComponent(
        name: 'GoalPickerScreen',
        useCase: _widgetbook.WidgetbookUseCase(
          name: 'Goal Picker Screen',
          builder: _widgetbook_workspace_goal_picker_usecase.goalPicker,
        ),
      ),
      _widgetbook.WidgetbookLeafComponent(
        name: 'StartScreen',
        useCase: _widgetbook.WidgetbookUseCase(
          name: 'Start Screen',
          builder: _widgetbook_workspace_start_screen_usecases.startScreen,
        ),
      ),
      _widgetbook.WidgetbookLeafComponent(
        name: 'TaskDemoScreen',
        useCase: _widgetbook.WidgetbookUseCase(
          name: 'Task Demo Screen',
          builder:
              _widgetbook_workspace_task_demo_screen_usecases.taskDemoScreen,
        ),
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
          builder: _widgetbook_workspace_design_reference.inputDesignReference,
        ),
      ),
    ],
  ),
];
