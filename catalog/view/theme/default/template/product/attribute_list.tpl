<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>

        <div id="content" class="<?php echo $class; ?>"> <?php echo $content_top; ?>
            <h1><?php echo $heading_title; ?></h1>

            <?php if (attributes) { ?>
            <p><strong><?php echo $text_index; ?></strong>
                <?php foreach ($attributes as $attribute) { ?>
                &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/attribute#<?php echo $attribute['name']; ?>"><?php echo $attribute['name']; ?></a>
                <?php } ?>
            </p>

            <?php foreach ($attributes as $attribute) { ?>
            <h2 id="<?php echo $attribute['name']; ?>"><?php echo $attribute['name']; ?></h2>

            <?php if ($attribute['attributes']) { ?>
            <?php foreach (array_chunk($attribute['attributes'], 4) as $attributes_chunk) { ?>
            <div class="row">
                <?php foreach ($attributes_chunk as $attr) { ?>
                <div class="col-sm-3"><a href="<?php echo $attr['href']; ?>"><?php echo $attr['name']; ?></a></div>
                <?php } ?>
            </div>
            <?php } ?>
            <?php } ?>

            <?php } ?>

            <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons clearfix">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>
