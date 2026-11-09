# Review of ArithmeticStatisticsPartII (pull request #1173 at 208c897)

**Verdict:** needs changes

🤖 Independent AI review, incremental: 18 changed README lines since 86c4511. The mathematics of the changed passages is correct. The new supplier cannot be placed before this roadmap in the merge order, the previous docstring finding is still open, and the gate fails one statement-hygiene check.

## R01 (P2) — QuadraticFormsOverABase is an upward supplier

Location: `TauCetiRoadmap/ArithmeticStatisticsPartII/README.md:58–60`, the §1.3 *Needs:* line at :344 and Layer 1 Dependencies at :2119. The wording that depends on it is at :296, :298, :306, :316 and :342. The quoted contract reads: “From QuadraticFormsOverABase §§1.1–1.3 require the half-discriminant … Section 1.3 here evaluates them at n = 3 as `4 Det`; it constructs no second half-discriminant”.

Claim: the diff makes QuadraticFormsOverABase a supplier of §1.3. That roadmap is an open new-roadmap pull request (#1930, head 464f81f) and is not in the merge order. Its own suppliers sit after this roadmap (position 112): OrthogonalTamagawaAndLatticeMass at 149, GeometryOfNumbersAndQuadraticArithmeticPartII at 392 and HyperellipticCurves at 394. Wherever it is inserted, an edge points upward. The board's dependency check reports no problem only because it skips roadmaps the order does not list. The description's dependency list and merge-order paragraph also omit #1930.

Witness: these are the dependency-check runs on scratch copies of the order.
- QuadraticFormsOverABase placed after its last supplier gives `UPWARD: ArithmeticStatisticsPartII (#112) -> QuadraticFormsOverABase (#395) at README lines [58, 344, 2119]`.
- QuadraticFormsOverABase placed just before this roadmap gives three UPWARD lines from it, numbered in the shifted scratch order: to #393 (QFOAB lines 734, 797), to #395 (lines 930, 953) and to #150 (lines 645, 797).

Repair: move the notion down into this roadmap, as at 86c4511.
1. Define `4 Det` in §1.3 as the displayed six-coefficient integral polynomial.
2. Prove `4 Det(Q∘Mᵀ) = (det M)² 4 Det Q` as a universal polynomial identity. Over `ℚ[a,m]`, `4 Det` is `4 · QuadraticForm.discr'`, and Mathlib `QuadraticForm.discr'_comp` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1250`, under `Invertible 2`) gives the identity there. The injection `ℤ[a,m] ↪ ℚ[a,m]` brings it down to `ℤ[a,m]`, and evaluation specializes it to every R.
3. Delete the `From TauCetiRoadmap.QuadraticFormsOverABase` subsection and the QuadraticFormsOverABase items in :344 and :2119. If you want, name QuadraticFormsOverABase §§1.1–1.3 under Downstream consumers as the odd-rank generalization.

Test: 86c4511's self-contained §1.3, checked against the order with QuadraticFormsOverABase after HyperellipticCurves, gives `depcheck: 236 roadmaps, 2271 edges, 0 problem(s)`. There is an alternative. If QuadraticFormsOverABase is split so that its Layers 0–1 form a roadmap whose suppliers all come before position 112, cite that roadmap and name it in the description's dependency list.

## R02 (P3) — The docstring still omits §1.2's non-statable headlines

Location: `TauCetiRoadmap/ArithmeticStatisticsPartII/Suggested.lean:23–39`. It reads “Cubic normalization and equivalence are inputs from AnalyticNumberTheoryPartII §5.5 … The other headline signatures require objects absent from the pinned libraries. The quartic and quintic ring dictionaries”.

Claim: this is the previous R01, still not repaired. The missing-carrier inventory does not explain why §1.2's headlines are absent from the Lean file.

Witness: `README.md:250,266,280` state the Davenport–Heilbronn maximality criterion and the index-p subring and overring counts, and `README.md:3` promises them. The docstring names §§1.3–1.4, 1.8–1.13 and 1.15–1.16, but not §1.2. `Suggested.lean` is byte-identical to its 86c4511 version.

Repair: add one docstring sentence. It should say that §1.2's maximality criterion and its index-p subring and overring counts need a carrier that is absent at the pins: the integral cubic ring of a binary cubic form, including degenerate ones, with its subrings and overrings. Mathlib `Cubic` carries coefficients only. No substitute theorem is needed. The sentence covers both test cases from the previous round: the split ring has three index-2 subrings, and the square-zero ring has three index-2 overrings.

## R03 (P3) — Gate failure: `cubicInvariant` chooses its datum

Location: `TauCetiRoadmap/ArithmeticStatisticsPartII/Suggested.lean:126–131`. The body reads “`if h : ∃ u : (curveIJ I J).Aˣ, ∃ x y : K, … then QuotientGroup.mk (Classical.choose h) else 1`”.

Claim: the gate fails on this definition. The choice also hides the README API “`z(g)` is the class of `G(x,y)` for every admissible `(x,y)`” (`README.md:764`). With f = g, the headline at :147 is the trivial `z = z ↔ IsProperlyEquivalent f f`, so it never states that z is independent of the point. The fallback also gives the zero quartic the value 1, although it has no admissible point.

Witness: `statement-hygiene: line 131: P3 def cubicInvariant chooses its datum (Classical.choose)`.

Repair: take the point as an argument, as the gate suggests.
- Define `def cubicInvariantAt (I J : K) (f : Fin 5 → K) (x y : K) (hu : IsUnit (irrationalCovariant I J f x y)) : (curveIJ I J).M := QuotientGroup.mk hu.unit`.
- Restate the headline at :147 as `(∃ x y, IsUnit (irrationalCovariant I J f x y)) ∧ ∀ x y x' y' hu hv, (cubicInvariantAt I J f x y hu = cubicInvariantAt I J g x' y' hv ↔ IsProperlyEquivalent f g)`.
- State :162 at every admissible point `(x, y, hu)`.
- In :179, replace `cubicInvariant I J f = m` with `∃ x y hu, cubicInvariantAt I J f x y hu = m`.
- Rename the backticked name at `README.md:762`.

Test: a scratch copy elaborates with exactly seven `sorry` warnings and no `Classical.choose`. For `x³y−xy³` (I=3, J=0), the f = g instance now states something checkable: the class at (1,0) is (1,1,1), the class at (1,2) is (25,49,1), and both are squares.

## Previous findings

- R01 — not repaired: `Suggested.lean:23–26` still reads “Cubic normalization and equivalence are inputs from AnalyticNumberTheoryPartII §5.5 … The quartic and quintic ring dictionaries (§§1.3–1.4, 1.10–1.11, 1.15)”, with no sentence naming §1.2 (now R02).

## Verified sound

**Scope.** This is an incremental re-review of the 18 changed lines since 86c4511, all in `README.md`. `Suggested.lean` and `metadata.toml` are unchanged. Against merge base 01daf25, `git diff --stat origin/main...HEAD` outside the folder is empty. The 920 outside paths listed among the changes come from merging main into the branch. The worktree is clean, and no roadmap file or manifest was edited.

**Gate.** The independent rerun gives the same result as the worker's:

```text
gate ArithmeticStatisticsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=1 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The only failing check is R03. The worker's targeted build passed (`build=0`).

**Dependency check** (the brief's command, real order):

```text
depcheck: 236 roadmaps, 2271 edges, 0 problem(s)
```

It has no UPWARD, CYCLE or moved line. R01 records the edge this run cannot see, with the scratch-order runs as witness. QuadraticFormsOverABase as a candidate gives `checked as if placed after HyperellipticCurves … 0 problem(s)`. The other suppliers are unchanged from [r3].

**Elaboration.**
- `lake env lean` on `Suggested.lean` at the current pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d, both moved by the merge with main) gives exactly seven `sorry` warnings, at lines 144, 150, 159, 165, 174, 182 and 189.
- `signatures.md` lists all 22 declarations and shows no lost binder. They are unchanged from [r3], whose comparison with the README stands.
- One-tactic probes: `simp`, `rfl` and `infer_instance` each fail on all seven theorems, so none is padding.
- The R03 repair probe also elaborates, with seven `sorry` warnings.

**Changed passages, mathematics.**
- QuadraticFormsOverABase's δ′ at n = 3 is `4abc+uvw−au²−bv²−cw²` (QFOAB README §1.1 Check). Under a=a₁₁, b=a₂₂, c=a₃₃, u=a₂₃, v=a₁₃, w=a₁₂ it is term by term §1.3's `4 Det`.
- QFOAB's `Q.comp (toLin' g)` with g = Mᵀ is §1.3's `Q∘Mᵀ`.
- The specialization of the pencil at `(x,y) = (1,0)` is the API bullet at :334.
- The contract is accurate. Its only defect is the order (R01).

**Cross-roadmap citations resolved** (QuadraticFormsOverABase at #1930, head 464f81f):
- README §1.1 states `univHalfDisc`, §1.2 states `halfDisc`, and §1.3 states `halfDisc_mapCoeffs` (every n), `halfDisc_comp` (odd n, `(det g)²`) and the `aⁿ` scaling rule.
- Its Suggested.lean declares them at lines 103, 113, 133 and 138.
- Its Downstream consumers list this roadmap's §1.3, so the two roadmaps agree on direction.
- ArithmeticStatisticsPartI (#1171) and ArithmeticStatisticsPartIII (#1174) cite the same roadmap; their own reviews cover that.

**Ownership.**
- The pins have no division-free ternary half-discriminant. `QuadraticForm.discr'` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1242`, with `discr'_smul` at :1247 and `discr'_comp` at :1250) sits under `variable [Invertible (2 : R)]` (:1159).
- Remark, no change requested here: ArithmeticStatisticsPartIII's `Counting.ternaryDet4` (its README :1186) is the same polynomial. After R01's repair it should cite §1.3.

