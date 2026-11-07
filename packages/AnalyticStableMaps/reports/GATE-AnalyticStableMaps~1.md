# GATE-AnalyticStableMaps~1: answers to human review

Head before: `9af338e`. Head after: `cf41a08`, "AnalyticStableMaps: review repairs (consume HeegaardFloer F0–F2, PH6–PH7, ImplicitAtlases §5.4–§5.5; corrected §13.1–§13.2 Checks)". The commit changes `TauCetiRoadmap/AnalyticStableMaps/README.md` (+117/−107) and the module docstring of `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` (+8/−5); nothing outside the folder. Every main citation below was checked against main at `eaf17b1`, which is still main's head.

## H01 (roed-math) — applied differently

At ImplicitAtlases' current head (`81fc759`), §0.7 cites TopologicalSheafCohomology TS1.1–TS1.2 for its Čech carrier, and §5.5 already realizes a pushed-forward functional as a rational singular class on a finite-CW target through CharacteristicClasses §C1.2b's Čech/singular comparison. So the comparison exists, and §13.1 (README line 1057) now applies ImplicitAtlases §5.4–§5.5 instead of building it. Old: "supply the Čech and singular comparison … (TopologicalSheafCohomology Layers 0–1; AlgebraicTopology Stage 6 item 1)". New: "apply ImplicitAtlases §5.4 … When Y is a finite CW complex … apply ImplicitAtlases §5.5 …", with §6.5 for products. The "From TauCetiRoadmap.TopologicalSheafCohomology" supplier contract is gone. Line 26 now names TopologicalSheafCohomology only as a supplier of ImplicitAtlases, reached here through it, and the Needs and Dependencies lines of Layers 8 and 13 no longer cite it.

## H02 (roed-math) — applied

The determinant-line functor now comes from HeegaardFloer F0.0, and closed Fredholm theory and Riemann–Roch from PseudoholomorphicCurveAnalysis PH6.2–PH6.3 and PH7.2. §0.2 (line 132) is now the linearized operator `D_u` as a PH6.2 operator with index `mχ(Σ) + 2⟨c₁(TX,J), u_*[Σ]⟩`, and §0.3 (line 148) keeps only the closed-surface complex orientation and the circle-cutting law. §0.5 (line 182) proves that its genus-zero case is F2.6b, and line 22 now lists what HeegaardFloer supplies on main. It used to say HeegaardFloer "states no closed-surface determinant-line functor, no closed Riemann–Roch index, … no coincidence lemma for two branches and no sphere model".

## H03 (roed-math) — disputed

The cited ids resolve on main, and the README keeps them. AlgebraicTopology Stage 6 item 3 is the orientation local system with its fundamental classes, and Stage 8 item 7 is the finite CW type of compact smooth manifolds. #1652 and #1663 both revise an existing roadmap, so neither is a dependency of this one. #1652's head (`bd4f35d`) now carries its own old → new numbering map ("Stage 6 items 0–5 are §§6.0–6.5", "Stage 8 items 1–12 are §§8.1–8.12"), so the Stage citations keep resolving whichever of the two merges.

## Details behind H01–H03

**H01.**

