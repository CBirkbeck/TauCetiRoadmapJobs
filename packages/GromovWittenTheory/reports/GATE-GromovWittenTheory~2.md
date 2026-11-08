# GATE-GromovWittenTheory~2: answers to human review

Pull request branch head before this job: `6e5e2be`; after: `1224c656` (one commit, `TauCetiRoadmap/GromovWittenTheory/README.md` only; `Suggested.lean` unchanged).

## H01 (roed-math) — applied differently

ImplicitAtlases no longer has a separate Čech theory. At its current head (`81fc759`, later than the `3b7572e` the comment checked), §0.7 defines every Čech group, the domain of the virtual class included, as Tau Ceti's `TauCeti.Topology.cechCohomology` computed through TopologicalSheafCohomology TS1.1–TS1.2, and its supplier contract cites both. CharacteristicClasses C1.2b builds the Čech side of its Čech/singular comparison as the same point-neighbourhood colimit. So the two carriers are one group, and the comparison the comment asks for is not needed. What was missing here was the statement that says so and the route into that group. That is now written out:

- `TauCetiRoadmap/GromovWittenTheory/README.md` L27 and L99: "consumed through ImplicitAtlases' use of them" → TS1.1–TS1.2 as the carrier of ImplicitAtlases §0.7 and C1.2b. The unused §0.1 and §1.3 citations are dropped.
- L73 (Tau Ceti contract): adds `TauCeti.Topology.cechCohomology` and records what the pin lacks, namely a pullback on the colimit and a cup product.
- L26 and L94–95: adds ImplicitAtlases §0.7 (pullback along continuous maps) and defines the Čech cup product as the diagonal pullback of the §6.5 external product.
- L252 (§2.1): `TopologicalSheafCohomology §1.2–§1.3` → C1.2b on the finite-CW coarse space of D8, landing in `TauCeti.Topology.cechCohomology`.
- L272 (§2.2): the right side is now spelled out:
  - singular `ψ` and `γ_i` are carried into Čech cohomology of the constant sheaf `ℚ` by C1.2b on the finite-CW spaces `|M̄_(g,n)|` and `X`;
  - they are pulled back along `st` and `ev_i` by ImplicitAtlases §0.7 and multiplied by the §6.5-derived cup product;
  - they are evaluated by `Φ`, whose orientation-sheaf coefficients are identified with `ℚ` by AnalyticStableMaps §8.1.
  - No Čech/singular comparison is applied to the non-CW coarse map space.
- L284: new Check, `X` a point with `(1, 1, 0)`, giving `c = 1 = χ(pt)`. An unweighted left side would give `1/2`.
- L664 and L668 (§8.2): the same route for `ψ_i`.
- The *Needs* lines of §2.1, §2.2 and §8.2, and the Layer 2 and Layer 8 Dependencies, are updated to match.

## H02 (roed-math) — answered

No README change. AlgebraicTopology is a roadmap on main, and #1652 and #1663 are both revisions of it, so neither is a dependency. The citations follow main (`eaf17b1`), where all five cited items are correct:

- Stage 5 item 1: Eilenberg–Zilber and Künneth.
- Stage 6 item 1: cochains and the universal-coefficient sequence over a PID or hereditary ring.
- Stage 6 item 2: cup and cap products.
- Stage 7 item 1: Euler–Poincaré.
- Stage 8 item 7: finite CW type of compact smooth manifolds.

Both revisions keep the same item numbers. #1663 (`8029fe9`) keeps "Stage N item M". #1652 (`61ee7a2`) has the same content at "Layer N.M": §5.1, §6.1 (which contains the PID/hereditary universal-coefficient sequence), §6.2, §7.1 and §8.7. So if #1652 is the one that lands, the update is the uniform rename Stage N item M → Layer N.M, together with "Stage(s) N" → "Layer(s) N" in the whole-stage citations (README L204, L591, L638), exactly as the comment lists. Naming the merged revision in the pull-request description is the worker's step.

## Overlap with open pull requests (from `scratch/overlaps.md`, checked)

