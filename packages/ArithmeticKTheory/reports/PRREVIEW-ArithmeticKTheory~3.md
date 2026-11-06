# Review of ArithmeticKTheory (pull request #1418 at 6c0c743)

**Verdict:** needs changes

One finding, not blocking. The gate passes, the dependency check shows no UPWARD or CYCLE line, the three sorried headlines survive the one-tactic probes, and every sampled locator was found at the cited place. Acceptance after the repair below is conditional on the two declared supplier gaps (`gap:connective-c2-homotopy-orbit-spectral-sequence`, `gap:number-ring-witt-signature`), which are contracts, not findings.

The previous review (at 00f60c5) accepted with no findings, so there was nothing to re-check finding by finding. The change since then (155 lines) adds Borel's finite-stage invariant-form comparison to §3.4, the function-field scope sentence to §3.2 and the Scope paragraph, the matching supplier contracts for ArithmeticLocallySymmetricSpaces and AdelicAlgebraicGroups, two Borel references, and one docstring sentence in `Suggested.lean`. All of it was reviewed in full below, and the unchanged text was re-read in full.

## R01 (P3) — Three backticked supplier names are not declared by their suppliers

Location: `TauCetiRoadmap/ArithmeticKTheory/README.md:326` and :827 (“`dvrBoundary_flat_ramification`”), :332 and :631 (“`dedekindTransferCoordinates`”), :313 (“`classComponent_zero`”).

Claim: SchemeKTheoryOperations §3.6 supplies `dvrBoundary_flat_ramification`, KTheoryLowDegrees §5.5 supplies `dedekindTransferCoordinates`, and CyclotomicClassGroupsAndStickelberger §3.3 supplies `classComponent_zero`. A backticked name is a claim that the supplier declares that name.

Witness: a search of the README and `Suggested.lean` of every open roadmap pull request at its head and of every roadmap on main for the three strings returns only this README (lines 313, 326, 332, 631, 827). The three statements do exist in the cited sections, under no name: SchemeKTheoryOperations §3.6 (its interface bullet “for a local flat map O → O′ of DVRs with mO′ = m′^e, ∂′(x_{L′}) = e·(k → k′)^*(∂ x)”), KTheoryLowDegrees §5.5 (the coordinate formula (r,L) ↦ (dr, N(L)·s^r) with its virtual extension), CyclotomicClassGroupsAndStickelberger §3.3 (“Specialize to E=K_p, F=ℚ. Prove vanishing of the exponent-zero component”). Every other backticked supplier name in the contracts (for example `oddPrime_specialValueEuler`, `herbrand_ribet`, `kummer_criterion`, `motivicToK`, `periodicEtaleK`, `ExactW0`, `hilbertClassField`, `hasDirichletDensity_frobeniusPrimeSet`, `VanishingCycles.etaleTateTwists`) does occur in its supplier.

Repair: drop the backticks and cite the statements in prose at the five lines, for example “SchemeKTheoryOperations §3.6's flat-ramification law for the DVR boundary”, “KTheoryLowDegrees §5.5's transfer coordinate formula”, “CyclotomicClassGroupsAndStickelberger §3.3's exponent-zero component vanishing”. No mathematics changes; §2.3, §1.3 and §7.3 consume exactly the statements those sections make. Tested on the instance that showed the defect: after the edit the three strings occur nowhere, and each citation points at a section that states the consumed fact.

## Verified sound

This was a full review of the README (5092 lines, all 52 numbered subsections, the Scope, Conventions, supplier contracts, Downstream consumers and References) and of all four declarations of `Suggested.lean`, after reading the repository's writing checklist and contribution rules. No route excludes bad primes, no existing roadmap is re-planned, no source passage is copied, no algorithm is specified (the §8.8 witness data are finite mathematical identities), and `Suggested.lean` has a single `import Mathlib`, no `set_option`, no sorried data, no `lemma`.

### Gate, dependency check, elaboration, probes

The worker's gate at this head:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

My own run of the prescribed dependency check against the merge order:

```text
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ArithmeticKTheory'` is empty. `lake env lean` on `Suggested.lean` succeeds in 12 s with exactly the three `declaration uses 'sorry'` warnings (lines 50, 56, 69).

On a scratch copy I elaborated `#check @sUnitSubmonoid` and tried each sorried theorem with `simp`, `rfl`, `infer_instance`, `decide` and `exact?`: `simp` makes no progress on all three, `rfl` and `infer_instance` fail on the iff, instance search fails on the torsion-class-group localization, `decide` is rejected on the Bernoulli statement, and `exact?` closes none. The elaborated types agree with the README statements: the iff keeps `[IsDedekindDomain R]`, `[IsFractionRing R F]`, arbitrary `S`; the torsion theorem keeps `∀ c : ClassGroup R, IsOfFinOrder c`; the Bernoulli theorem keeps `p.Prime`, `Odd p`, the class-number hypothesis and `1 ≤ k`. Nothing is padding: none restates a definition, mirrors a Check or computes a value.

