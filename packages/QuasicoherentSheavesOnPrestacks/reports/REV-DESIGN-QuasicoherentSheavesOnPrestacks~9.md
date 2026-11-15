<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16366#issuecomment-6897556444 -->
Review (claude) of 7a7aecc

Verdict: needs_changes

1. **F01** (P3) "small" has two universe meanings in Layers 2 and 3

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, 2.3 (line 362), 2.4 (lines 377–379), 2.1 (line 326), 3.1 (line 434), 3.3(b) (line 469). Quote, 2.3: "QCoh carries small colimits of prestacks to limits; every `QCoh(X)` is stable and admits small colimits".

   **Claim:** "small" is one notion, so that 2.3 supplies what 2.4 and 4.2 take from it.

   **Witness:** 2.4's route applies 2.3 to `X = colim_{Pts(X)^op} Spec A`, a (u+1)-small colimit; for `X = ⨿_K Spec ℤ`, K a set of universe u+1 that is not u-small, `Pts(X)` is not u-small. Yet `Mod_ℤ` has only u-small colimits. The Conventions define u-small and (u+1)-small, never "small".

   **Exact repair:** In Conventions (Universes) add: "Unqualified 'small' means u-small for limits and colimits inside `Mod_A` and `QCoh(X)`; limits and colimits of prestacks and of fpqc sheaves, and limits in `Ĉat∞`, are (u+1)-small." Then write "(u+1)-small" at the five places: "(u+1)-small limits and colimits in `PreStk_T`" (2.1), "carries (u+1)-small colimits of prestacks to limits" (2.3), "`u_!` preserves (u+1)-small colimits" (2.4), "an ∞-category with (u+1)-small limits" (3.1), "(u+1)-small colimits of sheaves" (3.3(b)); mirror in the plan statements of 2.1, 2.3, 2.4, 3.1, 3.3. Tested on the witness: `QCoh(⨿_K Spec ℤ) = ∏_K D∞(ℤ)` is then covered by 2.3, a (u+1)-small limit in `Ĉat∞`, and each factor still has exactly its u-small colimits; the route of 2.4 over `Pts(X)^op` is covered.

2. **F02** (P3) the quasi-affine clause of 6.2(b) uses an atlas and a diagonal the README does not define

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, 6.2(b) (line 640). Quote: "In the classical context the same holds when the diagonal is quasi-affine instead of affine".

   **Claim:** "The same" applies with the atlas as defined just before: "a faithfully flat map `p : Spec A → X`, that is a flat affine map … that is an fpqc surjection".

   **Witness:** The plane Z with doubled origin over a field, charts U, U′: the diagonal over `U × U′` is `𝔸² ∖ 0`, quasi-affine and not affine; the base change of `p : U ⊔ U′ → h_Z` along U is `U ⊔ (𝔸² ∖ 0) → U`, not affine. No flat affine atlas is given, and "quasi-affine" for a map of prestacks is defined nowhere (4.1 defines affine only).

   **Exact repair:** Replace the clause by: "In the classical context the same holds for a hypercomplete fpqc sheaf X whose diagonal is representable by quasi-affine schemes (every base change of `X → X × X` along a point is the classical prestack of a quasi-affine scheme) and which admits an fpqc surjection `p : Spec A → X` every base change of which along a point `Spec R → X` is the classical prestack of a quasi-affine scheme flat over R." Mirror in the plan statement of 6.2. Tested on the witness: `h_Z` satisfies the repaired hypothesis with `p : U ⊔ U′ → h_Z`, and the conclusion holds there by 5.3 (connectivity in `Dqc(Z)` is tested on the two charts); the unrepaired atlas condition fails on it.

Both findings of the previous review are repaired. This round finds no P1 or P2 and two P3 findings (R01, R02), each with a repair to apply, so it asks for changes. The two declared supplier gaps, `gap:chevalley-quasiprojective-quotient` (ReductiveGroups Layer 3) and `gap:twist-quasiprojective` (SchemeAndStackFoundations §1.16), are precise, minimal and declared in both files; they are not findings. No maintainer notes were supplied. The design, the plan and the manifest were not changed by this review.

## Verified sound

### Findings of the previous review

