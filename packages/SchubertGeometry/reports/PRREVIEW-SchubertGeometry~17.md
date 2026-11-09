# Review of SchubertGeometry (pull request #1224 at a9b73a3)

**Verdict:** accepted

This is an incremental re-review of 60 changed lines since d65c5f0, all of them in `TauCetiRoadmap/SchubertGeometry/README.md`. `Suggested.lean` is byte-identical to d65c5f0 (`git diff --stat d65c5f0 HEAD -- Suggested.lean` is empty), and nothing outside the folder changes. Both findings of the previous review are repaired, and the repairs introduce no new problem. Every library name below was opened at the pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b` (the revisions of `lake-manifest.json`). Every roadmap citation was resolved on main `3090489`.

No findings.

## Previous findings

- R01 — repaired: (1) S1.1's *Needs:* (685–694) now names the tensor product with both comparisons, `FiniteLocallyFreeSheaf.dual`, `exteriorPower` and `det` with `pullbackDualIso`, `pullbackExteriorPowerIso` and `pullbackDetIso`. (2) A Picard paragraph (113–131) names `LineBundleClass`, its group laws, `pullbackHom`, `InvertibleSheaf.pullback`, `IsAmple` and `IsGloballyGenerated`; S3.1 (952–953, 973) lands the forgetful map in `LineBundleClass` and cites it. (3) Lines 145–149 name both `isIso_pullback_δ_of_isQuasicoherent` and `_right`, left and right factor.
- R02 — repaired: S2.3's *Needs:* (880) now says the chain “is the first step of the proof in KnutsonBottSamelson §4, p. 4 (lines 141–145) of the subword statement there … (lines 137–138)”, that the proof's further claim “differs from the product of the word for some nonreduced words: for Q=(i,i) they give s_i while the product is e”, and “Only the chain is used here.” That matches the source and S2.3's own Demazure-product convention.

## Verified sound

**Gate, build and dependencies.**

- My own gate run on a9b73a3: every check is 0, and the run ends `OK`. The worker's `scratch/gate.md` agrees.
- `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean`: five `declaration uses sorry` warnings (lines 68, 79, 91, 107, 123) and nothing else, in 8 s.
- The five elaborated signatures in `scratch/signatures.md` were computed at this head; since the file is unchanged since 3cffcc8, the previous reviews' `#check @name` comparison with the README statements and the one-tactic probe (no declaration closes with `simp`, `rfl` or a library `exact`) still hold. No section binder is lost: every instance in each elaborated type occurs in its statement.
- Dependency check: `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`; the output has no UPWARD, CYCLE or `moved:` line (grep count 0).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchubertGeometry'` is empty.
- `scratch/overlaps.md`: no open pull request changes this folder, no cited id is dropped by an open pull request, no id of this roadmap that others cite is dropped, and nothing cited is defined only by an open revision.
- `git diff --stat 1bea835 3090489 -- TauCetiRoadmap/{StableReduction,AlgebraicVectorBundles,ReductiveGroups,SchemeAndStackFoundations,ModularCurves}` on main is empty, so every cross-roadmap citation the previous reviews resolved resolves unchanged. The five “found nowhere” leads of `scratch/citations.md` (BrionFlags §1.2, KnutsonBottSamelson §1, KnutsonDemazure §4.0.2, SerreGAGA §12, KnutsonSymplectic §4) are source ids of `sources.toml`, not roadmaps.
- The README flags no locator as unverified (grep for “unverified”/“not verified”: 0).

**Library declarations opened at the pin (file:line in `TauCeti/AlgebraicGeometry/`), compared with what the README says of them.**

