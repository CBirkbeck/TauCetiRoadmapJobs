# Review of CotangentLagrangian (pull request #1651 at 086aecd)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** needs changes

This is a full re-review of the repaired head (279 changed lines since 80fe935). The worker's gate passes every check at this head; the dependency check reports no problem; both Lean files elaborate with `sorry` the only warning. The mathematics of the new C3.1 and C4 material checks out against Cannas da Silva and by computation. One blocking finding remains, on the acceptance test rather than on the new material: the roadmap's C2.1 group theorems are statable at the pins but neither stated in `Suggested.lean` nor named in its docstring.

## Repair check of the previous review (80fe935 → 086aecd)

| Previous finding | State at 086aecd |
|---|---|
| R01 (P2) upward citations of IntegrableSystems I2.0 and ConvexityToric T4 | Repaired. README lines 300–312 now build the billiard on the strip `ℝ×(−1,1)` with the translation τ and use `AddCircle L × (−1,1)` "only as the topological space ... never as a manifold"; lines 347–363 state recurrence for a measurable self-map preserving a finite measure of full support and say "the Liouville measure that supplies such an instance is not constructed here"; line 485–487 says C3.1 "consumes nothing from the later roadmaps of this family". No mention of I2.0 or T4 remains (grep). |
| R02 (P2) sorry'd data `canonicalForm` | Repaired. `canonicalForm`, `canonicalForm_symplectic`, `canonicalForm_inChart` are gone; `canonicalForm_exists` (Suggested.lean lines 56–62) is an existence theorem with `sorry`; the gate's sorry-data count is 0. |
| R03 (P3) import form | Repaired in `Suggested.lean` (line 1 `import Mathlib`, then four `TauCeti.*` lines). Not repaired in `RelativeDarbouxTargets.lean` (lines 1–2 unchanged): see R02 below. |
| R04 (P3) `<a id=` anchors | Repaired: both deleted; gate residue = 0. |
| R05 (P3) no locators | Repaired: thirteen Cannas da Silva locators added at the claims (verified below) and the References paragraph lists them. Weinstein 1971 is cited alongside Thms. 8.4 and 9.3 without a theorem number, which is acceptable since each claim carries a Cannas da Silva locator. |
| R06 (P3) padding `symplectic_extension_fixing_subspace` | Not repaired: `RelativeDarbouxTargets.lean` line 34–38 unchanged. See R03 below. |
| R07 (P3) pull-request links | Repaired: README lines 19, 22, 209 link by relative path. |
| R08 (P3) cyclic dictionary built twice | Repaired on this side: README lines 264–283 state the chain form for `S_0,…,S_(N−1)` with the matching-covector equations, the composite's intermediate-domain condition and the explicit bijection, with iterates as the equal-summand case and N = 1 recovering ψ. `IntegrableSystems/README.md` lines 361–376 (I5.2) still proves the criticality ↔ fixed-point bijection itself without citing C3.1; that is a matter for the IntegrableSystems review, not a defect of this folder. |

## R01 (P2) — the C2.1 headline theorems are statable at the pins but absent from `Suggested.lean`

Location: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean` lines 14–25 (the "Not statable at the pins" list names only the ω = −dλ identity, C3/C3.1 and C4); README lines 168–172 ("Prove U(n) connected ... proves Sp(2n,ℝ) connected", "Prove directly that U(n) is maximal compact in GL(n,ℂ)", "Prove directly that the realified U(n)=Sp_R∩O_R is maximal compact in Sp_R").

Claim: these are deep results the finished roadmap proves (the family index, `TauCetiRoadmap/SymplecticGeometry/README.md` line 35, lists C2.1 as the owner of "the direct GL(n,ℂ) and Sp(2n,ℝ) maximal-compact theorems by trace growth"), every carrier in their statements exists in Mathlib at the pin (`Matrix.unitaryGroup`, `Matrix.symplecticGroup`, `Unitary.toUnits`, `Units` with its topology, `IsCompact`, `IsConnected`), and `Suggested.lean` neither states them nor names them as not statable. A statable headline that is absent is a defect of the acceptance test.

Witness: the following elaborate at the pins with `sorry` the only warning (scratch copy, `lake env lean`, exit 0); Mathlib at 6b7abb3c has no connectedness or maximal-compactness statement for these groups (grep of every file mentioning `unitaryGroup`, `symplecticGroup` or `GeneralLinearGroup`).

```lean
/-- Realification of a complex matrix: `X + iY ↦ [[X, −Y], [Y, X]]`. -/
def realify {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) :
    Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ :=
  Matrix.fromBlocks (A.map Complex.re) (-(A.map Complex.im)) (A.map Complex.im) (A.map Complex.re)