| Finding | Status | Repaired passage, and what I checked |
| --- | --- | --- |
| F01 (P3) 6.3 rested on 7.2 and 7.3 | repaired | 6.3 (line 655) ends "Descent of `Perf` along Čech nerves of faithfully flat maps of animated rings is LanglandsParameterStacks §1.7. The statements here extend these imports to every prestack and every context." Its *Needs* (line 666) and the Layer 6 Dependencies (line 689) cite §1.7 only. 7.2 (line 715): "The perfect objects (6.3) of `QCoh([X/G])` are its chartwise dualizable objects, which is how §1.8 defines `Perf` on its stacks". 7.3 (line 731): "its heart, vector bundles and perfect complexes (6.2(a), 6.3) are those of its §1.28". *Needs* of 7.2: 1.5, 2.3, 3.3, 6.1, 6.3, 7.1; of 7.3: 2.3, 3.3, 6.1, 6.2, 6.3, 7.1. Script comparison of all 33 targets: README *Needs* equal the plan's `target:` prerequisites, and no prerequisite is at or after its own target. |
| F02 (P3) universe of `Ĉat∞` | repaired | Conventions (line 54): "`Ĉat∞` is the ∞-category of (u+1)-small ∞-categories, EnhancedDerivedSheaves' `Cat∞` (E0.5) formed in the universe u+1; it has all (u+1)-small limits." 1.5 (line 291) indexes by "a (u+1)-small ∞-category K". EnhancedDerivedSheaves on main, README line 59: `Cat∞` is "small quasicategories". The same pattern remains for the word "small" (R01). |

No finding of the repair report is marked "not actionable", so nothing is re-raised. Repaired patterns searched in the rest of the design: no other forward reference to a later target in a statement or *Needs* line (script); universe wording: R01.

### Adversarial pass

