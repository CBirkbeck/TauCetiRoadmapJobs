<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2165#issuecomment-6454884919 -->
Red team round 2 pass b (claude) of f46473a

Verdict: needs_changes

1. **F01** (P2) The ordinary-category case of 0.3(2) is statable at the pins but absent

   **Location.** `packages/AnalyticStacks/Suggested.lean` lines 17–19: "README 0.3(2), the gluing theorem for restricted multisimplicial nerves (LZ12b Theorem 5.4): it needs pullback squares in a quasicategory … Mathlib's quasicategories carry no limits." `packages/AnalyticStacks/README.md` line 157: "LZ12b Theorem 0.1, LZ12b line 110, is the case of the nerve of an ordinary category".

   **Claim.** Every headline statable at the pins is stated, and each one that is not is named with its missing carrier.

   **Witness.** LZ12b line 110–118 (Theorem 0.1) and line 120–122 (Corollary 0.2) are stated for an ordinary category C admitting pullbacks; LZ12b line 72–74 defines δ*₂N(C)^cart_(E₁,E₂) by functors [n] × [n] → C with first-direction arrows in E₁, second-direction arrows in E₂ and all squares cartesian. Every carrier exists at the pin: ordinary categories, `CategoryTheory.IsPullback` (Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean:61), `CategoryTheory.MorphismProperty`, `Monotone.functor` (Mathlib/CategoryTheory/Category/Preorder.lean:156), `CategoryTheory.nerve`, and the same `SSet.hoFunctor`/`MonoidalClosed.pre` form the file already uses for 0.3(1). The docstring's reason (no limits in quasicategories) does not apply to this case, which is the one the roadmap itself instantiates (README line 175: qcqs schemes, proper maps and open immersions).

   **Repair.** Add to `Suggested.lean`, in Layer 0, a definition `cartesianNerve (C) [Category C] (E₁ E₂ : MorphismProperty C) : SSet` whose n-simplices are the functors `(Fin (n+1) × Fin (n+1)) ⥤ C` (product preorder) with `E₁` on the maps `(i, j) → (i′, j)`, `E₂` on `(i, j) → (i, j′)` and `IsPullback` for every square, functorial by precomposition with `(θ.toOrderHom.monotone.prodMap θ.toOrderHom.monotone).functor`; the map `cartesianNerveToNerve : cartesianNerve C E₁ E₂ ⟶ nerve C` restricting along the diagonal; and the theorem (LZ12b Corollary 0.2, line 120): for C with pullbacks, E₁ and E₂ containing identities, stable under base change and satisfying `p ≫ q ∈ Eᵢ ↔ q ∈ Eᵢ` for `p ∈ Eᵢ`, and every morphism of C factoring as `p ∘ q` with `p ∈ E₁`, `q ∈ E₂`, for every quasicategory Q, `(SSet.hoFunctor.map ((MonoidalClosed.pre (cartesianNerveToNerve C E₁ E₂)).app Q)).toFunctor.IsEquivalence`. Name it in README 0.3 and the module docstring, and restrict the docstring's "not statable" sentence to the ∞-categorical case. Tested: (i) on the README's own instance (line 175), C = qcqs schemes, E₁ = proper maps, E₂ = open immersions, E₀ = separated finite-type maps, Theorem 0.1 at k = 2 applies with target the nerve of the wide subcategory on E₀; (ii) on C = finite sets, E₁ = all maps, E₂ = isomorphisms (both admissible, every map factors as f ∘ id), Corollary 0.2 applies and the grids with invertible horizontal arrows are equivalent to chains, so the map to the nerve is a categorical equivalence; (iii) E₁ = E₂ = isomorphisms with a non-invertible map in C fails the factorization hypothesis, as the Check at line 175 says. If the repair worker judges the nerve definition too heavy, the docstring must at least name Theorem 0.1 and say which definition is missing; the current sentence misstates the obstruction.

2. **F02** (P3) `spectralStoneDuality` does not pin the functor

   **Location.** `packages/AnalyticStacks/Suggested.lean` lines 138–142: "∃ e : SpectralSpaceCat.{u} ≌ BddDistLat.{u}ᵒᵖ, ∀ X : SpectralSpaceCat.{u}, Nonempty ((e.functor.obj X).unop ≃o TopologicalSpace.CompactOpens X)"; README line 632.

   **Claim.** The statement is Stone duality for spectral spaces (GvG24 Theorem 6.4 with 5.38; RCSolid Theorem 5.1.13).

   **Witness.** RCSolid line 2340–2343: the theorem is that the functor Spec^op → Lat_dis, X ↦ Op(X)^qc, is an equivalence. The Lean statement only asserts some equivalence whose object map agrees with CompactOpens up to an unspecified isomorphism; it says nothing about the morphism map (preimage). The functor is definable at the pin: `IsCompact.preimage_of_isOpen` (Mathlib/Topology/Spectral/Hom.lean:47) gives that a `SpectralMap` pulls compact opens back to compact opens, and preimage preserves ∪, ∩, ⊤, ⊥, so `f ↦ BddDistLat.ofHom ⟨preimage⟩` is a `BoundedLatticeHom (CompactOpens Y) (CompactOpens X)` (Mathlib/Order/Hom/BoundedLattice.lean:56; `BddDistLat` morphisms are these, Mathlib/Order/Category/BddDistLat.lean:52–62); the lattice instances on `CompactOpens` need `QuasiSeparatedSpace` (Compacts.lean:843–877), which `SpectralSpace` provides.

   **Repair.** Define `compactOpensFunctor : SpectralSpaceCat.{u} ⥤ BddDistLat.{u}ᵒᵖ` with `obj X := op (BddDistLat.of (TopologicalSpace.CompactOpens X))` and `map f := op (BddDistLat.ofHom (preimage hom))`, and replace the theorem by `theorem spectralStoneDuality : compactOpensFunctor.{u}.IsEquivalence := by sorry`. Keep the README sentence, changing "sending each spectral space X to a lattice order-isomorphic to CompactOpens X" to "the functor X ↦ CompactOpens X, f ↦ preimage". Tested: on the Checks of line 641 the functor sends ∅, the point, the discrete pair and the Sierpiński space to the 1-, 2-, 4-element and 3-chain lattices, and the unique map of the point into the Sierpiński space at the closed point pulls back {open point} to ∅.