- `LineBundleClass X := Skeleton (InvertibleSheaf X)` (`LineBundle/Class.lean:50`), “the type of isomorphism classes of invertible sheaves”: correct. `Inv` is `dual` (:95–96, :99 `inv_eq_dual`), where `LineBundleClass.dual` lifts `InvertibleSheaf.dual` (:86–93); `Mul` is `tensorProduct` (:110–116), `Quotient.map₂` of `InvertibleSheaf.tensorProduct`; `One` is `mk (InvertibleSheaf.trivial X)` (:124–125), and `trivial X = free X PUnit` (`LineBundle/Basic.lean:144–145`), the structure sheaf as a module over itself; `CommGroup` at :142. So “product induced by `tensorProduct`, inverse by `dual`, unit the class of 𝒪_X” is exact.
- `InvertibleSheaf.dual` (`LineBundle/Dual.lean:44`) is `⟨L.obj.dual, …⟩`, the internal Hom into the structure sheaf (docstring :43 and `dual_obj` :49–51): the README's “the internal Hom into 𝒪_X” is right.
- `LineBundleClass.pullbackHom f : LineBundleClass Y →* LineBundleClass X` (`LineBundle/Functoriality.lean:189–190`), `MonoidHom.mk'` of `pullback f`: “pullback of classes along a morphism of schemes, as a group homomorphism”.
- `InvertibleSheaf.pullback f : InvertibleSheaf Y ⥤ InvertibleSheaf X` (`LineBundle/Pullback.lean:100`): “pullback of the sheaves themselves”.
- `LineBundleClass.IsAmple a` (`LineBundle/Ample.lean:71–78`): a structure with `compactSpace : CompactSpace X` and, for each `x`, some `n > 0`, some `L` with `mk L = a ^ n`, and a global section `s` with `x ∈ nonvanishingLocus s` and `IsAffineOpen (nonvanishingLocus s)`. The README's sentence at 124–126 restates exactly these fields. `isAmple_one_iff : (1).IsAmple ↔ X.IsQuasiAffine` (:98) is what the new S3.1 Check uses.
- `InvertibleSheaf.IsGloballyGenerated L` (`LineBundle/GlobalGeneration.lean:139–140`) is `∀ x, ∃ s : Γ(L.obj, ⊤), x ∈ L.obj.nonvanishingLocus s`: “at every point some global section does not vanish”.
- `isIso_pullback_δ_of_isQuasicoherent` (`Modules/Pullback/Quasicoherent.lean:151`, `[M.IsQuasicoherent]`, the left factor) and `_right` (:172, `[N.IsQuasicoherent]`): both now cited, each for its factor.
- `FiniteLocallyFreeSheaf.det : FiniteLocallyFreeSheaf X → InvertibleSheaf X` (`VectorBundle/Determinant/LocallyConstantRank.lean:62`), `pullbackDetIso` (`Determinant/Pullback.lean:156`), `dual` (`Dual/Basic.lean:64`), `pullbackDualIso` (`Dual/Pullback.lean:46`), `exteriorPower` (`ExteriorPower/Basic.lean:56`), `pullbackExteriorPowerIso` (`ExteriorPower/Pullback.lean:49`): as in r16. For S1.0's line det(Lie(P_univ))*, `det` lands in `InvertibleSheaf`, and `InvertibleSheaf.toFiniteLocallyFree : InvertibleSheaf X ⥤ FiniteLocallyFreeSheaf X` (`VectorBundle/FiniteLocallyFree.lean:221`, full and faithful at :227–230) carries it back, so the four cited natives compose; alternatively `dual` first then `det` gives det(Lie*), canonically det(Lie)*. The citation is sound either way.

**The changed passages, read against their consumers.**

