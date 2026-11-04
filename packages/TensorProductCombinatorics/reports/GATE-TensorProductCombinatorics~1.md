# GATE-TensorProductCombinatorics~1: answers to human review

Commits `c07d966f` (the review answers below) and `bfb31d60` (gate repairs, see "Gate repairs") on top of `25f41a9`.

## H01 (roed-math) — applied differently

The defect is real. On main, SchurWeyl Layer 7 stops at finite-alphabet Schur polynomials, the finite Frobenius map and RSK ("stable symmetric-function ring … deferred"), Layer 0 defers evacuation, and nothing on main or at the Tau Ceti pin defines skew or LR tableaux, slides or rectification (grep of the pinned `Combinatorics/Young/*` and `Schur/*`). The suggested repair, citing the SchurWeyl edition `149fe79`, would be wrong. That edition is the head of an open pull request revising an existing roadmap, and such a revision can never be a supplier. Conventions 4 now cites SchurWeyl Layers 0 and 7 only for what they contain on main, plus the native pinned API (`TauCeti.BoundedSSYT`, `TauCeti.diagramSchurPoly`, `TauCeti.hsymm_mul_diagramSchurPoly`, `TauCeti.rowInsert`/`reverseRowInsert`/`rowInsertEquiv`, `TauCeti.symmetricHomogeneousSubmodule`). A new section **H0. Skew tableaux, Littlewood–Richardson tableaux and the stable ring**, placed before H1, owns everything else:
- the skew carrier;
- slides, Knuth equivalence and rectification independence;
- the shape-independence of rectification fibres;
- `LRTableau` with the zero-indexed ballot convention, the tableau-product bijection and the LR rule;
- vertical Pieri;
- standard evacuation;
- graded Λ_R with its Schur basis and specialization maps.

