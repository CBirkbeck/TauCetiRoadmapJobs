<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18060#issuecomment-6909827437 -->
Red team round 2 pass b (claude) of 74646e9

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 7.4 and 6.2(b) apply statements about "geometric" prestacks to `[X/G]^♮`, which need not be an fpqc sheaf

   Location: `packages/QuasicoherentSheavesOnPrestacks/README.md:670`, "Call X geometric if it is a hypercomplete fpqc sheaf with affine diagonal admitting a faithfully flat map" and "For `X = Y^♮` with Y a stack of SchemeAndStackFoundations §1.18 … the heart is"; `README.md:778`–`780` (7.4(b), (d): "the t-structure right complete"); `README.md:787` ("while `QCoh(BG)` is (6.2)").

   Claim: 6.2(b) (levelwise t-structure, completeness, compatibility with filtered colimits, heart) applies to `Y^♮` and to `[X/G]^♮` for every flat affine G over a ring k.

   Witness: `[X/G]` is an fppf stackification (SchemeAndStackFoundations §1.21). For k = ℚ and G the profinite constant group scheme of `Gal(ℚ̄/ℚ)`, `Spec ℚ̄` is a G-torsor trivial over no fppf cover, so `(BG)^♮` fails fpqc descent along `ℚ → ℚ̄`. GR-I line 7883 needs both t-structure properties.

   Repair. The conclusions are true: the route of 6.2(b) never uses the sheaf condition (3.3(c) holds for every prestack, the hypothesis of (a) is on `L X`, connectivity is fpqc-local by 6.1). 8.4 already makes the reduction by hand for `BGL_n`. State it once:

   1. In 6.2(b), after "that is an fpqc surjection (3.3)." insert: "The sheaf condition belongs to the name only. The statements that follow hold for every prestack X with affine diagonal and such a p, and in the classical context for every classical prestack with quasi-affine diagonal and a flat fpqc surjection `p : Spec A → X`: 3.3(c) holds for every prestack, the hypothesis of (a) is a condition on `L X`, and connectivity is fpqc-local (6.1)."
   2. Replace "For `X = Y^♮` with Y a stack of SchemeAndStackFoundations §1.18 with flat affine atlas and affine diagonal, the heart is" by "For `X = Y^♮` with Y a stack of SchemeAndStackFoundations §1.18 whose `Y^♮` has affine diagonal and receives a flat affine map from an affine along which every point lifts after an fppf cover, an fppf sheaf that need not be an fpqc sheaf, this form applies and the heart is".
   3. In the route of 7.4(d) replace "the t-structure right complete" by "the t-structure right complete and compatible with filtered colimits (6.2(b), in its form without the sheaf condition, applied to the map f below)".
   4. Add to the Checks of 7.4: "`[X/G]^♮` need not be an fpqc sheaf. Over ℚ let G be the profinite constant group scheme of `Gal(ℚ̄/ℚ)`, flat and affine, with `O(G)` the colimit over the finite Galois K of `∏_{Gal(K/ℚ)} ℚ`. `Spec ℚ̄` is a G-torsor, since `ℚ̄ ⊗_ℚ ℚ̄ ≅ ℚ̄ ⊗_ℚ O(G)`, trivial over the faithfully flat `ℚ → ℚ̄` and over no fppf cover: a nonzero finitely generated ℚ-algebra has a residue field finite over ℚ, which receives no map from ℚ̄. So its descent datum along `ℚ → ℚ̄` is not effective in `(BG)^♮`, which is not geometric in the sense of 6.2; (b)–(d) reach it through the form of 6.2(b) without the sheaf condition."

   Tested on the refuting instance: for that G and `X = Spec ℚ`, the atlas `Spec ℚ → (BG)^♮` is flat affine and fppf-surjective, its Čech nerve is `Spec O(G)^{⊗n}`, `QCoh = lim Mod_{O(G)^{⊗n}}` by 3.3(c), the transitions are flat, and the heart is the `O(G)`-comodules, as 7.4(c) says.

