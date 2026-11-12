<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12941#issuecomment-6780522273 -->
Review (claude) of 182d8ab

Verdict: needs_changes

1. **F01** (P2) 7.3's route uses a framed deformation ring of `G_{K∞}` that no supplier constructs

   **Location.** `packages/LocalGaloisDeformationRingsPartII/README.md` line 691 (7.3, route): "the common étale module gives a map from the framed deformation ring of `ρ̄|_{G_{K∞}}` to the chart … makes the framed deformation ring of `ρ̄` a quotient of that of `ρ̄|_{G_{K∞}}`".

   **Claim.** A framed deformation ring of `ρ̄|_{G_{K∞}}` is available as an input of the route.

   **Witness.** PadicLocalLanglandsForGL2Qp §0.4 (its line 294) and LocalGaloisDeformationRings §1.1 (its line 1278) represent the framed functor only under Mazur's `Φ_p`. `G_{K∞} ≅ G_{k((v))}` fails it: `Hom(G_{𝔽_p((v))}, 𝔽_p) ≅ 𝔽_p((v))/℘` contains the independent classes of `v^{−m}`, `p ∤ m`. The 7.3 *Needs:* line names no owner.

   **Repair.** Add to 3.8, after the cocycle statement:

   > For a profinite group `Γ` and continuous `ρ̄ : Γ → GL_n(𝔽)` put `R□_{ρ̄,Γ} = lim_H R□_{ρ̄,Γ/H}` over the open normal subgroups `H ⊆ ker ρ̄`, each term the framed ring of the finite group `Γ/H` (`PadicLocalLanglandsForGL2Qp` §0.4). Prove that it is a profinite local `𝒪`-algebra pro-representing the framed deformation functor of `ρ̄` on Artinian local `𝒪`-algebras with residue field `𝔽`, with continuous tangent space `Z¹(Γ, ad ρ̄)`; that it is `R□_ρ̄` when `Γ` satisfies `Φ_p`; and that a continuous local `𝒪`-homomorphism from it to a complete Noetherian local `𝒪`-algebra with residue field `𝔽` that is injective on `𝔽[ε]`-points is surjective.

   Give it three Checks: `Γ` finite recovers the §0.4 ring; `Γ = G_K` gives `R□_ρ̄`; `Γ = G_{ℚ_p,∞}`, `n = 1`, `ρ̄ = 1` has infinite-dimensional tangent space, so the ring is not Noetherian. In 7.3 write "the pro-representing ring `R□_{ρ̄,G_{K∞}}` of 3.8 (not Noetherian)" at both places and add `PadicLocalLanglandsForGL2Qp` §0.4 to its *Needs:*.

   Tested on the refuting instance: for `G_{ℚ_p,∞}` the limit exists, since every finite quotient satisfies `Φ_p`, and the repaired text does not assert that it is Noetherian. The surjectivity criterion is what Claim 1 of the source uses (BHHMS23 line 1826): the image is compact, hence closed, and contains generators of `𝔪/(𝔪² + ϖ)` of the Noetherian target.

