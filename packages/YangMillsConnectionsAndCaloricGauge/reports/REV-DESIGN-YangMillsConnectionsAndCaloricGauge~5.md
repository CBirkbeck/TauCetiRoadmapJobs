<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7643#issuecomment-6723130091 -->
Review (claude) of bead714

Verdict: accepted
Conditional on the announced gaps: `lp-neumann-ball`, `lp-divcurl-normal-ball`, `hardy-inequality`, `compact-su2-subalgebra`

No finding. The one round-4 finding is repaired; the repaired passage, its route and its Checks were
recomputed; the fifteen sampled targets were read at their locators and tested on instances; every
library name cited this round was opened at the pin; the gate, the resolver and the ownership greps are
clean. The acceptance is conditional on the four declared supplier gaps (`lp-neumann-ball`,
`lp-divcurl-normal-ball`, `hardy-inequality`, `compact-su2-subalgebra`), which are contracts, not
findings.

Files reviewed: `packages/YangMillsConnectionsAndCaloricGauge/design/README.md` (1805 lines, 10
layers, 52 targets), `design/plan.json` (52 targets, 120 tests, 4 gaps), `sources.toml` (12 entries,
unchanged this round). Previous review: REV-DESIGN-YangMillsConnectionsAndCaloricGauge~4 (F01, P3);
repair report FIX-DESIGN-YangMillsConnectionsAndCaloricGauge~5. Elaboration: not available (this lane
does not elaborate; a design has no `Suggested.lean`). No finding re-raises a settled one.

## Verified sound

**Round-4 finding, repair by repair.**

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P3) 10.4's chart condition restated Mathlib's smooth embedding | README 10.4 (lines 1660–1667): "a chart `φ : V → 𝔅` with image `S ∩ U` that is a `C¹` smooth embedding in Mathlib's sense, `Manifold.IsSmoothEmbedding 𝓘(ℝ, E) 𝓘(ℝ, 𝔅) 1 φ`, where `V` is charted as an open subset of `E` (`TopologicalSpace.Opens.instChartedSpace`)", followed by the unpacking "one Banach space `F` … `u ↦ (u, 0)` through an isomorphism `E × F ≅ 𝔅`"; three API bullets (1669–1681); Mathlib contract (194–202) lists `Manifold.IsSmoothEmbedding`, `Manifold.IsImmersion`, `Manifold.IsImmersion.isDiffImmersionAt`, `TopologicalSpace.Opens.instChartedSpace`, `ContDiffAt.toOpenPartialHomeomorph`, `ContDiffAt.to_localInverse`; Scope (54–57) says the notion is "a subset with charts that are Mathlib's `C¹` smooth embeddings"; `plan.json` 10.4 carries the new statement and nine Mathlib/PDE prerequisites | Repaired, and the route completed: the slice is now linear (`E_a ⊆ ℋ`), the projection `P`, the gauge directions `𝒢_a`, the uniqueness step and `PL = id` are stated; the source's bound (7.10) is replaced by the `ℋ` bound the argument needs. Every step recomputed below |

**The repaired pattern elsewhere.** Grep of the README for "submanifold", "immersion", "embedding",
"homeomorphism onto", "complemented", "injective derivative": the only chart condition is 10.4's;
§1.2's "compact embedded submanifold" is consumed through Tau Ceti's tubular-neighbourhood theorems;
10.5's "tangent space of 10.4" is the range of `L`, complemented by `𝒢_a`, consistent with 10.5's bound
`‖b‖_ℋ + ‖c‖_{ℓ¹Ḣ²} ≲ ‖w‖_ℋ`.