- Contract 129–131: “S3.1's forgetful map lands in `LineBundleClass` of G/P−, its ampleness and global-generation statements are these two predicates, and S3.5 consumes the latter through S3.1.” S3.1 (927, 952–953) says exactly that; S3.5's *Needs:* (1068) reads “S3.1's global generation and the scheme closed-immersion criterion”.
- Contract 149–150: “S1.0, S1.1 and S1.4 use these sheaf operations and S3.1 the tensor comparison.” S1.0 (657–662) names `det`, `pullbackDetIso`, `dual`, `pullbackDualIso` and its body (605–606, 617) names det(Lie(P_univ))*; S1.1 (687–693) names all of them; S1.4 (742) names `exteriorPower` with `pullbackExteriorPowerIso`; S3.1 (973) names both tensor comparisons.
- S3.1 927: the ampleness statement is made “over an affine base” and otherwise “on the preimage of every affine open”. That is the right scoping: `IsAmple` requires `CompactSpace X`, which G/P− has over an affine base (proper over it) and need not have over a general base, and the native predicate is absolute, not relative.
- S3.1 hypotheses agree with S3.5's (1056–1058): λ zero on the Levi simple coroots and positive on the complementary ones.
- S2.3 880 against the source: KnutsonBottSamelson lines 137–138 state the “related result” (every word for v has a reduced subword with product v); 141–145 give the chain of initial-segment images and the letters where the image jumps; 146–148 claim that subword has the word's product. The README's line ranges and description match.

**Seeded sample.** None of the fifteen sampled targets (S1.4, S2.2, S2.5, S3.3, S3.4, S3.6, S4.6, S5.1, S5.4, S5.5, S5.7, S7.2, S7.3, S8.4, S8.5) is touched by this change; the previous full reviews read their locators, and their adversarial rows are carried below.

