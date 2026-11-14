<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15095#issuecomment-6885187935 -->
Red team round 2 pass b (claude) of b9ea623

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 8.3 uses a pinned declaration that neither its *Needs* nor the supplier contracts name

   **Location.** `packages/CohomologyOfGroups/README.md:2649–2651`: "*Needs:* 4.7(a); Tau Ceti
   `TauCeti.TateCohomology.cup_δ_of_flat`, `TauCeti.TateCohomology.δ_cup_of_leftInverse`;
   ClassFieldTheory Layer 0 (`Rep.isZero_res_of_projective`, `Rep.projective_of_isZero_res`)."

   **Claim.** These inputs give, for every `M`, the isomorphism `Ĥⁱ(G, M) → Ĥ^{i+n+1}(G, M ⊗ ℤ_χ)`.

   **Witness.** The `n + 1` connecting maps are those of the sequence tensored with `M`, so each
   `Ĥ*(G, M ⊗ C_i)` must vanish. `Rep.isZero_res_of_projective` gives this for `C_i` alone. For
   `G = ℤ/2`, `n = 0`, `M = ℤ/2`: `M ⊗ ℤG = 𝔽₂[G]` is not `ℤG`-projective. The pin has
   `Rep.isZero_res_tensor_of_projective`
   (`TauCeti/RepresentationTheory/Homological/TateCohomology/Projective/Basic.lean:104`); the README
   never names it.

   **Repair.** (i) In "From Tau Ceti" add the row: "`Rep.isZero_res_tensor_of_projective`
   (`RepresentationTheory/Homological/TateCohomology/Projective/Basic.lean`): if the `k[G]`-module of
   `P` is projective, then for every representation `M` and every finite subgroup `S`,
   `Ĥⁿ(S, M ⊗ P) = 0` for every `n ∈ ℤ`. Used in 8.3." (ii) In 8.3, before "*Needs:*", add: "Route:
   each `C_i`, free over `ℤ` and cohomologically trivial, is projective over `ℤ[G]`
   (`Rep.projective_of_isZero_res`), so `M ⊗ C_i` has vanishing Tate cohomology for every `M`
   (`Rep.isZero_res_tensor_of_projective`); the sequence is split over `ℤ`, so it stays exact after
   `M ⊗ −`, and its `n + 1` connecting maps are isomorphisms, equal up to sign to cup product with
   `e` by `cup_δ_of_flat`." (iii) Add `Rep.isZero_res_tensor_of_projective` to the *Needs* of 8.3.
   Tested on the instance: `Ĥ*(ℤ/2, 𝔽₂[ℤ/2]) = 0` (induced), and the connecting map
   `Ĥⁱ(ℤ/2, ℤ/2) = ℤ/2 → Ĥⁱ⁺¹(ℤ/2, ℤ/2 ⊗ ℤ_sgn) = ℤ/2` is an isomorphism.

One P3 finding (S01). No P1, no P2. All nine round-1 findings are repaired at this head and no
repair introduced an error.

## Round-1 findings at this head

