# Repair report: HochschildHomologyAndHKR, design round 3

Review resolved: `REV-DESIGN-HochschildHomologyAndHKR~2` (ten findings R01–R10; verdict in
`packages/HochschildHomologyAndHKR/design/review.json`). Files edited:
`packages/HochschildHomologyAndHKR/design/README.md` and
`packages/HochschildHomologyAndHKR/design/plan.json`. The manifest
`packages/HochschildHomologyAndHKR/sources.toml` needed no change: no new work is cited, and HKR62
already lists §7.3 in `cited_for`. No `needs-references.toml` was written. There is no
`Suggested.lean` at the design stage, so no elaboration and no `#check` binder audit were run.

Pins used for every library claim: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5` (from `lake-manifest.json` of the content checkout).

## REV-DESIGN-HochschildHomologyAndHKR~2/R01 (P2) — applied

Change: §1.2 now builds `Y(A,M)` on `TauCeti.hochschildBimoduleCoface`, imports the coface
identities, and identifies the differential with `TauCeti.hochschildBimoduleCoboundary`
(formula, `δ∘δ=0`, degree-0/1 values imported). §3.2 cites the central-cocycle iff; §3.3 uses
`TauCeti.BimoduleDerivation`, keeping the cocycle, inner and `HH¹` comparisons as adapters.
Scope, Tau Ceti contract, Dependencies, plan 1.2/3.2/3.3 and baseline updated.

Verified at the Tau Ceti pin: `TauCeti/RingTheory/HochschildCohomology/Coboundary.lean` lines 226
(`hochschildBimoduleCoface`), 282 (coface identities, under `SMulCommClass A Aᵐᵒᵖ M`), 303
(`hochschildBimoduleCoboundary = Σ (−1)^i ∂_i`), 318, 329/345 (`δ∘δ=0`), 351/359 (degree zero:
`a m − m a`, cocycle iff central), 371/382 (degree one: Leibniz iff); `TauCeti/RingTheory/Derivation/Bimodule.lean:41`
(`BimoduleDerivation`, with `D 1 = 0` as a field, lines 84–101 for `map_one_eq_zero`, `leibniz`,
`map_algebraMap`). Mathlib's `AlternatingCofaceMapComplex.objD` is `Σ (−1)^i X.δ i`
(`Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean:305`), the same sign. The pin has no
codegeneracies and no complex/cohomology for these cochains, so those stay here. The plan baseline
was the obsolete Mathlib `f6090c70…`/Tau Ceti `358314d4…`; now the pins above.

Same pattern elsewhere: two further native objects recorded as kept variants with the one respect
in which ours differs: `TauCeti.hochschildCochainComplex` (computes `HH^n(A, Hom_k(A,M))`,
`TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`, `Dual.lean:138`) and
`TauCeti.normalizedHochschildChains` (`CyclicCohomology/Normalized/Chains.lean:69`, coefficients
`A` only; its last face is `(a_{n+1}a₀, a₁, …)`, matching ours). All other backticked library names
of the README were re-resolved at the new pins (all present).

## REV-DESIGN-HochschildHomologyAndHKR~2/R02 (P2) — applied

Change: §7.3 no longer owns projectivity or the retract proof. It imports Mathlib
`exteriorPower.instFinite`, Tau Ceti `exteriorPower.instProjective`, and the finite-projective
evaluation of EulerSystemsAndKolyvaginSystems §6.1 (carrier IntegralIwasawaTheory §12.6), keeping
only the adapter `pairingDual_P = (⋀^n evalEquiv)^* ∘ evaluation_{P*}`. New supplier contracts,
scope deferral, §7.6 route, Layer 7 Dependencies, plan suppliers, 7.3, 7.6.

Verified: `TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:145` (`instProjective`, no finiteness);
`Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:29,182`; `Mathlib/LinearAlgebra/Dual/Lemmas.lean:141,145,262`
(dual projective, dual finite, reflexivity) and `Dual/Defs.lean:216` (`evalEquiv`).
EulerSystemsAndKolyvaginSystems §6.1 at its open head: "Prove that evaluation is an isomorphism
for finite projective X", for any commutative `R` and `R`-module `X`, on
`TauCeti.StarkSystems.toExteriorBidual` (IntegralIwasawaTheory §12.6 at its open head: defined for
every commutative ring by flipping `pairingDual`). Both are earlier in the merge order (lines 105
and 29); the gate shows no upward edge. Evaluation at `X = P*` composed with `(⋀^n ev_P)^*` sends
`f₁∧⋯∧f_n` to `v ↦ det(f_i(v_j))`, the transpose of `pairingDual`'s `det(f_j(v_i))`.

## REV-DESIGN-HochschildHomologyAndHKR~2/R03 (P3) — applied

Change: §6.1 `n = 2` control: `f(a,b) = a` on `k[x]` (not bilinear: `f(1,0) = 1`) → the bilinear
cochain `f(a,b) = a ∂_x b` on `ℤ[x]`, with `δf = ab ∂_x c`, wrong model
`s(2a(∂_x b)c − ab ∂_x c)`; at `(1,x,1)` the correct bracket is `0` and the model `s(2)`. Plan
test `susp_n2` replaced likewise.

## REV-DESIGN-HochschildHomologyAndHKR~2/R04 (P1) — applied

Change: §6.2 Check `(p,q) = (0,1)`: "both sides equal `x g(a) − g(a) x`" → `g(a) x − x g(a)`, with
the derivation (`x∘g = x∘δg = 0`, leaving `δx∘g`) and the witness `Mat₂(ℤ)`, `x = E₁₁`, `g = id`,
`a = E₁₂`: both sides `−E₁₂`, reversed expression `E₁₂`. Main identity unchanged. Plan test split
into `homotopy_10_20` and `homotopy_01`.

## REV-DESIGN-HochschildHomologyAndHKR~2/R05 (P2) — applied

Change: §8.5 `⟨g∂₁, ∂₂, …, ∂_m⟩` → `g · ⟨∂₁, …, ∂_m⟩` and `Φ^m_HKR(g · (∂₁ ∧ ⋯ ∧ ∂_m))`, for every
`m`, with the first-column form stated for `m ≥ 1` by multilinearity; new Check `m = 0`, `k = ℤ`,
`g = 2`: all three sides `2 ∈ HH⁰(ℤ,ℤ)`, the old reading gives `1`. `m = 1` Check and plan 8.5
statement/tests updated.

## REV-DESIGN-HochschildHomologyAndHKR~2/R06 (P3) — applied

Change: §1.2 Check "dropping `δ⁰` makes every `m` a cocycle" → the variant is `m ↦ (a ↦ −m a)`,
kernel `0` (at `a = 1`) instead of the centre (`ℤ` versus `0` for `A = M = ℤ`). §8.3 Check
"`ι` is the identity of `k`" → `ι₀ = id_k`, `ι_n = 0 → B_n(k)` for `n > 0`, a homotopy equivalence,
not the identity complex map. Plan tests updated.

## REV-DESIGN-HochschildHomologyAndHKR~2/R07 (P2) — applied

Change: Layer 3 Examples "`HH₀(Mat_n(k)) ≅ k` through the trace" → "for every `n ≥ 1`", with
`n = 0` noted (zero ring, `HH₀ = 0`); new §3.1 Check: trace iso for `n ≥ 1` (identity at `n = 1`),
negative control `n = 0` (trace `0 → k` not an isomorphism for nonzero `k`); plan test
`hh0_matrix_size`. No other unrestricted `Mat_n` claim exists.

## REV-DESIGN-HochschildHomologyAndHKR~2/R08 (P3) — applied

Change: every nonexample/nonzero Check now names its rings: all lines the review lists (160, 538,
684, 735–736, 769, 774, 925–926, 1406, 1523) and, same pattern, §§1.1, 1.5, 2.1, 2.2, 3.2, 3.5,
4.1, 4.2, 4.5, 5.1, 7.5, 8.1, 8.2 Checks. §8.3's unsigned-map and §6.1's uniform-sign controls need
`2 ≠ 0` (over `𝔽₂` both coincide) and say so. New Conventions bullet: zero-ring positive control.

Theorem and construction statements stay over arbitrary `k`. Plan tests qualified correspondingly.

## REV-DESIGN-HochschildHomologyAndHKR~2/R09 (P3) — applied

Change: §7.5 "Evaluation: for `R` flat over `k`" → "for every commutative `k`-algebra `R`, flat or
not", with the chain-level computation (Σ_σ of `n!` equal determinants; Leibniz expansion);
*Needs:* adds §§6.4(a), 7.1; new Check on the non-flat `𝔽₂[x,y]/ℤ` (`1` and `2·1 = 0`). Plan 7.5
api, prerequisites (`target:6.4`, `target:7.1`) and test `det_eval_nonflat`.

Same pattern elsewhere: the remaining flatness hypotheses (§1.4 chains, §6.3, the comparison
clauses of §6.4, §7.6 through smoothness) are each needed by a stated counterexample or route; none
left on a classical-only statement.

## REV-DESIGN-HochschildHomologyAndHKR~2/R10 (P3) — disputed

No edit. The house form `# Roadmap: <lower-case title>` is sentence case, with proper names kept:
on main, `TauCetiRoadmap/ChevalleyGroups/README.md:1` "Chevalley groups and the Chevalley–Demazure
group schemes", `TauCetiRoadmap/KacMoody/README.md:1` "Kac–Moody algebras, …",
`TauCetiRoadmap/FuchsianOrbifolds/README.md:1` "Fuchsian groups and orbifold Riemann surfaces",
`TauCetiRoadmap/GrothendieckEulerForms/README.md:1` "Grothendieck groups, Cartan maps, and Euler
forms". Our title's only capitals are the surnames Hochschild, Kostant, Rosenberg; every common
noun ("homology", "theorem") is already lower case. Lower-casing the surnames would misspell them,
which the review itself rules out for prose.