- The comment's premise held at the ImplicitAtlases head it read (`3b7572e`). At `81fc759`, ImplicitAtlases' supplier contracts consume TS1.1 (in §0.7 and §6.5), TS1.2 (in §0.7) and CharacteristicClasses §C1.2b (in §5.5); see its README lines 21–22, 78 and 85–86, and §5.5 at line 657.
- TopologicalSheafCohomology's scope on main gives the Čech/singular comparison to CharacteristicClasses C1.2b, and manifold orientation sheaves to ImplicitAtlases §§0.5–0.11.
- §13.1's *Needs:* line is now "§8.1, §9.2; ImplicitAtlases §5.4–§5.5, §6.5". §13.2 (line 1069) now says only that it supplies §5.5's finite-CW hypothesis for `Y = X^n`. §8.2's orientation-sheaf citation (line 906) is now ImplicitAtlases §0.10.
- No new dependency arises. ImplicitAtlases was already a supplier, and it precedes this roadmap in the merge order: the intake places this roadmap directly after it.
- A false §13.1 Check is corrected (line 1061). It said that pushing lines in `ℂP²` forward to a point gives 1. In fact `Čech^4(pt; ℚ) = 0`, so the pushforward to a point is 0; the value 1 is the pushforward along the identity of the dual plane.
- The same error recurred in §13.2 and is corrected there (lines 1075–1076). Old: "`X = ℂP²`, `n = 1`: … the functional of lines (`v = 4`) pushes forward to a multiple of the fundamental class, and the functional of conics (`v = 10`) pushes forward to 0". With one mark, `v = 2((2−3)·1 + 3 + 1) = 6` for lines and `2(−1 + 6 + 1) = 12` for conics. Both exceed 4, so both push forward to 0 in `H_*(ℂP²; ℚ)`. A new `n = 2` Check pins a nonzero value. Lines with two marks have `v = 2(−1 + 3 + 2) = 8 = dim_ℝ (ℂP²)²`, and since evaluation has degree 1 (one line through two distinct points), the pushforward is the fundamental class.

**H02.** Main has moved since `9af338e`. HeegaardFloer was rewritten into Layers with F-codes, PseudoholomorphicCurveAnalysis merged, and HeegaardFloer now consumes it. The old "Lane F1/F2 item k" citations therefore pointed at the wrong content (Lane F1 item 3 had become F1.3, spectral flow). Every one now cites the F-code that holds the content on main. The same duplication was repaired throughout:

- old §0.2's coincidence lemma is now F2.2c;
- §0.1 takes the energy from F2.6c;
- §0.4 takes finiteness of critical sets and fibres from F2.2a;
- §2.1 (line 256) consumes F0.5 and F2.1 and keeps only the C∞ Baire topology and the equivalence of its compatibility condition with F0.5's;
- §2.4 takes the sphere model from F2.6a;
- §2.8 takes genus-zero properness from F2.6b;
- §4.2 (line 692) consumes F1.1/F1.5 and keeps only the node-matched common constant;
- §10.1 (line 953) consumes F2.1's contraction and relative extension.

Line 22 also records that F5.0 leaves the arbitrary-genus closed carrier to this roadmap. Main's HeegaardFloer asks for exactly that: its F5.0 (README line 4130) assigns the arbitrary-genus closed stable-map carrier downstream, and its Downstream consumers entry (line 4847) asks this roadmap's §0.5 to "compare the genus-zero restriction with F2.6b", which §0.5 now does.

**H03.** HeegaardFloer and PseudoholomorphicCurveAnalysis on main cite AlgebraicTopology by the same Stage ids. Stage 6 item 1 and Stage 7 item 1 are no longer cited here, because universal coefficients now enter through ImplicitAtlases §5.5 and χ through PH7.2. Stage 6 item 3 and Stage 8 item 7 are cited at lines 27, 58, 64, 103, 130, 146, 209, 1069, 1078 and 1110. On main they are at AlgebraicTopology README lines 1180 and 1810. At #1652's head they are §6.3 "Homological orientation and fundamental classes" (line 1935) and §8.7 "Smooth-manifold CW type" (line 2869), and its numbering map is at lines 452–463. #1663's head (`8029fe9`) keeps the Stage numbering.

## Other changes made under the same pattern