| Round-1 id | Status | Repaired passage (witness) |
|---|---|---|
| 1a/F01 (P2) cohomological universal coefficients statable | repaired | `packages/CohomologyOfGroups/Suggested.lean:153–203`: `cohomologyEvaluation`, `extToCohomology` (real bodies) and `universalCoefficient_cohomology`; module docstring line 60–64 now lists only the homological sequence as not statable. README 5.2: "The cohomological sequence in degree `n + 1` is `universalCoefficient_cohomology`". Recomputed: `G = ℤ/2`, `A = 𝔽₂`, `n = 0`: `0 → Ext¹(ℤ, 𝔽₂) = 0 → H¹ = 𝔽₂ → Hom(ℤ/2, 𝔽₂) = 𝔽₂ → 0`; `n = 1`: `0 → Ext¹(ℤ/2, 𝔽₂) = 𝔽₂ → H² = 𝔽₂ → Hom(H₂(ℤ/2, ℤ) = 0, 𝔽₂) = 0`. |
| 1a/F02 (P3) hypercohomology Checks | repaired | README 2.1, three Checks: "`H⁰(G; D) = ℤ`, `H¹(G; D) = Hom(ℤ/2, ℤ) = 0` and `H²(G; D) = ℤ/2`"; "`0` in degree `0` and `ℤ/2` in degree `1`"; "`H²(G; D) = H¹(ℤ/2, ℤ_sgn) = … = ℤ/2`". Recomputed: `ker(1 + t) = ℤ`, `(t − 1)ℤ_sgn = 2ℤ`. |
| 1a/F03 (P2) boundary terms of `A*_j` | repaired | README 6.1: "`A*_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ 0`; for `0 < j ≤ n`, … ; `0` for `j > n` (HS53 Ch. II §1, p. 119, HS53 line 404–407". HS53 line 404–407 read: both boundary ranges are there. |
| 1b/F01 (P2) Künneth over every `k` in 5.4 | repaired | README 5.1: "if `N` is projective over `k` and `H_q(H, N)` is projective over `k` for every `q`, then for every `M : Rep k G` the cross product … is an isomorphism"; 5.4 routes use it. Pinned `ChainComplex.projective_cycles_of_projective_homology` (`TauCeti/Algebra/Homology/Split.lean:439`) and `homologyKunnethShortComplex_shortExact` (`…/Kunneth/Sequence.lean:729`) read: hypotheses are projective cycles and projective `L_q/Z_q`, nothing on the ring. Recomputed `Hₙ(ℤ², ℤ/4) = ℤ/4, (ℤ/4)², ℤ/4`. |
| 1b/F02 (P2) undeclared assumption on K3BlochGroups §5.2 | repaired | README "What K3BlochGroups must provide (gap:least-r-period): …"; `design/plan.json` `gaps` has slug `least-r-period`, supplier K3BlochGroups, §5.2. Recomputed: `ℤ/3`: `d = 2`; `S₃`, `r = 3`: `d = 4`; cyclic Sylow 2: `H₁(G, ℤ_(2))` has order `|G|₂`, `d = 2`; quaternion: `|G^ab|₂ ≤ 4 < 8`, `H₂ = 0`, `d = 4`. |
| 1b/F03 (P3) Tate–Nakayama route for 8.4 | repaired | README 8.4: "Route: Tau Ceti's Tate–Nakayama theorem … for `C = ℤ` with trivial action and `u ∈ H²(G, ℤ)` the connecting image of `χ`". Pin read (`…/Cup/TateNakayama.lean:360–375`): hypotheses `h1`, `hgen`, `hcard`, `hM` are the four the route checks; conclusion uses `(isoGroupCohomology 2).app C).inv u`, which for `u = δχ` is `characterConnectingClass` (`…/Character.lean:65–73`). |
| 1b/F04 (P3) `map_comp_transfer` unlisted | repaired | README contract row "`TauCeti.groupHomology.transfer`, `…transfer_comp_map_subtype_id`, `TauCeti.groupHomology.map_comp_transfer`" and the *Needs* of 7.1. |
| 1b/F05 (P3) "larger than" in 5.3 | repaired | README 5.3 Check: "whose image is the bilinear forms of finite rank … The two spaces both have dimension `2^{ℵ₀}` over `ℚ`, so a count of dimensions does not show it." |
| 1b/F06 (P3) Loh19 locator in 8.3 | repaired | README 8.3 Check: "(Loh19 Remark 1.6.12, pp. 48–49, Loh19 line 2215–2221, for `m ≥ 2`; for `m = 1` …)". Loh19 line 2215 (`n ≥ 2`) and line 2221 (the sequence, after the page marker at line 2219) read. |

## Verified sound

