<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15109#issuecomment-6882945464 -->
Review (claude) of e6336f4

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Supplier contracts omit Tau Ceti declarations the layers consume

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:805` (2.3 *Needs:*): "`TauCeti.groupCohomology.map_subtype_id_comp_corestriction`, `TauCeti.groupHomology.transfer`."; and `:1691` (8.3 *Needs:*): "Tau Ceti's Schanuel lemma `TauCeti.exists_linearEquiv_comp_fst_eq_comp_snd_comp`".

   **Claim:** `## Exact supplier contracts` lists, per supplier, the declarations consumed. Two declarations named in *Needs:* lines, and five named only in Checks, have no bullet under "From Tau Ceti" (README lines 252–344).

   **Witness:** All seven exist at the Tau Ceti pin; none appears in README lines 180–452: `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:79` (`transfer`), `TauCeti/Algebra/Module/Projective/Schanuel.lean:82`.

   **Exact repair:** Add to "From Tau Ceti":

   - "`TauCeti.groupHomology.transfer M S n : Hₙ(G, M) ⟶ Hₙ(S, Res M)` for `[S.FiniteIndex]` (`TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean` line 79), with `TauCeti.groupHomology.transfer_comp_map_subtype_id` (line 121): transfer followed by corestriction is multiplication by `[G : S]`."
   - "`TauCeti.exists_linearEquiv_comp_fst_eq_comp_snd_comp` (`TauCeti/Algebra/Module/Projective/Schanuel.lean` line 82): Schanuel's lemma, for maps from two projective modules with the same range."
   - One bullet for the declarations used in Checks: `TauCeti.Huber.IsPseudoCoherentOver.of_isNoetherianRing` (`TauCeti/Algebra/Module/PseudoCoherent/Basic.lean` line 391), `TauCeti.groupHomologyPiMultiplicativeIntExteriorPowerEquiv` (`TauCeti/AlgebraicTopology/ClassifyingSpace/Torus.lean` line 243), `TauCeti.cwComplexProd` (`TauCeti/Topology/CWComplex/Classical/Product.lean` line 194), `TauCeti.nonempty_linearEquiv_of_projective_of_tensorRat_of_not_dvd` (`TauCeti/NumberTheory/Padics/GroupAlgebra/Rational.lean` line 134), `CategoryTheory.isGorensteinProjective_of_projective` (`TauCeti/Algebra/Homology/TotallyAcyclic/Abelian.lean` line 263).

   **Retest:** After the repair, every backticked `TauCeti.*`, `SSet.*`, `LinearMap.*`, `CochainComplex.*` and `CategoryTheory.*` name in the layers has a contract bullet (the mechanical comparison that produced the seven names returns none).

2. **F02** (P3) "names this roadmap" overstates what CohomologyOfGroups says

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:39`: "CohomologyOfGroups excludes them by name in its Scope and names this roadmap among its downstream consumers."

   **Claim:** CohomologyOfGroups is said to name this roadmap.

   **Witness:** `packages/CohomologyOfGroups/design/README.md:2126`: "a roadmap on finiteness conditions and duality groups (cohomological dimension, Euler characteristics, Farrell cohomology) consumes products and cap products". The string `FinitenessAndDualityOfGroups` occurs nowhere in that file. The exclusion at its lines 74–75 is as described.

   **Exact repair:** Replace the sentence by: "CohomologyOfGroups excludes them by name in its Scope and describes a roadmap on finiteness conditions and duality groups among its downstream consumers."

   **Retest:** The repaired sentence matches both passages (lines 74–75 and 2126–2128 of the CohomologyOfGroups design).

Two findings, both P3 and neither blocking (no P1 or P2): each is a repair to the README text, so the verdict asks for changes. The declared supplier gap `gap:simplicial-replacement-dimension` (AlgebraicTopology §8.11a) is precise, minimal and declared in both files; it is not a finding. This is a design: there is no `Suggested.lean`, and elaboration is not available (this lane does not elaborate), so no Lean build is claimed.

## Verified sound

### Previous finding (round 7), checked first

| Finding | Repaired passage, quoted | My retest | Status |
|---|---|---|---|
| F01 (P2): "a path-connected CW complex without `1`-cells is a point" | README 1118–1121: "a CW complex with no cells of positive dimension is discrete, so a nonempty path-connected one has exactly one `0`-cell and is a point with trivial fundamental group; conversely the point is a `K(1, 1)`." New Check at 1131–1135; plan test `no_one_cells_not_point` in target 5.1; `TauCeti.IsAspherical` added to the 5.1 *Needs:* and plan prerequisites. | `S²` with cells `(1, 0, 1)` has a 2-cell, so it fails the new premise; two points fail path-connectedness; the point gives `gd 1 = 0`. Pins: `IsAspherical X x := PathConnectedSpace X ∧ ∀ n, Subsingleton (π_(n+2) X x)` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59`), `IsEilenbergMacLaneSpaceOne` (`:123`), `PathConnectedSpace.nonempty` (`Mathlib/Topology/Connected/PathConnected.lean:579`), `RelCWComplex.closedCell_zero_eq_singleton` (`Mathlib/Topology/CWComplex/Classical/Basic.lean:392`). | repaired |

