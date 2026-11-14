<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15095#issuecomment-6883039731 -->
Red team round 1 pass b (claude) of a528360

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 5.4 uses a Künneth isomorphism over every `k`, which 5.1 states only for global dimension ≤ 1

   **Location.** `packages/CohomologyOfGroups/README.md:1738–1740`: "Routes: for torsion-free `A`,
   Künneth for `ℤⁿ` from `H•(ℤ, k) = Λ(k)` (3.6) and the colimit over finitely generated subgroups; for
   a `ℚ`-algebra, the torsion subgroup has trivial positive-degree homology"; and `:1762–1764`
   ("for torsion-free `A` and every `k`", "every `ℚ`-algebra `k`").

   **Claim.** `ψ : Λ_k(A ⊗ k) → H•(A, k)` is an isomorphism for torsion-free `A` and *every* commutative
   `k`, and for every `A` and every `ℚ`-algebra `k`, with *Needs:* 5.1, 3.6.

   **Witness.** 5.1 (`README.md:1584–1589`) proves a homology statement only "if `k` has global
   dimension at most one" or "over a field". `k = ℤ/4`, `A = ℤ²` (or `k = ℚ[x, y]`, `A = ℤ² × ℤ/2`):
   neither hypothesis holds, so the step `H•(ℤ × ℤ, k) = H•(ℤ, k) ⊗ H•(ℤ, k)` has no owner. The claim
   itself is true (`Hₙ(ℤ², ℤ/4) = ℤ/4, (ℤ/4)², ℤ/4`); the supplier is missing.

   **Repair.** (i) In 5.1, after "and that over a field the cross product is an isomorphism", insert:

   > Prove also, for every commutative ring `k`, with no condition on its global dimension: if `N` is
   > projective over `k` and `H_q(H, N)` is projective over `k` for every `q`, then for every
   > `M : Rep k G` the cross product `⊕_{p+q=n} H_p(G, M) ⊗ H_q(H, N) → Hₙ(G × H, M ⊠ N)` is an
   > isomorphism for every `n`. Route: `L = C(H; N)` is a complex of projective `k`-modules indexed by
   > `ℕ` with projective homology, so by induction on `q` its boundaries `B_q`, its cycles `Z_q` and
   > the quotients `L_q / Z_q ≅ B_{q−1}` are projective (`0 → B_q → Z_q → H_q → 0` splits, and then
   > `Z_{q+1}` is a summand of `L_{q+1}`); Tau Ceti's
   > `HomologicalComplex.homologyKunnethShortComplex_shortExact` gives the Künneth sequence of
   > `C(G; M)` and `L`, whose `Tor₁` terms vanish.

   (ii) In 5.4 replace the two routes by: "for torsion-free `A`, the projective-homology case of 5.1
   for `ℤⁿ = ℤⁿ⁻¹ × ℤ` with `H = ℤ`, `N = k` (`H_q(ℤ, k) = k, k, 0, …` by 3.6), and the colimit over
   finitely generated subgroups; for a `ℚ`-algebra `k` and finitely generated `A ≅ ℤʳ × F` with `F`
   finite, the same case with `H = F`, `N = k`, where `H₀(F, k) = k` and `H_q(F, k) = 0` for `q ≥ 1`
   because `|F|` is invertible in `k` (`TauCeti.groupHomology.transfer_comp_map_subtype_id` for the
   trivial subgroup)". Add `TauCeti.groupHomology.transfer_comp_map_subtype_id` to 5.4's *Needs*.

   (iii) Add to the Checks of 5.1: "No condition on the global dimension in the projective-homology
   case: for `k = ℤ/4` (infinite global dimension) and `G = H = ℤ` with trivial `M = N = k`,
   `H_q(ℤ, k) = k, k, 0, …` is free, and `Hₙ(ℤ², ℤ/4) = ℤ/4, (ℤ/4)², ℤ/4` for `n = 0, 1, 2`; the
   `Tor` sequence of the main statement is not available for this `k`."

   Tested on the refuting instance: `k = ℤ/4`, `A = ℤ²` gives `Λⁿ(k²) = k, k², k`, the value above;
   `k = ℚ[x, y]`, `A = ℤ² × ℤ/2` gives `Λ(k²) ⊗ k`.