2. **F02** (P3) 2.3 attributes classical presentability to PrismaticCohomologyPartII §4.0, which states it in another universe

   Location: `README.md:376`, "the colimit-to-limit property, stability with small colimits, pointwise detection of equivalences, presentability and the homotopy category of an affine are PrismaticCohomologyPartII §4.0's `limitOfColimit`, `isEquiv_iff_eval` and `homotopyCategory_spec`".

   Claim: in the classical context, presentability of `QCoh(X)` for a u-small colimit of affines is an import from §4.0.

   Witness: PrismaticCohomologyPartII §4.0 at its open head, first paragraph: presentability is asserted "in a larger universe", and none of the three names states it. `README.md:55` shows `D∞(ℤ)` is not presentable in the universe u+1.

   Repair: replace the quoted clause by "the colimit-to-limit property, stability with small colimits, pointwise detection of equivalences and the homotopy category of an affine are PrismaticCohomologyPartII §4.0's `limitOfColimit`, `isEquiv_iff_eval` and `homotopyCategory_spec`. Presentability is not imported: §4.0 asserts it only in a larger universe, and the statement here, u-presentability (Conventions) for a u-small colimit of affines, is this roadmap's in every context, the classical one included". The sentence that follows ("and the statements here extend them …") is unchanged.

   Tested on the refuting instance: `X = Spec ℤ` gives `QCoh(X) = D∞(ℤ)`, u-presentable (`enhancedDerived_isPresentable`), and with no coproduct of K copies of ℤ for K not u-small, so not presentable in the universe u+1.

3. **F03** (P3) 8.6 identifies the homotopy category through a remark about module spectra, with no supplier for the comparison

   Location: `README.md:907`, "The homotopy category of that ∞-category is the derived category of `k[Γ]`-modules (HA Remark 7.1.1.16, p. 1206)"; repeated at `README.md:902`; *Needs* at `README.md:919`.

   Claim: the homotopy category of `LMod_{k[Γ]}(Mod_k)`, with `Mod_k = Mod_k(D(ℤ))`, is Mathlib's derived category of `k[Γ]`-modules, by that remark.

   Witness: HA line 46277–46283 treats left module spectra over a discrete ring. `README.md:48` says no supplier compares `Mod_A(D(ℤ))` with module spectra; EnhancedDerivedSheaves `moduleSpectra_equiv_derived` is stated for commutative R, and `k[Γ]` is not commutative for Γ = S₃.

   Repair: replace the second API bullet of 8.6 from "The forgetful functor" to its end by:

   "A representation of Γ is a functor from the one-object category of Γ to k-modules, so a complex of representations is such a functor to complexes; localizing at the quasi-isomorphisms (`derivedFamily`) gives a functor `D∞(Rep k Γ) → Fun(BΓ, D∞(k))` over `D∞(k)`, where `D∞(Rep k Γ)` is EnhancedDerivedSheaves E1.3's enhanced derived category of the Grothendieck abelian category `Rep k Γ`. Both forgetful functors to `D∞(k)` are conservative, preserve small limits and colimits and have left adjoints that are `k[Γ] ⊗_k −` on underlying objects, the first because induction of representations is exact; the functor commutes with these left adjoints, so by `barrBeckLurie` it is an equivalence. The homotopy category of its source is `DerivedCategory (Rep k Γ)` (`enhancedDerived.homotopyCategory`). For module spectra over a discrete ring the corresponding statement is HA Remark 7.1.1.16, p. 1206."

   In the statement of 8.6 replace "HA Remark 7.1.1.16, p. 1206, for the homotopy category" by "the second API fact below for the homotopy category". In the *Needs* of 8.6 add "EnhancedDerivedSheaves E1.3 (`enhancedDerived`, `enhancedDerived.homotopyCategory`, for the Grothendieck abelian category `Rep k Γ`), E5:abstract.3 (`derivedFamily`)"; `Rep.equivalenceModuleMonoidAlgebra` is then unused and leaves the *Needs* of 8.6, the contract bullet at `README.md:105` and the Layer 8 Dependencies at `README.md:929`.

   Tested on the refuting instance: for Γ = S₃ and k = 𝔽₃ the route uses no commutativity; both sides are monadic over `D∞(𝔽₃)` with monad `𝔽₃[S₃] ⊗ −`, and `Hom(k, V[i]) = Hⁱ(S₃; V) = 𝔽₃` for the coinduced V of 8.5 on both. For Γ trivial both sides are `D∞(k)`.

