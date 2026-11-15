<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16366#issuecomment-6899293781 -->
Review (claude) of 0cacf8d

Verdict: needs_changes

1. **F01** (P3) routes use effective epimorphisms and universal colimits with no supplier section named

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md`:

   - 7.1, API, line 701 (added by the last repair): "It is the image under L (3.1) of the effective epimorphism `X → |G^{×_S •} ×_S X|`, hence an effective epimorphism of fpqc sheaves, so every point `Spec R → [X/G]` lifts to X after an fpqc cover";
   - 3.4, route, line 485: "monomorphisms that are effective epimorphisms, that is to equivalences";
   - 6.2, route (a), line 642: "In sheaves `⨿_j X_j → X` is an effective epimorphism, so every point does so after an fpqc cover";
   - 4.1, API, line 514: "by universality of colimits in `PreStk_T`";
   - Conventions (Universes), line 54: "and the ∞-topos statements (7.1)".

   **Claim:** every input of these routes is a target, a named supplier section or a pinned declaration, and 7.1 is the only place that uses ∞-topos statements.

   **Witness:** the *Needs* lines of 3.4, 4.1, 6.2 and 7.1 (lines 494, 522, 652, 713) name no statement about effective epimorphisms or universal colimits. The supplier contract cites InfinityTopoi §§3.1.2, 3.3.2, 3.5.1 and 4.4.1 only. At its open head InfinityTopoi states the facts used in §1.1 and §3.1.2 (universal colimits), §7.3.4, §7.4, §7.6.1, §9.2 (local lifting) and §14.1.1.

   **Exact repair:** the owner exists and is already a contracted supplier, so only citations change.

   1. In `### From TauCetiRoadmap.InfinityCategoryTheory`, add a bullet: "InfinityTopoi §7.1.1 and §7.3.4: effective epimorphisms, and their factorization system with monomorphisms, so a monomorphism that is an effective epimorphism is an equivalence (3.4). §7.4: left exact left adjoints between ∞-topoi preserve effective epimorphisms (3.4, 7.1). §7.6.1: the map from the coproduct of a diagram to its colimit is an effective epimorphism (6.2). §14.1.1, with the local-lifting step of §9.2: a map of sheaves is an effective epimorphism exactly when every point of the target lifts along a covering family (6.2, 7.1). All are applied in the universe u+1."
   2. Add these sections to the *Needs* lines of 3.4 (§§7.3.4, 7.4), 6.2 (§§7.6.1, 9.2, 14.1.1) and 7.1 (§§7.1.1, 7.4, 9.2, 14.1.1), and "InfinityTopoi §3.1.2 (universal colimits)" to 4.1.
   3. In Conventions replace "the ∞-topos statements (7.1)" by "the ∞-topos statements (3.4, 4.1, 6.2, 7.1)".
   4. Add InfinityTopoi to the Dependencies of Layers 3, 4 and 6. Mirror the sections in the plan's InfinityTopoi supplier entry and in the prerequisites of 3.4, 4.1, 6.2 and 7.1.

   Tested on the witness. For `G = G_m`, `X = S = Spec ℤ`: §7.1.1 with §3.1 makes `S → |G_m^{ו}|` an effective epimorphism, §7.4 carries it through L, and §14.1.1 with §9.2 lifts every point of `BG_m` to S after an fpqc cover, as line 701 says. The dependency gate is unaffected, InfinityTopoi being a supplier already.

2. **F02** (P3) 6.1 cites SAG Example 6.2.5.7 for the tensor structure of the connective part

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, 6.1, API, line 628: "`QCoh(X)^cn` contains `O_X`, is closed under small colimits, extensions and tensor products, and is a symmetric monoidal ∞-category (SAG Example 6.2.5.7, p. 495)."

   **Claim:** SAG Example 6.2.5.7 supports all four properties.

   **Witness:** SAG lines 18011–18016 (Example 6.2.5.7) give closure under small colimits and extensions only. The unit, closure under tensor products and the symmetric monoidal structure are the unnumbered remark at SAG lines 18085–18087, p. 497, before Proposition 6.2.6.3.

   **Exact repair:** replace the parenthesis by "(SAG Example 6.2.5.7, p. 495, for colimits and extensions; the remark preceding SAG Proposition 6.2.6.3, p. 497, for the unit, tensor products and the symmetric monoidal structure)", and mirror it in the locator of the plan's 6.1 entry. Tested: both passages are in the cached text at the lines given, and the manifest's SAG entry already lists §6.2.6.