Values computed by hand this round. Rows cover the passages the repair changed, the fifteen sampled targets, the headline theorems and both findings. For targets whose text no repair touched and whose rows in the previous review carry computed values (1.1–1.5, 3.2, 4.2, 5.1, 5.3, 6.2, 8.2, 8.4), I rechecked one instance each and otherwise rely on those rows.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, `Ĉat∞` (changed) | `Mod_ℤ`; `QCoh(∅)`; `PreStk_T`; `CommRingCat` nerve | objects of `Mod_ℤ`: a (u+1)-set, homs u-small; limit over empty `Pts(∅)`: terminal; constant prestacks on `Ŝ`: a (u+2)-set of objects; nerve of `CommRingCat.{u}` lies in `SSet.{u+1}` | as stated |
| 1.5(a), (u+1)-small K (changed) | `K = ∅`, `Δ`, `Pts(X)`, BΓ | terminal category, identity adjoint; u-small; (u+1)-small; u-small | every use in Layers 2–8 fits |
| 7.2, perfect = chartwise dualizable (new) | `G = S` trivial; translation of G on itself; `X = ∅`; `BG_m`/ℤ; `B(ℤ/p)`/`𝔽_p` | constant bar construction, `Perf = Perf(X)`; term on G is `π^*M`, and `M = e^*π^*M`, so both dualizable together; zero category; graded object with perfect underlying sum has finitely many weights; unit has chart term `𝔽_p`, dualizable | holds |
| 7.2 Check, free translation quotient (new) | Ĥ over Λ, `M = Λ`, `M = ⊕_ℕ Λ` | chart term `O(Ĥ)`, perfect; `⊕_ℕ O(Ĥ)` not perfect and `Λ → O(Ĥ)` faithfully flat (unit section), so `⊕_ℕ Λ` not perfect; equals `Perf(Λ)` | holds, agrees with LanglandsParameterStacks §1.8 |
| 7.3, heart of the lattice quotient (new) | `d = 0`; ℤ trivial on `Spec ℚ`; `C = ℚ[x^{±1}]`, `σ(x) = 2x` | `D∞(C)`, heart C-modules; pairs (V, automorphism): `Map(G, F) = Map(UG, UF)^{hℤ}` contractible when UF coconnective, and `U(Ind M) = ⊕_ℤ M` connective, so coconnectivity is read on U in both directions; `id(x·1) = x ≠ 2x` | holds |
| 7.3, vector bundles and perfect objects (new) | zero module; `Ind(C) = ⊕_{n∈ℤ} C` at `q = 1` | rank 0, perfect, in the heart; underlying module free of infinite rank, not perfect | holds, agrees with HabiroCohomologyFoundations §1.28 |
| 7.3, point lifting (new) | value at A | `π₀(Map_T(C, A)_{hℤ^d}) = π₀Map_T(C, A)/ℤ^d`, a quotient | every point lifts |
| 6.3 (shortened) | `O[1]`; `O²` over a field; `ℤ/p` on `Spec ℤ` | inverse `O[−1]`; evaluation of rank 4 → 1, not invertible; dual `ℤ/p[−1]` not connective | holds; no use of Layer 7 left |
| 2.1 points | `Spec 0` against ∅ at the zero ring; `Pts(Spec A)`; BΓ | `∗` against ∅; initial object `(A, id)`; `π₁ = Γ` | sound |
| 2.2 `QCoh` (headline definition) | ∅; `Spec A ⊔ Spec B`; `B(ℤ/2) × Spec 𝔽₂` | zero category; `Mod_A × Mod_B`; `π₀Map(O, O[1]) = H¹(ℤ/2; 𝔽₂) = 𝔽₂`, each evaluation in `π₋₁A = 0` | sound |
| 2.3 colimits to limits | `⨿_K Spec ℤ`, K not u-small | `∏_K D∞(ℤ)`: a (u+1)-small product, each factor with u-small colimits only | true; wording R01 |
| 2.4 change of test rings | `Spec R`; ∅; `Y = Spec(𝔽_p ⊗ᴸ 𝔽_p)` | `Spec u(R)`; ∅; `(ι^*Y)(R) = Hom(𝔽_p, R)`, so `ι^*Y = Spec 𝔽_p`, unit loses `π₁ = 𝔽_p` | sound; route uses a `Pts(X)`-indexed colimit (R01) |
| 2.5 classical prestacks | `Spec k[ε]`; `B(ℤ/2)` at ℝ, at `ℝ × ℝ`, at a strictly henselian local ring | identity and `ε ↦ 0` agree on every field point; `ℝ^×/ℝ^{×2}` has 2 classes, `π₁ = ℤ/2`; `(ℤ/2)²`; one class, `π₁ = ℤ/2` | sound |
| 3.1 fpqc covers, hypercovers | empty family; `ℤ → ℤ[1/2] × ℤ[1/3]`; `ℤ → ℚ`; Čech nerve at `n = 1` | covers A iff `A → 0` faithfully flat iff `A = 0`; primes (2) under `ℤ[1/3]`, (3) under `ℤ[1/2]`; `ℚ ⊗ ℤ/p = 0`; `L₁ = B ⊗_A B → B ⊗_A B` an isomorphism | sound |
| 3.2 flat hyperdescent (headline) | `A → A`; `ℤ → 𝔽_p` | constant totalization `Mod_A`; ℚ sent to 0, not conservative, not a cover | sound |
| 3.3 sheafification, Čech descent (headline) | `∅ → Spec 0`; `Spec A ⊔ Spec B → Spec(A × B)`; `Spec 𝔽_p → Spec ℤ` in `CRing` and `AnRing` | `0 = 0`; `Mod_A × Mod_B`; constant nerve gives `D∞(𝔽_p)`, derived nerve kills ℚ: not `D∞(ℤ)` either way | sound |
| 3.4 Zariski gluing | ∅; `ℙ¹`, `O(−2)`; doubled plane | only affine open is `Spec 0`, limit `Mod_0 = 0`; cokernel of `k[t] ⊕ k[t⁻¹] → k[t^{±1}]` twisted by `t⁻²` is `k·t⁻¹`; fibre over `𝔸² ∖ 0` is `{U, U′}`, contractible over `D(x)`, `D(y)` | sound |
| 4.1 affine morphisms | `𝔸² ∖ 0 → 𝔸²`; `Spec k → BG`, `BG → Spec k`; `G = 1` | base change along the identity not affine; fibre a torsor, affine; `G(O(G)) ∋ id ≠ 1` unless `O(G) = k`, while `Map(B, A)` is discrete for discrete A; both identities | sound |
| 4.2 pushforward (headline) | `Spec R[t] → Spec R`; classical `Spec 𝔽_p → Spec ℤ` twice | `R[t]`, base change `R′[t]`; `𝔽_p` against `𝔽_p ⊗ᴸ 𝔽_p` | sound; flatness needed classically |
| 5.2 Zariski descent of `Dqc` | tower `τ^{≥−m}K` on an affine; `j_!O` on a DVR | `H^q` constant for `q ≥ −m`, `K ≃ Rlim` (Stacks 08D3); stalks K and 0, not quasi-coherent | sound |
| 5.3 schemes (headline) | `⨿_ℕ Spec ℤ`; `ℙ¹` | `∏_ℕ D∞(ℤ)` on both sides; `H¹(O(−2)) = k` | sound |
| 6.2(b) quasi-affine clause | doubled plane, atlas `U ⊔ U′` | atlas base change `U ⊔ (𝔸² ∖ 0) → U`, not affine | true by 5.3; wording R02 |
| 6.4 almost perfect | k over `k[ε]/ε²`; `⊕_ℕ O` on `Spec ℤ`; k over `k[x₁, …]` | `Tor_i = k` for all i, `π₀` finitely presented; `π₀ = ⊕_ℕ ℤ` not finitely generated; maximal ideal not finitely generated | sound |
| 7.1 groups, actions | `[∅/1]`; translation; `Spec 𝔽₂` as absolute group; G not flat | `L∅ = Spec 0`; split Čech nerve, realization S; `Hom(𝔽₂, ℤ) = ∅`; `X ×_{[X/G]} X = L(G ×_S X) = G ×_S X`, affine | sound |
| 7.3 fixed points (headline) | Γ trivial; ℤ trivial on `Spec C` | `QCoh(X)`; `H¹(ℤ; C) = C` against 0 on the coarse quotient | sound |
| 7.4 classical quotient stacks | `G = 1`; `G_m`/ℤ; `ℤ/p`/`𝔽_p`; atlas f in (d) | constant bar construction, 5.3; graded abelian groups; `Hⁱ = 𝔽_p` for all i; `Hom(F′, f_*I[n]) = Hom(f^*F′, I[n]) = 0` for `n > 0`, f flat | sound |
| 8.2 perfect stacks (headline) | `⨿_ℕ Spec ℤ`; `Spec 𝔽₂` | `Hom(O, ⊕O_i) = ∏ℤ` against `colim = ⊕ℤ`; `Map(O, 0 ⊕ 0)` one point against two | sound |
| 8.3 permanence (headline) | doubled line; `A = k[ε]/ε²` | two sections with affine non-vanishing loci the charts, no ample member (not separated); `I/I² = Ω¹_{A/ℤ} ↠ Ω¹_{A/k} ≠ 0`, diagonal not flat | sound |
| 8.4 characteristic zero (headline) | `BG_m`/ℚ, `M = O[1]`; `G = ℤ/2`, `P = Spec ℚ(i)`, `X = ℙ¹` | `Map(ℚ, O[1]) = K(ℚ, 1)`, `π₀ = 0`; invariants `ℚe₁ ⊕ ℚ·ie₂`, twist `ℙ¹_ℚ` | sound, conditional on the gaps |
| 8.5 characteristic p (headline) | `ℤ/p`/`𝔽_p`; `S₃`/`𝔽₃`; Γ trivial | norm `= p = 0` and `g − 1 = 0` on k, `Hⁱ = k`; `H¹ = Hom(S₃, 𝔽₃) = 0`, `H² = (𝔽₃)^{−1} = 0`, coinduced witness of dimension 2 with `Hⁱ = 𝔽₃`; `colim_N ∏_{i≤N} k = ⊕k ≠ ∏k` | sound |
| gap:twist-quasiprojective | P trivial; `G = 1` | `X_R` with the pulled-back L; `X_R` | precise, one sentence, not provided elsewhere |
| gap:chevalley-quasiprojective-quotient | `H = GL_n`; `H = 1` | a point; `GL_n`, affine | precise, one sentence, not provided elsewhere |