2. **F02** (P2) the supplier ModpRepresentationsOfGL2OverLocalFields is cited by ids its package does not carry

   **Location.** README lines 17, 80, 81, 99, 113, 141, 151, 166, 304, 414, 422, 446, 460, 562, for example line 80: "MP.3, *weight-coordinates*: regular weights, depth and the central twist. MP.3, *translation-map* … MP.3, *tame-weight-set* … MP.5, *projective-adjoint*"; and the `section` field `MP.3, translation-map` of `gap:deligne-lusztig-reduction` in `design/plan.json`.

   **Claim.** These ids are sections of the supplier.

   **Witness.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md` has no string `MP.` and no old → new table. Its headings are "### 3.1 Regular weights and depth" (line 938), "### 3.2 The extension-graph coordinate map" (963), "### 3.4 Tame Galois weights" (1008) and "### 5.5 Adjoint tensor and finite projective weight structure" (1373). The `MP.` ids survive only in its `design/README.md`.

   **Repair.** Replace throughout:

   | Cited now | Cite instead |
   | --- | --- |
   | MP.3, *weight-coordinates* | `ModpRepresentationsOfGL2OverLocalFields` §3.1 |
   | MP.3, *translation-map* | §3.2 |
   | MP.3, *tame-weight-set* | §3.4 |
   | MP.5, *projective-adjoint* | §5.5 |
   | bare "MP.3" / "MP.5" (lines 17, 113, 166, 414, 460) | "§§3.1–3.4" / "§5.5" |

   Set the gap's `section` in `plan.json` to `§3.2`. I checked that the content is unchanged at the new places: §3.1 defines depth by `N < r_i + 1 < p − N`, as the Conventions do; §3.2 has `t_λ`, `Λ_W^λ`, `Σ` and adjacency; §3.4 has `τ(s,ν)` with no `η` and `W(ρ̄) = {F(t_{μ−η}(sω))}`; §5.5 has `A_i ⊗ F(λ)` for 2-deep `λ` and the `2^f` pairwise nonisomorphic constituents of `P̃_σ[1/p]` for 3-deep `σ`.

3. **F03** (P3) four backticked supplier names exist nowhere

   **Location.** README line 85: "§1.9 (`relativeCotangent`, `seriesPresentation_surjective`), §1.12 (`coeffCompletedTensor`, its joint presentation …), … §1.14 (`quotientCompletionComparison`)"; line 99 (0.1, *Needs:*): "`PadicLocalLanglandsForGL2Qp` §0.3 (`fundamentalCharacter`, Teichmüller lift)".

   **Claim.** These are declarations of the cited sections.

   **Witness.** `roadmaps grep --fixed` finds `relativeCotangent`, `coeffCompletedTensor` and `quotientCompletionComparison` nowhere on main or at any open head. DeformationAndDerivedPatchingAlgebra §§1.9, 1.12, 1.14 (its lines 235, 284, 327) describe the objects in prose. PadicLocalLanglandsForGL2Qp names `fundamentalCharacter` only at its line 2434, attributing it to ArithmeticGaloisRepresentations §2.3.

   **Repair.** Line 85: "§1.9 (the relative cotangent space `𝔪_B/(𝔪_B² + 𝔪_A B)` and `seriesPresentation_surjective`), §1.12 (the complete-local tensor product and its joint presentation …), … §1.14 (the quotient-completion comparison `Â/JÂ ≅ (A/J)^`)". Line 99: "§0.3 (fundamental characters, Teichmüller lift)". `seriesPresentation_surjective` and `flatCompletion_finiteComparison` do exist there (its lines 237, 307) and stay.

4. **F04** (P3) 5.3 attributes to the source an equivalence it does not state

   **Location.** README line 527 (5.3): "The source states the last assertion as an equivalence; only the stated direction holds (see the Checks)."

   **Claim.** BHHMS23, Lemma 3.3.1 asserts "distinct if and only if `f₁ ≢ f₂`".

   **Witness.** `BHHMS23 line 1122` reads "distinct iff1̸≡ f2", which is "if `f₁ ≢ f₂`" with the space lost, as in "Iff∈A×" for "If `f ∈ A^×`" at `BHHMS23 line 1121`. The proof (lines 1131–1134) derives `g₁ ≡ g₂` from equal ideals, which is that one direction. The string occurs nowhere else in the text, which writes "if and only if" in full on fifteen other lines.

   **Repair.** Delete the sentence. Reword the third Check of 5.3 to open "The converse of the residue test, which the source does not claim, fails: …". The statement of 5.3 is unchanged. The round-1 errata entry on this lemma is withdrawn under Source issues.

5. **F05** (P3) page slip for Definition 3.2.5

   **Location.** README line 333 (3.4): "(BHHMS23, Definition 3.2.5, pp. 22–23)".

   **Witness.** The definition and its justification are `BHHMS23 lines 1048–1052`; printed page 23 begins at line 1053.

   **Repair.** "(BHHMS23, Definition 3.2.5, p. 22)".

Five findings, two blocking (R01, R02). The mathematics of every statement I checked is right; the findings are an unowned object in one proof route, citations of a supplier by ids its package no longer carries, four supplier names that exist nowhere, one misreport of a source and one page slip. `Suggested.lean` needs no change.

## Round-1 findings

| Id | Status | Repaired passage (README line) |
| --- | --- | --- |
| F01 (P1), cyclotomic freeness of `ad(ρ̄)` unowned | repaired | 3.7, line 369: "if `ρ̄ : G_K → GL₂(𝔽)` is 2-generic (0.2), then `ad(ρ̄) = ρ̄^∨ ⊗ ρ̄` is cyclotomic free; hence `ρ₁^∨ ⊗ ρ₂` is cyclotomic free whenever `ρ₁` is 2-generic and `ρ₁^ss ≅ ρ₂^ss`", with the digit route; 3.8, line 388, adds injectivity on `Z¹`; 3.9, 5.7 and 7.3 list 3.7 in *Needs:* |
| F02 (P2), covariant functor cited for a contravariant statement | repaired | 3.3, line 316: "define its **contravariant realization** `V*_K(M) = Hom_{k((v)) ⊗ 𝔽, φ}(M, 𝒪̂_{ℰ^ur}/p ⊗_{𝔽_p} 𝔽)` … Prove that `V*_K(M) ≅ T_𝔽(M^∨)`", with the rank-one variance Check (line 329) |
| F03 (P3), supplier names the supplier does not declare | partly repaired | Lines 13, 57, 59, 60 and 72 now describe the objects by section. One occurrence remains (line 99) and the same pattern occurs at line 85: see R03 |
| F04 (P3), stale pin hashes | repaired | Lines 39 and 45: "### From Mathlib", "### From Tau Ceti" |
| F05 (P3), remark cited for a theorem | repaired | 0.4, line 141: "(LLHL19, Proposition 2.2.16, p. 14, stated for depth `d ≥ n`, i.e. `N ≥ 2` in rank two; …)"; LLHL19 is in References and the manifest |

## Verified sound

**Principles.** No route-specific shortcut: every statement keeps the full profile set `{(3,0),(2,1)}^f`, both the reducible and the irreducible `ρ̄`, and ramified `𝒪`. The base roadmap is imported by section and not re-planned. No copied passage: the chart equations are in the roadmap's own `u, d, a, x, t` notation. No algorithm, no sorried data, no `set_option`. Supply runs one way (dependency check below).

**Elaboration.** `lake env lean` on `packages/LocalGaloisDeformationRingsPartII/Suggested.lean`, from the content checkout: one message, `47:8: warning: declaration uses 'sorry'`. There is no `TauCeti.*` import. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`.