- **DifferentialGeometry Layer 8, dropped by #886 (`a565de6`).** That head drops Layers 6–11 and assigns de Rham theory to DeRhamCohomologyAndDuality. That roadmap's own head (#1768, `1b57dbe`) does not state the absolute de Rham theorem: its Scope section imports "smooth singular chains, the absolute smoothing equivalence, chain integration and the absolute de Rham isomorphism `deRhamEquiv` (layer 8)" from DifferentialGeometry. It is also later in the merge order (line 381) than this roadmap (line 293). So no head gives the content a new home, and #886 is a revision, so not a dependency. The citation therefore stays on main's DifferentialGeometry 8.3–8.5, which was checked: 8.3 smoothing under `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]`, 8.4 `deRhamHom`, 8.5 `deRhamEquiv`.
  - The part of Layer 8 that is already at the Tau Ceti pin is now cited there instead: `TauCeti.SmoothSimplex`, `TauCeti.smoothSingularSubcomplex` and `TauCeti.SmoothSimplex.integral` (README L74, the §0.1 and §0.3 *Needs* lines, and the Layer 0 Dependencies).
  - The DifferentialGeometry contract at L129 is narrowed to the smoothing theorem, Stokes for chains, `deRhamHom` and `deRhamEquiv`.
  - #886 and #1768 disagree about who owns the absolute de Rham theorem. That disagreement is between them and is not settled here.
