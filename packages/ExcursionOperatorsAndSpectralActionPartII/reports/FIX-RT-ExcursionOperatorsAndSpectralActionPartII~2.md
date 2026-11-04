# Repair report: red-team round 2 of ExcursionOperatorsAndSpectralActionPartII

Two reviews were merged. Review 2a has findings F01–F03 and review 2b has F01–F08. Two pairs make one claim each: 2a/F01 with 2b/F01 (the owner of the geometric centre action, and the nonexistent HS3.11 and IG.F.* sections) is settled once below; 2a/F02 and 2b/F07 (the dictionary between Hansen's Hecke labels and the supplier's functor) are settled by the same edit and each has its own section. Every supplier citation was re-resolved at the heads the roadmaps index of 2026-11-04 serves through `roadmaps show` (HeckeStacksAndLocalShtukas, AutomorphicGaloisRepresentationsPartII, IgusaVarietiesAndTorsionConcentration, LanglandsParameterStacks, BunGAndNewtonStrata, GeometricSatakeAndFusion, EndoscopicTransferAndUnitaryTraceComparison, VectorBundlesAndIsocrystals), and every source line in the cached texts.

## RT-ExcursionOperatorsAndSpectralActionPartII~2a/F01, RT-ExcursionOperatorsAndSpectralActionPartII~2b/F01 (P1) — applied

Both witnesses hold. HeckeStacksAndLocalShtukas has no HS3.11 (its HS3 targets end at HS3.10; HS4.2 says excursion operators are AG2.6's `excursionOperator` on the imported Hecke functor and are not constructed there; its scope assigns the spectral action, Ψ_G^b and the finite wild level to AutomorphicGaloisRepresentationsPartII AG2.6). IgusaVarietiesAndTorsionConcentration has no IG.F.* sections: its centre section is §3.0i and its parameter section §7.9a, and both import AG2.6. HS1.2 identifies the lisse restriction of HS's T_V with AG2.6's `HeckeFunctor`, so no comparison theorem between two Hecke families exists or is needed.

Old → new: owner IgusaVarietiesAndTorsionConcentration IG.F.21/IG.F.22 with an HS3.11 comparison → AutomorphicGaloisRepresentationsPartII AG2.6 (“Bundle strata, lisse categories and the geometric Hecke action”; “The parameter stack and geometric spectral action”) in Scope, the supplier contract (the Igusa contract is replaced by an AG2.6 contract), §0.0 and its two *Needs:* lines, the FS-parameter paragraph (`semisimpleParameter` of the Schur-irreducible object i_(1!)π), and the Dependencies of Layers 0 and 4 and §4.3. IgusaVarietiesAndTorsionConcentration §3.0i and §7.9a are mentioned only as scope remarks; nothing is consumed from them.

## RT-ExcursionOperatorsAndSpectralActionPartII~2a/F02 (P2) — applied

The witness holds and both reviews compute the same dictionary. AG2.6 states that its `T_(V_μ)` carries the trivial stratum into B(G,μ⁻¹), that its normalized action is built from V↦T_(θ*V), which is Fargues–Scholze's V↦T_V, and that the raw action from V↦T_V is the pullback along φ↦θ∘φ; its GL₁ Check has T_1 carrying degree d to d+1 and Kottwitz invariant a to a−1, and its two-leg test gives 2 for the normalized and 2⁻¹ for the raw action. Hansen's reverse operator i_b^* T_(V_μ) i_(1!) has b∈B(G,μ) basic with κ(b)=μ^♯ (H26 line 410; HKW22 Lemma 6.4.4, line 2991, with the κ computation at line 637), so for GL₁ and μ=1 it carries κ=0 to 1, whereas the supplier's T^AG_(χ₁) carries κ to κ−1 (HS3.10's torus test κ(b)=κ(b′)−n). Hence Hansen's T_V is the supplier's T_(V^∨)=T_(θ*V), and Hansen's excursion composites are the HS4.2 composites on the θ-pulled-back family, the family AG2.6 feeds to its universal equivalence, so they are AG2.6's normalized action.

