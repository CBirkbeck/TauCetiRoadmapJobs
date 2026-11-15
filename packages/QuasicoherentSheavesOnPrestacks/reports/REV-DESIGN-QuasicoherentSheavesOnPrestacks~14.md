<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16366#issuecomment-6902700394 -->
Review (claude) of c5701ab

Verdict: needs_changes

1. **F01** (P3) affine diagonals of quotients are asserted with no route, and the fact they need is no target

   **Location.** `packages/QuasicoherentSheavesOnPrestacks/design/README.md`:

   - 7.1, API, line 716: "If S is affine, G is affine over S and X is affine, then `[X/G]` has affine diagonal, so the atlas `X → [X/G]` is affine (4.1)."
   - 7.4(d), line 762: "if `[X/G]` is quasi-compact with affine diagonal, for instance X affine".
   - 8.4, proof route, line 848: "`BGL_n` is perfect" and "the geometric stack `BGL_n`" (8.2 and 6.2 both require an affine diagonal).

   **Claim.** The diagonal of a quotient by an affine group is affine.

   **Witness.** After base change along `X × X → [X/G] × [X/G]` the diagonal is `G ×_S X → X × X`, affine. Concluding needs "affineness is fpqc-local on the target for sheaves". 4.1's API (line 528) has only composition and base change; 6.1 treats modules. No section states it.

   The statements are true; what is missing is the lemma and one sentence in each place. It follows from 3.2 and 3.3 in every context, so the lemma belongs in 4.1 (Layer 4 already depends on Layers 1–3, and no target of Layer 3 needs 4.1).

   **Exact repair.**

   1. 4.1, API, add: "Affineness is local on the target. Let `Y → Spec R` be a map from a hypercomplete fpqc sheaf and `{R → R_i}` an fpqc cover such that every `Y ×_{Spec R} Spec R_i` is affine; then Y is affine. In the classical context the same holds for an fppf sheaf Y and an fppf cover (2.5). Route: let `R′ = ∏_i R_i` with Čech nerve `R′_•`. The base changes `Y ×_{Spec R} Spec R′_n` are `Spec B_n` for a cosimplicial test ring `B_•` under `R′_•` whose transitions are base changes. Put `B = lim_Δ B_•`, computed on underlying connective modules. By 3.2 the maps `B ⊗_R R′_n → B_n` are equivalences. `Spec B` is a sheaf (3.2) and `Spec R′ → Spec R` is an effective epimorphism of sheaves (3.1), so Y and `Spec B` are both the colimit, among sheaves, of the same Čech nerve (3.3(c)). Consequently a map of such sheaves is affine as soon as its base change along an fpqc surjection of the target is."
   2. 4.1, Checks, add: "The sheaf condition is used. For the constant prestack `B(ℤ/2)` over `Spec ℤ`, the diagonal has fibre `Spec R ⊔ Spec R`, the prestack coproduct, over the trivial pair of points. Its value at `ℤ × ℤ` (for `R = ℤ`) has 2 points, whereas an affine carries products of rings to products and would have `2² = 4`. After sheafification the fibre is `Spec(R × R)`."
   3. 4.1, *Needs*: add "2.5 (fppf form); 3.1; 3.2; 3.3". Mirror in the plan's 4.1 (`prerequisites`, one `api` entry, one test).
   4. 7.1, second API bullet: move the first sentence after the surjectivity of the atlas and write "Then `[X/G]` has affine diagonal when S, X are affine and G is affine over S: `X × X → [X/G] × [X/G]` is an fpqc surjection, the base change of the diagonal along it is `G ×_S X → X × X` by effectivity, a map of affines, and affineness is local on the target (4.1). So the atlas is affine."
   5. 7.4, after (a) in the proof route, add: "For X affine, `[X/G]^♮` has affine diagonal: every pair of its points lifts to `h_X × h_X` after an fppf cover (§1.18 `Stack.stackification_locally_essSurj`), the base change of the diagonal along `h_X × h_X` is `h_{G ×_k X} → h_X × h_X`, and 4.1 applies in its fppf form."
   6. 8.4, after "`BGL_n` is perfect.", add: "It has affine diagonal (7.4, with `X = Spec k`), and `QCoh((BGL_n)^♮)` is `QCoh` of the geometric stack `[Spec k/GL_n]` of 7.1 (7.4(a), 7.2), whose t-structure is left and right complete (6.2(b))." Replace "on the geometric stack `BGL_n`" by "of that geometric stack". 8.4's *Needs* gains 7.1 and 7.2.

   **Tested.** `G = G_m`, `X = S = Spec ℤ`: over a pair of line bundles `(L_1, L_2)` on `Spec R` the fibre is `Isom(L_1, L_2)`; on a Zariski cover trivializing both, `B_0 = ∏ R_i[t, t⁻¹]`, and the limit is `B = ⊕_{n∈ℤ} M^{⊗n}` with `M = L_2 ⊗ L_1⁻¹`, an R-algebra with `B ⊗_R R_i = R_i[t, t⁻¹]`. The non-flat G of 7.1's last Check (`O(G) = ℤ × 𝔽_ℓ`): the fibre over the trivial pair is `Spec(R × R/ℓ)`, already affine, and the lemma uses no flatness of G. Negative control: item 2, where the conclusion fails for a non-sheaf.

