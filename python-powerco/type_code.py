# Create function to calculate churn rate for quartiles of the specified price column
def calc_proportions(df, column, Q1, Q2, Q3):
    
    # Calculate quartiles for the column for making cut
    my_groups = df[column].quantile([0.00, Q1, Q2, Q3, 1.00])

    # labels for the groups
    labels = ['Very Low','Low','Moderate','High']

    # bins for the cuts
    bins = [-1, my_groups[Q1], my_groups[Q2], my_groups[Q3], my_groups[1.00]]

    cut = 'cut_' + column

    # Assign the labels to a new column in df, our copy of the training features
    df[cut] = pd.cut(df[column], bins=bins, labels=labels)

    # Dataframe for churn values
    pr_churn = pd.DataFrame(df.churn_char.unique()).sort_values(by = 0).reset_index(drop = True)

    pr_churn = pr_churn.rename(columns = {0: "churn"})

    # How many from each price_cut group is in each churn category
    churn_mult = pd.DataFrame(df.groupby([cut, 'churn'], observed = False)['churn'].count())

    # Assign the grouped values to pr_churn dataframe
    pr_churn[labels[0]] = [churn_mult.xs(labels[0]).loc[0].values.max(), churn_mult.xs(labels[0]).loc[1].values.max()]
    pr_churn[labels[1]] = [churn_mult.xs(labels[1]).loc[0].values.max(), churn_mult.xs(labels[1]).loc[1].values.max()]
    pr_churn[labels[2]] = [churn_mult.xs(labels[2]).loc[0].values.max(), churn_mult.xs(labels[2]).loc[1].values.max()]
    pr_churn[labels[3]] = [churn_mult.xs(labels[3]).loc[0].values.max(), churn_mult.xs(labels[3]).loc[1].values.max()]
    
    # Total for each price_cut, so that percentages can be calculated
    total = pr_churn[labels[0]] + pr_churn[labels[1]] + pr_churn[labels[2]] + pr_churn[labels[3]]

    # Calculate percentages for each 
    ch_prop = pr_churn[pr_churn.columns[1:]].div(total, 0)*100

    # Add the churn column
    ch_prop['churn'] = pr_churn['churn']

    # Re-order the columns
    ch_prop = ch_prop[['churn', 'Very Low', 'Low', 'Moderate', 'High']]
    
    return ch_prop


# Create function that creates a new column that holds the change/shift values. Then use that column to calculate porportions for churn.
def calc_diff_proportions(df, col_after, col_before):

    # string variables for column names
    shift = 'shift_' + col_after
    col_after = 'cut_' + col_after
    col_before = 'cut_' + col_before
    
    # Create new column (shift) for holding the shift values
    df.loc[((df[col_after] > df[col_before])), shift] = 'higher' # type: ignore
    df.loc[((df[col_after] < df[col_before])), shift] = 'lower'
    df.loc[((df[col_after] == df[col_before])), shift] = 'same'

    # Multi-dimensional dataframe with counts grouped by shift and churn
    diff_mult = pd.DataFrame(df.groupby([shift, 'churn'], observed = False)['churn'].count())

    # Dataframe for churn values rearranged
    pr_churn = pd.DataFrame(df.churn_char.unique()).sort_values(by = 0).reset_index(drop = True)

    pr_churn = pr_churn.rename(columns = {0: "churn"})

    # Assign the grouped values to pr_churn dataframe
    pr_churn['higher'] = [diff_mult.xs('higher').loc[0].values.max(), diff_mult.xs('higher').loc[1].values.max()]
    pr_churn['lower'] = [diff_mult.xs('lower').loc[0].values.max(), diff_mult.xs('lower').loc[1].values.max()]
    pr_churn['same'] = [diff_mult.xs('same').loc[0].values.max(), diff_mult.xs('same').loc[1].values.max()]

    # Total for each price_cut, so that percentages can be calculated
    total = pr_churn['higher'] + pr_churn['lower'] + pr_churn['same']

    # Calculate percentages for each 
    ch_prop = pr_churn[pr_churn.columns[1:]].div(total, 0)*100

    # Add the churn column
    ch_prop['churn'] = pr_churn['churn']

    # Re-order the columns
    ch_prop = ch_prop[['churn', 'higher', 'lower', 'same']]
    
    return ch_prop

# Define a function for showing the shift in price category for clients from one period to another
def plot_diff_proportions(df, col_after, col_before, horiz, font):

    # Select the size of the graphs
    plt.rcParams['figure.figsize'] = 12, 5

    prop = calc_diff_proportions(df, col_after, col_before)
    
    # Plot the higher feature using a Horizontal Percentage Stacked Bar Chart
    prop.plot(
        x = 'churn',
        kind = 'barh',  # Horizontal
        stacked = True,
        title = 'Proportions for Category Change after ' + col_before + ' by churn',
        colormap = 'winter',
        alpha = 0.6   # Make colors a little lighter, so we can see the text better.
    )

    # Place the legend in the upper right
    plt.legend(loc="upper right", ncol = 2)
    
    # Label the x and y axes
    plt.xlabel("Proportion of Difference")
    plt.ylabel("Churn")
    
    # Loop to place percentage text on bars
    for n, x in enumerate([*prop.index.values]):
        for (proportion, x_loc) in zip(prop.iloc[x, 1:],
                                       prop.iloc[x, 1:].cumsum()):
            
            plt.text(x = x_loc + horiz,   # Horizontal location of percentage text
                    y = n,             # Vertical location of percentage text
                    s = f'{np.round(proportion, 1)}',   # The actual text to be shown
                    color = "black",
                    fontsize = font,
                    fontweight = "bold")
    
    plt.show()