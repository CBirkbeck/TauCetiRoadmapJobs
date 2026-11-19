# Review of Hyperfunctions (pull request #2592 at 6caa42c)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 63 lines changed since `73360bc` found nothing false or unsupported. All four small corrections of the previous review are repaired: the four new locators (Honda–Izawa–Suwa, Serre, Tillmann, Kashiwara–Schapira) each say, at the cited theorem and page, what the README takes from them; the two notes under Downstream consumers agree with ComplexComparisonPartII on main and with §2.0b; the file paths are right at the pin; and the description now agrees with the head. There are no small corrections, four format notes carried over unchanged, none blocking, and nothing is left for a human to decide.

## N01 — `exists_sum_dbar_eq` (`Suggested.lean`, lines 98–99) writes `∂/∂z̄ⱼ` out by hand; Tau Ceti's `TauCeti.conjWirtingerDeriv` (`TauCeti/Analysis/Complex/Wirtinger/Basic.lean`, line 80) evaluated at `Pi.single j 1` is the same summand, so the conclusion could use it with that module imported.

## N02 — The Honda–Izawa–Suwa page numbers are those of arXiv v4; the paper appeared in J. Math. Soc. Japan 75 (2023) with other pages. The References entry could name both versions and say which one the pages refer to.

## N03 — The module docstring of `Suggested.lean` (lines 32–34) names the Sato sheaf on a manifold and its flabbiness as not statable, but not purity on a real-analytic manifold, of which only the flat case is stated; it could be added to that bullet.

## N04 — In §3.5 the hypothesis `Γ ∩ (−Γ) = ∅` follows from the other two (if `y` and `−y` lay in a convex `Γ`, their midpoint `0` would), so it could be stated as a consequence.

## Previous findings

The previous report (of `73360bc`) had no finding; its four small corrections are accounted for here, and its four format notes are N01–N04 above, unchanged in the text.

- C01 — repaired: Downstream consumers (lines 1351–1356, 1380–1382) now says §3a.1 takes HF3a's compact-support functors from ComplexComparisonPartII §C6.1, the projection formula apart, and that nuclearity of smooth-section spaces is not stated. Both sentences agree with ComplexComparisonPartII on main (its lines 126–130, 285–291, 4796–4800) and with §2.0b.
- C02 — repaired: §1.3 cites Honda–Izawa–Suwa Proposition 2.4, p. 5, with Theorem 2.14(1), p. 8; §2.0f Serre, Théorème 3, p. 21; §4.2 Tillmann, Satz 3, p. 9, and Satz 5, p. 12; §3a.3 Kashiwara–Schapira (9.1.2), p. 159. Each read at its locator and matching.
- C03 — repaired: the description now reads "the exactness of extension by zero along an open inclusion and of direct image along a closed embedding (the functors themselves, and the exactness of inverse image, are Mathlib's)".
- C04 — repaired: the contract names `Geometry/Manifold/SmoothEmbedding/NormalSpace/Basic.lean` for `NormalSpace` and `Geometry/Manifold/TubularNeighborhood/Existence.lean` for the tubular neighbourhood; `TauCeti.IsFilledIn` is now placed in `Topology/FilledIn.lean`. All three are right at the pin.

No repair introduced a new problem. The pull request's description was read against this head and against the folder's change from main: its counts (30 Checks in 20 groups, a *Needs:* line for each of the 41 sections, six supplier roadmaps, `import Mathlib` plus four Tau Ceti modules), its list of removed and added Lean declarations, the supplier added (ComplexComparisonPartII §C6.1) and the supplier dropped (GeometricTopology), the renumbering with its table, and the locators it names all agree with the head. It needs no change.

## Verified sound

