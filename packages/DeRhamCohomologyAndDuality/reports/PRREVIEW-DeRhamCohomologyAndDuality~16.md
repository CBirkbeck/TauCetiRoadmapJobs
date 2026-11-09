# Review of DeRhamCohomologyAndDuality (pull request #2085 at e6b4a74)

**Verdict:** needs changes

This is an incremental re-review of the 76 folder lines changed since 41e3a4c: `README.md` (44 insertions, 32 deletions) and one docstring line of `Suggested.lean`. Nothing outside the folder changed. The previous R01 and R02 are repaired, and the repairs introduce no new defect. The previous R03 is not repaired and appears again below as R01.

## R01 (P3) — The title and description still contradict the head and do not record the order with ComplexKahlerGeometry's revision

**Location.**

- The pull-request title reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer".
- The description reads "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".
- Against these, `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:1229` reads "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1". The scope paragraph at `README.md:114–120` makes this roadmap their single owner.

**Claim.**

- The folder keeps main's position: K6.1 is a consumer (this roadmap's `README.md:75, :695` on main). The title and description say the opposite.
- ComplexKahlerGeometry's open revision is still at a6ec295, and it claims the boundaryless open-pair statements for itself. If both pull requests merge as they stand, each roadmap hands §§2.4, 3.1–3.3 and 4.1 to the other.
- The commit at this head repairs only the previous R01 and R02. The description and its merge-order block are unchanged.

**Witness.** ComplexKahlerGeometry at a6ec295, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1979–1982`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1 … consume these instances."

**Repair.** Nothing in the folder changes.

- Rewrite the title and description so that they describe this head:
  - K6.1 stays a consumer.
  - Layer 1 is rebuilt on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`.
  - §2.4 is stated in `Suggested.lean`.
  - §2.5 takes a real normed target.
  - §5.2 has a local form.
  - `IsTransverseAt` and the Haar-null theorem on boundaryless second-countable manifold sources are new.
  - The comparison with TangentialBordism §2.1 is recorded.
  - §4.2 now assumes Hausdorff `M`.
- In the merge-order block, state that ComplexKahlerGeometry's revision, when rebased, cites §§2.4, 3.1–3.3 and 4.1 here instead of owning their boundaryless instances.

Tested: the rewritten description agrees with `README.md:1229` at this head and with `:695` on main.

## Previous findings

- R01 — repaired: `README.md:946–948`: "For compact Hausdorff oriented `M` over `𝓡∂ m`, `m > 0` (second countable by `ChartedSpace.secondCountable_of_sigmaCompact`, so that AlgebraicTopology 6.3's relative class exists)"; plus the doubled-origin negative-control Check at `:969–976`.
- R02 — repaired: `README.md:628`: "*Needs:* Tau Ceti `TauCeti.smoothSingularSubcomplex`, `TauCeti.smoothSingularSubcomplexMap`; Mathlib …". `:369–371`: "§2.2 supplies its instance `N = I.interior M`". `:123–127`: "import it as stated, whatever its route … DifferentialGeometry supplies this roadmap and consumes none of it".
- R03 — not repaired: the title is still "ComplexKahlerGeometry K6.1 is a supplier, not a consumer", while `README.md:1229` keeps K6.1 a consumer. ComplexKahlerGeometry's revision a6ec295 `:1979–1982` still claims ownership. This is R01 above.

## Verified sound

**The changed passages.** Each was read in context and checked as listed.

- **Scope, §4.2 clause** (`README.md:117`). "§4.2 needs for compact Hausdorff manifolds with boundary" agrees with §4.2's new hypothesis.
- **Scope, DifferentialGeometry paragraph** (`:122–127`). DifferentialGeometry's README on main does not mention this roadmap (grep: 0 hits). At dabafb8 it lists this roadmap as its consumer (`:83`, `:522`, `:2659`) and says §§2.1–2.2 are "neither a target nor an input here" (`:72–76`). So "supplies this roadmap and consumes none of it" holds on both. The sentence on face-fixing smoothing points to the bullet at `:1205–1212`, whose `3`-simplex computation is unchanged.
- **AlgebraicTopology 6.3 contract** (`:66`, `:358–360`). AlgebraicTopology on main, `README.md:1360–1369`, builds the smooth-boundary classes over `𝓡∂ m`, `m > 0`, "with Hausdorff and second-countable M", through the compact-domain Brown theorem. This matches.
- **How to read the build** (`:369–372`). The new dependency matches the §2.3 *Needs:* line and the Layer 2 *Dependencies* (`:743–747`). Nothing in the README now makes §2.3 depend on §2.2.
- **§2.3 *Needs:*** (`:628–630`). All five names exist at the pins:
  - Mathlib `TopCat.Homotopy.singularChainComplexFunctorObjMap` (`AlgebraicTopology/SingularHomology/HomotopyInvariance.lean:49`);
  - Mathlib `TopCat.Homotopy.toSSet` (`Topology/Homotopy/TopCat/ToSSet.lean:36`, elaborated type `SSet.Homotopy (toSSet.map f) (toSSet.map g)`);
  - Mathlib `SSet.Homotopy.chainComplexMap` (`AlgebraicTopology/SimplicialSet/Homology/HomotopyInvariance.lean:88`);
  - Tau Ceti `TauCeti.smoothSingularSubcomplex` (`Geometry/Manifold/SmoothSingular/Basic.lean:77`) and `TauCeti.smoothSingularSubcomplexMap` (`:205`).