The repair report marks nothing "not actionable". The diff between the round-7 and round-8 heads touches only that bullet, the new Check, the *Needs:* item and the two plan entries; `sources.toml` is unchanged. The repaired pattern (a conclusion drawn from a missing cell dimension, or from a hypothesis weaker than the one used) was searched in Layers 1, 5 and 6: 1.4(c) uses cells of dimension `≤ 2` only for degrees `≤ 2`; 5.3 uses the `(n − 1)`-skeleton with `n − 1 ≥ 2` for `π₁`; 5.2's Check on finite groups goes through `cd_ℤ = ⊤`. No further occurrence.

No maintainer notes were supplied.

### Adversarial pass

Values below are my own computations this round. Notation: `C_m` cyclic of order `m`, `F_r` free of rank `r`, `K` the Klein bottle group, `A = C₄ ∗_{C₂} C₆`.

| Statement | Instances tried and values computed on each side | Result |
|---|---|---|
| 5.1 `gd G = 0 ↔ G = 1` (changed text) | Point: one 0-cell, `π₁ = 1`, so `gd 1 = 0`. `S² = e⁰ ∪ e²`: zero 1-cells, `H₂ = ℤ ≠ 0`, excluded by "no cells of positive dimension". Two points: dimension 0, `π₀` of size 2, not `PathConnectedSpace`. `G = ℤ`: circle gives `gd ≤ 1`, and a 0-dimensional model would force `π₁ = 1 ≠ ℤ`. | sound |
| 1.5 finiteness criterion (headline, sampled) | `G = ℚ`, `R ≠ 0`, `n = 1`: `(R[ℚ/(1/i!)ℤ])^ℚ = 0`, `(colim)^ℚ = R`, so (b) fails at `k = 0`. In (e): `(1 − [1/j!])_j` lies in `I·∏Rℚ` only if all `1/j!` lie in one finitely generated, hence cyclic, subgroup; they do not. `n = 0`: (b) is injectivity on invariants, (e) surjectivity onto `∏ R`; both hold for every group. `R = 0`: all maps `0 → 0`. Brown's (v) and Bieri–Eckmann's Tor-vanishing agree because `Hₖ(G, RG) = 0` for `k ≥ 1`. | sound |
| 1.6 finite index (sampled) | `ℤ ≤ C₂ × ℤ`, index 2: both `FP_∞` over `ℤ`; `FP` holds for `ℤ` only (`cd_ℤ(C₂ × ℤ) = ⊤`); over `ℚ`, `cd_ℚ ≤ 1` and `FP_∞` give `FP`. Normal closure of `b` in `F(a, b)`: abelianization `ℤ^{(ℤ)}`, not `FP_1` for `R ≠ 0`, while `F₂` is `FL` with ranks `(1, 2)`. | sound |
| 2.1 dimensions (sampled) | `1`: `(cd, hd) = (0, 0)`. `ℤ`, `R ≠ 0`: `H¹ = H₁ = R`, resolution length 1, so `(1, 1)`. `C₂/ℤ`: `H^{2k} = ℤ/2` for all `k ≥ 1`, so `⊤`. `R = 0`: `(0, 0)` for every group. | sound |
| 2.2 `hd` against `cd`, type `FP` (sampled) | (b): if `cd = m > n`, `Hᵐ` is right exact, so a free cover gives `Hᵐ(G, F) ↠ Hᵐ(G, M)`, contradiction. `ℤ²`, `R ≠ 0`: `H²(ℤ², Rℤ²) = R`, other degrees 0, `cd = hd = 2`. `ℚ/ℤ`: `hd = 1 < cd = 2` (not `FP`). `C₂/ℤ`: `Hᵏ(C₂, ℤC₂) = 0` for `k > 0` but `cd = ⊤`, so `cd < ⊤` in (b) is needed. `G = 1`, `R = 0`: no degree with nonzero free cohomology; (d) correctly assumes `R ≠ 0`. | sound |
| 2.4 extensions (sampled) | `ℤ²`: `2 ≤ 1 + 1`. `K/𝔽₂`: HNN map `1 − (−1) = 2 = 0`, so `H²(K, 𝔽₂) = 𝔽₂`, `cd = 2 ≤ 2`. `C₂ × ℤ/ℤ`: bound `⊤ + 1 = ⊤`, true value `⊤`. | sound |
| 3.2 Serre (headline) | `ℤ² ≤ K` index 2: `2 = 2`. `dℤ ≤ ℤ`: `1 = 1`. `ℤ ≤ C₂ × ℤ`: `1 ≠ ⊤`, excluded by torsion. 3.1 Checks recomputed: `d(x ⊗ x) = y ⊗ x − x ⊗ y`; signed swap commutes with `d`, unsigned differs by `2(y ⊗ x − x ⊗ y)`; the equivariant contraction `h(a) = −(x ⊗ x)/2`, `h(b) = (x ⊗ x)/2`, `h(y ⊗ y) = (a + b)/2` satisfies `dh + hd = id` in degrees 0, 1, 2 and exists only when 2 is a unit. | sound |
| 4.1 `vcd` (sampled) | Finite `G`: `H = 1`, `vcd = 0`; conversely `cd_ℤ H = 0` forces `H = 1`. `C₂ × ℤⁿ`: `n` against `cd_ℤ = ⊤`. `A → C₁₂` by `×3`, `×2`: both send the amalgamated involution to 6, image contains 3 and 2, so onto; kernel free of index 12. `⊕_ℕ C₂`: every finite-index subgroup is infinite torsion, `vcd = ⊤`. | sound |
| 5.3 Eilenberg–Ganea (headline) | `ℤ³`: `gd ≤ max(3, 3) = 3`. `ℤ²`: bound 3, true value 2, not claimed sharp. `C₂`: `⊤ ≤ ⊤`. Route: kernel of `∂_{n−1}` is the `n`-th syzygy, projective when `cd ≤ n`; `n − 1 ≥ 2` keeps `π₁`. | sound |
| 6.1 duality groups (sampled) | `ℤ`, `e = [t]`: `H¹ → H₀` is `x ↦ x(t)`, bijective. Finite `G`, `|G|` a unit: `M^G → M_G` has inverse `[m] ↦ |G|⁻¹ Σ g·m`. `k > n` handled by the vanishing clause, not by `n − k` in `ℕ`. `R = 0`: every group, every `n`, stated. | sound |
| 6.3 criterion (headline) | `ℤⁿ`: `FL`, `Hᵏ(ℤⁿ, Rℤⁿ) = R` at `k = n`, 0 elsewhere, `R` flat. `ℤ ∗ ℤ²`: `cd = 2`, `H⁰(ℤ, ℤG) = H⁰(ℤ², ℤG) = 0` so `ℤG = H⁰(1, ℤG) ↪ H¹`, fails. `C₂/ℤ`: not `FP`. `R = 0`: both sides hold for every `n`. Flatness: `Tor^R_i(D, N) = H^{n−i}(G, RG ⊗_R N) = 0` for `i > 0` because `D ⊗ RG ⊗ N` is induced. | sound |
| 6.4 Poincaré duality (sampled) | `K/ℤ`: `w(t) = −1`, `H²(K, ℤ) = H₀(K, ℤ_w) = ℤ/2`; orientable model would give `ℤ`. Over `𝔽₂`, `−1 = 1`. `F_r`, `r ≥ 2`, `R ≠ 0`: `D ⊗ k` infinite-dimensional over a residue field `k`, not rank one. (b) restates BieriEckmann1974 Theorem 3.4 with `k < 0` replaced by `Hⱼ = 0` for `j > n`. | sound |
| 6.5 inheritance (sampled) | `(g·f)(p) = g f(g⁻¹p) g⁻¹` is `f·g⁻¹` for the source's right action `(f x)(p) = x⁻¹ f(xp) x` (BieriEckmann1973 line 250). `K`: `(t·d)(a) = t d(a⁻¹) t⁻¹ = −t a⁻¹ t⁻¹ = −a`, augmentation `−1`. `1 ≤ C₂/ℚ`: `H₀` transfer is `×2`, a unit. `dℤ ≤ ℤ`: transfer sends `t ↦ t^d`, a generator. Over `R`: `(u − 1)D_N = 0` kills `Hₙ(N, D_N) ≅ R`, so `u = 1`. | sound |
| 7.5 `Hom` from projectives (sampled) | `Γ` finite, `Γ' = 1`, `P = ℤΓ`, `V = K`: `K^Γ ≅ KΓ`, rank `1 = r(ℤΓ)·1`. `Γ = Γ' = ℤ`, `V = K_λ`: `Hom_{ℤΓ}(ℤΓ, V) = V`, dimension 1 for all `λ`. `P = ℤ` (not projective), `λ ≠ 1`: `V^Γ = 0 ≠ 1`. Finite generation of `Γ` is Brown's hypothesis (Brown1974 line 1284) and is used in Lemma 2. | sound |
| 8.3 `χ_ℚ` and `χ̃` (sampled) | `ℤ`: `1 − 1 = 0`. `F_r`: `1 − r`. `ℤⁿ`: `Σ(−1)ᵏ C(n, k) = 0`. `C₂`: `χ_ℚ = 1`, `χ = 1/2`, no `χ̃` (`cd_ℤ = ⊤`). `ℚ`: `(1, 1)`, `χ_ℚ = 0` without `FP_1`. | sound |
| 8.4 `χ` (headline) | `C₂`: `χ_ℚ(1)/2 = 1/2`. `A`: kernel free of rank 2, `χ = (1 − 2)/12 = −1/12`. Index `d` subgroup multiplies numerator and denominator by `d`. `[G : H] ≥ 1` under `FiniteIndex`, so no `0/0`. | sound |
| 8.6 extensions (headline) | `F₂ × F₃`: `E₂` dimensions `1, 3; 2, 6`, totals `(1, 5, 6)`, `1 − 5 + 6 = 2 = (−1)(−2)`. `C₂ × ℤ`: `(1/2)·0 = 0`. `[G : Γ] = [G/N : Q]·[N : Γ ∩ N]` holds for `Q` the image of `Γ`. | sound |
| 8.7 equivariant formula (headline, sampled) | `A`: `1/4 + 1/6 − 1/2 = −1/12`; reversed edge sign gives `11/12`. `C₂ ∗ C₃`: `1/2 + 1/3 − 1 = −1/6`. `F_r` on its tree: `1 − r`. Double-coset count: `[G : Γ'G_σ]·[G_σ : G_σ ∩ Γ'] = [G : Γ']`, so the restricted sum is `[G : Γ']` times the stated one. Sign twist: `χ(ker ε) = 2χ(T)` gives `χ(T; ℚ_ε) = χ(T)`. | sound |
| 8.9 denominators (headline, sampled) | `A`: orders `{1, 2, 3, 4, 6}`, `m = 12`, `12·(−1/12) = −1`; maximum order 6 gives `−1/2`. `C₂ ∗ C₃`: `6·(−1/6) = −1`. Finite `G`: `|G|·(1/|G|) = 1`. Orbit size `|Q|/h = (|Q|/m)(m/h)`, so `d = |Q|/m` divides it. In 8.8(d): `v_p(|P ∩ G_σ|) ≤ v_p(|G_σ|) ≤ v_p(|G|) − e`, so `P`-orbits have size divisible by `p^e`. | sound |
| 9.2 complete resolutions (sampled) | `C₂/ℤ`: `(1 − s)(1 + s) = 0`, kernels equal images in both directions. `G = 1`: `R` projective, contractible. Restriction to finite index: `Hom_{RH'}(Res F, Q) = Hom_{RG}(F, Coind Q)` with `Coind Q = Ind Q` projective. | sound |
| 9.3 Farrell cohomology (sampled) | `C₂`, `M = ℤ`: cochain maps alternate `0, 2`; `(Ĥ⁻¹, Ĥ⁰, Ĥ¹, Ĥ²) = (0, ℤ/2, 0, ℤ/2)`; a shift by one gives `Ĥ⁰ = 0`. `M = RG`: 0. `G = ℤ`: 0. | sound |
| 9.4 comparison (headline) | `C₂`, `n = 0`: `ℤ → ℤ/2` onto, kernel `2ℤ`. `C₂ × ℤ`: `0 → H^{k−1}(C₂) → Hᵏ(G) → Hᵏ(C₂) → 0`, one outer term `ℤ/2`, so `ℤ/2` for `k ≥ 2`. `A`, even `k`: kernel of `ℤ/4 ⊕ ℤ/6 → ℤ/2` has order 12 and contains `(1, 1)` of order 12; odd `k`: 0. (b): `Ĥⁿ(G, Ω) = 0` makes `Ω` a summand of `F_{n−1}`. | sound |

