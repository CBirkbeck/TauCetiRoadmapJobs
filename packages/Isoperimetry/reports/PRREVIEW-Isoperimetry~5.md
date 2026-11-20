# Review of Isoperimetry (pull request #2597 at 313454a)

**Verdict:** accepted

**Summary.** Accepted: the eight changed lines repair the one small correction of the previous review (the attribution of the planar equality case to Wiedijk's entry) and introduce no new problem; the entry and the pinned Tau Ceti converse were both reopened and say what the two sentences now attribute to them. The pull request's description agrees with this head. There are no findings, no small corrections and no format notes. For the humans, the licence questions of the earlier reviews remain: the public formalizations cited as prior work, and the Maggi extract.

<details><summary>What was checked</summary>

**Scope of this round.** An incremental re-review of the 8 lines changed since `aeab290` (two parenthetical attributions, in §6.2 and §6.3 of `TauCetiRoadmap/Isoperimetry/README.md`), and the pull request's description against this head. `TauCetiRoadmap/Isoperimetry/Suggested.lean` is unchanged.

**The changed passages.** §6.2 and §6.3 now attribute to Wiedijk's entry the inequality and the implication from equality to a circle, and the converse to Tau Ceti. The entry (Wiedijk100 lines 413–420) states exactly those two things for a rectifiable simple closed path; the converse is the pinned `ContinuousOn.eVariationOn_toReal_sq_eq_four_pi_mul_volume_real_filledHull_sdiff_of_image_eq_sphere` (`TauCeti/Analysis/Fourier/IsoperimetricTrace.lean:121`), which the opening of Layer 6 already recalls. In §6.3 the words "parametrized as in §6.2" are right: the entry is about paths, and §6.3's route passes to the set through §6.1.

**Automatic checks.** All passed on this head. The check that every supplier comes earlier in the merge order than its consumer read 200 roadmaps and 2195 supplier edges and reported `0 problem(s)`: no upward citation and no cycle. The pull request changes nothing outside the roadmap folder.

**Lean.** `Suggested.lean` elaborates at the pins with nine `sorry` warnings and nothing else.

**Pull request text.** Read against this head: it says the roadmap on main is revised and rewritten, gives the removed declaration (`periodic_wirtinger`), the five added and the one restated, the former numbering (I1–I6 are Layers 1–6) and the renamed Layer 6 anchor, the suppliers (GeometricMeasureTheory G1, G2, G5, G6; DifferentialGeometry 5.6; ConformalMapping §5.3; PDE Layer 1 and §1.6), the six Tau Ceti imports, and its counts (50 Checks in 20 sections, 18 worked examples; recounted). Its sentence that the converse of the planar equality case is at the pin agrees with the repaired attribution. No sentence is contradicted and no change is left unstated.

**Not verifiable.** As in the previous review: the statements inside Maggi's book behind §14.1, §14.2 and §18.3; the displayed formulas of Tao's Theorem 2; Barchiesi–Cagnetti–Fusco's Theorem 2.4; the published equation numbering of Fusco–Maggi–Pratelli. None is touched by this change.

</details>

## Previous findings

The previous report raised no finding (no R-numbered point). Its two non-blocking remarks:

- C01 — repaired: §6.2 and §6.3 now read "(Wiedijk's entry, … for the inequality and for equality forcing a circle; the converse is Tau Ceti's)", which is what the entry and the pin state.
- N01 — unchanged, not raised again: the bound `2 ≤ Module.finrank ℝ E` in two Lean statements is the roadmap's stated scope `n ≥ 2`, a choice.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.2 (`simple_closed_rectifiable_isoperimetric`, `_eq_iff`), attribution of each direction | circle once; unit square; circle twice; `r = 0` in the pinned converse | `4π·πr² = (2πr)²`; `4π < 16`; `4π²r² < 16π²r²`, not injective; point trace excluded by injectivity on `[a,b)`, `a<b` | entry gives ≤ and "equality ⇒ sphere"; converse at the pin (`0 ≤ r`, injective on `(a,b)`) | none |
| §6.3 (`jordan_isoperimetric`, `_eq_iff`), attribution of each direction | circle; rectangle `a×b`; passage from path to set | `4π·πr² = (2πr)²`; `4πab < 4(a+b)²`; `eVariationOn γ = H¹(C)` by the pinned length identity | entry applies through §6.1's parametrization, as the sentence now says | none |

The rows for the untouched statements stand as in the previous review, of `aeab290`.

- **Source locators checked against the text (1):** Wiedijk100 lines 409–420 (entry 43: hypotheses rectifiable, simple, closed, length `L`; conclusion the inequality and equality implying a sphere). The seeded sample falls in the changed passages at §6.2 and §6.3 only; both rest on this locator.
- **Library declarations opened at the pin (2):** `TauCeti/Analysis/Fourier/IsoperimetricTrace.lean:121`; `TauCeti/Topology/EMetricSpace/CurveLength.lean:173` (`ContinuousOn.eVariationOn_eq_euclideanHausdorffMeasure_image`, in §6.3's *Needs*).
- **Cross-roadmap citations resolved:** the diff adds none; the supplier-order check was run again.
- **Automatic checks:** all passed; supplier-order check `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; nothing changed outside the folder.
- **Elaboration:** nine `sorry` warnings only. No statement changed, so the one-tactic probes of the previous review stand.
- **Counts in the description:** 50 Checks in 20 sections and 18 worked examples, recounted; six `TauCeti.*` imports; nine declarations.

Overlap check: the overlap facts were read again (no other open pull request changes this roadmap; no cited id is dropped; the dropped Layer 6 anchor is mapped by the former-numbering sentence of the scope section and named in the description). As in the previous review: read GeometricMeasureTheory (main and its open revision), GaussianIsoperimetryAndClusters (main), Surfaces (main) and GeometricCurrents (main); De Giorgi's structure theorem, the frontier bound and the perimeter of a rectifiable Jordan domain are GeometricMeasureTheory's (G5, G6); the slicing theorem (§4.1) and the signed-area identification (§3.1) are owned here; Surfaces and GeometricCurrents share nothing. The change adds no object.

Source independence: changed passages only: 2 passages (the parentheticals of §6.2 and §6.3) compared with 1 source (Wiedijk100 lines 409–420), none shared; largest share Maggi2012, 6 of 22 locators, as before; the arrangement was not compared again, since the diff adds, removes or reorders no layer. Maggi2012's text beyond its front matter could not be read.

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