H0 has computed Checks, Examples and Dependencies. The consumers now point at H0: H2.2 (`LRTableau`), H2.3 (LR rule plus ClassicalGroups Layer 4's tensor-multiplicity identification), H6.5 (Λ_ℤ), H8.2 (skew carrier, evacuation), H9 (slides) and the Fulton reference line.

## H02 (roed-math) — applied

Conventions 2: "directions v,w with dot product 1 satisfy `D_v D_w h≤0`" → the statement for unit lattice edge directions only: nonzero `v,w∈{0,±1}³`, coordinate sum 0, `v·w=1`, all four points in Δₙ, p+v and p+w being the obtuse corners. The reviewer's counterexample is recomputed in the text as a negative control: `h=49−x²` on Δ₇, p=(3,4,0), v=(2,−3,1), w=(−3,−1,4) gives `45−24−49+40=12>0`, and its unit-rhombus mixed differences are `−2·v_x·w_x ∈ {0,−2}`, so h is a hive.

## H03 (roed-math) — applied

H2.3: "`π_i-π_(i+1)≥λ₁-λₙ` in the handout's notation" → the hive count of (λ,μ,ν) is `c^π_(λ,ν)` with output π=μ*, the fibre has weight μ*−ν, and the hypothesis is stated directly as `μ_j−μ_(j+1)≥λ₁−λₙ` (dualization reverses the gaps). A negative control is added: n=3, λ=(1,0,−1), μ=ν=0 gives two GT patterns but `c^0_(λ,0)=0`. An exact enumeration over n=3, all dominant λ,ν with entries in [−2,2] and μ in [−6,6] with the gap condition compared `c^{μ*}_(λ,ν)` (via Racah–Speiser) with the GT multiplicity of μ*−ν: 13,327 cases agree and 0 disagree.

## Pattern repair (same defect class as H01)

H2.7 consumed "ClassicalGroups Layer6A" through the edition `fcf0711`. That layer exists only in an open revision of ClassicalGroups; it is absent on main, whose ClassicalGroups headings stop at Layer 6. H2.7 now states its own targets:
- H_sc and H_det;
- the Goursat correspondence via Mathlib `Subgroup.goursatFst`/`normal_goursatFst` (`Mathlib/GroupTheory/Goursat.lean:43,66`), with closedness and connectedness transfer;
- for n≥2, the classification of the closed connected complex intermediate groups, routed through LieGroups Layers 2–4 on main and the ideals of glₙ(ℂ);
- the n=0 and n=1 cases;
- the three restriction comparisons.

It has Checks and a *Needs:* line. The other 18 edition (`blob/<sha>`) links were checked for their cited section on main. The sections exist for TopologicalKTheory T1, ModularCurves 0G, LieGroups Layer 8, AlgebraicTopology Stages 2/6, CharacteristicClasses C2–C3, ComplexKahlerGeometry K7, DifferentialGeometry 10.2 (bullet, line 884), PolarDecomposition PD-A50–A53, HamiltonianReduction R1/R2, ConvexityToric T3, SchubertGeometry S4/S9, GroebnerGeometry G2, RootSystems Layer 3, GrothendieckEulerForms Layers 1–2, ClassicalGroups Layers 3–6 and LieHighestWeight Layer 6. Their contents were not re-audited claim by claim. All 18 are now plain citations by roadmap name and section on main (see "Gate repairs").

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| Unit-edge `D_vD_w h≤0` | v=(1,−1,0), w=(1,0,−1) | p+v,p+w at distance² 2 (obtuse), p,p+v+w at 6 → the rhombus inequality is exactly `D_vD_w h≤0` | holds |
| Same, non-unit directions | reviewer's example on Δ₇ | 12>0 | negative control added |
| Stable range with π=μ* | 13,327 cases, n=3 | 0 mismatches; λ=(1,0,−1), μ=ν=0: 2 vs 0 | binding correct, control added |
| s_{(2,1)/(1)}, d=2 | 4 tableaux | (x₀+x₁)² = s₂+s₁₁ = x₀²+2x₀x₁+x₁² | consistent with LR |
| Rectification of (2,1)/(1) | 1 top/0 bottom; 0 top/1 bottom | row (2); column (1,1); words 01 and 10 insert to the same shapes | Check corrected during the pass (first draft had it reversed) |
| Knuth `021≡201` | insertion | both give rows 01/2; `012`→row, `210`→column | holds |
| `c^(3,2,1)_((2,1),(2,1))` | fillings 001, 010, 100 | ballot keeps 2; without ballot 3; increasing-only 1 | holds |
| Vertical Pieri via ν=(1^r) | ballot forces LR word 0,1,…,r−1, read right to left within a row | at most one box per row (row condition) | wording fixed from "column" to "row" |
| Evacuation | (2,1): 01/2 ↔ 02/1; (2,2): both fixed; complement map on 01/2 gives 21/0 | computed by hand slide by slide | Check corrected during the pass (first draft said (2,1) fixed) |
| Λ_R ranks | Λ^4_ℤ rank p(4)=5 vs 3 in 2 variables; d=1: s₁₁↦0, s₂↦x₀² | | holds |
| H0 Examples | c^{(2)}_{(1),(1)}=1, c^{(321)}=2 at rank 3 | | holds |
| Goursat for Δ≤H≤P | N↦{(g,h): gh⁻¹∈N} closed under products by normality; H≅N×G as spaces | | holds; closed/connected transfer holds |
| Overgroup classification | n=1: H_sc=P, H_det=Δ; real subgroup {(rg,g): r>0} is closed connected, not complex | | complex hypothesis needed, Check added |
| Restriction | n=2, λ=μ=(1,0): V⊗V=V₍₂,₀₎⊕V₍₁,₁₎; on H_sc each summand carries χ(c)=c^{|λ|}=c; H_det ⊇ SL₂×SL₂ | | holds |

The pre-provided signature elaboration was unavailable because a Tau Ceti dependency's object file was missing (`GelfandTsetlin`; that import is now dropped). The only Lean commands this job may run are the module build and the gate, so no scratch `#check @name` file was elaborated. The binders were checked by hand instead. Every changed or new declaration carries its hypotheses in its own signature. The section variables `{r ι} [Fintype ι] [DecidableEq ι]` reach `exists_chamberPolynomial` through `Fintype.card ι` and `count`; `DecidableEq ι` is used by none of the new statements.

## Sources and ownership

- The Knutson handout was fetched as `KnutsonHives` (author page), but its text layer is glyph names and this worker has no OCR or PDF rendering, so H02 and H03 were verified by computation, not against the handout text.
- Fulton, *Young Tableaux* (§§1–3, §5.1, Appendix A) is cited by locator as a standard textbook (paywalled, uncertified). This job may not edit `sources.toml`, so it is not recorded there.
- The H0 objects are planned by SchurWeyl's open revision, which cannot be a supplier. This roadmap owns them until that revision is on main. Whether to swap H0 for an import if it merges first is a human decision.
- Ownership of the H2.7 group statements is parallel: they move here from ClassicalGroups' open revision.

## Gate repairs

These were made in commit `bfb31d60`. They are not review points; they repair the gate failures listed for this job.

- **blob=18 → 0.** The 18 `[Name §](…/blob/<sha>/…)` edition links in README Conventions 4–9, H1.5, H2.6 and H8 are now plain citations by roadmap name and section. Each section was confirmed as a heading or bullet on `origin/main`: ClassicalGroups Layers 3–6, LieHighestWeight Layer 6, TopologicalKTheory T1, ModularCurves 0G, LieGroups Layer 8, ReductiveGroups, AlgebraicTopology Stages 2–6, CharacteristicClasses C2–C3, ComplexKahlerGeometry K7, DifferentialGeometry 10.2, PolarDecomposition PD-A50–A53, HamiltonianReduction R2, ConvexityToric T3, SchubertGeometry S4.1–5, GroebnerGeometry G2, RootSystems (type-A realization, Layer 3) and GrothendieckEulerForms Layers 1–2.
- **tex=4 → 0.** In README H2.1, H2.2 and H4, the formulas `Σ_{r≤j}`, `a_{ij}` and `max_{…}` are now `Σ_(r≤j)`, `a_(i,j)` and `max_(…)` inside code spans.
- **imports/mathlib-subimports/no-import-mathlib → 0.** The imports are now `import Mathlib` followed by the four Tau Ceti modules the statements actually use:
  - `RepresentationTheory.ClassicalGroups.DominantWeight`;
  - `Analysis.Convex.Polyhedron`;
  - `LinearAlgebra.RootSystem.Positive`;
  - `LinearAlgebra.RootSystem.KostantPartition.Basic`.

  The leading comment is now a module docstring, "Tensor product combinatorics: target signatures". It names each data construction that stays a README target.
- **sorry-data=16 → 0.**
  - `castReal` now has a real body: it casts values, with `normalized` by `simp` and `rhombus` by `exact_mod_cast`. `boundary_castReal` is proved by `simp`.
  - The `Finite` instance is now the theorem `finite_fixedIntegerHive`.
  - `chamberPolynomial` is replaced by `exists_chamberPolynomial`: ∃ P with total degree ≤ |ι|−r that equals the count at the lattice points of the closed chamber. `chamberPolynomial_wall` is restated for any two such representing polynomials P and Q.
  - `typeAPolynomial` and its two theorems become `typeA_exists_chamberPolynomial`, with degree ≤ (N−1)(N−2)/2.
  - `typeACount_eq_native` is stated directly instead of through `nativePartitionEquiv`.
  - The excavation associator and the hive commutor are replaced by their count statements `card_leftPair_eq_card_rightPair` and `hiveCount_comm`. README H2.5 already claims hive-ring associativity and commutativity.
  - Removed as sorry'd data, together with everything that mentions them: `hiveToGT` (and its injectivity theorem), `finiteEdgeDirection`/`HoneycombConfiguration`/`hiveHoneycombEquiv` with `UnitTriangle`, `pathRaise` (and `simpleRoot`, `pathRaise_endpoint`), `realExcavationAssociator` (and `FixedRealHive`, `RealDominantWeight`, `dualRealWeight`, `realProductBoundary`), and `pieceCells`/`pieceLabel`/`Puzzle`/`puzzleBoundary`/`puzzle_boundary_balance` (and `orientation`, `vertexCode`, `PuzzleRhombus`, `PuzzlePiece`).
  - `rootVector` and `rootLatticeEquiv` (with `RootLattice` and `simpleCoordinates`) are removed. They had `sorry` proof fields, and nothing else used them.
  - The README names none of the removed declarations in backticks, so README is unchanged by this item. `RationalPath n`, which the README names, is kept.

| New or changed statement | Instances | Values | Result |
|---|---|---|---|
| `castReal` | n=1, h=(0,a,b) | the cast hive is (0,a,b); no rhombi at n=1 | real body, elaborates |
| `hiveCount_comm` | n=1; n=0 | n=1: boundary (λ,μ,−γ) forces h(B)=λ, h(C)=λ+μ=γ, count 1 iff γ=λ+μ, symmetric in λ,μ. n=0: one hive on both sides | holds |
| `card_leftPair_eq_card_rightPair` | n=1; n=0 | n=1: left has σ=λ+μ, π=σ+ν; right has τ=μ+ν, π=λ+τ; both are 1 iff π=λ+μ+ν, else 0. n=0: 1=1. Only finitely many σ have nonempty fibres, so `Nat.card` is not the junk value 0 | holds |
| `exists_chamberPolynomial` | r=0 | `hpos` forces ι empty; count=1 and P=1 has degree 0 ≤ 0 | holds |
| `exists_chamberPolynomial` | interval matrix, N=3 | count = min(a,b)+1 on the chambers a≤b and b≤a: P=a+1, resp. b+1, degree 1 = 3−2 | holds |
| `chamberPolynomial_wall` | N=3 chambers {a≤b}, {b≤a} | P=a+1 and Q=b+1 agree on the wall a=b at real points | holds |
| `typeA_exists_chamberPolynomial` | N=2; N=3 | N=2: count is 1 on a≥0, P=1, degree 0 ≤ 0. N=3: degree 1 ≤ 1 | holds |
| `typeACount_eq_native` | unchanged statement | now `sorry` instead of `Nat.card_congr` of a sorry'd equivalence | same content |

Ownership against open pull requests for the changed Lean statements: they are restatements of this roadmap's own existing targets (H1.5, H2.5, H2.6, H3, H9), and no new object was introduced.

## Build and gate

- `lake build TauCetiRoadmap.TensorProductCombinatorics.Suggested`: `Build completed successfully (8984 jobs).` The only diagnostics are `declaration uses 'sorry'` warnings.
- Depcheck: `depcheck: 154 roadmaps, 1046 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Gate summary line at `bfb31d60`:

`gate TensorProductCombinatorics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