Both findings of the previous review are repaired. This round finds no P1 and no P2. It has two P3 findings (R01, R02), each with a repair to apply, so it asks for changes; nothing else stands in the way of acceptance. The two declared supplier gaps, `gap:chevalley-quasiprojective-quotient` (ReductiveGroups Layer 3) and `gap:twist-quasiprojective` (SchemeAndStackFoundations §1.16), are precise, minimal and declared in both the plan and the README; they are contracts, not findings. No maintainer notes were supplied. This review changed neither the design, the plan nor the manifest.

## Verified sound

### Findings of the previous review

| Finding | Status | Repaired passage, and what I checked |
| --- | --- | --- |
| F01 (P3) list of supplier statements used one universe up | repaired | Conventions, line 54: "Every supplier statement about small ∞-categories, presheaf ∞-categories or ∞-topoi that is applied to T, `T^op`, the nerve of affine schemes, `Pts(X)` or another (u+1)-small indexing ∞-category, to `PreStk_T` or its slices, or to fpqc sheaves on `T^op`, is applied in the universe u+1". The rule is general, and the list after it now covers 1.2, 1.5, 2.1–2.3, 2.5, 3.1–3.4 and 7.1. The route of 2.3 (line 364) and three contract bullets (lines 158, 163, 164) carry the clause, and the plan's three supplier entries mirror it. EnhancedDerivedSheaves E3.1 (Kan extensions, used in 2.2 and 2.4) has no smallness hypothesis at main, so it is rightly absent. One place is still missing from the list: R01, item 3. |
| F02 (P3) 7.1 derived "geometric" from surjectivity | repaired | 7.1, line 701: "For every such G the atlas is an fpqc surjection. … If moreover G is flat over S, the atlas is flat … So `[X/G]` is geometric in the sense of 6.2 when G is flat over S". The new Check is at line 711, and 6.1 and 6.2 are in *Needs* (line 713). The plan's `geometric_quotient`, the test `nonflat_atlas` and the prerequisites `target:6.1`, `target:6.2` agree. The inputs of the new sentence are R01. |

No finding of the repair report is marked "not actionable", so nothing is re-raised. The repaired patterns were searched in the rest of the design:

- "fpqc surjection" and "geometric" occur in 3.3, 6.2, 6.4, 7.4 and 8.4, each with a flat group or a flat atlas.
- `presentable_limit_right` is now cited only for u-small diagrams (line 295).

### Adversarial pass