Three new findings, all P3 (S01–S03). No statement of `packages/QuasicoherentSheavesOnPrestacks/README.md` or of `packages/QuasicoherentSheavesOnPrestacks/Suggested.lean` was found false. The seven findings of round 1 are repaired at this head. Both files were read in full (945 and 87 lines). No Lean was run: this pass is read-only.

## Round 1 findings at this head

| Finding | State | Repaired passage (README line) | Witness checked |
| --- | --- | --- | --- |
| 1a/F01 (8.5 attribution and *Needs*) | repaired | 885: "`QCoh(BΓ × Spec k) = Fun(BΓ, Mod_k)` (2.3), which is also `QCoh` of `BG = [Spec k/Γ]` (7.1), its fpqc hypersheafification, by 3.3(a)"; 898: "2.2; 2.3 (…); 3.3 (3.3(a), …); 6.3; 7.1 (`BG = [S/G]`); 8.2" | Γ = ℤ/2, k = 𝔽₂: 2.3 gives `Fun(BΓ, Mod_k)`, 7.1 and 3.3(a) the same `QCoh` on `[Spec k/Γ]` |
| 1a/F02 (HNR Theorem 1.1 restated without hypotheses) | repaired | 881: "a quasi-compact, quasi-separated algebraic stack is poorly stabilized when it has a geometric point of positive characteristic … the lisse-étale `D_qc` is not compactly generated … nothing here is deduced from it" | HNR line 43–47 (Theorem 1.1, p. 1), HNR line 436–440 (p. 9); HR-perf line 19–29 for the reworded clause |
| 1a/F03 (four hypotheses of the pinned lemma) | repaired, differently from the proposal | 412: "whose four hypotheses hold for that precoverage: … The last hypothesis is not found by instance search for `fppfPrecoverage` and is supplied by this argument"; contract bullet 98 | Mathlib/CategoryTheory/Sites/PrecoverageToGrothendieck.lean:166–167; Sites/Precoverage.lean:87 and :186; AlgebraicGeometry/Sites/MorphismProperty.lean:77 and :89; Sites/Fpqc.lean:41–43 |
| 1b/F01 (complete reducibility is pinned) | repaired | 113–114 (three Tau Ceti bullets); 865 "(Tau Ceti `TauCeti.Comodule.isCompletelyReducible_of_reductive`, `GL_n` being reductive by …)"; 877; 929 | the four Tau Ceti declarations opened at the cited lines |
| 1b/F02 (contract bullets and *Needs* omissions) | repaired | 128 (`continuousDerivedInvariants`, with its assumption); 138 (four §1.18 names); 141 and 711 (`isPseudoCoherentComplex_affine_iff`) | EnhancedDerivedSheaves README on main, E5:presentability.3; SchemeAndStackFoundations README on main, §§1.18 and 2.18 |
| 1b/F03 (quasi-compactness of `[X/G]`) | repaired | 778: "(d) if X is quasi-compact and `[X/G]^♮` has affine diagonal (4.1), for instance if X is affine"; route at 780 | GR-I line 7872–7899 (Proposition 2.4.3, Lemma 2.4.5): the new route supplies the injective embedding and the Ext vanishing the lemma asks for. Its two t-structure hypotheses are taken from 6.2(b): see S01 |
| 1b/F04 (Zariski, étale, fppf covers of derived test rings) | repaired, differently from the proposal | 445: "A map `A → B` of test rings is an open immersion, étale, or flat of finite presentation when it is flat (Conventions) and the ring map `π₀A → π₀B` is, respectively, …"; Check at 464 | HA line 52701–52705 (Definition 7.5.0.4, p. 1374); `𝔽_p → 𝔽_p ⊗ᴸ_ℤ 𝔽_p`: `π₁(B ⊗_{𝔽_p} B)` has dimension 2, `π₁B` dimension 1 |