/-- `U(n)` is a maximal compact subgroup of `GL(n, ℂ)`. -/
theorem unitaryGroup_maximal_compact (n : ℕ) (K : Subgroup (Matrix (Fin n) (Fin n) ℂ)ˣ)
    (hK : IsCompact (K : Set (Matrix (Fin n) (Fin n) ℂ)ˣ))
    (hU : ∀ U : Matrix.unitaryGroup (Fin n) ℂ, Unitary.toUnits U ∈ K) :
    ∀ A ∈ K, (A : Matrix (Fin n) (Fin n) ℂ) ∈ Matrix.unitaryGroup (Fin n) ℂ := by
  sorry

/-- The realified `U(n)` is a maximal compact subgroup of `Sp(2n, ℝ)`. -/
theorem realified_unitary_maximal_compact_symplectic (n : ℕ)
    (K : Subgroup (Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ)ˣ)
    (hKsp : ∀ A ∈ K, (A : Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ) ∈ Matrix.symplecticGroup (Fin n) ℝ)
    (hK : IsCompact (K : Set (Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ)ˣ))
    (hU : ∀ U ∈ Matrix.unitaryGroup (Fin n) ℂ, ∃ A ∈ K, (A : Matrix _ _ ℝ) = realify U) :
    ∀ A ∈ K, ∃ U ∈ Matrix.unitaryGroup (Fin n) ℂ, (A : Matrix _ _ ℝ) = realify U := by
  sorry

/-- `Sp(2n, ℝ)` is connected. -/
theorem symplecticGroup_isConnected (n : ℕ) :
    IsConnected (Matrix.symplecticGroup (Fin n) ℝ : Set (Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ)) := by
  sorry
```

Repair: add a `/-! ## C2.1: Compact intersections and group applications -/` section to `Suggested.lean` with these three statements and the `realify` definition (its body is the README's `Matrix.fromBlocks X (−Y) Y X`, line 127), name `realify` in README C2.1 where the homomorphism is introduced, and name the new theorems in README lines 168–172. The hypotheses match the README's: compactness of K in the units topology, K containing (the image of) U(n), and for the symplectic case K inside `Sp_R`. GL(n,ℂ) connectedness may be added in the same form; the polar-decomposition package of C2.0 stays in the README as a target.

## R02 (P3) — `RelativeDarbouxTargets.lean` keeps the refused import form and an informal docstring

Location: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/RelativeDarbouxTargets.lean` lines 1–2 (`import TauCeti.Geometry.Symplectic.SymplecticTransport`, `import Mathlib.LinearAlgebra.Dimension.Finrank`) and lines 4–12 ("**This file is not the roadmap and is not exhaustive.** These are suggested forms.").

Claim: the Lean form rules apply to every `.lean` file of the folder: `import Mathlib` first, then only `TauCeti.*` modules, never a `Mathlib.<submodule>` line; one module docstring of the form "<title>: target signatures". The gate reports imports = 0 only because it reads `Suggested.lean`. The previous review's R03 named these lines; only `Suggested.lean` was changed.

Witness: lines 1–2 of the file at 086aecd, identical to 80fe935 (the change set touches only `README.md` and `Suggested.lean`).

Repair: replace lines 1–2 by `import Mathlib` and `import TauCeti.Geometry.Symplectic.SymplecticTransport` (the module exists at Tau Ceti a91d3aa and its object file is built), and rewrite the docstring as "Relative Darboux, linear step: target signatures", saying that the roadmap is `README.md` and that the file states the symplectic Witt-extension lemma of C4 against the pinned `TauCeti.SymplecticForm`. The file elaborated here with the old header, so the change is only the header.

## R03 (P3) — padding: `symplectic_extension_fixing_subspace` is one term of the theorem above it

Location: `RelativeDarbouxTargets.lean` lines 34–38.

Claim: its proof is the single term `symplectic_subspace_extension ω₀ ω₁ rfl S S (LinearEquiv.refl ℝ S) hS`: the statement is the first theorem with `W = V`, `T = S`, `f = id`. The previous review's R06 was not acted on.

Witness: the `#check` of both declarations on a scratch copy shows the second is the first with `W := V`, `T := S` and `e u = u` in place of `e u = f u`.