Values computed by hand this round. Rows cover the passages the last repair changed, the fifteen sampled targets, the headline theorems and both findings. Headline rows whose text no repair touched (3.2, 5.3, 8.2–8.5) also rest on the computed rows of the round-10 table, which I re-read against the text.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, universe rule (changed) | `T^op`; K not u-small; set of flat hypercovers | `CommRingCat.{u}` has a (u+1)-set of objects; `∏_K ℚ/ℤ` has at least `2^|K|` elements, not u-small; hypercovers are cosemisimplicial objects of a (u+1)-small category, a (u+1)-small set, so §4.4.2 applies in u+1 | holds; one place missing (R01) |
| 1.1 test rings (sample) | free `E∞` algebra on `ℤ[0]`; `θι(ℤ × ℤ)`; zero ring | degree-2 summand `ℤ_{hΣ₂}` has `π₁ = H₁(BΣ₂; ℤ) = ℤ/2`, while `θ(ℤ[x])` is discrete; product has `π₀ = ℤ²`, coproduct `ℤ ⊗ᴸ ℤ = ℤ`; `Map(0, B) = ∅` for `B ≠ 0`, a point for `B = 0` | sound |
| 1.4 perfect, almost perfect, locally free (sample) | `ℤ ⊕ ℤ[3]`; k over `k[ε]/ε²`; k over `k[x₁, …]`; `ℤ/p` | dual `ℤ ⊕ ℤ[−3]`; `Tor_i = k` for all `i ≥ 0`; `π₀ = A/𝔪` with 𝔪 not finitely generated; dual `ℤ/p[−1]`, `π₋₁ ≠ 0` | sound |
| 1.5 adjointable limits (sample; route changed) | empty K; K discrete, not u-small; ordinary pushout of `ℤ → 𝔽_p` | terminal category, adjoint the identity; `∏_K D∞(ℤ)`, componentwise adjoint, outside `presentable_limit_right`; `𝔽_p ⊗ᴸ 𝔽_p` (`π₁ = 𝔽_p`) against `𝔽_p` | sound |
| 1.5 dualizable and invertible in a limit | (ℤ, ℚ); (ℤ, ℤ[1]); (ℤ, ℤ²) | ℚ not perfect; evaluations `ℤ ⊗ ℤ → ℤ` and `ℤ[−1] ⊗ ℤ[1] → ℤ` equivalences; rank 4 → 1 | sound |
| 1.5 descent criterion | both directions under Beck–Chevalley | `lim C^•` is the comodules over the comonad on `C⁰`, which the adjointable augmentation square identifies with `G G^R`; so "equivalence" is "comonadic" in both directions (HA Theorem 4.7.5.2(3)) | sound |
| 2.1 points (sample) | `Pts(Spec A)`; `Spec 0` against ∅; `Spec ℤ` | `T_{A/}`, initial `(A, id)`; value at 0 a point against ∅; `Map(ℤ, B)` a point for all B | sound |
| 2.2 definition (sample) | ∅; `Spec A ⊔ Spec B`; `BΓ × Spec 𝔽₂`, `Γ = ℤ/2` | terminal category; `Mod_A × Mod_B`; `π₀Map(O, O[1]) = H¹(ℤ/2; 𝔽₂) = 𝔽₂`, each evaluation in `π₋₁A = 0` | sound |
| 2.3 formal properties (sample; route changed) | points of `BΓ × Spec 𝔽₂`; `Spec ℤ` | value at A is `BΓ × Hom(𝔽₂, A)`, every component through the atlas point; `π₀, π₁` of `ℤ/p ⊗ᴸ ℤ/p` are `ℤ/p`; `Ext¹_ℤ(ℤ/p, ℤ/p) = ℤ/p` | sound |
| 2.5 classical prestacks (sample) | `(Bℤ/2)^♮(ℝ)`; `ℝ × ℝ`; `Spec k[ε]` | two components (`H¹(ℝ, ℤ/2) = ℤ/2`), `π₁ = ℤ/2`; `π₁ = (ℤ/2)²`; identity and `ε ↦ 0` agree on field points; variance: `CoGrothendieck` over `CommRingCatᵒᵖ`, right fibration, straightens to a functor on `CRing` | sound |
| 3.2 flat hyperdescent (headline) | `A → A`; `ℤ → 𝔽_p` | constant nerve; `ℚ ⊗ᴸ 𝔽_p = 0`, not conservative | sound |
| 3.3 sheafification, Čech descent (sample, headline) | `∅ → Spec 0`; `Spec 𝔽_p → Spec ℤ` in both contexts; arbitrary X in (c) | `0 = 0`; classical nerve constant, `Tot = D∞(𝔽_p)`, animated terms `𝔽_p^{⊗ᴸ(n+1)}`, both kill ℚ; `|U_•| → X` a monomorphism, locally surjective, so L inverts it | sound |
| 3.4 route (R01) | doubled plane, `R = k[x,y,a,b]/(ax+by−1)` | fibre over f two points (U, U′ incomparable), contractible over `D(x)`, `D(y)` | sound; citation missing (R01) |
| 4.1 colimit presentation (R01) | `f = id`; `Spec B → Spec A` | `colim_{Pts(X)^op} Spec A = X`; `colim` over `T_{A/}` with initial object gives `Spec B` | sound; citation missing (R01) |
| 4.2 pushforward (sample, headline) | `Spec R[t] → Spec R`; classical `Spec 𝔽_p → Spec ℤ` twice; classical flat f, arbitrary g | `R[t]`, base change `R′[t]`; `𝔽_p ⊗ᴸ 𝔽_p` against `𝔽_p`; fibre over a point of X′ is `Spec(A′ ⊗_A f_η)`, flat over A′, so the pointwise formula applies | sound |
| 5.1 affine comparison (sample) | `ℤ → 𝔽_p` on `ℤ/p`; `(ℤ/2)~ ⊗ᴸ (ℤ/2)~` | cohomology `𝔽_p` in degrees 0, −1; `(ℤ/2)~` in degrees 0, −1 | sound |
| 5.2 Zariski descent of `Dqc` (sample) | `τ^{≥−m}K` on an affine; `⨿_ℕ ℙ¹`; `j_!O` on a DVR | `H^q` constant for `q ≥ −m`, surjective transitions, `K ≃ Rlim` (Stacks 08D3, 0A0J); product; stalk 0 at the closed point, not quasi-coherent | sound |
| 5.3 schemes (headline) | `⨿_ℕ Spec ℤ`; `ℙ¹` | `∏_ℕ D∞(ℤ)` on both sides; `H¹(O(−2)) = k·t⁻¹` | sound |
| 6.1 pointwise properties (sample) | truncatedness; `⊕_ℕ O`; fpqc-local equivalence `Y → X` | `𝔽_p ↦ 𝔽_p ⊗ᴸ 𝔽_p`, `π₁ ≠ 0`; flat, `π₀` not finitely generated; points of X lift to Y on a cover, P descends along `R → ∏R_i` | sound; locator (R02) |
| 6.2(a) t-structure (sample) | colimit in sheaves; `Spec A` | connectivity tested on the `X_j` after a cover; heart `ModuleCat (π₀A)` | sound; citation missing (R01) |
| 6.2(b) geometric (sample) | `BG_m`; doubled plane; coconnectivity | `ℤ[t^{±1}]`-comodules = graded groups; diagonal over `U × U′` is `𝔸² ∖ 0`, atlas base change `U ⊔ (𝔸² ∖ 0) → U`; terms of the `Δ_s`-limit are flat pullbacks of the 0th, so coconnective iff `p^*F` is | sound |
| 6.3 perfect = dualizable (sample, headline) | `O[1]`; `O²` over a field; `ℤ/p`; `B(ℤ/p) × Spec 𝔽_p` | inverse `O[−1]`; rank 4 → 1; dual not connective; unit dualizable, `Hⁱ = 𝔽_p` for all i | sound |
| 7.1 atlas surjective for every G (changed) | `G = 1`; `R = 0`; G with `O(G) = ℤ × 𝔽_ℓ` | identity; empty cover, lifts vacuous; `X ×_{[X/G]} Spec R_i = (G ×_S X) ×_X Spec R_i = G ×_S Spec R_i`, split by the unit | holds |
| 7.1 affine diagonal for non-flat G | G as above, points a, b of BG | on a cover both lift, fibre `G_{R_i}`, affine and discrete; the algebra descends along `R → ∏R_i` (3.2) | holds |
| 7.1 flat G ⇒ flat atlas (changed) | `G_m`; `O(G) = ℤ × 𝔽_ℓ`; `X = Spec 0` | `ℤ[t^{±1}]` free; `Tor₁^ℤ(𝔽_ℓ, 𝔽_ℓ) = 𝔽_ℓ`, not flat; atlas the identity of `Spec 0`, flat with G not flat, so only sufficiency holds, as stated | holds |
| 7.1 new Check, group law | identity; `e = e′`; `ℓ = 2` | `(0,1) ↦ 0` factors through the ℤ factor; `2e − 2e² = 0`; `ℓ(e + e′ − 2ee′) = 0` | closed subgroup |
| 7.3 fixed points (sample, headline) | Γ trivial; ℤ trivial on `Spec C`; `σ(x) = 2x`; coconnectivity | `QCoh(X)`; `H¹(ℤ; C) = C` against 0; `id(x·1) = x ≠ 2x`; `Map(M[1], UF) = Map(⊕_γ γ^*M[1], F)` with the sum connective | sound |
| 8.2 perfect stacks (headline) | `⨿_ℕ Spec ℤ`; both directions | `Hom(O, ⊕O_i) = ∏ℤ ≠ ⊕ℤ`; compact objects of `Ind(Perf)` are retracts of `Perf`, which is idempotent complete | sound |
| 8.4 and 8.5 (headlines) | `BG_m`/ℚ, `M = O[1]`; `S₃`/`𝔽₃` | `π₀ = 0`, `π₁ = ℚ`; `H¹ = H² = 0` with trivial coefficients, coinduced witness of dimension 2 with `Hⁱ = 𝔽₃` | sound, conditional on the gaps |
| gap:twist-quasiprojective | P trivial; `G = 1`; `ℤ/2`, `P = Spec ℚ(i)` | `X_R` with pulled-back L; `X_R`; twist of `ℙ¹` has descent lattice `ℚe₁ ⊕ ℚ·ie₂` | precise, one sentence, not provided |
| gap:chevalley-quasiprojective-quotient | `H = GL_n`; `H = 1` | a point; `GL_n`, affine | precise, one sentence, not provided |