- **§3.4 (line 601).** It restated interior ε-regularity and monotonicity, which HeegaardFloer F2.3 supplies for one smooth J under compact-image hypotheses, without saying how its version differs. It now opens: "HeegaardFloer F2.3 supplies … for one smooth J …; this section proves the versions uniform in J that the compactness theorem needs."
- **Pinned domain carrier (line 64 and the `Suggested.lean` docstring).** Both said that `SmoothAlmostComplexStructure` has at the pin only the constant, negated and product constructors, so that no compact Riemann surface is a domain carrier. That is false at the brief's Tau Ceti pin `2fd255d`. `TauCeti.SmoothAlmostComplexStructure.ofComplexManifold` (TauCeti/Geometry/Manifold/Complex/AlmostComplexStructure.lean, line 76) gives a complex manifold its almost complex structure, and `TauCeti.isPseudoholomorphic_ofComplexManifold_iff` identifies the pseudoholomorphic maps with the holomorphic ones.
  - Line 64 now names them and corrects the stale path `AlmostComplex.lean` to `AlmostComplex/Basic.lean`.
  - The docstring's first bullet now says what each headline still lacks at the pin. Theorem 1's class and genus identities need the fundamental class `[Σ]` and the genus of a compact Riemann surface. Neither is in Mathlib or Tau Ceti at the pins: the only "genus" hits in Tau Ceti are permutation-triple and ribbon-graph combinatorics, and the only "fundamental class" hits are class formations. Theorem 3 needs a topology on smooth tame almost complex structures, and `SmoothAlmostComplexStructure` has no `TopologicalSpace` instance at the pin; it also needs the moduli space of simple curves. Theorems 2 and 4 stay covered by the nodal-curve bullet.
- **Open item for reviewers.** With `ofComplexManifold` and `FiniteHolomorphicMap` at the brief's pins, the factorization-and-uniqueness core of Theorem 1, without its class and genus identities, looks expressible. It is not stated in `Suggested.lean`. This branch's own `lake-manifest.json` pins Tau Ceti `a91d3aa`, and the build of this worktree runs against that revision; a search of its sources finds no `ofComplexManifold`, so any such statement would fail the branch build. The statement can be added once the branch's manifest is rebased onto main's pins.
- **Ids that main roadmaps cite.** DGFloer on main cites "AnalyticStableMaps M2.0/M2.0a", from an older head of this pull request, so the §2.4 and §2.5 headings (lines 302 and 314) now carry those tags. No section id was dropped. GromovWittenTheory's citations (§0.1, §1.1, §2.1, §3.7, Layers 1, 3, 7, 9, 11–13) and DGFloer's (M3) still resolve. §0.2 and §0.3 kept their numbers, and no roadmap cites them.
- **Downstream consumers (line 1112)** now lists DGFloer (M2.0/M2.0a, M3), TaubesGromov (M1–M3) and HamiltonianFloerOperations (M3), each of which cites this roadmap from main.
- **PDE ids.** On main, PDE is organised in Layers tagged A1–A7 and B8–B11, not Lanes. Citations now read "PDE Layer 1 (A1–A7)". Where §3.4 and Layer 3 cited "PDE Lane B", they now cite PH3 and PH5.2.
- **§2.8 Check.** It said the quotient near `z ↦ z²` is an orbifold chart. That map is not somewhere injective, so it lies outside the carrier, and the Check now says so.