**Pinned declarations opened.**
- Tau Ceti `MordellWeil/XSubT.lean`: `A` at :299, `M` (`Aˣ ⧸ range (powMonoidHom 2)`) at :346, `μX_of_eval_f_ne_zero` at :633, `μ` at :861 and `normM` at :1058.
- Tau Ceti `MordellWeil/SelmerGroup.lean`: `selmerGroup₂` at :104 and `mem_selmerGroup₂_iff` at :111.
- Tau Ceti `MordellWeil/LocalCondition.lean`: `localRes_comp_μ` at :253.
- Tau Ceti `MordellWeil/TwoTorsion.lean`: `card_ker_nsmul_two` at :57.
- Tau Ceti `Resolvent/Quartic/Basic.lean`: `quarticD4Invariant` at :74 and `resolventCubic` at :243.
- Tau Ceti `Resolvent/Quintic/Basic.lean`: `resolventSextic` at :223.
- Tau Ceti `NumberField/Monogenic.lean`: `isMonogenic_iff_exists_index_eq_one` at :90.
- Mathlib `Algebra/Group/Units/Defs.lean`: `IsUnit.unit` at :495.
- That makes 17 declarations, counting the three Mathlib `QuadraticForm` declarations above. The citation resolver finds every library name in the README.

**Source check of the sampled passage that changed** (§1.3, “Pairs of ternary quadratic forms”). I read ref-9 (README [6], HCL III, publisher open archive) through the sources service.
- Lines 445–455 (Section 3.1, (11), printed p. 1339): half-integral off-diagonal entries and the action.
- Lines 457–468 (p. 1340): the invariant `4·Det(Ax+By)`, with the factor 4 included for integrality.
- Lines 531–553 (Section 3.2, (19)–(20), p. 1342): the coefficient form and `λ` as a 2×2 determinant.
- The locators, the `+By` sign remark and the `λ` formula are all correct. The other seeded targets were untouched by the diff, so their evidence is [r3]'s.