### Sources: the seeded sample

No locator is flagged unverified in the plan (a script found no such field or word). Every sampled target was read at its locators.

| Target | Locators read | Result |
| --- | --- | --- |
| 1.1 | SAG lines 17835–17852 (Definition 6.2.2.1, Remark 6.2.2.2, pp. 490–491); HA line 46757 (Proposition 7.1.3.18, p. 1219) | match |
| 1.4 | HA lines 48274 (p. 1260), 48281, 48357 (pp. 1261, 1263), 48424–48432 (p. 1265), 48556 (p. 1268); SAG lines 10004–10009 (p. 277), 10022 (p. 278), 17974–17986 (pp. 494–495); BZFN line 830 (p. 17) | match |
| 1.5 | HA lines 26640–26646 (Corollary 4.7.4.18, p. 699), 23655–23660 (p. 620), 26834–26875 (pp. 704–705), 31630 (p. 835); HTT lines 5731 (PDF p. 134), 7312 (PDF p. 169); SAG line 10219 (p. 283) | match |
| 2.1 | SAG lines 17853, 17867 (p. 491) | match |
| 2.2 | SAG lines 17835–17844, 17859, 18068 (pp. 490–491, 497); GR-I lines 7354–7371 (printed pp. 144–145) | match |
| 2.3 | SAG lines 17905–17914 (pp. 492–493), 17758 (p. 488); GR-I lines 7322, 8013 (printed pp. 143, 159) | match |
| 2.5 | HTT lines 3037–3039 (Proposition 2.1.1.3, PDF p. 75), 2081 (Proposition 1.2.5.1, PDF p. 53) | match; the source states the cofibred form, the README uses the dual and says so |
| 3.3 | SAG lines 17889–17903 (p. 492); GR-I lines 7458–7477 (printed p. 147) | match |
| 4.2 | SAG lines 18368 (p. 505), 18458 (p. 507); GR-I line 7740 (printed p. 153) | match |
| 5.1 | Stacks line 145 (06Z0); SAG lines 7269 (p. 202), 17859 (p. 491) | match |
| 5.2 | Stacks lines 86, 102 (0A0J, 08D3) | match |
| 6.1 | SAG lines 17990–18016 (p. 495), 9916–9930 (p. 275) | match, except the locator of R02 |
| 6.2 | SAG lines 18017–18030 (pp. 495–496), 26462, 26667–26696 (pp. 733–734); GR-I lines 7581, 7600 (printed pp. 149, 150) | match |
| 6.3 | SAG lines 18072–18090 (p. 497), 10219 (p. 283); HA line 23655 (p. 620); GR-I lines 8194–8210 (printed p. 163) | match |
| 7.3 | GR-I line 7463 (Corollary 1.3.8, printed p. 147) | match |