### Headline coverage

| README headline | Disposition in `Suggested.lean` |
| --- | --- |
| §1.1 localization criterion, arbitrary S, both directions | `integer_isLocalization_iff` on `Set.integer`, with the real-bodied `sUnitSubmonoid` |
| §1.1 localization for every S under torsion class group | `integer_isLocalization_of_torsion_classGroup` |
| §7.2 regular prime divides no reduced numerator of B₂ₖ/k, k ≥ 1 | `regularPrime_dividedBernoulli_num` on `bernoulli` and `NumberField.classNumber (CyclotomicField p ℚ)` |
| §§3.2–3.4 finite generation, rational localization, Borel ranks, and the new finite-stage invariant-form comparison | not statable: higher Quillen groups and relative Lie algebra cohomology/invariant forms are absent at the pins; the docstring says so, and I confirmed `Mathlib/Algebra/Lie/Cochain.lean` is “Lie algebra cohomology in low degree” only (1- and 2-cochains, `d₁₂`, `d₂₃`) |
| §3.5 hermitian finiteness; §§5.1–5.5, 6.1–6.16, 7.4–7.5, 8.5, 8.8–8.10 | named in the docstring as not statable; no stand-in is offered |

### Seeded source sample

Line numbers are into the cached extractions; pages are the printed pages.