Old → new: Conventions state the dictionary with its witness (two Checks: the κ shifts for GL₁, μ=1 in both directions, and the normalized/raw coordinate values 2 and 1/2); §0.0 says each imported excursion operator with datum V is the HS4.2 composite with datum θ*V; gap:general-parabolic-excursion-comparison and gap:all-weight-shriek-trace are stated in Hansen's labels with the supplier's functor named (README and `design/plan.json`); the §1.4 GL₁ Check names both label systems.

## RT-ExcursionOperatorsAndSpectralActionPartII~2b/F07 (P3) — applied

The witness holds and is the dictionary of 2a/F02 (evidence there): for GL₁, μ=1, Hansen's reverse operator carries κ=0 to κ(b)=μ^♯=1 while the supplier's T_(χ₁) carries κ=0 to −1, so Hansen's T_V is the supplier's T_(V^∨); the README indeed named no supplier functor.

Old → new: the Conventions sentence “transport both projections, the Satake label, the basic class and the duality together” with no named functor → the dictionary with the supplier named (AutomorphicGaloisRepresentationsPartII AG2.6, HeckeStacksAndLocalShtukas §HS3.10): Hansen's forward i_1^* T_(V_μ^∨) i_(b!) is the supplier's i_1^* T^AG_(V_μ) i_(b!), the reverse is the supplier's i_b^* T^AG_(V_μ^∨) i_(1!), with b∈B(G,μ) and κ(b)=μ^♯ unchanged; the old torus Check now carries the GL₁, μ=1 witness; the self-dual V_(μ_m) of §2.2 are unchanged, as the review says.

## RT-ExcursionOperatorsAndSpectralActionPartII~2a/F03 (P3) — applied

The witness holds: FS24 line 13001 uses Z′(E)→D(E) surjective by Kaletha's Fact 5.5, and for GL₂(D) the centre maps by λ↦Nrd(λ)=λ⁴. To state the correct notion, Kaletha's paper was fetched through the sources service (manifest key KAL18, arXiv 1502.00650v2, open repository, certified): Definition 5.1 (line 777) requires H¹(E,Z(G))→H¹(E,Z(G′)) bijective, Fact 5.5 (line 860) derives Z(G′)(E)→C(E) surjective and G′(E)=Z(G′)(E)·G(E) from its injectivity, Corollary 5.3 (line 835) gives existence for every connected reductive G, and line 767 says SL_n↪GL_n is not a z-embedding.

Old → new: the Check calling SL₂(D)↪GL₂(D) a z-embedding → it is not one (λ⁴ misses a uniformizer; E^×·SL₂(D)(E) has reduced norms in E^(×4); H¹(E,μ₂)→H¹(E,G_m)=0 is not injective), the reduction uses a genuine z-embedding (KAL18 Corollary 5.3), and the GL₂(D)=(GL₄)_(b₀) computation is kept. The contract paragraph defines a z-embedding with the KAL18 locators; KAL18 is in References and `sources.toml`.

## RT-ExcursionOperatorsAndSpectralActionPartII~2b/F02 (P3) — applied

The witness holds: LanglandsParameterStacks numbers its targets §1.2 (“Clopen finite-wild pieces”), §3.6 (“Continuous semisimple parameter characters”) and §3.9 (“Parameters of Schur objects”), and its §2.5 is a different target. Old → new: LP1.2, LP2c.5, LP2c.8 → §1.2, §3.6, §3.9 at every occurrence (Scope, Conventions, the LP contract, §0.0 *Needs:*, the FS parameter and its Check, Layer 0 Dependencies, §4.3 and its *Needs:*, Layer 4 Dependencies).

## RT-ExcursionOperatorsAndSpectralActionPartII~2b/F03 (P3) — applied