- **§4.1 interior clause** (`:906–913`). The added "Hausdorff σ-compact … over a finite-dimensional model" is load-bearing: Tau Ceti's `TopPair.isIso_singularHomologyMap_excisionMap_of_isClosed_subset` (`AlgebraicTopology/Singular/Excision.lean:228–229`) assumes `IsClosed K`, and a compact `K` is closed only under Hausdorffness (row N6). `TauCeti.integralTopForm_mpullback_subtypeVal` is at `Integration/OpenSubset.lean:71`.
- **§4.2** (`:946–960`).
  - Brown's theorem `TauCeti.IsLocallyCollared.isCollared [CompactSpace N] [T2Space M]` is at `Collar/Brown.lean:459`.
  - `ChartedSpace.secondCountable_of_sigmaCompact [SecondCountableTopology H] [SigmaCompactSpace M]` is at Mathlib `Geometry/Manifold/ChartedSpace.lean:236`.
  - The instance on `H = EuclideanHalfSpace m` comes from `ModelWithCorners.secondCountableTopology` (`Geometry/Manifold/IsManifold/Basic.lean:452`), which the supplier contracts already list (`README.md:210–211`).
  - A scratch file deriving `SecondCountableTopology M` for compact `M` charted on `EuclideanHalfSpace m` elaborates (exit 0). Plain `inferInstance` does not find the half-space instance, because `EuclideanHalfSpace` is a `def`. `inferInstanceAs` on the subtype, or the model lemma above, supplies it.
- **The doubled-origin Check** (`:969–976`) was recomputed in row N3. Both §4.2 Checks that were already there still hold under the new hypothesis (rows N1–N2).
- **`Suggested.lean:38`.** The docstring now says "compact Hausdorff manifold with boundary", which agrees with the README. The reason §4.2 is not statable is unchanged and still holds at the pin.

**Gate and dependency check.**

- The gate, re-run at this head, reports every count `0` and `OK`. The worker's run has `build=0`.
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The roadmap is at line 397 of the 400-line merge order, and its suppliers (DifferentialGeometry, AlgebraicTopology) are on main.

**Lean.**

- `lake env lean` on `Suggested.lean` exits 0 with exactly six `declaration uses 'sorry'` warnings, at lines 62, 82, 121, 157, 171 and 216.
- I appended `#check @` for all 13 declarations to a scratch copy and elaborated it once. All 13 elaborated types are identical, token for token, to the signature listing, which the previous review matched against the README. No statement changed, so the previous padding probe (fails 6/6) and headline analysis carry over:
  - stated: 1.3, 2.2, 2.4, 5.2 and the 5.3 flat and manifold theorems;
  - named not statable: 3.3, 4.1, 4.2.
- Imports are `Mathlib` plus four Tau Ceti modules. There is no `set_option`, no sorry'd data and no `lemma`.

**Cross-roadmap citations resolved for the changed passages.**

- On main: AlgebraicTopology 6.3 (`:1360–1369`), DifferentialGeometry (no citation of this roadmap), and ComplexKahlerGeometry K6.1 consuming under DifferentialGeometry labels (`:1396`).
- At open heads: DifferentialGeometry dabafb8 (`:72–76`, `:83`, `:194`, `:2145–2150`, `:2659`) and ComplexKahlerGeometry a6ec295 (`:1975–1984`).
- `roadmaps grep` for citations of this roadmap's §§2.2, 2.3 and 4.2 over main and the 457 open heads finds only DifferentialGeometry dabafb8 `:194`, which cites §§2.1–2.2 as this roadmap's. That agrees with the head.
- The overlap file lists no dropped id, no other pull request changing this roadmap, and no id defined only by an open revision.
- Ownership against open pull requests was checked with `roadmaps grep`. There is no second owner apart from R01.