## Adversarial pass on changed and recomputed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1: the pinned density is twice F2.6c's integrand | pinned `stdComplexLineEnergyDensity` (Energy.lean:118) and `stdComplexLineEnergy` (line 402) | density `ω(F∂_s, JF∂_s) + ω(F∂_t, JF∂_t) = g_J(∂_s u,∂_s u) + g_J(∂_t u,∂_t u)`, since `g_J(v,v) = ω(v,Jv)`; pinned energy `∫ density/2` equals F2.6c's `½∫|du|²` | holds | adapter stated |
| §0.2: `D_u` at a zero | flat J on `ℝ^(2m)`; constant u; McDuff–Salamon's form with `∂_J u` | at a zero `du∘j = J du`, so `∂_J u = du`; differentiating `J² = −1` gives `(∇_ξJ)J = −J(∇_ξJ)`, so `½(∇_ξJ)du∘j = −½J(∇_ξJ)du`, McDuff–Salamon's term; for flat J or constant u, `D_u = ∂̄` | holds | — |
| §0.2: Leibniz rule | real f | `D_u(fξ) − f·D_uξ = ½(df⊗ξ + (df∘j)⊗Jξ) = (∂̄f)ξ`, using `∇_(fξ)J = f∇_ξJ` | holds | — |
| §0.2: closed index | constant map with g = 2, m = 1; identity of `ℂP¹`; degree-d sphere in `ℂP²` | `2 − 4 = −2` (kernel 2, cokernel 4); `2 + 2·2 = 6 = dim_ℝ PSL(2,ℂ)` (with `c₁` instead of `2c₁`: 4); `2·2 + 2·3d = 2(3d+2)`: 10 (d = 1), 16 (d = 2) = `2(3(d+1) − 1)`; cokernel 0, since `u*TℂP²` is a quotient of `𝒪(d)³`, so both splitting degrees are ≥ d ≥ 1 > −1 | holds | Checks |
| §0.2: Wendl's `2D_u` | same operators | kernel, cokernel and index unchanged; the J-variation term is `½Y∘du∘j` | holds | Check |
| §0.3: complex orientation via the affine path `D₀ + tα` | decomposition `D' = ½(D − JDJ)`, `α = ½(D + JDJ)` | `D'J = JD'` (complex-linear); α is zeroth order and antilinear; the path stays among real CR operators and is contractible | holds | — |
| §0.3: direct-sum order independence | torus (index 0) ⊕ sphere (index 2); disc ⊕ disc with boundary ℝ | `(−1)^(0·2) = +1`; disc index `1·χ + μ = 1 + 0 = 1`, sign `(−1)^(1·1) = −1`; closed index `nχ + 2c₁` is even because χ of a closed surface is even | holds on closed surfaces only | Check |
| §0.3: circle cutting | sphere cut along the equator; torus cut along a nonseparating circle | on a half-cylinder, the mode `a(s)e^(ikt)` solves `a′ = ka`; `z^k` (k ≥ 0) does not decay, so each half has kernel 0; `0 + 0 + 2 = 2` gives index 0 per half, so cokernel 0; on the cylinder, `e^(ks)` never decays at both ends (kernel 0), and the cokernel is the constants (dimension 2), index −2, so `−2 + 2 = 0` = torus index; two separate constants give `−2 + 4 = 2 ≠ 0` | holds | Checks |
| §2.1: compatibility condition equivalence | ℝ², `Y = [[a,b],[b,−a]]`; general case | `Ye₁ = (a,b)`, `Ye₂ = (b,−a)`: `ω(Ye₁,e₂) = a = ω(Ye₂,e₁)`; F0.5's form `ω(Ye₁,Je₂) + ω(Je₁,Ye₂) = b − b = 0`; in general, F0.5 gives `ω(Yu,Jv) = ω(Yv,Ju)`; put `w = Jv`, then `ω(Yu,w) = ω(Yw,u)`; the step is reversible | holds | Check rewritten |
| §2.1: dimensions | ℝ², ℝ⁴ | dimension 2 = `dim Sp(2) − dim U(1) = 3 − 1`; antilinear maps of `ℂ²` have real dimension 8; compatible ones `dim Sp(4) − dim U(2) = 10 − 4 = 6` | holds | — |
| §2.1: complete metrizability | tame vs compatible; `C^ℓ` topology | `{J² = −1}` and `{ω(J·,J·) = ω}` are closed in the Fréchet space (K5a); positivity is open on compact X, so each set is open in a closed subset; smooth J converging in `C^ℓ` to a structure of class exactly `C^ℓ` is Cauchy with no smooth limit | holds | Check added |
| §2.8: genus-0 properness (F2.6b) | `φ_k(z) = kz` with u nonconstant; `z ↦ z²` | an escaping sequence converges to a constant off one point, forcing `u′` constant, which contradicts `E(u′) = E(u) > 0`; the isotropy of `z²` is `{z, −z}`, and the map is not somewhere injective | holds | Check reworded |
| §0.5: genus-zero case = F2.6b | g(Σ) = 0 | `2 = d·χ(Σ₀) − R` with d ≥ 1 and R ≥ 0, so χ(Σ₀) > 0 and g(Σ₀) = 0 | holds | sentence added |
| §0.5 Checks recomputed | double cover of a line branched at 4 points; `z²(z−1)` | `2g − 2 = 2(−2) + 4 = 0`; `D(v) = −2 + 6 = 4`, `D(u) = 12 = 8 + 4`; critical points 0, 2/3 and ∞; `u⁻¹(0) = {0, 1}`; R = 1 + 1 + 2 = 4 = 2·3 − 2 | holds | — |
| §0.5 genus inequality | `(d − 1)(2 − 2g₀) = R` | d = 1: R = 0; g₀ = 1: R = 0; g₀ = 0: R = 2d − 2; for g₀ ≥ 2 and d > 1 the left side is negative, so equality is impossible | holds | — |
| §4.2: index change per end | sphere, m = 1, one decaying end | `2 − 2m = 0`, the index of a half in §0.3's Check | holds | — |
| §10.1: path via F2.1, non-convexity | `J_a = [[a, −(1+a²)], [1, −a]]` | `J_a² = −id`; `ω(v,J_a v) = x² − 2axy + (1+a²)y² = (x − ay)² + y²`; the midpoint of `J_{±1}` is `[[0,−2],[1,0]]`, with square `−2·id` | holds | wording |
| §13.1 Check | lines in `ℂP²`: m = 2, g = 0, n = 0, `c₁·line = 3` | `v = 2(−1 + 3) = 4`; the moduli space is the dual plane; `Čech^4(pt) = 0`, so the pushforward to a point is 0, and 1 along the identity | old Check false | corrected |
| §13.2 Check, `n = 1` | lines and conics in `ℂP²` with one mark | `v = 2(−1 + 3 + 1) = 6` and `2(−1 + 6 + 1) = 12`; `H_6 = H_12 = 0` for `ℂP²`; the old Check used the unmarked `v = 4` and predicted a multiple of `[ℂP²]` | old Check false | corrected |
| §13.2 Check, `n = 2` (new) | lines in `ℂP²` with two marks | `v = 2(−1 + 3 + 2) = 8 = dim_ℝ (ℂP²)²`; genus-zero maps to `ℂP²` are unobstructed (`H¹(u*TℂP²) = 0`), and 2-pointed lines have trivial automorphisms; evaluation is generically injective (one line through two distinct points), so the pushforward is `1·[ℂP² × ℂP²]` | holds | Check added |
| Other v-values in the README, recomputed | identity of `ℂP¹` (line 203); elliptic K3 class (205); two-line nodal domain (686); (2,2,0,−2) (688); constant class over a point (937–938); §13.3 and §13.4 Checks | `2(−2 + 2) = 0`; `2(0 + 0) = 0`; `10 + 10 − 12 + 4 − 4 + 2 = 10 = 2(−1 + 6)`; `2(1 − 2) = −2`; `2(3g − 3 + n)`, 0 for (0,3) and 2 for (1,1); `dim_ℝ M̄_(0,5) = 4`; three marked lines `v = 10` against point degrees `4·3 = 12`; two points and a line `4 + 4 + 2 = 10`, count 1; constant (0,3) class `v = 2m` | all hold | — |
| line 64 / docstring: pinned domain carrier | Tau Ceti `2fd255d` (brief's pin) vs `a91d3aa` (branch manifest) | `def ofComplexManifold` at AlmostComplexStructure.lean:76 at `2fd255d`; absent at `a91d3aa`; no surface fundamental class or genus at either; no topology on `SmoothAlmostComplexStructure` | old claim false at the pin | corrected |
| §3.4 opening | F2.3 on main | F2.3 covers one smooth J, compact image and fixed genus-zero domains; §3.4 proves uniformity over continuous J near a fixed one and over compact families | variant now stated | sentence added |

Elaborated signatures: `Suggested.lean` declares nothing (a module docstring, the namespace and one comment), so there is nothing to `#check` and no type to compare with the README. The change to it is docstring-only.

## Ownership and suppliers

Every consumed item was checked at its owner as it is now:

- HeegaardFloer on main: F0.0 (§2.2), F0.5 (§2.7), F1.1 (§3.1), F1.4 (§3.4), F1.5 (§3.5), F2.1 (§4.1), F2.2a and F2.2c (§4.2), F2.3–F2.5 (§4.3–§4.5), F2.6a–c (§4.6a–§4.6c), F5.0 (§7.0).
- PseudoholomorphicCurveAnalysis on main: PH1, PH3.2–PH3.5, PH4.1, PH5.1–PH5.2, PH6.1–PH6.3, PH7.2. PH7.2 states closed Riemann–Roch as `ind_ℝ D = nχ(Σ) + 2c₁(E)[Σ]`. Its scope (lines 53–58) says it is the single owner of closed and bordered Riemann–Roch.
- ImplicitAtlases at `81fc759`: §0.7, §0.10, §5.4, §5.5, §6.5.
- On main: CharacteristicClasses C1.2b and C3, ComplexKahlerGeometry K5a (the complete Fréchet topology on smooth sections), AlgebraicTopology Stage 6 item 3 and Stage 8 item 7, FuchsianOrbifolds Layer 5 items 1 and 3, PDE Layer 1.

What §0.3 still owns is the complex orientation of real Cauchy–Riemann determinant lines on closed surfaces of every genus, with the circle-cutting law. A search for "complex orientation" on main and at every open head finds no other owner. F1.4, F2.6b (spheres only) and PseudoholomorphicCurveAnalysis do not state it, and HeegaardFloer F5.0 leaves the arbitrary-genus closed constructions to this roadmap. No supplier is later in the merge order, no notion moved down, and no declaration name collides with another roadmap's.

Overlaps: none for this roadmap. No other open pull request changes it, and none drops an id it cites. The closest roadmaps by vocabulary are GromovWittenTheory, FukayaTheory, ImplicitAtlases and DGFloer. Each either consumes this roadmap or supplies it, so no object has two owners. The §13.2 correction adds no construction.

## Sources

No source was fetched and no text is requested. The one new locator, McDuff–Salamon Proposition 3.1.1 (the linearized operator of §0.2), is in a work the README already cites by locator only. The AMS book has no open copy, so the citation is uncertified. This job may edit only `README.md` and `Suggested.lean`, so no manifest entry was written.

## Build and gate

- `lake build TauCetiRoadmap.AnalyticStableMaps.Suggested`: exit 0, "Build completed successfully (8976 jobs)". It ran at 08:56 UTC on the restored files and again at 09:00 UTC at `cf41a08`. The earlier attempt's `build=2` failure (`error: already exists (error code: 17)` on `.lake/packages`) came from the shared Lake package directory of pin `356835296538146e` being missing. That directory was present again for this run, and the roadmap files needed no change for it.
- Gate at `cf41a08`: `gate AnalyticStableMaps: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`, with the single problem `depcheck: NOT IN ORDER: AnalyticStableMaps (insert it after its last supplier)`. This roadmap has no merge-order entry yet, which the brief says is not a defect at this stage.
- Direction check (`--movable`) against the board's `merge-order/ORDER.txt`, which the board checkout has refreshed and which no longer carries the intake's earlier insertion:

  ```text
  NOT IN ORDER: AnalyticStableMaps (insert it after its last supplier)
  depcheck: 239 roadmaps, 2364 edges, 1 problem(s)
  ```

  Against the same order with the intake's insertion directly after ImplicitAtlases (it differs from the board file only in that line and one unrelated K3Surfaces line):

  ```text
  depcheck: 239 roadmaps, 2364 edges, 0 problem(s)
  ```

  Neither run shows an UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name is found nowhere.