The witness holds: BunGAndNewtonStrata Layer 0 has §§0.2, 0.6–0.9 and no §0.5; §0.6 is the Kottwitz set B(G) and says its coefficient field and Frobenius come from VectorBundlesAndIsocrystals Layer 0, which is earlier in the merge order. Old → new: “§§0.5–0.6 (G-isocrystals and B(G))” → “§0.6 (the Kottwitz set B(G), whose coefficient field and Frobenius are those of VectorBundlesAndIsocrystals Layer 0)” in Scope, the BunG contract, §1.1 *Needs:* and Layer 1 Dependencies.

## RT-ExcursionOperatorsAndSpectralActionPartII~2b/F04 (P3) — applied

The witness holds: neither `TauCeti.IsStableDistribution` nor `TauCeti.normalizedOrbitalIntegral_bounded` occurs in EndoscopicTransferAndUnitaryTraceComparison's README or Suggested.lean at its head, nor in the pinned Mathlib or Tau Ceti (grep of both trees: no hit). Old → new: both backticked names → the prose interface items of ET §2.4 (“A distribution is stable if it lies in the closed span of the SO_γ”) and §2.1 (J_G(·,f) bounded on G_reg(E)). The resolver now reports no unresolved Lean name.

## RT-ExcursionOperatorsAndSpectralActionPartII~2b/F05 (P2) — applied

The witness holds: ET §2.16(c) sums over representatives of the G(F)-conjugacy classes of all maximal F-tori, and H26 lines 209–210 state the orbital-integral characterization of cuspidality as an equivalence without proof. The GL₂ instance recomputed: f_T(m)=δ_B^(1/2)(m)·vol{u : mu∈K}=1 for m∈T(𝒪_E), so 1_K is not cuspidal, and O_(diag(a,b))(1_K)=1 for units with |a−b|=1 (ET §2.1 Check), so the split term is nonzero. Old → new: gap:kazhdan-cuspidal-decomposition also asks for “f cuspidal iff its orbital integrals vanish at every non-elliptic regular semisimple element” (README and `design/plan.json`), with a Check; Conventions define I(G)_cusp with both characterizations; §3.2 cites §2.16(c) over all tori and the gap for dropping the non-elliptic terms, with the gap in its *Needs:* and the GL₂ instance as a Check.

## RT-ExcursionOperatorsAndSpectralActionPartII~2b/F06 (P3) — applied differently

The witness holds (H26 line 341 and HKW22 line 3635: finite-length virtual representations, not only tempered ones; Θ_1+Θ_St on GL₂ is induced, vanishes on the regular elliptic set and is not tempered). Applied with one addition: HKW22 Theorem C.1.1 is stated for rational combinations in the Grothendieck group of complex or ℚ̄_ℓ-representations, while §1.3 uses the kernel on the complex span D(G). A ℚ-linear statement does not by itself give the ℂ-linear one (the ℚ-linear injection ℚ²→ℂ, (a,b)↦a+bi, acquires the kernel (i,−1) after complexification), so the gap sentence says “on all of D(G) with complex coefficients” and records what HKW22 states (README and `design/plan.json`); §1.3 carries the locator.

## RT-ExcursionOperatorsAndSpectralActionPartII~2b/F08 (P3) — applied

The witness holds: GeometricSatakeAndFusion has three layers titled GS4; §4.26 (“Normalized Frobenius function”, with the minuscule Check τ=r^(−d_μ)1_(KμK)) and §4.29 (“Classical and geometric Satake comparison”, with S(r⁻¹1_(KμK))=z+z⁻¹ for PGL₂) are in “Frobenius traces and classical spherical Satake”. Old → new: the Conventions Check cites that layer and those two sections; Scope names it as the owner of the normalized spherical trace. The §0.0 Check at the same computation cites Conventions and carried no GS4 citation, so it is unchanged; the “Integral identification” citations for the dual-group dictionary stay.

## Checks run

