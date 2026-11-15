<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16366#issuecomment-6901777400 -->
Review (claude) of 07e260f

Verdict: needs_changes

1. **F01** (P3) the fppf topology on classical test rings is used in 2.5 and 7.4 and never defined

   **Location.** `packages/QuasicoherentSheavesOnPrestacks/design/README.md`:

   - 2.5, API, line 405: "`(−)^♮` carries the fppf stackification of a prestack in groupoids (§1.18 `Stack.stackification`) to the fppf sheafification of the corresponding 1-truncated prestack";
   - 7.4(a), line 756: "`[X/G]^♮` is the fppf sheafification of the realization `|h_G^{×_k •} ×_k h_X|` over `Spec k`, so `QCoh([X/G]^♮) ≃ lim_{[n]∈Δ} Dqc(G^{×_k n} ×_k X)`".

   **Claim.** The fppf sheafification of a classical prestack is an object of this roadmap, and a map it inverts is inverted by the fpqc hypersheafification, so that 3.3(a) gives the "so" of 7.4(a).

   **Witness.** "fppf" occurs at README lines 130, 181, 405, 430, 478 and 756 only. Line 430 lists fppf covers as instances of fpqc covers; no passage defines an fppf sheaf on `CRing^op` or says that L inverts fppf-local equivalences. Mathlib's `AlgebraicGeometry.Scheme.fppfTopology` (Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:54), for which §1.18's stacks are stacks, is not in the contracts. This is the pattern of the round-12 finding F01, for the second topology.

   **Exact repair.** The definition goes in 2.5, where it is first used, so that no target needs a later one.

   1. `### From Mathlib`, extend the fpqc bullet: "`AlgebraicGeometry.Scheme.fppfPrecoverage` (same file, line 41), `AlgebraicGeometry.Scheme.fppfTopology` (line 54), `fppfPrecoverage_le_fpqcPrecoverage` (line 67) and `fppfTopology_le_fpqcTopology` (line 84): the fppf topology of schemes, for which the stacks of SchemeAndStackFoundations §1.18 are stacks, and its comparison with the fpqc topology; 2.5 uses them on affine schemes."
   2. In 2.5, before the third API bullet, add: "An fppf sheaf on `CRing^op` is a functor `CRing → Ŝ` that carries finite products of rings to products and satisfies Čech descent along the class Φ′ of faithfully flat ring maps of finite presentation; `L_fppf` is the left adjoint of the inclusion of fppf sheaves (EnhancedDerivedSheaves E2.7, in the universe u+1). Φ′ contains the isomorphisms and is stable under composition, base change and finite products, and coproducts of `CRing^op` are universal and disjoint, so these are the sheaves of the topology that Φ′ generates (HypercompletenessAndCoherence §§9.3.2, 9.4.1). A covering family of Mathlib's `fppfPrecoverage` on `Spec R` is a quasi-compact cover (`fppfPrecoverage_le_fpqcPrecoverage`), so finitely many affine opens of its members, each flat and of finite presentation over R, cover `Spec R`: on affine schemes the topology is Mathlib's `fppfTopology`." Reword the third bullet to end "… to `L_fppf` of the corresponding 1-truncated prestack". Add a Check: "`ℤ → ℤ[1/p] × ℤ_p` is an fpqc cover and not an fppf cover, `ℤ_p` being uncountable and so not a finitely generated ℤ-algebra; an fppf sheaf need not satisfy descent along it."
   3. In 3.1, API, after the bullet on L, add: "Φ′ ⊆ Φ, so every fpqc sheaf on `CRing^op` is an fppf sheaf (2.5); hence every map of classical prestacks inverted by `L_fppf` is inverted by L and by the hypersheafification." In 7.4(a), after "over `Spec k`", insert "hence fpqc-locally equivalent to it (3.1), so by 3.3(a)".
   4. Add to the *Needs* of 2.5: "1.1; HypercompletenessAndCoherence §§9.3.2, 9.4.1; Mathlib `AlgebraicGeometry.Scheme.fppfTopology`, `fppfPrecoverage_le_fpqcPrecoverage`"; to the *Needs* of 7.4: "3.1 (fppf-local equivalences are fpqc-local); 3.3". Mirror in the Layer 2 Dependencies and in the plan (the `stackification` API entry and prerequisites of 2.5, the prerequisites of 7.4). The plan's supplier entry already lists §§9.3.2 and 9.4.1.

   **Tested.** Conditions for Φ′: the identity; `ℤ → ℤ[x] → ℤ[x, y]`, free and finitely presented; the base change of `ℤ → ℤ[x]` along `ℤ → 𝔽_p` is `𝔽_p → 𝔽_p[x]`; the product of `ℤ → ℤ[x]` and `ℚ → ℚ[y]` is `(ℤ × ℚ)[x, y]/((0,1)x, (1,0)y) = ℤ[x] × ℚ[y]`, finitely presented; the empty product is `0 → 0`. On the instances of the two locations: for a finite group Γ and a field k, the constant prestack `BΓ × Spec k` maps to the stack of Γ-torsors by an `L_fppf`-equivalence, both sides have `QCoh = Fun(BΓ, Mod_k)` (3.3's Check); for `G = G_m`, `X = Spec ℤ`, the realization maps to `(BG_m)^♮` by a Zariski-local equivalence, and both have heart the ℤ-graded abelian groups (7.4's Check). The dependency gate is unaffected: no supplier is added.