**Adversarial pass: changed statements, with fresh values.**

| Statement | Instances and computed values | Result |
|---|---|---|
| Contract :60, δ′ at n=3 = `4 Det` | `x₁²+x₂²+x₃²`: δ′=4 and polynomial=4, but polar det 8 and Gram det 1. `xy+xz+yz` over 𝔽₂: δ′=1 both ways, polar det 2=0. `x₁x₃−x₂²`: 1=1. | Agree. The polar-det and Gram-det wrong models are excluded. |
| `4 Det(Q∘Mᵀ)=(det M)² 4 Det Q` via `halfDisc_comp` (:316) | M=[[1,1,0],[0,1,0],[0,0,1]]: `Q(Mᵀt)=2t₁²+2t₁t₂+t₂²+t₃²`, 4Det=8−4=4=1²·4, Gram MMᵀ off-diagonal 1=a₁₂/2. M=diag(2,1,1): 16=2²·4. | Direction g=Mᵀ is correct. |
| `aⁿ` scaling (:60) | 2(x₁²+x₂²+x₃²): 4·8=32=2³·4. Using exponent 2 would give 16. | Correct at n=3. |
| Pencil over R[x,y] (:342) | A₁=x₁x₃−x₂², B=(a,b,c,d,e): δ′(Ax−By)=x³+cx²y+(bd−4ae)xy²+(ad²+b²e−4ace)y³, the README Check at :352. At (1,0): 1=4Det A₁. g₃=diag(2,1,1): x³-coefficient 4=2²·1. | Correct. |
| Supply direction (:58, :344, :2119) | This roadmap at 112. QFOAB at 395 after its last supplier gives UPWARD. QFOAB at 112 gives UPWARD to 150, 393 and 395. The self-contained text gives 0 problems. | R01. |
| `cubicInvariant` (Lean :126) | Zero quartic: old value 1 with no admissible point; new definition not applicable. `x³y−xy³` at (1,0): G=1, class 1. At (1,2): g=−6, g₄=75, G=(8T+75)/3 on T=0,9,−9 is (25,49,1), all squares. | R03 repair checked. |
| Docstring vs §1.2 (Lean :23–39) | Three §1.2 headline families (README :250, :266, :280), zero named in the docstring. Split ring: 3 index-2 subrings. Square-zero ring: 3 index-2 overrings. | R02. |

