<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7613#issuecomment-6715813048 -->
Red team round 1 pass b (claude) of 547b900

Verdict: needs_changes

1. **F01** (P3) Radial-stretch Check and worked example are false in dimension one

   Location: `packages/QuasiregularMaps/README.md:816–820` (§2.9 Checks, "The radial stretch
   `x ↦ |x|^{a−1} x` of `ℝⁿ`, `a > 0` … with `K_O = a^{n−1}`, `K_I = a` for `a ≥ 1` and
   `K_O = 1/a`, `K_I = a^{1−n}` for `0 < a < 1`") and `packages/QuasiregularMaps/README.md:1674–1676`
   (Worked examples, "`K_O = max(a^{n−1}, 1/a)`, `K_I = max(a, a^{1−n})`").

   Claim: the formulas hold for every `n ≥ 1` and `a > 0` (no dimension hypothesis is stated, while
   the §3.2 text and the Layer 3 table restrict the same formulas to `n ≥ 2`).

   Witness: `n = 1`, `a = 1/2`: `f(t) = |t|^{−1/2} t = sign(t) |t|^{1/2}`, `Df = |t|^{−1/2}/2 > 0` off
   `0`, so `‖Df‖¹ = Df = 1 · det Df` and `q_O = q_I = 1` almost everywhere, `K_O = K_I = 1`. The
   Check gives `K_O = 1/a = 2` and the worked example gives `max(a⁰, 1/a) = 2`. The "tangential,
   `n − 1` times" singular value that produces `1/a` does not exist when `n = 1`.

   Repair (two edits). §2.9 Check, first bullet: replace "The radial stretch `x ↦ |x|^{a−1} x` of
   `ℝⁿ`, `a > 0`, is smooth off `0`." by "The radial stretch `x ↦ |x|^{a−1} x` of `ℝⁿ`, `n ≥ 2`,
   `a > 0`, is smooth off `0`; in dimension one it has `K_O = K_I = 1` for every `a > 0`." Worked
   examples, radial stretches: replace "**Radial stretches** `x ↦ |x|^{a−1} x` of `ℝⁿ`:" by
   "**Radial stretches** `x ↦ |x|^{a−1} x` of `ℝⁿ`, `n ≥ 2`:". Tested on the refuting instance:
   with `n ≥ 2` imposed the instance is excluded, and for `n = 2`, `a = 1/2` the formulas give
   `K_O = 2`, `K_I = 2`, which agree with the direct computation (singular values `|x|^{−1/2}` and
   `|x|^{−1/2}/2`, `J = |x|^{−1}/2`, `q_O = |x|^{−1}/(|x|^{−1}/2) = 2`, `q_I = (|x|^{−1}/2)/(|x|^{−1}/4) = 2`).

2. **F02** (P3) The proved `example` mirrors a README Check

   Location: `packages/QuasiregularMaps/Suggested.lean:83–97` ("The identity of a non-zero Euclidean
   space is `1`-quasiregular on every open set … `example … IsQuasiregularOn 1 Ω id`").

   Claim: a proved example that belongs in the acceptance test.

   Witness: `packages/QuasiregularMaps/README.md:825–826`, §2.9 Checks, fourth bullet, states the
   same fact in the same words ("The identity of a non-zero `E` satisfies the condition with
   `K = 1`: its weak derivative is the constant identity map, `‖id‖ⁿ = 1 = det id`"). A declaration
   that mirrors a README Check, computing the two values `‖id‖ = 1` and `det id = 1`, is padding
   under the acceptance-test rules; the README keeps the Check.

   Repair: delete lines 83–97 of `Suggested.lean` (the docstring and the `example`). Nothing else
   in the file refers to it. If the repair worker reads the rule "a proved example stays only when it
   tests something nontrivial about a kept definition" as covering a satisfiability smoke test of
   `IsQuasiregularOn`, keeping it is defensible; the finding records that it duplicates the Check.

3. **F03** (P3) `LinearMap.det` is listed under the wrong Mathlib file

   Location: `packages/QuasiregularMaps/README.md:175–179` ("`LinearMap.det`; `Orientation.volumeForm`,
   … (`Mathlib/Analysis/InnerProductSpace/Orientation.lean`)").

   Claim: all five names of the bullet live in `Mathlib/Analysis/InnerProductSpace/Orientation.lean`.

   Witness: at the pin `LinearMap.det` is `Mathlib/LinearAlgebra/Determinant.lean:164`
   (`protected def det : (M →ₗ[A] M) →* A`); the four `Orientation.*` names are in
   `Mathlib/Analysis/InnerProductSpace/Orientation.lean` (lines 198, 223, 290, 245).

   Repair: replace the bullet's opening "- `LinearMap.det`; `Orientation.volumeForm`," by
   "- `LinearMap.det` (`Mathlib/LinearAlgebra/Determinant.lean`): the determinant of an endomorphism;
   `Orientation.volumeForm`," and leave the rest of the bullet unchanged.

Three P3 findings; no P1 or P2. Every declaration of `Suggested.lean` is true as typed at the
README's generality, every cross-roadmap citation resolves at its current head or on main, every
library name cited resolves at the pins, and the seven declared gaps are precise, minimal and
declared in both `design/plan.json` and the README. Details, with the computed values, are in
the adversarial table below.

## Verified sound

Counts: 10 declarations read (all of `Suggested.lean`); 36 targets read (§1.1–§7.6, every
line of the README); 41 source locators verified against the certified texts (MartioRickmanVaisala1969
lines 118–127, 332–340, 409–444; HeikkilaPankka2025 lines 18–34, 52–57, 85–96, 271–273,
1236–1260, 1317–1339; Prywes2019 lines 22–65); 93 Checks and worked-example values recomputed
(every numeric Check of §1.1–§7.6, the Conventions witnesses, the Layer 3 table and the three
worked examples); 6 supplier roadmaps checked at their current text (DifferentialGeometry 2.1,
2.2, 10.2, 12.1, 12.4 on main; RiemannianGeometry R4 item 7 on main; GeometricTopology Layer 11
on main; PDE §1.1 on main; TeichmullerGeometry §7.4 at the head of its open pull request;
SobolevMapsBetweenManifolds as the board target `packages/SobolevMapsBetweenManifolds/target.md`,
whose T1–T7 and Scope items 1–7 are the sections the gaps cite); 45 Tau Ceti and 35 Mathlib
declarations located at the pins with the files the README names (all but R03 correct).

Dependency check, run on the README at this head:

```
depcheck: 244 roadmaps, 2393 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. QuasiregularMaps is at position 272 of the merge order, directly
after TeichmullerGeometry (271); FourManifolds (125), named only as a supplier of Part III, is
earlier. SobolevMapsBetweenManifolds is not on main, not in the order and not an open pull
request; every use of it is one of the six declared `sobolev-maps-*` gaps, which this pass does
not raise. `scratch/citations.md` lists only the two §3.2 theorem names, which are this
roadmap's own declarations; `scratch/overlaps.md` lists no open pull request changing this
roadmap and no dropped id. Ownership by object: `roadmaps grep` for quasiregular maps, `ACL`,
quasiregularly elliptic manifolds, minimal stretch, inner and outer distortion and the formal
derivative finds no other owner on main or at any open head (the hits are "quasiregular
semiperfect rings" and "formal derivative of a power series", different objects); no pinned
declaration defines any of these (the pins have `LinearMap.singularValues`, `LinearMap.normDet`,
`Orientation.volumeForm`, Tau Ceti's `volumeFormL`, but no oriented Jacobian of a map between
two oriented spaces, no distortion quotient, no `ACL` class). Orientation descent to an orbit
space is not at the pin: Tau Ceti's `Geometry/Manifold/Orientation/Pullback.lean` has the
pullback and the local-constancy lemma `IsLocalDiffeomorphAt.eventually_mapOrientation_eq` only, so
`gap:orientation-descent` asks for something not provided.

Elaborated signatures: `scratch/signatures.md` (ten `#check @name` outputs elaborated by the
worker at this head) was compared declaration by declaration with the file and with the README
statements of §1.1, §2.9, §3.2, §5.1, §5.2 and §5.3; no section binder is lost and each
elaborated type carries exactly the hypotheses its README statement names. This pass ran no
Lean.

Policy: the pull request changes only `packages/QuasiregularMaps/` (README, Suggested.lean,
`design/plan.json` gaps, `metadata.toml`, `sources.toml`, reports); `theorem` throughout, no
`set_option`, imports `import Mathlib` and the one existing module
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic`; no `#eval`, `#print axioms`, `True` placeholder or
sorry'd data; no process words or pull-request numbers in README or docstrings (the only hit
for "round" is "the round sphere"); every section has a source locator; every Lean name occurs
in the README and every backticked own name of the README is declared. `metadata.toml` gives
`math.CV`, the primary class for quasiregular maps.

Gaps: the seven slugs are identical in `design/plan.json` and under "Exact supplier contracts";
each `needs` sentence names its hypotheses (`1 ≤ p ≤ ∞`, continuity, Hausdorff second countable
boundaryless, oriented equidimensional, `C¹` factors with no bound); none asks for what the
pins, main or an earlier roadmap provide (RiemannianGeometry R4 item 7 descends the metric and
proves orientability of `RPⁿ` by hand for spheres only; it does not descend an orientation along
a general free orientation-preserving action).

### Adversarial table

| statement | instances tried | values computed on each side | result | change |
| --- | --- | --- | --- | --- |
| `minimalStretch A = σ_{dim V}` (Lean, §1.1) | `diag(3, 1/2)`; shear `[[1,1],[0,1]]`; `dim V = 0`; `dim W < dim V` (projection `ℝ² → ℝ`); `A = 0` | Mathlib's `singularValues` has its first `finrank V` entries from `A*A` in descending order and `0` beyond (`singularValues_of_finrank_le`), so index `finrank V − 1` is `σ_n`: `1/2`; `√((3−√5)/2) = (√5−1)/2 ≈ 0.618`, while `min(|Ae₁|, |Ae₂|) = 1`; `dim V = 0`: junk index `0 − 1 = 0`, value `0`, and `‖A‖ = 0`, consistent; projection: `σ₂ = 0 = min_{|v|=1}|Av|`; zero map: `0` | true at the Lean generality (arbitrary `V`, `W`); the README's "`ℓ > 0` iff injective" is stated under Layer 1's `n ≥ 1` and would fail for `dim V = 0`, where it is not claimed | none |
| `IsQuasiregularOn K Ω f` (Lean, §2.9) | `Ω = ∅`; `n = 0`; `n = 1`, `f = max(0, ·)`; fold; identity with `K = −1`; `K = 0` constant | `Ω = ∅`: every conjunct vacuous, so every `f` is `K`-QR for `K ≥ 1`, as §2.1's empty-manifold bullet says; `n = 0`: `‖Du‖⁰ = 1 ≤ K · det = K · 1`, true iff `1 ≤ K`, as the Conventions say; `n = 1`: `|Du| ≤ K Du` forces `Du ≥ 0`, `max(0,t)` has `Du = 1_{t>0}`, `1`-QR; fold: `det = −1` on `{x₁ < 0}`, `1 ≤ −K` false for all `K`; `K = −1`: excluded by the `1 ≤ K` conjunct although `1 ≤ (−1)(−1)`; `K = 0`: excluded | true; `HasWeakFDerivOn` carries completeness of `E` and local integrability of `f` and `x ↦ Du x v` (read at `WeakDeriv/Basic.lean:251`), so the class is `W^{1,n}_loc` for continuous `f` | none |
| `det_le_pow_mul_minimalStretch_pow` (Lean, §3.2 Euclidean, `K_I ≤ K_O^{n−1}`) | `det > 0` with `σ = (3,2,1)`; `det ≤ 0`; `n = 0`; `n = 1`; a second weak derivative | `σ=(3,2,1)`, `K = 9/2`: `det = 6 ≤ (9/2)² · 1 = 81/4`; general: `q_I = Π_{i<n} σᵢ/σₙ ≤ (σ₁/σₙ)^{n−1} ≤ q_O^{n−1} ≤ K^{n−1}`; `det ≤ 0`: `‖Du‖ⁿ ≤ K det ≤ 0` forces `Du = 0`, both sides `0`; `n = 0`: `1 ≤ K⁰ · 1`; `n = 1`: `Du ≤ K⁰ · Du`; second derivative: `HasWeakFDerivOn.ae_eq` transfers the a.e. inequality | true | none |
| `of_det_le_mul_minimalStretch_pow` (Lean, §3.2 Euclidean, `K_O ≤ K_I^{n−1}`) | radial stretch `a = 2` in `ℝ³`; projection `(x₁,x₂) ↦ (x₁,0)` without `hf`; `det ≤ 0`; `n = 0`; `K = 1` | `a = 2`: `det = 2|x|³ ≤ 2 · |x|³`, conclusion `‖Du‖³ = 8|x|³ ≤ 4 · 2|x|³`, attained; projection: `0 ≤ 1 · 0` holds while `‖Du‖² = 1 > 0`, so `hf` is needed and is present; `det ≤ 0` with `hf`: `Du = 0`, `0 ≤ K^{n−1} · 0`; `n = 0`: `1 ≤ 1 · 1`; `K = 1`: conclusion `1`-QR, needs `q_O ≤ q_I⁰ = 1`, true since `q_I ≤ 1` forces all `σᵢ` equal | true; `1 ≤ K` gives `1 ≤ K^{n−1}` | none |
| `formalDeriv u x` (Lean, §5.1) | `u(x₁,x₂) = (x₂, 0)`; `u = \|x₁\|` on the line `x₁ = 0`; `n = 0` | `constr` sends `eᵢ ↦ lineDeriv ℝ u x eᵢ`: `e₁ ↦ 0`, `e₂ ↦ e₁`, the matrix `[[0,1],[0,0]] = fderiv`; rows would give `e₁ ↦ e₂`; on `x₁ = 0` the first column is the junk `0`; `n = 0`: the empty `constr` is the zero map | true; columns, as the README Check says | none |
| `IsACLOn Ω u` (Lean, §5.1) | `n = 0`; `n = 1`; Cantor map `(c(x₁), 0)` on `[0,1]²`; indicator of `{0}` in `ℝ²`; box with `aᵢ = bᵢ` | `n = 0`: no boxes with `a < b` are needed, condition is `ContinuousOn`; `n = 1`: `u` absolutely continuous on every `[a,b] ⊆ Ω`; Cantor: every first-direction line function on `[0,1]²` is `c` on `[0,1]`, not AC (`not_absolutelyContinuousOnInterval_cantorFunction`), so not ACL; indicator: AC on a.e. segment but `ContinuousOn` fails; degenerate boxes are excluded by `a j < b j` and are null anyway | true; equivalent to MRV's open-interval-with-closure form (a closed box in open `Ω` is the closure of an open box with closure in `Ω`, and Fubini with `aᵢ < bᵢ` turns "a.e. point of the box" into "a.e. segment") | none |
| `IsACLpOn p Ω u` (Lean, §5.1) | `p = 0`; `p = ∞`; `\|x\|^{1/2}` on `ℝ²` at `p = 3, 4` | `p = 0`: `MemLp` asks only a.e. strong measurability, as the README records; `p = ∞`: essentially bounded on compacts; `\|∇u\| = \|x\|^{−1/2}/2`, `∫_{\|x\|<1}\|x\|^{−p/2} = 2π∫₀¹ r^{1−p/2}dr`, finite at `p = 3`, infinite at `p = 4` | true | none |
| `isACLpOn_iff_exists_hasWeakFDerivOn` (Lean, §5.2) | `n = 0`; `n = 1`; `p = 1/2` with the §5.2 strip example; `p = ∞`; `C¹` map | `n = 0`: both sides true (`Du = 0` is a weak derivative on a point); `n = 1`: Tau Ceti's `HasWeakLineDerivOn.absolutelyContinuousOnInterval` and `ae_hasDerivAt` give `⇐`, integration by parts `⇒`; strips: `∫_{[0,1]²}\|∂₁u\| ≈ Σ 2^{−k}16^k8^{−k} = ∞` while `∫\|∂₁u\|^{1/2} ≈ Σ 8^{−k/2} < ∞`, so `ACL^{1/2}` holds and no weak derivative exists, which is why `1 ≤ p` is a hypothesis; `p = ∞`: both sides are "locally bounded derivative"; `C¹`: `Du = fderiv = u'` | true; `FiniteDimensional F` is what the componentwise integration by parts and `LocallyLipschitzOn.hasWeakFDerivOn_fderiv` need | none |
| `ae_hasLineDerivAt_of_hasWeakFDerivOn` (Lean, §5.2) | `n = 0`; `u = \|x₁\|` on `ℝ²`; `Du` modified on a null set | `n = 0`: `∀ i : Fin 0` vacuous; `\|x₁\|`: `Du = (sign x₁, 0)` a.e., the partial `∂₁` exists off the null line `x₁ = 0`; a null modification of `Du` changes the a.e. statement by a null set | true (the ACL representative theorem on a.e. line plus Fubini) | none |
| `isQuasiregularOn_iff_isACLpOn` (Lean, §5.3) | `n = 0`; `n = 1`, `max(0,t)`; `K = 0` constant; radial stretch `a = 1/2` in `ℝ³` | `n = 0`: both sides reduce to `1 ≤ K`; `n = 1`: `f' = 1_{t>0}`, `\|f'\| ≤ 1 · f'`; `K = 0`: right side holds (`0 ≤ 0`) and left fails on `1 ≤ K`, so `hK` is used; `a = 1/2`: `\|x\|^{−3/2} ≤ 2 · \|x\|^{−3/2}/2` on both sides, `f' = Du` a.e. by the previous row | true | none |
| Conventions witnesses | `diag(2,1)`; `diag(−1,1)`; `diag(2,1,1)`, `diag(1,1,1/2)`; reflections | `4/2 = 2` and HS `5/4`; `q_O = ∞`, `q_I = 0`, naive `−1`; `8/2 = 4` vs `2/1 = 2`, `1/(1/2) = 2` vs `(1/2)/(1/8) = 4`; identity to `−std` has `J = −1`, reflection to `−std` has `J = +1` | all agree | none |
| §1.2 submultiplicativity of `q_I` | `R ∘ R = id`, `R = diag(−1,1)` | `q_I(id) = 1 > 0 = q_I(R)²` | sign hypotheses needed and stated | none |
| §1.2 lower semicontinuity of `q_O` | `A_k → A ≠ 0` with `J(A) ≤ 0`; `A_k → 0` | `‖A_k‖ⁿ/J(A_k) → ∞` or `= ∞`; `q_O(0) = 0 ≤ liminf` | true | none |
| §1.3 equality cases | `σ = (s,s,t)`; `σ = (2,1,1)`; `σ = (3,2,1)`; `n = 2` | `q_I = (s/t)² = q_O²`; `q_I = 2 ≠ 16 = q_O²`; `6 < 81/4`, `9/2 < 36`; `n = 2`: `q_O = q_I = σ₁/σ₂` | true | none |
| §1.4 (2.24) and strictness | `id`; `diag(1,ε)`; `diag(1,ε,ε)`; `n = 1` | `q_S(id) = n^{n/2}/n^{n/2} = 1`; `q_O/q_S = 2/(1+ε²) → 2`; `3^{3/2}/(1+2ε²)^{3/2} → 3^{3/2}`; `n = 1`: `q_O = q_S`, which is why strictness is stated for `n ≥ 2` | true | none |
| §1.5 planar maps | `a = 1, b = 1/2`; `a = 0, b = 1`; `K = 2 ↔ k = 1/3` | `‖A‖ = 3/2`, `ℓ = 1/2`, `J = 3/4`, `q_O = 3`; `J = −1`, `q_O = ∞`; `z + z̄/3`: `(4/3)/(2/3) = 2` | true | none |
| §2.2, §2.9, §3.2 radial stretches | `n = 3`, `a = 2`, `a = 1/2`; `n = 2`, `a = 1/2`; `n = 1`, `a = 1/2` | singular values `a\|x\|^{a−1}` once, `\|x\|^{a−1}` `n − 1` times, `J = a\|x\|^{n(a−1)}`: `K_O = 4, K_I = 2` and `K_O = 2, K_I = 4`; `n = 2`: `K_O = K_I = 2`; `n = 1`: `K_O = K_I = 1`, not `1/a = 2` | §2.9 Check and Worked examples false at `n = 1` | R01 |
| §2.5 shear `(x, y + x³/3)` | `R = 1` | `DfᵀDf = [[1+x⁴, x²],[x², 1]]`, `‖Df‖ = (x² + √(x⁴+4))/2` (its square is `(x⁴ + 2 + x²√(x⁴+4))/2`, the larger eigenvalue), `J = 1`, `K_O` on `\|x\| < 1` is `((1+√5)/2)²` | true | none |
| §2.7 `(x, y) ↦ (x³, y)` | `x → 0` | `q_O = max(3x², 1)²/(3x²) → ∞`; at `0`, `df = diag(0,1) ≠ 0`, `J = 0` | not quasiregular, as claimed | none |
| §2.8 winding map | off the axis | `(r, θ, z) ↦ (r, 2θ, z)`, unit tangential vector stretched by `2`: singular values `2, 1, 1`, `J = 2`, `K_O = 4`, `K_I = 2`, `K_S = 6^{3/2}/(3^{3/2} · 2) = √2` | true | none |
| §2.10 Beltrami | `K = 1`; `a = 0, b ≠ 0`; `\|b\| ≥ \|a\| > 0`; `z + a z̄` | `(\|a\|+\|b\|)² ≤ K(\|a\|²−\|b\|²)` iff `\|b\| ≤ k\|a\|` with `k = (K−1)/(K+1)` in each case; `K_O = (1+\|a\|)/(1−\|a\|) = 3` at `a = 1/2`; TeichmullerGeometry §7.4's `K(f) = (1+‖μ‖_∞)/(1−‖μ‖_∞)` agrees | true | none |
| §4.1 metric comparison | `g'_N = c²g_N`; `T²` with `dx² + 4dy²`; `dx² + e^{2x}dy²`; `e^{2x}(dx²+dy²)` | factor `(c/c)ⁿ = 1`; `‖dπ‖' = 2`, `ρ_N = 2`, `J' = 2`, `q'_O = 2 ≤ 4`; `q'_O = max(1,e^{2x})/eˣ = e^{\|x\|}`; `q'_O = e^{2x}/e^{2x} = 1` | true | none |
| §4.2 and §7.2 orientation reversal | `f ∘ R` into `(N, −o_N)` | `J = −(J_f(Rx) · det R) = J_f(Rx)` | true | none |
| §4.4 composition of stretches | `a = 2` after `a = 1/2` in `ℝ³` | `\|x\|^{1/2} · \|x\|^{−1/2} x = x`, `K_O = 1 ≤ 4 · 2` | true | none |
| §5.1 Checks | `\|x\|^{1/2}`; Cantor; indicator; columns; segment | recomputed above; segment through `(1/2,1/2)` with `i = 2` is `t ↦ u(1/2, t)` on `[0,1]` | true | none |
| §6.1 triangle on `S¹` | `t ∈ [0,1]` | `\|p(t)\|² = 1 − 3t + 3t² ∈ [1/4, 1]`, `θ'(t) = (v₀ × v₁)/\|p\|² = (√3/2)/\|p\|² ∈ [√3/2, 2√3]` | true | none |
| §6.1 infinite star | `{v}` compact | carrier `{v}` meets every closed edge; no compact neighbourhood of `v`; the realization is not a `1`-manifold | the route needs the manifold, as stated | none |
| §6.4 Checks | doubling of `T²`; `h` with slopes `k` | `dp = diag(2,1)`, `K_O = 4/2 = 2`; strip `k`: `q_O = k²/k = k → ∞` | true | none |
| §7.5 flat quotients | `Tⁿ`; Klein bottle; rotation by `π` | `J_π = 1`, `K_O = 1`; glide reflections reverse orientation, outside the definition; rotation has a fixed point | true | none |
| Worked example, eight sectors | first sector | `L = [[1,−1],[0,√2]]`, `det = √2`, `LᵀL = [[1,−1],[−1,3]]`, eigenvalues `2 ± √2`, `q_O = (2+√2)/√2 = 1+√2`, `q_I = √2/(2−√2) = 1+√2`; the two sectors agree on the ray at angle `π/4` (both send it to angle `π/2`) | true | none |
| Layer 3 table | `diag(2,1)`, winding map, stretches | `K_S(diag(2,1)) = 5/4`; winding `√2`; stretch `(a² + n − 1)^{n/2}/(n^{n/2} a)` | true, with `n ≥ 2` stated there | none |

## Not verifiable

- Rickman1993 Ch. I, Vaisala1971 Ch. 3, Ahlfors2006 Ch. I, Reshetnyak1989 Ch. II,
  IwaniecMartin2001 Ch. 6, Gromov1981 p. 200, Gromov1999 Ch. 2 and BonkHeinonen2001 Theorem 1.1
  are uncertified in `sources.toml` and are cited by locator only; the statements attributed to
  them (ACL = Sobolev, Hadamard's inequality, the planar linear algebra, Reshetnyak's theorem,
  the Bonk–Heinonen bound) are standard and consistent with the certified texts, but the locators
  themselves were not read.
- No Lean was elaborated in this pass (read-only brief). The elaborated types are those of
  `scratch/signatures.md`, produced by the worker at this head and identical to the file.
- Ownership against open pull requests was checked by `roadmaps grep` over every open head and
  main (the objects above) and by reading the scope of the five roadmaps `scratch/overlaps.md`
  lists as closest in vocabulary (SobolevDifferentialForms, two DifferentialGeometry revisions,
  SobolevPolynomialApproximation, PlanarTopology) through the same tool; their full files were not
  read line by line. PlanarTopology's smooth triangulations are two-dimensional and its
  `PLStructure.IsCompatible` is a surface notion; §6.1 here is stated for `n`-manifolds on Tau
  Ceti's `IsSmoothTriangulation`, and no open roadmap states local finiteness, purity or the null
  lower skeleton for `C¹` triangulations.
- The Euclidean specialisation of the §6.4 headline (a simplicial map between `C¹`-triangulated
  open subsets of `ℝⁿ` is `IsQuasiregularOn`) could in principle be encoded at the pins through
  `TauCeti.IsSmoothTriangulation` on `Opens` manifolds, but the README states §6.4 for manifolds
  only and the encoding would be long and ad hoc; the module docstring's reason for omitting it
  (the manifold-valued class) is accurate for the headline as the README states it. Not raised.

## Source issues

- **Misprint** in HeikkilaPankka2025 at Proof of Proposition B.1, printed page 24 (line 1328): the
  source writes the composite of the embedding with the map in the order "map then embedding"
  read as `p ∘ ι`; it should be `ι ∘ p`, the embedding applied after `p`, which is what Lemma B.2
  is applied to; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "547b900fcb33dbef0c00588a2986cb391413ccc2", "job": "RT-QuasiregularMaps~1b", "model": "fable", "worker": "chris-x8"} -->