Every cited work is in the manifest (nine entries, all `certified`). No source was fetched and no reference request was written.

### Pins, suppliers and ownership

Lean elaboration: not available (this lane does not elaborate). The design has no `Suggested.lean`, so there is nothing to probe or compare.

Library declarations opened at the pins, at the file and line the README gives:

- `SSet.Quasicategory` (Quasicategory/Basic.lean:41), `SSet.KanComplex` (KanComplex.lean:40), `CategoryTheory.nerve` (Nerve.lean:37) and its instance (Quasicategory/Nerve.lean:32).
- `AlgebraicGeometry.Spec`, `Scheme.Spec` (Scheme.lean:466, 494), `fpqcPrecoverage`, `fpqcTopology` (Sites/Fpqc.lean:61, 76).
- `Module.Flat` (Flat/Basic.lean:114), `Module.FaithfullyFlat` (FaithfullyFlat/Basic.lean:64).
- `DerivedCategory` (Basic.lean:87), `DerivedCategory.TStructure.t` (TStructure.lean:33).
- `Pseudofunctor.IsStack` (IsStack.lean:49), `DescentData` (DescentData.lean:59), `CoGrothendieck` (Bicategory/Grothendieck.lean:235, for a contravariant pseudofunctor).
- `groupCohomology` (Basic.lean:183), `Rep.coind` (Coinduced.lean:120), `groupCohomology.coindIso` (Shapiro.lean:58), `groupCohomologyIsoEven`, `groupCohomologyIsoOdd` (FiniteCyclic.lean:80, 114), `exists_prime_orderOf_dvd_card` (Cycle/Type.lean:491, `[Fintype G]`).
- Tau Ceti `exists_isClosedImmersion_generalLinear` (TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212; `k : Type u`, `[Field k]`, `[LocallyOfFiniteType G.obj.X.hom]`).

