# Review of FinitenessAndDualityOfGroups (pull request #2343 at 9c048f9)

**Verdict:** needs changes

## R01 (P3) — two Tau Ceti declarations used by 5.4 are missing from the supplier contracts

**Location:** `TauCetiRoadmap/FinitenessAndDualityOfGroups/README.md` lines 1466, 1475, 1481–1482 (5.4): "`AbstractSimplicialComplex.dimension K ≤ N`", "`AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`"; `### From Tau Ceti`, lines 352–531.

**Claim:** `## Exact supplier contracts` lists every library declaration the layers consume, by name, with what is assumed of it.

**Witness:** Neither name occurs in lines 213–648. Both exist at the pin: `TauCeti/AlgebraicTopology/SimplicialComplex/Dimension.lean` line 266 (valued in `WithBot ℕ∞`) and `.../SimplicialComplex/Subdivision/Homeomorph.lean` line 221. Every other library name of the layers is listed.

**Repair:** Add after the `AbstractSimplicialComplex.Realization` bullet of `### From Tau Ceti`:

    - `AbstractSimplicialComplex.dimension K`
      (`TauCeti/AlgebraicTopology/SimplicialComplex/Dimension.lean` line 266), valued in `WithBot ℕ∞`:
      the supremum over the faces of the number of vertices minus one, `⊥` for the complex with no
      face and `⊤` when the faces are unbounded; `dimension K ≤ N` says that every face has at most
      `N + 1` vertices. And `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph K`
      (`TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Homeomorph.lean` line 221): the
      homeomorphism from the realization of the barycentric subdivision of `K` to the realization
      of `K`, sending the vertex of a face to its barycentre. Both are used in 5.4.

## R02 (P3) — three layer comments of `Suggested.lean` do not carry the README's layer titles

**Location:** `TauCetiRoadmap/FinitenessAndDualityOfGroups/Suggested.lean` lines 115, 155, 189: "`## Layer 2: cohomological dimension`", "`## Layer 5: geometric dimension and the Eilenberg–Ganea theorem`", "`## Layer 7: projective modules over group rings and Swan's theorem`".

**Claim:** The section comments are `/-! ## Layer k: <title> -/` with the README's titles.

**Witness:** README lines 951, 1349, 1861: "Layer 2: cohomological and homological dimension", "Layer 5: geometric dimension, the Eilenberg–Ganea theorem and proper actions", "Layer 7: ranks of projective modules over group rings and Swan's theorem". Layers 1, 3, 4, 8, 9 agree.

