<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7417#issuecomment-6692651004 -->
Review (claude) of 5071c6c

Verdict: needs_changes

1. **F01** (P2) Swan conductors of henselian-trait Galois groups imported from a complete-field supplier

   **Location.** `packages/FourierDeligneTransform/design/README.md` line 467 (§5.1, "For continuous representations `V` of the Galois group of a henselian trait of equal characteristic `p`") and line 542 (§5.6, "Let `T`, `T'` be henselian traits of equal characteristic `p` with residue field `k`"); Conventions line 35 ("local Galois groups … are those of the henselization at `s`"); `*Needs:*` ArithmeticGaloisRepresentations §§3.1, 3.7.

   **Claim.** Slopes, the slope decomposition, Swan conductors and the Artin–Schreier break computations are available for representations of the Galois group of an arbitrary henselian trait, supplied by ArithmeticGaloisRepresentations §3.1 and §3.7.

   **Witness.** ArithmeticGaloisRepresentations at its head, line 2444 (the *conductor setting*): the field is complete for a discrete valuation; §3.7 (lines 2853–2905) is stated in that setting. No supplier section cited here identifies the Galois group, inertia, wild inertia and upper numbering of a henselian trait with those of its completion; EtaleCohomologyFoundations §F.3a supplies only the tame character comparison. LAU87 (2.1.1), lines 684–688, works with a henselian `R` squeezed between `k{π}` and its completion `k[[π]]`, so the source itself relies on the completion. For a non-excellent henselian discrete valuation ring the completion can be inseparable over the fraction field and the two Galois groups differ, so §5.6's "henselian traits" are too wide for the imported theory.

   **Repair.** (i) In §5.6 take `T`, `T'` to be excellent henselian traits of equal characteristic `p` with perfect residue field `k` (the henselizations of smooth curves at closed points, which is all §5.5 and §5.6.1 use). (ii) Add to §5.1 one target: for an excellent henselian discrete valuation ring `R` with fraction field `K` and completion `K̂`, the extension `K̂/K` is separable and the restriction `Gal(K̂^sep/K̂) → Gal(K^sep/K)` is an isomorphism carrying inertia, wild inertia and the upper-numbering filtration to those of `K`; the breaks, slopes and Swan conductors of §5.1 are those of ArithmeticGaloisRepresentations §3.1 through this isomorphism (the fix worker pins the locator: separability of the completion of an excellent local ring is EGA IV₂ (7.8.3), transport of the filtration is Serre, *Local Fields*, IV §3). (iii) Record the excellence hypothesis in plan.json targets 5.1.2, 5.6, 5.6.1, 5.6.2. Tested on the refuting instance: a non-excellent henselian trait is now excluded, and for the henselization of `𝔸¹_k` at `0` the target gives exactly the Galois group LAU87 (2.1.1) uses.

2. **F02** (P2) The curve Euler–Poincaré formula of §5.1 is false on a disconnected curve

   **Location.** `packages/FourierDeligneTransform/design/README.md` line 467 (§5.1): "For a perverse `K` on a smooth curve `X` over `k`" and "for `X` projective, the Euler–Poincaré formula `χ(X_{k̄}, K) = Σ_x deg(x) a_x(K) − χ(X_{k̄}) rk(K)`"; plan.json target 5.1.1 hypotheses "X smooth curve over perfect k".

   **Claim.** The generic rank `rk(K)` is a single integer and the displayed formula holds for every smooth projective curve.

   **Witness.** `X = ℙ¹_k ⊔ ℙ¹_k`, `K = Λ[1]` on the first component and `0` on the second: `χ(X_{k̄}, K) = −2`, every `a_x(K) = 0`, `χ(X_{k̄}) = 4`. With `rk(K) = 1` the right side is `−4`; with `rk(K) = 0` it is `0`; neither is `−2`. LAU87 Théorème (2.2.1.2), lines 869–875, writes `χ(X ⊗ k̄, ℚ̄_ℓ) = C(2 − 2g)` with "`g` the genus of any one of the `C` components", which presupposes `X` connected over `k` (the components of `X_{k̄}` are then conjugate), and LAU87 line 843 takes the rank of `F_x̄` independent of `x`, which also needs `X` connected.

   **Repair.** In §5.1 require `X` smooth and connected over `k` (so `X_{k̄}` has `C` conjugate components of one genus `g` and `χ(X_{k̄}) = C(2 − 2g)`), define `rk(K)` as the common generic rank, and add the instance above as a negative-control Check ("on `ℙ¹ ⊔ ℙ¹` with `K = Λ[1] ⊔ 0` the two sides differ, so connectedness is needed"). Add "X connected" to plan.json targets 5.1 and 5.1.1. Tested on the instance: with `X` connected the counterexample is excluded, and on `ℙ¹` with `K = Λ[1]` both sides are `−2`.

