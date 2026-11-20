# Review of Isoperimetry (pull request #2597 at ec70c47)

**Verdict:** accepted

**Summary.** Accepted: the two added lines put an explicit anchor before the Layer 6 heading, and it is exactly the fragment that RiemannianGeometry's two links to the former I6 heading use, so those links land on Layer 6 again; no statement changed. There are no findings and no format notes. One small correction: the pull request's description still says that this link is broken and is RiemannianGeometry's to update, which this head makes untrue. For the humans, the licence questions of the earlier reviews remain: the public formalizations cited as prior work, and the Maggi extract.

## C01 — The description still says the link to the former I6 heading is broken, and this head keeps it working

A reader of the description is told that RiemannianGeometry must change its link, which is no longer so. The description says: "Anchored links to the former headings do not: RiemannianGeometry links to `#i6--full-planar-jordan-theorem-and-compatibility`, which opens this README at its top; … the link is RiemannianGeometry's to update." At this head `TauCetiRoadmap/Isoperimetry/README.md` line 774 carries `<a id="i6--full-planar-jordan-theorem-and-compatibility"></a>` directly above the Layer 6 heading, and that is the fragment of both links in `TauCetiRoadmap/RiemannianGeometry/README.md` on main (lines 974 and 3008), so they open Layer 6.

A sentence that would be right: "The one anchored link to a former heading, RiemannianGeometry's to `#i6--full-planar-jordan-theorem-and-compatibility`, still resolves: the README keeps that anchor above the Layer 6 heading, whose own anchor is `#layer-6-full-planar-jordan-theorem-and-compatibility`."

<details><summary>What was checked</summary>

**Scope of this round.** An incremental re-review of the 2 lines changed since `313454a` (an anchor element and a blank line before the Layer 6 heading of `TauCetiRoadmap/Isoperimetry/README.md`), what cites the anchor, and the pull request's description against this head. `TauCetiRoadmap/Isoperimetry/Suggested.lean` is unchanged.

**The changed passage.** The former heading on main is "I6 — Full planar Jordan theorem and compatibility", whose generated fragment is `i6--full-planar-jordan-theorem-and-compatibility` (the dash dropped, its two spaces each a hyphen); the added `id` is that string, character for character. A search of main and of the open roadmap heads for links into this README with a fragment found only RiemannianGeometry's two (README lines 974 and 3008 on main, the same text at its open revision), both with this fragment; no link uses a fragment of the former I1–I5 headings, so no other anchor is needed. The scope section's sentence on the former numbering (I1–I6 are Layers 1–6) is unchanged and still right. The file has one `id` attribute, so the anchor is unambiguous.

**Automatic checks.** All passed on this head. The check that every supplier comes earlier in the merge order than its consumer read 182 roadmaps and 2068 supplier edges and reported no problem: no upward citation and no cycle. The pull request changes nothing outside the roadmap folder.

**Lean.** `Suggested.lean` elaborates at the pins with nine `sorry` warnings and nothing else.

**Pull request text.** Read against this head. One passage is out of date (C01). The rest stands as in the previous review: the roadmap on main is revised and rewritten, `periodic_wirtinger` removed, five declarations added and one restated, the former numbering, the suppliers, the six Tau Ceti imports.

**Not verifiable.** As in the previous review: the statements inside Maggi's book behind §14.1, §14.2 and §18.3; the displayed formulas of Tao's Theorem 2; Barchiesi–Cagnetti–Fusco's Theorem 2.4; the published equation numbering of Fusco–Maggi–Pratelli. None is touched by this change.

</details>

## Previous findings

The previous report raised no finding (no R-numbered point), no small correction and no format note; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.3 (`jordan_isoperimetric`), the statement RiemannianGeometry reaches through the kept anchor | circle of radius `r`; unit square; rectangle `1×3` | `4π·πr² = 4π²r² = (2πr)²`; `4π ≈ 12.57 < 16`; `12π ≈ 37.7 < 64` | inequality holds, equality on the circle only; the anchor lands on the layer that states it | none |
| The added anchor against the former heading's fragment | heading "I6 — Full planar Jordan theorem and compatibility"; RiemannianGeometry lines 974, 3008 | computed fragment `i6--full-planar-jordan-theorem-and-compatibility`; added `id` identical; both links carry it | links resolve to Layer 6 | none |

The rows for the untouched statements stand as in the previous review, of `313454a`.

- **Source locators checked against the text (0):** the diff adds no locator and changes no passage a locator supports; the seeded sample does not fall in the changed lines.
- **Library declarations opened at the pin (0 new):** the diff names none; `jordan_isoperimetric` was reread in `Suggested.lean` (lines 113–118) against §6.3.
- **Cross-roadmap citations resolved (2):** RiemannianGeometry's two links into this README, on main and at its open head; the diff adds no citation of its own.
- **Automatic checks:** all passed; the supplier-order check read 182 roadmaps and 2068 supplier edges and reported no problem; nothing changed outside the folder.
- **Elaboration:** nine `sorry` warnings only. No statement changed, so the one-tactic probes and the `#check` comparison of the earlier reviews stand.

Overlap check: the overlap facts were read again (no other open pull request changes this roadmap; no cited id is dropped; no id this pull request drops is cited elsewhere, the former Layer 6 anchor now being kept). As in the previous review: read GeometricMeasureTheory (main and its open revision), GaussianIsoperimetryAndClusters (main), Surfaces (main) and GeometricCurrents (main); De Giorgi's structure theorem, the frontier bound and the perimeter of a rectifiable Jordan domain are GeometricMeasureTheory's (G5, G6); the slicing theorem (§4.1) and the signed-area identification (§3.1) are owned here; Surfaces and GeometricCurrents share nothing. The change adds no object.

Source independence: changed passages only: the 2 added lines are an anchor element and a blank line, with no prose, so 0 passages were compared with 0 sources, none shared; largest share Maggi2012, 6 of 22 locators, as before; the arrangement was not compared again, since the diff adds, removes or reorders no layer. Maggi2012's text beyond its front matter could not be read.

Research link: Layers 2 and 4 follow De Giorgi's 1958 rigidity proof through Steiner's inequality and the equality analysis of Chlebík–Cianchi–Fusco (2005), as Cagnetti–Colombo–De Philippis–Maggi (2014, §1.2) recall it; Layer 5 is the Pólya–Szegő theory of Bianchi–Gardner–Gronchi–Kiderlen (2022) and the inequality of Fusco–Maggi–Pratelli (2007). Rests on the README and CCDM lines 128–136.

## Not verifiable

- Maggi2012, §14.1, §14.2 and §18.3: the open extract holds only the front matter and the contents; the statements were not read. Not touched by this change.
- Tao2011BrunnMinkowskiNilpotent, Theorem 2: the extraction drops the displayed formulas. Not touched by this change.
- Barchiesi–Cagnetti–Fusco 2013, Theorem 2.4, the source of CCDM's Theorem C: not opened.
- FuscoMaggiPratelli2007SobolevBV: the author preprint was read; its equation numbering was not compared with J. Funct. Anal. 244.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's references cite three public formalizations as prior work: Humanfia's archive, `hojonathanho/isoperimetric` and `kim-em/isoperimetric`. They were not opened in this round; earlier reviews found the same inequality under other names and binders in the first and third.
- **Licence.** Maggi2012 was read from the cvgmt file `Maggi_extract.pdf`, which states no licence; the book is behind the publisher's paywall.
- **Not tested.** Maggi2012 has the largest share of locators (6 of 22). Its wording beyond the front matter could not be compared with the README; only the arrangement was compared, against its contents.