**Repair:** Replace the three comments by

    /-! ## Layer 2: cohomological and homological dimension -/
    /-! ## Layer 5: geometric dimension, the Eilenberg–Ganea theorem and proper actions -/
    /-! ## Layer 7: ranks of projective modules over group rings and Swan's theorem -/

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 module criterion | `A = ℤ`, `M = ℚ`, `N_i = ℚ/(1/i!)ℤ`; `A = k[x₁,…]`, `M = k`; `M = 0` | `colim N_i = 0`, projections nonzero; `Hom(k, N_i) = 0`, `Hom(k, k) = k`: `c_0` injective, not onto | agrees |
| 1.5, `isOfTypeFPn_iff_colimit`, `isOfTypeFPn_iff_piComparison` | `n = 0`; `n = 1`, `G = ℚ`; `J = ∅`; (e) at `n = 1, 2` | `colim M_i^G → (colim M_i)^G` injective, `(∏N)_G → ∏(N_j)_G` onto, always; `ℚ`: `0 → R` at `k = 0`; (e) ⇔ f.p. plus `Tor_1 = 0` | agrees |
| 2.4 | Klein bottle group over `𝔽₂`; `ℤ/2 × ℤ` over `ℤ` | first map `1 − (−1) = 0`, `H² = 𝔽₂`, `cd = 2 ≤ 1 + 1`; `⊤ + 1 = ⊤` | agrees |
| 2.7 | `ℤ/2` over `ℤ/6`, `ℤ[1/2]`, `0`; `ℤ` over `0` | `H²(ℤ/2, ℤ/6) = ℤ/2 ≠ 0` so `⊤`; `0`; `0`; `cd_0 ℤ = 0` with `ℤ` infinite | agrees; nontriviality used |
| 3.1 Checks | `H = 1`, `G = ℤ/2`, `F = (Rx → Ry)` | `d(x⊗x) = y⊗x − x⊗y`; signed swap commutes; unsigned defect `2(y⊗x − x⊗y)`; `dh + hd = id` in degrees 0, 1, 2 | agrees |
| 3.2, `cohomologicalDim_eq_of_finiteIndex` | Klein ⊇ `ℤ²`; `ℤ ⊇ dℤ`; `ℤ/2 × ℤ`; `cd H = ⊤` | `2 = 2`; `1 = 1`; `⊤ ≠ 1`, excluded; `⊤ = ⊤`. Pinned `IsMulTorsionFree` is the commuting form, so Klein (`(ab)² = b²`) satisfies it | agrees |
| 4.1 | `ℤ/4 ∗_{ℤ/2} ℤ/6 → ℤ/12` by `×3`, `×2`; finite `G`; `⊕_ℕ ℤ/2` | both send the `ℤ/2` generator to `6`; onto, kernel index 12; `vcd = 1`; `0`; `⊤` | agrees |
| 4.4 definitions | `ℤ/2 × ℚ`; finite index `H` of finite homological type | `vcd = 2`, `H₁(ℚ) = ℚ` not f.g.; normal core is torsion-free of finite index in `H`, f.g. homology passes up | agrees |
| 5.3, `geometricDim_le_max` | `1`, `ℤ²`, `ℤ³`, `ℤ/2` | `0 ≤ 3`; `2 ≤ 3`; `3 ≤ 3`; `⊤ ≤ ⊤` | agrees |
| 5.4 (R01) | `Sⁿ`; `N = 0` | `Hₙ = ℤ` against `0` for dimension `< n`; discrete space; `dimension` of the faceless complex is `⊥ ≤ N` | statement sound; contract missing |
| 5.5, `exists_acyclic_action_finite_stabilizers` | `G = ℤ/2 × ℤ`, `Γ = ⟨t⟩`; `G` finite, `Γ = 1` | `Z = W × W`, dimension `2 ≤ 2·3`, stabilizers `⟨s⟩` or `1`; point with stabilizer of order `[G : 1]`; `G_f → Γ\G` injective | agrees |
| 6.5(c), 6.4 | Klein bottle group | `(t·d)(a) = t d(a⁻¹) t⁻¹ = −a`, `w(t) = −1`; `H² = ℤ/2 = H₀(K, ℤ_w)`; orientable model gives `ℤ` | agrees |
| 6.6 | `S²`; circle with a doubled point | `H⁰(1, R) = R → H₂(1, R) = 0`; `π₁ = F₂`, `H¹ = ℤ²` against `H₀(F₂, ℤ_w) ∈ {ℤ, ℤ/2}` | agrees; both hypotheses used |
| 7.2 | `ℤ/3` over `ℂ`, `e = (1/3)Σζ(h)⁻¹h`; `P = RG`; `𝔽_p[ℤ/p]`, `g = 1` | trace `ω/3` = coefficient of `g⁻¹`, that of `g` is `ω⁻¹/3`; both `[g = 1]`; `χ_P(1) = 0`, `r_P([1]) = 1` | agrees |
| 7.3(b), 7.4, `exists_linearEquiv_tensorRat`, `…tensorZMod` | `G = 1`; `P = 0`; `P = (ℤG)²`; trivial `ℤ` over `ℤ/p` | `m = rank P`; `m = 0`; `m = 2`; rank `1 < p`, not free, excluded by projectivity | agrees |
| 7.5 | `Γ = ℤ`, `V = K_λ`: `P = ℤΓ`; `P = ℤ`, `λ ≠ 1` | `1 = 1·1`; `0 ≠ 1·1`, excluded | agrees |
| 8.4, `groupEulerChar_eq_div_index`, `groupEulerChar_subgroup` | finite `G`; `ℤ/2 × ℤ`; the amalgam; free group of countable rank | `1/|G|`; `0`; `(1 − 2)/12`; values `{1, 1/2}` give the convention `0`, excluded by the hypothesis | agrees |
| 8.5, `finsum_finrank_groupCohomology_eq_groupEulerChar_mul` | `ℤ`, `K_λ`; `F₂`, `Γ'` of index 2; `ℤ/2`, `ℚ` | `0 = 0`; `𝟙 − (2·𝟙 + sgn) = −[ℚ[ℤ/2]]`; `1 ≠ 1/2`, excluded by type `FP` | agrees |
| 8.6, `isVirtuallyOfTypeFP_and_groupEulerChar_eq_mul` | `F₂ × F₃`; finite `G`; `N = 1` | `1 − 5 + 6 = 2 = (−1)(−2)`; `1/|G| = (1/|N|)(|N|/|G|)`; `χ(1) = 1` | agrees |
| 8.7, `groupEulerChar_eq_sum_of_monomialResolution`, `…_pushoutI`, `…_hnnExtension` | the amalgam; `ℤ/2 ∗ ℤ/3`; `F_r`; `BS(1,2)`; restriction to `Γ'` | `1/4 + 1/6 − 1/2 = −1/12`; `−1/6`; `1 − r`; `0 − 0`; `[G : Γ'G_σ]·[G_σ : Γ' ∩ G_σ] = [G : Γ']` | agrees |
| 8.8(a), `smith_floyd` | point; free `ℤ/p`-set; 4-cycle, reflection and rotation; `E(ℤ/2)` | `1 + (p−1) = p`; `p + 0 = p·1`; `0 + 1·2 = 2·1`, `0 + 0 = 2·0`; `χ = 1` odd, excluded by dimension | agrees |
| 8.9, `exists_int_eq_mul_groupEulerChar`, `exists_subgroup_card_eq_of_dvd_den` | the amalgam; `ℤ/2 ∗ ℤ/3`; `m = 0`; `k = 0` | `12·(−1/12) = −1`, `6·(−1/12) ∉ ℤ`; `6·(−1/6) = −1`; `0 = 0`; `K = ⊥`; `|Q|/|stab| = d·(m/|stab|)` | agrees |
| 9.2, `isGorensteinProjective_opcycles` | `n = 0`; `ℤ/2` over `ℤ`; `cd_R G < ⊤`; `R = 0` | `opcycles 0 = R`, forces `G` finite with `R` projective over `H`; `ℤ` is a lattice; syzygy projective; zero | agrees |
| 9.4 | `F → P` iso in degrees `≥ n`; `ℤ/2`; `ℤ/2 × ℤ`; the amalgam | same cocycles for `k ≥ n`, more coboundaries at `k = n`; `ℤ → ℤ/2`; `ℤ/2` for `k ≥ 2`; kernel of order `4·6/2 = 12` | agrees |
| 9.5 | `ℤ/2`, `M = ℤ` | `ℤ/2, 0, ℤ/2, 0` in degrees `0, 1, 2, −1` on both sides | agrees |