3. **F03** (P3) "p odd" in the quadratic-form clause narrows below the source, and its Check asserts a false necessity

   **Location.** `packages/FourierDeligneTransform/design/README.md` line 393 ("quadratic forms, for `p` odd: for a symmetric isomorphism `a : E → E^∨` …") and line 401 ("Quadratic forms for `p = 2`: `[2] = 0`, and the left side is the constant complex …; the hypothesis `p` odd is needed"); plan.json line 1111 ("p odd for the quadratic formula").

   **Claim.** The formula `[2]^* FT_ψ(ℒ_ψ(q)) ≅ ℒ_ψ(−q') ⊗ π'^*Rπ_!ℒ_ψ(q)[r]` needs `p` odd and fails for `p = 2`.

   **Witness.** LAU87 Proposition (1.2.3.3), lines 488–494, has no parity hypothesis; its proof identity `q(e) + ⟨e, 2e'⟩ = q(e + a^{−1}e') − q'(e')` holds in every characteristic for symmetric `a` (expand `⟨e + a^{−1}e', ae + e'⟩`), and the substitution `(e, e') ↦ (e + a^{−1}e', e')` is an automorphism of `V ×_S V'` over `V'`, so the proof is characteristic-free. For `p = 2` both sides agree: `q` is additive, so where some diagonal entry of `a` is nonzero `Rπ_!ℒ_ψ(q) = 0` (on `𝔸¹_{𝔽̄_2}`, `ℒ_ψ(x²) ≅ ℒ_ψ(x)` has `RΓ_c = 0`) and both sides vanish; where `a` is alternating, `q = q' = 0` and both sides are `π'^*Λ(−r)[−r]`.

   **Repair.** Delete "for `p` odd" at line 393 and the plan.json hypothesis at line 1111. Replace the Check at line 401 by: "`p = 2`: `q` is additive and `[2] = 0`; for `r = 1`, `a = 1`, `Rπ_!ℒ_ψ(x²) = 0` and both sides vanish, while for `r = 2` and `a` the antidiagonal matrix `q = q' = 0` and both sides are `π'^*Λ(−2)[−2]`; the formula holds in every characteristic, with content only for `p` odd." Tested: both instances computed above.

4. **F04** (P3) A false Check in §5.3

   **Location.** `packages/FourierDeligneTransform/design/README.md` line 501: "`ℱ = ℒ_ψ(x)` is elementary but not Fourier (`H²_c(ℱ ⊗ ℒ_ψ(−x)) ≠ 0`)".

   **Claim.** `ℒ_ψ(x)` satisfies the elementary condition.

   **Witness.** The definition at line 492 requires `H²_c(A_{k̄}, ℱ ⊗ ℒ_ψ(t x)) = 0` for all `t ∈ k̄`; at `t = −1`, `ℒ_ψ(x) ⊗ ℒ_ψ(−x) ≅ Λ` and `H²_c(𝔸¹_{k̄}, Λ) = Λ(−1) ≠ 0` (ESDE (7.3.4), lines 7244–7249). The Check's own parenthesis is the failure of Elem(2).

   **Repair.** Replace the clause by: "`ℱ = ℒ_ψ(x)` is neither elementary nor Fourier (`t = −1`); for a nontrivial Kummer `χ` and `j : 𝔸¹ ∖ {0, 1} → 𝔸¹`, `ℱ = j_!(ℒ_χ|_{𝔸¹ ∖ {0,1}})` is elementary (`H⁰_c = 0`, and every twist has nontrivial monodromy, so `H²_c = 0`) but not Fourier, since `j_*` has stalk `Λ` at `1` where `j_!` has `0`." Tested: `H⁰_c(j_!ℒ) = 0`, `H²_c(𝔸¹ ∖ {0,1}, ℒ_χ ⊗ ℒ_ψ(tx)) = 0` for all `t`, stalks at `1` are `0` and `Λ`.