2. **F02** (P2) an assumption about K3BlochGroups §5.2 is consumed without being a declared gap

   **Location.** `README.md:682–686`: "Assumed of §5.2: its `r`-period is the least such `d`, the only
   reading under which "the `r`-period" is a single number"; consumed at `README.md:2553–2554` ("whose
   period is assumed to be the one defined here") and `:2563–2565`.

   **Claim.** 8.4 identifies its `p`-period (the least `d`) with the period of K3BlochGroups §5.2 and
   imports Swan's values `2·|N_G(P)/C_G(P)|`, `2`, `4` for it.

   **Witness.** K3BlochGroups §5.2 at its head (target finiteGroup_period_fromSylow) says "its
   r-period is twice the order of the automorphisms … induced by its normalizer" and never defines the
   `r`-period or states minimality. For `S₃`, `r = 3`: `d = 4` and `d = 8` both have `H_{d−1}(S₃, ℤ_(3))`
   cyclic of order 3. The contract is neither stated by the supplier nor in `design/plan.json` `gaps`.

   **Repair.** Declare it. In `design/plan.json` `gaps` add
   `{"slug": "least-r-period", "supplier": "K3BlochGroups", "section": "§5.2", "neededBy": ["8.4"],
   "needs": "For a finite group G and a prime r dividing |G| whose Sylow r-subgroup is cyclic or, for
   r = 2, generalised quaternion, the r-period of finiteGroup_period_fromSylow is the least d ≥ 2 such
   that H_{d−1}(G, ℤ_(r)) is cyclic of order |G|_r."}`. In the README, under "From
   TauCetiRoadmap.K3BlochGroups", replace the sentence beginning "Assumed of §5.2:" by "What
   K3BlochGroups must provide (gap:least-r-period): in §5.2, for a finite group `G` and a prime
   `r ∣ |G|` whose Sylow `r`-subgroup is cyclic or, for `r = 2`, generalised quaternion, the `r`-period
   of finiteGroup_period_fromSylow is the least `d ≥ 2` such that `H_{d−1}(G, ℤ_(r))` is cyclic of order
   `|G|_r` (for `S₃` and `r = 3`, `d = 4` and `d = 8` both have the property and the period is `4`)";
   in 8.4 write "by `gap:least-r-period`" in place of "is assumed to be the one defined here" and of
   "under the assumption of the Exact supplier contracts", and add `gap:least-r-period` to 8.4's
   *Needs*. Tested on `S₃`, `r = 3`: least `d` is `4 = 2·|S₃/A₃|`, the value of 8.4's Check. (8.5 does
   not need the gap: (d_p)⇒(b_p) uses only that some `d` exists.)

3. **F03** (P3) 8.4's cyclic cup-periodicity: the pinned Tate–Nakayama theorem is listed, used by no target, and is the direct route

   **Location.** `README.md:384–386` (contract row
   `TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup_of_lTensor_injective`) and `:2547–2548`:
   "Route: `Rep.FiniteCyclicGroup.periodicIsoOfGenerator` and the compatibility of the Tate cup product
   with connecting maps."

   **Claim.** The contract row is a supplier of this roadmap; the all-degree bijectivity of
   `x ↦ x ∪ δχ` needs a new dimension-shifting argument.

   **Witness.** The row is named in no *Needs* line. At the pin
   (`RepresentationTheory/Homological/TateCohomology/Cup/TateNakayama.lean:360`) the theorem with
   `C = ℤ`, `u = δχ` concludes bijectivity of `x ↦ cup M C r 2 r′ h x u` for every `r : ℤ`, the
   statement of `cup_characterConnectingClass_bijective` before the unitor.

   **Repair.** Replace the route sentence of 8.4 by: "Route: Tau Ceti's
   `TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup_of_lTensor_injective` for `C = ℤ` (trivial
   action) and `u = δχ`: for every subgroup `S` of prime-power order, `H¹(S, ℤ) = Hom(S, ℤ) = 0`,
   `H²(S, ℤ) ≅ Hom(S, ℚ/ℤ)` has `|S|` elements, and the restriction of `δχ` is `δ(χ|_S)`, a generator
   since `χ` is injective on the cyclic group `G`; the `Tor` hypothesis holds for every `M` because a
   surjection onto `ℤ` splits; then compose with the unitor. In degree `0` this agrees with
   `cup_characterConnectingClass_eq_groupCohomologyπEven`." Add the declaration to 8.4's *Needs*.
   Tested on `G = 1` (`orderOf g = 1`, `χ = 0`, all groups `0`: bijective) and `G = ℤ/2`, `M = ℤ`,
   `n = 0`: `Ĥ⁰ = ℤ/2 → Ĥ² = ℤ/2`, `1 ↦ δχ ≠ 0`.