Supplier citations resolved this round:

- EnhancedDerivedSheaves on main: all 69 backticked names of the contract and 23 section labels found by script. E0.5, E0.7 and E3.1 were read in full: straightening over arbitrary small bases, coCartesian sections as limits, Kan extensions with no smallness hypothesis.
- SchemeAndStackFoundations on main: all 34 names found; headings §§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18 present. DerivedModuleAlgebra §0.2 and §1.E.0 present. ReductiveGroups Layers 1, 3 and 6 present (lines 1275, 1537, 2448).
- InfinityCategoryTheory family at its open head: all 19 labelled statements found with the cited content (InfinityTopoi 3.1.2, 3.3.2, 3.5.1, 4.4.1; HypercompletenessAndCoherence 2.4.1, 2.5.1, 2.5.2, 6.1.1; PresheavesAndCompletions 1.4.3; LimitsAndKanExtensions 9.1.2; PresentableInfinityCategories 4.4.2; DerivedInfinityCategories 5.5.2; StableInfinityCategories 11.1.1; InfinityCategoryFoundations 5.1.1; CartesianFibrations 1.3.1, 2.1.1, 2.2.1, 5.5.3).
- PrismaticCohomologyPartII §4.0 at its head: all 17 cited names at lines 711–732. LanglandsParameterStacks §§1.7, 1.8 (lines 380, 390). HabiroCohomologyFoundations §§1.27, 1.28 (line 807). AnalyticStacks §§1.1–1.2 (lines 393, 414), the consumer, is later in the merge order.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The nine leads of `scratch/citations.md` are suppliers' names, each found above.

`scratch/overlaps.md` and a fresh `roadmaps overlaps` list no competing pull request, no dropped id, no id defined only by a revision and no second copy.

Ownership, searched by object at the open heads and on main:

- "perfect stack": no other roadmap. `Ind(Perf(` occurs only for rings, in GeometryOfNumbersAndQuadraticArithmetic and RefinedTraceMethods.
- Quasi-projective `G/H`: the open roadmap GroupSchemesOverABase §4.1 states that `G/H` is quasi-projective for G of finite type over a field, and says that for affine G the quotient is ReductiveGroups Layer 3's. It does not state the `GL_n`-equivariant immersion into a projectivized representation. So the gap asks for more than is planned anywhere, and its supplier agrees with that roadmap's own attribution.
- ReductiveGroups on main has no statement of the gap ("quasi-projective" occurs once, line 1915, in another context). SchemeAndStackFoundations §1.16 states `contractedProduct_isAlgebraicSpace` only.
- Ownership against pull requests outside the tools' index was not checked.