**Binder check.** The elaborated type of `crossing_prime` carries `CommRing O`, `IsDomain O`, `IsDiscreteValuationRing O`, `IsAdicComplete (IsLocalRing.maximalIdeal O) O`, `Irreducible ϖ`, `0 < d` and a unit `u` of `MvPowerSeries (Fin (n + 2)) O`. It concludes `Prime (X 0 * X 1 + C (ϖ ^ d) * ↑u)`. This is README 5.3's first assertion at the same generality. Nothing changed.

**Padding probe** (every sorried theorem, that is the one): on a scratch copy, `simp` and `aesop` leave the goal, `infer_instance` fails ("type class instance expected"), `rfl` fails, and `exact?` proposes only the sibling probe copy. It is not padding.

**Headlines.** The README's headlines are 6.1, 6.2, 6.3, 7.3, 7.5, the two classification results 3.6 and 3.9, the bijection 4.3, and 5.3. Only 5.3 is statable at the pins and it is stated. The module docstring names the others with the missing carriers: framed deformation rings of `G_K`, fixed-type quotients, `ψ`, `W(ρ̄)`, `σ(τ)`, and étale `φ`-modules with coefficients. The only backticked name of this roadmap's own in the README is `crossing_prime`, which the file declares.

**Dependency check** (the brief's command):

```text
depcheck: 236 roadmaps, 2138 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Merge-order positions: PadicLocalLanglandsForGL2Qp 33, FiniteFlatGroupsAndIntegralPadicHodgeTheory 66, DeformationAndDerivedPatchingAlgebra 79, LocalGaloisDeformationRings 87, ModpRepresentationsOfGL2OverLocalFields 264, this roadmap 353. LocalFieldsRamification (completed) and ClassFieldTheory are on main. HilbertModularVarietiesAndShimuraCurvesPartII (354) is cited only as a consumer.

**Pinned declarations** opened with `#check` in one scratch file at the pins, all present:

- `PowerSeries.exists_isWeierstrassFactorization` (`WeierstrassPreparation.lean:814`) and `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod` (`:561`).
- `IsRegularLocalRing` (`RegularLocalRing/Defs.lean:52`), `IsDiscreteValuationRing`, `IsAdicComplete`, `IsLocalRing.maximalIdeal`, `IsLocalRing.notMem_maximalIdeal`.
- `Ideal.span`, `Ideal.span_le`, `Ideal.minimalPrimes`, `Matrix.det_fin_two` (`Determinant/Basic.lean:815`), `Matrix.adjugate` (`Adjugate.lean:187`), `Polynomial.derivative`.
- `Field.absoluteGaloisGroup` (`AbsoluteGaloisGroup.lean:42`), `modularCyclotomicCharacter`, `LaurentSeries`, `MvPowerSeries.C`, `MvPowerSeries.X`.
- `TauCeti.inertiaTameCharacter` and `TauCeti.quotientWildInertiaSubgroupEquiv` (`TauCeti/NumberTheory/LocalField/Tame/Character.lean`).

Factoriality at the pins: Mathlib has `UniqueFactorizationMonoid R⟦X⟧` only for one variable over a principal ideal domain (`PowerSeries/Ideal.lean:203`). Tau Ceti has it for regular local rings of dimension at most two (`TauCeti/RingTheory/RegularLocalRing/UniqueFactorization.lean:59`). `𝒪⟦x₁,…,x_n⟧` with `n ≥ 2` has dimension at least three, so `gap:regular-local-factorial` asks for nothing the pins provide.

**Suppliers resolved now.**

- LocalGaloisDeformationRings: §§1.1, 1.2, 1.8, 3.1, 3.4, 3.5, 3.9, 3.10, 6.9, 6.28, 8.10 at its lines 1276, 1284, 1399, 2241, 2292, 2300, 2388, 2396, 3052, 3380, 3810; `heightLatticeFunctor`, `HodgeType`, `GaloisType` at 1292, 2249, 2250. §6.9 is rank three and names a contravariant `T*_dd`.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory: §§R07.4.1, .2, .5, .6, .24, .36, .39 at its lines 5483, 5559, 5684, 5715, 6528, 7307, 7412. §R07.4.5 defines the covariant `T(M) = (𝒪̂_{ℰ^ur} ⊗ M)^{φ=1}`, preserving `⊗` and duals, as 3.3 uses.
- DeformationAndDerivedPatchingAlgebra: §§1.8, 1.9, 1.11, 1.12, 1.13, 1.14, 3.2, 4.6, 4.7, 6.8 at its lines 213, 233, 262, 282, 305, 325, 573, 991, 1006, 1327.
- PadicLocalLanglandsForGL2Qp: §§0.3, 0.4, 4.4 at its lines 268, 292, 1473. §0.3 builds fundamental characters at every niveau from the Kummer character of a `(p^f−1)`-st root of a uniformiser.
- LocalFieldsRamification "Layer 4: the tame quotient of the absolute Galois group" (its line 1154) and ClassFieldTheory "Layer 7: the absolute local Artin map, its normalizations, and conductors" (its line 1204), both on main.

**Gaps.** The ten gaps agree word for word between `design/plan.json` and the README, compared mechanically, with the same slugs and suppliers and none with supplier `none`. Each is precise and minimal:

- No roadmap states that regular local rings are factorial, Hamann's theorem, or cyclotomic freeness (`roadmaps grep`).
- The Modp package has no Deligne–Lusztig reduction formula.
- §R07.4.24 is full faithfulness on finite flat representations only.
- §6.9 is rank three and §8.10 is the reducible case over `ℚ_p`.

The only gap defect is the `section` label of R02.

**Ownership and overlaps.** The overlap tool reports no open pull request changing this roadmap and no dropped id. `crossing_prime` is declared in no other `Suggested.lean` on main, at an open head or in the board's packages. The contravariant `V*_K`, cyclotomic freeness, the characteristic-zero `τ(s, μ+η)` and the charts are stated nowhere else. The Modp package's §3.4 owns only the mod-`p` parameter, which 0.1 cites.

**Sources, seeded sample**, all read at the locator in the cached texts:

| Target | Locator checked | Result |
| --- | --- | --- |
| 0.4 | LLHL19, Proposition 2.2.16, `LLHL19 line 508`, p. 14: `d`-deep with `d ≥ n` gives `(d−n+1)`-deep; BHHMS23 Remark 2.3.5, line 665, p. 15; §4.1, line 1144, p. 25 | matches, with the `N ≥ 2` caveat stated |
| 1.2 | Definition 3.1.4, lines 849–854, p. 19 | matches |
| 2.1 | Proposition 3.1.7, lines 905–909, p. 20; `𝒪^rig_R`, `λ`, `N_∇` at lines 879–901 | matches |
| 3.3 | Definition 3.2.4, line 1033, p. 22; `V*_K` at lines 1045–1047; LLHL19 §3.1, `LLHL19 line 563`, p. 16 | matches |
| 3.4 | Definition 3.2.5, lines 1048–1052; LLHL19 Proposition 3.1.2, `LLHL19 line 596`, p. 16 | matches; page slip R05 |
| 3.6 | Proposition 3.2.7 and (19), lines 1075–1093, p. 23 | matches |
| 4.2 | Lemma 4.1.1, lines 1201–1215, pp. 25–26; bound `3 < ⟨μ(τ)_j+η_j, α^∨⟩ < p−4` at line 1214 | matches |
| 4.3 | Lemma 4.1.2, (20)–(21), lines 1216–1284, pp. 26–27; `θ_Σ(ω)_j = t^(1,2)` when `ω_{f−1−j} = 0` at line 1253 | matches |
| 5.1 | Lines 1285–1318, pp. 27–28 | matches |
| 5.2 | Tables 1–3, lines 1957–2172, pp. 41–43; (23) and `I^poly ⊆ (I∞, p^{N−5})`, lines 1444–1464, p. 30 | all fifteen `G_i` and the three `a_i mod p` match |
| 5.3 | Lemma 3.3.1, lines 1118–1134, p. 24 | statement matches; R04 |
| 6.2 | Proposition 4.2.1, lines 1319–1333; components at lines 1517–1523, 1555–1565; `(f+4)+2f = 3f+4` at line 1893, p. 38 | matches |
| 6.3 | Corollary 4.2.6, (27)–(28), lines 1588–1616, pp. 33–34; Lemma 8.1.2, line 4405, p. 88 | matches |
| 7.2 | Lines 1617–1632, p. 34 | matches |
| 7.5 | Proposition 4.3.3, lines 1918–1954, pp. 39–40 | matches |

Further locators checked, all on the pages the README gives:

- LLHLM18: Definition 3.8 and Proposition 3.9 (`LLHLM18 lines 1114–1129`, p. 29), Lemmas 3.10–3.11 (lines 1130, 1184, pp. 29–31), Proposition 3.12 (line 1223, p. 31), Proposition 5.11 and Theorem 5.12 (lines 2068–2074, p. 53), §2.3 `T*_dd` (lines 880–892, p. 23).
- LLHLM23: Lemma 7.2.10(1)–(2) (`LLHLM23 lines 4806–4809`, p. 107).
- Hamann75: Theorem 4 (`Hamann75 line 101`, printed p. 155).
- BHHMS23: the Table 5 note (lines 2323–2324, p. 45) and the two twists in the proof of Theorem 8.3.9 (lines 5097 and 5107, p. 102), as the README describes them.

All eight cited works are in `sources.toml`, with no local path.

**Adversarial table** (values I computed; the changed passages, the sampled targets, the headline and every target a finding touches).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 3.7 Jordan–Hölder dependence | `ρ`, `ρ′` with `ρ^ss ≅ ρ′^ss`; `ρ₁^∨ ⊗ ρ₂` non-semisimple | factors of `ρ|_{G_{K′}}` are those of `ρ^ss|_{G_{K′}}` (restriction exact, Clifford); factors of the tensor are the `χ_i^{−1}χ_k` | holds | none |
| 3.7 digit bound | all digit vectors with `|δ_i| ∈ [3, p−3]`, `p ∈ {7, 11, 13}`, `f′ ∈ {1, 2, 3}` (6,316 vectors) | hits of `Σ p^i δ_i ≡ ±(p^{f′}−1)/(p−1)`: 0; hits of `≡ 0`: 0 | holds | none |
| 3.7 worked digits | `f = 2`, `p = 7`, `δ = (3, 4)` | `a₁ − a₂ = 31`; cyclotomic residues `8, 40` modulo `48` | free | none |
| 3.7 depth is sharp | `f = 1`, `p = 7`, `|δ| ∈ [2, 5]` | `δ = ±5` gives `ω^{∓5} = ω^{±1}`; `ω ⊕ 1` has root coordinates `1` and `p − 2`, so 1-generic for `p ≥ 5` and not 2-generic | fails at depth 1, as the Check says | none |
| 3.7 irreducible case | `s_τ = w` | `a₁ − a₂ = (1−q)c`; order divides `q+1`; `gcd(q+1, p−1) = 2`; equal to `ω` only if `p − 1` divides `2` | free for `p ≥ 5` | none |
| 3.7 `p` bound | `p = 5` | `2 < d < 3` empty | `p ≥ 7` forced | none |
| 3.3 variance | `K = ℚ_p`, `φ(e) = αe` | `Hom_φ`: `φ(c) = αc`, Frobenius `α`; `T_𝔽(M)`: `φ(b) = α^{−1}b`, Frobenius `α^{−1}`; `T_𝔽(M^∨)`: `α` | contravariant, matches Lemma 3.2.6 | none |
| 3.3 duality | `φ_{M^∨}(ℓ)(φ_M(m)) = φ(ℓ(m))` | `φ(ℓ) = ℓ` exactly when `ℓ` is `φ`-equivariant | `V*_K = T_𝔽(M^∨)` | none |
| 3.8 cocycles | `W = 𝔽`, `p > 2`; `W = ω`, `K = ℚ_p`; `p = 2` | `K(p₁)/K` is not Galois (`μ_p ⊄ K`), so no hom `G_K → 𝔽` kills `G_{K∞}`; Kummer cocycle of `−p` is nonzero and dies; at `p = 2` the trivial character is `ω`, excluded | holds; hypothesis needed | none |
| 3.8 snake argument | `B¹ = W/W^G` | `H⁰` bijective gives `B¹` bijective; with `H¹` injective, `Z¹` injective | holds, LLHLM18 lines 1227–1236 | none |
| 3.9 | `ρ₂^ss ≇ ρ₁^ss`; `ρ₁ = ρ₂` | both sets empty; `Aut` statement | holds | none |
| 0.4 | `N = 1, 2, 13`, `n = 2` | definition; `d − n + 1 = 1`; `12` | holds | none |
| 1.2 shapes | `diag(v², v)`; `w·diag(v², v)`; `diag(v, v²)` | `t^(2,1)`; `[[0, v],[v², 0]] = w t^(2,1)`, equal to Table 2's residual matrix; `t^(1,2)`, equal to Table 3's | three distinct double cosets | none |
| 2.1 Frobenius rule | trivial rank one, `u′e` | left `−p(u′)^p λ`, right `−E(u′)^p φ(λ)`; equal since `pλ = Eφ(λ)` | holds | none |
| 2.1 basis change | `B = 1 + u′` | `B^{−1}N_∇(B) = −u′λ/(1+u′)` | holds | none |
| 3.6 | `s′ = w`, twist by `nr(α)` | `nr(α) ⊗ Ind χ = Ind(χ · nr_{K′}(α²))`; the full family `D ∈ T(𝔽)^f` reaches every `β`, the scalar twists only squares | README's family is right | none |
| 4.3 `θ` | `f = 1`; `f = 2` | `θ(0) = U₃`, `θ(η) = U₁`; `θ(σ)_0` read from `ω_1`; `|X(σ)| = 2^f` | holds, line 1253 | none |
| 5.1 | kernel of a zero ring | an empty profile locus has kernel `R□`, which does not change the intersection | definition agrees with the source's | none |
| 5.2 `det A₁` | 200 random rational points, four values of `z` each | `e d₂₂* z³ + (e c₂₂ + d₁₁d₂₂* − c₁₂d₂₁) z² + (d₁₁c₂₂ + c₁₁d₂₂* − c₁₂c₂₁ + p c₁₂d₂₁) z + (c₁₁c₂₂ + p c₁₂c₂₁)`: 0 failures | equals Table 1 row 4 | none |
| 5.2 `κ` | `a₂ ∈ {5, 7, −3, 11/3}`; `(p, κ, x, y) = (3, −1, 2, 3)` | `κ − 1 = −1/10, −1/21, −1/6, −9/44 = −2/(a(a−1))`; value `−27` | holds | none |
| 5.2 Hodge labels | chart 1, chart 2 | `(2,1)` factor is `c₁₂` (all four `c` and `d₁₁` vanish), respectively `t + p` (line 1575) | holds | none |
| 5.3 / `crossing_prime` | `x₁x₂ + ϖx₁`; `d = 0`; `O = k⟦t⟧`, `d = 2`; `n = 0` | `x₁(x₂ + ϖ)` reducible; unit; `x₀x₁ + t²` is a rank-three form, irreducible; `Fin 2` has `0 ≠ 1` | holds, also in equal characteristic | none |
| 5.3 converse | `u₁ = 1`, `u₂ = 1 + x₁x₂` | equal residues; equal ideals would force `x₁x₂ + ϖ` to divide `ϖx₁x₂` | converse false; the source does not claim it | R04 |
| 5.4 identity | 500 random rational points; `x = y = 0`, `p = 3`, `κ = −1` | 0 failures; value `108 = 27·4` | holds | none |
| 6.2 | `f = 1, 3` | `3f + 4 − 2f = 5, 7`; `2, 8` components | holds | none |
| 6.3 | `f = 1`, `U₂`, `(2,1)`; chart 1 with `(2,1)` and `(3,0)` | four variables with `xy = 0`: `m = 1`, `𝔽⟦U₁..U₆⟧/(U₁U₂)`; three free variables, `m = 0`; `c₁₂d₂₁ = 0`, `m = 1` | holds | none |
| 7.1 transport | Table 1 `G₁`, `G₂` under the `U₁` substitution | `c₁₂ − p d₁₂* + (a₁−2)d₁₁d₂₂/d₂₁*`; `c₂₁ − (a₁−1)d₁₁d₂₂/d₁₂*` | equal to lines 2190–2191 | none |
| 7.2 | `f = 1`, `θ = U₃`; `f = 2` | types `U₁, U₂`; `4 × 4 = 16` pairs | holds | none |
| 7.3 route | `G_{ℚ_p,∞}`, `n = 1` | `Hom(G, 𝔽_p) ≅ 𝔽_p((v))/℘`, infinite-dimensional: `Φ_p` fails | ring unowned | R01 |
| 7.5 elimination | 200 random rational points | `g₁ − (a−1)d·g₂ = c₂₁ + 2pd/a`: 0 failures | holds | none |
| 7.5 with `ϖ` | `e(E/ℚ_p) ≥ 2` | modulo `Q₂ + P`: `t = −p`, then `p(1 − κ^{−1}) = 0`, so `p = 0`; the quotient `(𝒪/p)⟦…⟧/(d₁₁d₂₂)` is nonzero and `ϖ ≠ 0` in it | `p` is right, `ϖ` is false | none |

Sections no repair touched and outside the sample (0.1–0.3, 0.5, 1.1, 1.3, 1.4, 2.2, 2.3, 3.1, 3.2, 3.5, 4.1, 5.5–5.8, 6.1, 7.1, 7.4) carry computed rows in the round-1 table. I relied on those and re-read each statement against the source lines quoted above without finding a discrepancy.

**Shape and style.** Every definition has its API and at least three Checks; every theorem has hypotheses and a locator; every layer ends with Examples and Dependencies. The layers are named by their mathematics, and their order (types, gauge charts, monodromy, residual classification, admissible types, charts, single type, several types) is forced by the *Needs:* lines. A scan found no LaTeX delimiter, pull-request number, path, HTML anchor or process word. "lemma" occurs only in "snake lemma".

**Remark for the maintainer (no change here).** HilbertModularVarietiesAndShimuraCurvesPartII cites this roadmap by the labels `T.0`, `T.6–T.7`, which this README does not carry. It declares the gaps `tame-types`, `single-type-rings` and `breuil-mezard-pbt` on this roadmap, which ask for potentially Barsotti–Tate presentations and Breuil–Mézard multiplicities outside its scope. It also declares `gap:power-series-cancellation` on DeformationAndDerivedPatchingAlgebra for the theorem this roadmap requests as `gap:power-invariance`. These are that roadmap's citations to settle.

## Not verifiable

- Kisin06, Corollary 1.3.15: recorded `uncertified` (paywalled). It is cited behind BHHMS23 Proposition 3.1.7, which states the result used.
- GHLS17 Theorem D's hypothesis prints as "p ⁄= n" in the extraction; whether it is `p ∤ n` or `p ≠ n` is immaterial for `n = 2`.
- LLHLM18, LLHL19 and LLHLM23 were read in their arXiv versions. Their numbering agrees with BHHMS23's citations of the published versions for every statement used.

## Source issues

- **Misprint** in BHHMS23 at the note below Table 5, printed page 45: the note says the constants and tails come from Tables 1–2; it should be Tables 2–3, the tables of the two shapes Table 5 covers; affects nothing.
- **Misprint** in BHHMS23 at the proof of Theorem 8.3.9, printed page 102: the type-indexing condition twists the weight by the inverse determinant character while the displayed bijection a few lines later twists by the determinant character; it should use the inverse twist in both places; affects nothing.
- **Gap** in BHHMS23 at Lemma 4.1.2, printed page 27: the "only if" direction concludes from the length of the rational projective cover alone; it should also use that the representations attached to the distinct admissible types are pairwise non-isomorphic; affects the proof.
- Withdrawn: the round-1 entry calling BHHMS23 Lemma 3.3.1 (printed page 24) an error. The lemma says "if", not "if and only if" (R04), so it is correct as printed.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "182d8ab0973779be81d23d4539642f96ab40cd45", "job": "REV-PKG-LocalGaloisDeformationRingsPartII~2", "model": "fable", "worker": "chris-x17"} -->