| Target | Opened and conclusion |
| --- | --- |
| 1.2 Enlarging primes and extending fields | kbook line 24317 (V.6.1, p. 406: the localization fibration for a central multiplicative set); kbook line 24609–24624 (V.6.6.3–6.6.4, p. 410: the morphism of localization sequences for a finite extension of Dedekind domains, with norms on the residue terms). Pinned `IsLocalization.isLocalization_of_submonoid_le` elaborates with nested submonoids and the scalar tower. The finite-projective claim is made only for T the full inverse image of S, as the sources' setting requires. |
| 2.4 Even injectivity and what exactness supplies | kbook line 24533–24547 (V.6.6, p. 409: the Dedekind localization sequence with transfers on residue fields); kbook line 24726–24755 (V.6.8, pp. 412–413: Soulé, SK_n(R) = 0 for even n > 0 from K_n(𝔽_q) and finite generation; odd injectivity needs the coefficient argument of 6.8.1). The README's split (even injectivity from vanishing, odd surjectivity from the next residue group, odd injectivity deferred to Layer 5) is exactly the source's. |
| 3.2 Relative homology, stability and the finiteness criterion | kahn line 722–731 (Theorem 4.3.3, p. 17: E¹_{p,q} = ⊕ H_q(Aut E_α, st(E_α)) over isomorphism classes of rank-p torsion-free sheaves); kahn line 525 (Corollary 2.3.7/Theorem 2.4.1, p. 12); putman-studenmund line 165–168 (Theorem C, p. 4: D ≅ St_n(K) ⊗ (ℤ_χ)^{⊗(n−1)} with χ = sign∘N∘det) and line 301 (Proposition 2.1, p. 8); sun line 144 (pp. 4–5, layer poset of proper pure submodules). Quillen and Serre are waived. |
| 4.2 Exponents and odd-primary computation | kbook line 28465–28481 (Proposition VI.2.2 and proof, pp. 470–471): w_i^{(ℓ)} = ℓ^{a+b} if r ∣ i and 1 otherwise, proof via the cyclic Galois group and Lemma 2.2.1's exponent criterion. Matches the README formula and its i ≠ 0 restriction. |
| 4.4 Rational values | kbook line 28417–28420 (Example VI.2.1.2, p. 470) and line 28557–28558 (Lemma VI.2.4, p. 472: w_{2k}(ℚ) = den(B_k/4k), ℓ ∣ w_i(ℚ) iff ℓ−1 ∣ i). The README's 264 at i = 10 corrects the source's 1320 (see Source issues). |
| 6.1 Even groups in cohomological dimension two | kbook line 31296–31299 (Theorem VI.8.2, p. 513), line 31348–31352 (Corollary 8.3, pp. 513–514), line 31353–31358 (Example 8.3.1, p. 514: rank t + |S| − 1 with S the primes over ℓ), line 31382–31391 (Theorem 8.4, p. 514, totally imaginary). |
| 6.2 Signature defect from Selmer classes | kbook line 31760–31770 (map (9.6), Definition 9.6.1, p. 520: j(R) = dim coker α₁, 0 ≤ j < r₁, j(O_S) ≤ j(O_F)), line 31785–31789 ((9.6.2), p. 521: u = t + j). |
| 6.4 Mod-two orders and the even two-rank function | kbook line 31790–31794 (dimensions r₁+r₂+s+t and r₁+s+t−1; Lemma 9.6.3, p. 521), line 31799 (Theorem 9.7, p. 521), line 31869–31892 (Corollary 9.8 and proof, p. 522), line 31898–31903 (Corollary 9.9, pp. 522–523: 2-ranks r₁+s+t−1, j+s+t−1, j+s+t−1, s+t−1). The README's four even branches are these four values. |
| 6.7 Three wild-kernel constructions | kbook line 24796–24804 (V.6.8.2, p. 413: div K_n(F) and the wild kernel as the intersection over all valuations); wildkernel line 51–57 (Definition 0.2, p. 2: kernel of K_{2i}(F) → (ℤ/2)^{r₁} ⊕ ∏_{v finite} μ_i(F_v), and K⁺ for i ≡ 1 mod 4), line 58–72 (Lemma 0.3, Corollary 0.4, pp. 2–3), line 597–612 (§8, p. 20). |
| 6.16 Comparison with ordinary K-theory and degree one | fgv line 533–566 (Proposition 2.9 and proof, pp. 12–13: isomorphism for i ≥ 1, monomorphism at i = 0), line 567–576 (Lemma 2.10, p. 13: ℤ → ℤ′ iso except degree 1, where K₁(ℤ′;ℤ/q) ≅ ℤ/q ⊕ K₁(ℤ;ℤ/q)), line 586–595 (Lemma 2.11, pp. 13–14, the four-slot table also used in §6.15, and the final assertion for O_q at i = 0 or i ≥ 2). |
| 7.1 Three Bernoulli conventions and rational w-values | kbook line 28557–28558 (Lemma VI.2.4) and line 28561–28575 (Example VI.2.4.1, p. 472: regular primes, Kummer's criterion, “a regular prime does not divide the numerator of any B_k/k”). Pinned `bernoulli`, `bernoulli'`, `bernoulli_eq_bernoulli'_of_ne_one` and `Bernoulli.vonStaudt_clausen` elaborate; the last gives B₂ₖ + Σ_{p prime, p−1 ∣ 2k} 1/p ∈ ℤ, the squarefree-denominator input the README consumes. |
| 7.3 Character projectors and Herbrand–Ribet | ribet line 73 (Main Theorem (1.1), p. 151: for even k with 2 ≤ k ≤ p−3, p ∣ B_k iff C(χ^{1−k}) ≠ 0), line 83 and 97 ((1.2), (1.3), p. 152), line 469 ((4.4) Theorem, p. 162); sharifi line 3690–3691 (Theorem 4.5.7, p. 117, Herbrand's direction and A(ω) = 0). The README's exponent 1−2k and the k = 16, p = 37 witness (1−32 ≡ 5 mod 36) agree. |
| 8.5 The Gaussian tame kernel | kbook line 12497–12506 (Example III.5.2.2, p. 218: K₂(ℤ) cyclic of order 2 with {−1,−1} the generator). Bass–Tate is waived; the Steinberg-relation computation 3{i,i} = 0, 4{i,i} = 0 ⇒ {i,i} = 0 is reproduced below. |
| 8.9 Upper generation and the independent real-sign bound | groenewegen (journal text, 16 pages, pp. 1443–1458) is the cached version, with Lemmas 6, 9, 12 and Propositions 10, 13 on its pp. 1446–1453 as the README's journal locators say; the preprint and Bass–Tate are waived. The two real symbols of g = {−1,−1}, h = {−1,ε} are recomputed below. |
| 8.10 Degree-three arithmetic examples | kbook line 31530–31532 (Exercise VI.8.5, p. 516: K₃(ℤ[i]) ≅ ℤ ⊕ ℤ/24), line 31706–31717 (Theorem VI.9.5, p. 519: n ≡ 3 mod 8 row ℤ^{r₂} ⊕ ℤ/2w_i ⊕ (ℤ/2)^{r₁−1}), line 31271–31281 (Classical Data 8.1, p. 513). |

The newly cited Borel papers were fetched through the sources service from Numdam and read: borel1974 line 110–111 (0.1, p. 237: [x]′ is the greatest integer strictly smaller than x), line 325–334 (3.3, p. 243, Matsushima's constant m(G) and its minimum over noncompact simple factors), line 422–430 (Proposition 3.6, p. 245), line 837–842 (Theorem 7.4, p. 256: logarithmic-growth forms compute the cohomology, are square integrable for q ≤ c(G), and contain I_G), line 934–940 (Theorem 7.5, p. 259: j^q injective for q ≤ c(G), surjective for q ≤ min(c(G), m(G(ℝ))), proved from 7.4 and 3.6 through a normal torsion-free finite-index subgroup), line 1006–1016 (9.1(1)–(2), p. 261), line 1061–1070 (9.5(3), p. 262: min(c(G/ℚ), m(G(ℝ))) ≥ [rk_ℚ G/4]′ for G connected almost ℚ-simple); borel1977 line 440–461 (§5.2, pp. 626–627: the stable range for SL_n over a number field referred to [4]; the inequality symbol is lost in the OCR). The README's range 4q < rk_ℚ(G_j) is q ≤ [rk/4]′, and for a product the minimum over the almost simple factors follows from 9.1(2), 9.3 and the definition in 3.3. The worker's manifest does not record `borel1974`/`borel1977` (nor the two arXiv items cited only in a §7.5 Check); this review edits no manifest, and the service's two entries written during the fetch were restored to the committed file.

### Computed adversarial pass

Notation: C_m is the cyclic group of order m. Every row states what was computed on each side; “retain” means the stated hypotheses exclude the negative control shown.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| `sUnitSubmonoid` (headline carrier) | ℤ, S = ∅ and S = {(2)}; R a field | Units of `Set.integer`: {±1}; {±2^a}; R∖{0}. 2 admitted only in the second case, 3 in neither, 0 in none | Pass; retain |
| `integer_isLocalization_iff`, ⇐ | M ≤ sUnit, each v ∈ S meets M; x ∈ S.integer with poles at v₁,…,v_k ∈ S | m = ∏ m_i^{n_i} with m_i ∈ M ∩ v_i has v_w(m) = 0 off S, so xm ∈ R and x = (xm)/m; surjectivity, injectivity and the equalizer law of `IsLocalization` hold | Pass |
| `integer_isLocalization_iff`, ⇒, non-torsion control | Dedekind R with [v] of infinite order, S = {v} | Some x ∈ S.integer has v_v(x) = −n < 0 (integral ideal coprime to v in the class of v^n), so S.integer ≠ R; any M of S-units has (m) = v^j with [v]^j = 1, so j = 0 and M ≤ R^×, M⁻¹R = R; both sides false | Pass; iff consistent beyond torsion |
| `integer_isLocalization_iff`, zero and field cases | 0 ∈ M; R a field | 0 is not a unit of the nonzero ring S.integer, LHS false since a localization at 0 is the zero ring ≠ S.integer; field: Spec¹ = ∅, S.integer = F, any M ≤ F^× gives F = M⁻¹F | Pass |
| `integer_isLocalization_of_torsion_classGroup` | ℤ[√−5], S = {p = (2,1+√−5)} | [p]² = 1, p² = (2), 2 ∈ p and 2 is an S-unit; the iff's right side holds; requiring p principal would reject the instance | Pass; retain |
| `regularPrime_dividedBernoulli_num`, p−1 ∤ 2k branch | (p,k) = (5,5), (5,7), (5,63) | B₁₀/5 = 1/66; B₁₄/7 = 1/6 and B₁₄/14 = 1/12 ≡ 3 mod 5; B₁₂₆/63 ≡ 2·3 = 6 ≡ 1 mod 5; numerators 1, 1, ≡1: none divisible by 5, including k divisible by p and p ∣ 2k+1 | Pass; unrestricted supplier congruence needed, as stated |
| same, p−1 ∣ 2k branch | (p,k) = (3,1), (5,2) | B₂/1 = 1/6 has v₃ = −1; B₄/2 = −1/60 has v₅ = −1; reduced numerators 1, −1 prime to p | Pass |
| same, junk and irregular controls | k = 0; (p,k) = (37,16) | bernoulli 0 / 0 = 0 in ℚ, numerator 0, divisible by p: excluded by 1 ≤ k. num(B₃₂) = −7709321041217 = −37·208360028141, so regularity cannot be dropped | Pass; retain |
| §3.4 bracket convention | rk = 4 (SL₅ over ℚ), q = 1; rk = 13 (m = 14), q = 3 | [4/4]′ = 0 so q = 1 is outside; 4·3 = 12 < 13 so q = 3 is inside; at m = 13, 12 < 12 fails | Pass; strict floor matches borel1974 0.1 |
| §3.4 product reduction | G = G₁ × G₂, weights ν = ν₁ + ν₂ of A_P in ∧^q | ρ_P − ν ≫ 0 for all such ν iff ρ_i − ν_i ≫ 0 for each factor at q (take ν₂ = 0); c(G) = min c(G_i); m(G(ℝ)) = min over the real simple factors by 3.3 | Pass; “for every almost ℚ-simple factor” is the correct quantifier |
| §3.4 anisotropic factor | rk_ℚ G_j = 0 | [0/4]′ undefined (0.1 needs x > 0); the README asserts no degree, which is weaker than Borel's q = 0 and not false | Pass |
| §3.4 Check 1 | Γ(3) ⊂ SL₂(ℤ) | #SL₂(𝔽₃) = 24; −I ∉ Γ(3) so Γ(3) ≅ its image of index 12 in PSL₂(ℤ) ≅ C₂ ∗ C₃, free of rank 1 + 12(1 − 1/2 − 1/3) = 3; H¹ = ℝ³, H² = 0; (𝔰𝔩₂(ℝ),SO(2)): H^*(S²) = ℝ, 0, ℝ | Pass; j¹: 0 → ℝ³ not onto, j²: ℝ → 0 not injective |
| §3.4 Check 2 | SL₂(ℤ[i]) | dim ℍ³ = 3, rk_ℚ Res SL₂ = 1, vcd = 2, H³(Γ;ℝ) = 0; compact dual SU(2) = S³ has H³ = ℝ; degree 3 enters at m = 14 | Pass |
| §3.4 Check 3 | SU(m)/SO(m), m = 4, 5, 6; SU(m) | m = 4: Euler class in degree 4; m = 5: Λ(e₅, e₉); m = 6: Λ(e₅, e₉) ⊗ Λ(e₆); so m ≥ 5 is needed for empty degrees 1–4. SU(m): e₃ primitive. 20 < m − 1 ⇔ m ≥ 22 | Pass |
| §3.4 Check 4 narrower range | F = ℚ(i), q = 3, N = 2 | m − 1 > 24 ⇔ m ≥ 26 versus 12 < m − 1 ⇔ m ≥ 14 | Pass; BorelRegulators' requested range lies inside |
| §3.4 real points | Res_{F/ℚ} SL_{mn}(D) at a real place with D ⊗ ℝ = M_d(ℝ) or M_{d/2}(ℍ), complex place | SL_{mnd}(ℝ), SL_{mnd/2}(ℍ), SL_{mnd}(ℂ): all connected; ℚ-rank mn − 1 | Pass |
| §3.4 ranks | ℚ, ℚ(i), degrees 3 and 5 | SU/SO generators in degrees 4a+1 ≥ 5, SU in 2a+1 ≥ 3: ranks (0,1) and (1,1); K₃(ℤ[i]) ⊗ ℚ = ℚ | Pass |
| §3.2 function-field exclusion | SL₂(𝔽_q[t]), finite-index Γ | The unipotent group {[[1,f],[0,1]]} is infinite elementary abelian of exponent p; Γ meets it in a finite-index subgroup, hence nontrivially: Γ has an element of order p and is not torsion-free | Pass; the exclusion reason is correct |
| §3.2 finiteness criterion hypotheses | R = 𝔽_q[t] versus O_F | Pic finite in both; the Steinberg-homology hypothesis is proved only for O_F; the criterion is stated for every Dedekind domain with finite Pic | Pass; consistent with the Scope paragraph |
| §1.2 tower | ∅ ⊆ {(2)} ⊆ {(2),(3)} | ℤ → ℤ[1/2] → ℤ[1/6]; (1/2)(1/3) = 1/6; identity at equal sets | Pass |
| §1.2 extra upper prime control | ℚ(i)/ℚ, invert 2+i upstairs only | N((2+i)⁻¹) = 1/5 ∉ ℤ: not integral, so not finite over ℤ | Pass; T must be the full inverse image |
| §2.4 degrees | n = 4, residue 𝔽₂; n = 3 | K₄(𝔽₂) = 0 gives injectivity; K₃(𝔽₂) = C₃ so exactness does not give odd injectivity | Pass |
| §4.2 formula | ℓ = 3, F = ℚ: i = 1, 2, 6 | r = 2, a = 1: w = 1, 3^{1+0} = 3, 3^{1+1} = 9 | Pass |
| §4.3 dyadic table | ℚ, ℚ(i), ℚ(√−2), weights 1 and 2 | ℚ: a = 2, w₁ = 2, w₂ = 2³ = 8; ℚ(i): w₁ = 4, w₂ = 8; ℚ(√−2): a = 3 nonexceptional, w₂ = 2^{3+1−1} = 8, w₁ = 2 | Pass |
| §4.4 w_i(ℚ) | i = 2, 4, 6, 8, 10, 12 | 2³·3 = 24; 2⁴·3·5 = 240; 2³·3²·7 = 504; 2⁵·3·5 = 480; 2³·3·11 = 264 (5−1 ∤ 10); 2⁴·3²·5·7·13 = 65520 | Pass; source's 1320 is a misprint |
| §7.1 denominators | B₂/4, B₄/8, B₆/12, B₁₀/20 | 1/24, −1/240, 1/504, 1/264 | Pass; agree with §4.4 |
| §7.3 Herbrand exponent | ℓ = 37, k = 16 | 1 − 32 ≡ 5 mod 36 (not 31) | Pass |
| §7.3 Teichmüller direction | p = 5, n = 2 | Lifts 1, 7, 18, 24 mod 25; weighted sum 165/5 = 33 ≡ 3 ≡ B₂/2 = 1/12 mod 5; inverse weights give 154, not divisible by 5 | Pass |
| §5.4 odd table | ℚ, n = 3, 5 | ℤ/(2·24) = ℤ/48; w₃/2 = 1 with rank 1 | Pass |
| §5.4 diagonal normal form | (w,r) = (24,1), (2,2); D₈ control | C₄₈; C₄ ⊕ C₂; in D₈ the lift as has order 2 although a² is the diagonal: abelian hypothesis retained | Pass |
| §6.1 ranks | ℚ(i), ℓ = 2, S = {(1+i)} | t = 0, s = 1: rank 0; every positive even K-group of ℤ[i] has odd order | Pass |
| §6.2 defect | ℚ(√7): −1, 8+3√7, 3+√7; invert 7 | Signs all diagonal: j(O[1/2]) = 1; √7 has signs (+,−): j = 0 | Pass |
| §6.4 two-rank function | (r,s,t,j) = (1,1,0,0); (2,1,0,1); n = 2, 4, 6, 8 | (1,0,0,0); (2,1,1,0) | Pass |
| §6.5 ratio | ℚ, i = 2 and 4 | 2·2/48 = 1/12 = |ζ(−1)|; 2·1/240 = 1/120 = |ζ(−3)| | Pass; the 2^{r₁} factor is essential |
| §6.7 raw kernel | ℚ, {−1,−1} | Real symbol −1 and dyadic Hilbert symbol −1: excluded; finite tame residues alone would keep it | Pass |
| §6.7 local target order | i = 1, ℚ₂ | #D₁(ℚ₂) = w₁(ℚ₂) = 2, not w₂(ℚ₂) = 24 | Pass |
| §6.15/§6.16 slots | j = 0, −1, 1 | (0,0)/(2,1) total 0; (2,0)/(0,−1) total −2; (2,2) positive at j = 1 | Pass; matches fgv Lemma 2.11 |
| §6.16 degree one | ℤ versus ℤ[1/3], coefficients 3 | K₁(ℤ;ℤ/3) = 0; K₁(ℤ[1/3];ℤ/3) ⊇ C₃ from the valuation of 3 | Pass |
| §7.5 K₄(ℤ) | odd and dyadic parts | odd: H_i(K(ℤ);ℤ[1/2]) = 0 for 1 ≤ i ≤ 4 with π₄^S = 0; dyadic 2-rank s + u − 1 = 1 + 0 − 1 = 0; rational rank ρ(4) = 0 | Pass |
| §7.5 even orders | n = 2, 6, 22 | c₁ = c₂ = 1: orders 2, 1; c₆ = |num(B₁₂/24)| = 691 | Pass |
| §8.5 Gaussian kernel | g = {i,i} | 3g = 0 from {−i,1+i} = 0 and 1+i = i(1−i); 4g = 0 from i⁴ = 1; g = 4g − 3g = 0 | Pass |
| §8.5 Euclidean bounds | q = 5 | 1 + 1/√2 ≈ 1.707 < √5 ≈ 2.236; √2 < √5; C = {±1, ±i, ±1±i} covers the four nonzero residues | Pass |
| §8.9 signs | g = {−1,−1}, h = {−1,ε}, ε = (1+√5)/2 | ε > 0 at the first embedding, ε′ = (1−√5)/2 < 0 at the second: g ↦ (−1,−1), h ↦ (1,−1); product (−1,1); they span {±1}² so the lower bound is 4; upper bound 4 from 2g = 2h = 0 | Pass; 4/120 = 1/30 = ζ_F(−1) is a separate check |
| §8.10 | ℤ[i], ℤ | r₂ = 1, w₂ = 24: ℤ ⊕ ℤ/24; ℚ: ℤ/48 with rank 0 | Pass |
| §8.8 prime list | norms ≤ 33 in ℤ[ε] | X² − X − 1 mod 2, 3, 7, 13, 17, 23 irreducible; mod 5 ramified; mod 11, 19, 29, 31 split: norms 4, 5, 9, 11, 11, 19, 19, 29, 29, 31, 31; next inert prime 7 has norm 49 > 33 | Pass; eleven steps complete |
| §8.7 cutoff | d = 2√5/π ≈ 1.4235 | 16d² = 320/π² ≈ 32.42 < 33; (20d)^{2/3} ≈ 9.32; d³ ≈ 2.88; 2^{12/5}d^{12/5} ≈ 12.32 | Pass |
| Conventions: K₂ boundary | ℤ_(5), π = 5, u = 2 | β{5,2} = 2, β{2,5} = 3 in 𝔽₅^×; t = β⁻¹ gives 3, 2 | Pass; convention witnessed |
| Conventions: K₀ inverse class | 0 → p → R → R/p → 0 | [R/p] = (0,[p]⁻¹); for a class of order 3 this is c², not c | Pass |

### Supplier-order and citation audit

Every cross-roadmap citation of the README was resolved against the cited roadmap as it is now (on main, or at the open head the brief supplies). The new ArithmeticLocallySymmetricSpaces citations resolve at its open head: ALS.F.5 (relative Chevalley–Eilenberg cochains, invariant forms on H/K identified with C^•(𝔥,K;W)), ALS.0.4 (symmetric space), ALS.0.5 (contractible with proper action and finite stabilizers), ALS.0.8 (proper discontinuity at arbitrary level), ALS.2.2–ALS.2.3 (Borel–Serre bordification, compactness), ALS.5a.1 (rounded manifold with boundary and collar), ALS.5b.1 (Betti, de Rham and relative Lie algebra comparison at neat level). AdelicAlgebraicGroups §3.6 (“Cusps for one fixed maximal compact”) states the fixed-K Siegel covering and the finite-overlap theorem. All other section citations resolve: GeneralAlgebraicKTheory §§2.1–2.6, 4.3, 4.8, 4.14, 5.11–5.12, 7.4–7.8, 8.12–8.13; StableHomotopyKTheory §§1.24–1.28, 3.36–3.37, 7.1–7.13, 7.21–7.28 and Layer 7; SchemeKTheoryOperations §§3.6–3.7; KTheoryLowDegrees §§5.1–5.5, 8.1, 11.1–11.3; K2SymbolsBrauer §§7.1–7.2, 9.2–9.6, 11.2, 12.1–12.3, 12.5, 12.10–12.11; ClassicalArithmeticCompletion §§1.14–1.15, 1.35; ArithmeticGaloisDuality R02.1, R02.3, R02.4.3–R02.4.4; SelmerIwasawaCohomology §§2.1–2.4, 2.21–2.23; GeometryOfNumbersAndQuadraticArithmetic §§6.1a, 6.8a, 6.9, 6.10a, 6.11 and the label 6.4.2 inside §6.4 with `ExactW0`; HermitianKTheoryOfPoincareCategories §§0.1–0.3, 1.2–1.4, 4.4, 7.1–7.5, 8.1–8.2; KTheoryFiniteLocalFields §§0.5, 1.1–1.6, 2.2, 3.0a, 3.1–3.5, 6.2–6.9, 6.5a, 7.3 with its six named declarations; IntegralIwasawaTheory §§3.1, 6.0, 7.4, 7.7–7.8, 10.4–10.5, 12.3 with its four named declarations; CyclotomicClassGroupsAndStickelberger §§0.1–0.4, 2.1, 3.1–3.3, 4.5, 5.1, 5.4 with `herbrand_ribet`, `IsRegularPrime`, `kummer_criterion`, `regular_prime_power_class_number`; EtaleCohomologyFoundations F.0.1–F.0.3 (with `VanishingCycles.etaleTateTwists` at its line 233, the resolver's one lead), F.4.1–F.4.6; ClassFieldTheory Layers 11–13 with its three named declarations; NumberFieldArithmetic Layers 1–5, 7–8; Chebotarev Layer 10 with `hasDirichletDensity_frobeniusPrimeSet`; GeneralizedCohomology G2.5, G2.7, G5.4; MorseTheory M1–M3; GeometricTopology Layer 1 and the smoothing-and-triangulation comparison; ClassifyingSpaces Stage 3 items 12–13, Stage 4 item 16; AlgebraicTopology Stage 8; HomotopySpheres Stage 9 item 2. The only misses are the three names of R01. Every supplier is earlier in the merge order or on main; none of the forbidden list is cited.

Ownership: no roadmap on main, in the board packages or at the supplied open heads states Borel's stable invariant-form comparison (searches for “stable real cohomology”, “Matsushima”, “logarithmic growth”, “invariant-form comparison”, “Theorem 7.5” with the roadmap search service). BorelRegulators at its open head declares `gap:stable-finite-range` to ArithmeticKTheory §3.4 (its README lines 79–81), asking for exactly the maps, the finite-index and block-stabilization compatibilities and bijectivity for a − 1 > 4Nq; its §4.2 builds the compact-dual comparison and says the isomorphism is “a separate supplier theorem”. The README's Downstream consumers paragraph records this consumption without a pull-request number. K3BlochGroups cites ArithmeticKTheory §§3.2–3.4, 4.1–4.4, 5.1–5.4, 8.10 as a supplier; MotivicEtaleKTheory does not cite it. No `Suggested.lean` of a readable roadmap declares any of the four fully qualified names here.

### Pinned declarations opened

All elaborated by `#check` in the scratch file or located at the pins: `IsLocalization.isLocalization_of_submonoid_le` (`Mathlib/RingTheory/Localization/LocalizationLocalization.lean`, nested submonoids with the scalar tower), `Set.integer`, `Set.unit` (`Mathlib/RingTheory/DedekindDomain/SInteger.lean:108`), `Set.unitEquivUnitsInteger`, `ClassGroup.equivPic` (`Mathlib/RingTheory/PicardGroup.lean:876`), `ClassGroup.extendedHom`, `Module.End.eigenspace` (`Mathlib/LinearAlgebra/Eigenspace/Basic.lean:422`), `autEquivPow`, `bernoulli_eq_bernoulli'_of_ne_one`, `Bernoulli.vonStaudt_clausen`, `riemannZeta_neg_nat_eq_bernoulli`, `AddCommGroup.equiv_free_prod_directSum_zmod`, `LinearEquiv.ofBijective`, `AddSubgroup.index_eq_natAbs_det` (full-rank bases), `ZLattice.covolume_div_covolume_eq_relIndex'`, `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` (symmetric convex compact body, fundamental domain), `Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π`, `Module.Relations.Solution.surjective_π_iff_span_eq_top`, `SmoothPartitionOfUnity.exists_isSubordinate` (T2 and sigma-compact hypotheses as the README says), `IsDedekindDomain.HeightOneSpectrum.intValuation_eq_exp_neg_multiplicity` (the negative exponent §2.2 negates), `LieModule.Cohomology.d₁₂`; in Tau Ceti: `integerHeightOneSpectrumEquiv`, `valuation_integerHeightOneSpectrumEquiv`, `integer_extendedHom_surjective`, `ker_integer_extendedHom`, `integerClassGroupEquiv`, `finite_integer_classGroup`, `Set.unit_mono`, `Set.unitValuation` (`SInteger/Unit.lean:105`), `Set.unitValuation_ker` (:130), `Set.unit_fg_of_units` (:147), `ClassGroup.relNorm`, `ClassGroup.relNorm_extendedHom`, `TauCeti.ExactK0.liftEquiv` (`CategoryTheory/GrothendieckGroup/Exact.lean`), `CategoryTheory.ExactStructure`, and the nineteen `TauCeti.NumberField.Sqrt5` names (`WorkedExamples/Sqrt5/{Basic,Invariants,Units,RealPlace}.lean`). `Mathlib/Algebra/Lie/Cochain.lean` at the pin defines only 1- and 2-cochains with `d₁₂`, `d₂₃`, so the docstring's “only low-degree Lie algebra cochains” is correct.

### Declared gaps

Both gaps are precise, minimal and declared where the intake reads them: the slugs in the README (lines 260 and 398) match `packages/ArithmeticKTheory/design/plan.json`. The homotopy-orbit contract names the spectrum, the coherent action, the actual module π_q E, strong convergence and the skeletal filtration (hermitian line 2256–2261, proof of Corollary 2.3.18, p. 48, is the application); the signature contract names the carrier `ExactW0`, the map through real embeddings, finite kernel and image rank r₁ (hermitian line 2217, Corollary 2.3.16, p. 47). Neither is supplied by Mathlib, Tau Ceti or an earlier roadmap.

## Not verifiable

- `harris-segal`, `mitchell`, `quillen`, `bass-tate`, `serre` and `groenewegen-preprint` are settled waived sources; their locators (Quillen pp. 179–185, Serre III §1, IV §§3, 6, V §§1–2, Bass–Tate II §3 and Appendix, Mitchell §3, Harris–Segal §3, the preprint pages) were retained, not read.
- borel1977 line 460: the inequality symbol in “degrés … (n−1)/4” is lost in the OCR; the strictness of the range was certified from borel1974 0.1 and 9.5(3) instead.
- The AINTLIB declarations of §§7.1–7.3 were not re-opened this round; the README records their index restrictions and attributes the unrestricted statements to CyclotomicClassGroupsAndStickelberger §3.1, whose heading resolves.
- Ownership was checked against the open pull requests whose files the brief supplies and the roadmap search service's index of 461 open pull requests; pull requests outside that index were not searched.

## Source issues

- **Misprint** in kbook at Example VI.2.1.2, printed p. 470 (line 28420): the source gives w₁₀(ℚ) = 1320 with a factor 5; it should be 264, since 5 − 1 does not divide 10; affects a stated result.
- **Error** in kbook at the discussion after Proposition VI.2.3, printed p. 471 (line 28509): the source says ℝ is exceptional; it should exclude real closed fields, whose dyadic cyclotomic Galois groups have order at most two and are cyclic; affects a stated result.