Overlap check: read EnhancedDerivedSheaves (main), SchemeAndStackFoundations (main), AnalyticStacks, InfinityTopoi and HypercompletenessAndCoherence of the InfinityCategoryTheory family; shared objects: `Mod_R(D(ℤ))` on animated rings — owner EnhancedDerivedSheaves E5:animation.4, cited by both; general ∞-category and ∞-topos theory — owner the InfinityCategoryTheory family, cited (R01 adds sections); abelian `QCoh` on stacks and `DQCoh` — owner SchemeAndStackFoundations, cited.

### Dependency gate and the declared gaps

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The plan has 33 targets, each with 3 to 6 tests. Its `target:` prerequisites all point to earlier targets, and 7.1's new edges to 6.1 and 6.2 point downward (6.2 needs nothing of Layer 7).

- `gap:twist-quasiprojective`: same slug in the README (line 135) and the plan; supplier SchemeAndStackFoundations §1.16; one `needs` sentence with all hypotheses; not provided on main.
- `gap:chevalley-quasiprojective-quotient`: same slug in the README (line 178) and the plan; supplier ReductiveGroups Layer 3; one `needs` sentence; not provided on main or at an open head.

### Shape, principles, headlines

- The README has the required parts in order. Every definition has API prose and at least three Checks, every theorem a locator, every layer Examples and Dependencies.
- Regex scan: no LaTeX delimiters, process words, pull-request numbers, machine paths, HTML anchors or `set_option`; "lemma" occurs only in "Shapiro's lemma" and in source locators.
- No algorithm, no sorry'd data, no route-specific shortcut. The README does not say it follows a source, and no layer is named after a source's chapter.
- Headline theorems (from the Summary): flat hyperdescent (3.2) with sheafification invariance and Čech descent (3.3); affine pushforward with base change and projection formula (4.2); `QCoh(h_X) ≃ Dqc(X)` (5.3); the t-structure and perfect = dualizable (6.2–6.3); `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` (7.3); perfect stacks and permanence (8.2–8.3); characteristic-zero quotients (8.4); the non-compact unit in characteristic p (8.5). None is statable at the pins without the suppliers' ∞-categorical carriers; the package stage decides the Lean file.

Source independence: 16 passages compared with 6 sources (SAG lines 10004, 17889, 17905, 17990, 18072, 26690, 79403; HA lines 23655, 26863, 48428; GR-I lines 7365, 7463; Stacks line 102; BZFN lines 834, 970; HTT line 3037), none shared beyond what a statement forces (at most nine consecutive words, in the criterion of 8.2 against BZFN line 972); largest share SAG, 45 of 145 locators; contents compared with SAG §§6.2.1–6.2.6, 6.3 and 9.1: independent. Layer 1 draws on HA. Layer 2 joins SAG 6.2.2 with parts of 6.2.3 and 6.2.6 and its own 2.4–2.5. Layer 4 (SAG 6.3) precedes Layer 5 (SAG 6.2.4) because 5.4 needs 4.2. Layer 6 joins 6.2.5, 6.2.6 and 9.1. Layers 7–8 have no SAG counterpart.

## Not verifiable

- Lean elaboration and the one-tactic probe: not available in this lane, and the design has no `Suggested.lean`.
- The two gaps are declared contracts: their statements were checked, not their future proofs.
- Suppliers still in pull requests (PrismaticCohomologyPartII, LanglandsParameterStacks, HabiroCohomologyFoundations, the InfinityCategoryTheory family) were read at the heads of the index of 2026-11-15; they can move before they merge.
- Targets outside this round's sample whose text no repair touched (1.2, 1.3, 2.4, 3.4, 4.1, 5.3, 5.4, 6.4, 7.2, 7.4, 8.1–8.5) were read in full but their source locators were not reopened; for them I rely on the round-10 rows that carry computed values and line numbers.

## Source issues

- none

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0cacf8d26a691123589d3d0aeef9cad55be60fe3", "job": "REV-DESIGN-QuasicoherentSheavesOnPrestacks~11", "model": "fable", "worker": "chris-x79"} -->