The three findings of the round-12 review are repaired. This round finds no P1 and no P2, and one P3 finding (R01), which carries a repair: the verdict therefore asks for changes, and R01 is the only change asked for. The two declared supplier gaps are precise, minimal and declared in both files, and are not findings: `gap:chevalley-quasiprojective-quotient` (ReductiveGroups Layer 3) and `gap:twist-quasiprojective` (SchemeAndStackFoundations §1.16). No maintainer notes were supplied. This review changed neither the design, the plan nor the manifest (the manifest's checksum is the same before and after the two fetches below).

## Verified sound

### Findings of the previous review

| Finding | Status | Repaired passage, and what I checked |
| --- | --- | --- |
| F01 (P3) sheaf criteria owned by a supplier that was not cited | repaired, applied differently | 3.1, line 432: "So §9.3.2 gives a Grothendieck topology on `T^op` whose covering sieves are those containing an fpqc cover. Its 𝒞-valued sheaves are the 𝒞-valued fpqc sheaves above (§9.4.1; SAG Proposition A.3.3.1, p. 1766)". I read SAG lines 64259–64283 (A.3.2.1, conditions (a)–(d)), 64326–64337 (A.3.3.1, with (e)), 65837–65848 (A.5.7.1), 65851–65858 (A.5.7.2), 79403–79409 (D.6.1.4) and 4184–4204 (1.3.1.7 and its proof), and HypercompletenessAndCoherence §§1.1.1, 1.2.1, 2.4.1, 2.5.1, 2.5.2, 4.2.1, 6.1.1, 9.3.2, 9.4.1, 11.5.1, 11.5.2, 11.5.3 at its open head: each states what the contract says. The fixer's departure holds: §4.2.1 states the sheaf case only, and the hypercomplete route (line 441) derives the rest from §§11.5.2–11.5.3; I re-derived both directions (table). The universal property for sheaves follows from the statement of SAG 1.3.1.7 with PresheavesAndCompletions §1.4.3 and PresentableInfinityCategories §4.4.2, both in the *Needs*. |
| F02 (P3) ι and flat hypercovers | repaired | 3.1, line 436: "It is reached from A by adjoining these subsets one at a time in order of size, each step a pushout along a latching map `L_m(A_•) → A_m` with `m < n`, which is faithfully flat." 3.2, line 455: "Through θ and θι, which carry flat hypercovers to flat hypercovers (3.1)". I checked the poset argument (adjoining a subset S all of whose proper subsets are present is the pushout along `L_S → A_S`) and the new Check of line 449 (table). The plan's `stability` entry and test `latching_objects` agree. |
| F03 (P3) manifest and plan locator | repaired | `sources.toml`: `Stacks.cited_for` has "3.4", `HTT.cited_for` has "3.3"; the plan's 3.4 locator ends "Stacks, Descent, Lemma 35.13.7 (tag 023Q)". My own script over the 33 subsections finds every `cited_for` list equal to the works each subsection cites (SGA1 is cited for 8.4 from the supplier contract). |

No finding of the repair report is marked "not actionable"; nothing is re-raised. The repaired patterns were searched in the whole design. F01's pattern (sheaves of a topology used without the identification) recurs once, for the fppf topology: R01. F02's pattern (ι applied to a colimit construction): 2.4 states that `ι_!` does not preserve fibre products, 4.1–4.2, 6.2(b), 7.1 and 8.3 form their fibre products and Čech nerves inside one context, and 1.3 claims only that ι preserves and reflects flatness; no other place. F03's pattern: script above, no gap.

### Adversarial pass

Values computed by hand this round. Rows cover the passages the repair changed, the fifteen sampled targets, the headline theorems and R01.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 3.1 conditions (a)–(e) for Φ (changed) | `A × B → C`; empty coproduct; `A = ℤ, B = 𝔽_p` | `C = Ce ⊕ C(1−e)` for `e = (1,0)`; `0 ⊗_A C = 0`; `ℤ ⊗_{ℤ×𝔽_p} 𝔽_p = 0`. The special case `D = ⊔C_i` gives SAG's (d) in general: `(A × B) ⊗_E E′ = (A ⊗_E E′) × (B ⊗_E E′)` | holds in all three contexts |
| 3.1 flat hypercovers = Φ-hypercoverings (changed) | `n = 0`; Čech nerve of `A → B` | `L_0 = A` (the index `[−1]` of SAG A.5.7.1), so the condition is `A → A_0` faithfully flat; for the Čech nerve `L_n → A_n` is an equivalence for `n ≥ 1` | agrees with SAG D.6.1.4 |
| 3.1 ι and latching objects (changed) | `n = 1`; `n = 2`; negative control `ℤ → 𝔽_p` constant | `L_1 = A_0 ⊗_A A_0`, `Tor_i = 0`; `L_2`: after the singletons `A_0^{⊗3}`, then three pushouts along `A_0 ⊗_A A_0 → A_1`, each flat, running colimit discrete; control: `CRing` `L_1 = 𝔽_p`, `AnRing` `L_1 = 𝔽_p ⊗ᴸ 𝔽_p` with `π₁ = 𝔽_p`, and `π₁(L_1) ⊗ π₀(A_1) = 𝔽_p ≠ 0 = π₁(A_1)` | true; flatness of lower latching maps is used |
| 3.1 universal property, sheaf case (changed) | G with sheaf restriction g; G inverting L-equivalences | g = `G′ L j` by SAG 1.3.1.7, and G, `G′L` are limit-preserving and agree on representables, so equal; conversely `G = G′L` by the localization property and `G′ L j` is a sheaf | holds from the statement, not only the proof, of 1.3.1.7 |
| 3.1 universal property, hypercomplete case (changed) | `𝒞 = Ŝ`, `G = Map(−, F)`; `𝒞 = Δ[0]` | `F_D = Map(D, F(−))`; for D a point, `F_D = F`, so G inverts hypersheafification equivalences iff F is local, iff F is a hypercomplete sheaf; for `Δ[0]` every `F_D` is the final prestack | holds |
| 3.2 flat hyperdescent (sample, headline; step (3) changed) | `A → A`; `ℤ → 𝔽_p`; `n = 0` in step (3); coface `A_S → L_n` | constant nerve; `ℚ ⊗ᴸ 𝔽_p = 0`, not conservative; `τ≤0 Mod^cn_A` is the 1-category of `π₀A`-modules, cores of functor categories into it are 1-truncated; `A_S → L_n` is a composite of base changes of lower latching maps (adjoin the subsets not inside S in order of size), so flat, as step (4) uses | sound |
| 3.2 Checks | `ℤ → ℤ[1/p] × ℤ_p`; `ℤ → ℤ[1/2] × ℤ[1/3]` | `ℚ_p` is a module over the target, so ℤ is in its thick ideal; fibre `ℤ[1/6][−1]`, `Ext²(ℤ[1/6], ℤ) = 0`, `Hom(ℤ[1/2], ℤ) = 0` so no retraction, index exactly 2 | sound |
| 3.3 (sample, headline) | `∅ → Spec 0` as U → X in (c); `Spec 𝔽_p → Spec ℤ` | empty cover of 0 lifts the point; every `U_n = ∅`, limit of the terminal category is `0 = Mod_0`; the second is not an fpqc surjection and its totalization kills ℚ | sound |
| 1.1 (sample) | `𝔽_p ⊗_ℤ 𝔽_p`; `θι(ℤ × ℤ)`; free `E∞`-ℤ-algebra on `ℤ[0]` | `π₀ = π₁ = 𝔽_p` derived, `𝔽_p` ordinary; product `π₀ = ℤ²` against coproduct `ℤ ⊗ᴸ ℤ = ℤ`; degree-2 summand `C_*(BΣ₂; ℤ)`, `H₁ = ℤ/2` | sound |
| 1.2 (sample) | `Mod_0`; square of `ℤ → 𝔽_p` with itself; `R → R[t]`, `M = R[1]`, `N = R[t]` | zero category; both sides `𝔽_p ⊗ᴸ 𝔽_p` (`π₁ = 𝔽_p`), ordinary `B′ = 𝔽_p` gives `𝔽_p` on one side only; both sides `R[t][1]` | sound; derived pushout is needed |
| 2.4 (sample) | `u = ι`, `Y = Spec(𝔽_p ⊗ᴸ 𝔽_p)`; `ι_!` of `Spec 𝔽_p ×_{Spec ℤ} Spec 𝔽_p`; `u_! Spec ℤ` | `ι^*Y(R) = Hom(π₀(𝔽_p ⊗ᴸ 𝔽_p), R) = Hom(𝔽_p, R)`, so `ι^*Y = Spec 𝔽_p` with unit `π₁ = 0` against `𝔽_p`; `Spec 𝔽_p` against `Spec(𝔽_p ⊗ᴸ 𝔽_p)`; `Spec u(ℤ)`, final | sound |
| 2.5 (sample) | `(Bℤ/2)^♮(ℝ)`; `ℝ × ℝ`; `k[ε]` on field points | `ℝ^×/ℝ^{×2} = ℤ/2`, two components; `π₁ = (ℤ/2)²`; identity and `ε ↦ 0` agree on every field | sound, except the undefined fppf sheafification (R01) |
| 4.1 (sample) | `X = ∅`; `Spec k → BG`; `BG → Spec k` | only `Y = ∅` maps to ∅, affine vacuously; fibre over a torsor P is P, affine; value at `O(G)` has `π₁ ∋ id ≠ e` for G nontrivial | sound |
| 4.2 (headline) | `Spec 0 → Spec R`; `Spec R[t] → Spec R`; classical `Spec 𝔽_p → Spec ℤ` twice | `f_* 0 = 0`; `R[t]`, base change `R′[t]`; `𝔽_p ⊗ᴸ 𝔽_p` against `𝔽_p`, so flatness is needed classically | sound |
| 5.2 (sample) | `τ^{≥−m}K`; `ℙ¹`, `O(−2)` | `H^q(τ^{≥−m−1}K) → H^q(τ^{≥−m}K)` is an isomorphism or `0 → 0`, onto, so tag 0A0J applies; cokernel of `(a, b) ↦ a − t⁻²b` on `k[t] ⊕ k[t⁻¹] → k[t, t⁻¹]` is `k·t⁻¹` | sound |
| 5.3 (sample, headline) | `⨿_ℕ Spec ℤ`; `ℙ¹`; empty scheme | `∏_ℕ D∞(ℤ)` both sides; `H¹(O(−2)) = k`; `QCoh(h_∅) = Mod_0 = 0 = Dqc(∅)` | sound |
| 5.4 (sample) | `ℙ¹_k → Spec k`; `ℙ¹_ℤ`, `g : Spec ℚ → Spec ℤ`; `Spec 𝔽_p → Spec ℤ` twice | `f_* O(−2) = k[−1]`; `ℤ[−1] ⊗ ℚ = ℚ[−1]`; `Tor₁^ℤ(𝔽_p, 𝔽_p) = 𝔽_p ≠ 0`, not Tor-independent | sound |
| 6.1 (sample) | `Spec 0`; `⊕_ℕ O`, `ℤ[x]` on `Spec ℤ`; `𝔽_p` under `ℤ → 𝔽_p` | every object has P; flat, identity does not factor through a finite subsum; 0-truncated to `π₁ = 𝔽_p`, not stable under base change | sound |
| 6.2 (sample, headline) | `Spec(𝔽_p ⊗ᴸ 𝔽_p)`; `BΓ × Spec 𝔽₂`; doubled plane | heart `ModuleCat 𝔽_p`; heart `𝔽₂[ℤ/2]`-modules, `Ext¹(1, 1) = H¹(ℤ/2; 𝔽₂) = 𝔽₂`; diagonal over `U × U′` is `𝔸² ∖ 0`, quasi-affine (tag 02JR) and not affine, atlas base change `U ⊔ (𝔸² ∖ 0) → U` flat | sound |
| 6.3 (sample, headline) | `O[1]`; `O²`; `ℤ/p`; `X = ∅` | inverse `O[−1]`; evaluation rank 4 → 1; dual `ℤ/p[−1]` not connective; `QCoh(∅) = 0`, the zero unit is dualizable and (vacuously) perfect | sound |
| 6.4 criterion | `F = ⊕_{i≥0} ℤ[−i]` on `Spec ℤ` (not bounded below) | `π_j Map(F, N) = ∏_i π_{j−i}N`; for `N_α = ⊕_{i≤α} ℤ[−i]` the element `(1, 1, …)` is not in the colimit, so the criterion fails for F, as it should | consistent with SAG 9.1.5.1 |
| 7.3 (headline) | Γ trivial; ℤ trivial on `Spec C`; `σ(x) = 2x` | `QCoh(X)`; `H¹(ℤ; C) = C`; `id(x·1) = x ≠ 2x` | sound |
| 7.1 Check | `O(G) = ℤ × 𝔽_ℓ` | points: idempotents e with `ℓe = 0`; `ℓ(e + e′ − 2ee′) = 0`; `𝔽_ℓ` is ℓ-torsion, not flat | sound |
| 8.1 (sample) | `⨿_ℕ Spec ℤ`; empty scheme; `ℙ¹` | `⊕_i O_i = O`, `Hom(O, O) = ∏ℤ ≠ ⊕ℤ`; `QCoh = 0`, generated by 0; `O ⊕ O(−1)` | sound; quasi-compactness used |
| 8.2 (headline) | `X = ∅`; `Spec 𝔽₂`, `Map(O, 0 ⊕ 0)` | diagonal an equivalence, `QCoh = 0 = Ind(0)`; one point against two | sound |
| 8.3 (headline) | (c) derived route; (d) `A = k[ε]/(ε²)`; doubled line | `X ×_Y Spec A → X` is a base change of the point, affine as Y has affine diagonal; `Ω¹_{A/k} = A dε/(2ε dε)`, `k·dε` in characteristic ≠ 2 and `A·dε` in characteristic 2, nonzero; two sections with affine non-vanishing loci, and no ample module (not separated) | sound |
| 8.4 (sample, headline) | `BG_m`, `M = O[1]`; `ℤ/2` over ℚ, `P = Spec ℚ(i)`; twist of `ℙ¹` by `diag(1, −1)` | `Map(ℚ, O[1]) = K(ℚ, 1)`, `π₀ = 0`, `π₁ = ℚ`; `P ×^G G = P`, no ℚ-point; invariants of `σ ∘ diag(1, −1)`: `a = ā`, `b = −b̄`, so `ℚe₁ ⊕ ℚ·ie₂` | sound, conditional on the gaps |
| 8.5 (headline) | `ℤ/p` over `𝔽_p`; `S₃` over `𝔽₃` | norm = p = 0 and `g − 1 = 0` on k, so `Hⁱ = k` for all i, `⊕k → ∏k` not onto; `H¹ = Hom(S₃, 𝔽₃) = 0`, `H² = H²(C₃)^{C₂} = 0` (action −1), while `H³ = 𝔽₃` (sign `(−1)² = 1`), consistent with the Check claiming only degrees 1 and 2 | sound |
| gap:twist-quasiprojective | P trivial; `G = 1` | `X_R` with the pulled-back L; `X_R` | precise; §1.16 states `contractedProduct_isAlgebraicSpace` only |
| gap:chevalley-quasiprojective-quotient | `H = GL_n`; `H = 1` | a point; `GL_n`, affine | precise; ReductiveGroups Layers 3 and 3A state no such representability ("quasi-projective" occurs once, in 3A.5e, about complex points) |
| R01, fppf on `CRing^op` | Φ′ under composition, base change, products; `ℤ → ℤ[1/p] × ℤ_p` | `ℤ[x] × ℚ[y] = (ℤ × ℚ)[x, y]/((0,1)x, (1,0)y)`; fpqc cover, not fppf (`ℤ_p` uncountable) | true once defined |

### Sources: the seeded sample

No locator is flagged unverified in the plan. Every sampled target was read at its locators in the cached texts. The Stacks chapters *Descent* and *Morphisms of Schemes* were fetched through the sources service; the entry `Stacks` was kept as recorded.

| Target | Locators read | Result |
| --- | --- | --- |
| 1.1 | SAG lines 17835–17840 (Definition 6.2.2.1, pp. 490–491), 17845–17850 (Remark 6.2.2.2, p. 491); HA line 46757 (Proposition 7.1.3.18, p. 1219) | match |
| 1.2 | HA lines 22977–22985 (Theorem 4.5.3.1, Remark 4.5.3.2, p. 601), 28674 (Corollary 4.8.5.21, p. 754), 28032 (Theorem 4.8.4.6, p. 737) | match |
| 2.4 | SAG line 17845; GR-I lines 7379–7401 (§1.2, printed pp. 145–146) | match |
| 2.5 | HTT lines 3037 (Proposition 2.1.1.3, PDF p. 75, stated for categories cofibred in groupoids and left fibrations; the README uses the dual, as it says), 2081 (Proposition 1.2.5.1, PDF p. 53) | match |
| 3.2 | SAG lines 79502–79503 (Theorem D.6.3.1, p. 2177, for complete prestable A-linear categories), 79518, 79526 (Corollaries D.6.3.3–D.6.3.4, pp. 2177–2178), 79395 (D.6.1.3, p. 2174), 79462 (D.6.2.3, p. 2176); GR-I lines 7446, 7452 (printed p. 146); HTT line 31182 (Lemma 6.5.2.9, PDF p. 687) | match |
| 3.3 | SAG lines 17889–17903 (Proposition 6.2.3.1, Remarks 6.2.3.2–6.2.3.3, p. 492); GR-I lines 7458, 7463, 7474 (printed p. 147); HTT line 27376 (Proposition 6.2.3.4) | match |
| 4.1 | SAG line 18224 (§6.3.2, p. 501); HTT line 25589 (Proposition 6.1.3.10, PDF p. 566) | match |
| 5.2 | Stacks lines 86–92 (tag 0A0J, surjective transitions assumed), 102 (tag 08D3) | match |
| 5.3 | SAG lines 17929 (Proposition 6.2.4.1, p. 493), 6951 (Corollary 2.1.2.3, pp. 193–194), 7461 (Corollary 2.2.6.2, p. 208); GR-I line 7572 (printed p. 149) | match |
| 5.4 | Stacks lines 311 (tag 08DZ), 2312 (tag 08EU), 2351–2363 (tag 08IB, Tor-independence assumed); SAG line 18368 (Proposition 6.3.4.1, p. 505) | match |
| 6.1 | SAG lines 17990–18016 (Definition 6.2.5.3 to Example 6.2.5.7, p. 495), 9916 (Proposition 2.8.4.2, p. 275) | match |
| 6.2 | SAG lines 18017–18029 (Remark 6.2.5.8, Warning 6.2.5.9, pp. 495–496), 26667, 26690–26696 (9.1.3.1, 9.1.3.2, p. 733, for quasi-geometric stacks); GR-I lines 7581 (§1.5.1, printed p. 149), 7600 (Proposition 1.5.4, printed p. 150); HA line 6013 (p. 160); Stacks, Descent line 1906 (tag 023Q); Morphisms line 1100 (tag 02JR) | match |
| 6.3 | SAG lines 18072, 18088 (6.2.6.2, 6.2.6.3, p. 497), 10219 (Remark 2.9.5.5, p. 283); HA line 23655 (4.6.1.11, p. 620); GR-I lines 8201, 8209 (printed p. 163) | match |
| 8.1 | Stacks lines 1806 (tag 09IS), 1969 (tag 09M1); SAG line 29408 (Proposition 9.6.1.1, p. 807) | match |
| 8.4 | BZFN lines 1200–1208 (Corollary 3.22, p. 24); SGA1 line 6972 (Exposé VIII, Proposition 7.8, PDF p. 190) | match |

Also read: Stacks, Morphisms lines 999, 1011, 1019 (tags 0FXR, 0FXS, 0FXT, for 8.3) and Stacks lines 1059, 1897 (tags 08E8, 0BQR). Every cited work is in the manifest (nine entries, all `certified`). No reference request was written.

### Pins, suppliers and ownership

Lean elaboration: not available (this lane does not elaborate; the command was not offered). The design has no `Suggested.lean`, so there is nothing to probe or `#check`.

Pins: Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, equal to the plan's baseline. Opened at the file and line the README gives, all present: `SSet.Quasicategory` (Quasicategory/Basic.lean:41), `SSet.KanComplex` (KanComplex.lean:40), `CategoryTheory.nerve` (Nerve.lean:37) and its instance (Quasicategory/Nerve.lean:32), `AlgebraicGeometry.Spec`, `Scheme.Spec` (Scheme.lean:466, 494), `fpqcPrecoverage` (Sites/Fpqc.lean:61, `propQCPrecoverage @Flat`: flat, jointly surjective, quasi-compact covers; no finite presentation), `fpqcTopology` (:76), `Module.Flat` (Flat/Basic.lean:114), `Module.FaithfullyFlat` (FaithfullyFlat/Basic.lean:64), `DerivedCategory` (Basic.lean:87), `TStructure.t` (TStructure.lean:33), `Pseudofunctor.IsStack` (IsStack.lean:49), `DescentData` (DescentData.lean:59), `CoGrothendieck` (Bicategory/Grothendieck.lean:235), `groupCohomology` (Basic.lean:183), `Rep.coind` (Coinduced.lean:120), `coindIso` (Shapiro.lean:58), `groupCohomologyIsoEven`, `groupCohomologyIsoOdd` (FiniteCyclic.lean:80, 114), `exists_prime_orderOf_dvd_card` (Cycle/Type.lean:491), `CategoryTheory.Functor.IsFibered` (FiberedCategory/Fibered.lean:65), and Tau Ceti `exists_isClosedImmersion_generalLinear` (TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212, `[Field k]`, `[LocallyOfFiniteType G.obj.X.hom]`).

Supplier citations resolved this round, each on main or at its open head:

- EnhancedDerivedSheaves (main): 41 declaration names of the contract found, among them `enhancedDerived.homotopyCategory`, `tot_filteredColimit_of_bounded` (its bound `r ≥ max(0, b − k + 1)` is what 3.2 step (2) uses), `presentable_limit` (any small ∞-category), `homotopyFixedPoints` (finite groups, as 7.3 says), `continuousDerivedInvariants`, `descendableCover_zariski`, `hypercoverPullback_unit` (all of `D∞`), `indCompactComparison`. E0.5 supplies space-valued straightening over arbitrary small bases, which 2.1 uses.
- SchemeAndStackFoundations (main): §§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18 with 20 names, among them `Action.constantEquiv`, `GroupSpace.ofGroupScheme`, `StackInGroupoids.ofSheaf`, `Stack.stackification`, `Coherent.DQCoh`, `PseudoCoherence.IsPseudoCoherentComplex`, `isPseudoCoherentComplex_affine_iff`.
- DerivedModuleAlgebra (main): §0.2 `DerivedDeRham.derivedTensor`; §1.E.0 `IsPerfect`, `IsPseudoCoherent`, `HasTorAmplitude`. ReductiveGroups (main): Layers 1, 3, 6.
- PrismaticCohomologyPartII §4.0: all 16 names. LanglandsParameterStacks §§1.7, 1.8; HabiroCohomologyFoundations §§1.27, 1.28; AnalyticStacks §§1.1, 1.2: present.
- The InfinityCategoryTheory family: InfinityTopoi §§3.1.2, 3.3.2, 3.5.1, 4.4.1, 7.1.1, 7.3.1, 7.3.4, 7.4.1, 7.4.2, 7.5.1, 7.6.1, 8.4.1, 9.1.1, 9.2.3, 14.1.1; HypercompletenessAndCoherence (twelve sections above); PresentableInfinityCategories §§4.4.2, 6.2.3; PresheavesAndCompletions §1.4.3; CartesianFibrations §§1.3.1, 2.1.1, 2.2.1, 5.5.3; InfinityCategoryFoundations §5.1.1; LimitsAndKanExtensions §9.1.2; StableInfinityCategories §11.1.1; DerivedInfinityCategories §5.5.2: all present.

The nine leads of `scratch/citations.md` are qualified supplier names that the resolver sought only in the pinned libraries; each is in its supplier's README (lines above). A remark that needs no change: the plan's supplier entry for StableInfinityCategories also lists §11.3.2, which the README cites only in its exclusion of the spectral context.

`scratch/overlaps.md` lists no competing pull request, no dropped id, no id defined only by a revision and no second copy. Searched by object at the open heads and on main: "perfect stack" and this roadmap's name occur nowhere else; SAG Theorem D.6.3.1 and flat hyperdescent only in LanglandsParameterStacks §1.7 (Čech case, cited and extended); SAG Propositions 6.2.4.1 and 6.2.6.2 nowhere; `QCoh(BG)` only in SchemeAndStackFoundations (abelian, cited). Ownership against pull requests outside the tools' index was not checked.

Overlap check: read EnhancedDerivedSheaves (main), SchemeAndStackFoundations (main), AnalyticStacks, HypercompletenessAndCoherence and InfinityTopoi of the InfinityCategoryTheory family; shared objects: `Mod_R(D(ℤ))` on animated rings — owner EnhancedDerivedSheaves E5:animation.4; ∞-topos theory and the Čech and hypercomplete sheaf criteria — owner the InfinityCategoryTheory family; abelian `QCoh` on stacks and `DQCoh` — owner SchemeAndStackFoundations; descendable (!-)descent on animated affines — owner AnalyticStacks §1.2, distinct from the fpqc hyperdescent owned here.

### Dependency gate and the declared gaps

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 239 roadmaps, 2246 edges, 0 problem(s)
```

No UPWARD or CYCLE line. AnalyticStacks, the named consumer, is later in the order than that placement. The plan has 33 targets, each with a locator and 3 to 6 tests; my script finds every roadmap prerequisite of the plan on the README's *Needs* line of its target.

- `gap:twist-quasiprojective`: same slug in the README (line 135) and the plan; supplier SchemeAndStackFoundations §1.16; one `needs` sentence with all hypotheses; not provided by §1.16, nor by any open roadmap that mentions contracted products.
- `gap:chevalley-quasiprojective-quotient`: same slug in the README (line 181) and the plan; supplier ReductiveGroups Layer 3; one `needs` sentence; no roadmap states it.

### Shape, principles, headlines

- The README has the required parts in order. All 33 subsections have a `**Checks.**` list of 3 to 6 bullets and one *Needs* line; all 8 layers end with Examples and Dependencies (counted by script).
- Regex scan: no LaTeX delimiters, process words, pull-request numbers, machine paths, HTML or `set_option`; "lemma" occurs only in "Shapiro's lemma".
- No algorithm, no sorry'd data, no route-specific shortcut. The README names its sources and does not say it follows one; no layer is named after a source's chapter.
- Headline theorems (Summary): flat hyperdescent (3.2) with sheafification invariance and Čech descent (3.3); affine pushforward with base change and projection formula (4.2); `QCoh(h_X) ≃ Dqc(X)` (5.3); the t-structure and perfect = dualizable (6.2–6.3); `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` (7.3); perfect stacks and permanence (8.2–8.3); characteristic-zero quotients (8.4); the non-compact unit in characteristic p (8.5). Each is a target with hypotheses and locators. Their statability at the pins is the package stage's question.

Source independence: 80 passages compared with 7 sources (SAG 37, Stacks 15, GR-I 12, HA 7, HTT 6, BZFN 2, SGA1 1; the line numbers are in the tables above), none shared beyond what a statement forces (at most six consecutive words, in the hypotheses (a)–(e) and in the criterion of 6.4); largest share SAG, 65 of 212 locators by a pattern count; contents compared with SAG §§6.2.1–6.2.6, 6.3.1–6.3.4, 9.1.1–9.1.6, A.3 and D.6.1–D.6.8: independent. Layer 1 draws on HA; Layer 2 joins SAG 6.2.2 with part of 6.2.3 and its own 2.4–2.5; Layer 3 joins D.6, A.3, A.5.7 and GR-I; Layer 4 (SAG 6.3) precedes Layer 5 (SAG 6.2.4) because 5.4 needs 4.2; Layer 6 merges 6.2.5, 6.2.6 and 9.1; Layers 7–8 have no SAG counterpart.

## Not verifiable

- Lean elaboration and the one-tactic probe: not available in this lane, and the design has no `Suggested.lean`.
- The two gaps are declared contracts: their statements were checked, not their future proofs.
- Suppliers still in pull requests were read at the heads of the index of 2026-11-15; they can move before they merge.
- Outside this round's sample and untouched by the repair: the source locators of 1.3–1.5, 2.1–2.3, 4.2, 6.4, 7.1–7.4, 8.2, 8.3 and 8.5 were not reopened, except where a row above names a line; for them I rely on the rows of rounds 11 and 12 that carry line numbers. The Stacks chapter *Sheaves on Algebraic Stacks* (tags 06WG, 06WT, cited in 7.4) and the texts HNR and HR-perf (7.4, 8.5) were not reopened.

## Source issues

- **Misprint** in SAG at §A.5.7, opening paragraph, printed p. 1805: the source says it applies a theorem whose number is printed as an unresolved reference mark; it should be the number of the theorem of §A.5 being applied; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "07e260fc0c03dc3faa976f951965ffeda15da7b6", "job": "REV-DESIGN-QuasicoherentSheavesOnPrestacks~13", "model": "fable", "worker": "chris-x29"} -->