| Statement | Instances tried | Values computed (README / independent) | Result | Change |
|---|---|---|---|---|
| §1.3 gluing, new locator / `oneDimBoundaryPresheaf_isSheaf` | HondaIzawaSuwa2018 lines 171–174 (Prop 2.4, p. 5), 296–297 (Thm 2.14, p. 8); `q = n = 1`; `U = (0,1) ∪ (2,3)` | Prop 2.4: `𝓗^i_S = 0` for `i < q` makes `U ↦ H^q_U(V)` a sheaf; `𝓗⁰_ℝ(O) = 0` by the identity theorem; `1/(z−½)` and `0` glue to `1/(z−½)` | supported | none |
| §2.0f SteinBundleDuality, new locator | Serre1955 lines 517–520 (Théorème 3, printed p. 21); `n = 0`; `V = ℂ`, `p = 0` | source: `H_c^q = 0` for `q ≠ n`, `H_c^n ≅` dual of `H⁰(Ω^(n−p)(V*))`; `⊕E_x = (∏E*_x)′`; `H_c⁰(ℂ,O) = 0`, `H_c¹(ℂ,O) ≅ O(ℂ,Ω¹)′` | supported; README's `q < n` is the nontrivial half | none |
| §4.2 jump formula, new locator / `tendsto_integral_cauchyTransform_sub` | Tillmann1961 lines 60–62, 222–225 (Satz 3, p. 9), 331–336 (Satz 5, p. 12); `u = δ` | Satz 3: indicatrix of a functional on `D_(L^p)` grows slowly; Satz 5: then the jump tends to `u` strongly in `D′`; `δ`: `−(1/2πi)(1/(x+iγ) − 1/(x−iγ)) = γ/(π(x²+γ²)) → δ` | supported; compactly supported `u` is a finite sum of derivatives of `L^p` functions | none |
| §3a.3 microlocal purity, new locator | KashiwaraSchapira1985 lines 4417–4422 ((9.1.2), p. 159); `n = 1`, `ξ > 0` | source: microfunction complex concentrated in degree zero; stalk at `ξ > 0`: degree 0 is `0` (identity theorem), degree 1 is `lim O(half-disc)/O(disc)` | supported | none |
| Downstream note on HF3a | ComplexComparisonPartII on main, lines 126–130, 4783–4800, 4828 | attributes `j_!`, `f_!`, c-soft resolutions, the triangle, base change, the projection formula to HF3a; its §C6.1 states all but the projection formula; `j_!` is the pinned one there | note is true | none |
| Layer 3a Dependencies; path edits | `Functor.sheafPullback` (`Mathlib/CategoryTheory/Sites/Pullback.lean`, 56); `IsFilledIn` (`TauCeti/Topology/FilledIn.lean`, 61); `NormalSpace` (`…/NormalSpace/Basic.lean`, 59); `exists_diffeomorph_normalBundle_subset` (`…/TubularNeighborhood/Existence.lean`, 53); `IsOpen.exists_isFilledIn_compact_exhaustion` (`…/Exhaustion.lean`, 86) | each declaration is in the file the README names | agrees | none |

The rows for the untouched statements stand as in the previous review, of `73360bc`.

- **Source locators checked against the texts:** 7 in 4 sources (Honda–Izawa–Suwa Proposition 2.4 and Theorem 2.14(1); Serre Théorème 3; Tillmann Satz 3 and Satz 5 with the introduction's range `1 < p < ∞`; Kashiwara–Schapira (9.1.2)), all matching statement and printed page. Three of the seeded sample's targets (§§1.3, 2.0f, 4.2) fall in the changed passages and were checked there.
- **Library declarations opened at the pins:** 5 (listed in the last table row), all where the README says.
- **Cross-roadmap citations resolved:** ComplexComparisonPartII §C6.1 and its HF3a citations on main; nothing the README cites is dropped by an open pull request, and no other open pull request changes this roadmap.
- **Automatic checks:** all passed. Dependency check output: `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- **Elaboration:** `Suggested.lean` (unchanged since `73360bc`) elaborates with its 7 `sorry` warnings only; no sorry'd data, no `set_option`.
- **Overlap check:** read ComplexKahlerGeometry, ComplexComparisonPartII and GlobalHolomorphicFunctions (main), with LocallyConvexDuality and RelativisticQuantumFieldTheory (open) as in the previous review; compact-support functors: ComplexComparisonPartII §C6.1, consumed here and now said so under Downstream consumers; nothing else shared changed.
- **Source independence:** changed passages only: 4 passages compared with 4 sources, none shared beyond the forced statement of a theorem; largest share HondaIzawaSuwa2018, 16 of 26 locators (the previous review's 14 of 20 and the six the diff adds, two of them to this source); the diff adds, removes and reorders no layer, so the contents comparison of the previous review (independent) stands.
- **Research link:** Layers 1–4 build Sato's hyperfunctions in the relative Dolbeault form of Honda, Izawa and Suwa (2018; J. Math. Soc. Japan 2023), whose Theorem 2.14 quotes purity and flabbiness and whose §8 embeds distributions; Layer 3a is the microlocal theory of Sato, Kawai and Kashiwara (1973). Rests on the README's references and HondaIzawaSuwa2018 §§1–2, 8.

## Not verifiable

- Ito, *Theory of (vector valued) Sato hyperfunctions*, 1986, §§1.5–1.6: no legal copy found in the earlier rounds and not searched again; a route source in untouched text.
- Sato–Kawai–Kashiwara 1973 and Kashiwara–Schapira, *Sheaves on Manifolds*, Chapters III–IV: settled as uncertified, not read.
- Serre and Tillmann were read in OCR of the GDZ scans: the statements and page numbers are legible, some displayed formulas (Tillmann's estimate (13)) are not, and were not relied on beyond their role as the hypothesis of Satz 5.

## Source issues

- none

## For the human reviewers

- none