Repair: delete lines 32–38 from the file; README lines 404–408 already state this specialization in prose ("First extend the identity of T_pQ to an ambient symplectic linear isomorphism").

## R04 (P3) — the module docstring lists `canonicalForm_exists` under "Not statable at the pins, and therefore absent"

Location: `Suggested.lean` lines 14–20.

Claim: the bullet says the ω = −dλ identity is absent and in the same breath that "its content is stated as `canonicalForm_exists`", and claims "that expression determines the form", which no declaration states. A reader of the acceptance test cannot tell which headline is tested.

Witness: the elaborated type of `canonicalForm_exists` (scratch `#check`) is an existence statement with the chart identity only; no uniqueness statement exists in the file.

Repair: split the bullet: under "Not statable" keep only "the identity ω = −dλ: Tau Ceti has no exterior derivative taking a one-form on a manifold to a `SmoothTwoForm`"; move the sentence about `canonicalForm_exists` to the paragraph on what is stated, and either drop "the chart expression determines the form" or state it (uniqueness follows from `inChartAt_extChartAt_self` at each centre, so the stated form is enough and the sentence can go).

## Verified sound

**Gate and build.** The worker's gate at 086aecd: every check passed (set_option, blob, latex, prnum, sorry-data, sorry-examples, residue, imports, stray-files, outside-folder, build all 0). `git diff --stat origin/main...HEAD` outside the three roadmap folders and the family index: nothing. `lake env lean` on `Suggested.lean`: three "declaration uses `sorry`" warnings (lines 56, 65, 84), exit 0; on `RelativeDarbouxTargets.lean`: one (line 24), exit 0. Dependency check:

```
depcheck: 205 roadmaps, 1546 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Inside the family (which the check does not see), the README now cites no sibling as a supplier: the only mentions of IntegrableSystems (line 283), HamiltonianReduction R3 and ConvexityToric T4 (line 480) are downstream statements; HamiltonianReduction R1a, R3.1 and IntegrableSystems I5 consume C4 and C3 downward (`HamiltonianReduction/README.md` lines 73, 276, 286; `IntegrableSystems/README.md` lines 14, 308, 465).

**Signatures.** `#check @` of all eight declarations of `Suggested.lean` and both of `RelativeDarbouxTargets.lean` elaborated on scratch copies. `canonicalForm_exists` carries `[FiniteDimensional ℝ E]` and quantifies over every `z₀ : Cotangent I M`, every `w` in the target of `extChartAt (cotangentModel I) z₀` and every `v : Fin 2 → E × (E →L[ℝ] ℝ)`; `liouville_inChart` additionally `[I.Boundaryless]`; `liouville`, `IsSmoothOneForm`, `liouville_section`, `IsLagrangianEmbedding` carry no finiteness hypothesis and need none. All agree with the README's "finite-dimensional, boundaryless" conventions and statements. `symplectic_subspace_extension` carries `[FiniteDimensional ℝ V] [FiniteDimensional ℝ W]` and `finrank V = finrank W` as the README's "equal-dimensional symplectic vector spaces" requires.

**One-tactic probes.** Each `sorry` of `Suggested.lean` (`canonicalForm_exists`, `liouville_inChart`, `liouville_section`) replaced by `first | rfl | simp | infer_instance | exact Iff.rfl` on a scratch copy: none closes. The probe's residual goal for `canonicalForm_exists` shows `simp` reducing the right side to `(v 1).2 (v 0).1 − (v 0).2 (v 1).1`, which is `Σ dqᵢ∧dpᵢ` on `(v 0, v 1)`: the family's ω = −dλ convention, matching Cannas da Silva lines 614 and 658–659 (ω = −dα, locally Σ dxᵢ∧dξᵢ). `symplectic_subspace_extension` with `first | rfl | simp | infer_instance`: does not close. No padding in `Suggested.lean`; one padded declaration in the companion file (R03).