The remaining targets (1.1–1.4, 1.7, 1.8, 2.3, 2.5–2.8, 3.1, 4.2–4.4, 5.2, 5.4, 6.2, 6.6, 7.1–7.4, 8.1, 8.2, 8.5, 8.8, 9.1, 9.5) were read in full and their Checks recomputed where they carry numbers; I found no disagreement with the round-7 table's computed rows, on which I otherwise rely as the brief allows. Recomputed in particular: 1.1(c) at `n = 1` against (b); 2.5 (`Ext¹_ℤ(ℚ, ℤ) ≠ 0` by countability); 6.2 (the dual differential `a ↦ ((s_i − 1)a)_i`); 7.2 (`r_P([g]) = 1/|C_G(g)|` for the trivial summand); 8.8 Floyd relation `0 + 1·2 = 2·1` on the reflected 4-cycle.

### Sources: the seeded sample

No locator is flagged by the author as unverified. Six texts were read from the cache; none was fetched; the manifest is unchanged.

| Target | Locator checked | Result |
|---|---|---|
| 1.5 | Brown1975 Theorem 2, lines 83–101; Theorem 3, lines 189–194; proof lines 147–157. BieriEckmann1974 Lemma 1.1 and Proposition 1.2, lines 95–137 | Conditions and degree bounds match (iso below `k`, mono/epi at `k`). |
| 1.6 | BrownGTM87 §VIII.5 | Not read (settled uncertified). Mathematics checked through `TauCeti.Huber.isPseudoCoherentOver_restrictScalars_iff` at the pin. |
| 2.1 | Serre1971Bourbaki lines 40–42; Brown1974 lines 345–348; BieriEckmann1973 line 155 | Match. |
| 2.2 | BieriEckmann1973 Proposition 2.1, lines 280–286; Theorem 4.2, lines 566–602; Corollary 4.3, lines 604–607; lines 615–621 | Match. The source's (FP − n) is weaker than the type `FP` assumed here. |
| 2.4 | BieriEckmann1973 lines 479–480; BieriEckmann1974 Proposition 3.3(a), lines 298–313 | Match. |
| 4.1 | Serre1971Bourbaki lines 77–86; Brown1974 lines 352–358 | Match. |
| 6.1 | BieriEckmann1973 Definition 1.1, lines 116–121; conventions lines 122–135; Brown1975 lines 195–199 | Match; the README's vanishing clause for `k > n` is stated as its own replacement of the source's convention. |
| 6.4 | BieriEckmann1974 lines 253–257, 261–266, 314–323; Theorem 3.4, lines 327–334; BieriEckmann1973 Theorem 4.6, lines 624–643 | Match. |
| 6.5 | BieriEckmann1973 Theorem 3.2, lines 366–386; Theorem 3.3, lines 388–465; §1.5, lines 238–253; Proposition 1.8, lines 255–272; Theorem 3.5 and remark, lines 468–516 | Match, with the left action the inverse of the source's right action. |
| 7.5 | Brown1974 Theorem 7 with Lemmas 1–2 and proof, lines 1284–1355 | Match, including finite generation of `Γ` and the three cases. |
| 8.3 | Brown1974 lines 386–387, 82–83, 402–410 | Match. |
| 8.7 | Brown1974 lines 464–479; Proposition 2(i), line 509; Proposition 4, lines 558–582 | Match; the monomial-complex form with sign characters is the README's own generalization, with its route. |
| 8.9 | Brown1974 Theorem 5 and Corollary 1, lines 603–610; lines 611–614; Lemma and proof, lines 637–660 | Match. |
| 9.2, 9.3 | Farrell1977; BrownGTM87 §X.2–X.3 | Not read (settled uncertified). Mathematics checked against the pinned `CompleteResolution` API. |