4. **F04** (P3) a pinned declaration is used in 7.1 but absent from the supplier contracts and the *Needs* line

   **Location.** `README.md:2244–2245`: "as the transfer (`TauCeti.groupHomology.map_comp_transfer`)
   and `conjCores` are."

   **Claim.** Every pinned input is listed under "Exact supplier contracts" and in the target's *Needs*.

   **Witness.** The name occurs once in the README (line 2245). It exists at the pin:
   `RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:103`,
   `theorem map_comp_transfer {M N : Rep R G} (φ : M ⟶ N) (S : Subgroup G) [S.FiniteIndex]`.

   **Repair.** In "From Tau Ceti", extend the transfer row to "`TauCeti.groupHomology.transfer`,
   `TauCeti.groupHomology.transfer_comp_map_subtype_id`, `TauCeti.groupHomology.map_comp_transfer`
   (`…/GroupHomology/Transfer/Basic.lean`): the transfer `Hₙ(G, M) → Hₙ(H, M)`, with
   `cor ∘ tr = [G : H]` and naturality in `M`", and add the name to the *Needs* line of 7.1.

5. **F05** (P3) 5.3 Check: "larger than" does not witness the failure

   **Location.** `README.md:1722–1723`: "for `G = H = ℤ^{(ℕ)}` and `k = ℚ`, `H²(G × H, ℚ)` contains
   `(ℚ^{(ℕ)} ⊗ ℚ^{(ℕ)})^*`, larger than `ℚ^ℕ ⊗ ℚ^ℕ`."

   **Claim.** A size comparison shows that the cross product is not an isomorphism.

   **Witness.** Both spaces have `ℚ`-dimension `2^{ℵ₀}` (`(ℚ^{(ℕ)} ⊗ ℚ^{(ℕ)})^* = ℚ^{ℕ×ℕ}`), so they
   are abstractly isomorphic; no cardinality or dimension count separates them.

   **Repair.** Replace the Check by: "The finiteness hypothesis is used: for `G = H = ℤ^{(ℕ)}` and
   `k = ℚ`, the component `H¹ ⊗ H¹ → Hom(H₁(G, ℚ) ⊗ H₁(H, ℚ), ℚ)` of the cross product is the canonical
   map `ℚ^ℕ ⊗ ℚ^ℕ → (ℚ^{(ℕ)} ⊗ ℚ^{(ℕ)})^*`, whose image is the bilinear forms of finite rank; the form
   `(e_i, e_j) ↦ δ_{ij}` has infinite rank, so the map is not onto (the two spaces have the same
   dimension `2^{ℵ₀}`, so a count does not show it)." Tested: a finite sum `Σ_{m≤r} f_m ⊗ g_m` gives a
   form of rank `≤ r`, and `δ_{ij}` restricted to `⟨e₀, …, e_r⟩` has rank `r + 1`.

6. **F06** (P3) locator of the cyclic exact sequence in a Check of 8.3

   **Location.** `README.md:2529`: "`G = ℤ/m` and `0 → ℤ →N ℤG →(t−1) ℤG → ℤ → 0` (Loh19 Remark 1.6.12,
   p. 48)"; same page in `packages/CohomologyOfGroups/sources.toml` (Loh19 locator).

   **Claim.** The sequence is on p. 48, for every `m`.

   **Witness.** Loh19 line 2215 opens the remark on p. 48 for a cyclic group of order at least 2;
   the four-term sequence is displayed at Loh19 line 2221, after the page break (Loh19 line 2219–2220,
   printed p. 49).

   **Repair.** Write "(Loh19 Remark 1.6.12, pp. 48–49, Loh19 line 2215–2223, for `m ≥ 2`; for `m = 1`
   the sequence is `0 → ℤ →id ℤ →0 ℤ →id ℤ → 0`, exact)", and "Remark 1.6.12 (pp. 48–49)" in the
   manifest locator.

Two P2 findings (R01, R02) and four P3 findings (R03–R06). No P1. `Suggested.lean` has no finding:
all 20 declarations were compared with their elaborated types and their README statements.

## Verified sound