3. **F03** (P3) The 5.2 isomorphism criterion must name its induced-structure hypothesis

   **Location.** `packages/AnalyticStacks/README.md` line 903: "… (n + 3)-connective fibre if fib(f) is n-connective for n > 0 (2n over ℚ) (RCSolid Proposition 7.4.7 …); f is an isomorphism iff π₀ f is and L_(B/A) = 0 (RCSolid Corollary 7.4.8, RCSolid line 5339)".

   **Claim.** For a map f: A → B of analytic rings, f is an isomorphism iff π₀f is an isomorphism and L_(B/A) = 0.

   **Witness.** Read with f an arbitrary map (the clause stands alone after a semicolon and the source, RCSolid line 5339–5341, states it for an arbitrary morphism, adding "in particular, f has the induced analytic ring structure", which does not follow), it is false: ℤ^cond → ℤ_■ has π₀ an isomorphism and L = 0 (the README's own Check, line 912), but is not an isomorphism (ℤ[ℕ ∪ {∞}] is complete for ℤ^cond and not solid, line 503).

   **Repair.** Write "for such f (induced structure), f is an isomorphism iff π₀f is and L_(B/A) = 0 (RCSolid Corollary 7.4.8, RCSolid line 5339, whose statement omits the induced structure that its proof through Proposition 7.4.7 uses)" and add the negative Check "ℤ^cond → ℤ_■ has π₀ an isomorphism and L = 0 but is not an isomorphism: the criterion needs the induced structure". Tested: with induced structure, π₀f iso and L = 0 give cofib(f) = 0 by 7.4.7, and B = B▷_(A/) = A.

4. **F04** (P3) 6.1 uses `A_■` for a non-discrete ring

   **Location.** `packages/AnalyticStacks/README.md` line 948: "For A noetherian and I-adically complete, a topologically finite type A → B gives A_■ → B_■ of solid almost finite presentation".

   **Claim.** A_■ and B_■ denote analytic rings.

   **Witness.** The roadmap defines R_■ only for discrete R (2.7(7), line 586: "for a commutative ring R, R_■ = colim_(B ⊆ R) B_■", with B discrete of finite type), and the solid Huber ring of a complete topological ring is (A▷, A⁺)_■ of 2.9 (line 613). For A = ℤ_p the discrete ℤ_p with R_■ of 2.7 and the p-adic (ℤ_p, ℤ_p)_■ of 2.11 are different analytic rings (the second has the null sequence pⁿ, line 654), so "A_■" is ambiguous exactly where the statement needs the second. RCSolid line 5479 writes the same shorthand "A_■ → B_■ endowed with the I-adic topology".

   **Repair.** Write "gives (A, A)_■ → (B, B)_■, the solid Huber rings of the I-adically complete rings with their I-adic condensed structure (2.9), of solid almost finite presentation". Tested on A = ℤ_p → B = ℤ_p⟨T⟩: (ℤ_p, ℤ_p)_■ → (ℤ_p⟨T⟩, ℤ_p⟨T⟩)_■ is the I-completed solid Tate algebra of 2.9's API (line 620), of solid finite presentation with L free of rank one.

5. **F05** (P3) 2.2 writes the free module on a light profinite set as `A[T]`

   **Location.** `packages/AnalyticStacks/README.md` line 507: "Write A[T] = A ⊗_A▷ A▷[T], AnRing^un and AnRing."

   **Claim.** This defines the free complete module on a light profinite set.

   **Witness.** Everywhere else the letter S is the light profinite set (2.1 line 489 "A▷[S] = A▷ ⊗ ℤ[S]"; 2.3(4) line 527 "B[S] = colim A_i[S]") and T is a polynomial variable (2.7(1) "ℤ[T]", 2.9 "A[T₁, …, T_n]_■", 2.10 "A[1/g] ⊗_(A[T₁,…,T_n]) A[T₁, …, T_n]_■"). For A = ℤ_■ and T a one-point set, A[T] of line 507 is ℤ, while the polynomial ring ℤ_■[T] of 2.9 is ℤ[T] with its structure; the two readings differ.

   **Repair.** Write "Write A[S] = A ⊗_A▷ A▷[S] for a light profinite set S (the free complete module), AnRing^un and AnRing." Tested: 2.3(4) then reads B[S] = colim A_i[S] with the same symbol.

6. **F06** (P3) 4.2(2)'s fineness clause has no locator and omits its hypothesis on H

   **Location.** `packages/AnalyticStacks/README.md` line 814: "(2) if G has locally finite Λ-cohomological dimension, then ∗/H → ∗/G is fine for every closed subgroup H, ∗/G is Λ-suave iff G is locally Λ-Poincaré … (HM Definition 5.3.17 and Proposition 5.3.19, HM line 4875, HM line 4885)".

   **Claim.** HM 5.3.17 and 5.3.19 cover the fineness of ∗/H → ∗/G.

   **Witness.** HM line 4875–4886 define Λ-Poincaré and prove the suaveness criterion only. Fineness is HM Corollary 5.3.3, HM line 4649–4650: "H → G a morphism of locally profinite groups which have locally finite Λ-cohomological dimension; then ∗/H → ∗/G is Λ-fine", with the hypothesis on H as well.

   **Repair.** Write "then, for every closed subgroup H (which has locally finite Λ-cohomological dimension since cd_Λ of a closed subgroup of a profinite group is at most that of the group), ∗/H → ∗/G is fine (HM Corollary 5.3.3, HM line 4649), and ∗/G is Λ-suave iff …". Tested on H = 1 ⊆ G = ℤ_p, Λ = 𝔽_p: cd = 0 ≤ 1 and ∗ → ∗/ℤ_p is fine (the Check of line 824 uses it).

7. **F07** (P3) 6.3(2) and 6.6(1) quantify over all maps of schemes in a formalism whose !-able class is the separated maps

   **Location.** `packages/AnalyticStacks/README.md` line 979: "(2) a map of derived schemes of finite Tor-dimension is suave for the solid formalism, and a local complete intersection map … is cohomologically smooth"; line 1019: "(1) for a smooth morphism of schemes … f: Y → X of relative dimension n, f is cohomologically smooth for the solid formalism".

   **Claim.** Every such map is suave (resp. cohomologically smooth) in the solid formalism.

   **Witness.** The solid formalism these sections cite is 3.4 (both have 3.4 in `*Needs:*`), whose !-able class is E = separated maps (line 717; SixFF line 3208–3211). The affine line with doubled origin L → 𝔸¹_ℤ is étale, hence smooth of relative dimension 0 and of finite Tor-dimension, but not separated, so it is not in E and "suave" or "cohomologically smooth" is not defined for it there. It becomes !-able only in the extended formalism on SolHubStk (3.5), whose E′ is local on the source for !-covers (0.6, line 220; the two copies of 𝔸¹ cover L).

   **Repair.** In 6.3(2) and 6.6(1) write "a separated map of derived schemes almost of finite type over ℤ …" or "… in the formalism on solid Huber stacks of 3.5, whose !-able class is local on the source, so that no separatedness is needed", and add 3.5 to 6.3's `*Needs:*` in the second case. Tested: for L → 𝔸¹_ℤ the first repair excludes the map; the second makes it !-able by source locality with ω = O in degree 0 on each copy of 𝔸¹.

Round 2. Files reviewed in full: `packages/AnalyticStacks/README.md` (1197 lines, 60 numbered target sections, 191 Check bullets) and `packages/AnalyticStacks/Suggested.lean` (144 lines, 7 declarations and 2 instances). The earlier passes RT-AnalyticStacks~1a (33 findings) and RT-AnalyticStacks~1b (5 findings, three shared) and the repair report FIX-RT-AnalyticStacks~1 were read finding by finding and every repair was checked at this head (first section). The full pass was then rerun; new findings are numbered S01–S07.

## Round 1 findings at this head

Each row quotes the repaired passage (at most 40 words) with its line in `packages/AnalyticStacks/README.md` unless the file is named. "Repaired" means the repair text is present and I found it mathematically correct on the instance that refuted the original.

| Finding | Status | Witness at head |
|---|---|---|
| a-F01 (1.1 six operations) | repaired | line 373: "commutes with tensor products, pullbacks and the pushforwards f_! = f_* along maps of affines, with internal Hom Hom(M, −) when M is perfect, and with f^! … when B is a perfect A-module"; negative Check line 380 (∏_ℕ ℤ^cond at S = ℕ ∪ {∞}; B = ℤ[T]/T² gives ℤ² both sides, recomputed). |
| a-F02 (ℙ¹ Check) | repaired | line 414: "Primness does not imply suaveness: Spec ℤ[T] → Spec ℤ is prim with δ = 1 but not D-suave … ℙ¹_ℤ → Spec ℤ is D-smooth … ω = Ω¹[1] = O(−2)[1]". |
| a-F03 = b-F01 (2.4(3)) | repaired | line 541: "(3) the same holds if π₀A▷ → π₀B▷ is surjective with nilpotent kernel"; negative Check line 548 (ℤ → ℚ with the ℤ[1/p]-module structure). |
| a-F04 (1.7 t-structure) | repaired | line 462: "Assume moreover that V carries an accessible t-structure compatible with filtered colimits, whose connective part is closed under ⊗ and contains the unit"; Check line 474 (Mod_(ℚ[u^±1]), Σ² = id). |
| a-F05 (π₂_*) | repaired | line 279: "the pushforward π₂_*: D(Y ×_X Y) → D(Y) along the second projection is conservative"; Check line 289 (column sums). HM line 3599 reads π₂∗: D(Y ×_X Y) → D(Y), the pushforward. |
| a-F06 (1.4 self-intersection) | repaired, applied differently | line 420: "B ⊗^L_A B = Λ_B(B^n[1]), the exterior algebra on B^n in homological degree 1, a free B-module of rank 2^n"; Check line 428 (ranks 1, 2, 1). Correct: Kos(B; f̄) with f̄ ≃ 0 is Sym_B(B^n[1]) = ⊕_k Λ^k(B^n)[k], and no reduction to one generator is needed. |
| a-F07 = b-F02 (2.10 invariance) | repaired | line 632: "is unchanged under a map A → A′ with the induced structure that is surjective on π₀ with nilpotent kernel"; Check line 640 (ℤ_■ → ℤ[T]_■ excluded; (ℤ[ε]/ε²)_■ → ℤ_■ positive). |
| a-F08 (5.2 m ≥ 1) | repaired | line 903: "for M n-connective with n ≥ 1 and m ≥ 1, Sym^m_A M is (m + n − 1)-connective … for m = 0 both powers are A"; Check line 913. RCSolid line 5315 reread: the source has no m ≥ 1. |
| a-F09 (lci shift) | repaired | Conventions (3) line 36 (det, χ, det(P[1]) = (det P)^∨); line 979: "f^!1 ≅ det(L_(X/Y))[d]"; Check line 988. Recomputed: ℤ → 𝔽_p has L = 𝔽_p[1], χ = −1, det(L)[−1] = 𝔽_p[−1] = RHom_ℤ(𝔽_p, ℤ). |
| a-F10 (7.1 fibre sequences) | repaired | line 1052: "sends colimit diagrams of commutative monoids to limit diagrams; in particular it sends cofibre sequences of grouplike objects to fibre sequences. Nothing is asserted for an arbitrary fibre sequence"; Check line 1059. |
| a-F11 (Cartesian clause) | repaired | line 141: "if C has finite products and its final object ∗ is also final in C_E (every X → ∗ lies in E), the second is symmetric monoidal"; HM line 1320 agrees; Check line 152 (injections). |
| a-F12 (Nagata supplier) | repaired | contract lines 72–74 "From TauCetiRoadmap.EtaleCohomologyFoundations … §G.2 (`nagataCompactification` …)"; cited at lines 175, 719, 721, 790. On main: `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` lines 57, 105, 139 are G.1–G.3 and line 107 names `nagataCompactification` for qcqs S and separated finite-type f. EtaleCohomologyFoundations is line 18 of the merge order, AnalyticStacks line 224. |
| a-F13 (Stone duality headline) | repaired (see S02 for a sharper form) | `packages/AnalyticStacks/Suggested.lean` lines 115–144: `SpectralSpaceCat`, its `Category` instance from `SpectralMap.id`/`comp` with proved laws, and `spectralStoneDuality : ∃ e : SpectralSpaceCat.{u} ≌ BddDistLat.{u}ᵒᵖ, ∀ X, Nonempty ((e.functor.obj X).unop ≃o TopologicalSpace.CompactOpens X)`; README line 632 and the docstring name both. Statement true (K° is an equivalence with K°(X) = CompactOpens X; universes match since CompactOpens X : Type u). Checks line 641–642 recomputed (∅ ↦ 1 element, point ↦ 2, discrete pair ↦ 4, Sierpiński ↦ 3-chain; M₃: a ∧ (b ∨ c) = a ≠ 0 = (a ∧ b) ∨ (a ∧ c)). |
| a-F14 (E5:presentability.4) | repaired | lines 842, 844: "EnhancedDerivedSheaves E5:presentability.4, `dualizable_filteredColimit`"; on main `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` line 1758 states it with strongly continuous transitions, as the route says. |
| a-F15 (lax) | repaired | line 143: "induces a lax symmetric monoidal functor … structure maps … ∏_i F(X_i) ← F(∏_i X_i) = F(∏_i X_i); it is symmetric monoidal when F preserves finite products"; HM line 1303–1310 agrees; Check line 153. |
| a-F16 (3.7 linearity) | repaired | line 761: "D_A = Fun_(D(A▷(∗)))(D_!, D(A)) = D* ⊗_(D(A▷(∗))) D(A) … whose subscript D(ℤ) at line 4474 is a misprint"; Check line 770 recomputed: Fun^L_(D(ℤ))(D(𝔽_p), D(A)) = Mod_(𝔽_p)(D(A)) = modules over 𝔽_p ⊗^L_ℤ 𝔽_p, π₁ = Tor₁ = 𝔽_p. |
| a-F17 (k > 0) | repaired | line 903: "for f with induced structure and k-connective fibre with k > 0, the square-zero extension B̃ … has A → B̃ with (k + 1)-connective fibre"; RCSolid line 5347 agrees; Check line 914. |
| a-F18 (trivial pairing) | repaired | line 1078: "A trivial pairing h ≡ 1 need not induce a duality … for the constant formalism … FM_h is the identity". |
| a-F19 (radii) | repaired | line 1109: "for every real r > 0 (here and in (4) all radii r, r′ are positive reals, and r → 0 means the limit through positive radii)"; 7.6 line 1126 "for real r > 0 in (2)"; Check line 1118. |
| a-F20 (cover of Vect) | repaired | line 1128: "covered by the coproduct over n ≥ 0 of the frame atlases S → BGL_n^R … the n-fold product of the rank-one duality"; Check line 1135. |
| a-F21 (square-zero dual) | repaired | line 464: "modules over its finite dual, the exterior algebra ℚ ⊕ ℚ·η on a class η of homological degree −1 and weight +1 with η² = 0"; Check line 473 (d∘d = 1 excluded). Degrees recomputed: ε₁ (degree 1, weight −1) dualizes to η (degree −1, weight +1); after N_n = M_n[n], η: N_n → N_(n+1) has degree 0. |
| a-F22 (free Huber pairs) | repaired | line 607: "maps of Huber pairs from (ℤ[T], ℤ) to (R, R⁺) form R, and maps from (ℤ[T], ℤ[T]) form R ×_π₀R R⁺"; RCSolid lines 3254–3256 agree. |
| a-F23 (zero ring) | repaired | line 267: "for a nonzero ring Λ, ⊕_ℕ Λ is neither …; for Λ = 0 it is the zero object, which is both"; line 269 "For Λ ≠ 0". |
| a-F24 (internal order) | repaired, applied differently | line 108: "inside it the restricted-nerve theorems of 0.3 are built before the correspondences of 0.2"; 3.7 (line 761) no longer mentions 3.8; 3.8 line 774 carries the compatibility with Needs 3.7 (line 776); 3.7 Needs (line 763) lists 1.1, 1.2, 2.2 only. No internal cycle remains; 0.3's Needs (line 168) does not use 0.2. |
| a-F25 (modulus) | repaired | line 36: "δ(g) = [gKg⁻¹ : K] for any compact open subgroup K, with the generalised index …; in the locally pro-p cases of 4.2, K may be chosen pro-p"; ∏_ℓ ℤ_ℓ example present. Borel witness recomputed: p⁻¹. |
| a-F26 (n ≥ 1) | repaired | line 1058: "an integer n ≥ 1, A = ℤ[ℤ/n] (the group algebra, finite free of rank n …)"; n = 0 excluded in the same Check. |
| a-F27 (Σ_n order) | repaired | line 133: "ordered by (i, j) ≤ (k, l) iff i ≤ k and l ≤ j"; HM line 990 agrees; Check line 151; 0.3 API line 165 says componentwise order for Cpt_n (LZ12b line 1893–1895 agrees). |
| a-F28 (j_* versus j_!) | repaired | line 418: "j_* … essential image the derived I-complete …, j_! is fully faithful with essential image the derived I-torsion …"; Check line 427 (j_*ℤ_p = ℤ_p, j_!ℤ_p = (ℚ_p/ℤ_p)[−1]). |
| a-F29 (nuclear closure owner) | repaired | line 828: "(1) Applied to D(A), RefinedTraceMethods §4.3 gives … these are not targets here"; Scope line 13. At its head `TauCetiRoadmap/RefinedTraceMethods/README.md` lines 1600–1641 state the closure and generation results. |
| a-F30 = b-F03 (3.1 Check) | repaired | line 682: "RHom_(ℤ_■)(ℤ_p, ℤ) = (ℤ[1/p]/ℤ)[−1] = (ℚ_p/ℤ_p)[−1] (… the dual of T − p is injective, and its cokernel has the relations p·e₀ = 0 and e_(n−1) = p·e_n …)"; recomputed, agrees. |
| a-F31 (diagonal Check) | repaired | line 349: K(ℚ, 2) example; recomputed: C_*(K(ℚ,1); 𝔽_p) = 𝔽_p since ℚ is uniquely p-divisible, the diagonal's fibre is K(ℚ, 1) with D_! = Mod_(𝔽_p[ℚ]) ≠ D(𝔽_p). |
| a-F32 (SolidAnalyticRings §7.3) | repaired, applied differently | line 601: "this structure, the coefficient structures (R, R⁺)_■ and their independence of the choice of a ℤ-algebra generating set of R⁺ are imported from SolidAnalyticRings §7.3 through 2.6, and what is proved here is the integral-closure step"; Scope line 11; 2.7(7) line 586. §7.3 exists at the head (rev 1458 README line 745). |
| a-F33 (ℓ^ℕ_R(r) Checks) | repaired | lines 1118–1120, three Checks; recomputed (e₁ norm r; (r/2)ⁿ → 0 iff r < 2; π^⌈√n⌉ in ℓ(1) and in no ℓ(r′), r′ > 1). |
| b-F04 (Mat16 3.31) | repaired | line 384: "compare Mat16 Proposition 3.31, Mat16 line 1134, which proves descendability of a faithfully flat map of E∞-rings A → B when π_*(A) is countable, with no hypothesis on B"; Mat16 line 1134 agrees. |
| b-F05 (slug) | repaired | line 1165: "hypercover-inversion → 0.13(6) with 3.3, and 4.5 for the perfect modules Perf^[a,b] over Fredholm C₀". |

No repair introduced a new error that I could find: the new Conventions (3), the exterior-algebra route of 1.4, the relative Hom of 3.7, the Lean structure and theorem of 2.10 and the new Checks were all recomputed (table below).

## Verified sound

**Head and scope.** Reviewed at f46473a (the checkout's HEAD). `git diff --stat origin/main...HEAD` lists only files under `packages/AnalyticStacks/` (README, Suggested.lean, metadata.toml, sources.toml, five reports). No `lemma` (the only hits are "Yoneda lemma" and source labels), no `set_option`, `#eval`, `#print` or `#synth`, no pull-request number or process word in README or Lean, `import Mathlib` alone. Every target section carries a locator. The declared gap `nuclear-hom-criterion` has the same slug in `design/plan.json` and README line 92, names RefinedTraceMethods §4.3, and is still open there: `TauCetiRoadmap/RefinedTraceMethods/README.md` at rev 1493 lines 1600–1641 define nuclearity by trace-class maps from compact objects and prove closure and generation, and do not state the Hom criterion of CS22 Definition 8.5 (CS22 line 3157), so the gap is precise, minimal and declared.

**Dependency gate.** The command of the brief printed

    depcheck: 156 roadmaps, 1068 edges, 0 problem(s)

with no UPWARD, CYCLE or `moved:` line. Merge order: AnalyticStacks is line 224, after EnhancedDerivedSheaves (17), EtaleCohomologyFoundations (18), DerivedDeRhamCohomology (20), SmoothRepresentationsOfLocalGroups (25), LocallyAnalyticDistributions (76), DiamondSixOperations (90), VStackSheavesAndLisseCategories (146), SolidAnalyticRings (147), RefinedTraceMethods (223); the downstream consumers named at lines 1163–1165 are later (227, 238) or board packages. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

**Suppliers resolved this round (sibling citations checked: about 90 section or name citations).** On main (content checkout): EnhancedDerivedSheaves E0.2 (line 191, "Supplied by BordismFormalGroups F6.5 … categorical equivalences … and the Joyal model"), E0.3–E0.8 (195–376), 0.1–0.3 (429–455), E1.3 (549), E1.8 (840), E2.6–E2.7 (2293, 2375), E3.1–E3.4 (1121–1229), E4.1 (2569), E5:abstract.1–5 (1440–1570), E5:presentability.1–4 (1597–1732) with `dualizable_filteredColimit` (1758), E5:descent (1791), E5:animation.1, .4 (1900, 1994), E5:cotangent-export.1–2 (2869, 2905); BordismFormalGroups F6.5 (line 1526, containing the subsections "Categorical model and functor spaces" at 1546 and "Unmarked straightening and the categorical model" at 1823, so the attribution at README lines 9 and 62 is correct); EtaleCohomologyFoundations G.1–G.3 (57, 105, 139; `nagataCompactification` 107); DerivedModuleAlgebra §0.K.1 (516), §0.4 (815, `Algebra.CotangentComplex` 826), §0.6 (973), §0.12 (1132), §0.13 (1151), §0.14 (1171), §1.E.0 (2049); SchemeAndStackFoundations §1.15 (2502), §§1.18–1.22 (2745–2989), §2.18 (3959), §2.19 (4094; `upperShriek_proper` 4123, `upperShriek_smooth` 4128), §2.20 (4275; `RelativeDualizingComplex`, `.baseChange` 4284), §5.5 (6768); AdicSpaces §2.1 (358), §2.2 (372), §3.1 (455); AdicSpacesPartII §R0.16 (5987), §R1.1 (8427). At their open heads through `roadmaps show`: DerivedDeRhamCohomology (#868) §§1.14–1.19 (655–818; §1.16 "deg(t) = 1 … degree −i term F^i", §1.18 coconnective half tested on gr for complete objects, §1.19 heart = Ch(A) by the stupid filtration, all as README lines 78 and 458 say); SmoothRepresentationsOfLocalGroups (#785) SR.0.1 (559), SR.0.2 (618), SR.1.1 (982), SR.0d.1 (1594), SR.0d.2 (1656), "Measures and modulus" with δ_B(diag(p, 1)) = p⁻¹ (176–179); LocallyAnalyticDistributions (#854) §1.1 (784) and Conventions 5 and 13 (δ_a ↦ (1 + T)^a); VStackSheavesAndLisseCategories (#1230) VS1.1 (236), VS2.2 (710; `SolidECoefficients` 749, `ZSolidAnalytification` 757), VS3.1 (988), VS4.2 (1215); DiamondSixOperations (#927) Layers S0–S4 (116–703); SolidAnalyticRings (rev 1458) §1.5 (193), §§2.1–2.4 (243–309), §§7.1–7.4 (689–787); RefinedTraceMethods (rev 1493) §§4.1–4.3 (1512–1575).

**Pinned declarations (Mathlib 6b7abb3c, Tau Ceti a91d3aaf; 17 opened at file:line).** `SSet.Quasicategory` (Quasicategory/Basic.lean:41), `SSet.hoFunctor` (HomotopyCat.lean:609), `MonoidalClosed.pre` (Closed/Basic.lean:242, `(f : B ⟶ A) : ihom A ⟶ ihom B`, so the theorem's functor runs Fun(δ*₂∇X, Q) → Fun(δ*₂X, Q) as the README says), `SSet.QCat.bicategory` (StrictBicategory.lean:66), `SpectralSpace` (Spectral/Basic.lean: T0, compact, quasi-sober, quasi-separated, prespectral), `SpectralMap` (Spectral/Hom.lean:69) and `IsCompact.preimage_of_isOpen` (:47), `TopologicalSpace.CompactOpens` (Compacts.lean:777; `Min` needs `QuasiSeparatedSpace`, :843–851; `BoundedOrder` :877), `BddDistLat` (BddDistLat.lean:28; morphisms `BoundedLatticeHom`, :52–62), `PrespectralSpace.opensEquiv` (Prespectral.lean:111), `OrderIso.lowerSetSupIrred` (Birkhoff.lean:149), `Locale` (Locale.lean:25), `AbstractMeasure.amiceTransformEquiv` (AmiceTransform.lean:157), `IsPullback` (Pullback/IsPullback/Defs.lean:61), `Monotone.functor` (Category/Preorder.lean:156); Tau Ceti `cartierDuality` (FiniteLocallyFree.lean:271), `Huber.Pair` (Pair.lean:138), `ValuationSpectrum.spa` (Spa/Basic.lean:101). The Quasicategory folder (Basic, InnerFibration, Nerve, StrictBicategory, StrictSegal, TwoTruncated) has no notion of limit, confirming the docstring for the ∞-categorical case. Mathlib has no `CompactOpens` comap along spectral maps (grep of Compacts.lean and Topology/Spectral), which is why S02 asks for a definition.

**Lean (declarations read: 7, plus 2 instances; no Lean run, by the brief).** The elaborated types in the worker's signatures file were compared with README 0.3 and 2.10; the file has no `variable` block, so no binder can be lost. Table:

| Declaration (Suggested.lean line) | Context | Instances computed | Result |
|---|---|---|---|
| `bisimplex` (63) | universe u only | n = 1: 4 vertices, 6 (1,0)-bisimplices; contravariance in (p, q) by precomposition, covariance in n by postcomposition | agrees with LZ12b line 1052 |
| `compactificationBisimplex` (73) | u only | n = 1: vertices 00, 01, 11; (1,0)-bisimplices 4 of 6 (β(0) = 1: all 3 α; β(0) = 0: α = 00); (id, id) excluded since 1 ≤ 0 fails; map θ preserves α a ≤ β b by monotonicity | agrees with LZ12b line 1054–1055 |
| `restrictedDiagonal` (85) | X explicit | X = Cpt₁: nerve of the 3-element poset, 6 edges incl. 00 → 11 | agrees with LZ12b line 1884, 1893 |
| `restrictedDiagonalMap` (91) | X explicit | X = ∗: identity; X = Cpt₁: bijective on vertices, 5 → 6 on edges | restriction along Cpt_n ⊆ Δ^(n,n), LZ12b line 1887–1889 |
| `restrictedDiagonalMap_isEquivalence_hoFunctor` (105) | X, Q, [Q.Quasicategory] | true: a categorical equivalence between quasicategories induces an equivalence of homotopy categories; quantified over Fun(K, Q) it recovers the categorical equivalence by Yoneda in `SSet.QCat.bicategory` | headline 0.3(1); not padding |
| `SpectralSpaceCat` + `Category` instance (116–134) | u only | laws from `SpectralMap.comp_id`, `id_comp`, `comp_assoc`; no sorry | real body |
| `spectralStoneDuality` (138) | u only | true (K° is an equivalence, universes match); object-level identification only | S02 |

**Headline inventory.** 0.3(1) stated; 0.3(2) named as not statable, but its ordinary-category case is statable (S01); 0.5, 0.6, 0.12–0.13, 3.3, 3.8, 4.2, 6.6, 7.6 named with their missing carriers (∞-operads, Cat∞, Pr^L, ∞-topoi, analytic rings, light condensed anima, solid Huber cotangent complexes, ring stacks), none of which exists at the pins (grep of Mathlib and Tau Ceti for `Quasicategory` limits, `PrL`, analytic rings: none); 2.10 stated (S02 for its form). Nothing else in the README is statable at the pins: every other theorem needs analytic rings or presentable ∞-categories. No padding: every definition is used by a stated headline.

**Locators (490 read).** A script printed, for each of the 490 "<source> line N" citations of the README, the source line and checked the preceding label against lines N−2…N+2; 326 matched automatically and the 164 others (range ends, multi-label groups, unlabeled proof lines) were read by hand: all 490 resolve to the cited statement. Statements reread in full this round and compared with the README's wording: LZ12b Theorem 0.1, Corollary 0.2, Notation 4.1, Definition 4.26, Theorem 4.27, Example 4.28, Theorem 5.4, Remark 5.5; SixFF assumption (1) of Lecture IV (line 901), Theorem 5.5 (α: Δ_!1 → p₂*L, as README 0.9), Theorems 9.7, 9.15, 9.17, 9.18; HM Definition 2.1.1, Example 2.3.6, Proposition 2.3.7, Theorem 3.4.11 and the hypersubcanonical remark (line 2270), Lemma 3.4.13 (∗ → ∗ ⊔ ∗, first-component inclusion), Lemma 4.5.10 (π₂∗: D(Y ×_X Y) → D(Y)), Proposition 5.1.12, Corollary 5.3.3, Definition 5.3.17, Example 5.3.18, Proposition 5.3.19, Lemma A.4.8, Corollary A.4.9; RCSolid Remark 4.1.7, Theorem 4.3.2 (Frobenius A▷ → A▷/p), Theorem 4.4.1, Theorem 5.1.13, Lemma 5.5.2, Definition 6.1.1, Definition 6.3.2, Hypothesis 6.3.11, Lemma 6.3.22, Remarks 6.4.1–6.4.2, Proposition 6.4.9, Lemma 6.4.15, Proposition 7.1.5, Proposition 7.1.11, Definition 7.2.1, Proposition 7.4.7, Corollary 7.4.8, Example 7.5.5, Proposition 7.6.5, Lemma 7.7.20, Theorem 7.7.21; Mat16 Propositions 3.20, 3.31, 3.34; GvG24 Theorem 6.4 and Figure 6.1; RC26a Definition 2.5.1, Theorem 2.5.15; RJRC Definition 4.4.1 (ℓ^temp: ∃ r > 0 with |a_n| p^(−r|n|) bounded, equivalent to the README's |a_n| r′^|n| → 0 for some r′ > 0) and Proposition 4.4.8; Sch24 Proposition VI.1.7; CS22 Assumption 9.8, Proposition 9.10; ABLB Definition 4.2.1, Remark 4.2.2; DerivedDeRhamCohomology §1.16, §1.18, §1.19 at #868.

**Ownership by object.** `roadmaps grep` over main and the 363 open heads for "Stone duality", "SpectralSpaceCat", "solid Huber", "smashing spectrum", "AnStk", "Künneth formalism", "kernel bicategory", "three-functor formalism", "Betti stack": no match. "analytic stack": incidental mentions only (VStackSheavesAndLisseCategories VS2.2's affine `ZSolidAnalytification`, which README 3.4 compares by Check; SolidAnalyticRings' reference list; InverseGaloisAndArithmeticFundamentalGroups and HabiroCohomologyFoundations in unrelated senses). "restricted nerve" and "geometric setup" on main occur in Orbifolds and PerfectoidSpaces in other meanings. "Cartier duality" elsewhere (FiniteFlatGroupsAndIntegralPadicHodgeTheory, AbelianSchemesAndArithmeticModuli, …) is the finite flat group scheme duality, cited here through the pinned `cartierDuality`. No two `Suggested.lean` files declare the same fully qualified name.

**Checks tested: all 191 bullets read; 41 statements or Checks recomputed this round (table), none false.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions (1) zero section | RHom_(ℤ[T])(ℤ, ℤ[T]) | complex ℤ[T] →T ℤ[T]: H⁰ = 0, H¹ = ℤ, so ℤ[−1] | as stated | none |
| Conventions (2) ι₀^!1 | resolution ℤ[t]e → ℤ[t], e ↦ t, weight(e) = −1 | coker in Hom: ℤe^∨, weight +1, cohomological degree 1 | t⁻¹ℤ[−1] | none |
| Conventions (3)/6.3 Check | ℤ → 𝔽_p; ℤ → ℤ[T] | L = 𝔽_p[1], χ = −1, det(L)[−1] = 𝔽_p[−1] = Ext¹(ℤ/p, ℤ)[−1]; L = ℤ[T], χ = 1, ℤ[T][1] | agree with 6.4 and RHom | none |
| Conventions (4) modulus | g = diag(p, 1), K = B(ℤ_p) | gKg⁻¹ = {(a, pb; 0, d)}, index p in K, generalized index p⁻¹ | matches SRLG line 179 | none |
| 0.1 equivalence of definitions | W → Y ×_X Z with W → Y, W → Z in E | graph composed with projection equals W → Y ∈ E; right cancellation needs the diagonal | HM 2.1.1 (b) | none |
| 0.2 Σ₁ | (0,1) ≤ (0,0), (0,1) ≤ (1,1) | span X₀ ← W → X₁, right leg in E; f_! = D(Y = Y → X) | consistent with 0.4 | none |
| 0.3 Cpt_n as union | (α, β) with max α = k | α ≤ k ≤ β iff α a ≤ β b for all a, b | API bullet 2 | none |
| 0.3 Check 2 | X = Cpt₁; two Δ^(1,1) glued on the boundary | identity edge has no (1,1)-preimage; two bisimplices, one image | not an isomorphism | none |
| 0.3(2) hypotheses | LZ12b 5.4 (1)–(3), Remark 5.5 | (4)–(6) follow from pullbacks and admissibility | as stated | none |
| 0.3 Check 4 admissibility | proper p∘q with p proper | q = graph ∘ projection, graph closed (p separated) | proper maps admissible | none |
| 0.8 Check 3 | row (Λ, 0), column (Λ, 0)ᵀ | N⋆M = diag(Λ, 0), unit = projection from diag(Λ, Λ); counit = id_Λ | left adjoint | none |
| 0.9 trace criterion | SixFF line 1198 | α: Δ_!1_X → p₂*L, β: f_!L → 1_Y | same direction | none |
| 0.10 Check 3 | j: Spec ℤ[1/p] → Spec ℤ | Δ_j equivalence, j prim: closed map; j* = ℤ[1/p] ⊗ − fails products: (∏ℤ/pⁿ)[1/p] ∋ (1,1,…) ≠ 0 | as stated | none |
| 0.13 Check 3 | K(ℚ, 2) over 𝔽_p | H_*(Bℚ; 𝔽_p) = 𝔽_p (ℚ uniquely p-divisible); ΩX = K(ℚ, 1), D_! = Mod_(𝔽_p[ℚ]) | as stated | none |
| 1.1 Check 1 | ℤ[T]/T²; ℤ[x,y]/(x², xy, y²) | T·T^∨ = 1^∨, ω ≅ B; socle rank 2, two generators | as stated | none |
| 1.2(1) index 2 | ω₁-compact faithfully flat A → B, Q = B/A | Q countable sequential colimit of finite free (Lazard), pd(Q ⊗ Q) ≤ 1, Ext²(Q ⊗ Q, A) = 0 | index ≤ 2 | none |
| 1.2(2) Check / 1.4(2) | A/^L(f) → A/I static | Koszul homotopy bounded, Mat16 3.34 (π_i = 0 for i ≫ 0) applies | descendable | none |
| 1.4 route | B = A/^L(f₁..f_n) | B ⊗^L_A B = Kos(B; 0) = Sym_B(B^n[1]) = ⊕_k Λ^k(B^n)[k], rank 2^n | as stated | none |
| 1.4 Check 2 | ℤ_p along (p) | j_!ℤ_p = fib(ℤ_p → ℚ_p) = (ℚ_p/ℤ_p)[−1] | as stated | none |
| 1.5 Check 3 | 𝔾_a over 𝔽_p | (φ ⊗ 1)Δ(T) = φ(T)·1 + φ(1)·T forces φ(1) = 0 | no comodule retraction | none |
| 1.6 Check 3 | Fil^n = pⁿℤ_p | lim = 0 and lim¹ = 0 (ℤ_p → lim ℤ_p/pⁱ iso) | complete | none |
| 1.7 route | ε₁ degree 1 weight −1 | η degree −1 weight +1; N_n = M_n[n] makes η degree 0, weight +1 | as stated | none |
| 2.4 Check 3 / 2.7(7) | ℚ as ℤ[T]-module via T ↦ 1/2 | RHom_(ℤ_■)(ℤ[[q]], ℚ) = ⊕_ℕ ℚ, (1 − shift/2) bijective, so RHom(ℤ((T⁻¹)), ℚ) = 0 | ℚ is (1/2)-solid, ℚ ∈ D(ℚ_■) | none |
| 2.5 Check 3 | ℤ[1/2], ℤ[1/3] | (a, b) ↦ a − b onto ℤ[1/6], kernel ℤ | union is the unit | none |
| 2.7 Check 1 | 1 − Tq on ℤ[T]((q))/qℤ[T][[q]] | unit of ℤ[T][[q]] preserves qℤ[T][[q]]; RHom(ℤ((T⁻¹)), ℤ[T]) = 0 | j*j_*ℤ[T] = ℤ[T] | none |
| 2.9 Check 1 | A = ℤ_■ | T ↦ n extends to ℤ[[T]] → ℤ iff nᵏ = 0 for some k, so A°° = 0; A⁺ = ℤ by n-solidity | as stated | none |
| 2.11, 3.4 Check 3 | x ∈ ℤ_p; n ∈ ℤ | ℤ((T⁻¹)) ⊗ B = 0 for the algebra B gives RHom(ℤ((T⁻¹)), M) = RHom_B(0, M) = 0 for B-modules M | every induced module x-solid | none |
| 3.1 API I ∩ P | adjoint triple f_♮ ⊣ f* ⊣ f_* | f_♮ fully faithful iff f_* fully faithful; clopen gives A = B × B′ with B ⊗ B′ = 0 | as stated | none |
| 3.1 Check 3 | RHom_(ℤ_■)(ℤ_p, ℤ), p = 2 | dual of T − p on ⊕ℤe_n injective, coker ℤ[1/2]/ℤ, e₀ ↦ 1/2 of order 2 | (ℚ_p/ℤ_p)[−1] | none |
| 3.7 Check 4 | A = 𝔽_p^cond, R = 𝔽_p | Fun^L_(D(ℤ))(D(𝔽_p), D(A)) = Mod_(𝔽_p ⊗^L_ℤ 𝔽_p)(D(A)), π₁ = 𝔽_p | relative Hom is right | none |
| 4.2 Check 1 | Borel, diag(p, 1) | N(ℤ_p) ↦ N(pℤ_p), p⁻¹ | matches SRLG | none |
| 5.2 criterion | ℤ^cond → ℤ_■ | π₀ iso, L = 0, not an isomorphism | needs induced structure | S03 |
| 5.2 Check 5 | A → A[T]_■ → A | A·dT → 0 → L, so L = A[1] | as stated | none |
| 6.2 Check 3 | B = ℤ[T]/T² | L = [B →2T B dT], π₁ = ker(2T) = ℤT | not projective | none |
| 6.5 Check 4 | k[ε]/ε² → k | k ⊗_A L_(A/k) = k ⊕ k[1] (e ↦ 0), L_(k/A) = k[1] ⊕ k[2], in every characteristic | as stated | none |
| 7.1 Check 4 | u ∈ ℤ[T] with u(X+Y) = u(X)u(Y), u(0) = 1 | degree comparison forces u constant, u = 1 | D(𝔾_a)(Spec ℤ) trivial | none |
| 7.4 Check 1 | B𝔾_m versus ℤ^Betti | m_!(M ⊠ N)_n = M_n ⊗ N_n (pointwise) on B𝔾_m, Day convolution on ℤ^Betti; Δ* on B𝔾_m is Day | FM_h matches both | none |
| 7.5 Check 5 | v_p(n!) | (n − s_p(n))/(p − 1) ~ n/(p − 1); radius r ↦ r p^(−1/(p−1)) | as stated | none |
| 7.7 Checks | a_n = 1; p^(−n²); products | r < 1 works; p^(n²) r^|n| → ∞; (rs)^|n| bound; RJRC Definition 4.4.1 equivalent | as stated | none |
| 6.3(2)/6.6(1) scope | line with doubled origin → 𝔸¹_ℤ | étale, not separated, not in E of 3.4; !-able in 3.5 by source locality | scope ambiguous | S07 |
| Stone duality | ∅, point, discrete pair, Sierpiński, M₃ | 1, 2, 4 elements, 3-chain; M₃ not distributive | true; functor not pinned | S02 |

## Not verifiable

- No Lean was elaborated in this pass (read-only brief); the elaborated signatures were taken from the worker's signatures file, and the repair report records a clean `lake env lean` run at this head.
- The converse direction "a !-cover is descendable" in 1.2 (RCSolid Remark 6.4.1, line 4475, and Remark 6.4.2, line 4490), 3.2 and the 0.12 Check at line 333 rests on the source; I found no counterexample and no independent proof that !-descent of linear categories forces pro-constancy of the Amitsur tower (Mat16 line 948). The forward direction is Mathew's.
- The light-profinite rerun of And21's extremally disconnected argument in 4.4(6), and the highest coherences of 0.5, 0.6, 0.13 and 7.6, were compared with the cited statements, not reproved.
- Ownership against open pull requests was checked through `roadmaps grep` (363 heads) and the sibling checkouts cited by this roadmap; the remaining sibling folders were not opened file by file. The board package RationalAnalyticPrismatization has no design plan on the board; its slug list was taken from its design reviews, as in round 1.

## Source issues

The round-1 issues (RCSolid Proposition 4.4.5, Lemma 7.2.10, Lemma 7.4.5, Corollary 7.4.6, Remark 6.4.1 line 4474, Lemma 6.4.15 "D(Z)", ALRS Remark 2.9.2) were reread at their lines and stand as recorded; they are not repeated. New this round:

- **Misprint** in RCSolid at Corollary 7.4.8, printed page 110 (RCSolid line 5339): the source says a map of analytic rings is an isomorphism iff π₀ is an isomorphism, adding that this gives the induced structure, and L vanishes; it should assume the induced structure as a hypothesis, since π₀ being an isomorphism does not give it (ℤ^cond → ℤ_■ has π₀ iso, L = 0 and is not an isomorphism); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f46473a1fd1a799764a39b3e39c2f4b0ced2d056", "job": "RT-AnalyticStacks~2b", "model": "fable", "worker": "chris-g"} -->