**Pinned declarations opened this round** (`lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti
`2fd255d9`; paths under `Mathlib/`): `Manifold.IsSmoothEmbedding`
(`Geometry/Manifold/SmoothEmbedding.lean:70`, inside `namespace Manifold` at line 51; fields
`isImmersion : IsImmersion I J n f`, `isEmbedding : IsEmbedding f`; `IsSmoothEmbedding.id` at 78,
`.contMDiff` at 110); `Manifold.IsImmersion` (`Geometry/Manifold/Immersion.lean:802`,
`∃ (F : Type u) …, IsImmersionOfComplement F I J n f`); `Manifold.ImmersionAtProp` (`:143`: an
`equiv : (E × F) ≃L[𝕜] E''` with `(codChart.extend J) ∘ f ∘ (domChart.extend I).symm = equiv ∘ (·, 0)`
on the domain chart's target); `IsImmersionAtOfComplement` (`:174`, through
`LiftSourceTargetPropertyAt`, whose `LocalPresentationAt`
(`Geometry/Manifold/LocalSourceTargetProperty.lean:78–97`) asks both charts to lie in the maximal
`C^n` atlases and the domain source to map into the codomain source); `IsImmersion.isDiffImmersionAt`
(`Immersion.lean:1008`, hypothesis `n ≠ 0`), giving `IsDiffImmersionAt`
(`Geometry/Manifold/ImmersionDiff.lean:65`, `(mfderiv f x).HasLeftInverse`), and
`ContinuousLinearMap.HasLeftInverse` (`Analysis/Normed/Module/ContinuousInverse.lean:86`,
`∃ g : F →L[R] E, LeftInverse g f`); the module TODO (`Immersion.lean:89–95`) confirms that the converse
"a split derivative gives an immersion" is not at the pin, as the contract says;
`TopologicalSpace.Opens.instChartedSpace` (`Geometry/Manifold/HasGroupoid.lean:284`) with the
`IsManifold I n s` instance (`Geometry/Manifold/IsManifold/Basic.lean:1012`); the notation `𝓘(𝕜, E)`
(`IsManifold/Basic.lean:211`); `ContDiffAt.toOpenPartialHomeomorph`
(`Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean:31`, with `[RCLike 𝕂]`, `[CompleteSpace E]`)
and `ContDiffAt.to_localInverse` (`:66`). The 23 declarations of round 4 are unchanged at the same pins.
The resolver reports no Lean name and no cross-roadmap citation found nowhere.

**Supplier sections resolved on main.** PDE §3.2 (`TauCetiRoadmap/PDE/README.md:1344`, "Maximum
principles, the Hopf lemmas and the Aleksandrov–Bakelman–Pucci estimate"): its first paragraph takes
the weak maximum principle for weak solutions of divergence-form equations from the pinned
`TauCeti.PDE.value_le_of_energyFormH1_le`, so the contract clause "the weak maximum principle for weak
subsolutions of the Laplacian on balls (§10.4)" is exact. PDE §7.1 (2668) and §7.3 (2785) as in round 4;
the new contract clause names the `ℓ¹L²` product bound as derived from §7.3's decomposition and §7.1's
Bernstein inequality, and the derivation is recomputed below. The other supplier sections (PDE §1.2,
§1.4, §1.5, §1.6, §2.2, §2.3, §6.1, §6.3, §7.2; SmoothBundlesConnections B3.1, B4.1, B4.2;
CharacteristicClasses C4 item 1; DifferentialGeometry Layers 0, 1, 5.2–5.4, 10.3–10.5;
AlgebraicTopology Stage 6 item 5 and Stage 8 item 3; LieGroups Layers 0–2, 6; Yamabe Y2 item 1;
FourManifolds §5.3 at its head) were resolved in round 4 at the file lines recorded there and are
untouched by this repair.

**Gate.** Output of the dependency check, no UPWARD or CYCLE line:

```
candidate: YangMillsConnectionsAndCaloricGauge is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2346 edges, 0 problem(s)
```

**Principles and policy.** General compact `G ⊆ U(N)`, not assumed connected; `d ≥ 3` wherever the
sources allow, `d = 4` only for criticality. No re-planned roadmap; suppliers are consumed by section.
No algorithm, no copied passage. Greps for LaTeX delimiters, pull-request numbers, round labels, machine
paths and process words: empty; "lemma" occurs only in the name "Uhlenbeck's lemma". Ten layers, ten
`### Examples`, ten `### Dependencies`. No backticked Lean name of the roadmap's own, as fits a design.
`plan.json`: 10 layers, 52 targets, 120 tests, 4 gaps; every `kind = definition` target has at least three
tests; 10.4's prerequisites equal the README's `*Needs:*` line item by item; the PDE supplier entry lists
§3.2. (10.4 is recorded with `kind = theorem` and an empty `api` list, the three API items living in its
`statement` field, as in round 4; the README carries them as bullets, so nothing needs to change.)

**Sampled locators** (every one read at the cited lines this round):

| Target | Locator read | Result |
|---|---|---|
| 1.2 | OhTataru-TopClass 1057–1058 (a tubular neighbourhood of `G` on which the nearest-point projection `π_G` is a smooth map) | supports; the source uses the fact, the README proves it from Tau Ceti's tube and local retraction |
| 1.4 | OhTataru-TopClass 236–255 (`f` symmetric `Ad`-invariant `k`-linear, `f(F,…,F)` closed, `χ_f` for `d = 2k`, (1.4)); OhTataru-YMHF Lemma 6.7, 2860–2883 (`Y` with `dY = −⟨f∧f⟩`, Stokes) | supports |
| 2.1 | OhTataru-TopClass (1.5) at 283–285, 964–968 (`X_loc(U)`), 982–989 (`G^{k,p}`, `L^∞`, extension on balls) | supports |
| 2.2 | OhTataru-TopClass Lemma 3.2, 1038–1072 | supports the statement; the README's variant (`U` with compact closure in `X`, `O ∈ G^{k,d/k}_loc(X)`, cut-off only positive on `W`) is a kept variant it states; the source's `h = 1` on `W` (1049) is a gap under `V ∩ W = ∅` alone (Source issues) |
| 3.1 | OhTataru-TopClass 289–335 (cocycle, refinement, equivalence, compatibility `A_(α) = Ad(O_(αβ))A_(β) − O_(αβ);x`, curvature, `|F| ∈ L^{d/2}_loc`) | supports |
| 4.4 | OhTataru-TopClass Theorem 1.4, 342–353; norm convention 957–963 (`‖∂u‖_{L^{d/2}} + ‖u‖_{L^d}`); proof 1497–1561 (Lemma 3.18, Prop. 3.19, exhaustion `R_n ↗ R`) | supports |
| 5.1 | OhTataru-TopClass Theorem 1.3, 226–235; definition 382–390 | supports; the README's "`η'` vanishing near `0`" is stricter than the source's `1 − χ ∈ C_c^∞` and is needed for `η'O_(∞);x ∈ W^{1,d/2}_loc`, as its first Check computes |
| 5.5 | OhTataru-TopClass Corollary 1.11 and Remark 1.12, 451–466; OhTataru-Threshold Theorem 2.16, 1066–1067 | supports, including "no quantitative bound" |
| 7.3 | OhTataru-YMHF 315–320 (stereographic pullback, Uhlenbeck's removable singularity) | supports the removable-singularity clause; the decay rate is the inversion computation of 7.1 (row below) |
| 7.7 | OhTataru-TopClass Theorem 1.32, 910–918, Step 1 at 2268–2275, 2440–2451 (`E_i = 16π²/⟨α,α⟩`); OhTataru-YMHF Theorem 6.10, 2905–2918; OhTataru-Threshold Theorem 1.6, 277–283 | supports |
| 8.2 | OhTataru-YMHF Theorem 4.1, 963–967, proof 968–1010 (variational `σ = 1`, diamagnetic inequality, (4.4), duality, paradifferential `[P_{<k}, Δ_A]`); Theorem 4.2, 1111–1132 | supports; "unique" is not printed by the source and is derived below |
| 9.6 | OhTataru-YMHF Theorem 6.1, 2562–2589 | supports; the source's `(x_n, s_n) → (x₀, s₀)` is omitted with the reason stated in the README |
| 10.1 | OhTataru-YMHF 552–560 (`(a_∞)_j = O⁻¹∂_jO`, `O` unique up to constants), 584–592 (continuity for `a ∈ ℋ`, normalisation `O(∞) = 1`, Theorem 2.20), Lemma 7.3 at 3163–3211; OhTataru-TopClass Lemma 3.17, 1487–1496 | supports; the source's "constant conjugations" (558) means left multiplication, as the README writes (Source issues) |
| 10.2 | OhTataru-YMHF Definition 2.17 (564–568), Theorem 2.18 (571–574), Theorem 2.20 (591–592), Definition 7.1 and Proposition 7.2 (3000–3008), Proposition 7.4 (3213–3228), Corollary 7.6 (3275–3278), 3279–3282 | supports |
| 10.3 | OhTataru-YMHF Proposition 7.7, 3286–3290 (`‖A‖_{Ḣ¹} + ‖∂^ℓA_ℓ‖_{ℓ¹L² ∩ W^{1,4/3}} ≲_{Q,E} 1`); OhTataru-Threshold Theorem 2.8, 912–917 | supports |
| 10.4 | OhTataru-YMHF Theorem 7.8, 3294–3296; slice 3301–3306; Step 1 3307–3312; derivative 3315–3321; (7.9)–(7.10) at 3323–3326; Step 3 3327–3346 | supports the theorem; (7.10) is false as printed (row below, Source issues) |

Also read: OhTataru-Threshold 905–930 (Proposition 2.7, Theorem 2.8, `T^{L²}𝒞`), 1069–1075.

**Adversarial table** (repaired passages, sampled targets, headline theorems):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 10.4 definition against the pin | `S = ∅`; `S = 𝔅`; `S = {a}` | `∅`: vacuous; `𝔅`: `E = 𝔅`, `φ = id`, `F = 0`, `IsSmoothEmbedding.id` (pin line 78); `{a}`: `E = 0`, `V = {0}`, codomain chart `y ↦ y − a`, `equiv : 0 × 𝔅 ≅ 𝔅`, normal form `0 ↦ (0, 0)` | the pinned predicate (`ImmersionAtProp`, line 143) is exactly "`equiv ∘ (·, 0)` in charts of the maximal atlases on the domain chart's target", which the README's unpacking states | none |
| API 1 (left inverse ⇒ closed complemented tangent space) | `T = Dφ(v)`, left inverse `ℓ` | `Tℓ` idempotent with range `T(E)` and kernel `ker ℓ`; `T : E → T(E)` has inverse `ℓ|_{T(E)}` | tangent space closed, complemented by `ker ℓ`, `≅ E`; `isDiffImmersionAt` needs `n ≠ 0`, and `n = 1` | none |
| API 2 (converse by the inverse function theorem) | `Φ(u, w) = φ(u) + w`, `DΦ(v₀, 0)(h, k) = Dφ(v₀)h + k` | injective: `Dφ(v₀)h = −k ∈ R ∩ F = 0`; surjective: `𝔅 = R ⊕ F`; `Dφ(v₀) : E → R` bijective onto the closed `R`, bounded inverse by the open mapping theorem; `E × F` complete (closed subspaces), as `toOpenPartialHomeomorph` requires (`[CompleteSpace E]`, pin line 27) | normal form on a ball around `v₀` | none |
| API 2, one complement for all of `V` | `V` disconnected | on the ball served by one chart pair, `Dφ(v) = DΦ(v,0)∘(·,0)`, cokernel `≅ (E×F)/(E×0) ≅ F`; `{v : F_v ≅ F₀}` and its complement are both open | constant on connected `V`, so `IsImmersionOfComplement F₀` after composing with isomorphisms; the hypothesis "connected" is used and stated | none |
| API 3 (chart independence) | `φ₂⁻¹∘φ₁ = pr_{E₂}∘equiv₂⁻¹∘ψ₂∘φ₁` near `v₁` | `φ₁(u) ∈ φ₂(V₂)` for `u` near `v₁` since `φ₂` is a homeomorphism onto `S ∩ U₂`; `D(φ₂∘τ)(v₁) = Dφ₁(v₁)` gives `Dφ₁E₁ ⊆ Dφ₂E₂`; symmetric | equal | none |
| Product bound `‖[u,v]‖_{ℓ¹L²} ≲ ‖u‖_{Ḣ¹}‖v‖_{Ḣ¹}` on `ℝ⁴` | `u_j = 2^j‖P_ju‖₂ ∈ ℓ²` | `T_uv`: `‖P_{<k}u‖_∞ ≲ Σ_{j<k}2^{2j}‖P_ju‖₂ = Σ_{j<k}2^ju_j`, `‖P_kv‖₂ = 2^{−k}v_k`, `Σ_kΣ_{j<k}2^{j−k}u_jv_k ≲ ‖u‖_{ℓ²}‖v‖_{ℓ²}` (Young); `R(u,v)`: `‖P_k(P_juP̃_jv)‖₂ ≲ 2^{2k}‖P_ju‖₂‖P̃_jv‖₂ = 2^{2(k−j)}u_jv_j`, `Σ_{k≤j+C}2^{2(k−j)} ≲ 1`, `Σ_ju_jv_j ≤ ‖u‖‖v‖`; the Bernstein gain `2^{dj/2}` matches the `Ḣ¹` weight `2^j` exactly when `d/2 − 1 = 1` | holds in `d = 4`, as stated | none |
| `‖D(a)Δ_a⁻¹f‖_ℋ ≲ ‖f‖_{ℓ¹L²}` | `B = Δ_a⁻¹f`, `a ∈ 𝒞 ⊆ ℋ` (10.3) | `‖B‖_{ℓ¹Ḣ²} ≲ ‖f‖_{ℓ¹L²}` (8.2, needs `∂^ja_j ∈ ℓ¹L²`); `‖B‖_∞ ≤ Σ_k2^{2k}‖P_kB‖₂`; `∂[a,B] = [∂a,B] + [a,∂B]`: `L²·L^∞ + L⁴·L⁴`; `[a,B] ∈ L⁴` from `L⁴·L^∞`; divergence `∂^ℓ(D(a)B)_ℓ = f − [a^ℓ, D(a)_ℓB]` with `D(a)B ∈ Ḣ¹`, product bound | holds | none |
| `P` is a bounded projection of `ℋ` onto `E_a` with kernel `𝒢_a` | `h ∈ E_a`; `g = D(a)Δ_a⁻¹f`; `Ph = 0` | `D(a)^ℓ(Ph)_ℓ = D(a)^ℓh_ℓ − Δ_aΔ_a⁻¹(D(a)^ℓh_ℓ) = 0`; `h ∈ E_a ⇒ Ph = h`; `D(a)^ℓg_ℓ = f ⇒ Pg = 0`; `Ph = 0 ⇒ h = D(a)Δ_a⁻¹(D(a)^ℓh_ℓ) ∈ 𝒢_a`; `h ↦ D(a)^ℓh_ℓ` bounded `ℋ → ℓ¹L²` (definition of `ℋ` plus the product bound), so `E_a` is closed | holds | none |
| Uniqueness `c = Δ_a⁻¹(Δ_ac)` | `z = c − Δ_a⁻¹(Δ_ac)` | `Δ_az = 0`; `c ∈ C₀` (`O(∞) = 1` along the `C¹` family), `Δ_a⁻¹(Δ_ac) ∈ ℓ¹Ḣ² ⊆ C₀` (Bernstein, each block in `C₀`); `∂_j⟨z,z⟩ = 2⟨z,D_jz⟩` since `⟨z,[a_j,z]⟩ = 0`, `Δ|z|² = 2|D(a)z|² + 2⟨z,Δ_az⟩ = 2|Dz|² ≥ 0`; `|z|² ∈ H¹(B_R)` with boundary values `≤ ε` for large `R`; PDE §3.2 | `z = 0` | none |
| `PL = id`, range of `L` complemented | `Lb = b − D(a)c`, `b ∈ E_a`, `D(a)c ∈ 𝒢_a` | `P(Lb) = b`, so `‖b‖_ℋ ≤ ‖P‖‖Lb‖_ℋ`; `LP` idempotent, `range(LP) = range(L)`, `ker(LP) = ker P = 𝒢_a` (`L` injective) | `ℋ = range(L) ⊕ 𝒢_a` | none |
| Image of the chart is `𝒞 ∩ U` | normal-form ball `B_ρ`, local surjectivity onto `𝒞 ∩ B_ε(a)` (source 3327–3346) | `U := B_ε(a) ∩ Φ(W)`, `V := B_ρ ∩ φ⁻¹(U)` open: `φ(V) = φ(B_ρ) ∩ U ⊇ 𝒞 ∩ U` by surjectivity and `⊆ 𝒞 ∩ U` since `φ(B_ρ) ⊆ 𝒞` | an open `V ⊆ E_a` with `φ(V) = 𝒞 ∩ U`, as the definition asks | none |
| Source's (7.10) `‖D(a)c‖_{ℓ¹Ḣ¹} ≲ ‖Δ_ac‖_{ℓ¹L²}` | `𝔰𝔲(2)`; `a` caloric near `0` with `2^k‖P_ka‖₂ = 1/k` (`k ≥ 1`) through the chart at `0` (`Cal(b) = b + g(b)`, `g(b) ∈ 𝒢_0 ⊆ ℓ¹Ḣ¹`, so `a ∉ ℓ¹Ḣ¹` for `b ∉ ℓ¹Ḣ¹`); `c = jψ`, `ψ ∈ C_c^∞`, `ψ = 1` on `B₂` | `Δ_ac = Δc + [∂^ℓa_ℓ, c] + 2[a^ℓ,∂_ℓc] + [a^ℓ,[a_ℓ,c]]`: the first smooth, the second `ℓ¹L²` times a Schwartz function (`Σ_k‖P_kf‖₂‖c‖_∞ + ‖f‖₂Σ_k‖P_kc‖_∞ < ∞`), the third and fourth by the product bound; so `Δ_ac ∈ ℓ¹L²`; but `‖P_k[a,c]‖_{Ḣ¹} ≈ 2^k‖P_ka‖₂·|[i,j]|/|i| = 2/k` for large `k`, `Σ 2/k = ∞` | false as printed; the `ℋ` form `‖D(a)c‖_ℋ ≲ ‖Δ_ac‖_{ℓ¹L²}` holds (two rows above) and is all (7.9) needs | none (Source issues) |
| 10.4 Check `U(1)` | `𝔤 = iℝ` | `E_a = {∂^ℓb_ℓ = 0} = 𝒞` for every `a`; `Cal(a + b) = a + b`, `O = 1`, `c = 0`, `L = incl`; `𝒢_a = ∇Δ⁻¹(ℓ¹L²)`, `‖∇Δ⁻¹f‖_{Ḣ¹} = ‖f‖_{L²}/(4π²)·4π² ≤ ‖f‖_{ℓ¹L²}`; `P = h − ∇Δ⁻¹∂^ℓh_ℓ` | Leray projection, bounded on `ℋ` | none |
| 10.4 Check sphere | `φ(v) = (e+v)/‖e+v‖`, `ψ(y) = (y − ⟨y,e⟩e)/⟨y,e⟩ + (‖y‖−1)e` | `⟨φ(v),e⟩ = (1+‖v‖²)^{−1/2} > 0`; `y = (1+t)(e+v)/‖e+v‖` gives `⟨y,e⟩ = (1+t)/‖e+v‖`, `y − ⟨y,e⟩e = (1+t)v/‖e+v‖`, ratio `v`, `‖y‖−1 = t`; `ψ∘φ(v) = v + 0·e`; `ψ` and its inverse smooth on `{⟨y,e⟩ > 0}` (`‖e+v‖ ≥ 1`); `Dφ(0)h = h − e⟨e,h⟩·0 = h` for `h ⊥ e` | normal form for `𝔅 = e^⊥ ⊕ ℝe`, codimension one | none |
| 10.4 Check cross | `E` of dimension 0, 1, 2 | `(S ∩ U) ∖ {0}` has 4 components; a connected open subset of a line minus a point has 2, of the plane 1; a point is not a neighbourhood | excluded | none |
| 10.4 Check graph of `|x₁|` | `t ↦ (t³, |t|³)`; any chart `t ↦ (x(t), |x(t)|)` with `x(t₀) = 0` | derivative `(3t², 3t|t|)` continuous, `0` at `t = 0`; inverse `(x,y) ↦ x^{1/3}` continuous; `dim E = 2` excluded by invariance of domain (empty interior), `dim E = 0` by no isolated points; `x'(t₀) ≠ 0` would give one-sided derivatives `±|x'(t₀)|` of `|x|`, a corner; so `x'(t₀) = 0` and `(|x|)'(t₀) = 0` (minimum); `Dφ(t₀) = 0` has no left inverse | topological but not `C¹` split submanifold; separates the definition from "`C¹` homeomorphism onto `S ∩ U`" | none |
| 1.2 `U(1)` Check | `z = r e^{iθ}`, `h = a + ib` | `π(z) = z/|z|`, `π(1+i) = (1+i)/√2`; `dπ(1)h = h − Re h = ib`; the map `1 + h − Re h` has the same derivative but `|1 + ib| ≠ 1` for `b ≠ 0` | sound | none |
| 1.2 `U(N)` Check | `M_t = [[1,t],[0,1]]`, `U = (4+t²)^{−1/2}[[2,t],[−t,2]]` | `U*U = (4+t²)^{−1}[[4+t²,0],[0,4+t²]] = I`; `U*M_t = (4+t²)^{−1/2}[[2,t],[t,t²+2]]`, symmetric with trace `√(4+t²)` and determinant `1`, so positive definite: `U` is the polar factor; `|M_t − U|² = (2+t²) − 2√(4+t²) + 2 = 4 + t² − 2√(4+t²)`; at `t = 1`: `5 − 2√5 ≈ 0.528 < 1 = |M_1 − I|²`; Gram–Schmidt on columns `(1,0),(t,1)` gives `I` | sound; Gram–Schmidt is a retraction, not the nearest point | none |
| 1.2 `{±1}` and `0 ∉ 𝒰` Checks | `z` with `Re z ≷ 0`; `g ∈ U(N)` | `π = ±1`, `dπ = 0` onto `𝔤 = 0`; `|0 − g|² = tr(g*g) = N` for all `g` | sound | none |
| 1.4 transgression and Cartan form | `k = 2`, `F_t = t dA + ½t²[A∧A] = t dA + t² A∧A` | `2∫₀¹ t dt = 1`, `2∫₀¹ t² dt = ⅔`: `T_f(A) = tr(A∧dA + ⅔A∧A∧A)`; pure gauge `A = −R`: `dR = R∧R`, `tr(A∧dA) + ⅔tr(A³) = tr(R³) − ⅔tr(R³) = ⅓tr(R³)`; `F = −R∧R + R∧R = 0` | `ω_f = ⅓tr((dg g⁻¹)³)` | none |
| 1.4 `SU(2)` Check | `Φ(e₂) = diag(i,−i) = k`, `Φ(e₃) = [[0,1],[−1,0]] = i`, `Φ(e₄) = [[0,i],[i,0]] = j` | `tr(R³)(k,i,j) = 3tr(k[i,j]) = 3tr(2k²) = 6·(−2) = −12`; `(e₂,e₃,e₄)` positive for the outward-first orientation at `e₁`; `∫_{S³} = −12·2π² = −24π²`, `∫Φ*ω_f = −8π²` | sound; matches 6.4's `c₂ = −1` for `Φ` | none |
| 1.4 third Check | `f = −⟨·,·⟩` | `A∧dA ↦ ⟨a_j,∂_ka_l⟩dx^{jkl}`, antisymmetrised `tr(a_ja_ka_l) = ½⟨a_j,[a_k,a_l]⟩·(−1)`, `⅔·½ = ⅓` | the form `Y` of OhTataru-YMHF 2869 | none |
| 2.1 `log log` Check | `d = 4`, `φ = log log(1/r)` on `B_{1/e}` | `|∇φ| = 1/(r log(1/r))`, `|∇²φ| ≈ 1/(r² log(1/r))`; `∫|∇φ|⁴ r³dr = ∫dr/(r log⁴) = ∫₁^∞du/u⁴ < ∞`, `∫|∇²φ|² r³dr = ∫du/u² < ∞`; `|∂²O| ≲ |∇²φ| + |∇φ|²`; `φ → ∞` so `exp(φX)` has no limit at `0` | `O ∈ G^{2,2}(B_{1/e}) ∖ C⁰` | none |
| 2.1 vortex and finite `G` | `d = 3`, `O = e^{iθ}`; `G` finite | `|∇O| = 1/ρ`, `∫_{B₁}ρ^{−3}dx = ∫ρ^{−2}dρ = ∞`; `W^{2,3/2} ⊆ W^{1,3}` (`1/p* = 2/3 − 1/3`); a `W^{1,1}_loc` map into a finite set has zero derivative, locally constant | sound | none |
| 2.2 cut-off | `U = W = B₁`, `V = ∅`; `V = B₁∩{x₁<0}`, `W = B₁∩{x₁>0}`; `V = U`, `W = ∅` | a continuous `h = 1` on `B₁` is `1` on `∂B₁`, positive outside `U`; `exp(−1/(1−|x|²))` has values in `[0, e^{−1}]`, positive exactly on `B₁`; `V̄ ∩ W̄ = {x₁ = 0} ∩ B̄₁ ≠ ∅`, so no continuous `h` is `0` on `V` and `1` on `W`, while `exp(−1/x₁)·bump` is smooth, positive exactly on `W`; `O' = O` keeps the singularity of the `log log` map in `V` | the README's "positive on `W`" is what the route needs and the source's "`= 1` on `W`" is not available; for `U ⋐ X` the ball `B_{δh(x)}(x) ⊆ X` for small `δ`, so the Poincaré step needs no Lipschitz boundary | none |
| 3.1 scaling | `A_λ(x) = λA(λx)` | `F[A_λ](x) = λ²F(λx)`; `∫λ^d|F(λx)|^{d/2}dx = ∫|F|^{d/2}`; `d = 3`: `∫λ⁴|F(λx)|²dx = λ‖F‖²`, factor `λ^{1/2}` on the norm | sound | none |
| 3.1 line singularity | `d = 3`, `A = i dθ` | `|A| = 1/ρ`, `|∇A| ≈ ρ^{−2}`, `∫_{B₁}ρ^{−3}dx = ∞`: `A ∉ W^{1,3/2}_loc`, not even `L³` | excluded, as the Check says | none |
| 4.4 | `‖F‖_{L^{d/2}(B_R)} < ε₀`; `n = 0`, `p = d/2`; `d = 3`, `n = 1`, `p = 1` | 4.1 rescaled with constant independent of `R/r`; `F ∈ L^{d/2} ⇒ A ∈ W^{1,d/2}`, the Calderón–Zygmund range; `p = 1` excluded by `p ∈ (1,∞)` | hypotheses as in Theorem 1.4 (342–353) | none |
| 5.1 BPST representative | `O = Φ(x̄/|x|)`, off `B₂` | `B = Φ(Im(x̄dx))(1/(1+|x|²) − 1/|x|²) = −Φ(Im(x̄dx))/(|x|²(1+|x|²))`, `|B| ≈ |x|^{−3}`, `|∂B| ≈ |x|^{−4}`; `∫|x|^{−12}r³dr`, `∫|x|^{−8}r³dr < ∞`; near `0`, `B = A_BPST` smooth | `B ∈ Ḣ¹(ℝ⁴)` | none |
| 5.1 first and second Checks | `η' ≡ 1`; `G = {±1}` | `|∂(O;x)| ≈ |x|^{−2}`, `∫_{B₁}|x|^{−4}dx = ∞` in `ℝ⁴`; `1 − χ = 0 ∈ C_c^∞` is admitted by the source's wording; `±1` both gauges at infinity of `0` | sound | none |
| 5.5 | `0`; `−ηO;x` for `O = Φ(x/|x|)`; connected `G` | `(1, 0)` is a good representative; `χ(−ηO;x) = ∫_{S³}Φ*ω_f = −8π² ≠ 0 = χ|_{Ḣ¹}` and `χ` is gauge invariant; trivial class `= 0 ∈ π₃(G)` by 5.6 | both directions as stated | none |
| 7.3 decay | BPST; inversion | `|F|² = 6·(2√2)²(1+|x|²)^{−4} = 48(1+|x|²)^{−4}`, `|F| ≈ √48|x|^{−4}`; `ι(x) = x/|x|²`, `|∂ι| ≈ |x|^{−2}`, each derivative costs `|x|^{−1}`: `|D^{(n)}F| ≲ |x|^{−4−n}` | rate sharp on BPST | none |
| 7.7 | `𝔰 ≅ 𝔰𝔲(2)`, `⟨φX,φY⟩ = −c tr(XY)`; `SU(2)`; commutative `G` | `γ₀(𝔰) = √2/√c`; `ℰ_e(φ∘A_BPST) = 8π²c = 16π²/γ₀(𝔰)² = 16π²/γ₀(𝔤)²` by the gap's `γ₀(𝔰) = γ₀(𝔤)`; lower bound 7.5; source `16π²/⟨α,α⟩`, `γ₀ = |α|`; `SU(2)`: `16π²/2 = 8π²`; non-instanton `ℰ_e ≥ |χ| + 32π²/γ₀² ≥ 2E_GS`; commutative: empty set, `+∞` | `E_GS = 16π²/γ₀²` | none |
| 8.2 `A = 0` and pure gauge Checks | multiplier; `A = −O;x` | `Δ ↔ −4π²|ξ|²`, `‖|ξ|^σB̂‖ = (4π²)^{−1}‖|ξ|^{σ−2}F̂‖`; `Δ_{O·0}(Ad(O)B) = Ad(O)ΔB` by 1.3's `D(O·A)(Ad(O)B) = Ad(O)D(A)B` | sound | none |
| 8.2 uniqueness in `Ḣ^σ` | `0 < σ < 1`; `1 < σ < 2` | `Δ_A : Ḣ^τ → Ḣ^{τ−2}` bounded for `0 < τ < 2` (products `Ḣ¹×Ḣ^{τ−1} → Ḣ^{τ−2}`); existence at `σ' ∈ (1,2)` is the source's; existence at `τ = 2 − σ' ∈ (0,1)` with bound: for `g ∈ Ḣ^{τ−2} ∩ Ḣ^{−1}` and the `Ḣ¹` solution `C`, `‖C‖_{Ḣ^τ} = sup⟨C, h⟩ = sup⟨C, Δ_AK⟩ = sup⟨g, K⟩ ≲ ‖g‖_{Ḣ^{τ−2}}` over `‖h‖_{Ḣ^{−τ}} ≤ 1`, `K` the `Ḣ¹` solution of `Δ_AK = h` with `‖K‖_{Ḣ^{2−τ}} ≲ ‖h‖_{Ḣ^{−τ}}`, both pairings justified in `Ḣ¹`; then close by density; uniqueness at `σ`: `B ∈ Ḣ^σ`, `Δ_AB = 0`, `g ∈ Ḣ^{−σ}`, `C ∈ Ḣ^{2−σ}` with `Δ_AC = g`, `⟨B,g⟩ = ⟨Δ_AB, C⟩ = 0` by continuity of both pairings on `Ḣ^σ × Ḣ^{2−σ}` | "unique" holds on `(0, 2)`, derived from the source's bounds | none |
| 8.2 excluded endpoints | `σ = 2`; `σ = 0` | `[∂A, B]` with `∂A ∈ L²` needs `B ∈ L^∞`, which `Ḣ²(ℝ⁴)` does not give; the `ℓ¹Ḣ²` clause adds `∂^jA_j ∈ ℓ¹L²` for exactly this term; `Ḣ^σ` is realised as functions only for `σ < 2` | endpoints rightly excluded | none |
| 9.6 | small energy; bubble; `s ∈ [−1,0]` | `ℰ_e(a) ≤ ε ⇒ s₀ = ∞`, `Q < ∞` (9.4) while `ℰ_e(Q) ≥ E_GS > ε`; `ℰ_e(Q) ≤ ℰ_e(a)` by the energy identity and lower semicontinuity; `s_n + r_n²s ≥ 0` needs `r_n² ≤ s_n` | hypotheses as stated; `x_n → x₀` omitted with reason | none |
| 10.1 | `U(1)`, `a = i∇φ`; `a = 0`; `a ∈ ℋ` flat | `O = e^{iφ}`: `O⁻¹∂O = i∇φ`, `O;x = i∇φ ∈ Ḣ¹`; `O` constant, normalised to `1`; `curl a = −[a,a] ∈ ℓ¹L²` (product bound), `div a ∈ ℓ¹L²`, so `a ∈ ℓ¹Ḣ¹` by the blockwise div–curl estimate, and Lemma 7.3(2) with `p = 2` gives `Σ_j‖P_jAd(O)a‖_{Ḣ¹} ≲ Σ_jΣ_{k<j−C}2^{k−j}c_j‖P_ka‖_{Ḣ¹} + … ≲ ‖a‖_{ℓ¹Ḣ¹}(1 + ‖a‖_{Ḣ¹})`, so `O;x ∈ ℓ¹Ḣ¹` and 4.3 gives continuity | matches Theorem 2.20 (`ℋ → Ḣ² ∩ C⁰`) | none |
| 10.2 | commutative `G`; dilation; heat flow of caloric `a` | `U(1)`: every `a ∈ Ḣ¹` has `Q(a) < ∞` by `L^∞L² ∩ L²Ḣ¹ ⊆ L³L³` (`2/3 + 4/3 = 2`), so the first item covers it without the noncommutative clause; `λa(λ·)` has `Q` and `A_∞` scaled covariantly; `A(s)` has limit `0` and `Q(A(s)) ≤ Q(a)` | sound | none |
| 10.3 `U(1)` Check | `a = iα`, `div α = 0` | `∫Σ_{j<k}(∂_jα_k − ∂_kα_j)² = ∫|∇α|² − ∫∂_jα_k∂_kα_j = ∫|∇α|² − ∫(div α)² = ‖∇α‖²`; `‖a‖_{L⁴} ≲ ‖∇a‖_{L²}` | `‖a‖_{Ḣ¹} ≲ ℰ_e^{1/2}` | none |
| 4.1 (headline) | `U(1)`; `A = 0`; `A_t(x) = tA(tx)` | `Δφ = −i∂^ℓA_ℓ`, `∂_νφ = −ix^ℓA_ℓ`, compatible by the divergence theorem; constants only; `‖F[A_t]‖^{d/2}_{L^{d/2}(B₁)} = ‖F‖^{d/2}_{L^{d/2}(B_t)}` nondecreasing | sound | none |
| 5.2, 5.4, 5.5 (headlines) | flat; inversion; `{±1}`; `O(4)`; `U(1)` | `F = 0 ⇒ r_c = ∞`, `R_c = 0`, `O_(∞)` constant; `|ι*F|(x) = |x|^{−4}|F(ιx)|`, Jacobian `|x|^{−2d}`, `‖ι*F‖_{L^{d/2}} = ‖F‖_{L^{d/2}}`; `Top(d, {±1})` a point; conjugation by `q ↦ q̄` swaps the summands of `π₃(SO(4)) ≅ ℤ⊕ℤ`; `π_{d−1}(S¹) = 0` for `d ≥ 3` | sound | none |
| 6.2, 6.3, 6.4 (headlines) | `A = −η'O_(∞);x + B`, `B` compactly supported; BPST; `⟨·,·⟩ = −tr` | `∫_{B_ρ}dT_f(A) = ∫_{∂B_ρ}O_(∞)*ω_f`, `ρ`-independent by homogeneity; `χ = ∫|F⁻|² − ∫|F⁺|²`, `ℰ_e ∓ χ = 2∫|F^±|²`; BPST `F⁺ = 0`, `χ = ℰ_e = 8π²`, `c₂ = 1`; `Φ`: degree `1`, `c₂ = −1`; reflection `(x₁,−x₂,−x₃,−x₄)` has degree `(−1)³` | consistent across 1.4, 6.3, 6.4, 7.6 | none |
| 7.5 (headline) | `u = |F⁺|^{1/2}`; `𝔰𝔲(2)⊕𝔰𝔲(2)` | `∫|∇u|² ≤ (√6/3)γ₀∫u⁴`; `Y(S⁴) = 12(8π²/3)^{1/2} = 8√6π`; `(∫u⁴)^{1/2} ≥ 4π/γ₀`, `∫|F⁺|² ≥ 16π²/γ₀²`; `SU(2)`: `8π²`, attained; opposite charges: `ℰ_e = 16π² = 0 + 32π²/2` | sound | none |
| 9.3, 9.4, 9.5, 9.7 (headlines) | dilation; `U(1)`; BPST; `σ = −½` | `s₀(λa(λ·)) = λ^{−2}s₀(a)`; `U(1)`: `A(s) = ∇φ + e^{sΔ}a^{df}` global, `A_∞ = ∇φ`; BPST `∉ L⁴` (`∫|x|^{−4}r³dr = ∞`), `‖F‖_{L³L³} = ∞` as a static flow; `‖e^{sΔ}b^{df}‖²_{Ḣ^{−1/2}} = ∫|ξ|^{−1}e^{−8π²s|ξ|²}|b̂^{df}|² → 0`; threshold `2E_GS = 16π²` for `SU(2)` | sound (values of round 4 re-derived) | none |
| 10.5 (headline) | `U(1)`; `w = D(a)c₀`; `w ∈ T^{L²}_a𝒞` | `W(∞) = −∇c`, `c = −Δ⁻¹∂^ℓW(∞)_ℓ`; `b = 0`, `c = −c₀`; `c = 0`, `Π_aw = w`; `T_a𝒞 = range(L)` of 10.4, complemented by `𝒢_a`, consistent with `‖b‖_ℋ + ‖c‖_{ℓ¹Ḣ²} ≲ ‖w‖_ℋ` | sound | none |
| plan.json ↔ README | 52 targets, 120 tests | counts match; 10.4's four tests are the README's four Checks (`u1`, `sphere`, `cone`, `abs-graph`); 10.4's 14 prerequisites equal its `*Needs:*` line; gap `neededBy` lists (4.1; 4.1; 5.2, 5.3, 6.1; 7.7) equal the README's gap `*Needs:*` lines; PDE supplier sections include §3.2 | sound | none |

**Overlaps (`scratch/overlaps.md`).** No open pull request changes this roadmap; no id this README cites
is dropped by an open pull request (the DifferentialGeometry Layer 10 item of rounds 1–4 is no longer
listed and was in any case settled as not actionable with a reason re-verified in round 4); no id of
this roadmap is cited elsewhere; nothing is defined only by an open revision. Closest open roadmaps:
InstantonFloerTheory, IncompressibleFlows, FourManifolds, SobolevDifferentialForms, PDE's open
revision, all as analysed in round 4 and unaffected by this repair. Second-owner greps this round with
`roadmaps grep -i` over main and every open head: "caloric", "split submanifold", "submanifold of a
Banach", "Banach submanifold": the only hit outside this roadmap is
`TauCetiRoadmap/LieGroupoidsPoisson/README.md:1496` on main, an API bullet asserting that its path space
`P(A)` "is a smooth split Banach submanifold"; it defines no general notion (its lines 22 and 310–331
concern Mathlib's submersion normal form in finite dimension), so this roadmap is the owner of the
`C¹` split-submanifold notion, stated through Mathlib's `IsSmoothEmbedding`; "IsSmoothEmbedding" hits
(HomotopySpheres, GeometricTopology, AlgebraicTopologyPartII, ManifoldOptimization, DifferentialGeometry)
all use the pinned predicate for finite-dimensional manifolds and own nothing here. Ownership against
the open pull requests named in the brief was checked with these tools.

**Declared gaps.** All four unchanged since round 4 and re-read: precise (each `needs` sentence names
the missing statement with its hypotheses), minimal (PDE Layer 5 on main is interior and Dirichlet only,
PDE has no Hardy inequality, LieGroups Layer 6 has no root `𝔰𝔲(2)` item; none is at the pins), and
declared under the same slug in `plan.json` and the README; none has supplier `none`.

**Shape.** Summary; Scope and ownership; Conventions; Exact supplier contracts; How to read the build;
ten layers each ending with Examples and Dependencies; Downstream consumers; References. Every theorem
carries its hypotheses in the sentence and a locator; every definition its API bullets and at least
three Checks (10.4's definition: three API bullets, four Checks); Unicode throughout; every cited work in
`sources.toml`; no process residue; no backticked name of the roadmap's own.

**Headline theorems** (from the Summary; for the package stage, which writes `Suggested.lean`): gauge
invariance of finite energy (3.2); Uhlenbeck's lemma for every compact `G`, `d ≥ 3` (4.1); the good
global gauge theorem (5.2); well-definedness, gauge invariance and locality of the topological class
(5.4) and the trivial class (5.5); topological invariance of characteristic numbers (6.2); the
Bogomol'nyi bound (6.3); integrality and completeness of `c₂` for `SU(2)` (6.4); the energy gap and the
ground state (7.5, 7.7); local well-posedness, continuation and the flat limit (9.3–9.5); the Dichotomy
and Threshold Theorems (9.6, 9.7); existence and uniqueness of the caloric gauge (10.2); the caloric
manifold with its tangent spaces and div–curl decomposition (10.4, 10.5). Carriers at the pins:
`Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `HomotopyGroup`, `ContinuousMap.Homotopic`,
`Manifold.IsSmoothEmbedding`, Tau Ceti's `W1p`/`Wkp`; not at the pins: `Ḣ¹`, `Ḣ^σ`, `ℓ¹L²`, `ℋ`, `𝒞`
(PDE §7.1–7.2 planned, unbuilt), so the heat-flow and caloric headlines will need simple definitions or
a docstring note at the package stage. The one-tactic probe does not apply (no Lean file).

## Not verifiable

- `Uhlenbeck-LpCurvature` Theorem 1.3 and `Uhlenbeck-RemovableSingularities` Theorem 4.1 (settled
  uncertified): the design relies on their certified restatements OhTataru-TopClass Theorems 3.11–3.12.
- `FreedUhlenbeck-Instantons`, `DonaldsonKronheimer`, `Bogomolnyi-Stability`,
  `MimuraToda-TopologyLieGroups`: settled uncertified; no target depends on their text.
- Elaboration and the one-tactic probe: not available (this lane does not elaborate; no
  `Suggested.lean` at the design stage).
- The published numbering of the Oh–Tataru papers against the arXiv v2 texts read: not checked; the
  manifest records `version_note = "arXiv v2"` for each.

## Source issues

- **Error** in OhTataru-YMHF at Theorem 7.8, proof, Step 2, (7.10), PDF page 70 (line 3325): the
  bound is printed with the left side in the norm `ℓ¹Ḣ¹` and is said to follow from Theorem 4.1; it
  should be in the norm of `ℋ`, since `[a, c]` lies outside `ℓ¹Ḣ¹` for caloric `a` outside `ℓ¹Ḣ¹`, and
  the `ℋ` form is what (7.9) needs; affects the proof.
- **Gap** in OhTataru-TopClass at Lemma 3.2, proof, PDF page 21 (line 1049): the cut-off is taken equal
  to `0` on `V` and `1` on `W` under the hypothesis `V ∩ W = ∅` alone, which does not give one when the
  closures meet; it should be positive on `W` and `0` on `V` (the lemma then holds as stated); affects
  the proof.
- **Misprint** in OhTataru-YMHF at §2.4, PDF page 14 (line 558): the gauge transformation `O` with
  `a_∞ = O⁻¹∂O` is said to be unique up to constant conjugations; it should be up to left multiplication
  by constants, as its formula shows; affects nothing.
- The issues recorded in round 4 (Theorem 4.6's `L¹Ḣ^σ`, the three decay gaps, Corollary 5.15's range,
  the misprints in (1.19), (5.11), Proposition 3.9, Lemma 3.13, and Proposition 1.6(1)) stand and are
  not repeated here.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bead7142f27b35545b71755048ddb24ce79a82de", "job": "REV-DESIGN-YangMillsConnectionsAndCaloricGauge~5", "model": "fable", "worker": "chris-x9"} -->