**Adversarial table.** Rows marked “r15” or “r16” are carried from those reports (`PRREVIEW-SchubertGeometry_r15`, `_r16`) for statements this diff leaves untouched. The other rows were computed this round for the changed passages.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Picard group laws (113–119) | GL₂/B− = ℙ¹; torus flag = point; (a,b) ∈ X*(T) = ℤ² | class of L(a,b) is O(a−b); L(a,b) ⊗ L(c,d) ↦ O(a−b+c−d) = product; dual ↦ O(b−a) = inverse; (1,1) ↦ O(0) = unit; kernel ℤ(1,1) = restrictions of X*(GL₂) (S3.1 964); on a point Pic = 0, every class = 1 | pass |
| `IsAmple` description (123–126) and Check 971, ℙ¹ | λ = 0: 𝒪 on ℙ¹_k | sections of 𝒪^{⊗n} = 𝒪 are k; nonvanishing locus of c ≠ 0 is ℙ¹ (not affine), of 0 is ∅; no point has an affine nonvanishing locus, so not `IsAmple`; equivalently `isAmple_one_iff` and ℙ¹ not quasi-affine (proper of dimension 1); `IsGloballyGenerated` holds via s = 1 | pass |
| Check 971, O(1) | λ = ω on SL₂/B− | sections x, y; nonvanishing loci 𝔸¹, 𝔸¹, affine, covering; ℙ¹ compact; `IsAmple` with n = 1 | pass |
| Check 971, torus | T over affine S; over S = ℙ¹ (hypothesis control) | flag = S, L(λ) = 𝒪_S, class 1; s = 1 has nonvanishing locus S, affine, S compact, so ample; over S = ℙ¹ the same class is not ample, which is why S3.1 restricts to affine bases | pass |
| Global generation hypothesis (927) | λ = −ω on SL₂/B− (not dominant) | L(−ω) = O(−1) has H⁰ = 0, so no section is nonvanishing anywhere: `IsGloballyGenerated` fails, the dominance hypothesis is needed; λ = 0, ω pass | pass |
| S1.0 *Needs:* det(Lie(P_univ))* (657–662) with Check 622 | GL₂ over ℤ, Borel component ℙ¹ | Lie(B) rank 3 inside trivial 𝔤 of rank 4; det(Lie B) ⊗ det(𝔤/Lie B) = det 𝔤 = 𝒪, so det(Lie B)* = det(T ℙ¹) = O(2), degree 2 as Check 622 says; det(Lie B*) ≅ det(Lie B)*, so dual-first and det-first agree | pass |
| S1.1 *Needs:* (685–694) | r16 instances: rank 3, ranks (1,2); Spec(k×k), ranks (1,2) | annihilator flag ranks (2,1) via `dual`; det = ∧¹ on one point, ∧² on the other, rank 1, via `det` at locally constant rank; all now named | pass |
| Tensor comparison (145–149) | M quasi-coherent, N arbitrary; M arbitrary, N quasi-coherent | left case :151, right case :172, both named | pass |
| S2.3 chain and δ (880) | Q = (i,i); (i,i,i); (1,2,1,2) in A₂ | images point, X(s_i), X(s_i) [, X(s_i)]: grows at letter 1 only; growing letters multiply to s_i = δ; ordinary product e for (i,i), s_i for (i,i,i), as the text says; (1,2,1,2): grows at 1, 2, 3, product w₀ = δ, ordinary s₂s₁ | pass |
| r16 · Tau Ceti sheaf operations: ranks | E of rank r = 0, 1, 2; ∧ⁿ for n = 0…3 | dual rank r; rank of ∧ⁿE is C(2,n) = 1, 2, 1, 0; det rank 1 for r = 0, 1, 2 | pass |
| r16 · Graded algebra (151–155) | Sym(𝒪²) on Spec k; grading with degree-0 part j_!𝒪_U | ranks 1, 2, 3, Proj = ℙ¹; j_!𝒪_U not quasi-coherent, excluded | pass |
| r16 · S1.4 *Needs:* and Checks | k[ε]: line e₁+εe₃, plane ⟨e₁,e₂⟩ | F₁ → E/F₂ sends the generator to εe₃; ideal (ε) ≠ 0 while reduced value is 0; ∧²F₁ = 0 so ideal 0, not the unit ideal | pass |
| r16 · S2.3 δ(Q) (LLM) | Q = (1,2,1,2), (2,1,1) | recursion s₁, s₁s₂, w₀, w₀; s₂, s₂s₁, s₂s₁; longest reduced subwords agree | pass |
| r16 · Scope (63–65) | S7.3 text | flag-specific Chow-to-cohomology comparison only | pass |
| r15 · Lean thm 5 (decomposition) | SL₂ λ=μ=ω | heights 0, −1 ≥ −1; (e^(2ω)+1+e^(−2ω))+1 = (e^ω+e^(−ω))² | pass |
| r15 · Lean thm 5 | SL₂ λ=ω, μ=2ω | heights 0, −1, −2; −2 fails; char B(3ω)+char B(ω) = e^(3ω)+2e^ω+2e^(−ω)+e^(−3ω) = (e^ω+e^(−ω))(e^(2ω)+1+e^(−2ω)) | pass |
| r15 · Lean thm 5 | PGL₂ λ=μ=α | heights 0, −1, −2 ≥ −2; 5+3+1 = 9 terms of (e^α+1+e^(−α))² | pass |
| r15 · Lean thm 5 | SL₂ λ=0, μ=2ω | only the straight encoding has height ≥ 0; right side char B(2ω) | pass |
| r15 · Lean thm 5 | empty root system | 1·1 = 1 | pass |
| r15 · Lean thm 4 | PGL₂ λ=α; SL₂ λ=ω | (1−e^(−α))(e^α+1+e^(−α)) = e^α−e^(−2α); e^ω−e^(−3ω) | pass |
| r15 · Lean thms 1–3 | SL₂ shape 2, straight path | H = 2t; lowerings give endpoints 0, −2; raising reverses; three encodings by 0, 1, 2 lowerings | pass |
| r15 · S1.2 | S₃; torus; GL₃ | (123)⁻¹ = (132); one point; 6 and 3 fixed points | pass |
| r15 · S1.3 | Gr(2,4) pivots (1,2), (1,3), (3,4) | Σ(p_i−i) = 0, 1, 4; \|λ\| = 4, 3, 0 | pass |
| r15 · S1.5 | m = 1 | ω(u₁,f₁) = +1, Gram −J; native partner gives −1 | pass |
| r15 · S3.3 | m = 0, −1, −2, 1 | e^λ; 0; −e^(λ+α_i); Δ_i(e^λ) = 0 vs D_i = e^λ+e^(λ−α_i) | pass |
| r15 · S3.4 char 0 | SL₂ λ=ω | D_(w₀)e^ω = e^ω+e^(−ω) | pass |
| r15 · S4.1 Checks 1–4 | {tω, −tω}; −ω/2 then 3ω/2; kω then −kω; B(2ω) ∪ {c} | (ε,φ) = (0,1), (1,0); min −1/2, −3/2; ε = φ = 0 for k ≥ 1; σ(fπ₀) = c ≠ f(σπ₀) = π₁ | pass |
| r15 · S4.2 Checks | SL₂ straight; GL₂ (t,t) | lowers to −tω; f undefined when H(1)−min H = 0 < 1; strings 0 | pass |
| r15 · S4.3 Check 1 | bond 2 | 2·(1/2) = 1, 2·(1/3) = 2/3 | pass |
| r15 · S4.4 characters | PGL₂, SL₂, λ = 0 | J(1) = Δ gives char B(0) = 1; unshifted alternant gives 0 | pass |
| r15 · S5.6 | ℙ¹/ℤ; empty union; k[ε] chart | ranks 1, 2, 3 over ℤ, 𝔽₂, 𝔽₃; 0; ε ≠ 0 | pass |
| r15 · S6.1 | ℙ¹ O(1), O(2), O | 1, 2, 3; 3 in degree 1; Proj a point | pass |
| r15 · S7.2 | ℙ¹ O(m); Gr(2,4) X_(1) | m·[e]; p₂₄ = 0 gives p₂₃ = 0 and p₁₄ = 0; dimensions 3 and 1 | pass |
| r15 · S8.1 | ℙ¹; point; Gr(2,4) | [O]−[O(−1)]: rank 0, χ = 1; ℤ; six classes, χ = 1 each | pass |
| r15 · S8.2 | SL₂ | ℤ[z]/(z−1)², rank 2 = rank K₀(ℙ¹) | pass |
| r15 · S9.0 points and GAGA | 𝔸ⁿ (n = 0, 1, 2); G_m; doubled origin; O(−2) on ℙ¹ | point, ℂ, ℂ²; ℂ^× ⊂ ℂ open; non-Hausdorff; H⁰ = 0, H¹ = ℂ | pass |
| r15 · S9.6 | SU₂; torus; SU₃ | ℝP²: ℤ, 0, ℤ/2; point; χ = 1 | pass |
| r15 · S9.8 | SL₂ weight 1; 0; torus | O(1), degree +1; trivial line; one point | pass |
| r15 · Worked: type A | rows (1,0,2,0), (0,1,0,3) | minors 1, 0, 3, −2, 0, 6; 6−0−6 = 0; p₁₂ = 2, p₃₄ = 12 after the frame change | pass |