Counts: 20 declarations of `Suggested.lean` read (7 `def`, 13 `theorem`), each compared with its
elaborated type in the job's signature listing (no Lean was run in this pass, which is read-only;
no binder is lost: `[H.FiniteIndex]`, `[Finite G]`, `[Fintype G]`, `[Module.Free ℤ M]`,
`[Fact p.Prime]`, `[R.Normal]` are all present) and with its README statement; 41 README target
sections read (1.1–1.5, 2.1–2.3, 3.1–3.6, 4.1–4.7, 5.1–5.4, 6.1–6.9, 7.1–7.2, 8.1–8.5, with their
bullets), every line of the README and of the Lean file; 54 source locators verified against the
cached texts (HS53 22, every section, statement and page the README cites; Loh19 19; MilneCFT 6;
SerreArbres 3; Hutchinson13 4); 164 Checks read, and each one that states a value, a sign or a
counterexample recomputed (the instances are in the two tables below; the Checks that only record
agreement with a sibling were read against the sibling where its text was opened); 38 sibling
citations resolved to an existing section at main or at the open heads, the cited statement read
for 21 of them
(DerivedModuleAlgebra §S.1; SpectralSequencesAndConvergencePartII Layers 2–3, §4.3, §5.2;
ProfiniteCohomology §§3.1, 3.2, 5.5, 6.4, 10.1, 10.5, Layers 8, 12; ClassFieldTheory Layer 0;
FreeGroupsAndLimitGroups §§2.2, 4.1, 4.2, 4.5–4.8; AlgebraicTopology §§5.3, 5.4;
StableHomotopyKTheory §3.29; K2SymbolsBrauer §1.1; SchemeKTheoryOperations §6.7 (both statements);
K3BlochGroups §§4.1, 5.2; ArithmeticGaloisDuality §D7.2, Layer R02.2; InductionRestrictionPartII
RS.0.1, RS.0.3, RS.6.8; MappingClassGroupsAndCanonicalRepresentations §1.1;
IntegralIwasawaTheoryPartII §0.7; ModularCurvesPartII §15.4); 9 pinned declarations opened at the
pin and compared with the README's description (`TauCeti.TateCohomology.characterConnectingClass`,
`cup_characterConnectingClass_eq_groupCohomologyπEven`, `TauCeti.isZero_groupHomology_freeGroup`,
`Rep.FiniteCyclicGroup.periodicIsoOfGenerator`, `TauCeti.TateCohomology.res`,
`cup_bijective_of_forall_isPGroup_of_lTensor_injective`, `cup_bijective_of_forall_isPGroup`,
`HomologicalComplex.homologyKunnethShortComplex_shortExact`,
`TauCeti.groupHomology.map_comp_transfer`) and 7 more located by name. The other pinned names of
the README were not opened; the job's citation listing reports none of them missing.

Ownership: the pins and every open roadmap were searched by object for Hopf's formula, the
periodicity theorem, Tate duality of finite groups, Mayer–Vietoris sequences of amalgams and HNN
extensions, the Hochschild–Serre spectral sequence of discrete groups, the dimension of free groups
and the Pontryagin ring. No second owner was found: InductionRestrictionPartII RS.0.1 and
K2SymbolsBrauer §1.1 use Hopf's formula without stating it, and the pins have no stable-element,
double-coset (discrete), Tate-duality or periodicity theorem. No declaration of `Suggested.lean`
has the fully qualified name of a declaration of a roadmap that could be read.

Headline theorems: Hochschild–Serre (6.2–6.7), tree sequences (3.5), Künneth (5.1) are named in the
module docstring as not statable, each with the missing carrier (the quotient action in positive
degrees, `G`-trees and connecting maps, the cross product), which the pins confirm; the double
coset formula, the stable element theorem, Tate duality and the periodicity theorem are stated. No
declaration is padding: none follows from one pinned lemma without further hypotheses to verify
(R03 records the nearest case), none restates a definition or mirrors a Check.

Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:`
line for this roadmap. Both declared gaps are precise, minimal and declared under the same slug in
`design/plan.json` and in the README; the supplier sections were read
(DerivedModuleAlgebra §S.1 states edge maps and the five-term sequence cohomologically only;
SpectralSequencesAndConvergencePartII §4.3 states the two-column sequence without naturality).
The pull request changes only `packages/CohomologyOfGroups/`. No `lemma`, `set_option`, `#eval`,
process word or pull-request number in the README or the Lean file.

### Suggested.lean: declarations, context and computed instances