- **Other open pull requests changing this roadmap:** none. **Ids that only an open revision defines:** none. **Ids this pull request drops that others cite:** none; no section was renumbered.
- **Closest in vocabulary (#987, #974, #1045, #1798):** this roadmap claims no new ownership in this round. The Čech carrier, its pullback and the external product are owned by Tau Ceti, ImplicitAtlases §0.7/§6.5, TopologicalSheafCohomology TS1.1–TS1.2 and CharacteristicClasses C1.2b, and are cited, not stated. Ownership was checked against these sibling checkouts at the heads named above. No notion moved down; no supplier is later in the merge order.

## Adversarial pass on every changed statement

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| L27/L99: ImplicitAtlases §0.7 and C1.2b use one carrier, TS1.2's colimit | ImplicitAtlases `81fc759` §0.7 first sentence and contract; CharacteristicClasses C1.2b text on main; `X = ∅`; `X = pt` | Both define the colimit over point-neighbourhood covers; pin `TauCeti.Topology.cechCohomology` (Colimit.lean:70). `∅`: Čech 0 in all degrees (pin `isZero_cechCohomology_obj_of_isEmpty`), singular 0, `Φ = 0`. Point: `ℚ` in degree 0 on both sides | holds | new contract text |
| L73: the pin has the colimit but no colimit pullback or cup | grep of TauCeti/Topology/Sheaves/Cech | only fixed-family `TopCat.Hom.cechComplexPullback` (Pullback.lean:53); no "cup" in that folder | holds | stated in contract |
| L74: pinned smooth simplices and integral, linear and natural | pin Basic.lean:77, 121; Integral.lean:86; a 0-simplex | `integral_add`, `integral_smul`, `integral_smoothSingularSubcomplexMap_app`; the 0-simplex integral is evaluation (`integral_ofFunction`); a non-integrable integrand gives Bochner 0, excluded for continuous forms (`integrableOn_mpullbackWithin`) | holds; §0.1/§0.3 use smooth `ω`, `η_i` | contract and *Needs* |
| L95: cup = `Δ^*` of the §6.5 external product | `Y = pt`; `Y = S¹` with generator `a`; `Y = T²` with `α, β` | point: `1 ⌣ 1 = Δ^*(1 × 1) = 1`. `S¹`: `a × a` spans `Ȟ²(S¹ × S¹) = ℚ`, `Δ^*(a × a) ∈ Ȟ²(S¹) = 0`, so `a ⌣ a = 0` (as graded commutativity requires). `T²`: swap sign `(−1)^(1·1)` gives `β ⌣ α = −α ⌣ β`, agreeing with §6.1's `g_(αβ) = 1`, `g_(βα) = −1` | holds | new contract text |
| L95: constant coefficients are covered by §6.5 | §6.5 Check `Čech¹(S¹ × S¹; ℚ) = ℚ²` | `ℚ ⊕ ℚ` from the (1,0) and (0,1) summands | holds | stated |
| L252 §2.1: C1.2b identifies `H^*(M̄_(g,n); ℚ)`, `π^*` and cup with their Čech counterparts | `M̄_(0,3)` a point; `|M̄_(1,1)| ≅ S²`; non-CW control: Warsaw circle `W` | point: `ℚ = ℚ`. `S²`: `H⁰ = H² = ℚ` in both carriers, `∫^wt 1 ⌣ [pt]^∨ = 1/2` either way. `W`: `Ȟ¹ = ℚ` but singular `H¹ = 0` (ImplicitAtlases §0.7 Check), so the finite-CW hypothesis is needed and is supplied by D8 | holds with the hypothesis | sentence rewritten; §1.3 dropped |
| L272 §2.2: the right side as C1.2b → §0.7 pullback → cup → `Φ` on constant-sheaf coefficients | `(0,3,0)` on `ℂP¹` with `(pt,1,1)`; `X = pt`, `(1,1,0)`; `X = ∅` | `(0,3,0)`: coarse map space `ℂP¹`, `st` constant, `ev_i = id`, `ψ = 1`, `Φ =` fundamental class (AnalyticStableMaps §13.4 Check), so `I = ∫ pt = 1` (as §2.2 Check 1). `X = pt`: see next row. `X = ∅`: all groups 0, `I = 0` (§0.1 bullet) | holds | paragraph rewritten |
| L284: new Check, `X = pt`, `(1,1,0)` | `m = 0`, `d = 2(0·(−3) + 0 + 1) = 2 = t`, `r = 0`, `ψ = [pt]^∨` | RHS `Φ(st^*[pt]^∨) = 1/2` (AnalyticStableMaps §9.2 Check: half the fundamental pairing). LHS `c · 1/2`, so `c = 1 = χ(pt)`, matching §3.4 "`X = pt`: 1" and §3.1. Wrong model, unweighted LHS: `c · 1 = 1/2`, so `c = 1/2` | holds; discriminates | added |
| L272 §2.2: `𝔬` identified with `ℚ` by AnalyticStableMaps §8.1 | AnalyticStableMaps `9af338e` §8.1 first bullet | trivialized at every point of `X_I^reg`, compatibly with coordinate maps | holds | stated |
| L664 §8.2: `ψ_i` is the §0.7 pullback of the C1.2b image of `c₁` on `ℂP^K` | `X = pt`, `M̄_(1,1)`; `M̄_(0,2)(ℂP¹, ℓ) ≅ ℂP¹ × ℂP¹` | `∫^wt ψ₁ = 1/24` unchanged; `∫ ψ₁ ⌣ ev₂^* pt = −2 + 1 = −1` unchanged (that space is CW, so the C1.2b readings agree) | values unchanged | route made explicit |
| L129: DifferentialGeometry 8.3–8.5 contract | main DifferentialGeometry Layer 8 text | 8.3 smoothing with its four instance hypotheses; 8.4 `deRhamHom`; 8.5 `deRhamEquiv` for T2 σ-compact finite-dimensional `M`. `X` is compact, hence σ-compact | holds | narrowed |
| H02 citations (unchanged) | main `eaf17b1`; #1652 `61ee7a2`; #1663 `8029fe9` | Stage 5 item 1 / 6 items 1–2 / 7 item 1 / 8 item 7 on main and #1663 = §5.1 / §6.1–§6.2 / §7.1 / §8.7 on #1652; #1652 §6.1 contains the PID/hereditary universal-coefficient sequence (2 hits) | holds | none |

Mechanical signature check: `Suggested.lean` declares nothing (its docstring explains why no headline is statable at the pins, which this round does not change). So the scratch `#check @name` file would be empty, and there is no elaborated type to compare. The README backticks no name of this roadmap's own.

Pinned names introduced this round were checked in the pinned Tau Ceti sources, because the resolver reports "Lean names outside TauCetiRoadmap were not checked":

- `TauCeti.Topology.cechCohomology`: Topology/Sheaves/Cech/Colimit.lean:70, `namespace TauCeti.Topology`.
- `TopCat.Hom.cechComplexPullback`: Topology/Sheaves/Cech/Pullback.lean:53, `namespace TopCat.Hom`.
- `TauCeti.smoothSingularSubcomplex` and `TauCeti.SmoothSimplex`: Geometry/Manifold/SmoothSingular/Basic.lean:77 and 121.
- `TauCeti.SmoothSimplex.integral`: Geometry/Manifold/SmoothSingular/Integral.lean:86.

## Sources

No new source was cited and none was fetched; `needs-references.toml` was not written. The changed text cites only roadmaps and pinned declarations.

## Untrusted text

Nothing suspicious in the review text: it makes claims and suggestions only.

## Build and gate

- `lake build TauCetiRoadmap.GromovWittenTheory.Suggested`: `✔ [8976/8976] Built TauCetiRoadmap.GromovWittenTheory.Suggested (8.9s)` — `Build completed successfully (8976 jobs).`
- Gate (after commit `1224c656`): `gate GromovWittenTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 239 roadmaps, 2361 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- Citation resolver on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