### Sources: the seeded sample

No locator is flagged unverified in the plan. Every sampled target was read at its locators in the cached texts.

| Target | Locators read | Result |
| --- | --- | --- |
| 2.1 | SAG lines 17853, 17867 (Notation 6.2.2.3, Remark 6.2.2.7, p. 491) | match |
| 2.2 | SAG lines 17835 (p. 490), 17859, 18068 (p. 497); GR-I Chapter I.3 §1.1 | match |
| 2.4 | SAG line 17845 (Remark 6.2.2.2, p. 491); GR-I lines 7385–7407 (Lemmas 1.2.2, 1.2.4) | match |
| 2.5 | HTT lines 2081 (Proposition 1.2.5.1, PDF p. 53), 3037 (Proposition 2.1.1.3, PDF p. 75) | match |
| 3.1 | SAG lines 79377–79382 (Remark D.6.1.1, pp. 2173–2174), 79403–79409 (Definition D.6.1.4, p. 2174), 4184–4196 (Proposition 1.3.1.7, p. 117) | match |
| 3.3 | SAG lines 17889–17903 (Proposition 6.2.3.1, Remarks 6.2.3.2–6.2.3.3, p. 492); GR-I lines 7458–7477 (Corollaries 1.3.7, 1.3.8, 1.3.11, printed p. 147) | match |
| 3.4 | GR-I line 7572 (Proposition 1.4.4, printed p. 149); SAG lines 17912–17914 (Proposition 6.2.3.4(3), p. 493); HTT lines 31671, 31680, 31693 (PDF p. 698) | match; SAG states (3) for sheaves, the README for hypercomplete sheaves through its own 3.3(b) |
| 4.1 | SAG lines 18224–18236 (§6.3.2, Definition 6.3.2.1, pp. 501–502) | match |
| 5.2 | Stacks lines 86, 102 (0A0J, 08D3) | match |
| 6.3 | SAG lines 18072, 18088 (p. 497), 10219 (p. 283); HA line 23655 (p. 620); GR-I lines 8201, 8209 | match |
| 6.4 | SAG lines 26798–26802 (Proposition 9.1.5.1, p. 736); HA lines 48432–48441 (7.2.4.11, p. 1265), 48556 (7.2.4.17, p. 1268, left coherent); Stacks line 1059 (08E8, Noetherian) | match |
| 7.1 | HTT lines 25224 (Definition 6.1.2.7, PDF p. 559), 24717 (Theorem 6.1.0.6, PDF p. 547), 25589 (6.1.3.10, PDF p. 566), 25890 (6.1.3.19, PDF p. 573) | match |
| 7.4 | GR-I lines 7872–7899 (Proposition 2.4.3, Lemma 2.4.5, printed p. 156); SAG lines 33959–33968 (Corollary 10.4.6.8, Warning 10.4.6.9, p. 930); HNR line 807 (Theorem C.1, p. 16); HA line 3703 (Theorem 1.3.3.2, p. 97) | match; GR-I assumes characteristic zero, the README proves over a ring by its own route, as its References say |
| 8.3 | BZFN lines 1196–1212 (pp. 24); Stacks line 1897 (0BQR) | match |
| 8.5 | HR-perf lines 26–29 (Introduction, p. 1); HNR line 45 (Theorem 1.1, p. 1) | match |

