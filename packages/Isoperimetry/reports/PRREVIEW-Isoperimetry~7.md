# Review of Isoperimetry (pull request #2597 at ec70c47)

**Verdict:** accepted

**Summary.** Accepted: the folder has not changed since the last review, and the pull request's description, read sentence by sentence against this head and against the roadmap on main, now agrees with both; the one out-of-date passage of the last review (the link to the former I6 heading) has been rewritten and is right. There are no findings, no small corrections and no format notes. For the humans, the licence questions of the earlier reviews remain: the public formalizations cited as prior work, and the Maggi extract.

<details><summary>What was checked</summary>

**Scope of this round.** An incremental re-review of 0 changed lines since `ec70c47`: `TauCetiRoadmap/Isoperimetry/README.md` and `TauCetiRoadmap/Isoperimetry/Suggested.lean` are as the last review read them. This round reads the pull request's description against the head.

**The description against the head.** Each claim was checked against the files:

- Form: the README opens with the overview and its three headline theorems, names GeometricMeasureTheory, ConformalMapping, DifferentialGeometry and PDE, has the guide to the build and eleven numbered conventions, six layers with the former numbers, and the scope section's sentence mapping I1–I6 to Layers 1–6 (README lines 916–918). Scope, supplier contracts and references come last.
- The anchor: README line 774 carries the id `i6--full-planar-jordan-theorem-and-compatibility` directly above the Layer 6 heading. The only links into this README with a fragment, on main and at the open heads, are RiemannianGeometry's two (lines 974 and 3008 on main; lines 2063 and 5045 of its open revision), both with that fragment.
- Counts: 50 Check bullets in 20 Checks blocks, one per numbered section (1 + 3 + 1 + 6 + 5 + 4), and 18 bullets under the six Examples headings. The Tau Ceti contracts name 159 distinct declarations ("about 150").
- The five Checks the description quotes are in the README: the diameter variant of the Steiner symmetral (§2.1, line 241), the punctured ball (§4.3, line 509), the empty Lipschitz domain (§4.6, line 583), the nested balls (§5.5), the Cantor-reparametrized circle (Layer 6 Examples, line 876).
- Locators: each locator the description lists stands in the section it names (Tao Theorem 2 in §1.1; Maggi §14.1 in §2.1, §14.2 in §4.3–§4.6, §18.3 in §4.1; Volčič 3.4 and 3.5 in §2.2; Tropp Lecture 8 in §2.3; Cufí–Verdera in §3.1; Cagnetti–Colombo–De Philippis–Maggi Theorems A and C in §4.1–§4.3; Burchard 4.7 in §5.1; Bianchi–Gardner–Gronchi–Kiderlen 5.8, 6.3, 6.5 in §5.2–§5.4; Fusco–Maggi–Pratelli (1.4) in §5.5; Wiedijk in §6.1–§6.4).
- Suppliers and consumers: the contracts are from Mathlib, Tau Ceti, GeometricMeasureTheory (G1, G2, G5, G6 and the Cantor–Lebesgue example), DifferentialGeometry 5.6, ConformalMapping §5.3 and PDE Layer 1 and §1.6; the downstream-consumers section names the seven roadmaps listed.
- Against main: the old README has the pull-request link for DifferentialGeometry's Green layer and "ConformalMapping … L5", marks `TauCeti.IsJordanCurve`, `TauCeti.filledHull`, `TauCeti.W1p` and the Mathlib pull request on one-dimensional Brunn–Minkowski, asks for "integrable real versions" of Prékopa–Leindler, and states rigidity in Layer 4 for sets of finite perimeter; its summary's equality clause has only `0 < |E| < ∞`. The old `Suggested.lean` imports four Mathlib submodules and two Tau Ceti modules and states `isoperimetric_frontier` on `EuclideanSpace ℝ (Fin n)`.
- "Statements whose content changed": the eight bullets agree with §4.3, §1.1, §2.1, §5.1, §3.1, §6.2, §4.4 and §4.6 at this head.
- `Suggested.lean`: `import Mathlib` and six Tau Ceti modules; `jordan_isoperimetric`, `jordan_isoperimetric_eq_iff` and `simple_closed_rectifiable_isoperimetric` have the statements they have on main, with new docstrings; `isoperimetric_frontier` is restated on `E` with `Module.finrank ℝ E ≥ 2` and the set named `s`; `periodic_wirtinger` is gone and `TauCeti.integral_norm_sub_average_sq_le` is at the pin (`TauCeti/Analysis/Fourier/Wirtinger.lean` line 253: finite-dimensional inner-product codomain, interval `[a, b]`, no mean-zero hypothesis); the five added declarations are present; the module docstring says every headline is statable.

**Automatic checks.** All passed on this head. The check that every supplier comes earlier in the merge order than its consumer read 182 roadmaps and 2068 supplier edges and reported no problem: no upward citation and no cycle. The pull request changes nothing outside the roadmap folder.

**Lean.** `Suggested.lean` elaborates at the pins with nine `sorry` warnings and nothing else.

**Not verifiable.** As in the previous reviews: the statements inside Maggi's book behind §14.1, §14.2 and §18.3; the displayed formulas of Tao's Theorem 2; Barchiesi–Cagnetti–Fusco's Theorem 2.4; the published equation numbering of Fusco–Maggi–Pratelli. None is touched by this round.

</details>

## Previous findings

The previous report raised no finding (no R-numbered point) and no format note. Its one small correction is accounted for here:

- C01 — repaired: the description now says the README "keeps that anchor directly above the Layer 6 heading … so both links still open Layer 6", which README line 774 and RiemannianGeometry's two links confirm.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.5 equality case (`eLpNorm_eq_inv_mul_totalVariationOn_iff`), cited by the description's nested-balls Check | `u = 2·1_{B(0,1)} + 1_{B(0,2)}`, `n = 2`; `u = 1_{B(0,r)}` | `‖u‖₂² = 9π + 3π = 12π`, `‖u‖₂ ≈ 6.14`; `|Du| = 2·2π + 4π = 8π`, right side `8π/(2√π) = 4√π ≈ 7.09`. Ball: `√π r = 2πr/(2√π)` | strict for nested balls, equality for one ball, as the description says | none |
| §6.2 (`simple_closed_rectifiable_isoperimetric`, `…_eq_iff`), cited by the description's Cantor example | `γ = exp(2πi φ)`, `φ = (t + κ)/2`; unit square | `φ′ = ½` a.e., `½∫(x y′ − y x′) = ½·2π·½ = π/2`; geometric area `π`, `L = 2π`, `4π·π = (2π)²`. Square: `4π < 16` | derivative integral `π/2` against area `π`; equality on the circle, strict on the square | none |
| §4.3 (`perimeter_pow_eq_iff_exists_ae_eq_ball`), cited by the description's punctured-ball Check | `ball c r \ {c}`, `n = 2` | `|s| = πr²`, `P = 2πr`; `P² = 4π²r² = 2²·π·πr²`; `s =ᵐ ball c r`, `s ≠ ball c r` | equality with an a.e. ball only, so the a.e. form is the right one | none |
| The kept anchor against the former heading's fragment | heading "I6 — Full planar Jordan theorem and compatibility"; RiemannianGeometry's two links | computed fragment `i6--full-planar-jordan-theorem-and-compatibility`; README line 774 identical; both links carry it | links resolve to Layer 6 | none |

The diff changes no statement; the rows for the untouched statements stand as in the previous review, of `ec70c47`.

- **Source locators checked against the text (0 new):** the folder did not change; the description's fourteen locators were matched to the README sections that carry them, not reread in the sources.
- **Library declarations opened at the pin (1):** `TauCeti.integral_norm_sub_average_sq_le`, `TauCeti/Analysis/Fourier/Wirtinger.lean` line 253, for the description's reason for removing `periodic_wirtinger`.
- **Cross-roadmap citations resolved (2):** RiemannianGeometry's two anchored links into this README, on main and at its open head.
- **Old text compared (2 files):** `README.md` and `Suggested.lean` of the roadmap on main, for the description's account of what the old text said.
- **Automatic checks:** all passed; the supplier-order check read 182 roadmaps and 2068 supplier edges and reported no problem; nothing changed outside the folder.
- **Elaboration:** nine `sorry` warnings only. No statement changed, so the one-tactic probes and the `#check` comparison of the earlier reviews stand.

Overlap check: the overlap facts were read again (no other open pull request changes this roadmap; no cited id is dropped; no id this pull request drops is cited elsewhere). As in the previous reviews: read GeometricMeasureTheory (main and its open revision), GaussianIsoperimetryAndClusters (main), Surfaces (main) and GeometricCurrents (main); De Giorgi's structure theorem, the frontier bound and the perimeter of a rectifiable Jordan domain are GeometricMeasureTheory's (G5, G6); the slicing theorem (§4.1) and the signed-area identification (§3.1) are owned here; Surfaces and GeometricCurrents share nothing. This round adds no object.

Source independence: changed passages only: the folder changed by 0 lines, so 0 passages were compared with 0 sources, none shared; largest share Maggi2012, 6 of 22 locators, as before; the arrangement was not compared again, since no layer was added, removed or reordered. Maggi2012's text beyond its front matter could not be read.

Research link: Layers 2 and 4 follow De Giorgi's 1958 rigidity proof through Steiner's inequality and the equality analysis of Chlebík–Cianchi–Fusco (2005), as Cagnetti–Colombo–De Philippis–Maggi (2014, §1.2) recall it; Layer 5 is the Pólya–Szegő theory of Bianchi–Gardner–Gronchi–Kiderlen (2022) and the inequality of Fusco–Maggi–Pratelli (2007). Rests on the README and CCDM lines 128–136.

## Not verifiable

- Maggi2012, §14.1, §14.2 and §18.3: the open extract holds only the front matter and the contents; the statements were not read. Not touched by this round.
- Tao2011BrunnMinkowskiNilpotent, Theorem 2: the extraction drops the displayed formulas. Not touched by this round.
- Barchiesi–Cagnetti–Fusco 2013, Theorem 2.4, the source of CCDM's Theorem C: not opened.
- FuscoMaggiPratelli2007SobolevBV: the author preprint was read; its equation numbering was not compared with J. Funct. Anal. 244.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's references cite three public formalizations as prior work: Humanfia's archive, `hojonathanho/isoperimetric` and `kim-em/isoperimetric`. They were not opened in this round; earlier reviews found the same inequality under other names and binders in the first and third.
- **Licence.** Maggi2012 was read from the cvgmt file `Maggi_extract.pdf`, which states no licence; the book is behind the publisher's paywall.
- **Not tested.** Maggi2012 has the largest share of locators (6 of 22). Its wording beyond the front matter could not be compared with the README; only the arrangement was compared, against its contents.
