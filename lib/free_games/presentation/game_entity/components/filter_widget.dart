import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FilterWidget extends StatefulWidget {
  FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String sort = '';
  String platform = '';
  String categories = '';
  List<Object?>? categoryValues;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Align(
                      child: Text(
                        'Filter',
                        style: TextStyle(fontSize: 18),
                      ),
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 8),
                    Text('Sort by'),
                    FormBuilderChoiceChip(
                      name: 'sort-by',
                      options: [
                        FormBuilderFieldOption(
                          value: 'release-date',
                          child: Text('Release Date'),
                        ),
                        FormBuilderFieldOption(
                          value: 'popularity',
                          child: Text('Popularity'),
                        ),
                        FormBuilderFieldOption(
                          value: 'alphabetical ',
                          child: Text('Alphabetical'),
                        ),
                        FormBuilderFieldOption(
                          value: 'relevance ',
                          child: Text('Relevance'),
                        ),
                      ],
                      spacing: 8,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            sort = value.toString();
                          });
                        } else {
                          setState(() {
                            sort = '';
                          });
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    Text('Platform'),
                    FormBuilderChoiceChip(
                      name: 'platform',
                      options: [
                        FormBuilderFieldOption(
                          value: 'pc',
                          child: Text('PC'),
                        ),
                        FormBuilderFieldOption(
                          value: 'browser',
                          child: Text('Browser'),
                        ),
                        FormBuilderFieldOption(
                          value: 'all ',
                          child: Text('Any'),
                        ),
                      ],
                      spacing: 8,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            platform = value.toString();
                          });
                        } else {
                          setState(() {
                            platform = '';
                          });
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    Text('Category'),
                    FormBuilderFilterChip(
                      options: [
                        'mmorpg',
                        'shooter',
                        'strategy',
                        'moba',
                        'racing',
                        'sports',
                        'social',
                        'sandbox',
                        'open-world',
                        'survival',
                        'pvp',
                        'pve',
                        'pixel',
                        'voxel',
                        'zombie',
                        'turn-based',
                        'first-person',
                        'third-Person',
                        'top-down',
                        'tank',
                        'space',
                        'sailing',
                        'side-scroller',
                        'superhero',
                        'permadeath',
                        'card',
                        'battle-royale',
                        'mmo',
                        'mmofps',
                        'mmotps',
                        '3d',
                        '2d',
                        'anime',
                        'fantasy',
                        'sci-fi',
                        'fighting',
                        'action-rpg',
                        'action',
                        'military',
                        'martial-arts',
                        'flight',
                        'low-spec',
                        'tower-defense',
                        'horror',
                        'mmorts',
                      ]
                          .map((lang) => FormBuilderFieldOption(value: lang))
                          .toList(growable: false),
                      runSpacing: -8,
                      spacing: 8,
                      checkmarkColor: Theme.of(context).accentColor,
                      onSaved: (newValue) {
                        print(newValue);
                      },
                      onChanged: (value) {
                        setState(() {
                          categoryValues = value!.toList();
                        });
                      },
                      name: 'category_form',
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.solidTimesCircle,
                          size: 40,
                          color: Colors.red,
                        ),
                        SizedBox(width: 32),
                        InkWell(
                          onTap: () {
                            categoryValues!.isNotEmpty
                                ? categoryValues!
                                    .forEach((platform) => setState(() {
                                          categories = categories +
                                              platform.toString() +
                                              '.';
                                        }))
                                : print('Empty');
                            print(sort);
                            print(platform);
                            print(categories);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.solidCheckCircle,
                            size: 40,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