Counts: 23 declarations of `Suggested.lean` read (9 `def`, 14 `theorem`), every line of the file,
each compared with its elaborated type in the job's signature listing and with its README
statement; 41 README target sections read (1.1–1.5, 2.1–2.3, 3.1–3.6, 4.1–4.7, 5.1–5.4, 6.1–6.9,
7.1–7.2, 8.1–8.5), every line of the README; 20 source passages read against the cached texts
(HS53 6, Loh19 9, MilneCFT 2, Hutchinson13 3); 171 Check bullets read, every one that states a
value, sign or counterexample recomputed (instances in the tables below); 231 backticked Lean names
of the README searched at the pins by their last component (all found; the 23 not found are this
roadmap's own declarations), 9 namespaces confirmed in source, 8 pinned statements read in full
(`extToHomology`, `extToHomology_injective`, `exact_extToHomology_kronecker`,
`homologyKunnethShortComplex_shortExact`, `projective_cycles_of_projective_homology`,
`cup_bijective_of_forall_isPGroup_of_lTensor_injective`, `characterConnectingClass`,
`Rep.projective_of_isZero_res`); 34 sibling sections resolved to an existing heading or target on
main or at the open heads, and the cited statement read for 6 of them (K3BlochGroups §5.2 targets
quaternionPeriodicHomology and finiteGroup_period_fromSylow; SpectralSequencesAndConvergencePartII
§§2.6, 3.4, 4.3 and its DerivedModuleAlgebra contract; DerivedModuleAlgebra §S.1;
InductionRestrictionPartII target abelian_multiplier_exteriorSquare).

No Lean was run (read-only pass). No binder is lost: `[H.FiniteIndex]`, `[Finite G]`, `[Fintype G]`,
`[Module.Free ℤ M]`, `[Fact p.Prime]`, `[R.Normal]` and
`[∀ X : ModuleCat k, HasProjectiveDimensionLE X 1]` appear in the elaborated types where the README
has them; `cohomologyEvaluation` has no dimension hypothesis, as in the README.

Dependency check (command of the brief), output:

```text
depcheck: 244 roadmaps, 2206 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The one roadmap that names this one,
SpectralSequencesAndConvergencePartII (Downstream consumers), is a supplier here: no cycle.

Declared gaps. The three slugs are in `design/plan.json` `gaps` and in the README contracts, each
with a named supplier earlier in the merge order or on main.
- `gap:homological-low-degree`: DerivedModuleAlgebra §S.1 on main states edge morphisms and the
  five-term sequence cohomologically; its homological form has the second page and convergence
  only. SpectralSequencesAndConvergencePartII §3.4 has the five-term sequence of right exact
  composite functors, not of a double complex, and 6.3 is built on the double complex; so the gap
  asks for nothing already provided.
- `gap:flat-kunneth`: §4.3 at the open head states the two-column sequence and naturality of the
  spectral sequence from page 2, not naturality of the sequence.
- `gap:least-r-period`: §5.2 at the open head gives the values and a period class of order `|G|_r`
  with invertible cup product, and no minimality.

Ownership. Pins searched by object for Tate duality of finite groups, stable classes, double
cosets in discrete (co)homology and all-degree cup periodicity of cyclic groups
(`TateCohomology/`, `TateCohomology/Cup/`): none there (`Cup/Cyclic.lean` has degree 0 only;
`Cup/TateTheorem.lean` and `Cup/TateNakayama.lean` are the general theorems 8.4 instantiates).
`roadmaps resolve` reports no unresolved citation; the overlap listing has no second copy, no
shared change and no dropped id. No declaration of `Suggested.lean` has the fully qualified name of
a declaration of a readable roadmap.

Policy. The pull request changes only `packages/CohomologyOfGroups/`. No `lemma`, `set_option`,
`#eval`, pull-request number or process word in the README or the Lean file ("lemma" occurs only in
"Shapiro's lemma" and source locators). Imports: `import Mathlib` and eleven `TauCeti.*` modules.

Headlines. Stated: free groups and free products (3.6), cohomological universal coefficients
(5.2), Hopf (6.8), double coset formulas (7.1), stable elements in three theories (7.2), Tate
duality in two forms (8.1), cyclic cup periodicity (8.4), periodicity theorem and its `p`-primary
form (8.5). Named as not statable with the missing carrier: Hochschild–Serre (6.2–6.5),
transgression and low-degree sequences (6.6–6.7), tree and Mayer–Vietoris sequences (3.5–3.6),
Künneth (5.1, 5.3), homological universal coefficients (5.2), 8.3. Padding probe: no declaration
restates a definition, mirrors a Check or follows from one pinned lemma without hypotheses to
prove. The two nearest cases are `universalCoefficient_cohomology` (three pinned lemmas read
through the isomorphisms of its two definitions) and `cup_characterConnectingClass_bijective` (one
pinned theorem whose hypotheses `hgen` and `hcard` need `H²(S, ℤ) ≅ Hom(S, ℚ/ℤ)` for every
subgroup `S`); neither is a one-tactic consequence.