Also read while checking: Brown1974 §1 (lines 125–185) for 8.1, 8.2, 8.8(c); §3 definition and Proposition 1 (lines 359–384) for 4.4; Theorems 3–4 and Corollaries (lines 388–463) for 8.4–8.6; BieriEckmann1973 Propositions 1.2, 1.6, Lemma 1.3, Theorems 2.3, 4.5 for 6.2–6.3. All agree with the README. All 11 cited works have manifest entries.

### Pinned libraries

Pins confirmed in `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. Opened this round, all at the cited file and line unless noted:

- Tau Ceti: `IsAspherical` (`AlgebraicTopology/EilenbergMacLane/Basic.lean:59`), `IsEilenbergMacLaneSpaceOne` (`:123`), `cellularResolutionOfIsAspherical` (`EilenbergMacLane/Resolution.lean:57`), `cellularChainRepIsoFree` (`AlgebraicTopology/Cellular/Covering.lean:252`), `cellularClassifyingSpaceResolution`, `PresentationComplex.cellOneEquiv`/`cellTwoEquiv` (`:304`, `:317`), `cellAttachment` (`Topology/CWComplex/Abstract/CellAttachment.lean:52`), `HomotopyGroup.bijective_hurewicz` (`Hurewicz/Absolute.lean:161`), `contractibleSpace_of_subsingleton_homotopyGroup` (`Whitehead.lean:356`), `IsPseudoCoherentOver.zero_iff`/`one_iff`/`top_iff`/`prod`/`pi`/`ker_of_projective`/`succ_iff_ker` (`PseudoCoherent/Basic.lean:133`–`375`), `.extension`/`.cokernel`/`.kernel` (`TwoOutOfThree.lean:109`, `125`, `143`), `isPseudoCoherentOver_restrictScalars_iff` (`RestrictScalars.lean:155`), `isFPD_iff_hasProjectiveDimensionLE` (`:153`), `leastENatBound` (`Data/ENat/LeastBound.lean:39`), `cohomologicalDimension` (`:156`), `isTotallyAcyclicProjective_splice` (`Abelian/Extension.lean:63`), `exactStructure_isFrobenius` (`Abelian/Frobenius.lean:195`), `CompleteResolution.lift`/`nonempty_homotopy_zero_iff`/`homotopyEquiv` (`Comparison.lean:182`, `458`, `481`), `map_subtype_id_comp_corestriction` (`:165`), `trace_ofModule'_eq_zero_of_dvd_orderOf` (`:67`), `projectiveTrace` and its three lemmas (`:72`, `96`, `118`), Swan (`Swan.lean:58`), `FDRep.nonempty_iso_of_character_eq` (`:59`), `UniversalCover.isCoveringMap` (`:58`), `SSet.eilenbergZilberHomotopyEquiv` (`SimplicialSet/EilenbergZilber.lean:761`), `tensorInducedRepresentation` (`:265`), `wreathTensor` (`:74`), `isEilenbergMacLaneSpaceOne_circle` (`:105`).
- Mathlib: `PathConnectedSpace` (`:577`), `SSet.normalizedChainComplex` and companions (`Homology/Nondegenerate.lean:43`, `86`, `182`, `200`, `252`), `SSet.hasDimensionLE_prod` (`FiniteProd.lean:66`), `IsCoveringMap.existsUnique_continuousMap_lifts` (`Lifting.lean:489`), `Submodule.eq_bot_of_le_smul_of_le_jacobson` (`Nakayama.lean:117`), `isMulTorsionFree_iff_not_isOfFinOrder` (`:911`), `groupCohomologyIsoEven` (`FiniteCyclic.lean:80`), `ChartedSpace.secondCountable_of_sigmaCompact` (`:236`).