| Declaration (context) | Instances and values | Result |
|---|---|---|
| `conjRes` (`k G : Type u`, `A ≤ G`, `β : B →* G`, `g`, `h`) | `S₃`, `A = ⟨(12)⟩`, `B = ⟨(23)⟩`: `g = (13)` gives `g⁻¹(23)g = (12) ∈ A`; `g = (132)` gives `(13) ∉ A`, no map. Equivariance `ρ(g)ρ(g⁻¹βg) = ρ(β)ρ(g)` holds | sound |
| `conjCores` (same) | pair `(b ↦ g⁻¹β(b)g, m ↦ g⁻¹m)`: `ρ(g⁻¹)ρ(β b) = ρ(g⁻¹βbg)ρ(g⁻¹)`; degree 0 on `ℤ/2`, `M = ℤ_sgn`: `[m] ↦ [−m] = [m]` in `ℤ/2` | sound |
| `freeGroup_isZero_of_two_le` (`S : Type u`, `n ≥ 2`) | `S = ∅`: trivial group, `0`; `S = pt`: `Hₙ(ℤ, M) = 0` for `n ≥ 2`, `H¹(ℤ, M) = M_ℤ ≠ 0` so `n ≥ 2` is sharp; pin has only trivial coefficients, homology, `S k : Type` | sound, not at pin |
| `coprod_groupHomology_bijective` (`n ≥ 2`) | `ℤ/2 ∗ ℤ/2`, `ℤ`: `H₃ = (ℤ/2)²`, `H₂ = 0`; `n = 1` fails for `ℤ ∗ ℤ`, `M = ℤ_{−1}`: `H₁ = ℤ`, factors `0`; sign of the edge map does not affect bijectivity | sound |
| `nonempty_groupHomology_two_addEquiv_hopf` (`S : Type`, `R` normal) | `R = ⊥`: `0 = 0`; `R = ⊤`: `0 = 0`; `F = ℤ`, `R = nℤ`: `0`; `F₂`, `R = [F, F]`: `ℤ`; `⁅⊤, R⁆ ≤ R ⊓ [F, F]` and normal | sound |
| `doubleCosetTerm` (`[H.FiniteIndex]`) | `(H.comap conj g⁻¹).subgroupOf K = K ∩ gHg⁻¹`; `g = 1`: `cor^K_{K∩H} ∘ res` | sound |
| `res_comp_corestriction_eq_finsum` | degree 0, `K = 1`: both sides `Σ_{gH} g·m`; `S₃`, `H = K = ⟨(12)⟩`, `n > 0`: `id + 0`; `K\G/H` finite, so `∑ᶠ` is a finite sum; `H = G`: one term, `res` | sound |
| `doubleCosetTermHomology`, `transfer_comp_cores_eq_finsum` | `S₃`, `H = K = ⟨(12)⟩`, `ℤ`, degree 0: `1 + 2 = 3 = [G : H]`; `K = 1`: `Σ [g⁻¹m]` is the transfer | sound |
| `IsStableClass`, `bijOn_res_sylow_isStableClass` (`[Finite G]`, `n ≠ 0`) | `S₃`, `p = 3`, `ℤ`: `H²`: stable `= 0 = H²(S₃)(3)`; `H⁴`: `ℤ/3`; `p ∤ ❘G❘`: `{0} → {0}`; `n = 0`, `ℤ`: `0` versus `ℤ`, excluded | sound |
| `IsHomologyStableClass`, `bijOn_cores_sylow_isHomologyStableClass` | second term is `(y ↦ gyg⁻¹, m ↦ gm)` on `P ∩ g⁻¹Pg`; for stable `z`, `tr cor z = Σ [P : P ∩ g⁻¹Pg] z = [G : P] z`; `S₃`, `p = 3`, `H₁`: stable `= 0 = (ℤ/2)(3)`; `n = 0`: `ℤ → ℤ` versus `0`, excluded | sound |
| `IsTateStableClass`, `bijOn_tateRes_sylow_isTateStableClass` (`[Fintype G]`, local `Subgroup.fintypeOfFinite`, all `n : ℤ`) | `S₃`, `p = 2`, `Ĥ⁰(ℤ)`: `{0, 3} ≅ ℤ/2`; `p = 3`, `ℤ_sgn`: stable `= 0 = Ĥ⁰(S₃, ℤ_sgn)`; compatibility `ρ(g)ρ(y) = ρ(gyg⁻¹)ρ(g)` | sound |
| `tate_duality` (`G : Type`, `M : Rep ℤ G`, `i : ℤ`) | degrees `(−1−i) + i = −1`; `ℤ/2`, `M = ℤ`: `i = 0`: `0, 0`; `i = 1`: `ℤ/2, ℤ/2`; `G = 1`: all `0`; target `Ĥ⁻¹(ℚ/ℤ) = (ℚ/ℤ)[❘G❘]` | sound |
| `tate_duality_of_free` (`[Module.Free ℤ M]`) | `ℤ/3`, `M = ℤ`: `i = 0`: multiplication on `ℤ/3`; `i = 1`: `0, 0`; `i = 2`: `ℤ/3, ℤ/3`; without freeness `M = ℤ/2`: `0` versus `ℤ/2`; infinite rank allowed (`Hom(M, ℚ)` uniquely divisible) | sound |
| `cup_characterConnectingClass_bijective` | `G = 1`; `ℤ/2`, `ℤ`: `ℤ/2 → ℤ/2`; pin gives it through Tate–Nakayama (R03) | sound |
| `tfae_periodic_cohomology` | `G = 1`: all four hold (`d = 1`, `u = 0`); `S₃`: `d = 4`, `Ĥ⁴ = ℤ/6`; `ℤ/2 × ℤ/2`: all fail; `d = 0` excluded since `Ĥ⁰(ℤ) = ℤ/❘G❘` always; `QuaternionGroup (2^m)`, `m ≥ 1`, has order `2^{m+2} ≥ 8` | sound |
| `tfae_primary_periodic_cohomology` | `ℤ/2`, `p = 3`: all hold, orders `1 = 3⁰`; `A₄`: `p = 3` all hold (`Ĥ² = ℤ/3`), `p = 2` all fail; (b_p)⇒(a_p) checked: `u ∪ v = e_p`, `e_p` is the identity on `p`-parts | sound |