Every cited work is in the manifest (nine entries, all `certified`). No text was missing; no reference request was written; the manifest is unchanged.

### Pins, suppliers and ownership

Lean elaboration: not available (this lane does not elaborate). The design has no `Suggested.lean`, so there are no sorried declarations to probe and no signatures to compare.

Pinned declarations opened at the pins of `lake-manifest.json`, each at its cited file and line: `SSet.Quasicategory` (Quasicategory/Basic.lean:41), `SSet.KanComplex` (KanComplex.lean:40), `CategoryTheory.nerve` (Nerve.lean:37) with its instance (Quasicategory/Nerve.lean:32), `AlgebraicGeometry.Spec` and `Scheme.Spec` (Scheme.lean:466, 494), `fpqcPrecoverage` and `fpqcTopology` (Sites/Fpqc.lean:61, 76; `propQCPrecoverage @Flat`, so quasi-compactness is a condition on the family, automatic for finite affine families), `Module.Flat` (Flat/Basic.lean:114), `Module.FaithfullyFlat` (FaithfullyFlat/Basic.lean:64), `DerivedCategory` (Basic.lean:87), `DerivedCategory.TStructure.t` (TStructure.lean:33), `Pseudofunctor.IsStack` (IsStack.lean:49), `DescentData` (DescentData.lean:59), `CoGrothendieck` (Bicategory/Grothendieck.lean:235), `groupCohomology` (Basic.lean:183), `Rep.coind` (Coinduced.lean:120), `groupCohomology.coindIso` (Shapiro.lean:58, for a subgroup), `groupCohomologyIsoEven` and `groupCohomologyIsoOdd` (FiniteCyclic.lean:80, 114), `exists_prime_orderOf_dvd_card` (Cycle/Type.lean:491, `Fintype`), `Functor.IsFibered` (FiberedCategory/Fibered.lean:65), and Tau Ceti `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` (TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212, in `namespace TauCeti.AffineGroupSchemeCat`, a field k, `LocallyOfFiniteType`, one universe). Mathlib has no Kan-complex instance for the nerve of a groupoid (search for `KanComplex` instances), as the README says.