Duplication by object: neither pin has a finiteness type of groups, a discrete `cd`/`hd`/`vcd`, geometric dimension, duality or Poincaré duality groups, a Hattori–Stallings rank, an Euler characteristic of groups, or Farrell cohomology (searched by those objects; the only "Farrell" hits are unrelated topology files). `TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean` proves only the surjective half of the directed-union comparison and says so; the full colimit statement is SchemeKTheoryOperations §6.7, as cited.

### Suppliers and ownership

Dependency check, as prescribed:

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2201 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Citations resolved this round:

| Supplier | Where | Sections found |
|---|---|---|
| CohomologyOfGroups (merge order, accepted board design) | `packages/CohomologyOfGroups/design/README.md` | §1.2 (620), §1.4 (663), §1.5 (687), §2.3 (800), §3.2 (900), §3.4 (959), §3.5 (978), §3.6 (1007), §4.6 (1172; `tr(y ∩ z) = res y ∩ tr z` at 1188), §5.2 (1339), §6.1–6.3 (1484, 1529, 1569) |
| SpectralSequencesAndConvergence (open, new roadmap, earlier in order) | its README at head | §2.1 (565), §3.4 (806), §5.3 (1341) |
| SchemeKTheoryOperations (open, new roadmap, earlier in order) | its README at head | §6.7 (2511); the directed-union colimit statement at 2583, over any commutative ring |
| FreeGroupsAndLimitGroups (main) | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md` | §4.5 (863), §4.7 (906), §4.8 (937), §4.9 (950) |
| EtaleCohomologyFoundations (main) | its README | §F.10.3 (1295); Hattori–Stallings trace for right modules over every ring (1322) |
| ClassifyingSpaces (main) | its README | Stage 2 item 10 (173), Stage 4 items 16, 17 (224, 238) |
| AlgebraicTopology (main) | its README | §4.7 (1739), §6.3 (2491), §6.4 (2873), §8.1 (3219), §8.3 (3334), §8.5 (3413), §8.7 (3618), §8.11a (3971) |
| ProfiniteCohomology (main) | its README | Layer 11 (2919) |

Scope-only citations: ArithmeticKTheory §3.2 (heading 1071; the duality statement at 1165 lies in it), FuchsianOrbifolds Layer 5 item 6 (740; `−1/6` at 757), BianchiModularForms §9.3 (2243), MotivicStructuresInModuliOfCurves §2.1 (board package, line 337; a consumer, later in the order). The five leads of the citation resolver are thus either resolved (CohomologyOfGroups, MotivicStructuresInModuliOfCurves are board packages) or source keys misread as roadmap names.

The declared gap `simplicial-replacement-dimension` has the same slug in `plan.json` and README line 449, names AlgebraicTopology §8.11a, and is precise and minimal: §8.11a (lines 3979–3982) states the replacement with no dimension bound. It is the only gap; 5.4 is its only user.

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped or revision-only id, and no second copy; main has no `FinitenessAndDualityOfGroups` folder.

Overlap check: read ClassifyingSpaces (main), AlgebraicTopology (main), FreeGroupsAndLimitGroups (main) and SpectralSequencesAndConvergence with its Part II scope; shared objects and owners: `K(G, 1)` complexes and cellular resolutions — ClassifyingSpaces; CW, Hurewicz, Whitehead, manifold duality — AlgebraicTopology; Bass–Serre trees — FreeGroupsAndLimitGroups; Euler identity of a spectral sequence — SpectralSequencesAndConvergence. Each is cited here, none restated. The revisions of ClassifyingSpaces and AlgebraicTopology in the two open loop-cutting pull requests were not re-read this round; the overlap tool reports no dropped id against them.

### Shape, headlines, policy

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers each ending in Examples and Dependencies, Downstream consumers, References. `plan.json` has 51 targets (12 definitions, 38 theorems, 1 construction); every definition has an API and at least three tests; every target has a locator and prerequisites.
- Organisation: layers are named by their mathematics; none is named after a source chapter, and the README nowhere says it follows a source.
- Headlines: 1.5, 3.2, 5.3, 6.3, 8.4, 8.6, 8.7, 8.9, 9.4; all are in the table above. There is no `Suggested.lean` at this stage, so the one-tactic probe, the `#check` comparison and the import check have nothing to run on.
- Policy: no pull-request numbers, dates, round labels, machine paths, LaTeX delimiters, `lemma`, or "optional/deferred" wording (searched). No algorithm.