- **Elaboration.** `lake env lean packages/ExcursionOperatorsAndSpectralActionPartII/Suggested.lean` from the content checkout exited 0; the only output is `warning: declaration uses 'sorry'` at line 48 (the theorem). The three `TauCeti.*` object files were present (no `lake build` was needed). The only change to `Suggested.lean` this round is its header (see the gate-failure item below): no declaration, binder, docstring or import set changed.
- **Binder check.** A scratch copy of the file ending in `#check @TauCetiRoadmap.ExcursionOperatorsAndSpectralActionPartII.weightPushforward_sum_abs_sub_uniform_le` was elaborated at the pins. The printed type carries every binder explicitly: K, L, the field, characteristic-zero, algebraically closed, Killing-semisimple and finite-dimensional instances, the Cartan subalgebra H, the base b, the finite abelian A, φ with `Function.Surjective φ`, then `∃ C, 0 ≤ C ∧ ∀ m, 1 ≤ m → ∀ M … v, IsHighestWeightVector b ((2*m) • twoWeylVector …) v → lieSpan K L {v} = ⊤ → ∑ a, |… − 1/card A| ≤ C/m`. This matches README §2.4(a) (highest weight μ_m=2m·2ρ, surjective φ, m≥1, generated module, C independent of m and M); nothing was lost and nothing changed.
- **Dependency check.** Output:

```text
depcheck: 236 roadmaps, 2154 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The citations added this round (AutomorphicGaloisRepresentationsPartII, VectorBundlesAndIsocrystals) are earlier in the merge order.
- **Citation resolver.** `roadmaps resolve` on the README lists no cross-roadmap citation and no Lean name found nowhere (it listed 5 and 2 before this round).
- **Gap lists.** The 16 slugs under “Exact supplier contracts” equal the 16 slugs of the plan's `gaps` list; `design/plan.json` parses.
- **Gate failures listed in the brief:** the worker's build of the module reported, twice, the toolchain warning that `Suggested.lean` imports `Mathlib`, which is built with the module system, and suggested adding `module` at the start of the file. Repaired in place by writing the file in the module form already used on main (CoboundaryExpansion's `Suggested.lean`): the file now begins with `module`, its four imports are `public import Mathlib` and the three `public import TauCeti.*` lines, and `public section` precedes the namespace so the headline theorem stays in the module's interface. The import set is the same single `Mathlib` plus the three Tau Ceti modules; nothing else in the file changed. Elaboration and the binder check above were rerun on the module-form file.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Dictionary T^H_V = T^AG_(V^∨) | GL₁, μ=1, reverse operator | Hansen: κ 0→κ(b)=μ^♯=1. Supplier T^AG_(χ₁): 0→−1; T^AG_(χ₋₁): 0→1. | Only T^AG_(χ₋₁) lands in B(GL₁,1) |
| same, forward operator | GL₁, μ=1, from b with κ=1 | Hansen's i_1^* T_(χ₋₁) i_(b!) needs κ 1→0. T^AG_(χ₁): 1→0; T^AG_(χ₋₁): 1→2. | Consistent with the reverse direction |
| same, κ(b)=μ^♯ in Hansen's B(G,μ) | GL₂, μ=(1,0) | HKW line 637: κ(b)=image of a weight of V_μ in π₁(G)_Γ=ℤ; both weights map to 1 | Agrees with the §1.6 Check |
| Excursion composite with datum θ*V on T^AG equals the composite with datum V on T^H | any V | T^H_(V^∨)=T^AG_(θ*(V^∨))=T^AG_((θ*V)^∨); creation and annihilation transported with V | Identity of composites |
| Normalized versus raw coordinate | GL₁, χ(geometric Frobenius)=2 | normalized t↦2, raw (θ∘φ) t↦1/2; AG2.6's test gives 2 and 2⁻¹ | README Check unchanged and justified |
| Self-dual V_(μ_m) | dual A₁, m=1 | weights 2α,α,0,−α,−2α symmetric; θ*V≅V^∨≅V | §1.1 label-independent |
| SL₂(D)↪GL₂(D) not a z-embedding | D quaternion over E | Nrd(λ·1)=λ⁴; uniformizer ϖ has valuation 1∉4ℤ; H¹(E,μ₂)=E^×/E^(×2)≠0→H¹(E,G_m)=0 | Central surjectivity and H¹-injectivity both fail |
| same, Nrd on the whole group | GL₂(D)(E) | diag(d,1) with Nrd(d)=ϖ gives Nrd=ϖ | Surjective, as the old Check said; kept |
| z-embedding definition | induced torus quotient | H¹(E, induced torus)=0 by Shapiro and Hilbert 90, so Kaletha's condition 2 is implied by “induced” | Definition restated without loss |
| Cuspidality iff non-elliptic orbital integrals vanish | GL₂, f=1_K; supercuspidal coefficient | f_T=1 on T(𝒪_E), O_(diag(a,b))(1_K)=1; coefficient: f_T=0, split integrals 0 | Both directions exhibited |
| Elliptic kernel on D(G) | GL₂, Θ_1+Θ_St | θ_1+θ_St=1−1=0 on regular elliptic; induced from B; Θ_1 not tempered | D(G) form needed, D_temp form insufficient |
| same, coefficient scope | ℚ-linear map ℚ²→ℂ, (a,b)↦a+bi | injective over ℚ, kernel (i,−1) after complexification | ℂ-linear statement is a genuine extra clause |
| Weyl integration over all tori, elliptic sum for cuspidal f | GL₂ split torus, cuspidal f | split term 0 by the gap; elliptic terms unchanged | §3.2 estimate unaffected |
| BunG §0.6 replaces §§0.5–0.6 | GL₁ | B(G_m)=ℤ via the valuation, as HS3.10 uses | Only B(G), B(G,μ) and basic classes are consumed |
| GS4 layer attribution | PGL₂ minuscule, r=√q | τ=q^(−1/2)1_(KμK), S(τ)=z+z⁻¹, value 5 at diag(2,3) | Matches the Check's number |

## Notes for the maintainer

- Two earlier runs of this job on this worker failed the worker's checks only on the toolchain's module-system warning for `Suggested.lean`. The second run's note that no roadmap on main uses the `module` keyword was wrong: CoboundaryExpansion's `Suggested.lean` on main begins with `module` and `public import Mathlib`, and every pinned Mathlib and Tau Ceti file is a module. This run adopts that header; the warning is emitted by `lake build` of the module, not by `lake env lean`, so it cannot be reproduced with the Lean commands this job may run, and the worker's build is the check that settles it.
- The dictionary of Conventions is derived from κ computations at the supplier heads and from HKW22's own convention; it does not depend on how AG2.6 words its comparison with Fargues–Scholze. HeckeStacksAndLocalShtukas HS4.2 and AutomorphicGaloisRepresentationsPartII AG2.6 disagree on whether Fargues–Scholze's T_(V_μ) is AG2.6's T_V or T_(θ*V) (HS4.2's last torus Check against AG2.6's labelling paragraph). That is a question for those two roadmaps; this package consumes only AG2.6's normalized action and names the family it is built from.
- EndoscopicTransferAndUnitaryTraceComparison §2.16 still cites SmoothRepresentationsOfLocalGroups §SR.3a.2 for admissibility and labels a nonvanishing Check as linear independence; outside this package, as in round 1.
- Sources: KAL18 (Kaletha, Rigid inner forms vs isocrystals) is in `sources.toml` through the sources service (open repository, certified). No text was missing; `needs-references.toml` was not created.
- Ownership against open pull requests was checked through the roadmaps index of 2026-11-04 (`roadmaps show` at the heads above and the sibling checkouts the brief names); no competing owner of the dictionary, the cuspidality clause or the z-embedding remark was found. The names other roadmaps might cite (`weightPushforward_sum_abs_sub_uniform_le`, the gap slugs) are unchanged; no gap was added or removed, four gap sentences were sharpened.