### Suggested.lean: declarations, context and computed instances

Common context: explicit binders only (no section `variable`); `k G : Type u`, `[CommRing k]`,
`[Group G]` unless stated.

| Declaration (line; context) | Instances and values on each side | Result |
|---|---|---|
| `conjRes` (85; `A ≤ G`, `β : B →* G`, `g`, `h`) | equivariance `ρ(g)ρ(g⁻¹βbg) = ρ(βb)ρ(g)`; `S₃`, `A = ⟨(12)⟩`, `B = ⟨(23)⟩`: `g = (123)`: `g⁻¹(23)g = (12) ∈ A`; `g = (132)`: `(13) ∉ A`; `ℤ/4 → ℤ/2`, `𝔽₂`, degree 2: carry pulls back to `d⌊a/2⌋`, map `0` | sound |
| `conjCores` (105; same) | `ρ(g⁻¹)ρ(βb) = ρ(g⁻¹βbg)ρ(g⁻¹)`; wrong model `m ↦ g·m` needs `g²x = xg²`: `1 ↦ 3` versus `1 ↦ 2` for `g = (123)`, `x = (23)`; degree 0, `ℤ/2` on `ℤ_sgn`: `[m] ↦ [−m] = [m]` in `ℤ/2` | sound |
| `freeGroup_isZero_of_two_le` (125; `S : Type u`, `n ≥ 2`) | `S = ∅`: `0, 0`; `S = pt`, `M = ℤ_sgn`: `H₁ = ker(−2) = 0`, `H¹ = ℤ/2 ≠ 0`, so `n ≥ 2` sharp; pin has trivial coefficients, homology, `Type` only | sound, not at pin |
| `coprod_groupHomology_bijective` (133; `n ≥ 2`) | sequence `Hₙ(1) = 0 → Hₙ(A) ⊕ Hₙ(B) → Hₙ(A ∗ B) → Hₙ₋₁(1) = 0` for `n ≥ 2`; `ℤ/2 ∗ ℤ/2`: `H₃ = (ℤ/2)²`, `H₂ = 0`; `n = 1`, `F₂`, `M = ℤ_{−1}`: `0 ⊕ 0` versus `ℤ` | sound |
| `cohomologyEvaluation` (153; `A : Type u`, no dimension hypothesis) | target `Hₙ(G, k) ⟶ A` in `ModuleCat k`; `G = ℤ`, `n = 1`: `ℤ → Hom(ℤ, ℤ) = ℤ`; `n = 0`: `A → Hom(k, A) = A` | sound |
| `extToCohomology` (174; `[∀ X, HasProjectiveDimensionLE X 1]`) | pinned `extToHomology k X Y i j` with `i = n + 1`, `j = n` needs `Projective (X.cycles n)` and `IsSplitMono (X.iCycles n)`, which hold for free chains over such `k`; zero ring: all `0` | sound |
| `universalCoefficient_cohomology` (195) | `ℤ/2`, `𝔽₂`: `n = 0`: `0, 𝔽₂, 𝔽₂`; `n = 1`: `𝔽₂, 𝔽₂, 0`; `G = ℤ`, `A = ℤ`, `n = 0`: `0, ℤ, ℤ`; `k = ℚ`: `Ext = 0`, evaluation bijective; `k = ℤ/4`, `G = A = ℤ/2`, `n = 1`: `ℤ/2, ℤ/2, ℤ/2` impossible, excluded by the hypothesis; `k = ℤ` satisfies it (pinned instance) | sound |
| `nonempty_groupHomology_two_addEquiv_hopf` (211; `S : Type`, `[R.Normal]`) | `R = ⊥`: `0, 0`; `R = ⊤`: `H₂(1) = 0`, `⁅F,F⁆/⁅F,F⁆ = 0`; `ℤ ⊃ nℤ`: `0, 0`; `F₂ ⊃ ⁅F,F⁆`: `ℤ, ℤ`; `A₅`: `ℤ/2, ℤ/2` | sound |
| `doubleCosetTerm` (223; `[H.FiniteIndex]`) | `(H.comap conj g⁻¹).subgroupOf K = K ∩ gHg⁻¹`; `g = 1`: `cor^K_{K∩H} ∘ res` | sound |
| `res_comp_corestriction_eq_finsum` (240) | `S₃`, `H = K = ⟨(12)⟩`, `ℤ`, degree 0: `3 = 1 + 2`; `n > 0`: second term through `Hⁿ(1) = 0`, both sides `id`; `K = 1`, degree 0: `Σ_{gH} g·m` both sides; `K\G/H` finite, so `∑ᶠ` is a sum | sound |
| `doubleCosetTermHomology` (251) | pair `(x ↦ g⁻¹xg, m ↦ g⁻¹m)` lands in `H`; `K = 1`, degree 0: `m ↦ [g⁻¹m]` | sound |
| `transfer_comp_cores_eq_finsum` (268) | `S₃`, `H = K = ⟨(12)⟩`, `ℤ`, degree 0: `3 = 1 + 2`; `H = G`: one term, `cor^G_K` both sides; `K = 1`: `Σ_{gH}[g⁻¹m] = Σ_{Ht}[tm]` | sound |
| `IsStableClass` (278) | `S₃`, `A₃`, `ℤ`: `H²`: `z = −z` in `ℤ/3`, only `0`; `H⁴`: all of `ℤ/3`; `P = G`: every class | sound |
| `bijOn_res_sylow_isStableClass` (292; `[Finite G]`, `n ≠ 0`) | `S₃`, `p = 3`: `H²(S₃, ℤ)(3) = 0 ↔ {0}`; `H⁴`: `ℤ/3 ↔ ℤ/3`; `p ∤ ❘G❘`: `{0} ↔ {0}`; `n = 0`, `ℤ`: `0` versus `ℤ`, excluded | sound |
| `IsHomologyStableClass` (303; `[Finite G]`) | second side: element `g⁻¹`, pair `(y ↦ gyg⁻¹, m ↦ gm)` from `P ∩ g⁻¹Pg` to `P ∩ gPg⁻¹`; transfer of a class `x` of `G`: both sides `tr^G_{P∩gPg⁻¹} x` | sound |
| `bijOn_cores_sylow_isHomologyStableClass` (332) | stable `z`: `tr cor z = Σ_{PgP} [P : P ∩ g⁻¹Pg] z = [G : P] z`; `S₃`, `p = 3`, `H₁`: `{0} ↔ (ℤ/2)(3) = 0`; `(ℤ/3)² ⋊ ℤ/2`, `H₂`: `ℤ/3 ↔ ℤ/3`; `n = 0`: `ℤ` versus `0`, excluded | sound |
| `IsTateStableClass` (349; `[Fintype G]`, local `Subgroup.fintypeOfFinite`) | `ρ(g)ρ(y) = ρ(gyg⁻¹)ρ(g)`; `S₃`, `A₃`, `ℤ_sgn`, `n = 0`: `c_{(12)} = −1` on `ℤ/3`, only `0` stable | sound |
| `bijOn_tateRes_sylow_isTateStableClass` (391; all `n : ℤ`) | `S₃`, `p = 2`, `Ĥ⁰(ℤ)`: `{0, 3} ⊂ ℤ/6 ↔ ℤ/2`; `p = 3`, `ℤ_sgn`: `Ĥ⁰(S₃, ℤ_sgn) = 0 ↔ {0}`; `G = 1`: `0 ↔ 0` | sound |
| `tate_duality` (405; `G : Type`, `M : Rep ℤ G`, `i : ℤ`) | degrees `(−1−i) + i = −1`; `ℤ/2`, `ℤ`: `i = 0`: `Ĥ⁰(ℚ/ℤ) = 0`, `Ĥ⁻¹(ℤ) = 0`; `i = 1`: `ℤ/2, ℤ/2`; `M = ℤ/2`, `i = 0`: `Ĥ⁰(ℤ/2) = ℤ/2`, `Ĥ⁻¹(ℤ/2) = ℤ/2`; target `(ℚ/ℤ)[❘G❘]` | sound |
| `tate_duality_of_free` (425; `[Module.Free ℤ M]`) | `ℤ/3`, `ℤ`: `i = 0`: multiplication on `ℤ/3`; `i = 1`: `0, 0`; `i = 2`: `ℤ/3, ℤ/3`; not free, `M = ℤ/2`: `0` versus `ℤ/2`; infinite rank: `Hom(M, ℚ)` uniquely divisible, sequence `0 → M^* → Hom(M, ℚ) → M^∨ → 0` exact | sound |
| `cup_characterConnectingClass_bijective` (441) | `G = 1`: `orderOf 1 = 1`, `χ = 0`, groups `0`; `ℤ/2`, `ℤ`, `n = 0`: `ℤ/2 → ℤ/2`, `1 ↦ δχ ≠ 0`; `χ(g) = 2/4` on `ℤ/4`: multiplication by `2`, not bijective, excluded by `hχ` | sound |
| `tfae_periodic_cohomology` (455) | `G = 1`: `d = 1`, `u = 0`, all four hold; `S₃`: `d = 4`, `Ĥ⁴ = ℤ/6`; `(ℤ/2)²`: all fail; `d = 0` excluded (`Ĥ⁰(ℤ) = ℤ/❘G❘` always); `d < 0` in (b): dual of `Ĥ^{−d}`; `QuaternionGroup (2^m)`, `m ≥ 1`: order `2^{m+2} ≥ 8` | sound |
| `tfae_primary_periodic_cohomology` (475; `[Fact p.Prime]`) | `ℤ/2`, `p = 3`: all hold, orders `1 = 3⁰`; `A₄`: `p = 3` holds (`Ĥ² = ℤ/3`), `p = 2` fails; (b_p)⇒(a_p): additive map `u ↦ e_p` gives `v` with `u ∪ v = e_p`, and `e_p` is `1` on `p`-parts; odd `p`: a `p`-group is not `QuaternionGroup (2^m)` | sound |