5. **F05** (P3) §5.5 and §5.6 need each other

   **Location.** `packages/FourierDeligneTransform/design/README.md` line 532 (`*Needs:* §§3.3, 3.4, 4.2, 5.1, 5.2, 5.6; …`) and line 543 (`*Needs:* §§3.6, 5.4–5.5; …`); the clause "and `R^{−1}Φ_{0'}(K') ≅ 𝔉^{(∞,0')}(F_∞)` (§5.6)" in the sequence-at-`0'` item of §5.5.

   **Claim.** The build order is acyclic at the section level.

   **Witness.** §5.5 cites §5.6 for the identification of the vanishing-cycle term with the local Fourier transform, and §5.6's comparison lemma (plan.json target 5.6.1, prerequisite `target:5.5`) cites §5.5's vanishing-cycle description. LAU87 proves the identification as Lemme (2.4.2.1)(ii), lines 1070–1075, after (2.3.2.1)(iii), line 993–995; plan.json's target 5.5 lists no 5.6 prerequisite, so only the README carries the cycle.

   **Repair.** Move the clause `R^{−1}Φ_{0'}(K') ≅ 𝔉^{(∞,0')}(F_∞)` and the unramified special case "`0 → H¹_c(A_{k̄}, j_!F) → F'_{η̄_{0'}} → F_∞(−1) → H²_c(A_{k̄}, j_!F) → 0` (LAU87 line 2623)" out of §5.5 into §5.6's comparison statement (after 5.6.1 and the tame value `𝔉^{(∞,0')}(Λ) = Λ(−1)` of 5.6.2), keep in §5.5 only the exact sequence with `R^{−1}Φ_{0'}(K')` as its third term, and delete `5.6` from §5.5's `*Needs:*`. Tested: §5.5 then needs §§3.3, 3.4, 4.2, 5.1, 5.2 only, and 5.6.1 keeps `target:5.5`, matching plan.json.

6. **F06** (P3) The zero coefficient ring breaks the primitivity clause of §0.1

   **Location.** `packages/FourierDeligneTransform/design/README.md` line 108: "A nondegenerate character is primitive in Mathlib's sense, `AddChar.IsPrimitive`"; Conventions line 24 ("A coefficient ring `Λ` is a finite commutative ring").

   **Claim.** Nondegeneracy implies `AddChar.IsPrimitive`.

   **Witness.** `Λ = 0`: `ψ(1) − 1 = 0` is a unit of the zero ring, so the unique character is nondegenerate as defined, but `AddChar.IsPrimitive` (`Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean` line 60) demands `mulShift ψ a ≠ 1` for `a ≠ 0`, which fails because every map into the zero ring is equal to `1`.

   **Repair.** Add "with `Λ` nonzero" to the definition of nondegenerate in §0.1 (and to the Conventions' coefficient rings, where the zero ring carries no information), add the hypothesis to plan.json target 0.1, and add the Check "`Λ = 0`: the unique character is excluded; without the nontriviality clause it would be nondegenerate but not primitive". Tested: with `Λ ≠ 0`, `ψ(a) − 1` a unit forces `ψ(a) ≠ 1`, so `mulShift ψ a ≠ 1`.

7. **F07** (P3) plan.json locator for orthogonality points at a passage that does not state it

   **Location.** `packages/FourierDeligneTransform/design/plan.json` line 98, target 0.1.1 `AddChar.IsNondegenerate.sum_trace_mul_eq_ite`: `"where": "(0.2), LAU87 lines 144–149"`.

   **Claim.** LAU87 (0.2) supports the orthogonality `Σ_{x ∈ k} ψ(Tr(xy)) = |k|·[y = 0]` for nondegenerate characters into any commutative ring.

   **Witness.** LAU87 lines 144–149 fix a nontrivial `ψ : 𝔽_p → ℚ̄_ℓ^×`, define `ψ_q = ψ ∘ Tr` and state that every additive character of `𝔽_q` is `x ↦ ψ_q(ax)` for a unique `a`; no character sum appears. The README's §0.1 cites KL85 lines 442–446 for the local case, which is the right locator for the nondegeneracy condition, and proves the orthogonality itself.

   **Repair.** Change the locator of 0.1.1 to "KL85 Appendice (2.4), lines 442–446 (nontriviality of `ψ` in the local case); LAU87 (0.2), lines 144–149, for the classification of characters of `𝔽_q`; the orthogonality for a general commutative ring is this roadmap's own, proved by the multiplication-by-`ψ(Tr(x_0 y)) − 1` argument". Tested: the classification clause of the README's API (connected `Λ`) is what lines 148–149 state.

8. **F08** (P3) An earlier special case of the Lang-torsor character sheaves is not cited in Scope

   **Location.** `packages/FourierDeligneTransform/design/README.md` line 15 (Scope: "Lang's theorem is ReductiveGroupsPartII §RG2.3.7; the torsor statement of §2.1 is its consequence for commutative groups, proved here at the generality of group schemes that need not be affine").

   **Claim.** No earlier roadmap constructs character sheaves from a Lang torsor.

   **Witness.** AutomorphicLFunctionsAndLocalFactors §AL.3.10.4 at its head (lines 2335–2345), earlier in the merge order, constructs the Lang isogeny of the generalized Jacobian `Pic⁰_D` and the dictionary between finite-order characters of `C_K/U_D` and rank-one `ℓ`-adic local systems on the open curve, with the convention `χ(a) = ρ(Art_ar(a)⁻¹)`; FunctionFieldArithmetic §4.9 (lines 1561–1575) consumes that Lang torsor with the deck action by translation. §§2.1–2.2 here state the construction for every smooth connected commutative group, which is the general theorem and not a re-plan, but the brief requires the existing special case to be named.

   **Repair.** Add one clause to Scope: "the rank-one local systems of AutomorphicLFunctionsAndLocalFactors §AL.3.10.4, built from the Lang isogeny of a generalized Jacobian, are the case `G = Pic⁰_D` of §2.2, with the character inverted (that roadmap evaluates `χ` on inverse arithmetic Artin, here `Frob_x` acts by `χ(N x)`)". Tested: for `G = Pic⁰_D` with `D = 0` and a degree-one point, the two conventions give inverse Frobenius eigenvalues, as FunctionFieldArithmetic §4.9 records.

9. **F09** (P3) Downstream consumers overclaim

   **Location.** `packages/FourierDeligneTransform/design/README.md` lines 565, 568, 569: "CongruenceSpectralGap §4.2b: its additive-character-sheaf input is §§2.2–2.5", "KloostermanMomentsAndPotentialAutomorphy: …", "ExponentialSumsAndCircleMethodPartII: …".

   **Claim.** These roadmaps consume the named sections.

   **Witness.** CongruenceSpectralGap at its head declares `gap:additive-character-sheaf-weight` against DeligneWeightsAndPurity (line 128) and names DeligneWeightsAndPurity as the supplier of "the global rank-one sheaf, its trace and tensor comparisons and weight zero" (line 19); KloostermanMomentsAndPotentialAutomorphy and ExponentialSumsAndCircleMethodPartII do not mention FourierDeligneTransform (`roadmaps grep 'FourierDeligneTransform'` finds only SheafConvolutionOnAbelianVarieties, CharacterSumsOverFiniteFields and EtaleCohomologyFoundations).

   **Repair.** Rewrite the three bullets as what each roadmap can import from here ("can consume", "supplies the weight-free part of CongruenceSpectralGap's additive-character-sheaf contract, whose weight-zero clause stays with DeligneWeightsAndPurity"), or drop the two bullets for roadmaps that cite nothing here. Tested: the SheafConvolutionOnAbelianVarieties and CharacterSumsOverFiniteFields bullets are accurate as written (gap:kernel-composition-coherence at its line 185; `artinSchreierSheaf ψ`, `kummerSheaf χ` at its lines 248–249 match plan.json names 2.5, 2.6).

Files reviewed: `packages/FourierDeligneTransform/design/README.md`, `packages/FourierDeligneTransform/design/plan.json`, `packages/FourierDeligneTransform/sources.toml`. No file of the design was changed. Two blocking findings (P2) and seven non-blocking ones (P3).

## Verified sound

**Principles.** No route-specific shortcut: the transform is stated over every qcqs `𝔽_p`-scheme with finite coefficient rings and a nondegenerate character, not over a field or `ℚ̄_ℓ` only, and the non-local nondegeneracy condition is the right generalisation of KL85's local nontriviality (KL85 lines 442–446). No re-plan: the six operations, Frobenius, perverse structure, nearby cycles, Swan conductors, trace formula and Lang's theorem are imported by section. No passage copied; no algorithm. Gate: `depcheck: 240 roadmaps, 2351 edges, 0 problem(s)`, candidate placed after EtaleDualityAndPerverseSheaves; no UPWARD or CYCLE line.

**Sources (sampled targets, read at the line-numbered texts).** 0.2: LAU87 lines 383–391 define `𝔉` with `ψ(⟨e,e'⟩)` and Théorème (1.2.1.2) gives `(−1)^r`; identities as function forms of (1.2.2.1)–(1.2.2.8), lines 401–471 ✓. 1.1: LAU87 (1.1.1.3)–(1.1.1.4), lines 257–262; BRY86 line 43 (table of contents, Ch. IX p. 103) and line 3358 (chapter head) ✓. 1.3: LAU87 lines 172–182 (finiteness theorems recalled) ✓. 1.4: LAU87 (1.1.1.0)–(1.1.1.4), lines 242–262 ✓. 2.4: LAU87 (1.1.3.4), lines 330–331 ✓. 2.5: LAU87 lines 343–345 (Artin–Schreier case), 370–371; KATZ01 lines 430–440 (trace `ψ(Tr_{E/k} x)`, sign-changed Lang map) ✓. 2.6: LAU87 Remarque (1.1.3.7), lines 349–367; Lemme (1.4.3.1), lines 651–655 ✓. 3.1: LAU87 lines 372–377; KL85 lines 365–371 ✓. 3.7: KL85 lines 438–441 (torsion first, limit to `ℚ̄_ℓ`) ✓. 3.8: LAU87 (1.2.1.2), lines 389–391 ✓. 4.1, 4.2: LAU87 (1.3.2.3)–(1.3.2.4), lines 566–577 (BBD 4.2.5, 4.1.1, 4.1.2 route); KL85 (2.1.5)(iii), lines 392–393 ✓. 5.1: LAU87 lines 735–804 (slopes, (2.1.2.7), (2.1.2.8)), 842–875 ((2.2.1), Lemme (2.2.1.1), Théorème (2.2.1.2)); the sign change to nonnegative invariants is consistent with the lemma's inequalities and the formula (R02 aside) ✓. 5.2: LAU87 lines 609–638 ✓. 5.6: LAU87 Lemme (2.4.2.1), lines 1063–1081 (kernels `π/π'`, `π'/π`, `1/(ππ')`, shift 2), Proposition (2.4.2.2), (2.4.2.3), (2.5.2), (2.5.3.1), lines 1084–1100, 1157–1182 ✓. Also checked: LAU87 (1.2.2.1)–(1.2.3.5), lines 396–518 (inversion with `a = −canonical`, shift `r_2 − r_1`, convolution, Plancherel, sub-bundles, translation, group actions); (1.3.1.1)–(1.3.2.2), lines 521–565; (2.3.1.1)–(2.3.3.1), lines 933–1034 (all four formula groups of §5.5 are the sign-changed versions); (4.4), lines 2613–2629; KL85 (2.1.1)–(2.1.5), lines 365–393, Appendice (2.4), lines 438–568 (route of §3.3, Lemme (2.4.2) at 514–521, Théorème (2.4.4) at 567–568 over `𝔽_p`); KATZ01 lines 441–460 (§2.7) and 888–893 (§5.3 Class (1)); ESDE (7.3.3)–(7.3.8), lines 7235–7312, and §7.8 Class (1), lines 7877–7889. The sources manifest records every cited work; no entry is wrong.

**Suppliers.** On main: EtaleCohomologyFoundations §§G.1–G.3, 0.7, 0.8, 0.9, F.0.1–F.0.4, F.1, F.2.1–F.2.7, F.3, F.3a, F.4.1–F.4.6, F.5, F.6, F.8, F.10.1–F.10.3, F.10.2b (README lines 57–1372) and the 18 declaration names `ClassicalAlgebraic.properSupports`, `ClassicalAlgebraic.cycleClasses`, `PerfectComplex.lefschetzNumber`, `VanishingCycles.{properBaseChange, lisseMonodromyEquiv, etaleTateTwists, universalHomeomorphismEtaleEquivalence, localAcyclicity, etaleCompactSupports, compactSupportFiniteness, adicFunctoriality, etaleExceptionalInverseImage, etaleVerdierDuality, smoothPurity, fieldPerverseTStructure, intermediateExtension, frobeniusFixedPoints, frobeniusCohomology}` all occur in its README and Suggested.lean; EnhancedDerivedSheaves §§0.1–0.4 (lines 429–505); SchemeAndStackFoundations §0.29 (line 1825), §2.9 (3582), §2.11 (3656) with `SchemeFrobenius.qPowerFrobenius`, `SchemeFrobenius.relativeFrobenius` (lines 432–433); AlgebraicVectorBundles §L1A (269), §L2B (340, `totalSpace`); ReductiveGroupsPartII §RG2.3.7 *lang-theorem*, `Lang.lang_surjective`, *lang_not_connected* (lines 5201–5219). At open heads: ArithmeticGaloisRepresentations §3.1 (2560), §3.7 (2853); InverseGaloisAndArithmeticFundamentalGroups §IG.0.T2 (502, `etaleTraceFormulaFinite`, every `r ≥ 1`, Fubini identity), §IG.0.T3 (537, `etaleTraceFormula`); LefschetzPencilsAndVanishingCycles §§0.3–0.8 (420–668), §1.1 (934, henselian traits, quasi-unipotence for finite residue fields through ArithmeticGaloisRepresentations §2.4); EtaleDualityAndPerverseSheaves §2.7 (2200, `smoothPullbackPerverseExactness`, `perverseArtinVanishing`, over a field, noetherian torsion `Λ`), §2.10 (2547, `simplePerverseSheavesClassification`, field coefficients), §5.2 (4920, `curveEulerPoincareSwan`, lisse sheaves on curves over algebraically closed fields, finite coefficient fields and `ℚ̄_ℓ`). Every `*Needs:*` line cites only suppliers earlier in the order or declared gaps; no upward citation, no cycle between roadmaps (the §5.5/§5.6 cycle of R05 is internal).

**Declared gaps.** `torsor-character-sheaf`: EtaleCohomologyFoundations §F.0.3 on main is Tate twists only (lines 231–247), so the construction is missing; the `needs` sentence with the README's contract paragraph lists the API precisely; nothing in Mathlib or Tau Ceti provides it. `projection-formula-qcqs`: §F.2.7 on main (lines 759–775) is Noetherian/`Dᵇ_ctf`; the gap asks exactly for the `D⁺` qcqs form with one finite-Tor factor. `smooth-exceptional-pullback`: §F.6 on main gives `f^!Λ ≅ Λ(d)[2d]` only (line 1202); EtaleDualityAndPerverseSheaves §2.7 gives the general `M` over a field; the gap asks for Noetherian bases. All three carry the same slug in plan.json and the README, with a named supplier.

**Pinned libraries.** Mathlib at `1b1ccf4b…`: `AddChar.IsPrimitive` (AddCharacter.lean 60), `AddChar.IsPrimitive.of_ne_one` (83), `AddChar.sum_eq_zero_of_ne_one` (240, `[IsDomain R']`), `FiniteField.trace_to_zmod_nondegenerate` (Trace.lean 37), `FiniteField.algebraMap_trace_eq_sum_pow` (49), `FiniteField.norm_surjective` (GaloisField.lean 234), `ZMod.dft` (ZMod.lean 87, `dft_dft` 176), `ZMod.stdAddChar` (CircleAddChar.lean 83), `gaussSum` (GaussSum.lean 72), `mul_gaussSum_inv_eq_gaussSum` (178), `gaussSum_mul_gaussSum_eq_card` (200, `[IsDomain R']`, `IsPrimitive ψ`, giving `gaussSum χ ψ * gaussSum χ⁻¹ ψ⁻¹ = card R`, which with line 178 is the README's `g(χ,ψ) g(χ⁻¹,ψ) = χ(−1) q`), `Module.Dual` (Dual/Defs.lean 61), `CategoryTheory.Triangulated.TStructure` (Basic.lean 54), `CategoryTheory.GrpObj` (Monoidal/Grp.lean 43). Tau Ceti at `2fd255d9…`: `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf` (FiniteLocallyFree.lean 108), `.dual` (Dual/Basic.lean 64), `.evalIso` (Dual/Bidual.lean 69), `.pullbackDualIso` (Dual/Pullback.lean 46), `AlgebraicGeometry.Scheme.Hom.qPowerFrobenius_baseChange` (Frobenius/FiniteField.lean 136).

**Duplication by object.** `roadmaps grep` for Fourier–Deligne, kernel transform, Artin–Schreier sheaf, Kummer sheaf, Lang torsor, naive Fourier transform, local Fourier transform over main and all 459 open pull requests: the only constructions are the ones this roadmap owns; SheafConvolutionOnAbelianVarieties (line 185) declares `gap:kernel-composition-coherence` against it and CharacterSumsOverFiniteFields (lines 248–249) names its `artinSchreierSheaf`, `kummerSheaf`; EtaleDualityAndPerverseSheaves and CongruenceSpectralGap use the sheaves only in Checks; AutomorphicLFunctionsAndLocalFactors' "local Fourier transform" (line 698) is the Schwartz–Bruhat one. The board's package index (9 entries) has none of these objects. Tau Ceti's `TauCeti/FieldTheory/FunctionField/ArtinSchreier/*` is function-field genus theory, not the étale sheaf. The `weil-conjectures` Artin–Schreier sheaf mentioned by CharacterSumsOverFiniteFields (line 2014) is not at the Tau Ceti pin.

**Adversarial table** (sampled targets, headlines, and every target a finding touches; values computed on each side).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 0.1 `ψ(a)−1` unit, `p` unit, `Φ_p(ψ(1))=0` | `ℤ/7, p=3, ψ(1)=2`; `ℤ/49, ψ(1)=18`; `ℤ/5, p=3`; `ℤ/7×ℤ/7, ψ(1)=(2,1)`; `Λ=0` | `8≡1`, `ψ(1)−1=1`, `Σψ=7≡0`; `18³=5832=119·49+1`, `17∈(ℤ/49)^×`; no element of order 3 in `(ℤ/5)^×`; `(1,0)` non-unit, `Σψ=(0,3)`; zero ring: `0` is a unit but `IsPrimitive` fails | holds except `Λ=0` | R06 |
| 0.1 orthogonality for any commutative `Λ` | `k=𝔽_3`, `y≠0`, multiply by `ψ(Tr(x_0y))−1` | `(ψ(1)−1)·S = Σψ(Tr((x+x_0)y)) − S = 0`, unit ⇒ `S=0`; `y=0` gives `|k|` | holds | locator R07 |
| 0.1 classification for connected `Λ` | `ℤ/49`: `μ_3 = {1,18,30}`; `ℤ/7×ℤ/7` | idempotents `e_a = p^{-1}Σ(ωζ^{-a})^i` force `ω=ζ^{a}` in a connected ring; the pair `(ψ_1(c_1x),ψ_2(c_2x))`, `c_1≠c_2`, is not of the form | holds | none |
| 0.2 inversion `𝔉𝔉t(w)=|W|t(−w)` | `W=𝔽_3, Λ=ℤ/7, ψ(1)=2, t=δ_1`; `W=0`; degenerate `(2,1)` | `𝔉t=(1,2,4)`; at `w=2`: `1+8+8=17≡3=3·t(1)`; at `w=1`: `1+4+16=21≡0`; `|W|=1`, identity; second component `t↦Σt` not injective | holds | none |
| 0.2 Plancherel, convolution, `f_!`, translation, `ψ⁻¹` | general `W`, `f:W_1→W_2` | `Σ_{w'}𝔉t_1𝔉t_2 = Σ_{u,v}t_1(u)t_2(v)|W|[u+v=0]`; `𝔉(f_!t)(w_2') = Σ_{w_1}t(w_1)ψ((f^∨w_2')(w_1))`; `ψ(w'(e))𝔉t`; `(𝔉_ψt)∘[−1]` | holds | none |
| 0.2 comparison with `ZMod.dft` | `N=p=3, Φ=δ_1` | `dft Φ k = stdAddChar(−k)`, `𝔉Φ(k)=stdAddChar(k)` | holds (`𝔉Φ(k)=dftΦ(−k)`) | none |
| 0.2 Example Gauss sum | `k=𝔽_5, Λ=ℤ/11, ψ(1)=3` | `3^5=243=22·11+1`; `Σψ(w²)=1+2·3+2·4=15≡4`; `4²=16≡5=|k|(−1/5)` | holds | none |
| 1.1 kernel transform, Tor hypothesis | `X=Y=S, 𝒦=Λ`; `S=Spec k̄, X=𝔸¹, 𝒦=Λ`; `Λ=ℤ/4, 𝒦=ℤ/2` | identity; `Φ(Λ)=Λ(−1)[−2]` vs `Rp_*`: `Λ`; `Tor_i^{ℤ/4}(ℤ/2,ℤ/2)=ℤ/2` all `i≥0`, unbounded below | holds | none |
| 1.1 graph kernels | `f:X→Y` separated; `i:{0}→𝔸¹` | `Rp_{Y!}((id,f)_!(id,f)^*p_X^*K)=Rf_!K`; `(g,id)` gives `g^*`; `Λ↦i_*Λ`, `Λ_{𝔸¹}↦Λ` | holds | none |
| 1.1 relative Künneth | `f, g` over `S`, `L` finite Tor | two projection formulas (one factor finite Tor each time) and base change; `Rg_!L` keeps finite Tor amplitude by the fibre-dimension bound | holds given gap | none |
| 1.3 constructibility | Noetherian `S`, `Dᵇ_ctf` | `Rp_{Y!}` of `Dᵇ_ctf` is `Dᵇ_ctf` (F.3 `compactSupportFiniteness`) | holds | none |
| 1.4 trace function | `K=Λ(−1)[−2]`, `Λ[1]`, `[ℤ/4 →2 ℤ/4]` trivial Frobenius; `Λ(m)` | `q`; `−1`; Lefschetz number `1−1=0` while `H⁰=H¹=ℤ/2`; `q^{−nm}` (geometric Frobenius on `Λ(1)` is `q⁻¹`, F.10.2b Check) | holds | none |
| 1.4 dictionary for `Φ_𝒦` | `𝒦=Λ` on `𝔸¹×𝔸¹`, `a=0`, `K=i_*Λ`, `K=Λ` | `Φ(i_*Λ)=Λ_{𝔸¹}`, trace `1=Σ_xδ_{x_0}(x)`; `Φ(Λ)=Λ(−1)[−2]`, trace `q=Σ_x 1` | holds | none |
| 2.1 Lang torsor | `𝔾_a`, `𝔾_m`, `ℤ/2`, `G=0`; `q=3, x=1` | `dL=−id`; kernel `{F(t)=t}=A`; `L(t)=t^q−t`, `t^{q−1}`; `L=0` for `ℤ/2`; identity for `G=0`; `F^n(t)=t+N(x)` so arithmetic Frobenius translates by `N(x)`, geometric by `−N(x)` | holds | none |
| 2.2 convention witness | `𝔾_a/𝔽_3, Λ=ℤ/7, ψ(1)=2, x=1` | stalk `(L_*Λ)_x̄ = Λ^{fibre}` with `(σ·s)(t)=s(σ^{-1}t)` (the natural action, pullback along `Spec σ`); `Frob` moves `t↦t−1`, so `(Frob·s)(t)=s(t+1)=ψ(1)s(t)=2s(t)`; the opposite Lang map gives `4` | holds | none |
| 2.2 `F^*ℒ_χ≅ℒ_χ`, `[−1]^*ℒ_χ≅ℒ_{χ⁻¹}`, translation | `χ∘F|_A=χ`; `χ∘(−1)=χ⁻¹` | pullback law along homomorphisms | holds | none |
| 2.3 traces | `𝔽_9/𝔽_3`, `x=i`, `x=1`; `𝔾_m`, `q=5`, `n=2` | `Tr(i)=i+i³=0`, `Tr(1)=2`; `x↦x^6` sends order 24 to order 4 | holds | none |
| 2.4 vanishing | `𝔾_a`, nondegenerate; `ℤ/7×ℤ/7, (2,1)`; `𝔾_m/𝔽_5`, quadratic `χ` into `ℤ/3` | `M⊗ℒ≅M⊗Λ` via `(x,y)↦(x+y,y)` and surjective monodromy gives `(χ(a)−1)Hⁱ=0`; `(0,(ℤ/7)(−1)[−2])`; `χ(2)−1=−2≡1`, `1−1−1+1=0` | holds | none |
| 2.5 Artin–Schreier laws | `ℒ_ψ(f^p)`, `ℒ_ψ(f^p−f)`; base to `𝔽_q`; `𝔽_9` | `[p]` is identity on `𝔽_p`; `L_p∘N=L_q` with `N(t)=t+t^p+⋯+t^{q/p}`; `ψ(Tr(i))=1`, `ψ(Tr 1)=ψ(2)` | holds | none |
| 2.6 Kummer | `N=1`; `𝔽_5, N=4`; trivial `χ`; `ℂ, N=2, ℤ/3` | `ℒ=Λ`; `[4]=` Lang map `t^{q−1}`; `Rj_*Λ` stalk `H⁰=Λ, H¹=Λ(−1)`; `χ(−1)−1=−2≡1`, invariants and coinvariants of tame inertia vanish | holds | none |
| 2.7 breaks and `H¹_c` | `d=1`; `d=2, p=3`; `f=x^p`; `𝔽_5, ℤ/11, f=x²` | rank `0`; rank `1`, trace `−(1+2ψ(1))`; break `1`; trace `−4≡7` | holds | none |
| 3.1 pairing | `r=1`, `r=0`, bidual | `xx'`; kernel `Λ_S`; transpose under `evalIso`, inversion uses `−canonical` consistently with `[−1]^*` | holds | none |
| 3.2 transform | `r=0`; `i_{0*}Λ` on `𝔸¹`; trivial `ψ`; `FT_{ψ⁻¹}` | identity; `Λ[1]`, trace `−1=−Σδ_0ψ(xx')`; `π'^*Rπ_!K[r]`; `(id×[−1])^*ℒ_ψ⟨,⟩=ℒ_{ψ⁻¹}⟨,⟩` | holds | none |
| 3.3 `FT_!=FT_*` (headline) | `K=Λ` on `𝔸¹`, `S=Spec k̄`; trivial kernel; `p=2` cover | `FT_!(Λ)=σ'_*Λ(−1)[−1]` while fibre `RΓ(𝔸¹,Λ)[1]=Λ[1]`; `Rpr'_!Λ=Λ(−1)[−2]≠Rpr'_*Λ=Λ`; `f_*Λ=Λ⊕(j×1)_!ℒ_ψ(xy)` when `2` is a unit | holds | none |
| 3.4 inversion (headline) | `r=1`: `i_{0*}Λ`, `i_{a*}Λ`; trivial `ψ` | `FT(Λ[1])=i_{0*}Λ(−1)`, trace `q`; `FT(ℒ_ψ(ax')[1])=Rpr_!ℒ_ψ((a+x)x')[2]=i_{(−a)*}Λ(−1)`; trivial: `Λ(−1)` constant | holds | none |
| 3.5 duality (headline) | `K=i_{a*}Λ`, `K=Λ[1]`, `r=0` | `ℒ_{ψ⁻¹}(ax')(1)[1]` both sides; `σ'_*Λ(1)` both sides; `D_S` with trivial twist | holds | none |
| 3.6 linear-map shift | `E_1=O_S, E_2=0, K_1=i_{0*}Λ` | `Rf_!K_1=Λ_S`, `σ'^*(Λ[1])[s]=Λ[1+s]` forces `s=−1=r_2−r_1`; LAU87 line 438 reads `[r_2−r_1]` | holds | none |
| 3.6 convolution, translation, sub-bundles | skyscrapers `a,b`; `F=E`, `F=0` | `ℒ⟨a+b,·⟩[r]` both sides; `σ'_*Λ(−1)` and `Λ_{V'}[r]` | holds | none |
| 3.6 quadratic forms | `p=2, r=1, a=1`; `p=2, r=2, a` antidiagonal; odd `p` | both sides `0`; both sides `π'^*Λ(−2)[−2]`; proof identity holds in all characteristics | holds without `p` odd | R03 |
| 3.7 coefficients | `ℤ/49→ℤ/7`, `18↦4` | `4³=64≡1`; normalized system by `ℒ_{ψ mod λ^{n+1}}⊗O/λ^n` | holds | none |
| 3.8 trace identity (headline) | `K=Λ_{𝔸¹}`; Plancherel for `K_1=K_2=i_{0*}Λ` | `t_{FT Λ}(0')=−q`, `0` elsewhere `= −Σ_xψ(xx')`; left `Σ_{x'}(−1)(−1)=q`, right `Λ(−1)` trace `q` | holds | none |
| 3.8 Frobenius exchange (headline) | `r=0`; `S_0=𝔸¹` | `F_{V_0}×id = F_V∘(id×Spec σ^{-1})`, `F_V^*≅id`; base change along the automorphism | holds | none |
| 4.1 `t`-exactness (headline) | `r=1`: `i_{0*}Λ`, `Λ_{𝔸¹}`; `ℤ_ℓ`, `(ℤ/ℓ)_0[−1]`; trivial `ψ` | `Λ[1]` perverse; `σ'_*Λ(−1)[−1]∈ᵖD^{≥1}`; `(ℤ/ℓ)_{𝔸¹}` has `ᵖH^1` torsion, `ᵖH^0=0`: `p⁺` heart, not `p`; `FT(Λ[1])=Λ(−1)` not perverse | holds | none |
| 4.2 equivalence of hearts | `0→i_{0*}Λ→j_!Λ[1]→Λ[1]→0`; `ℤ/49` skyscraper | image `0→Λ[1]→FT(j_!Λ[1])→i_{0'*}Λ(−1)→0`, nonsplit because `Hom(Λ,j_!Λ)=H⁰(𝔸¹,j_!Λ)=0`; stalk at `0'` is `Λ[1]⊕Λ(−1)`; subobject `(7ℤ/49)_0↦(ℤ/7)[1]` | holds | none |
| 5.1 invariants and lemma | `i_{x*}Λ`; `j_!ℒ_ψ(x)[1]`; Kummer `j_!ℒ_χ[1]`; disconnected `ℙ¹⊔ℙ¹` | `rk=0, rk_x=−1, sw=0, a=1`, `χ=1`; `rk=1, rk_∞=0, sw_∞=1, a_∞=2`, `χ=2−2=0`; `a_0=1`; `χ=−2` against `−4` or `0` | formula false for disconnected `X` | R02 |
| 5.1 slope-one twisting lemma | `V` a `G`-module purely of slope `1`, `k=k̄` | characters of `Gr^1 I` occurring in `V` have finite tame orbit, hence are tame-invariant, hence restrictions of characters of `G` of break `≤1`, which are the `a/π`; `a≠0` since `V` has no slope `<1` | holds for `G`-modules (not for bare `P`-modules) | none; the sketch's invariance step is implicit |
| 5.2 types (headline) | `s=0, F=Λ`; `s'=0'`; `ℒ_ψ(x)[1]` | `Λ[1]`; `i'_{0'*}F'(−1)`; type (T2) at `s'=1` (excluded from (T3) by `a'=1`), transform `i_{(−1)*}Λ(−1)` | holds | none |
| 5.3 Fourier sheaves | `Λ_{𝔸¹}`; `ℒ_ψ(x)`; `ℒ_ψ(x²)`; `j_!ℒ_χ` | not elementary (`t=0`); not elementary (`t=−1`: `H²_c(𝔸¹,Λ)=Λ(−1)`); `NFT≅ℒ_ψ(−x'²/4)⊗H¹_c` (quadratic formula with `a=1`, `[2]`); `j'_!ℒ_{χ⁻¹}⊗G(χ,ψ)` of rank `1=a_0` | Check false | R04 |
| 5.3 Class (1) autoequivalence | `ℱ` lisse, all `∞`-breaks `>1` | `U'=A'` by §5.5; inverse transform lisse ⇒ `F'_{∞',[0,1[}=0` and `s(F'_{∞',1}⊗ℒ_ψ(x's))=r(F'_{∞',1})` for all `s≠0`; twisting lemma ⇒ `F'_{∞',1}=0` | holds without stationary phase | none |
| 5.4 Gauss-sum line | `q=5, Λ=ℤ/11, ψ(1)=3`, quadratic `χ`; inversion | `g=3−9−27+81=48≡4`; `g²=16≡5=χ(−1)·5`; `(−g(χ,ψ))(−g(χ⁻¹,ψ))=χ(−1)q` matches Mathlib lines 178, 200 | holds | none |
| 5.5 local monodromy (headline) | `Λ[1]`; `i_{0*}Λ`; `ℒ_ψ(x²)[1]`; `j_!ℒ_χ[1]` | `rk(K')=0`, `rk_{0'}=0−1+0=−1`, sequence `0→0→0→Λ(−1)→Λ(−1)→0`; `rk(K')=1`, `U'=A'`; `rk(K')=2−1=1`; `F_∞=V_{χ⁻¹}`, `rk(K')=1`, `rk_{0'}=0`, `F'_{η̄_{0'}}=V'_{χ⁻¹}⊗G(χ,ψ)`; every formula is the sign-changed LAU87 (2.3.1.1)–(2.3.3.1) | holds | R05 (order only) |
| 5.6 local Fourier transforms (headline) | trivial module; Kummer at `(0,∞')`; tame at `(∞,∞')`; `ψ(c·)` | `𝔉^{(∞,0')}(Λ)=Λ(−1)` from `i_{0'*}Λ(−1)`; monodromy of `j'_!ℒ_{χ⁻¹}(x')` at `∞'` is `ℒ_{χ⁻¹}(1/π')=ℒ_χ(π')`, value `V'_χ⊗G(χ,ψ)` (LAU87 line 1178); `0`; `π'↦c^{-1}π'`, `π'↦cπ'`, `π'↦c^{-1}π'` from `cπ/π'=π/(c^{-1}π')` etc. | holds | R01 (traits) |

**Shape and style.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, eleven roadmaps), How to read the build, six layers each ending with `### Examples` and `### Dependencies` (12 such headings), Downstream consumers, Motivation, References. Every definition (0.1, 0.2, 1.1, 1.2, 1.4, 2.1, 2.2, 2.5, 2.6, 3.1, 3.2, 5.1, 5.3, 5.4, 5.6) has an API list and at least three Checks (plan.json: 55 tests over 15 definitions); every theorem has hypotheses in the sentence and a locator; 29 `*Needs:*` lines. No LaTeX delimiters, no pull-request numbers, dates, paths or process words; the only backticked supplier Lean name of another roadmap's own is `simplePerverseSheavesClassification` (EtaleDualityAndPerverseSheaves §2.10, resolved). Vocabulary is the literature's (elementary and Fourier sheaves from ESDE (7.3.4)–(7.3.6), total drop from LAU87 (2.2.1), strong local acyclicity from KL85 (2.4.3)).

**Headline theorems** (for the package stage): `FT_! = FT_*` (§3.3), inversion (§3.4), duality (§3.5), functoriality with Plancherel (§3.6), the trace identity and Frobenius exchange (§3.8), perverse `t`-exactness and the equivalence of hearts (§§4.1–4.2), the exchange of types (§5.2), the Fourier-sheaf theorem (§5.3), the Kummer transform (§5.4), local monodromy (§5.5) and the local Fourier transforms with tame values (§5.6). None is statable at the pins: Mathlib and Tau Ceti have no étale derived category, no `Rf_!`, no perverse sheaves and no nearby cycles (Tau Ceti supplies only `FiniteLocallyFreeSheaf` and the `q`-power Frobenius). The package's module docstring must say so for each; only the finite Fourier identities of §0.2 are statable, and they are Layer-0 results rather than headlines. Elaboration: not available (this lane does not elaborate; there is no Suggested.lean at the design stage).

## Not verifiable

- SGA45-ST (Deligne, *Sommes trig.*, SGA 4½) (4.3) and (4.20), cited for §§2.1, 2.4, 2.6, 5.4: paywalled, recorded `uncertified`; every statement that cites it also carries an open locator in LAU87 (Lemme (1.4.3.1), Proposition (1.4.3.2)), which I read.
- KW01 Ch. III, cited for §4.1: paywalled, recorded `uncertified`; the statement is covered by LAU87 (1.3.2.3) and KL85 (2.1.5)(iii), which I read.
- The exact wording of LAU87 Corollaire (2.3.1.3)(i), line 971, whether `r(K)` or `r(K')` appears in the stalk-rank formula: the OCR drops primes; the design's version follows from (2.3.1.1)(i) and (iii) either way.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5071c6c570e68f8b5cf60c65a02b324964dc886b", "job": "REV-DESIGN-FourierDeligneTransform", "model": "fable", "worker": "chris-x32"} -->