**Remarks on untouched text (no change asked).**
- The contract sentence at 107 says S9.8 uses `InvertibleSheaf` as the carrier of the associated lines; S9.8's text (1896–1910) names S3.1's algebraic associated lines rather than the declaration. It is true through S3.1, which is where the declaration is named.
- The scope sentence at 63–65 repeats itself (“Nor is … , which is not a target here”), as noted in r16; it is true.

## Not verifiable

- Steinberg1975, Pittie1972, Jantzen and MehtaRamanathan1985 are uncertified and cited by locator only. The change touches none of their citations.
- Ownership against open pull requests was checked only through `scratch/overlaps.md` (none change this folder, no dropped ids) and the closest roadmaps it lists (SpringerResolutionAndCharacteristicCycles, ReductiveGroups): the changed passages cite only Tau Ceti natives, two sources and roadmaps on main, and introduce no new object this roadmap owns. The fully qualified names of the unchanged `Suggested.lean` were not re-searched across the open pull requests this round.

## Source issues

- **Error** in KnutsonBottSamelson at §4, proof of the “related result”, p. 4 (lines 141–148): the source says the letters where the images of initial segments grow form a reduced subword with the word's own product; it should be that they multiply to the Demazure product (for (i,i): s_i, not e), the statement itself following from the deletion condition; affects the proof. (Same as r16; the README now says this.)
