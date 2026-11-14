<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15109#issuecomment-6883606544 -->
Review (claude) of 81c96e8

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 8.5: the character statement over a field of positive characteristic

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:1774–1777` (8.5): "for
   `Γ' ◁ G` of finite index the virtual character of `G/Γ'` on `H*(Γ', V)` is `χ(G) · dim_K V` times
   the regular character (… Theorem 7 gives every field)".

   **Claim:** the statement is made for every field `K`, with "virtual character" undefined in
   characteristic `p`.

   **Witness:** Brown1974 line 427–428 assumes characteristic zero. For `K = 𝔽₂`, `G = F₂`, `Γ'` of
   index 2: the regular character is `(2, 0) = (0, 0)` in `K`, so the trace identity reads `0 = 0`,
   while 7.5 gives `[H⁰] − [H¹] = −[K[ℤ/2]]` (lengths `1 − 3 = −2`).

   **Exact repair:** replace the clause by: "for `Γ' ◁ G` of finite index, in the Grothendieck group
   of finite-dimensional `K[G/Γ']`-modules, `Σᵢ (−1)ⁱ [Hⁱ(Γ', V)] = χ(G) · dim_K V · [K[G/Γ']]`; in
   characteristic zero this says that the alternating sum of the characters of `G/Γ'` on `H*(Γ', V)`
   is `χ(G) · dim_K V` times the regular character (Brown1974, §4, Theorem 4 and Corollary 1, lines
   425–451, in characteristic zero; Theorem 7 gives the Grothendieck-group form over every field)."
   Make the same change in the `statement` of target 8.5 in `design/plan.json`. Add the Check: "For
   `K = 𝔽₂`, `G = F₂` and `Γ'` the kernel of `a ↦ 1, b ↦ 0` (free of rank 3), `H⁰ = K` and `H¹` has
   length `3`, so the class is `1 − 3 = −2 = χ(F₂) · 2` in lengths, while every trace of the regular
   representation is `0` in `K`: the trace form would carry no information."

   **Retest:** on the witness, the complex `Hom_{ℤΓ'}(P, K)` for `0 → ℤG² → ℤG → ℤ` is
   `K[ℤ/2] → K[ℤ/2]²`, of class `[K[ℤ/2]] − 2[K[ℤ/2]] = −[K[ℤ/2]]`, equal to `χ(F₂) · 1 · [K[ℤ/2]]`.
   For `G = ℤ`, `Γ' = 2ℤ`, `K = 𝔽₂`: `[K] − [K] = 0 = χ(ℤ)`.

2. **F02** (P3) Downstream consumers and 4.4 Examples name roadmaps that state no such instance

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:2136–2140`: "the arithmetic
   roadmaps (`vcd` and `χ` of arithmetic groups), … and MappingClassGroupsAndCanonicalRepresentations
   (mapping class groups) state instances"; and `:1134–1135`: "and are owned by the arithmetic
   roadmaps".

   **Claim:** named and unnamed roadmaps state instances of Layers 4, 6 and 8.

   **Witness:** MappingClassGroupsAndCanonicalRepresentations at its open head has 0 occurrences of
   "cohomological dimension", "vcd", "duality group"; its only "Euler characteristic" (README line
   2222) is that of a surface cover. "The arithmetic roadmaps" names no roadmap or section.

   **Exact repair:** replace the third bullet of Downstream consumers by: "ArithmeticKTheory §3.2
   (Borel–Serre duality of `Aut(P)`, an instance of Layer 6), BianchiModularForms §9.3 and
   FuchsianOrbifolds Layer 5 item 6 (orbifold Euler characteristics, instances of 8.4 and 8.7) state
   instances and can compare them with the general invariants of Layers 4, 6 and 8." In 4.4 Examples
   replace "and are owned by the arithmetic roadmaps" by "the Borel–Serre instance for `Aut(P)` is
   ArithmeticKTheory §3.2". This is the pattern of round 8's F02 (a claim about what another roadmap
   says), found again here.

   **Retest:** each roadmap left in the bullet was opened: ArithmeticKTheory §3.2 (heading at its line
   1071, duality statement at 1160–1166), BianchiModularForms §9.3 (2243, `χ(Γ₀(𝔫, 𝔞)) = 0` at 2245),
   FuchsianOrbifolds Layer 5 item 6 (740, `−1/6` at 757). MotivicStructuresInModuliOfCurves §2.1
   (first bullet, unchanged) is at line 337 of its board package and does concern mapping class groups.

Two findings, both P3, each with a repair to apply; nothing is P1 or P2. The declared supplier gap
`gap:simplicial-replacement-dimension` (AlgebraicTopology §8.11a) is precise, minimal and declared
in both files, and is no finding. This is a design: there is no `Suggested.lean`, and Lean elaboration is not available
(this lane does not elaborate), so no build is claimed and every value below is computed by hand.

## Verified sound

### Previous findings (round 8), checked first

| Finding | Repaired passage, quoted | My check | Status |
|---|---|---|---|
| F01 (P3): contracts omit consumed Tau Ceti declarations | README 332–336: "`TauCeti.groupHomology.transfer M S n : Hₙ(G, M) ⟶ Hₙ(S, M)` … with `TauCeti.groupHomology.transfer_comp_map_subtype_id` (line 121)"; 337–342 (Schanuel); 343–348 (torus homology, `cwComplexProd`); 274–276 (`.of_isNoetherianRing`); 303–304 (`isGorensteinProjective_of_projective`); 363–366 (coprime Swan); 213–226 ("Further carriers the layers name") | Every added name opened at the pins (list below); signatures agree with the bullets. 2.3 *Needs:* (README 843–844) and plan target 2.3 carry the new transfer identity. | repaired |
| F02 (P3): "names this roadmap" | README 39–40: "CohomologyOfGroups excludes them by name in its Scope and describes a roadmap on finiteness conditions and duality groups among its downstream consumers." | CohomologyOfGroups design, Scope (line 22 on) and Downstream consumers (2122 on); the string `FinitenessAndDualityOfGroups` does not occur there. | repaired |

The repair report marks nothing "not actionable". The diff between the round-8 and round-9 heads
touches only `Exact supplier contracts`, the Scope sentence, the 2.3 *Needs:* line and one plan
prerequisite; `sources.toml` is unchanged. The F02 pattern was searched in the rest of the README
and gave R02. No maintainer notes were supplied.

### Pinned declarations opened this round

Pins confirmed by `git rev-parse` in the two package checkouts: Mathlib `1b1ccf4b`, Tau Ceti
`2fd255d9`.

- Tau Ceti: `TauCeti.groupHomology.transfer` (`TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:79`,
  `[S.FiniteIndex]`, target `groupHomology (Rep.res S.subtype M) n`) and
  `transfer_comp_map_subtype_id` (`:121`, composite `= S.index • 𝟙 _`);
  `TauCeti.exists_linearEquiv_comp_fst_eq_comp_snd_comp` (`TauCeti/Algebra/Module/Projective/Schanuel.lean:82`,
  both modules projective, `range a = range b`);
  `TauCeti.Huber.IsPseudoCoherentOver.of_isNoetherianRing` (`TauCeti/Algebra/Module/PseudoCoherent/Basic.lean:391`,
  conclusion `IsPseudoCoherentOver R M ⊤`);
  `TauCeti.groupHomologyPiMultiplicativeIntExteriorPowerEquiv` (`TauCeti/AlgebraicTopology/ClassifyingSpace/Torus.lean:243`);
  `TauCeti.cwComplexProd` (`TauCeti/Topology/CWComplex/Classical/Product.lean:194`, under
  `[RelCWComplex.Finite C] [RelCWComplex.Finite D]`, line 187);
  `TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat_of_not_dvd` (`TauCeti/NumberTheory/Padics/GroupAlgebra/Rational.lean:134`,
  hypothesis `¬p ∣ Nat.card G`); `CategoryTheory.isGorensteinProjective_of_projective`
  (`TauCeti/Algebra/Homology/TotallyAcyclic/Abelian.lean:263`).
- Mathlib: `MonoidAlgebra` (`Algebra/MonoidAlgebra/Defs.lean:76`), `Rep.trivial`
  (`RepresentationTheory/Rep/Basic.lean:288`), `Representation.ofModule'`
  (`RepresentationTheory/Basic.lean:191`, needs `[IsScalarTower k k[G] M]`), `ConjClasses`
  (`Algebra/Group/Conj.lean:133`), `PiTensorProduct` (`LinearAlgebra/PiTensorProduct/Basic.lean:104`),
  `HomologicalComplex` (`Algebra/Homology/HomologicalComplex.lean:59`), `QuasiIso`
  (`Algebra/Homology/QuasiIso.lean:138`), `IsNoetherianRing` (`RingTheory/Noetherian/Defs.lean:191`),
  `IsLocalRing` (`RingTheory/LocalRing/Defs.lean:30`, extends `Nontrivial`), `Sylow`
  (`GroupTheory/Sylow.lean:54`), `Sylow.exists_subgroup_card_pow_prime` (`:723`, inside
  `namespace Sylow` opened at 569); `Rep.FiniteCyclicGroup.groupCohomologyIsoEven`
  (`RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:80`), `groupCohomologyIsoExt`
  (`.../GroupCohomology/Basic.lean:202`), `groupCohomologyIso` (`:210`), `groupCohomology.coindIso`
  (`.../GroupCohomology/Shapiro.lean:58`), `groupHomology.indIso` (`.../GroupHomology/Shapiro.lean:65`),
  `tateCohomology` (`.../TateCohomology/Basic.lean:146`, degree in `ℤ`),
  `TateCohomology.isoGroupCohomology` (`:233`, for `n : ℕ` with `[NeZero n]`).

For the other pinned names I rely on the file-and-line list of the round-8 review, which this
round's diff does not touch.

Duplication by object, re-run at both pins: no `HattoriStallings`, no duality or Poincaré duality
group, no geometric dimension, no `vcd`, no finiteness type of groups, no Euler characteristic of
groups; the three "Farrell" hits are topology files (ends, proper homotopy); the
`cohomologicalDimension` hits are the profinite invariant that 2.8 compares with. Across roadmaps
(`roadmaps grep`, README only): "Eilenberg–Ganea", "Farrell cohomology", "finite homological
type", tensor induction of complexes and Serre's theorem have no match on main or at any open
head; "duality group" matches only ProfiniteProPGroups (which says a profinite theory is not
built); "Hattori" matches EtaleCohomologyFoundations §F.10.3 and its consumers, cited here.

### Adversarial pass

Values are my own computations this round. `C_m` cyclic of order `m`, `F_r` free of rank `r`,
`A = C₄ ∗_{C₂} C₆`, `K` the Klein bottle group.

| Statement | Instances tried and values computed on each side | Result |
|---|---|---|
| 1.1 (sampled) | (a) `A = ℤ`, `M = ℚ`, `N_i = ℚ/(1/i!)ℤ`: colimit `ℚ/ℚ = 0`; the projection is nonzero at every stage, so nonzero in `colim Hom`. (b) `A = k[x₁, …]`, `M = k`, `N_i = A/(x₁..x_i)`: `N_i` a domain, `x_{i+1}`-torsion `0`, so `Hom(k, N_i) = 0`, while `Hom(k, k) = k`: `c₀` is `0 → k`, injective, not onto. (c) at `n = 0` is (a); at `n = 1` it adds injectivity of `c₁` to (b), which finite presentation gives (`P₀, P₁` finitely generated). `M = 0`: all maps `0 → 0`. | sound |
| 1.4 (sampled) | (a) `R` is a quotient of `RG`. (b) `G = ℚ`, `R ≠ 0`: not `FP_1`; `R = 0`: `FL`, so nontriviality is used. (c) `F₂` with no relator: terms `RG, RG², 0`; boundary `(a, b) ↦ a(s − 1) + b(t − 1)`, image the augmentation ideal. Normal closure of `b`: free on `aᵏba⁻ᵏ`, abelianization `ℤ^{(ℤ)}`. | sound |
| 1.5 (headline) | `n = 0`: (b) is injectivity of `colim Mᵢ^G → (colim Mᵢ)^G`, true for every group; (d)/(e) surjectivity of `(∏N_j)_G → ∏(N_j)_G`, true. `G = ℚ`, `R ≠ 0`, `n = 1`: `(R[ℚ/(1/i!)ℤ])^ℚ = 0` (infinite orbits) against `(colim)^ℚ = R`. `R = 0`: all `0 → 0`. | sound |
| 1.7(a) route | For total degree `k ≤ n`, every `E₂^{p,q}` with `p + q = k` has `p, q ≤ n`; `colim H^q(N, Mᵢ) = 0` for `q ≤ n`, then 1.5(c) for `G ⧸ N` at `p ≤ n`. `C₂ × ℤ`: `FP_∞` both ways. | sound |
| 1.8 | `n = 0`: `0 − 1 = 0` in `ℕ∞`, all three groups `FP_0`. `BS(1, 2)`: cone of `R[G/A] → R[G/H]` with length-1 free resolutions gives a free resolution of length 2. | sound |
| 2.2 (sampled) | (a) a projective resolution of length `n` computes `Tor`, so `hd ≤ cd`; `ℚ`: `1 < 2`. (b) `C₂/ℤ`: `Hᵏ(C₂, F) = 0` for `k > 0`, `cd = ⊤`, so `cd < ⊤` is needed. (c) `n = 0`, `G` finite, `|G|` a unit: `C = R·Σg`, `A^G ≅ A_G`. `ℤ²`: `H²(ℤ², A) = A_{ℤ²} = C ⊗_{RG} A` with `C = R`. (d) `G = 1`, `R ≠ 0`: `H⁰(1, R) = R ≠ 0`, `cd = 0`; `R = 0`: no nonzero degree, so nontriviality is needed for "largest `k`". | sound |
| 2.3 (sampled) | (a) Shapiro. (b) `2ℤ ≤ ℤ`: `1 = 1`; `ℤ ≤ C₂ × ℤ` over `ℤ`: `1` against `⊤`, excluded by `cd_R G < ⊤`. (c) same pair over `ℚ`: `H¹(G, ℚ) = ℚ`, `cd_ℚ G = 1 ≤ 1`; over `𝔽₂` index `2 = 0` is not a unit and `cd = ⊤`. `H₀` transfer for `1 ≤ C₂`, `M = ℤ`: `m ↦ 2m`, composite `×2`. | sound |
| 2.6 (sampled) | `ℤ ∗ ℤ`: `max(1, 1, 0 + 1) = 1`, true value 1. `A/ℚ`: `max(0, 0, 1) = 1`, and `A` infinite gives `cd_ℚ ≥ 1`. `BS(1, 2)`, `R ≠ 0`: `max(1, 2) = 2`. `R = 0`: bound `1`, value `0`. `F = 1`: `cd = 0 ≤ 1`, equality correctly excluded. | sound |
| 2.7 | `ℤ/6`, `C₂`: `2` not a unit, `H²(C₂, ℤ/6) = (ℤ/6)/2 = ℤ/2`. `ℤ[1/2]`, `C₆`: `3` not a unit. `R = 0`, `G = ℤ`: `cd = 0`, infinite. | sound |
| 3.2 (headline) | `ℤ² ≤ K`: `2 = 2`. `dℤ ≤ ℤ`: `1 = 1`. `ℤ ≤ C₂ × ℤ`: `1 ≠ ⊤`, torsion. Route at `n = 0`: `H = 1`, `ℤ` free over `ℤ[1]`, no swindle needed; `n ≥ 1`: swindle on `P_n ⊕ F ≅ F`. | sound |
| 4.1 (sampled) | Infimum over finite-index `H`: values are `n` (torsion-free) or `⊤`, so `inf = n`. Finite `G`: `H = 1`, `0`; conversely `cd_ℤ H = 0 ⇒ H = 1`. `A → C₁₂`, `1 ↦ 3` on `C₄`, `1 ↦ 2` on `C₆`: the involution goes to `6` both ways; image contains `3, 2`, so onto; kernel index 12. `⊕_ℕ C₂`: `⊤`. | sound |
| 4.2 (sampled) | `C₂ × ℤ`: `1 = 0 + 1`. Route: `G' = G₀ ∩ π⁻¹(Q₀)`; `cd G' ≤ cd(G' ∩ N) + cd(G'N/N) ≤ vcd N + vcd(G ⧸ N)`. Subgroup: `C₂ ≤ C₂ × ℤ`, `0 ≤ 1`. | sound |
| 4.4 (sampled) | `C₂ × ℚ`: `ℚ` divisible, so the finite-index subgroups are `ℚ` and `G`; `vcd = cd_ℤ ℚ = 2`; `H₁(ℚ, ℤ) = ℚ` not finitely generated. Finite index, both directions: for `G''` torsion-free, pass to the core `N` of `G'' ∩ H` in `G''`; `E²_{pq} = H_p(G''/N, H_q(N))` finitely generated. | sound |
| 5.1 (sampled) | Point: `gd 1 = 0`. `S² = e⁰ ∪ e²`: no 1-cells, `π₂ = ℤ`. Two points: not path-connected. `ℤⁿ`: torus cells `C(n, k)`, top dimension `n`, and `cd_ℤ = n`; `n = 0` is the point. | sound |
| 5.3 (headline) | `ℤ³`: `3 ≤ max(3, 3)`. `ℤ²`: bound `3`, value `2`, not claimed sharp. `C₂`: `⊤ ≤ ⊤`. | sound |
| 5.4 | `G = C₂ × ℤ`, `Γ = ⟨t⟩`, `W` the line: `(t·f)(s) = f(st) = t f(s)`; `s tᵏ` fixes `(x, y)` iff `t^{2k} x = x` iff `k = 0`; stabilizers `⟨s⟩` on the diagonal, order `2 = [G : Γ]`. | sound |
| 6.1, 6.3 (headline) | The definition gives `Hⱼ(G, D ⊗ M) = 0` for `j > n` through `FP` and `hd = cd` (6.2(c), (d)), so nothing of the source's `k < 0` range is lost. `ℤⁿ`: `FL`, `Hᵏ(ℤⁿ, Rℤⁿ) = R` at `k = n` only. `R ≠ 0`, `FP`, all `Hᵏ(G, RG) = 0`: impossible by 2.2(d), so `Hⁿ ≠ 0` is automatic. `R = 0`: both sides hold for every `n`. | sound |
| 7.2 (sampled) | Trace of `v ↦ g v e` on `RGᵐ`: coefficient of `h` in `g h k` is 1 iff `k = h⁻¹g⁻¹h`; summing over `h` gives `|C_G(g)|` times the coefficients of `e_{ii}` on `[g⁻¹]`. `P = RG`: `|G|·[g = 1]` both sides. `C₃/ℂ`, `e = (1/3)Σζ(h)⁻¹h`: `ge = ωe`; coefficient of `g⁻¹` is `ω/3`; `3·ω/3 = ω`, while `[g]` gives `ω⁻¹`. `R = ℚ × ℚ`, `G = 1`, `P = R(1, 0)`: both sides `(1, 0)`; `LinearMap.trace` gives `0`. | sound |
| 8.4 (headline) | `C₂`: `χ_ℚ(1)/2 = 1/2` against `χ_ℚ(C₂) = 1`. `A`: `(1 − 2)/12 = −1/12`. Index `d` subgroup: numerator and denominator both scale by `d`. | sound |
| 8.5 (sampled) | `ℤ`, `V = K_λ`: `λ ≠ 1` gives `0 − 0`, `λ = 1` gives `1 − 1`; `χ(ℤ) = 0`. `F₂`: `1 − 2 = −1`. `C₂`, `ℚ`: `1 ≠ 1/2`, type `FP` needed. Characteristic `p`: see R01. | sound in characteristic 0; R01 |
| 8.6 (headline, sampled) | `F₂ × F₃`: `E₂` dimensions `1, 3; 2, 6`; totals `1, 5, 6`; `1 − 5 + 6 = 2 = (−1)(−2)`. `C₂ × ℤ`: `(1/2)·0 = 0`. Route: `Γ = Γ₀ ∩ π⁻¹(Q₀)` makes the image torsion-free, so `FP` by 4.4; `[G : Γ] = [G ⧸ N : Q]·[N : Γ ∩ N]` (for `C₂ × ℤ`, `Γ = ℤ`, `N = C₂`: `2 = 1·2`). | sound |
| 8.7 (headline) | `A`: `1/4 + 1/6 − 1/2 = −1/12`; reversed edge sign `11/12`. `C₂ ∗ C₃`: `−1/6`. `BS(1, 2)`: `0 − 0`. Sign twist: `H_*(ker ε; ℚ) = H_*(T; ℚ) ⊕ H_*(T; ℚ_ε)` and `χ_ℚ(ker ε) = 2χ_ℚ(T)` give `χ_ℚ(T; ℚ_ε) = χ_ℚ(T)`. | sound |
| 8.8 | Reflected 4-cycle: `0 + 1·2 = 2·1`. Free rotation: `0 + 0 = 2·0`. (d): `v_p|P ∩ G_x| ≤ v_p|G| − e`, so `P`-orbits are divisible by `pᵉ`. | sound |
| 8.9 (headline, sampled) | `A`: orders `1, 2, 3, 4, 6`, `m = 12`, `12·(−1/12) = −1`; largest order `6` gives `−1/2`. `C₂ ∗ C₃`: `6·(−1/6) = −1`. Finite `G`: `|G|/|G| = 1`. Orbit size `|Q|/|G_z| = (|Q|/m)(m/|G_z|)`. Equivalence: `p^a ∣ den ∣ m` gives a finite subgroup of order divisible by `p^a`, hence one of order `p^a`; conversely `den ∣ m`. | sound |
| 9.3 (sampled) | `C₂`, `M = ℤ`, periodic complex: cochain maps alternate `0, 2`; `(Ĥ⁻¹, Ĥ⁰, Ĥ¹, Ĥ²) = (0, ℤ/2, 0, ℤ/2)`. `M = RG`: `0` by total acyclicity. `ℤ`: `cd < ⊤`, contractible `F`, `0`. | sound |
| 9.4 (headline, sampled) | `F → P` iso in degrees `≥ n`: cocycles in degree `k ≥ n` agree, coboundaries agree for `k > n` and can only grow at `k = n`: iso above `n`, onto at `n`. `C₂`: `ℤ → ℤ/2`. `C₂ × ℤ`: `0 → H^{k−1}(C₂) → Hᵏ → Hᵏ(C₂) → 0`, one outer term `ℤ/2`. `A`, even `k`: restriction `ℤ/4 → ℤ/2` onto (a character of order 4 restricts nontrivially), kernel of order `24/2 = 12` containing `(1, 1)` of order 12; odd `k`: `0`. | sound |

For the targets not in this table (1.2, 1.3, 1.6, 2.1, 2.4, 2.5, 2.8, 3.1, 4.3, 5.2, 6.2, 6.4–6.6,
7.1, 7.3–7.5, 8.1–8.3, 9.1, 9.2, 9.5) I read the text in full and found no disagreement with the
computed rows of the round-7 and round-8 tables; no repair has touched them since.

### Sources: the seeded sample

No locator is flagged by the author as unverified. Five texts were read from the cache; none was
fetched; the manifest is unchanged. All 11 cited works have manifest entries.

| Target | Locator checked | Result |
|---|---|---|
| 1.1 | Brown1975 Theorem 2, lines 83–92 (conditions (ii), (iii)); Corollary of Theorem 1, lines 78–81; Lemma 1(a), lines 105–114 | Match; the degree bounds (iso below `k`, mono at `k`) are the source's. |
| 1.4 | Brown1974 lines 441–447; BieriEckmann1974 line 294; BieriEckmann1973 line 662, sequence (5.1) | Match. |
| 2.2 | BieriEckmann1973 Proposition 2.1, lines 280–286; Theorem 4.2, lines 566–602; Corollary 4.3, lines 604–607; lines 615–621 | Match; the source assumes less (type (FP − n)) than the README's type `FP`. |
| 2.3 | BieriEckmann1973 lines 280–286 and line 396 | Match. BrownGTM87 §III.10 not read. |
| 2.6 | BrownGTM87 §VIII.2 | Not read (settled uncertified); the bounds follow from the sequences of CohomologyOfGroups §3.6, cited. |
| 4.1 | Serre1971Bourbaki lines 77–86; Brown1974 lines 352–358 | Match. |
| 4.2 | BrownGTM87 §VIII.11 | Not read; the route was checked step by step (table). |
| 4.4 | Brown1974 lines 359–370; Proposition 1, lines 380–384 | Match. |
| 5.1 | BrownGTM87 §VIII.7 | Not read. |
| 7.2 | BrownGTM87 §IX.2 | Not read; the identity was recomputed (table). |
| 8.5 | Brown1974 Theorem 4 and Corollary 1, lines 425–451 | Match in characteristic zero (line 427–428); see R01 for other fields. |
| 8.6 | Brown1974 Corollary 2, lines 452–463 | Match, hypotheses included (virtually torsion-free). |
| 8.9 | Brown1974 Theorem 5 and Corollary 1, lines 603–610; lines 611–614; Lemma and proof, lines 637–660 | Match. |
| 9.3, 9.4 | Farrell1977; BrownGTM87 §X.3 | Not read (settled uncertified); checked against the pinned complete-resolution API and by computation. |

### Suppliers, gap and ownership

Dependency check, as prescribed:

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2201 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Citations resolved this round against the current texts:

| Supplier | Where read | Result |
|---|---|---|
| CohomologyOfGroups (merge order; board design) | `packages/CohomologyOfGroups/design/README.md` | §1.2 (620), §1.4 (663), §1.5 (687), §2.3 (800), §3.1 (849), §3.2 (900), §3.4 (959), §3.5 (978), §3.6 (1007), §4.6 (1172), §5.2 (1339), §6.1–6.3 (1484, 1529, 1569) |
| SpectralSequencesAndConvergence (open, new folder, earlier in the order) | README at its head | §2.1 (565); §3.4 (806), Euler identity at 819–822 with the hypotheses the contract states; §5.3 (1341), Euler characteristic at 1370 on a page `r ≥ 2` |
| SchemeKTheoryOperations (open, new folder, earlier in the order) | README at its head | §6.7 (2511); directed-union colimit statement at 2583, any commutative ring |
| FreeGroupsAndLimitGroups (main) | README | §4.5 (863), §4.7 (906), §4.8 (937), §4.9 (950) |
| EtaleCohomologyFoundations (main) | README | §F.10.3 (1295) |
| ClassifyingSpaces (main) | README | Stage 2 item 10 (173), Stage 4 items 16 (224) and 17 (238). Item 17 is stated for `BG`, well defined up to homotopy among spaces of CW type by item 12, which is how the contract reads it. |
| AlgebraicTopology (main) | README | §4.2–4.3 (1294, 1305), §4.7 (1739), §6.3 (2491), §6.4 (2873), §8.1 (3219), §8.3 (3334), §8.5 (3413), §8.7 (3618), §8.11a (3971; replacement by an abstract simplicial n-ad with Hatcher's Theorem 2C.5 at 3979–3982, no dimension bound) |
| ProfiniteCohomology (main) | README | Layer 11 (2919) |

Scope-only mentions: BordismFormalGroups (main, Brown–Farrell complete resolution at its line
1442), GorensteinHomologicalAlgebra (open; line 28 excludes complete cohomology of groups),
PosetHomotopyAndSubgroupComplexes (open; lines 104–107), SheafTheoreticSmithTheory (open), and
those of R02.

Open revisions of suppliers: the two open pull requests that revise ClassifyingSpaces rewrite it in
Layers and keep the cited ids through a "Stage and item numbers" mapping (items 10, 16 and 17 each
mapped; item 17 for an arbitrary Hausdorff CW `K(G, 1)` to its Layer 2, 2.1–2.3), so the citations
stay valid and need no change. AlgebraicTopology at those heads keeps 4.7 and 8.11a with the
simplicial replacement. `scratch/overlaps.md` lists no other pull request changing this roadmap,
no dropped or revision-only id and no second copy; main has no `FinitenessAndDualityOfGroups`
folder.

The gap `simplicial-replacement-dimension` has the same slug in `design/plan.json` (`gaps`, with
supplier AlgebraicTopology, section §8.11a, needed by 5.4) and in the README (487–489 and 1252);
its `needs` is one sentence with its hypothesis (dimension at most `N`), and §8.11a as it stands
does not give the bound, so it asks for nothing already provided. Precise, minimal, declared.

Overlap check: read ClassifyingSpaces (main and its two open revisions), AlgebraicTopology (main and its two open revisions), FreeGroupsAndLimitGroups (main), SpectralSequencesAndConvergencePartII (open, by its scope as recorded in round 8); shared objects and owners: `K(G, 1)` CW complexes, cellular resolutions and local-coefficient comparison — ClassifyingSpaces; CW realization, Hurewicz, Whitehead, manifold duality, simplicial replacement — AlgebraicTopology; graphs of groups and Bass–Serre trees — FreeGroupsAndLimitGroups; the Euler identity of a spectral sequence — SpectralSequencesAndConvergence. Each is cited here and none is restated.

### Shape, headlines, policy

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, nine layers each ending in Examples and Dependencies, Downstream consumers, References.
  `design/plan.json` parses: 51 targets (12 definitions, 38 theorems, 1 construction); every
  definition has at least three tests; every target has a locator; one gap, used by 5.4 only.
- Organisation: layers are named by their mathematics; the README nowhere says it follows a source.
- Headlines (from the Summary): 1.5, 3.2, 5.3, 6.3, 8.4, 8.6, 8.7, 8.9, 9.4, all in the table.
  There is no `Suggested.lean` at this stage, so the one-tactic probe, the `#check` comparison and
  the import check have nothing to run on.
- Policy: searched for LaTeX delimiters, pull-request numbers, round labels, machine paths,
  "optional", "deferred", "for later": none. No algorithm, no `set_option`.

### Copyright and arrangement

Locators before References: Brown1974 35, BieriEckmann1973 28, BrownGTM87 22, BieriEckmann1974 13,
Brown1975 8, Serre1971Bourbaki 7, Serre1971Prospects 6, Farrell1977 5, Floyd1952 3,
EilenbergGanea1957 1, Wall1961 1 (129).

Contents of Brown1974 (lines 36–57) against the layers: §1 ↔ 8.1–8.2, 8.8(c); §2 ↔ 8.8(d);
§3 ↔ parts of 1.2, 2.1, 4.1, 4.4; §4 ↔ 8.3–8.6; §5 ↔ 8.7; §6 ↔ 8.9, 5.4; §§7–9 and Appendix B
not used; Appendix A ↔ 7.4–7.5. No layer maps onto one section; §3 is spread over three layers and
§6 over two. Inside Layer 8 the order 8.3 → 8.4 → 8.5 → 8.6 is forced by the *Needs:* lines (8.4
needs 8.3; 8.5 needs 8.4; 8.6 needs 8.5), as is 8.8 → 8.9.

Wording: 14 passages set beside the texts this round (1.1, 1.2, 1.4(b), 1.4(c), 2.2(b), 2.2(c),
2.2(d), 4.1, 4.4, 8.4, 8.5, 8.6, 8.9, 5.4). The longest shared run is 14 words, in the statement of
8.9 against Brown1974 line 607–608, a theorem statement the mathematics forces; next is 5 words in
the definition of finite homological type (Brown1974 line 369–370). No sentence, list or proof
plan is reproduced or translated; no table, figure or exercise list is taken over.

Source independence: 14 passages compared with 5 sources (Brown1974, Brown1975, BieriEckmann1973, BieriEckmann1974, Serre1971Bourbaki), none shared beyond forced statements; largest share Brown1974, 35 of 129 locators; contents compared with Brown1974: independent. BrownGTM87 (22 locators) and the four other uncertified texts could not be read; Floyd1952 was not re-read this round.

## Not verifiable

- BrownGTM87 (settled uncertified): §§III.10, VI.3, VIII.2, VIII.3, VIII.5, VIII.6, VIII.7,
  VIII.11, IX.2, X.2, X.3 not checked against the text; this covers the sampled 2.6, 4.2, 5.1, 7.2
  and, with Farrell1977, 9.3 and 9.4. Their mathematics was checked by computation only.
- Farrell1977, EilenbergGanea1957, Wall1961, Serre1971Prospects (settled uncertified): locators
  not checked against the texts.
- OCR damage in Brown1974 lines 349–351, 360, 412 and in Brown1975 lines 84–86 (condition (i) of
  Theorem 2 is partly lost) and BieriEckmann1974 line 291: the damaged symbols were not relied on.
- `Suggested.lean` does not exist at the design stage and this lane does not elaborate.
- SheafTheoreticSmithTheory's scope sentence (README 102–103) was not compared with its text
  beyond its title; it is a scope mention, not a supplier.

## Source issues

- **Misprint** in BieriEckmann1974 at proof of Theorem 3.4, printed p. 82: the source says the conclusion follows from reference [2], Theorem 4.6 (finite generation); it should be reference [2], Theorem 4.5 (the duality criterion); affects the proof.
- **Misprint** in BieriEckmann1974 at the Remark after Theorem 3.4, printed p. 82: the source says the result and "Theorem 4.3" do not imply each other; it should be Theorem 3.4, the paper having no Section 4; affects nothing.

(Both were found in round 8 and are carried here so that the register has them; none was found
anew this round.)

## For the human reviewers

- **Not tested.** BrownGTM87 carries 22 of 129 locators and its text and contents were not available (`sources.toml`, status uncertified); wording and arrangement were tested against Brown1974, the largest share, not against it.
- **Licence.** Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects are recorded as uncertified with licence class `none` in `sources.toml`; they are cited by locator only and were not read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "81c96e857fe34eb34d17d34f1fb3c4ee5d4a56c3", "job": "REV-DESIGN-FinitenessAndDualityOfGroups~9", "model": "fable", "worker": "chris-x52"} -->