### Copyright and arrangement

Source keys in the README before References: Brown1974 35, BieriEckmann1973 28, BrownGTM87 22, BieriEckmann1974 13, Brown1975 8, Serre1971Bourbaki 7, Serre1971Prospects 6, Farrell1977 5, Floyd1952 3, EilenbergGanea1957 1, Wall1961 1 (129).

Contents of Brown1974 (lines 36–57) against the layers: §1 ↔ 8.1–8.2 and 8.8(c); §2 ↔ 8.8(d); §3 ↔ parts of 1.2, 2.1, 4.1, 4.4; §4 ↔ 8.3–8.6; §5 ↔ 8.7; §6 ↔ 8.9 and 5.4; Appendix A ↔ 7.3–7.5. No layer maps onto one section, and the source's §3 is spread over three layers. Inside Layer 8 the order 8.1 → 8.2 → 8.4 → 8.5 → 8.6 and 8.8 → 8.9 is forced by the *Needs:* lines (8.2 needs 8.1; 8.4 needs 8.2, 8.3; 8.5 needs 8.4; 8.6 needs 8.4, 8.5; 8.9 needs 8.8, 8.4, 5.4).

Wording: 23 passages set beside the texts (the 12 readable sampled targets, and 1.1, 1.2, 4.4, 5.4, 6.2, 6.3, 8.1, 8.2, 8.4, 8.5, 8.6). The longest shared run is 13 words in the statement of 8.9 ("the least common multiple of the orders of the finite subgroups of"), which the mathematics forces; no sentence, list or proof plan is reproduced or translated. No table, figure or exercise list is taken over.