### README targets: computed instances (the adversarial pass)

| Target | Instances and values | Result |
|---|---|---|
| Conventions, conjugation | `S₃`, `H = ⟨(12)⟩`, `g = (123)`: `gHg⁻¹ = ⟨(23)⟩`, `g⁻¹Hg = ⟨(13)⟩` | sound |
| Conventions, cup sign | `(−1)^{pq}` family: `x ∪′ δy = δ(x ∪′ y)`, `δx ∪′ y = (−1)^q δ(x ∪′ y)`; MilneCFT line 3470, 3476 | sound |
| Conventions, extension class | `ℤ/3 ⊂ ℤ/9`: factor set `= 3·carry`; `f(i) = ⌊i/3⌋`: `df = −carry` | sound |
| 1.1 | `ℤ/4 → ℤ/2`, `𝔽₂`, degree 2: pullback of carry `= d⌊a/2⌋`, map `0`; `A₃ ◁ S₃`: `c_{(12)} = −1` on `H¹(A₃, 𝔽₃)` | sound |
| 1.2 | `ℤ/4`, `N = 2ℤ/4`, `M = ℤ_{−1}`: action `−1` on `M^N = M` | sound |
| 1.3 | `Hom(ℤ^{(ℕ)}, ℤ^{(ℕ)}) ∋ id ∉ ⊕ Hom(ℤ^{(ℕ)}, ℤ)` | sound |
| 1.4 | `ℤ/2` on `G ⊔ pt`: `H₁ = 0 ⊕ ℤ/2`, `H₀ = ℤ²` | sound |
| 1.5 | `ℤ` profinite topology: `H¹_cont = 0 ≠ ℤ` | sound |
| 2.1–2.3 | `S₃`, `C = (ℤ[S₃/A₃] → ℤ)`: `H₀ = 0`, `H₁ = ℤ/2`, `H₂ = ℤ/3 = H₁(S₃, ℤ_sgn)` (from `H₂(S₃) = 0 → H₁(sgn) → ℤ/3 → ℤ/2`); `S₃/⟨(12)⟩`: coinvariants of the sum-zero lattice `= 0` | sound |
| 3.1 | `k = ℤ/4`: `H₂ = ℤ/2`; `ℤ[1/2]` telescope: `v ∘ u = 0`, `(1, 0, 1, 0, …)` forces `a₀ = −1/3 ∈ ℤ₂` | sound |
| 3.2–3.3 | reflection on the circle: `C₁ = ℤ[ℤ/2]`, `E¹_{0,q} = H_q(ℤ/2)²` survives; twisted circle: `ℤ →(−2) ℤ`, `H₀ = ℤ/2`, `H₁ = 0` | sound |
| 3.4–3.5 | line, `G = ℤ`: edge map `t⁻¹ − 1`, `H₁ = M^ℤ`, `H₀ = M_ℤ`; sum instead of difference: `ℤ/2` | sound |
| 3.6 | `ℤ/4 ∗_{ℤ/2} ℤ/6`: cokernel of `1 ↦ (−2, 3)` has order 12, `(1, 0)` of order 4 in the 2-part, cyclic; `BS(1, 2)`: `1 − 2 = −1`, `H₁ = ℤ`; `F₂`, `M = ℤ_{−1}`: `ker(−2, −2) ≅ ℤ` | sound |
| 4.1–4.3 | omitted action: coboundary at `(1, 1, 1)` is `t − 2 + (1 + t) − 1 = 2(t − 1)`; `ℤ²`: `(x ∪ y)(e₁, e₂) = 1`, `(e₂, e₁) = 0` | sound |
| 4.5–4.6 | `⟨dφ, m[x❘y]⟩ = φ(y)(x⁻¹m) − φ(xy)(m) + φ(x)(m) = ⟨φ, ∂(m[x❘y])⟩`; back face: `y ∩ z = [e₁]`, `⟨x, [e₁]⟩ = 1` | sound |
| 4.7 | `∏_ℕ ℤ/p`: continuous `H¹` countable, abstract uncountable | sound |
| 5.1 | `H₂(ℤ/2²) = ℤ/2`, `H₃ = (ℤ/2)³`; `M = 𝔽₂`, `N = ℤ[1/3]`: tensor `𝔽₂²`, Tor `𝔽₂`, total `𝔽₂³`; `G = H = 1`, `M = N = ℤ/2`: `0` versus `ℤ/2`; index translation `i + j = n + 1 ↔ p + q = m − 1` | sound; see R01 for what it does not cover |
| 5.2 | `H²(ℤ/2, 𝔽₂) = Ext¹(ℤ/2, 𝔽₂)`; `G = ℤ`, `n = 1`: `Hom` term `ℤ`; chains free, cycles projective when gl.dim ≤ 1 | sound |
| 5.3 | `(1, 1)` evaluation on `ℤ × ℤ`: `1 − 0 = 1`; `H = 1` | sound; Check wording R05 |
| 5.4 | `[a]·[a] = [a❘a] − [a❘a] = 0` on chains; `ℚ = colim(ℤ →(m+1) ℤ)`; `Λ³(ℤ/2) = 0 ≠ H₃` | statement sound; route R01 |
| 6.1 | `N = G`: `A_j = 0` for `j > 0`; `N = 1`: degree filtration; `ℤ/4`, `n = 1`: `A*_1 ⊊ A_1` | sound |
| 6.2 | index map `(s, t) ↦ (2s + t + 1, −s − 1)` inverts `s = −q − 1`, `t = p + 2q + 1`; vanishing needs `p + r − 1 > p + q + 1` and `p + 2 − r ≤ 0`, i.e. `r ≥ max(q + 3, p + 2)`; `S₃`, `𝔽₃`: action `(−1)^{⌈q/2⌉}`, `H^q ≠ 0` for `q ≡ 0, 3 mod 4` | sound |
| 6.3–6.4 | `(Ind₁^G X)_N = Ind₁^Q X`; `ℤ²`, `M = k[N]`: `k, k, 0` on both sides; trivial `M`: `H₂ = k → 0` | sound |
| 6.5 | HS53 line 692–698: sign `(−1)^{i′j}`, `d₁(u ∪ v) = d₁u ∪ v + (−1)^{i+j} u ∪ d₁v`; SSC II §5.2 has the same `(−1)^{p+q}` | sound |
| 6.6 | `o ∪ u′`: sign `(−1)^{0·0}`; `d₂(o ∪ u′) = d₂o ∪ u′ = −c_k ∪ u`; HS53 line 990; `Q₈`: `H²(ℤ/2, ℤ/4_{−}) = {0, 2}/0`, `c_{𝔽₂} = 0`, `dim H¹(Q₈, 𝔽₂) = 2` | sound |
| 6.7 | `ℤ/2 ⊂ ℤ/4`, `ℤ`: `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; `𝔽₂`: inflation of `x²` is `0`; homology: `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` | sound |
| 6.8 | `d([a❘b] − [b❘a]) = [ba] − [ab] ↦ ba(ab)⁻¹ = ⁅a, b⁆⁻¹`, K2SymbolsBrauer §1.1's value; `d(K₂)`: `r₁r₂(r₁x′r₂x′⁻¹)⁻¹ ∈ ⁅F, R⁆` | sound |
| 6.9 | ProfiniteCohomology §5.5 Check: `d¹f(2, 1) = −1`, same sign | sound |
| 7.1 | see Lean table | sound; R04 |
| 7.2 | `C₂ × S₃`, `M = 𝔽₂³`: `dim H¹(P, M) = 1 + 2 = 3`, `dim H¹(G, M) = 2`, cocycle `z ↦ e₃` not stable (`e₂ ≠ e₃`); `(ℤ/3)² ⋊ ℤ/2`: `(−1)² = 1` on `Λ²` | sound |
| 8.1 | see Lean table | sound |
| 8.2 | `ℤ/7 ⋊ ℤ/3`: 6 elements of order 7, 14 of order 3, `IsPGroup 21`, not cyclic | sound |
| 8.3 | truncation: `D_n/B_n` is `ℤ`-free (extension of `B_{n−1}` by `ℤ_χ`) and cohomologically trivial; `ℤ/2`, `n = 0` | sound; locator R06 |
| 8.4 | `S₃`: `Ĥ²(3) = 0`, `Ĥ⁴(3) = ℤ/3`, period 4; `Q_{2^s}`: `Ĥ² = (ℤ/2)²`, `Ĥ⁴ = ℤ/2^s`; `p ∤ ❘G❘`: least `d = 1` | sound; R02, R03 |
| 8.5 | `❘SL₂(𝔽₉)❘ = 720`, Sylow 3 `= (ℤ/3)²`; `A₄`, `p = 3`; (a)⇒(c) via `u ∪ v = 1` and `cup_res` | sound |

## Not verifiable

- Brown82 (13 locators), CE56 (3) and SwanPPeriod60 (1) are settled as uncertified or waived: their
  locators and wording were not compared with a text. Every statement cited to them was checked
  mathematically, and Swan's theorem against Hutchinson13 line 499–504.
- The chain-level sign `(−1)^{q(n−q)}` of 4.6 between Tau Ceti's front-face `capChain` and the
  back-face cap product was checked only in bidegree `q = 1`, `n = 2` (the README's own Check), not
  against the definition of `TauCeti.ChainComplex.capChain` in general degree.
- The elaboration of `Suggested.lean` was not re-run (read-only pass); the comparison used the
  elaborated signatures supplied with the job.
- Whether K3BlochGroups §5.2's proof establishes minimality of its period (R02) cannot be read from
  its text at the head.

Source independence: 14 passages compared with 5 sources (HS53 6, Loh19 3, MilneCFT 2, SerreArbres 1,
Hutchinson13 2), none shared beyond formulas and statements of under a dozen words; largest share
HS53, 42 of 112 locators; contents compared with HS53 (Ch. I §§1–7, Ch. II §§1–5, Ch. III §§1–6):
independent — only Layer 6 draws on it, as 6.1 ↔ II §1, 6.2 ↔ II §§2–4, 6.5 ↔ II §5, 6.4 ↔ III §1,
6.6 ↔ III §§3, 6, 6.7 ↔ III §4, not in the source's order (6.4 before 6.5; 6.3, 6.8, 6.9 from other
sources; III §§2, 5 absent), and the order 6.1 → 6.2 → 6.5 → 6.6 → 6.7 is forced by the *Needs*
lines. Brown82 and CE56 could not be read (uncertified); the eight layers do not follow Brown82's
chapter order (III, VII, VII/II, V, V, VII/IV, III, VI).

## Source issues

- **Misprint** in Hutchinson13 at proof of Corollary 3.3, printed p. 12 (Hutchinson13 line 518): the source says the homology group is the cyclic one whenever the degree is congruent to 3 modulo 3; it should be congruent to 3 modulo 4, as in the statement of the corollary; affects nothing.

## For the human reviewers

- **Licence.** Loh19 is unpublished lecture notes (author's page); 26 of 112 locators cite it, each
  for a standard result also in Brown82 or HS53 (`packages/CohomologyOfGroups/sources.toml`).
- **Not tested.** Brown82 and CE56 are uncertified (16 locators): their wording and tables of
  contents were not compared with the text; the chapter-order comparison used chapter numbers only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a528360e18dd3af043951b8b7a7579b3c43ef777", "job": "RT-CohomologyOfGroups~1b", "model": "fable", "worker": "chris-x30"} -->