**Carried adversarial rows.** [r3] is `packages/ArithmeticStatisticsPartII/reports/PRREVIEW-ArithmeticStatisticsPartII~3.md`. Each row below repeats its computed values for a statement this diff leaves untouched. The [r3] row for “Pairs of ternary quadratic forms” is replaced by the fresh rows above.

| Statement (untouched) | Values carried from [r3] | Result |
|---|---|---|
| Cubic equivalence imported (summary/scope) | xy(x−y): rank 3, trace det 1 in both suppliers; zero form: det 0 | keep [r3] |
| §1.1 based index-form adapter | basis det 1; at (1,2),(2,1),(0,1),(1,1): −2,2,0,0 both sides; negating both vectors gives −f | keep [r3] |
| Based stabilizer coordinates | S=[[0,1],[1,0]], T=[[1,−1],[0,−1]]; (ST)⁻ᵀ=[[−1,−1],[1,0]] | keep [r3] |
| Composition API | S⁻ᵀT⁻ᵀ=(ST)⁻ᵀ; transpose-only gives TᵀSᵀ≠SᵀTᵀ | keep [r3] |
| Cardinality weights | split 6=6, weight 1/6; Q(∛2) 1=1; square-zero infinite | keep [r3] |
| Reducible forms | y(x²+y²) root (1:0); x³−2y³ field | keep [r3] |
| All-field étale comparison | split det 1; K[t]/t³ det 0; u³−t over 𝔽₃(t) a field, discriminant 0 | keep [r3] |
| Small overrings | x³+y³, p=3: −27/−3=9, index 3; Z+3R index 9 | keep [r3] |
| DH sets and maximality | xy(x−y) disc 1 in every U_p; x³+y³ fails U₃ (a=0, b=3) | keep [r3] |
| Index-p subrings | p=2 split: 3=3; zero form: 3=3 | keep [r3] |
| Index-p overrings | zero form p=2: 3=3; split: 0=0 | keep [r3] |
| Quartic ring/resolvent | split Z⁴,Z³ disc 1=1; square-zero 0=0 | keep [r3] |
| Quartic ring of a pair | test pair trace det −27 = disc(x³+y³) | keep [r3] |
| Quartic parametrization | −27=−27; zero pair ranks 4,3, disc 0=0 | keep [r3] |
| Full-lattice order comparison | Z+2Z⁴ index 8, disc 64 vs 1; D[ε] adjoin ε/π index q | keep [r3] |
| Quotient by scalars free | A=R rank 0; (Z/4)³ det 1 | keep [r3] |
| Quartic minors | one minor 1, content 1; proportional rows all 15 minors 0 | keep [r3] |
| Integral minor fibres | content 1: 1 class; content 2: 1+2=3 | keep [r3] |
| Quartic invariant index | Z+2Z⁴ content 2 vs ring index 8 | keep [r3] |
| Number of resolvents | content 1→1, content 2→3 | keep [r3] |
| Quartic maximality at p | index 8=2³, disc 64 vs 1 | keep [r3] |
| Splitting types | x⁴−y⁴ mod 5: roots 1–4; resolvent roots 0,1,4; disc 4=4 | keep [r3] |
| Quinary alternating quadruples | 40 coordinates; 𝔽₂ [1] skew but not alternating | keep [r3] |
| PGL₂ orbits of quartics | diag(2,1): I=−12, J=0 both; scalar 2I acts by 1, untwisted ×16 | keep [r3] |
| Soluble quartics | x⁴−y⁴ at (1,1); −x⁴−y⁴ no real point | keep [r3] |
| Covariants | x⁴−y⁴ at (1,2): −15, 192, −1088; x³y: 2, 3, 1 | keep [r3] |
| Syzygy | 31,961,088 both; 27 both; (1,2,3,4,5): 44,208,052,992 both | keep [r3] |
| Cubic invariant | infinity quartic G=1; zero quartic fallback 1 (R03) | keep [r3] |
| Orbit invariance | x⁴−y⁴ and its diag(2,1) transform: class 1 both | keep [r3] |
| Linear-factor forms | x³y−xy³ at (1,0): G=1=(3g₆/h)² | keep [r3] |
| Auxiliary quartic root | g₁=g₂=x⁴+xy³: I=0, J=−27, r=8; nonsingular −729 | keep [r3] |
| Comparison quartic | r₂²=64=1³·64; x³y vs 0 excluded | keep [r3] |
| Orbit determination | equal class, proper equivalence; singular pair excluded | keep [r3] |
| Quartic of a point | y²=x³−81x: O→(0,1,0,−1,0), (0,0)→(1,0,0,0,1/4); I=3, J=0 | keep [r3] |
| Invariant of point quartic | (1,−4,−9) vs (9,−81,−9): ratios squares | keep [r3] |
| e mod 2e over 𝔽₅ | 120 quartics, 2 orbits of 60; E 10 points, E[2] 2 | keep [r3] |
| Bilinear factor criterion | det 1; x⁴−y⁴: 2 self-equivalences over Q, 4 over Q(i) | keep [r3] |
| Stabilizer two-torsion | 1+1=2; 𝔽₅ 120/60=2 | keep [r3] |
| Image of cubic invariant | m=1 det −1 isotropic; m=2 norm 8 nonsquare; 9604=98² | keep [r3] |
| Two-Selmer dictionary | x³y−xy³ class 1, norm 1, restrictions 1 | keep [r3] |
| Primitive vectors extend | det 1; (2,4,0) forces even det | keep [r3] |
| Ternary cubic invariants | c₄=48, c₆=0, Δ=64; 48³=1728·64 | keep [r3] |
| Their invariance | scaling 2: ×2⁴, ×2¹² | keep [r3] |
| Projection from a point | I=48=c₄, J=0=2c₆ | keep [r3] |
| Projected quartic invariant | class 1 = μ(O); invariants (48,0) | keep [r3] |
| Local integral representatives | A=−1, B=0: f=4x³y−4xy³, I=48, J=0, at p=2,3 | keep [r3] |
| Integrality from local integrality | v₂(1/2)=−1 excluded; −4 integral | keep [r3] |
| Integral representatives | 4A³+27B²=−4≠0; A=B=0 excluded | keep [r3] |
| Two-Selmer parametrization | (3,0)→(48,0); 16³=2¹² | keep [r3] |
| Cohomological comparison | identity ↦ 1 and 0 at all places | keep [r3] |
| Embedding into pairs | x⁴−y⁴ ↦ x³+4xy², disc −256 both | keep [r3] |
| SO of the Veronese form | ρ(−I₂)=I₃; determinant-2 lift impossible | keep [r3] |
| Embedding orbit bijection | disc 0 vs −4 separated | keep [r3] |
| Fibre bound | N=10→20, N=12→24 | keep [r3] |
| Binary local maximality | p=2: 44/64=11/16; p=3: 630/729=70/81 | keep [r3] |
| Density formulas | 3/8, 176/243; printed 1600/2187 vs 1584/2187 | keep [r3] |
| Quintic multiplication | A=0 gives eᵢeⱼ=0; weights 2⁵, 2¹⁰ | keep [r3] |
| Sextic multiplication | disc factor 16³=4096 vs 1 | keep [r3] |
| Based sextic resolvent | Z[t]/t⁶ has e₁²≠0 at equal disc 0 | keep [r3] |
| Rational symmetric closure | 120=24·5=20·6 | keep [r3] |
| Nondegenerate resolvent | index 64, 64²=4096 | keep [r3] |
| Integral quintic realization | Q[t]/t⁵ not realized by A=0 | keep [r3] |
| Quintic minimal model | index 16, disc 256 vs 1 | keep [r3] |
| Quintic parametrization | zero tensor ranks 5, 6, disc 0, 0 | keep [r3] |
| Quintic maximality at p | 256=2⁸, not a tenth power | keep [r3] |
| Monogenized resolvent | t, t+2 index 1; −t differs | keep [r3] |
| Wood ring | x⁴−y⁴ → x³+4xy², index 1 | keep [r3] |
| Common isotropic | zero pencil on 𝔽₂³: 7 lines; mixed value 1 | keep [r3] |
| Regular pencil Fano | 4 points over C, none over R | keep [r3] |
| Oriented ideal triples | N(cI)=2, N(c²)=4=s′² | keep [r3] |
| Integral pencil orbits | 8 signs, 4 with product 1; quotient 4 | keep [r3] |
| Oriented norm pairs | c=(−1,1,1): c²=1, N=−1 | keep [r3] |
| Field pencil stabilizers | 8 → central quotient 4 | keep [r3] |
| Pencil existence | −1 not a norm times a square; torus dim 1 vs 0 | keep [r3] |
| Pencil Fano torsor | dims 1, 2; class 0 | keep [r3] |
| Kummer/Selmer adapter | E(𝔽₅) 9 points; kernels 4, 16 | keep [r3] |
| Locally soluble pencils | lift 0; empty cover set has no origin | keep [r3] |
| Integral soluble pencils | 2^(4i): 16, 256, 65536 | keep [r3] |
| Quartic monicization | I ×4, J ×8, Δ ×64 | keep [r3] |
| Marked Selmer embedding | antidiagonal det 1; −x⁴−y⁴ vs x⁴+y⁴ | keep [r3] |
| Weak divisibility | −2151≡0, −3840≡3 mod 9 | keep [r3] |
| Q hyperdeterminant | dets −1, −1, 0; ×4, ×64 | keep [r3] |
| Q divisibility | Δ=5, Q²=1; Gram product 2∤5 | keep [r3] |
| Marked Q | Q=−1, then +1; rational diag(2,1,1/2): 2 | keep [r3] |
| Odd weak lift | values 1, 9, 9, 13, 71 both; Q=−3 | keep [r3] |
| One matrix slice | antidiag dets −1, +1; x⁴+1 over Q(√2) | keep [r3] |
| Even weak lift | Δ(xf)=−256; zero constant gives 0 | keep [r3] |
| Characteristic-five presentation | 𝔽̄₅: Δ=4, j=2; stabilizers 8, 18, 32 | keep [r3] |
| Quartic étale resolvent | split Q³ disc 1=1; 4-cycle orbits 1, 2 | keep [r3] |
| Good-prime pencils | Q₅: 4 orbits, 4 stabilizers | keep [r3] |
| Degree 3–5 descent | 9, 16, 25 vs 18, 32, 50 | keep [r3] |
| Divided cubic discriminant | D=1, 16, 64; wrong substitution −23 | keep [r3] |
| Three-isogeny mirror | D̂=−3; 324=−27·(−12); mass 1/3 | keep [r3] |