**Seeded sample** (Cannas da Silva, author-page text, cache `0b1c3a1f…`; printed page = page marker − 8):

| Target | Source and locator | Result |
|---|---|---|
| Fixed points and finite iterates | Prop. 5.1, p. 29 (CdS lines 1300–1306): `d_{x_0}ψ = (d_xf + d_yf)` at `(x_0,x_0)`; fixed point of φ ↔ critical point of ψ, via the point `(x_0,x_0,ξ,ξ)` of the graph | Supports README lines 256–262 exactly (`dψ_q = d_1S(q,q)+d_2S(q,q)`, `q ↦ (q, d_1S(q,q))`) |
| Chains of generating functions | Prop. 5.2, p. 30 (lines 1320–1333): `f^{(2)}(x,y) = f(x,z_0)+f(z_0,y)` at the unique nondegenerate critical `z_0`, generating `φ^{(2)}` under a global uniqueness hypothesis; the exercise (lines 1355–1360) for `f^{(3)}` | Supports README lines 285–294, which state the local-branch version and say where the source's global hypothesis enters. The cyclic chain form (lines 264–283) is the README's own generalization; verified by computation below |
| Convex planar billiards | §5.2, pp. 30–32 (lines 1361–1418): 1-periodic arclength χ, convexity as "each tangent line meets ∂Y only at its point of tangency", `f(x,y) = −|χ(x)−χ(y)|`, `df/dx = v`, `df/dy = −w`, periodic points as critical inscribed N-gons, the annulus `ℝ/ℤ×(−1,1)`, area preservation | Supports README lines 300–345 with L in place of 1; the twist sign, measure, circle and maximizer statements are the README's own, verified below |
| Finite-volume recurrence | Thm. 5.3, p. 32 (lines 1420–1433): area-preserving diffeomorphism of a finite-area manifold, neighborhood U of p, some `q ∈ U` and `N > 0` with `φ^{(N)}(q) ∈ U`; the remark (line 1435) generalizes to volume-preserving maps | Supports README lines 347–363; the measure-theoretic form is Mathlib's `Conservative.exists_mem_iterate_mem'` (`Mathlib/Dynamics/Ergodic/Conservative.lean` line 58) applied to an open U of positive measure |
| Neighborhood germs with prescribed ambient derivative | Thm. 8.4, p. 48 (lines 1974–1985): compact Lagrangian X for two forms on one M, φ fixing X with `φ*ω₁ = ω₀`; Thm. 9.3, p. 51 (lines 2107–2116): the T*X model; Thm. 7.4, p. 45 (lines 1845–1856): relative Moser with `ω₀|_p = ω₁|_p` for all `p ∈ X`, X compact | The README (lines 427–437) says these give "the Lagrangian case without the derivative prescription" and that the general statement is proved by the construction: correct description. Weinstein 1971 not readable (see below); the construction itself verified by computation |

Other locators added at this head, each verified: §§2.2–2.3 pp. 9–10 (lines 601–661: `α = Σ ξᵢ dxᵢ`, `ω = −dα`, `α_p = (dπ_p)*ξ`, the section characterization `μ*α = μ`); Thm. 6.5 p. 37 (line 1558, tubular neighborhood); Prop. 6.8 p. 39 (lines 1639–1641: closed ℓ-form with `i*ω = 0` is `dμ` with `μ_x = 0` on X, which is the README's `i*η = 0` case); Thm. 8.1 p. 46 (line 1875, Darboux; line 1885 proves it from Thm. 7.4 with `X = {p}`, as the README says); Thm. 8.6 p. 49 (lines 2030–2040: two forms on one M, X coisotropic for both, `i*ω₀ = i*ω₁`, as the README says); Thm. 9.1 p. 51 (line 2093, `NX ≅ T*X`).

**Adversarial table** (values computed on each side; the billiard, circle and chain rows were also recomputed numerically on the ellipse with semi-axes 2 and 1 over 2000 random chords, and on a quadratic generating function):

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `canonicalForm_exists`: chart expression equals `strongDualCotangentSymplecticForm` | Mathlib's Hom-bundle trivialization at `x₀` sends `p` to `p ∘ (coordinate change from the x₀-chart to the x-chart)`, i.e. the covector in the x₀-chart basis | `strongDualCotangentSymplecticForm_apply` (StrongDual.lean line 91): `y.2 x.1 − x.2 y.1 = (dq∧dp)(x,y)`; `−d(Σ pᵢ dqᵢ) = Σ dqᵢ∧dpᵢ` | the natural cotangent charts carry exactly this form; existence true, no stand-in | none |
| `canonicalForm_exists`, degenerate inputs | `v` arbitrary (junk outside the chart target excluded by `w ∈ target`); `M` a point (`E = 0`): T*M a point, form 0, nondegenerate on the zero space | `IsSymplectic` = closed ∧ `IsNondegenerate` (TwoForm.lean lines 68, 92) | consistent | none |
| `liouville_section`: `s_α*λ = α` | any smooth α, `v ∈ T_xM` | `λ(ds_α v) = α(x)(dπ ∘ ds_α v) = α(x)(v)` since `π ∘ s_α = id` | holds; needs only smoothness of `s_α` (`IsSmoothOneForm`) | none |
| Prop. 5.1 dictionary | `S(q,Q) = aqQ + bq²/2 + cQ²/2` on ℝ, `a ≠ 0` | `p = aQ + bq`, `P = −(aq + cQ)`; `ψ = (a + (b+c)/2)q²`, `dψ = (2a+b+c)q`; fixed point at `Q = q` iff `(2a+b+c)q = 0` | same equation both sides | none |
| Chain: matching-covector equations | N = 1, 2, 3 | `∂_{q_i}A = d_2S_{i−1}(q_{i−1},q_i) + d_1S_i(q_i,q_{i+1})`, zero iff outgoing covector of edge i−1 = incoming of edge i; N = 1: `d_1S_0(q_0,q_0) + d_2S_0(q_0,q_0) = dψ` | holds; the map `(q_0, d_1S_0(q_0,q_1))` iterates to `(q_i, d_1S_i(q_i,q_{i+1}))` and returns to itself | none |
| Chain elimination, N = 2 | the quadratic S above, `q_0 = 0.37`, `p = −0.52` | eliminated `q_1 = −a(q_0+q_2)/(b+c)` equals the true intermediate base point; `∂_{q_0}S_{(0…2)} = p`, `−∂_{q_2}S_{(0…2)} = P_2` to `10⁻⁶`; mixed Hessian `−1.53636` vs `−a²/(b+c) = −1.53636` | holds; nondegenerate iff `b + c ≠ 0` | none |
| Billiard: `v = ∂_sS`, `w = −∂_tS` | 2000 random chords of the ellipse | `∂_sS = e·χ′(s) = v`, `−∂_tS = e·χ′(t) = w` (tangential component preserved by reflection), agreement to `10⁻⁵` | holds | none |
| `∂_s∂_tS < 0` | same chords, with `e = vχ′(s) + √(1−v²)n(s)` inward at s and outward at t | `∂_t∂_sS = (e^⊥·χ′(s))(e^⊥·χ′(t))/ℓ = −√(1−v²)√(1−w²)/ℓ`; numerically negative on every chord, maximum `−0.0020`, matching the formula to `10⁻³` relative | holds; `∂t/∂v = 1/∂_t∂_sS < 0` | none |
| Existence/uniqueness of the next collision | `t ↓ s`: `e → χ′(s)`, `v → 1`; `t ↑ s+L`: `e → −χ′(s)`, `v → −1` | `v(s,·)` strictly decreasing from 1 to −1 on `(s, s+L)` | the relation over `{s<t<s+L}` is the graph of `β̃` onto `(−1,1)`; tangent collisions excluded | none |
| `β̃*λ − λ = dℓ`, `β̃*ω = ω` | `λ = v ds`, `β̃(s,v) = (t,w)` | `dS = v ds − w dt`, so `w dt − v ds = −dS = dℓ`; `d` of both sides | holds | none |
| Invariant measure, mass | `volume (univ : Set (AddCircle L)) = ofReal L` (`AddCircle.measure_univ`, `IntervalIntegral/Periodic.lean` line 69); Lebesgue on `(−1,1)` mass 2 | product mass `2L`; `u = s/L`, `v ds = (Lv) du` | `p = Lv`, area `∫_0^1∫_{−L}^{L} dp du = 2L` | none |
| Circle return map | radius R, `L = 2πR`, `v ∈ {0, 0.5, −0.3}` | ray from `(R,0)` at angle `arccos v` to the tangent meets the circle at central angle `2 arccos v`, arc `2R arccos v`; `w = v` by symmetry | `β(s,v) = (s + 2R arccos v, v)` | none |
| Perimeter maximizer has no consecutive coincident vertices | `q_i = q_{i+1} = a`, neighbours b, c; N = 2 from `(a,a)` | gain `|a−d| + |d−c| − |a−c| > 0` for d on the curve off the segment `[a,c]` (strict convexity); `a = c`: gain `2|a−d|`; N = 2: gain `2|a−d|` | holds for every N ≥ 2 | none |
| N = 4 circle maximizer | unit circle | doubled diameter 8; inscribed square `4√2 ≈ 5.657` | maximizer has least period 2, as README line 344 says | none |
| Recurrence with full support | any nonempty open U | `μ(U) > 0`; `MeasurePreserving.conservative` needs `IsFiniteMeasure` (Conservative.lean line 64); `exists_mem_iterate_mem'` gives `x ∈ U`, `m ≠ 0`, `f^[m] x ∈ U`; a.e. version needs `SecondCountableTopology` and `OpensMeasurableSpace` (line 197) | holds with exactly the README's hypotheses; `AddCircle L × (−1,1)` is second countable, compact (`AddCircle/Real.lean` line 33, needs `Fact (0 < L)`) | none |
| Prescribed-derivative germ: block form | splittings `TM|Q = TQ ⊕ ν_M`, `TN|Q′ = TQ′ ⊕ ν_N` | `A ∘ di = dj ∘ df` forces `A(v,0) = (df v, 0)`, so `A(v,n) = (df v + Bn, Cn)` with C invertible | holds | none |
| Derivative of the tubular extension along Q | vertical `n`: `q′ = exp_{f(q)}(Bn)` to first order `Bn`, transport of `Cn` over a zero-length path is `Cn`; horizontal `v`: `(df v, 0)` | `(v,n) ↦ (df v + Bn, Cn) = A` | holds | none |
| Zero-first-jet primitive | fiber coordinates y, η with coefficients `O(|y|)`, radial field `O(|y|)` | `ι_rad η = O(|y|²)`, `β = ∫_0^1 t⁻¹ ρ_t^*(ι_rad η) dt = O(|y|²)`; Moser field zero first jet; `dψ_t = id` along Q by the variational equation | holds | none |
| Degenerate submanifolds | `Q = ∅`; a point; `Q = M` compact with `f : M → N` | empty: vacuous; point: Darboux with prescribed linear part; `Q = M`: `A = df`, symplectic iff f is, `Φ = f` | consistent | none |
| `symplectic_subspace_extension` | `S = 0` (needs `finrank V = finrank W`, present); `S = V` (then `T = W`, `e = f`); `S` a Lagrangian line in ℝ², `T` another line, any `f` (both restricted forms zero) | existence in each case; without `hdim` and `S = 0` no `e` exists | consistent; degenerate S allowed as README line 408 says | none |
| `IsLagrangianEmbedding` | `Q = M`, `i = id`: `tangentRange = ⊤`, Lagrangian iff `dim M = 0`; `IsLagrangian` = `orthogonal L = L` (Lagrangian/Basic.lean line 99) | consistent with half-dimension | none |
| Two-point intersection (C2.2) | compact Q with ≥ 2 points; f constant / nonconstant | constant: all of Q; nonconstant: argmin ≠ argmax | holds; fails for a one-point Q, excluded | none |