- Source locators checked against the cached texts: 70 (Brown1974 22, BieriEckmann1973 21, Brown1975 9, BieriEckmann1974 7, Serre1971Bourbaki 5, Floyd1952 5, Hatcher2002 3, the last by printed page); all support the statements as written.
- Library declarations opened at the pins: 28, with file and line (24 line numbers of the supplier contracts confirmed, plus `IsMulTorsionFree` `Mathlib/Algebra/Group/Monoid.lean` 552, `leastENatBound` line 39, `IsPseudoCoherentOver` line 89, and the two of R01). No pinned declaration states a target; no cap product on `groupCohomology` at either pin.
- Cross-roadmap citations resolved: 45 (CohomologyOfGroups 14 sections at its open head, SpectralSequencesAndConvergence 3 at its open head, FreeGroupsAndLimitGroups 4, EtaleCohomologyFoundations 1, AlgebraicTopology 9, ClassifyingSpaces 4, ProfiniteCohomology 2, and the instance owners). The three entries of the worker's citation leads are source keys read as roadmap names.
- Gate: every check passes. Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`.
- Elaboration: `sorry` is the only warning (18 declarations). One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`): 0 of 18 theorems close. The 27 elaborated signatures were compared with the README; the file has no section variables and nothing changed.
- Headlines: 1.5, 3.2, 5.3, 8.4, 8.6, 8.7, 8.9 are stated; 6.3 and 9.4 are named in the module docstring with the missing carrier (cap product; Farrell cohomology as a functor).
- Pull request text: no sentence contradicted by the head; no file outside the folder.
- Overlap check: read CohomologyOfGroups, ClassifyingSpaces, AlgebraicTopology, StableHomotopyKTheory; CW-to-simplicial replacement is AlgebraicTopology §8.11a's, 5.4 here is its dimension-bounded form and says so; nothing else shared.

Source independence: 12 passages compared with 7 sources, none shared beyond a forced statement (longest common run 13 words, Brown1974 line 607); largest share Brown1974, 38 of 150 locators; contents compared with Brown1974: independent (8.1–8.9 ↔ §§1, 1, 4, 4, 4, 4, 5, 2, 6, the order forced by the *Needs:* lines of 8.2, 8.4, 8.5, 8.6, 8.9). BrownGTM87 could not be read.

## Not verifiable

- 7.2 (BrownGTM87 §IX.2), 9.4 and 9.5 (Farrell1977; BrownGTM87 §§X.3, VI.3): both sources are uncertified, the locators were not read.
- 5.3 (EilenbergGanea1957), 8.4(d) (Wall1961), and the 21 other BrownGTM87 locators: uncertified.
- Serre1971Prospects n° 1.7, Théorème 1 and n° 1.8: confirmed only through the citations at Brown1974 lines 354, 402, 611 and BieriEckmann1973 line 396.
- BieriEckmann1974 line 135 reads `i<k` in the extraction where Proposition 1.2 needs `i ≤ k`; the scan does not settle which the print has. The README's 1.5(e) is correct either way.
- PosetHomotopyAndSubgroupComplexes (named as a consumer only): its head is not among the checkouts given.

## Source issues

- none

## For the human reviewers

- **Not tested.** BrownGTM87 carries 23 of 150 locators and is uncertified: wording and arrangement were not compared with it. The layers cite §§VIII.5–6, VIII.2, VIII.3, VIII.11, VIII.7, IX.2, X.2–3, in that order.
- **Declared gaps.** `packages/FinitenessAndDualityOfGroups/design/plan.json` declares two gaps on AlgebraicTopology (§8.11a, §4.7); the README at this head states neither, 5.4 owning the dimension bound and the nerve realization being unused.