The nine leads of `scratch/citations.md` are supplier names, not library names; each resolves in its supplier's README on main: `Action.constantEquiv`, `GroupSpace.ofGroupScheme`, `Stack.stackification`, `StackInGroupoids.ofSheaf`, `Coherent.DQCoh`, `PseudoCoherence.IsPseudoCoherentComplex` (SchemeAndStackFoundations, lines 3192, 3198, 3553, 3543, 5105, 5032), `enhancedDerived.homotopyCategory` (EnhancedDerivedSheaves line 555), `DerivedDeRham.derivedTensor` (DerivedModuleAlgebra §0.2), `QCohPrestack.flatDescent` (PrismaticCohomologyPartII §4.0, line 723 at its head).

Supplier citations resolved this round:

- EnhancedDerivedSheaves on main: 17 names re-opened, among them `continuousDerivedInvariants`, `homotopyFixedPoints` (stated for finite G, as 7.3 says), `hypercompleteSpaceSheaves`, `tot_filteredColimit_of_bounded`, `descendableCover_zariski`, `indCompactComparison`, `presentable_limit_right`, `categoricalModuleBaseChange`; all found.
- SchemeAndStackFoundations on main: 21 names found; headings §§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18 at lines 2793–5030. §1.16 states `contractedProduct_isAlgebraicSpace` and no scheme or ampleness statement.
- ReductiveGroups on main: Layers 1, 3 ("subgroups, quotients, components") and 6 exist; no statement that `GL_n/H` is quasi-projective.
- DerivedModuleAlgebra §0.2 and §1.E.0 on main.
- PrismaticCohomologyPartII §4.0 at its head (heading line 709; all 16 cited names at lines 711–732). LanglandsParameterStacks §§1.7, 1.8 (lines 380, 390; §1.8 defines `Perf` "by chartwise dualizability"). HabiroCohomologyFoundations §§1.27, 1.28 (lines 807, 821; its Checks have the unit with `Γ_i = σ_i` and the non-perfect `C[ℤ]`).
- InfinityCategoryTheory family at its head: all 20 labelled statements found with the cited content (InfinityCategoryFoundations 5.1.1; CartesianFibrations 1.3.1, 2.1.1, 2.2.1, 5.5.3; PresheavesAndCompletions 1.4.3; LimitsAndKanExtensions 9.1.2; PresentableInfinityCategories 4.4.2; DerivedInfinityCategories 5.5.2; StableInfinityCategories 11.1.1, 11.3.2; InfinityTopoi 3.1.2, 3.3.2, 3.5.1, 4.4.1; HypercompletenessAndCoherence 2.4.1, 2.5.1, 2.5.2, 6.1.1).

`scratch/overlaps.md` lists no competing pull request, no dropped id, no id defined only by a revision and no second copy; `roadmaps overlaps` confirms that no roadmap of this name is on main or in an open pull request.

Ownership searched by object on main and at the open heads (`roadmaps grep`): "perfect stack" (no match), `Ind(Perf` (RefinedTraceMethods and GeometryOfNumbersAndQuadraticArithmetic, for `Ind(Perf(k))` of a ring only), flat hyperdescent (LanglandsParameterStacks §1.7, cited), `QCoh` as a right Kan extension (HabiroCohomologyFoundations §1.27 and AnalyticStacks, cited), quasi-projective `GL_n/H` (no statement), ample bundles on contracted products (no statement), t-structures on stacks with affine diagonal (no owner). The board index lists two unrelated packages (AnalyticNumberTheory, LawrenceVenkateshMethod). Ownership against pull requests outside the index was not checked.

