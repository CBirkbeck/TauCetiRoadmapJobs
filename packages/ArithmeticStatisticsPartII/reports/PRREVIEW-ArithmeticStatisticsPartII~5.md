# Review of ArithmeticStatisticsPartII (pull request #1173 at 30098d6)

**Verdict:** needs changes

🤖 Independent AI review, incremental: 105 changed lines since 208c897 (47 in `README.md`, 58 in `Suggested.lean`). The three previous findings are repaired in the roadmap folder, the gate passes, and the mathematics of every changed passage checks out with computed values. One defect remains, outside the folder: the pull-request description still declares QuadraticFormsOverABase as a supplier that merges first, although the README no longer consumes it and it cannot precede this roadmap.

## R01 (P3) — The description still lists QuadraticFormsOverABase as a supplier

Location: the pull-request description, `**Depends on**` list (“#1930 QuadraticFormsOverABase”) and the merge-order paragraph (“#1747 (PCurvature, mycaule) → #1930 (QuadraticFormsOverABase, mycaule) → #1006 …”).

Claim: at this head the README cites QuadraticFormsOverABase only under Downstream consumers (`README.md:2128`), as the odd-rank generalisation of §1.3; the `From TauCetiRoadmap.QuadraticFormsOverABase` subsection, the §1.3 *Needs:* item and the Layer 1 Dependencies item are gone. The description nevertheless says the pull request waits for #1930 to merge first. That wait can never end: QuadraticFormsOverABase is not in the merge order, and its own suppliers sit after this roadmap (position 112): OrthogonalTamagawaAndLatticeMass at 149, GeometryOfNumbersAndQuadraticArithmeticPartII at 392 and HyperellipticCurves at 394. A supplier list that names it reintroduces, at the board level, the upward edge that the README repair removed. (The previous review's R01 named the description's dependency list as part of the same defect.)

Witness: `README.md` has no occurrence of `QuadraticFormsOverABase` or `halfDisc` other than line 2128; the dependency check on the real order gives `depcheck: 236 roadmaps, 2273 edges, 0 problem(s)`; the description's two blocks quoted above name #1930.

Repair: remove #1930 from the `Depends on` list and from the merge-order paragraph (regenerating both blocks from the README's citations does this). Nothing in the roadmap folder changes.

## Previous findings

- R01 — partly repaired: the README is self-contained (“define four times the ternary determinant by the displayed integral coefficient polynomial … When 2 is invertible in R it equals `4 • QuadraticForm.discr'`”, `README.md:298`); the subsection at the old :58–60 and the items in the *Needs:* line and the Dependencies paragraph are deleted; QuadraticFormsOverABase is named only under Downstream consumers. The description still lists #1930 as a supplier merging first: this report's R01.
- R02 — repaired: `Suggested.lean:28–31` reads “The Davenport–Heilbronn maximality criterion and the counts of index-p subrings and overrings (§1.2) need the cubic ring of an integral binary cubic form, degenerate forms included … Mathlib's `Cubic` records coefficients only.”
- R03 — repaired: `Suggested.lean:132–134` defines `cubicInvariantAt I J f x y hu := QuotientGroup.mk hu.unit`; the three headlines at :150, :171 and :187 take the admissible point as an argument, the first asserting existence; `README.md:765` names `BinaryQuartic.cubicInvariantAt`; the gate shows `statement-hygiene=0`.

## Verified sound

**Scope.** Incremental re-review of the 105 changed lines since 208c897. Against the merge base, `git diff --stat origin/main...HEAD` outside the folder is empty; `changes.md` lists no file changed outside the folder; the worktree is clean. No roadmap file or manifest was edited by this review.

**Gate** (independent rerun with the targeted build, same result as the worker's):

```text
gate ArithmeticStatisticsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

**Dependency check** (the brief's command, real order, `--movable`):

```text
depcheck: 236 roadmaps, 2273 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The two edges added since the previous run are Mathlib items in §1.3's *Needs:* line; the QuadraticFormsOverABase edge of the previous R01 is gone.

**Elaboration.**
- `lake env lean` on `Suggested.lean` at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d): exactly seven `sorry` warnings, at lines 150, 160, 171, 178, 187, 196 and 203, and nothing else.
- `#check @` on the four changed declarations, in a scratch copy: `cubicInvariantAt` has type `{K} → [Field K] → (I J : K) → (f : Fin 5 → K) → (x y : K) → IsUnit (irrationalCovariant I J f x y) → (curveIJ I J).M`; the three theorems carry `[NeZero (2 : K)] [NeZero (3 : K)]`, the orbit theorem `Nat.card K ≠ 5` and `4 * I ^ 3 - J ^ 2 ≠ 0`, the point and Selmer theorems `[NeZero (4 * I ^ 3 - J ^ 2)]`, and the Selmer theorem `[NumberField K]`. Each matches its README statement (`README.md:859–861`, :913–917, :1009). `signatures.md` lists 22 declarations with no lost binder.
- One-tactic probes (`rfl`, `simp`, `infer_instance`) fail on each of the three changed theorems; none is padding. The untouched theorems were probed in [r4].

**Changed passages, mathematics (fresh values).**

| Statement | Instances and computed values | Result |
|---|---|---|
| Scope bullet and §1.3: `4 Det` is the displayed integral polynomial; equals `4 • QuadraticForm.discr'` when 2 is invertible (`README.md:16`, :298, :302) | `discr'` is `Q.toMatrix'.det` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1242`), `toMatrix'` the matrix of `Q.associated` (:1168), both under `variable [Invertible (2 : R)]` (:1159). Symbolic: 4·det of the Gram matrix with `a_ij/2` off the diagonal is `4a₁₁a₂₂a₃₃ + a₁₂a₁₃a₂₃ − a₁₁a₂₃² − a₂₂a₁₃² − a₃₃a₁₂²`, term by term the README's polynomial. `x₁x₂ + x₃²`: Gram rows (0,½,0),(½,0,0),(0,0,1), det −¼; `4 Det = −a₃₃a₁₂² = −1 = 4·(−¼)` (the new Check at :358). `x₁²+x₂²+x₃²`: 1 and 4. | Correct; the wrong model `4 Det = discr'` fails at −1 ≠ −¼. |
| Transformation law `4 Det(Q∘Mᵀ) = (det M)² 4 Det Q` over every commutative ring (`README.md:316`, Check :356) | `Q = x₁²+x₂²+x₃²`, `M = diag(2,1,1)`: `Q∘Mᵀ = 4x₁²+x₂²+x₃²`, `4 Det = 16 = 2²·4`; factor `det M` would give 8. Shear rows (1,1,0),(0,1,0),(0,0,1): `Q(Mᵀt) = 2t₁²+2t₁t₂+t₂²+t₃²`, `4 Det = 4·2·1·1 − 1·2² = 4 = 1²·4`. Over 𝔽₂, `xy+xz+yz`: `4 Det = 1` with no division. | Correct in the stated generality. |
| Rational route to the law (`README.md:342`) | `(Q.comp f) t = Q (f t)` with `f = Matrix.toLin' Mᵀ` is `Q(Mᵀt)`; `discr'_comp` (:1250–1251) gives `f.toMatrix'.det * f.toMatrix'.det * Q.discr'`, and `toMatrix' (toLin' Mᵀ) = Mᵀ`, `det Mᵀ = det M`. `ℤ[a,m] → ℚ[a,m]` is injective; evaluation specialises to `R[x,y]` and `Ax − By`. At `(x,y) = (1,0)` the pencil value is `4 Det A`. | Every input is a pinned declaration or a §1.3 target. |
| §1.5 Check: `x³y − xy³` at (1,0) and (1,2) (`README.md:789`) | Lean `hessian` (:121) has `−3bd`, as Cremona–Fisher (ref [8] line 45): `g₄ = 3x⁴ + 6x²y² + 3y⁴ = 3(x²+y²)²`. (1,0): `g = 0`, `g₄ = 3`, `G = 1` → (1,1,1). (1,2): `g = −6`, `g₄ = 75`, `G = 25 + (8/3)T`; at `T = 0, 9, −9`: 25, 49, 1. `g₆ = x⁶ − 5x⁴y² − 5x²y⁴ + y⁶` (ref [8] lines 48–51) gives `g₆(1,2) = −35` and `N(G(1,2)) = 25·49·1 = 1225 = 35²`. | Both classes trivial; the Check's values are right and (1,2) is admissible. |
| §1.5 Check: no admissible point for `x⁴+y⁴` over 𝔽₅ (`README.md:791`) | `I = 12 ≡ 2`, `J = 0`, `4I³ − J² = 32 ≡ 2`. From the explicit sextic (ref [8] lines 48–51) `g₆ = 32x⁵y − 32xy⁵ = 32xy(x⁴−y⁴)`; from the syzygy `27g₆² = g₄³ − 48Ig²g₄ − 64Jg³` (line 53) with `g₄ = −48x²y²`: `−110592x⁶y⁶ + 27648x²y²(x⁴+y⁴)² = 27648x²y²(x⁴−y⁴)²`, so `g₆² = 1024x²y²(x⁴−y⁴)²`. On ℙ¹(𝔽₅): `xy = 0` at (1:0),(0:1); `x⁴ = y⁴ = 1` at the other four points. | Vanishes at all six points; `#K ≠ 5` is needed for existence, as stated. |
| §1.6 proof route (`README.md:919`) | `quarticOfPoint` (`Suggested.lean:115`) is ref [8] line 443: `(1, 0, −ξ/6, −η/27, (36I−ξ²)/432)`. `G(1,0) = (4φ + 4ξ/3)/3 = (4/9)(ξ + 3φ) = (2/3)²(ξ − T)` with `φ = −T/3` (ref [8] line 458). `g₆(1,0) = b³ + 8a²d − 4abc = 8(−η/27)`. Lemma 1 (ref [8] lines 75–86): `G(X₁,Y₁)G(X₂,Y₂) = F²` with `F` in `L[X₁,Y₁,X₂,Y₂]`, a polynomial identity. `η = 0`: Tau Ceti `equivProdA'` (`MordellWeil/XSubT.lean:306`) splits `A ≃ K × A'`; the cofactor at `T = ξ` is `3ξ² − 27I = f'(ξ)`; `μX_of_eval_f_eq_zero` (:625) uses the class of `x − T + fCofactor x`; `μ₀ 0 = 1` (:651). Numerical witness on `y² = x³ − 81x` (I = 3, J = 0), `P = (0,0)`: `q(P) = (1,0,0,0,¼)`, `g₆ = 8x⁵y − 2xy⁵`, so (1,0) is not admissible and (1,1) is; `G(1,1) = −4 − (5/9)T` → (−4, −9, 1), `N = 36 = g₆(1,1)²`; corrected representative → (−81, −9, 9); ratios (4/81, 1, 1/9), all squares. `P = O`: `q(O) = (0,1,0,−I/3,−J/27)` has invariants `I, J`, `g₆(1,0) = 1`, `G(1,0) = 3/3 = 1 = μ(O)`. | The route is complete, uses only §1.5–1.6 targets and pinned declarations, and no step uses `#K`. |
| `cubicInvariant_determines_orbit` (`Suggested.lean:150`) | `f = g = x³y − xy³` over ℚ: classes (1,1,1) at both admissible points, `f ∼ f`. `x⁴+y⁴` over 𝔽₅: no admissible point, so the existence clause needs `Nat.card K ≠ 5` (present). Zero quartic: excluded by `invI f = I` with `4I³ − J² ≠ 0`. Existence asserted for `f` only; `g` follows by symmetry of the hypotheses. | Correct restatement of Theorem 11 plus Proposition 2 (ref [8] lines 97–101, 255–256). |
| `cubicInvariant_quarticOfPoint_eq_mu` (`Suggested.lean:171`) | Values as in the §1.6 row: (−4,−9,1) vs (−81,−9,9); O: 1 = 1. Over 𝔽₅ the statement is vacuous when no admissible point exists and true otherwise, as `README.md:913` says. | Correct; dropping `#K ≠ 5` is sound. |
| `mem_selmerGroup₂_iff` (`Suggested.lean:187`) | K a number field, so infinite, so an admissible point exists for every `f` with `4I³ − J² ≠ 0` (at most six zeros of `g₆`); `∃ x y hu, cubicInvariantAt … = m` is then `z(f) = m`. Identity quartic `x³y − xy³`: class 1, in the Selmer group. | Equivalent to the previous statement without a chosen datum. |
| Module docstring (`Suggested.lean:19–23`, :28–31, :42) | §1.2's three headline families (`README.md:250`, :266, :280) now named with their missing carrier; `grep -ril 'DeloneFaddeev\|CubicRing\|BinaryCubic'` over the pinned Tau Ceti finds nothing, Mathlib `Cubic` is a coefficient structure. §1.14 label added. | Correct. |
| Supply direction (`README.md:2128`, description) | README: 0 supplier citations of QuadraticFormsOverABase, depcheck 0 problems. Description: #1930 listed twice as merging first; its suppliers at 149, 392, 394 > 112. | R01. |

**Ownership.** The ternary `4 Det` is owned here (§1.3), the move-down the previous review asked for. QuadraticFormsOverABase at #1930 (head read through `roadmaps show`) now says, in its scope section, that “ArithmeticStatisticsPartII §1.3's division-free ternary `4 Det`, with its law … is `δ'` at `n = 3`”, so the two roadmaps agree on the owner of the rank-three case. Remark, no change requested: ArithmeticStatisticsPartIII (#1174) still defines `Counting.ternaryDet4` as the same polynomial (its README :1187); its own review covers that.

**Pinned declarations opened this round** (file and line at the pins): Mathlib `QuadraticForm.discr'` :1242, `discr'_smul` :1247, `discr'_comp` :1250, `toMatrix'` :1168, `Matrix.toQuadraticForm'` :1153, the `Invertible 2` variable :1159 (all in `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`); Tau Ceti `A` :299, `A'` :302, `equivProdA'` :306, `equivProdA'_apply` :320, `isUnit_mk_iff` :334, `M` :346, `μX` :615, `μX_of_eval_f_eq_zero` :625, `μX_of_eval_f_ne_zero` :633, `μ₀` :651, `μ₀_zero` :656, `μ` :861 (all in `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean`). That is 18 declarations; every library name the changed passages cite exists at the pins, and the resolver's 18 leads are this roadmap's own `BinaryQuartic.*` names, all declared in `Suggested.lean`.

**Sources read for the changed passages.** Ref [8] (Cremona–Fisher, *On the equivalence of binary quartics*, cache 22df2eb9): the Hessian and sextic (lines 45–51), the covariant syzygy (line 53), `G` and the `#K ≠ 5` remark (lines 68–72), Lemma 1 and Proposition 2 (lines 75–101), the two-torsion remark (lines 119–123), Theorem 11 (lines 255–256), Section 6 and Theorem 13(1) (lines 426–458). The README's locators “Lemma 1, Proposition 2, printed pp. 2–3”, “Theorem 11, printed p. 7”, “Proof of Theorem 13(1), printed pp. 10–11; Section 6, printed p. 10” are right. §1.3's HCL III locators are unchanged and were read in [r4]; the other seeded targets were untouched, so their evidence is [r3]'s.

**Carried adversarial rows.** [r3] is `packages/ArithmeticStatisticsPartII/reports/PRREVIEW-ArithmeticStatisticsPartII~3.md`, [r4] is `…~4.md`. Each row repeats its computed values for a statement this diff leaves untouched; the [r4] rows on QuadraticFormsOverABase are replaced by the fresh §1.3 rows above.

| Statement (untouched) | Values carried | Result |
|---|---|---|
| Pencil over R[x,y] (§1.3 :352) | A₁=x₁x₃−x₂², B=(a,b,c,d,e): `4 Det(Ax−By) = x³+cx²y+(bd−4ae)xy²+(ad²+b²e−4ace)y³`; at (1,0): 1 = 4 Det A₁; g₃=diag(2,1,1): 4 = 2²·1 | keep [r4] |
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
| Orbit invariance | x⁴−y⁴ and its diag(2,1) transform: class 1 both | keep [r3] |
| Linear-factor forms | x³y−xy³ at (1,0): G=1=(3g₆/h)² | keep [r3] |
| Auxiliary quartic root | g₁=g₂=x⁴+xy³: I=0, J=−27, r=8; nonsingular −729 | keep [r3] |
| Comparison quartic | r₂²=64=1³·64; x³y vs 0 excluded | keep [r3] |
| Quartic of a point | y²=x³−81x: O→(0,1,0,−1,0), (0,0)→(1,0,0,0,1/4); I=3, J=0 | keep [r3] |
| e mod 2e over 𝔽₅ | 120 quartics, 2 orbits of 60; E 10 points, E[2] 2 | keep [r3] |
| Bilinear factor criterion | det 1; x⁴−y⁴: 2 self-equivalences over Q, 4 over Q(i) | keep [r3] |
| Stabilizer two-torsion | 1+1=2; 𝔽₅ 120/60=2 | keep [r3] |
| Image of cubic invariant | m=1 det −1 isotropic; m=2 norm 8 nonsquare; 9604=98² | keep [r3] |
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
| `solubleOrbit_bijection` | 𝔽₅: 120/60=2=10/5 | keep |
| `stabilizer_twoTorsion` | Q: 2=2; 𝔽₅: 2=2; C: 4 | keep |
| `exists_integral_local` | A=−1, B=0, p=2,3 | keep |
| `exists_integral` | same tuple, all p | keep |
| `form`, `eval` | (1,0,0,0,−1): exponents (4,0),(0,4); −15 at (1,2) | keep |
| `invI`, `invJ` | −12, 0; (1,2,3,4,5): J=270 | keep |
| `twistedForm`, `IsProperlyEquivalent` | 4x⁴−y⁴/4; scalar 2I fixes | keep |
| `IsSoluble`, `IsEverywhereLocallySoluble` | (1,1,0) vs no real point | keep |
| `curveIJ` and its instances | I=3,J=0: Δ=34012224; I=J=0: Δ=0 | keep |
| `quarticOfPoint`, `hessian`, `irrationalCovariant` | 48x²y²; 192 at (1,2); product 36 | keep |

**Remarks on untouched text, no change requested.** `README.md:815`, :953, :985 and :1133 keep the clause “`#K ≠ 5` for the chosen admissible-evaluation construction of z”; with the invariant now defined at a given admissible point, the clause still says the right thing (the invariant needs a point to exist), and the previous reviews passed it.

## Not verifiable

- Carried from [r3]: ref-53 (O’Dorney, *Rings of small rank over a Dedekind domain and their ideals*, DOI 10.1186/s40687-016-0054-0) is uncertified, so its unchanged locators remain uncertified.
- Unchanged sampled locators and the source gap in ref-10 (the nonétale quintic realization) rely on [r3]. A `sorry` build checks elaboration, not the truth of the seven headlines.

## Source issues

- none