**Library declarations opened at the pins** (Mathlib 6b7abb3c, Tau Ceti a91d3aa): `SmoothTwoForm` (TwoForm/Basic.lean line 61: a `ContMDiffSection` of continuous bilinear forms plus `isAlt`), `inChartAt` (TwoForm/Closed.lean line 86: value at `(extChartAt x₀).symm z` composed with `tangentCoordChange I x₀ y y`, junk outside the target), `IsClosed` (line 296), `IsNondegenerate`, `IsSymplectic`, `IsNondegenerate.symplecticFormAt` (Symplectic/Manifold/TwoForm.lean lines 68, 92, 99), `strongDualCotangentSymplecticForm` and its `_apply` (Cotangent/StrongDual.lean lines 82, 91), `cotangentLiouvilleForm` (Cotangent/Liouville.lean line 71), `SmoothEmbedding.tangentRange` (SmoothEmbedding/NormalSpace.lean line 43), `SymplecticForm` (AlmostComplex.lean line 343), `IsLagrangian` (Lagrangian/Basic.lean line 99), `IsSymplectomorphism` (SymplecticTransport.lean line 121); Mathlib `MeasurePreserving.conservative`, `ae_mem_imp_frequently_image_mem`, `ae_frequently_mem_of_mem_nhds` (Conservative.lean lines 64, 159, 197), `AddCircle.measure_univ` (IntervalIntegral/Periodic.lean line 69), `AddCircle.compactSpace` (AddCircle/Real.lean line 33). No file under `Mathlib/Geometry/Manifold/` mentions `AddCircle`, so the README's "never as a manifold" is the right choice. All five `TauCeti.*` modules imported by the two Lean files exist with built object files.