Overlap check: read EnhancedDerivedSheaves (main), SchemeAndStackFoundations (main), AnalyticStacks, HypercompletenessAndCoherence with the InfinityCategoryTheory family; shared objects: `Mod_R(D(ℤ))` on animated rings — owner EnhancedDerivedSheaves E5:animation.4, cited by both; general ∞-category theory — owner the InfinityCategoryTheory family, cited; abelian `QCoh` on stacks and `DQCoh` — owner SchemeAndStackFoundations, cited.

### Dependency gate and the declared gaps

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2236 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The plan has 33 targets, each with at least three tests (3 to 6), and no forward `target:` prerequisite.

- `gap:twist-quasiprojective`: same slug in the README (line 135) and the plan; supplier SchemeAndStackFoundations §1.16; one `needs` sentence with all hypotheses; §1.16 on main does not state it.
- `gap:chevalley-quasiprojective-quotient`: same slug in the README (line 178) and the plan; supplier ReductiveGroups Layer 3; one `needs` sentence; not stated on main.

### Shape, principles, headlines

The README has the required parts in order; every definition has API prose and at least three Checks, every theorem a locator, every layer Examples and Dependencies. Regex scan: no LaTeX delimiters, process words, pull-request numbers, machine paths, HTML anchors or `set_option`; "lemma" occurs only in "Shapiro's lemma". No algorithm, no sorry'd data, no route-specific shortcut (the characteristic-zero hypothesis of 8.4 is the theorem's, and 8.5 shows it cannot be dropped). The README does not say it follows a source and no layer is named after a source's chapter.

Headline theorems (from the Summary): flat hyperdescent (3.2) with sheafification invariance and Čech descent (3.3); affine pushforward with base change and projection formula (4.2); `QCoh(h_X) ≃ Dqc(X)` for every scheme (5.3); the t-structure and perfect = dualizable (6.2–6.3); `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` (7.3); perfect stacks and their permanence (8.2–8.3); characteristic-zero quotients (8.4); the non-compact unit in characteristic p (8.5). None is statable at the pins without the ∞-categorical carriers of the suppliers; the package stage decides the Lean file.

Source independence: 8 further passages compared with 5 sources (SAG lines 17889, 17912, 79403, 26801, 4184; GR-I line 7883; HNR line 807; HR-perf line 28; HTT line 31671), beside the 15 sampled locators, none shared beyond what a statement forces (at most five consecutive words, "the smallest full subcategory of"); largest share SAG, 45 of 145 locators; contents compared with SAG §§6.2.1–6.2.6, 6.3.1–6.3.4, 9.1.1–9.1.6 and D.6: independent. Layer 1 draws on HA; Layer 2 joins SAG 6.2.2 with parts of 6.2.3 and 6.2.6; Layer 4 (SAG 6.3) precedes Layer 5 (SAG 6.2.4) because 5.4 needs 4.2; Layer 6 joins 6.2.5, 6.2.6 and 9.1; Layers 7–8 have no SAG counterpart.

## Not verifiable

- Lean elaboration and the one-tactic probe: not available in this lane, and the design has no `Suggested.lean`.
- The two gaps are declared contracts: their statements were checked, not future proofs.
- Suppliers still in pull requests (PrismaticCohomologyPartII, LanglandsParameterStacks, HabiroCohomologyFoundations, the InfinityCategoryTheory family) were read at the heads the index of 2026-11-15 gives; they can move before they merge.

## Source issues

- **Error** in BZFN at proof of Corollary 3.22, arXiv page 24: the source says the compact and dualizable objects on the classifying stack of the general linear group are the finite-dimensional representations; it should be their shifts, finite extensions and retracts; affects the proof.
- **Gap** in BZFN at proof of Corollary 3.22, arXiv page 24: the source says the quotient maps quasi-projectively to the classifying stack; it should justify that twists by torsors that are not Zariski-locally trivial are schemes carrying an ample bundle; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7a7aeccb19789c133f859de1e71128d4e0a5c2a0", "job": "REV-DESIGN-QuasicoherentSheavesOnPrestacks~9", "model": "fable", "worker": "chris-x30"} -->