**Seeded sample, where it falls in the changed passages.**

- §2.3 has no external locator ("this roadmap's"); its library names are checked above.
- §4.1's changed clause has no new locator. Its declarations are checked above, and its Bott–Tu §5 locator is under *Not verifiable*.
- Hatcher Props. 1.30, 1.33 and 1.34 (§§1.2–1.3) were spot-checked again at hatcher lines 2676, 2723 and 2758.

**Adversarial pass.** Ten new rows (N1–N10) cover the changed statements, with values computed on each side. Thirty rows are carried from the previous report (r15, rows 1–11, 13–24, 27–34) for statements this diff does not touch. Rows 12, 25 and 26 of r15 are replaced by N7, N1–N2 and N3.

| # | Statement | Instance | Values computed | Result |
|---|---|---|---|---|
| N1 | §4.2 (Hausdorff) | `D¹`, `α = 0`, `β = 2` near `1`, `5` near `−1` | right side `0 − (2·(+1) + 5·(−1)) = 3 = −(c₊ − c₋)` | holds |
| N2 | §4.2 | `[0, 1]`, `α = dx`, `β = x` | `1 − (1 − 0) = 0`; `d(x, 0) = (dx, x\|_U − 0)` exact | holds |
| N3 | §4.2 doubled-origin Check | `[−1, 1] ∪ {0′}` | MV: `ℝ² → ℝ²`, `(x, y) ↦ (x + y, x + y)`, rank 1, so `H₁(M) = ℝ`; pair: `0 → ℝ → H₁(M, ∂M) → ker(ℝ² → ℝ) = ℝ → 0`, so `ℝ²`; local images `a`, `b`, `a + b`; a class needs `1, 1, 1`, which forces `a + b = 2 ≠ 1`; Hausdorff `[−1, 1]`: `H₁(M, ∂M) = ℝ`, `c` has local image `1` everywhere | Check correct; hypothesis necessary |
| N4 | §4.2 second countability | compact `M` on `EuclideanHalfSpace m`; doubled interval | lemma chain elaborates (exit 0); the doubled interval is covered by 2 charts, so second countable, but not T2 | Hausdorff, not second countability, separates; holds |
| N5 | §4.2 Brown collar | `N = ∂M` | `∂M` closed in compact `M`, so `[CompactSpace N]`; `[T2Space M]` now assumed (`Brown.lean:459`) | holds |
| N6 | §4.1 interior clause | doubled interval, `K = [−½, ½] ∋ 0`; `M = [0, 1]` | `0′ ∈ closure K` (every neighbourhood of `0′` meets `(−ε, 0)`), so `IsClosed K` (`Excision.lean:229`) fails without T2; `(0, 1) = ⋃[1/n, 1 − 1/n]` is σ-compact | added hypotheses load-bearing; holds |
| N7 | §2.3 without §2.2 | general triple; the three Checks | `i(j_*sr_*) = j_*isr_* ~ (jr)_* ~ id`; `(j_*sr_*)i = j_*sir_* ~ j_*r_* ~ id`; `Φ(0, x) = x + 1 = j(r(x))`, `Φ(1, x) = x`; `S¹`: `H₁` `0` vs `ℝ` | no input from §2.2; holds |
| N8 | scope: DG consumes none | DG main; DG dabafb8 | 0 hits on main; consumer at `:83`, `:2659`; `:72–76` "neither a target nor an input" | holds |
| N9 | AT 6.3 contract | AT main | `:1361` "Hausdorff and second-countable M", `𝓡∂ m`, `m > 0`; Brown at `:1368` | holds |
| N10 | `Suggested.lean` docstring | 13 `#check @` | 13/13 identical; 6 `sorry` warnings | holds |
| 1 | §1.1 predicate (r15) | `dx`; `x dy` on `ℂ` | `d(Re) = dx`; `∂ᵧ∂ₓg = 0` vs `∂ₓ∂ᵧg = 1` | holds |
| 2 | §1.1 continuity (r15) | `d(x² sin(1/x))`; `x dy` | `0` at `0`, `−1` at `1/(2πn)`; continuous with no primitive | holds |
| 3 | §1.2 choice (r15) | `dx`, `0 → 3`, `Re`, `Re + 7` | `(1 − 0) + (10 − 8) = 3` | holds |
| 4 | §1.2 angular (r15) | circle once, twice, reversed | `2π`, `4π`, `−2π` | holds |
| 5 | §1.2 vs `pathClassIntegral` (r15) | `d(\|x\|^(3/2))` | ours `1`, Tau Ceti junk `0` | holds |
| 6 | §1.3 Lean (r15) | `S¹`, `dθ`; slit plane; point | loop `2π ≠ 0`; `arg`; `g` constant | holds |
| 7 | §1.3 holomorphic (r15) | `1/z` | principal `log`; `∮ = 2πi` | holds |
| 8 | §2.1 cone (r15) | `[0, ∞)` at `0` | `ball(t, εt) ⊆ C` iff `ε ≤ 1`; `−εt/2 ∉ C` | holds |
| 9 | §2.1 local field (r15) | `ball(q, 2ε₀) ⊆ C` | `‖(y − x) + w/t‖ < 2ε₀`, so `z ∈ C` by convexity | holds |
| 10 | §2.2 Lean (r15) | `[0, ∞)`; `[0, 1]` | `Φ(0, x) = x + 1`; `r(0) = 0.316`, `r(1) = 0.684` | holds |
| 11 | §2.2 quadrant (r15) | `ψ(s, p) = p + s(1, 1)` | `∂ₓm` is `1` vs `0`; `a = −t` | holds |
| 13 | §2.3 negative control (r15) | `S¹`, point | `H₁`: `0` vs `ℝ` | holds |
| 14 | §2.4 Lean (r15) | `(ℝ, ℝ ∖ 0)`; `W = ∅`; `W = X` | `H₁ = ℝ`, `H₀ = 0`; absolute; `0` | holds |
| 15 | §2.4 openness (r15) | graph of a nowhere-differentiable function | smooth `H₁` uncountable-dimensional vs singular `0` | holds |
| 16 | §2.5 retractions (r15) | interval, disc | `r(2) = 1`, `r(3, 4) = (0.6, 0.8)` | holds |
| 17 | §2.5 boundary target (r15) | `Q` | `Q(t, t, t) = −3t²` | holds |
| 18 | §3.1 sign (r15) | `b = 1` on `(0, ∞)`, `[−1, 1]` | `−(b(1) − b(−1)) = −1`, so `δ` gives `1` | holds |
| 19 | §3.1 coordinates (r15) | `relativeCoordinates_d` | `(da, fa − db)` | holds |
| 20 | §3.2 cocone (r15) | `K = ℝ²`, `L = ℝ` | `φ_t((k₁, k₂), 0) = (0, k₂ + tk₁)` | holds |
| 21 | §3.2 evaluation (r15) | `ψ dx`, `β = Ψ\|_W` | `1 − (1 − 0) = 0` | holds |
| 22 | §3.3 (r15) | `(ℝ², ℝ² ∖ 0)` | `δ[dθ](D) = 2π` | holds |
| 23 | §4.1 dim 0 (r15) | `ℤ`, `K = {0, 1}` | `1 + 2 = 3` both sides | holds |
| 24 | §4.1 on `ℝ` (r15) | `4t − 2`, `8t − 4` | pairing `1`, `1`; absolute `0` | holds |
| 27 | §5.1 (r15) | `x + p`; `x² + p` | `p = −1`: derivatives `±2`; `p = 0`: `0` | holds |
| 28 | §5.2 Lean (r15) | `x² + p`; `V = 0` | bad set `{0}`; `∅` | holds |
| 29 | §5.2 local (r15) | `O = (1, 2) × ℝ` | derivative in `(2, 4)`, bad set `∅` | holds |
| 30 | §5.3 universal (r15) | `β > 0`; `β = 0` | `q ↦ β(x)q` onto; `Df u − Dj v` | holds |
| 31 | §5.3 flat Lean (r15) | `f = β = x²`, `j = 0` | derivative `0` at `0` for every `p` | hypothesis necessary |
| 32 | §5.3 manifold Lean (r15) | `ℝ`; two origins; discrete `ℝ`; `∅` | `{0}`; `{0}`; `μ(ℝ) = ∞`; `∅` | holds |
| 33 | `IsTransverseAt` (r15) | `g = 1, j = 0`; `g = 0, j = id`; `g = x²` | vacuous; onto; zero map | holds |
| 34 | TangentialBordism comparison (r15) | diagonal of `V × V` | `D_xF u − Dj v = c₁ − c₂` | holds |

**Remarks on untouched text.** None.

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds*, 2nd ed.** It is recorded `uncertified` (paywalled) in the manifest and was not read. None of its locators is in a changed passage. Thms. 18.7 and 18.14, cited for §§2.4 and 3.3, remain unchecked against the text.
- **Bott–Tu, *Differential Forms in Algebraic Topology*.** It is recorded `uncertified` and was not read. §5 is cited in §4.1, whose interior clause changed; the citation itself did not change.

## Source issues

- none