**Ownership and duplication.** `roadmaps grep` over the 439 open pull requests and main: convex billiards, the generated-map fixed-point dictionary and the prescribed-derivative neighborhood theorem appear only in this folder; "Witt extension" hits are quadratic-form roadmaps (GlobalQuadraticForms, OrthogonalSpinGroups), not the symplectic one; Poincaré recurrence is cited, not planned, elsewhere. No sibling `Suggested.lean` of the family declares `Cotangent`, `cotangentModel`, `liouville`, `IsSmoothOneForm`, `IsLagrangianEmbedding` or `canonicalForm_exists` (HamiltonianReduction's file consumes `Cotangent I M`). Mathlib at the pin has no polar decomposition of matrices as such and no connectedness or maximal-compactness theorem for `unitaryGroup`, `symplecticGroup` or `GeneralLinearGroup` (grep), so C2.0 and C2.1 are owned here (R01 asks that the statable ones be stated).

**Cross-roadmap citations resolved** (on main or at the pull request's head): HeegaardFloer F2.1 (on main, `TauCetiRoadmap/HeegaardFloer/README.md`, heading "4.1 Symplectic and almost-complex foundations (F2.1)"); SmoothBundlesConnections B1, B2–B4, B6.1; ComplexKahlerGeometry Hodge parity; DifferentialGeometry Layer 4 and 5.4; GeometricTopology tubular neighborhoods; `Completed/UniversalCovers`; LieGroups Layers 2, 7, 9; ContactGeometry CG1, CG4, CG5 (same pull request, anchors match); IntegrableSystems I5.2 (same pull request, heading at line 361). The worker's `roadmaps resolve` found no unresolved citation or Lean name; I confirmed each by reading.

## Not verifiable

- Weinstein, *Symplectic manifolds and their Lagrangian submanifolds*, Adv. Math. 6 (1971): the sources service refuses the DOI `10.1016/0001-8708(71)90020-X` as a paywalled publisher and records it as uncertified. The README cites it only alongside Cannas da Silva Thms. 8.4 and 9.3, whose text I read; the prescribed-derivative construction was checked by computation.

## Source issues

- **Misprint** in CdS at §5.2, printed page 32: the displayed sum of the generating function over the sides of an inscribed N-gon is written equal to the perimeter; it should be minus the perimeter, since the generating function is minus the chord length; affects nothing.