Source independence: 23 passages compared with 5 sources (Brown1974, Brown1975, BieriEckmann1973, BieriEckmann1974, Serre1971Bourbaki), none shared beyond forced statements; largest share Brown1974, 35 of 129 locators; contents compared with Brown1974: independent. BrownGTM87 (22 locators) and the four other uncertified texts could not be read; Floyd1952 was not re-read this round.

## Not verifiable

- BrownGTM87 (settled uncertified): §§III.10, VI.3, VIII.2, VIII.3, VIII.5, VIII.6, VIII.7, VIII.11, IX.2, X.2, X.3 not checked against the text; includes the sampled 1.6, 9.2, 9.3.
- Farrell1977, EilenbergGanea1957, Wall1961, Serre1971Prospects (settled uncertified): locators not checked against the texts.
- OCR damage in Brown1974 lines 349–351, 360, 412 and Brown1975 lines 184–186: the damaged symbols were not relied on.
- `Suggested.lean` does not exist at the design stage; this lane does not elaborate. Every computation above is by hand, not Lean output.
- Ownership against the two open pull requests that revise ClassifyingSpaces and AlgebraicTopology was checked only through the overlap tool's output, not by re-reading their heads.

## Source issues

- **Misprint** in BieriEckmann1974 at proof of Theorem 3.4, printed p. 82: the source says the conclusion follows from reference [2], Theorem 4.6 (finite generation); it should be reference [2], Theorem 4.5 (the duality criterion); affects the proof.
- **Misprint** in BieriEckmann1974 at the Remark after Theorem 3.4, printed p. 82: the source says the result and "Theorem 4.3" do not imply each other; it should be Theorem 3.4, the paper having no Section 4; affects nothing.

## For the human reviewers

- **Not tested.** BrownGTM87 carries 22 of 129 locators and its text and contents were not available (`sources.toml`, status uncertified); wording and arrangement were tested against Brown1974, the largest share, not against it.
- **Licence.** Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects are recorded as uncertified with licence class `none` in `sources.toml`; they are cited by locator only and were not read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e6336f4c3cdd113aff47f96c806b77a65cefb3d4", "job": "REV-DESIGN-FinitenessAndDualityOfGroups~8", "model": "fable", "worker": "chris-x29"} -->