### README targets: computed instances

| Target | Instances and values | Result |
|---|---|---|
| Conventions | `S₃`, `g = (13)`: `g⟨(12)⟩g⁻¹ = ⟨(23)⟩`; cup on `ℤ²`: `(x ∪ y)(e₁, e₂) = 1`, `(e₂, e₁) = 0`; carry cocycle of `ℤ/3 ⊂ ℤ/9`; HNN relation `t·a = φ(a)·t` at the pin (`Mathlib/GroupTheory/HNNExtension.lean:71`) | sound |
| 1.1 | `(123) = (13)(12)`; `g = (123)`: `gHg⁻¹ = ⟨(23)⟩`, `g⁻¹Hg = ⟨(13)⟩`; `g⁻²xg` fixes `1`, `xg⁻¹ : 1 ↦ 2`; composition laws for `ga` checked on pairs | sound |
| 1.2 | `ℤ/4 ⊃ 2ℤ/4`, `M = ℤ_{−1}`: action `−1` on `M^N`; `(gN·φ)(n) = g·φ(g⁻¹ng)` | sound |
| 1.3 | `id ∈ Hom(ℤ^{(ℕ)}, ℤ^{(ℕ)})` not in `⊕ Hom(ℤ^{(ℕ)}, ℤ)` | sound |
| 1.4 | `ℤ/2` on `G ⊔ pt`: `H₁ = 0 ⊕ ℤ/2`, `H₀ = ℤ²` | sound |
| 1.5 | profinite topology on `ℤ`: open kernel `nℤ`, finite image in `ℤ`, so `0` | sound |
| 2.1–2.3 | `S₃`, `C = (ℤ[S₃/A₃] → ℤ)`: `d¹` on `q = 0` iso, on `q = 1` zero `ℤ/3 → ℤ/2`, on `q = 3` injective `ℤ/3 → ℤ/6`; `H₀ = 0`, `H₁ = ℤ/2`, `H₂ = ℤ/3`; `S₃/⟨(12)⟩`: `H₀ = H₁ = 0`, `H₁(C)` of rank 2 | sound |
| 3.1 | `k = ℤ/4`: `ℤ/2 →0 ℤ/2 →id ℤ/2`, `H₂ = ℤ/2`; telescope: `v∘u = 0`, `Σ 4ʲ = −1/3 ∉ ℤ` | sound |
| 3.2–3.3 | reflection on the circle: `C₁ = ℤ[ℤ/2]`, `E¹_{0,q} = H_q(ℤ/2)²` survives for every `q ≥ 1` (the Check says `q ≥ 3`, true); twisted circle: `t⁻¹m − m = −2m`, `H₀ = ℤ/2`, `H₁ = 0` | sound |
| 3.4–3.5 | line: edge map `t⁻¹ − 1`, `H₁ = M^ℤ`, `H₀ = M_ℤ`; sum: `ℤ/2` | sound |
| 3.6 | `1 ↦ (−2, 3)` in `ℤ/4 ⊕ ℤ/6`: cokernel of order 12; `BS(1, 2)`: `1 − 2 = −1`, `H₁ = ℤ`; `F₂`, `ℤ_{−1}`: `ker(−2, −2) ≅ ℤ`, missing summand `2ℤ` | sound |
| 4.1–4.3 | omitted action: `t − 2 + (1 + t) − 1 = 2(t − 1)`; uniqueness: `Hᵖ(M′) → H^{p+1}(M)` onto since `H^{p+1}(Coind) = 0` | sound |
| 4.5–4.6 | degree 0: `Σ_t [μ(x ⊗ tn)] = Σ_t [μ(t⁻¹x ⊗ n)]`; back face: `y ∩ z = [e₁]`, `⟨x, [e₁]⟩ = 1` | sound |
| 4.7 | `∏_ℕ ℤ/p`: countable versus uncountable `H¹` | sound |
| 5.1 | shuffle: `(s₁x, s₀y) ↦ [(g,1)❘(1,h)]`, `(s₀x, s₁y) ↦ [(1,h)❘(g,1)]`; `M = 𝔽₂`, `N = ℤ[1/3]`, degree 2: tensor `𝔽₂²` (bidegrees `(2,0)`, `(1,1)`), `Tor` `𝔽₂` (bidegree `(0,1)`), total `𝔽₂³`; splitting route: `K′ ⊗ L′ → K ⊗ L′ → K ⊗ L`, each factor K-flat | sound |
| 5.2 | see Lean table; `k = ℤ/4`: `H₁(ℤ/2, ℤ/4) = ℤ/2`, `H₂ = (ℤ/4)[2]` | sound |
| 5.3 | rank `≤ r` versus rank `r + 1`; `(1,1)`: `1 − 0 = 1` | sound |
| 5.4 | `x² = Σ cᵢ²[aᵢ]² + Σ_{i<j} cᵢcⱼ([aᵢ][aⱼ] + [aⱼ][aᵢ]) = 0`, with `[a]² = [a❘a] − [a❘a]`; `Λ³(ℤ/2) = 0 ≠ H₃`; `ℚ[x, y]`, `ℤ² × ℤ/2`: `k, k², k, 0` | sound |
| 6.1 | `N = G`: `A_j = 0`, `j > 0`; `N = 1`: degree filtration; cochain at `(g, …, g)`, `g ∉ N`, lies in `A_j` | sound |
| 6.2 | `S₃`, `𝔽₃`: action `(−1)^{⌈q/2⌉}` (`−, −, +, +`), `H^q ≠ 0` for `q ≡ 0, 3 mod 4` | sound |
| 6.3–6.4 | `ℤ²`, `M = k[N]`: `k, k, 0` both sides; `(k[G^{n+1}] ⊗ M)_N` induced from `1 ≤ Q` | sound |
| 6.5 | HS53 line 692–696: sign `(−1)^{i′j}`, `j` the filtration degree, which is `(−1)^{pq′}` | sound |
| 6.6 | `o ∪ u′`: sign `(−1)^{0·0}`; `d₂(o ∪ u′) = d₂o ∪ u′ + (−1)^{1} o ∪ 0 = −c_k ∪ u`; HS53 line 990; `df(2, 1) = 0 − 1 + 0`; `Q₈`: `{0, 2}/0 = ℤ/2`, `c_{𝔽₂} = 0` | sound |
| 6.7 | HS53 line 825–830 (`m ≥ 1`); `ℤ/2 ⊂ ℤ/4`, `ℤ`: `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` in both theories | sound |
| 6.8 | `d([a❘b] − [b❘a]) = [ba] − [ab] ↦ ⁅a, b⁆⁻¹` | sound |
| 6.9 | both transgressions `−[carry]` on `ℤ/3 ⊂ ℤ/9` | sound |
| 7.1 | see Lean table | sound |
| 7.2 | `C₂ × S₃`: `dim H¹(P, M) = 1 + 2`, `dim H¹(G, M) = 2`; `(c_g f)(z) = (23)·e₃ = e₂`; `(ℤ/3)² ⋊ ℤ/2`: `(−1)² = 1` on `Λ²` | sound |
| 8.1 | see Lean table | sound |
| 8.2 | `ℤ/7 ⋊ ℤ/3`: 1 + 6 + 14 elements, `g²¹ = 1`, not cyclic | sound |
| 8.3 | truncation: `D_n/B_n` is an extension of `B_{n−1} ⊂ D_{n−1}` by `ℤ_χ`, so `ℤ`-free; `ℤ/2`, `n = 0`: period divides `2` | statement sound; S01 |
| 8.4 | `S₃`: `Ĥ²(3) = 0`, `Ĥ⁴(3) = ℤ/3`; `Q_{2^s}`: `0, (ℤ/2)², 0, ℤ/2^s`; `p ∤ ❘G❘`: least `d = 1`; `ℤ_(2)/q(q² − 1) = ℤ/❘G❘₂` for odd `q` | sound |
| 8.5 | `❘SL₂(𝔽₉)❘ = 720`, Sylow 3 `= (ℤ/3)²`; (a_p)⇒(b_p)⇒`v`: `M = ℤ`, `n = 0` and `n = −d`; `res(e_p) = 1` mod `❘A❘` | sound |