No repair introduced a false statement. The repair of 1b/F03 made 7.4(d) depend on 6.2(b) in a case that 6.2(b), as worded, does not cover; that is S01.

## The adversarial pass

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `not_preservesCoproducts_trivial` (Lean; 8.6) | p = 0; p = 1; Γ = 1; Γ = ℤ/2, k = 𝔽₂; Γ = S₃, k = 𝔽₃; Γ = ℤ; index universe w ≠ u | `0 ∣ card Γ` false (card ≥ 1); `CharP k 1` impossible; `p ∣ 1` forces p = 1; `Hom(k, ⊕ k[i]) = ∏ 𝔽₂`, `⊕ Hom = ⊕ 𝔽₂`; `Hⁱ(S₃; Coind 𝔽₃) = Hⁱ(C₃; 𝔽₃) = 𝔽₃`; `Nat.card ℤ = 0` and k is perfect over `k[t^{±1}]`, excluded by `[Finite Γ]`; `J = ULift ℕ` exists in `Type w` and the countable coproduct exists | true as typed; binders equal README 8.6 | none |
| 8.6 API 1 (compactness on the homotopy category) | additive category, coproduct with projections | j-th component recovered, so `⊕ Hom → Hom(K, ∐)` injective; bijective iff finite factorization (HA line 5813–5816) | holds | none |
| 8.6 API 2 (homotopy category) | Γ = S₃, k = 𝔽₃ | `k[S₃]` not commutative; cited remark is for module spectra | route unsupported | S03 |
| 8.5 | Γ = 1; ℤ/p over 𝔽_p; S₃ over 𝔽₃; ℚ | `Hⁱ = 0`; `Hⁱ = 𝔽_p` (norm = p = 0, g − 1 = 0); `H¹ = H² = 0` trivial coefficients, coinduced V of dimension 2 has `Hⁱ = 𝔽₃`; `Hⁱ = 0` | holds | none |
| 8.5, HNR and HR-perf sentences | `B(ℤ/p)`, `BG_a` over 𝔽_p | identity component of ℤ/p trivial, not poor; `G_a` not semi-abelian, poor (HNR line 439) | consistent with the last Check (`k[Γ]` compact generator) | none |
| 8.4 | `B(ℤ/p)` over ℚ; `K(ℤ, 2) × Spec ℚ`; `BG_m`, `M = O[1]`; `P = Spec ℚ(i)` with `X = G` and with `X = ℙ¹` | `Hⁱ = 0`; heart = ℚ-spaces, `π₀ Map(O, O[2]) = ℚ`; `Map = K(ℚ, 1)`; `P ×^G G = Spec ℚ(i)`, no ℚ-point; invariants `ℚe₁ ⊕ ℚ·ie₂` | holds; `lim¹` step: `π₀ RΓ(τ_{≤m} M)` constant for m ≥ 0, fibre in degree m | none |
| 8.3 | `A = k[ε]/(ε²)`; doubled line with `L₁`, `L₋₁`; (c) classical clause | `Ω¹_{A/k} = A dε/(2ε dε)`: `k·dε` or `A·dε`, nonzero; sections `(1, y)`, `(x, 1)` with loci the two charts (Stacks tag 0FXT); base change is a qcqs scheme with affine diagonal | holds | none |
| 8.2 | `Spec A`; `BG_m`; `⨿_ℕ Spec ℤ` as scheme and as prestack; `Spec 𝔽₂` | perfect; weight-n part preserves colimits; `Hom(O, ⊕ O_i) = ∏ ℤ ≠ ⊕ ℤ`, diagonal fibre `Spec(Re)` versus ∅; `Map(O, 0 ⊕ 0)` one point versus two | holds | none |
| 8.1 | `Spec A`; `ℙ¹`; `⨿_ℕ Spec ℤ` | generator O; `O ⊕ O(−1)`; O dualizable, not compact | holds (Stacks tags 09IS, 09M1 read) | none |
| 7.4(a)–(c) | G trivial; `G_m` over ℤ; G profinite Galois over ℚ | `h_X`; graded groups; `(BG)^♮` not an fpqc sheaf, heart still `O(G)`-comodules | conclusions hold; cited hypothesis fails | S01 |
| 7.4(d) | ℤ/p over 𝔽_p; `G_a` over 𝔽_p; doubled plane | `Extⁱ = 𝔽_p` both sides; `D(heart)` not left complete (SAG line 33965–33968); chart map not affine | holds on `+`; GR-I line 7883 hypotheses met through 6.2(b) | S01 |
| 7.3 | Γ = 1; ℤ acting trivially; `σ(x) = 2x`; d = 0 | `QCoh(X)`; `H¹(ℤ; C) = C`; `id(x·1) = x ≠ 2x`; `D∞(C)` | holds; coconnectivity through the left adjoint `⊕_γ γ^*` | none |
| 7.2 | G trivial; translation; `G_m`; Ĥ on itself | `QCoh(X)`; `QCoh(S)`; `ℤ[t^{±1}]`-comodules; `M ⊗_Λ O(Ĥ)` dualizable iff M perfect | holds | none |
| 7.1 | `[∅/1]`; constant ℤ/2 at `ℤ × ℤ`; `O(G) = ℤ × 𝔽_ℓ`; `Spec 𝔽₂` as absolute group | `Spec 0`; 2 points versus 4; `ℓ(e + e′ − 2ee′) = 0`, not flat; `Hom(𝔽₂, ℤ) = ∅` | holds | none |
| 6.4 | `⊕ ℤ[−i]` on `Spec ℤ`; k over `k[ε]/(ε²)` | `π₀ Map(F, G) = ∏ π_{−i} G`, not finitary on `≤ n`; almost perfect, not perfect | agrees with SAG line 26798–26802 | none |
| 6.3 | `ℤ ⊕ ℤ[3]`; ℚ; `O[1]`; `O ⊕ O`; ℤ/p | dual `ℤ ⊕ ℤ[−3]`; not dualizable; invertible; evaluation rank 4 → 1; dual `ℤ/p[−1]` not connective | holds | none |
| 6.2(b) left completeness | limit of left complete categories along t-exact functors | `lim_α lim_n (C_α)_{≤n} = lim_n (lim_α C_α)_{≤n}`, so the comparison is a limit of equivalences, although limits are not computed levelwise | holds | none |
| 6.2(b), quasi-affine clause | doubled plane Z | diagonal fibre `𝔸² ∖ 0`; Stacks tag 02JR (quasi-compact immersion is quasi-affine) read | holds | none |
| 6.1 | truncatedness; `⊕_ℕ O` | `𝔽_p ↦ 𝔽_p ⊗ᴸ 𝔽_p`, `π₁ ≠ 0`; flat, not perfect | holds | none |
| 5.2 | truncation tower `τ^{≥−m} K` | `H^q` of successive terms: isomorphism for q ≥ −m, `0 → 0` or onto 0 below, so the surjectivity hypothesis of Stacks tag 0A0J holds | holds | none |
| 5.1, 5.3, 5.4 | ℤ/2 on `Spec ℤ`; `ℙ¹`; `⨿_ℕ Spec ℤ`; `ℙ¹_ℤ` with `ℤ → ℚ` | cohomology in degrees 0, −1; k both sides; product; `ℚ[−1]` | holds (tags 06Z0, 08DZ, 08EU, 08IB read) | none |
| 4.1 | sieve of `{ℤ[1/2], ℤ[1/3]}`; `BG → Spec k`; `𝔸² ∖ 0 → 𝔸²` | `Y(ℤ[1/2] × ℤ[1/3]) = ∅` versus a point; `π₁ = G(O(G)) ∋ id`; not affine | sheaf hypothesis needed, as stated | none |
| 4.2 | identity; `R → R[t]`; classical `Spec 𝔽_p → Spec ℤ` | identities; `R[t]`; `𝔽_p` versus `𝔽_p ⊗ᴸ 𝔽_p` | flatness needed in `CRing`, as stated | none |
| 3.4 | `ℙ¹`, `O(−2)`; empty scheme; doubled plane with `R = k[x, y, a, b]/(ax + by − 1)` | cokernel `k·t⁻¹`; `h_∅ = Spec 0`; fibre two points, contractible on `D(x)`, `D(y)` | holds | none |
| 3.3 | `∅ → Spec 0`; `Spec 𝔽_p → Spec ℤ` | both `QCoh` zero; totalization kills ℚ | holds | none |
| 3.2 | identity; `ℤ → ℤ[1/2] × ℤ[1/3]`; `ℤ → 𝔽_p × ℤ[1/p]`; step (4) | `Mod_A`; fibre `ℤ[1/6][−1]`, `Ext² = 0`, no retraction; equalizer ∋ (1, 0); coface maps are composites of pushouts of latching maps, flat | holds | none |
| 3.1 | empty family; `𝔽_p → 𝔽_p ⊗ᴸ 𝔽_p`; `Spec 𝔽_p ⊔ Spec ℤ[1/p] → Spec ℤ`; constant `𝔽_p` cosemisimplicial ring | covers 0 only; `π₁`: 2-dimensional versus 1; `𝔽_p ⊗ ∏ R_i = 0`; `L₁`: `𝔽_p` versus `𝔽_p ⊗ᴸ 𝔽_p` | holds | none |
| 2.5 | `B(ℤ/2)` at ℝ, `ℝ × ℝ`; `ℤ → ℤ[1/p] × ℤ_p`; `{ℤ[1/n]}` | two components, `π₁ = ℤ/2`, `(ℤ/2)²`; `ℤ_p` uncountable; n = 2, 3 cover, n = 2 alone misses (2) | holds | none |
| 2.4 | `Spec(𝔽_p ⊗ᴸ 𝔽_p)`; classical fibre product | `ι^* = Spec 𝔽_p`; `ι_!` gives `Spec 𝔽_p`, images give the derived one | holds | none |
| 2.3 | class on `B(ℤ/2) × Spec 𝔽₂`; `Spec ℤ` and presentability | nonzero with zero evaluations; `D∞(ℤ)` u-presentable, not in u+1 | holds; attribution of presentability wrong | S02 |
| 2.1, 2.2 | `Spec 0`, ∅; `Spec A ⊔ Spec B` | point versus ∅ at the zero ring; `Mod_A × Mod_B` | holds | none |
| 1.5 | empty diagram; `(ℤ, ℚ)`, `(ℤ, ℤ[1])`, `(ℤ, ℤ²)`; ordinary square of `ℤ → 𝔽_p` | terminal; not dualizable, invertible, rank 4 → 1; mate not an equivalence | holds | none |
| 1.4 | k over `k[ε]/(ε²)`; k over `k[x₁, …]`; ℤ/p | `Tor_i = k` all i; ideal not finitely generated; not locally free | holds | none |
| 1.3 | `ℤ → ℤ[1/p] × ℤ_p`; `ℤ → ℚ`; `ℤ → 𝔽_p` | every prime lies under one; `ℚ ⊗ ℤ/p = 0`; not t-exact | holds | none |
| 1.1, 1.2 | `𝔽_p ⊗_ℤ 𝔽_p`; free object on `ℤ[0]`; `ℤ × ℤ`; 0 | `π₁ = 𝔽_p` derived, 0 classical; `H₁(BΣ₂; ℤ) = ℤ/2`; product `ℤ²` versus coproduct ℤ; `Mod_0 = 0` | holds | none |
| Conventions | K not u-small; `∏ ℤ[−i]`, `⊕ ℤ[i]`; Beck–Chevalley on `𝔽_p` twice | `∏_K ℚ/ℤ` not u-small; 0-truncated not bounded below, connective in no `≤ n`; source `𝔽_p ⊗ᴸ 𝔽_p`, target `𝔽_p` | holds | none |
| gap:chevalley-quasiprojective-quotient | ReductiveGroups Layer 3 on main; pinned Tau Ceti | Layer 3 forms the fppf sheaf quotient `G/H` for any closed H and records representability as a theorem with hypotheses; no quasi-projectivity statement; no `QuasiProjective` at the pin | precise, minimal, same slug in `design/plan.json` | none |
| gap:twist-quasiprojective | SchemeAndStackFoundations §1.16 on main | `contractedProduct_isAlgebraicSpace` only; polarised descent there is a StableReduction import, not the twist statement | precise, minimal, same slug | none |