## Checks

Dependency check, after all edits:

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2136 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the edited README: no cross-roadmap citation and no
Lean name found nowhere (it does not check names outside TauCetiRoadmap, so every Mathlib and Tau
Ceti name of the README was grepped at the pins: all present; `TauCeti.StarkSystems.toExteriorBidual`
is a supplier roadmap's planned name, cited as such). `plan.json` parses; every `target:`
prerequisite resolves; 37 targets. No gate failures were listed for this round. No LaTeX
delimiter, machine path, pull-request number or process word was introduced.

Ownership against open work for the new imports: `roadmaps grep` over main and all indexed open
heads for `pairingDual`, finite-projective exterior duality and the bimodule coboundary found only
EulerSystemsAndKolyvaginSystems §6.1 and IntegralIwasawaTheory §12.6 (duality), KTheoryLowDegrees
(projectivity only, which the Tau Ceti pin already has) and NoncommutativeGeometry (the bounded
coboundary, out of scope). Open pull requests not indexed by the service were not checked.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.2 differential = `hochschildBimoduleCoboundary` | `n = 0`, `A = M = ℤ`; `n = 0`, `Mat₂(ℤ)`, `m = E₁₁`, `a = E₁₂`; `n = 1` | Mathlib `objD = Σ(−1)^i δ_i`, Tau Ceti `Σ(−1)^i ∂_i`; `δm(a) = am − ma`: `0` on `ℤ`, `−E₁₂` on the matrix; `δf(a,b) = af(b) − f(ab) + f(a)b` both | holds | §1.2 rewritten |
| §1.2 dropped-`δ⁰` control | `A = M = ℤ`; `Mat₂(ℤ)`; `k = 0` | variant `m ↦ −ma`: kernel `0` vs correct `ℤ`; `0` vs `ℤ·I`; `0 = 0` | discriminates for nonzero `k` | Check corrected |
| §3.2 route | `Mat₂(ℤ)`; `ℤ[x]` | `B⁰ = 0`; `Z⁰ = ℤ·I`; `Z⁰ = ℤ[x]` | holds | route cited |
| §3.3 `Der = ` maps of `BimoduleDerivation` | `∂_x` on `ℤ[x]`; `g(1)=1, g(x^j)=0`; `k = 0`; `Mat₂(ℤ)` | `∂(1) = 0` and Leibniz hold; `g`: Leibniz at `(1,1)` gives `1` vs `2`, `g(1) = 1`; identity is the zero derivation; `δE₁₁(E₁₂) = −E₁₂`, `innerDerivation E₁₁ (E₁₂) = E₁₂` | `D(1)=0` loses nothing (`D(1) = 2D(1)`) | §3.3 rewritten, Check added |
| §3.1 `Mat_n` trace | `n = 1`; `n = 2` over `𝔽₂`; `n = 0`, `k = ℤ`; `n = 0`, `k = 0` | `id_k`; span of `E₁₂, E₂₁, E₁₁ − E₂₂` = trace-zero, quotient `𝔽₂`; `0 → ℤ` not iso; `0 → 0` iso | needs `n ≥ 1` (and `k ≠ 0` for the control) | Example qualified, Check added |
| §6.1 `n = 2` sign control | `f(a,b) = a∂_x b` on `ℤ[x]` at `(1,x,1)` and `(x,x,x)` | `δf = ab∂c`: `0`, `x²`; `[m,Θf]`: `s(1 − 0 + 0 − 1) = 0`, `s(x² − x² + x² − 2x²) = −s(x²)`; model: `s(1 − 0 − 0 + 1) = s(2)`, `s(x²)` | model is `+Θδf` at one point and `2 ≠ ±0` at the other: neither sign | Check replaced |
| §6.1 uniform-sign remark | `x = E₁₁ ∈ Mat₂(ℤ)`; `k = 𝔽₂` | `Θ(δx)(sE₁₂) = −sE₁₂`, `2Θ(δx) ≠ 0`; over `𝔽₂` `±` coincide | qualifier needed | qualified |
| §6.2 `(0,1)` | `Mat₂(ℤ)`, `x = E₁₁`, `g = id`, `a = E₁₂` | LHS `g∪x − x∪g = E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`; RHS `δx∘g = −E₁₂` (`x∘g = x∘δg = 0`); old Check `+E₁₂` | P1 contradiction removed | Check corrected |
| §6.2 `(1,0)`, `(2,0)` | general `f`, `y` | `(1,0)`: six terms of `δf∘y` and four of `δ(f∘y) − f∘δy` cancel to `yf(a) − f(a)y`; `(2,0)`: twelve cross terms cancel in pairs to `yf(a,b) − f(a,b)y` | holds | kept |
| §7.3 adapter | `P = R²`, `n = 2`; transposed wedge; `P = 0`, `n = 0`; `P = R`, `n = 2`; `P = R^{(ℕ)}` | `1 = 1`; `−1 = −1`; `id_R`; `0 = 0`; infinite-rank form not in the image (finite hypothesis kept) | `det(f_i(v_j)) = det(f_j(v_i))` | §7.3 rewritten |
| §7.5 evaluation without flatness | `𝔽₂[x,y]/ℤ`; `ℤ[x,y]/ℤ`; `n = 0`; `n = 1` | cup `1`, determinant `2·1 = 0`; cup `1`, determinant `2`; both `r₀` (`0! = 1`, empty det `1`); both `r₀D(r₁)` | holds for every commutative `R` | flatness removed |
| §8.3 `m = 0` | `k = ℤ` | `K = ℤ` in degree 0; `B_n = ℤ`, `b′₁ = 0`, `b′₂ = 1`, `b′₃ = 0`; `ι₀ = id`, `ι₁ : 0 → ℤ`; homology `ℤ, 0, 0` on both | homotopy equivalence, not identity | Check corrected |
| §8.3 unsigned map | `j = 2` over `ℤ`, over `𝔽₂` | `b′ι′ − ι′d = 2(X₂⊗X₁⊗1 + 1⊗X₂⊗X₁ − 1⊗X₁X₂⊗1)`: nonzero over `ℤ`, `0` over `𝔽₂` | needs `2 ≠ 0` | qualified |
| §8.5 top degree | `m = 0`, `k = ℤ`, `g = 2`; `m = 1`; `m = 2`, `(X₁², X₂)` | `g·⟨⟩ = 2`, class `0!·2·[1] = 2`, `Φ⁰(2·1) = 2`; `g∂`; `g·⟨∂₁,∂₂⟩ = 2gX₁ = ⟨g∂₁,∂₂⟩ = det[[2gX₁,0],[0,1]]` | uniform in `m` | statement restated |
| Zero-ring convention | `k = 0` | `A = 0` (`1_A = algebraMap 1 = algebraMap 0`), `M = 0`; `Mat₂(0)`: `E₁₁ − E₂₂ = 0`; `t² = 0`; extension splits | all theorems hold with both sides `0` | Conventions bullet, Checks qualified |
| Conventions witness `b(E₁₂⊗E₂₁)` | `k = ℤ`; `k = 0` | `E₁₁ − E₂₂ ≠ 0`; `0` | qualified | edited |

## For the maintainer

- Two new supplier edges, both to roadmaps that are still open pull requests and earlier in the
  merge order: EulerSystemsAndKolyvaginSystems §6.1 (the finite-projective exterior-bidual
  evaluation) and IntegralIwasawaTheory §12.6 (its carrier). If either renumbers those sections
  before merging, §7.3's citation must follow. The gate places this roadmap after
  RefinedTraceMethods, below both.
- No section id, heading or target of this roadmap was renamed or removed, so nothing other roadmaps
  could cite changed; no roadmap consumes this one.
- R10 is disputed; if a human prefers otherwise, only line 1 changes.
- No `Suggested.lean` exists at this stage; no Lean was elaborated.