## Not verifiable

- Brown82 (14 locators), CE56 (3) and SwanPPeriod60 (2) are settled as uncertified or waived: not
  compared with a text. Swan's statement was read in Hutchinson13 line 499–504.
- SerreArbres (4 locators) was not reopened in this pass; both round-1 passes read it.
- The elaboration of `Suggested.lean` was not re-run; the comparison used the supplied elaborated
  signatures.
- The Kronecker form of 4.6 and 5.2 (that `Rep.groupCohomologyIhomIso` and
  `groupHomology.inhomogeneousChainsIso` carry `TauCeti.ChainComplex.kronecker` to the explicit
  evaluation without sign) was checked against the docstrings of the pinned declarations only, not
  on their chain-level formulas. It is a README target, not an assumption of the Lean file.
- The sign `(−1)^{q(n−q)}` of 4.6 between the front-face `capChain` and the back-face product was
  recomputed only for `q = 1`, `n = 2`.
- The pinned names were matched by their last component, plus nine namespaces read in source; the
  citation tool on this worker does not check names outside the roadmaps.

Source independence: 20 passages compared with 4 sources (HS53 6, Loh19 9, MilneCFT 2, Hutchinson13 3), none shared beyond formulas and statements of under a dozen words; largest share HS53, 43 of 117 locators; contents compared with HS53 (Ch. I §§1–7, Ch. II §§1–5, Ch. III §§1–6): independent — only Layer 6 draws on Ch. II–III, as 6.1 ↔ II §1, 6.2 ↔ II §§2–4, 6.5 ↔ II §5, 6.4 ↔ III §1, 6.6 ↔ III §§3, 6, 6.7 ↔ III §4, not in the source's order (6.4 before 6.5; 6.3, 6.8, 6.9 from other sources; III §§2, 5 absent), and the order 6.1 → 6.2 → 6.5 → 6.6 → 6.7 is forced by the *Needs* lines. Brown82 and CE56 could not be read (uncertified); SerreArbres was not reopened in this pass.

## Source issues

- **Misprint** in Hutchinson13 at proof of Corollary 3.3, printed p. 12 (Hutchinson13 line 518): the source says the nonzero homology occurs for degrees congruent to 3 modulo 3; it should be congruent to 3 modulo 4, as in the statement of the corollary; affects nothing.

## For the human reviewers

- **Licence.** Loh19 is unpublished lecture notes on the author's page; 28 of 117 locators cite it
  (`packages/CohomologyOfGroups/sources.toml`), each for a standard result.
- **Not tested.** Brown82 and CE56 are uncertified (17 locators): wording and tables of contents
  were not compared with their texts.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b9ea623e4141c6750345a339083d718d8cdac8db", "job": "RT-CohomologyOfGroups~2b", "model": "fable", "worker": "chris-x52"} -->