## Verified sound

- **Declarations read: 1.** `not_preservesCoproducts_trivial`: the elaborated type in the job's signature table was compared binder by binder with README 8.6 (`k`, `Γ` in one universe, `[Finite Γ]`, `CharP k p`, `p ∣ Nat.card Γ`, `HasDerivedCategory.{w}`); the body equals StableHomotopyKTheory §5.17's `IsCompactForCoproducts` as stated on main. One `import Mathlib`, no `set_option`, no sorry'd data, `theorem`, one module docstring naming every headline that is not statable and what it lacks. Not padding: its proof needs Cauchy, Shapiro, the cyclic computation and a coproduct in the derived category. The `#check @name` comparison was not run (no Lean in this pass); the file is unchanged since the repair worker ran it.
- **Headlines.** 3.2; 2.4 with 3.3; 4.2; 5.3; 6.2–6.3; 7.2–7.4; 8.1; 8.2–8.4; 8.5 with 8.6. Only 8.6 is statable at the pins: neither pinned library has limits of ∞-categories, `Mod_A`, animated rings, `DQCoh` or compact objects (grep of both pins), and Tau Ceti's quasicategory files are those the docstring names.
- **Targets read: 34**, each with its *Needs* line; no forward reference.
- **Pinned declarations opened at the cited file and line: 55** (46 Mathlib, 9 Tau Ceti); all exist there with the described statement. Mathlib has no compact-object notion for additive categories and no Kan-complex instance for nerves of groupoids (grep at the pin), as the README says.
- **Supplier citations resolved now.** On main: 21 names of SchemeAndStackFoundations (§§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18; §§1.16, 1.21, 1.22 read), 26 names and ids of EnhancedDerivedSheaves (eight statements read against their use here, among them `tot_filteredColimit_of_bounded`, `rightAdjoint_preservesCoproducts_iff`, `presentable_limit`, `homotopyFixedPoints`, both hypercover statements), StableHomotopyKTheory §5.17, ReductiveGroups Layers 1 and 3, DerivedModuleAlgebra §1.E.0. At open heads: all 39 labelled statements of the InfinityCategoryTheory Parts (each printed and compared with the sentence citing it; HypercompletenessAndCoherence §1.2 does state the left exact localization, after 1.2.1), 16 names of PrismaticCohomologyPartII §4.0, LanglandsParameterStacks §§1.7–1.8, HabiroCohomologyFoundations §§1.27–1.28, AnalyticStacks §§1.1–1.2 (consumer). The job's citation list has no cross-roadmap citation found nowhere; its 12 Lean-name leads are qualified names of suppliers' READMEs and all exist there.
- **Ownership.** No declaration of another roadmap has the name `not_preservesCoproducts_trivial` (grep of main). The overlap list has no pull request changing this roadmap, no dropped id and no close roadmap by results; the three partial owners are the imports the README names. Ownership against the open pull requests was checked through the board's index of their heads (`roadmaps show`), not through every checkout.
- **Locators.** 97 statements of SAG, HA, HTT and BZFN located mechanically by label in the cached texts, 58 of them with the cited page equal to the page marker and the rest cited without a page at first mention or by a page range; of these I read 12 in full (SAG D.6.1.1, D.6.1.3, D.6.1.4, 9.1.0.1, 9.1.3.1, 9.1.3.2, 9.1.5.1, 10.4.6.8, 10.4.6.9; HA 1.4.4.1, 7.1.1.16, 7.5.0.4). Also read: GR-I Proposition 2.4.3 and Lemma 2.4.5; HNR Theorem 1.1 and §4; HR-perf Introduction; and all 18 Stacks tags, the eight that round 1 could not read included (0FXR, 0FXS, 0FXT, 02JR, 023Q, 0245, 06WG, 06WT), after fetching the chapters *Morphisms of Schemes*, *Descent* and *Sheaves on Algebraic Stacks* through the sources service. Each supports the statement it is cited for.
- **Checks: 38 rows above recompute Checks, conventions and examples; every section has at least three Checks; none found false or vacuous.**
- **Gaps.** Both slugs are in `design/plan.json` and under the supplier's subsection of the README with the same `needs`; neither asks for something already provided (rows above).
- **Policy.** The pull request changes only `packages/QuasicoherentSheavesOnPrestacks/`. No pull-request number, process narrative, `set_option`, machine path or Lean `lemma` in the README or the Lean file; every target has a locator.
- **Dependency check**, full output:

```
depcheck: 249 roadmaps, 2379 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- **Wording.** Eight passages set beside their sources: 8.5 against HNR line 436–439 (longest shared run 3 words) and HR-perf line 28–29 (4 words); 3.1's étale maps against HA line 52701–52705 (a definition, forced); 6.4's criterion against SAG line 26798–26802 (4 words); 6.2(b)'s "geometric" against SAG line 26462–26467; 7.4(d)'s route against GR-I line 7883–7899; 8.6's first API fact against HA line 5813–5816 (5 words); the docstring of the Lean theorem against HR-perf line 19–29. None reproduces a sentence or follows one clause by clause. The doubled-line Check of 8.3 restates one example of Stacks tag 0FXT in its own words with the tag.
- **Arrangement.** SAG has the largest share, 68 of 209 locators (HTT 55, HA 38, Stacks 17, GR-I 16, BZFN 10, HNR 2, HR-perf 2, SGA1 1). Against SAG's contents (SAG line 17016–17027, 26413–26419): Layer 2 ↔ §6.2.2 with parts of §§6.2.3, 6.2.6; Layer 3 ↔ Appendix D.6 with §6.2.3; Layer 4 ↔ §6.3.4; Layer 5 ↔ §6.2.4; Layer 6 ↔ §§6.2.5–6.2.6, 9.1; Layers 1, 7, 8 rest on HA, GR-I, BZFN. No run of layers maps one to one, in order and with the same scope, onto a run of SAG sections; the order is forced by 3.2 → 3.3, 3.4 → 5.3, 4.1 → 6.2, 6.2 → 7.1.

Source independence: 8 passages compared with 5 sources, none shared; largest share SAG, 68 of 209 locators; contents compared with SAG: independent.

## Not verifiable

- Whether instance search at the pin fails to find `HasIsos` for `fppfPrecoverage` (README lines 98 and 412): this needs elaboration, which this pass may not run. The repair report records the elaboration; the mathematical argument that replaces the instance was checked against Mathlib/AlgebraicGeometry/Sites/MorphismProperty.lean:89.
- The `#check @name` comparison: not run, for the same reason.
- `TauCeti.Comodule.isCompletelyReducible_of_reductive`: the `[CharZero k]` binder sits in a `variable` block above the cited line; I read the file, not the elaborated type.
- That EnhancedDerivedSheaves' derived invariants for a finite discrete group are the limit over BΓ that 8.5 uses: the README marks it "Assumed" (line 128), and the supplier states it for discrete modules of a profinite group.

## Source issues

- **Misprint** in SAG at the proof of Proposition 9.1.5.1, printed p. 737: the source says the opening four words of the sentence choosing the atlas twice in a row; it should say them once; affects nothing.
- **Misprint** in SAG at Warning 10.4.6.9, printed p. 930: the source says the classifying stack is G and then forms the derived category of the heart of QCoh of X; it should use one letter for the stack; affects nothing.

## For the human reviewers

- **Scope.** The only Lean declaration (`packages/QuasicoherentSheavesOnPrestacks/Suggested.lean:79`) is a statement about Mathlib's `DerivedCategory (Rep k Γ)` whose route (README 8.6) uses none of the ∞-categorical layers; every other headline is listed as not statable.
- **Scope.** GR-I works over a field of characteristic zero (README References); it is cited beside SAG or HA locators for statements the roadmap proves over ℤ.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "74646e9cd750b353293c625510cfc5fc8e4d7b70", "job": "RT-QuasicoherentSheavesOnPrestacks~2b", "model": "fable", "worker": "chris-x55"} -->