| Lean declaration (untouched) | Values carried from [r3] | Result |
|---|---|---|
| `cubicInvariant_determines_orbit` | diag(2,1) pair: class 1 both; x³y vs 0 excluded by hΔ | R03 restates |
| `solubleOrbit_bijection` | 𝔽₅: 120/60=2=10/5 | keep |
| `cubicInvariant_quarticOfPoint_eq_mu` | ratios (1/9, 4/81, 1); O: 1=1 | R03 restates |
| `stabilizer_twoTorsion` | Q: 2=2; 𝔽₅: 2=2; C: 4 | keep |
| `mem_selmerGroup₂_iff` | identity quartic, all places | R03 restates |
| `exists_integral_local` | A=−1, B=0, p=2,3 | keep |
| `exists_integral` | same tuple, all p | keep |
| `form`, `eval` | (1,0,0,0,−1): exponents (4,0),(0,4); −15 at (1,2) | keep |
| `invI`, `invJ` | −12, 0; (1,2,3,4,5): J=270 | keep |
| `twistedForm`, `IsProperlyEquivalent` | 4x⁴−y⁴/4; scalar 2I fixes | keep |
| `IsSoluble`, `IsEverywhereLocallySoluble` | (1,1,0) vs no real point | keep |
| `curveIJ` and its instances | I=3,J=0: Δ=34012224; I=J=0: Δ=0 | keep |
| `quarticOfPoint`, `hessian`, `irrationalCovariant` | 48x²y²; 192 at (1,2); product 36 | keep |

## Not verifiable

- I carry the access limitation from [r3]. ref-53 (O’Dorney, *Rings of small rank over a Dedekind domain and their ideals*, DOI 10.1186/s40687-016-0054-0) is uncertified, so its unchanged locators remain uncertified.
- Unchanged sampled locators and the source gap in ref-10 (the nonétale quintic realization) rely on [r3]. A `sorry` build checks elaboration, not the truth of the seven headlines.

## Source issues

- none