2. **F02** (P3) 2.5: the comparison of stackification with `L_fppf` compares adjoints on two different categories

   **Location.** README 2.5, API, line 408: "both are left adjoint to the inclusion of fppf stacks among 1-truncated objects, by the 2-categorical universal property of §1.18 and the compatibility of sheafification with truncation".

   **Claim.** `(−)^♮` carries `Stack.stackification` to `L_fppf`.

   **Witness.** §1.18's stackification is left adjoint on pseudofunctors on all schemes (SchemeAndStackFoundations README line 3567); `L_fppf` is on functors `CRing → Ŝ`. Two universal properties on different categories do not compare without knowing that restriction to affines carries the unit to an `L_fppf`-equivalence.

   **Exact repair.** Replace the text after the colon by: "the unit `F → stackification F`, restricted to affine schemes and passed through `(−)^♮`, is a map to an fppf sheaf. After `L_fppf` it is a monomorphism, because the isomorphism presheaves of the stackification are the fppf sheafifications of those of F (§1.18 `Stack.stackification_isom_sheafify`), and an effective epimorphism, because every object of the stackification is fppf-locally in the image (§1.18 `Stack.stackification_locally_essSurj`; InfinityTopoi §9.2.3); so it is an equivalence (InfinityTopoi §7.3.4). On an affine scheme both statements are read on fppf covers of rings, by the comparison of covers above." Add "InfinityTopoi §§7.3.4, 9.2.3" to the *Needs* of 2.5 and to the Layer 2 Dependencies, and to the plan's 2.5.

   **Tested.** `G = ℤ/2` over ℝ (2.5's Check): the prestack of trivial torsors has one object over ℝ; the torsor `Spec ℂ` is in the image after the fppf cover `ℝ → ℂ`, so both components are reached. For the constant prestack `BΓ`, automorphisms are the constant Γ, and their sheafification at `ℝ × ℝ` is `Γ²`, the value 2.5's Check gives.

3. **F03** (P3) "bounded below" is used in two opposite senses, and `QCoh(X)^+`, `D⁺` are not defined

   **Location.** README line 123: "`tot_filteredColimit_of_bounded` (stabilization of `π_k` of a totalization of uniformly bounded-below cosimplicial objects"; line 762: "`D⁺(QCoh([X/G])^♥) → QCoh([X/G])^+`"; line 777: "its bounded-below part".

   **Claim.** These mean cohomologically bounded below, that is `π_i = 0` for `i ≫ 0`.

   **Witness.** Conventions fix homological indexing (line 64), and line 276 uses "bounded below" for `π_m = 0`, `m ≪ 0`. Read that way line 123 is false: EnhancedDerivedSheaves E5:animation.3's Check has connective terms, `Tot₁ = 0` and `Tot = k[0]`.

   **Exact repair.** (i) Conventions, Indexing, add: "`QCoh(X)^+` is the union over n of the n-truncated objects, those with `π_m = 0` for `m > n`, and `D⁺(𝒜)` of an abelian category is the derived ∞-category of complexes whose cohomology vanishes in sufficiently negative Mathlib degrees. Witness: `∏_{i≥0} ℤ[−i]` is 0-truncated and lies in `QCoh(Spec ℤ)^+`; `⊕_{i≥0} ℤ[i]` does not." (ii) Line 123: "of cosimplicial objects of `D∞(R)` with `π_i = 0` for `i > b`, uniformly". (iii) Line 276: "bounded below (`π_m M = 0` for `m ≪ 0`)". (iv) Line 777: "and `QCoh(BG_m)^+` is `D⁺` of graded abelian groups".

   **Tested.** 3.2 step (2) uses n-truncated modules, `b = n`, the supplier's bound `r ≥ max(0, n − k + 1)`. 8.4 applies 7.4(d) to `τ_{≤n} M`, which is in `QCoh^+` as defined in (i) and not bounded below in the sense of line 276.

4. **F04** (P3) 8.5 cites HNR Theorem 1.1 for a statement it does not make

   **Location.** README 8.5, line 863: "HNR Theorem 1.1, p. 1, for the corresponding statement on the lisse-étale `D_qc` of poorly stabilized stacks".

   **Claim.** HNR Theorem 1.1 is the lisse-étale counterpart of "O is dualizable and not compact".

   **Witness.** HNR line 45–47, 55: for poorly stabilized stacks `D_qc` is not compactly generated. HNR line 436: poor means the reduced identity component is not semi-abelian; for `ℤ/p` it is trivial, so `B(ℤ/p)` is not poorly stabilized.

   **Exact repair.** Replace the parenthesis by: "(HR-perf Introduction, p. 1: on a stack that is not tame the structure sheaf is perfect and not compact. Compact generation itself does not fail here; it fails for poorly stabilized stacks such as `BG_a` in characteristic p, HNR Theorem 1.1, pp. 1–2, a class that does not contain `B(ℤ/p)`)". Add the Check: "Compact generation is not what fails: `Fun(BΓ, Mod_k)` is generated by the regular representation `k[Γ]`, which is compact, `Map(k[Γ], M)` being `Ω^∞` of the underlying k-module of M." Update the plan's 8.5 locator to "HNR Theorem 1.1, pp. 1–2".

   **Tested.** `Γ = ℤ/p`, `k = 𝔽_p`: `Map(k[Γ], ⊕_i V[i]) = Ω^∞ ⊕_i V[i]`, and `π₀` commutes with the sum, while `π₀ Map(O, ⊕_i O[i]) = ∏_i 𝔽_p`; the two objects differ, as the repaired sentence says.

5. **F05** (P3) a supplier contract bullet names a Check that the README does not contain

   **Location.** README, From TauCetiRoadmap.EnhancedDerivedSheaves, line 122: "E5:spectra-comparison: `eilenbergMacLane` and `moduleSpectra_equiv_derived`, used only to compare the classical context with module spectra in a Check."

   **Claim.** A Check consumes E5:spectra-comparison.

   **Witness.** `moduleSpectra_equiv_derived`, `eilenbergMacLane` and "spectra-comparison" occur on line 122 only; no Check, *Needs* line or Dependencies list names them, and the plan's supplier entry for EnhancedDerivedSheaves does not list the section.

   **Exact repair.** Delete the bullet. (The neighbouring bullet on `enhancement_compatibility`, which 1.2 uses, stays.)

   **Tested.** After deletion the contract lists exactly the sections named in *Needs* lines; the plan needs no change.

No P1 and no P2 finding. Five P3 findings (R01–R05), each with an exact repair; because each is a repair to the text, the verdict asks for changes and a fix round applies them. The two declared supplier gaps, `gap:chevalley-quasiprojective-quotient` (ReductiveGroups Layer 3) and `gap:twist-quasiprojective` (SchemeAndStackFoundations §1.16), are precise, minimal and declared in both files; they are contracts, not findings. No maintainer notes were supplied. This review changed neither `design/README.md`, `design/plan.json` nor `sources.toml` (the manifest's checksum is the same before and after the one fetch below).

## Verified sound

### The finding of the previous review

| Finding | Status | Repaired passage, and what I checked |
| --- | --- | --- |
| F01 (P3) fppf topology on classical test rings undefined | repaired | 2.5, line 402: "A finite family `{R → S_i}` of ring maps is an fppf cover if `R → ∏_i S_i` is faithfully flat and of finite presentation"; 3.1, line 444: "every map f of classical prestacks inverted by `L_fppf` is inverted by L and by the hypersheafification"; 7.4(a), line 762: "`[X/G]^♮` is `L_fppf` of the realization". The departures the repair report states (the reworded Check, the added `mem_toGrothendieck_iff_of_isStableUnderComposition`, no 1.1 on 2.5's *Needs*) hold: I opened the Mathlib declarations (below) and recomputed the rows of the table marked "changed". |

Nothing in the repair report is marked "not actionable"; nothing is re-raised. The repaired pattern (a notion used and never defined, or an fppf fact used for an fpqc conclusion) was searched in the whole design: it recurs as R01 (locality of affineness) and R03 (`^+`); no other instance.

### Adversarial pass

Values computed by hand this round. Rows cover the changed passages, the fifteen sampled targets, the headline theorems and every target a finding touches.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 2.5 fppf covers and Φ′ (changed) | `ℤ → ℤ[x]`, `ℚ → ℚ[y]`; empty family; `n = 2, 3` | product `ℤ[x] × ℚ[y]` over `ℤ × ℚ`, finitely presented; `R → 0` faithfully flat only for `R = 0`; `(2) ∈ D(3)`, `(3) ∈ D(2)`, `(2) ∉ D(2)` | holds |
| 2.5 Mathlib comparison (changed) | hypotheses of the cited lemma | needs `IsStableUnderComposition`, `IsStableUnderBaseChange`, `HasPullbacks`, `HasIsos`; the first two are derived at Fpqc.lean:43, the others are instances at Sites/MorphismProperty.lean:103 and :107 | applies |
| 2.5 Check, `ℤ → ℤ[1/p] × ℤ_p` (changed) | cardinality | finitely generated ℤ-algebras countable, `ℤ_p` uncountable and a quotient by `(1, 0)` | in Φ, not Φ′ |
| 3.1 `L_fppf` bullet (changed) | F an fpqc sheaf; `∅ → Spec 0` | F is an fppf sheaf, so `Map(f, F) ≃ Map(L_fppf f, F)`; the empty fppf cover of 0 lifts the point | holds; converse not claimed |
| 3.3 Check, finite Γ (changed) | `Γ = ℤ/2`, `R = ℝ × ℝ` | `Γ(R) = (ℤ/2)²` against constant `ℤ/2`; each locally constant function constant on `{R → ℝ, R → ℝ}` | holds |
| 7.4(a) (changed, sample) | `G = 1`; `G = G_m`; (d) with `G = ℤ/p` over `𝔽_p` | realization `h_X`, so (a) is 5.3; heart graded abelian groups; `Ext^i = Hⁱ(ℤ/p; 𝔽_p) = 𝔽_p` (norm p = 0 and `g − 1 = 0`) | sound; affine diagonal: R01 |
| 1.2 (sample) | square of `ℤ → 𝔽_p` with itself; `Mod_0`; HA 4.8.4.6 with `M = Mod_B`, `C = Mod_A`, algebra A′ | both sides `𝔽_p ⊗ᴸ 𝔽_p`, `π₁ = 𝔽_p`; ordinary `B′ = 𝔽_p` gives `π₁ = 0` on one side; zero category; `Mod_B ⊗_{Mod_A} Mod_{A′} ≃ RMod_{A′}(Mod_B) = Mod_{B ⊗_A A′}` | sound |
| 1.3 (sample) | `ℤ → ℚ`; `𝔽_p → 𝔽_p ⊗ᴸ 𝔽_p`; flat N | `ℚ ⊗ᴸ ℤ/p = 0`; `π₁`: 0 against `𝔽_p`; Tor spectral sequence collapses to `π_n M ⊗ π₀N` (HA 7.2.2.13) | sound |
| 2.4 (sample) | `ι_!` of `Spec 𝔽_p ×_{Spec ℤ} Spec 𝔽_p`; `ι^* Spec(𝔽_p ⊗ᴸ 𝔽_p)` | `Spec 𝔽_p` against `Spec(𝔽_p ⊗ᴸ 𝔽_p)`; `Hom(π₀(𝔽_p ⊗ᴸ 𝔽_p), R) = Hom(𝔽_p, R)` | sound |
| 3.2 (sample, headline) | identity cover; `ℤ → 𝔽_p`; step (2) with n-truncated terms | constant nerve; ℚ ↦ 0; supplier bound `r ≥ max(0, n − k + 1)`, finite, so `B ⊗_A −` commutes with the totalization | sound |
| 3.3 (sample, headline) | `Spec 𝔽_p → Spec ℤ`; `∅ → Spec 0` | not a surjection, totalization kills ℚ; `Mod_0 = 0 =` limit over the empty diagram | sound |
| 3.4 (sample) | `ℙ¹`, `O(−2)`; empty scheme; doubled plane | `k[t] + t⁻²k[t⁻¹]` misses exactly `t⁻¹`; `h_∅ = Spec 0`; affine opens containing `𝔸² ∖ 0` are U, U′ only, fibre two points | sound |
| 5.1 (sample) | `ℤ/2 ⊗ᴸ ℤ/2`; `φ : ℤ → 𝔽_p` | cohomology `ℤ/2` in degrees 0 and −1; `𝔽_p` in degrees 0 and −1 | sound |
| 5.2 (sample) | transitions of `τ^{≥−m} K` | `H^q` isomorphism for `q ≥ −m`, target 0 for `q < −m`: surjective, so tag 0A0J applies | sound |
| 5.3 (sample, headline) | `⨿_ℕ Spec ℤ`; `ℙ¹` | `∏_ℕ D∞(ℤ)` both sides; `H¹(O(−2)) = k` | sound |
| 6.1 (sample) | SAG 2.8.4.2 items (1), (6), (9), (10); `𝔽_p` under `ℤ → 𝔽_p` | connective, flat, almost perfect, perfect are local; locally free = flat and almost perfect; 0-truncated ↦ `π₁ = 𝔽_p` | sound |
| 6.2, 6.3 (headline) | `Spec(𝔽_p ⊗ᴸ 𝔽_p)`; `O ⊕ O` | heart `ModuleCat 𝔽_p`; evaluation rank 4 → 1, not invertible | sound |
| 6.4 criterion | M not bounded below, `N = ⊕_i E_i[−i]` with `E_i` an injective hull of `π_{−i}M` | `⊕ = ∏` (distinct degrees), `π₀ Map = ∏_i Hom(π_{−i}M, E_i) ≠ ⊕`, so the criterion forces bounded below | consistent with SAG 9.1.5.1 |
| 7.1 (sample) | `O(G) = ℤ × 𝔽_ℓ`; constant `B(ℤ/2)` | `ℓ(e + e′ − 2ee′) = 0`, `𝔽_ℓ` not flat; diagonal fibre `Spec R ⊔ Spec R`: 2 points at `ℤ × ℤ` against 4 | sound; R01 |
| 7.3 (headline) | ℤ trivial on `Spec C`; coconnectivity | `H¹(ℤ; C) = C`; `Map(G[1], F) = Map(UG[1], UF)^{hΓ}` is a point | sound |
| 8.2 (sample, headline) | scheme `⨿_ℕ Spec ℤ`; `Map(O, 0 ⊕ 0)` on `Spec 𝔽₂` | diagonal fibre at `(f, g)` is the clopen locus `f = g`, affine (the prestack coproduct would give ∅, not affine: the Check is about `h_X`); one point against two | sound |
| 8.3 (headline) | (d) `A = k[ε]/(ε²)`; doubled line | `Ω¹_{A/k} = k·dε` or `A·dε`, nonzero; `L_{±1}` with sections non-vanishing on U, U′ | sound |
| 8.4 (sample, headline) | unbounded M; `G = ℤ/2`, `P = Spec ℚ(i)` | `π₁ Map(V[i], τ_{≤n} M) = Hom(V, π_{i+1} M)` constant for `n > i`, so `lim¹ = 0` and `π₀ Map(V[i], M) = Hom(V, π_i M)`; `P ×^G G = P`, no ℚ-point | sound, conditional on the gaps; R01, R03 |
| 8.5 (sample, headline) | `ℤ/p`; `S₃` over `𝔽₃`; `k[Γ]` | `Hⁱ = k`; `H¹ = H² = 0`, `H³ = 𝔽₃`, coinduced witness of dimension 2; `k[Γ]` compact | sound; R04 |
| gap:twist-quasiprojective | P trivial; `G = 1` | `X_R` with the pulled-back L, both cases | precise, minimal; §1.16 states `contractedProduct_isAlgebraicSpace` only |
| gap:chevalley-quasiprojective-quotient | `H = GL_n`; `H = 1` | a point; `GL_n`, affine | precise, minimal; "quasi-projective" occurs in ReductiveGroups only in 3A.5e, on complex points |

### Sources: the seeded sample

No locator is flagged unverified in the plan. Each sampled target was read at its locators; the page is the one the cached text gives.

| Target | Locators read | Result |
| --- | --- | --- |
| 1.2 | HA lines 22977–22985 (4.5.3.1, 4.5.3.2, p. 601), 28674 (4.8.5.21, p. 754), 28032 (4.8.4.6, p. 737) | match |
| 1.3 | HA lines 46134–46144 (7.1.1.13, p. 1202), 47511–47532 (7.2.2.10, 7.2.2.12, 7.2.2.13, 7.2.2.15, pp. 1240–1241), 47387 (7.2.1.19, p. 1236), 6013 (1.4.4.11, p. 160) | match |
| 2.4 | SAG line 17845 (6.2.2.2, p. 491); GR-I lines 7379–7401 (§1.2, printed pp. 145–146) | match |
| 3.2 | SAG lines 79502 (D.6.3.1, p. 2177), 79518, 79526 (D.6.3.3–4, pp. 2177–2178), 79395 (D.6.1.3, p. 2174), 79462 (D.6.2.3, p. 2176); GR-I lines 7446, 7452 (printed p. 146); HTT line 31182 (6.5.2.9, PDF p. 687) | match |
| 3.3 | SAG lines 17889–17903 (6.2.3.1–6.2.3.3, p. 492); GR-I lines 7458, 7463, 7474 (printed p. 147) | match |
| 3.4 | GR-I line 7572 (1.4.4, printed p. 149); SAG line 17912 (6.2.3.4(3), p. 493); HTT lines 31671, 31680, 31693 (PDF p. 698) | match |
| 5.1 | Stacks line 145 (tag 06Z0); SAG lines 7269 (2.2.3.3, p. 202), 17859 (6.2.2.5, p. 491) | match |
| 5.2 | Stacks lines 86–93 (tag 0A0J), 102–103 (tag 08D3) | match |
| 5.3 | SAG lines 17929 (6.2.4.1, p. 493), 6951 (2.1.2.3, pp. 193–194), 7461 (2.2.6.2, p. 208) | match |
| 6.1 | SAG lines 17990–18016 (6.2.5.3–6.2.5.7, p. 495), 9916–9930 (2.8.4.2, p. 275), 18085–18088 (p. 497), 17974 (6.2.5.2, p. 494) | match |
| 7.1 | HTT lines 25224 (6.1.2.7, PDF p. 559), 24717 (6.1.0.6, PDF p. 547), 25589 (6.1.3.10, PDF p. 566), 25890 (6.1.3.19, PDF p. 573) | match |
| 7.4 | Stacks, Sheaves on Algebraic Stacks, lines 721 (tag 06WG, Definition 11.1), 953 (tag 06WT, Proposition 14.3), fetched through the sources service; GR-I lines 7872, 7883 (2.4.3, 2.4.5, printed p. 156); SAG lines 33959–33968 (10.4.6.8, 10.4.6.9, p. 930); HNR line 807 (C.1, p. 16); HA line 3703 (1.3.3.2, p. 97) | match |
| 8.2 | BZFN lines 834 (Definition 3.2, p. 17), 970 (Proposition 3.9, p. 20) | match |
| 8.4 | BZFN lines 1200–1208 (3.22, p. 24); SGA1 line 6972 (VIII 7.8, PDF p. 190, printed p. 174) | match |
| 8.5 | HR-perf lines 26–29 (Introduction, p. 1): match. HNR lines 45–56 (Theorem 1.1, pp. 1–2), 436 | R04 |

Also read: SAG lines 79377–79409 (D.6.1.1, D.6.1.4), 26798 (9.1.5.1, p. 736), Stacks line 1059 (tag 08E8, Noetherian, as 6.4 says). Every cited work is in the manifest (nine entries, all `certified`); my script finds every `cited_for` list equal to the subsections citing the work (SGA1's "8.4" comes from the supplier contract). No reference request was written.

### Pins, suppliers, ownership

Lean elaboration: not available (this lane does not elaborate; the command was not offered). The design has no `Suggested.lean`, so there is nothing to probe or `#check`.

Opened at the pins: `fppfPrecoverage` (Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:41, `precoverage (@Flat ⊓ @LocallyOfFinitePresentation)`, no finiteness of the family), `fppfTopology` (:54), `fpqcPrecoverage` (:61), `fppfPrecoverage_le_fpqcPrecoverage` (:67), `fpqcTopology` (:76), `fppfTopology_le_fpqcTopology` (:84); `mem_toGrothendieck_iff_of_isStableUnderComposition` (Mathlib/CategoryTheory/Sites/PrecoverageToGrothendieck.lean:166); `RingHom.FinitePresentation` (Mathlib/RingTheory/FinitePresentation.lean:392); Tau Ceti `exists_isClosedImmersion_generalLinear` (TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212, `[Field k]`, `[LocallyOfFiniteType G.obj.X.hom]`). For the other Mathlib names of the contract I rely on the round-13 list, which gives file and line for each.

Supplier citations resolved this round:

- EnhancedDerivedSheaves (main): every backticked name of the contract occurs in its README (script, none missing), as do the 27 section labels; E5:animation.3 states the bound 3.2 uses; E2.7 states the localization 2.5 and 3.1 use.
- SchemeAndStackFoundations (main): §§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18 exist; every name of the contract occurs (script); `Stack.stackification_isom_sheafify` and `Stack.stackification_locally_essSurj`, which R02 uses, are in §1.18.
- ReductiveGroups (main): Layers 1, 3, 6. DerivedModuleAlgebra (main): §0.2, §1.E.0.
- PrismaticCohomologyPartII §4.0 (16 names found), LanglandsParameterStacks §§1.7, 1.8, HabiroCohomologyFoundations §§1.27, 1.28, at their open heads.
- HypercompletenessAndCoherence §§4.2.1, 6.1.1, 9.3.2, 9.4.1, 11.5.1–11.5.3 and InfinityTopoi §§7.3.4, 8.4.1, 9.2.3 read at the open head; the worker's resolver reports no cross-roadmap citation found nowhere, and its nine name leads are qualified supplier names present in the suppliers' READMEs.

`scratch/overlaps.md`: no competing pull request, no dropped id, no id defined only by a revision, no second copy. Searched by object at the open heads and on main: "perfect stack", flat hyperdescent, SAG Theorem D.6.3.1 (LanglandsParameterStacks §1.7 only, the Čech case, cited and extended), descent of affine morphisms (nowhere, which is why R01 places it here). Ownership against pull requests outside the tools' index was not checked.

Overlap check: read EnhancedDerivedSheaves (main), SchemeAndStackFoundations (main), DiamondsAndVStacks (main), AnalyticStacks and HypercompletenessAndCoherence with InfinityTopoi (open); shared objects: `Mod_R(D(ℤ))` on animated rings — owner EnhancedDerivedSheaves E5:animation.4; the sheaf criteria and ∞-topos theory — owner the InfinityCategoryTheory family; abelian `QCoh` on stacks and `DQCoh` — owner SchemeAndStackFoundations; the extension of a six-functor formalism to !-sheaves and the !-topology — owner AnalyticStacks 0.13 and 1.2, later in the order, whose `D^*` on presheaves of animated affines is the animated `QCoh` owned here; DiamondsAndVStacks shares nothing.

### Dependency gate and the declared gaps

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 239 roadmaps, 2257 edges, 0 problem(s)
```

No UPWARD or CYCLE line. AnalyticStacks, the named consumer, is later than that placement. None of the roadmaps barred as suppliers is cited. Both gaps have the same slug in the README (lines 136 and 182) and in the plan, a named supplier and section that exist on main, and a single `needs` sentence with its hypotheses; neither asks for something a supplier, Mathlib or Tau Ceti states.

### Shape, principles, headlines

- Parts in the required order; 8 layers, each ending with Examples and Dependencies; 33 subsections, each with one *Needs* line and 3 to 6 Checks; every definition has an API list (script). The plan has 33 targets, each with a locator and at least 3 tests; every roadmap prerequisite of the plan is on the *Needs* line of its target.
- Scan: no LaTeX delimiters, process words, pull-request numbers, machine paths, HTML or `set_option`.
- No algorithm, no sorry'd data, no route-specific shortcut. The README names its sources and does not say it follows one; no layer is named after a source's chapter.
- Headline theorems (Summary): flat hyperdescent (3.2) with 3.3; affine pushforward (4.2); `QCoh(h_X) ≃ Dqc(X)` (5.3); the t-structure and perfect = dualizable (6.2–6.3); `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` (7.3); perfect stacks and permanence (8.2–8.3); characteristic-zero quotients (8.4); the non-compact unit in characteristic p (8.5). Each is a target with hypotheses and locators; statability at the pins is the package stage's question.

Source independence: 12 passages compared with 8 sources (1.3 with HA 7.1.1.13; the flatness convention with HA 7.2.2.10; 3.1 with SAG D.6.1.4; 3.3 with SAG 6.2.3.1 and GR-I 1.3.7–1.3.11; 6.1 with SAG 6.2.5.3; 6.4 with SAG 9.1.5.1; 7.4(d) with GR-I 2.4.5; 8.2 with BZFN 3.2; 8.4 with BZFN 3.22; 8.5 with HR-perf and HNR; 5.2 with Stacks 0A0J and 08D3; the gap with SGA1 VIII 7.8), none shared beyond what a statement forces (at most five consecutive words, "is stable under base change"); largest share SAG, 58 of 158 locators by a pattern count; contents compared with SAG §§6.2.1–6.2.6, 6.3, 9.1 and D.6: independent. Layer 1 draws on HA; Layer 2 joins SAG 6.2.2 with parts of 6.2.3 and 6.2.6 and its own 2.4–2.5; Layer 3 joins D.6, A.3 and GR-I; Layer 4 (SAG 6.3) precedes Layer 5 (SAG 6.2.4) because 5.4 needs 4.2; Layer 6 merges 6.2.5, 6.2.6 and 9.1; Layers 7–8 have no SAG counterpart.

## Not verifiable

- Lean elaboration and the one-tactic probe: not available in this lane, and the design has no `Suggested.lean`.
- The two gaps are declared contracts: their statements were checked, not their future proofs.
- Suppliers still in pull requests were read at the heads of the index of 2026-11-15; they can move before they merge.
- Outside this round's sample and untouched by the repair: the source locators of 1.1, 1.4, 1.5, 2.1–2.3, 4.1, 4.2, 5.4, 6.2, 6.3, 7.2, 7.3, 8.1 and 8.3 were not reopened, except where a row above names a line; for them I rely on the rows of rounds 11 to 13 that carry line numbers. Stacks chapter numbers (29, 35, 36, 96) were not checked against the online numbering, only the tags and the numbers within each chapter.

## Source issues

- **Misprint** in HA at Theorem 7.2.2.15, printed p. 1240: the source says the ring is R and then calls N a module over A; it should be a module over R; affects nothing.
- **Misprint** in HA at Proposition 7.2.1.19, printed p. 1236: the source says the ring is R and takes M and N to be modules over A; it should be modules over R; affects nothing.
- **Misprint** in SAG at Remark 6.2.3.2, printed p. 492: the source says the sheafification of F for a functor it has named X; it should be the sheafification of X; affects nothing.
- **Misprint** in SAG at Warning 10.4.6.9, printed p. 930: the source says G is the classifying stack and then writes the derived category of the heart of X; it should use one letter for the stack; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c5701ab850c71ccc9b0227d9d6a1f204ac0d1f48", "job": "REV-DESIGN-QuasicoherentSheavesOnPrestacks~14", "model": "fable", "worker": "chris-x89"} -->
