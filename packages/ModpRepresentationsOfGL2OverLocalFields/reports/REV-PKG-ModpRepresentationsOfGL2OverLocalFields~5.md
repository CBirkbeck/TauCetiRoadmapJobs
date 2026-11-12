<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13474#issuecomment-6793907268 -->
Review (codex) of 7b2eb7a

Verdict: needs_changes

1. **F01** (P1) The two conjugate characters need different inducing weights

   **Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:752`: “two distinct characters (`t⁵ = −t`), each a quotient of `I(χ|_K)`”.

   **Claim.** Both χ and χ⁵ are quotients of the compact induction of χ restricted to K.

   **Witness.** At h = diag(t̃,1), an intertwiner χ→χ⁵ satisfies tc = −tc. Since 2t ≠ 0 in 𝔽₂₅, c = 0. Frobenius reciprocity gives Hom_G′(I(χ|_K),χ⁵) = 0.

   **Exact repair.** Replace “each a quotient of `I(χ|_K)`” by “quotients of `I(χ|_K)` and `I(χ⁵|_K)`, respectively”. Keep the nonsplit example and the general-coefficient filtration.

   **Test of repair.** Each corrected Hom space is one-dimensional, containing the map induced by the identity of its own inducing character. Each resulting nonzero map onto a character is surjective. The mixed Hom space remains zero. Thus the two-dimensional scalar extension still has the stated two one-dimensional factors.

2. **F02** (P1) Central character does not imply admissibility away from ℚ_p

   **Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1039`: “a supersingular irreducible representation over `k̄` with central character is admissible”.

   **Claim.** Supersingular irreducibles with central character over every F ≠ ℚ_p are admissible.

   **Witness.** LE19 lines 30–31, 46–47, 165–169, 231–237 and 269–271 construct irreducible representations with central character for GL₂(ℚ₁₂₅), containing infinitely many copies of the same nonzero K₁-trivial module. Their K₁-invariants are infinite-dimensional.

   **Exact repair.** Make admissibility an explicit assumption: “For F ≠ ℚ_p, an **admissible** supersingular irreducible representation over k̄ with central character is not in 𝒞, because it is not finitely presented.” Add Le's representation as the negative control showing that central character alone does not supply admissibility. Keep the separate compact-induction example. LE19 has been added through the sources service; use its v3 Theorems 1.1 and 3.2–3.4 and the central-character observation on p. 2.

   **Test of repair.** Take p = 5, f = 3, λ₀ = 1 and λᵢ = 2 for i ≠ 0 in Le's construction. The irreducibility hypothesis is satisfied. Its embedded D₀ = ⊕ᵢ∈ℤ D₀(ρ̄) has K₁ acting trivially, so dim π^{K₁} ≥ dim D₀ = ∞, contradicting admissibility. It has the fixed central character of the diagram. It is supersingular: the nonsupersingular irreducible classes (characters, special representations and irreducible principal series) are admissible, whereas this representation is not. The amended Check excludes this example and retains the intended admissible-but-not-finitely-presented example. The main theorem of §2.4 already assumes admissibility and needs no change.

   The cited supplier itself warns of this phenomenon: PR #1312, `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:904`, §2.9(ii). This is not a new generality requirement on the supplier.

3. **F03** (P2) The supplier gives reducibility, not infinite length

   **Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:701`: “for `F ≠ ℚ_p` the quotient `I(σ)/T I(σ)` has infinite length (PadicLocalLanglandsForGL2Qp §2.9)”.

   **Claim.** The cited supplier supplies infinite length of the universal supersingular quotient for every F ≠ ℚ_p.

   **Witness.** PR #1312, `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:904`, §2.9(iii), asserts nonirreducibility only. CDN23 lines 702–705, Remarque 1.18, states the admissible-quotient conjecture; it does not assert this infinite-length result.

   **Exact repair.** Delete this third Check of §1.1, including its assertion that the ℚ_p hypothesis is essential on that evidence. This is a theorem subsection, so retaining its other two Checks violates no definition-test minimum. If the stronger comparison is retained instead, it needs its own verified primary locator and an owned target or precise supplier contract; the present §2.9 citation is insufficient.

   **Test of repair.** The retained exceptional quotient I(1)/(T−1) has a proper Steinberg submodule and length 2: reducibility is true while infinite length is false. This verifies that the supplier's weaker conclusion cannot justify the deleted inference. No counterexample to the infinite-length assertion itself is claimed here; the defect is the unsupported strengthening and its use as a negative control.

4. **F04** (P3) The Vignéras manifest range omits page 22

   **Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/sources.toml:254`: “§5, Lemme 11, Propositions 8-10 and Théorème 6, pp. 19-21 (arXiv numbering)”.

   **Claim.** This page range covers all the listed results in the recorded arXiv version.

   **Witness.** VIGNERAS11 line 824 marks page 22; Proposition 9 begins at line 827 and Proposition 10 at line 835. Neither is on pages 19–21.

   **Exact repair.** Use “§5, Théorème 6, pp. 19–21; Proposition 8 and Lemme 11, p. 21; Propositions 9–10, p. 22 (arXiv numbering)”. Preserve the source key, fetched fields and the warning about the incorrect general assertions in Propositions 9–10.

   **Test of repair.** The revised range contains the actual starts of both propositions and retains the correct Théorème 6 locator. This is distinct from the earlier repaired substitution of Théorème 6 for Théorème 7.

## Verified sound

Four findings: two P1, one P2 and one P3. The author README, Suggested.lean and metadata were not edited. Their hashes match those recorded at review start. The original manifest bytes were preserved, with only the sources-service LE19 entry appended.

### Previous findings and changed passages

| Previous finding | Repaired passage | Result of independent check |
| --- | --- | --- |
| Round 4 F01: nonsplit coefficients in §1.2 | README:710: “each `W_i` an irreducible smooth `k[K]`-module”; README:718: “`k`-forms that need not be absolutely irreducible” | **Partly repaired.** The theorem and its descent/splitting clauses are repaired. The added example's last induction is wrong: R01. The correct one-step filtration uses W = V restricted to K. |
| Round 4 F02: invariants confused with invariants of semisimplification | README:1301: “`D₁(ρ̄)` is not the space of invariants of the semisimplification” | **Repaired.** For the displayed p = 17 parameter, the four constituent dimensions sum to 32, but actual I₁-invariants have dimension 2. Their values at diag(3,1) are 5 and 1; 6 and 13 do not lift. |

The changed Layer 1 preamble, §§0.5, 1.2–1.3, 2.3–2.4 and 3.5, and BP12's revised manifest locators were reviewed afresh. The split-field clause retains every finite coefficient field in the general theorem: k containing k_F is used only to identify irreducible k-forms with absolute weights. For k_F = 𝔽₂₅, k = 𝔽₅, det³ has scalar action z⁶ in 𝔽₅ but conjugate det¹⁵ differs, so central character alone indeed does not split the coefficient representation. The revised scalar-extension route fixes that problem.

The rest of the package was searched for the two repaired patterns. No other assertion equates D₁ with invariants of its semisimplification; §§7.3 and 7.6 use the actual D₁. General-F occurrences of absolute weights are explicitly over splitting coefficients or in the admissible absolute-weight clause of §0.8. R02 is a separate admissibility error in a sampled section. No finding marked “not actionable in this package” is re-raised.

### Principles, coverage and shape

All four author files, all 60 numbered targets and every Needs line were read. Unchanged material was carried from the preceding review only where its adversarial table had actual computed values; changed passages, all fifteen seeded targets, all headlines and remaining targets were examined independently. The table below records the seeded sample, headlines, changed patterns and finding instances rather than repeating every API bullet.

The ten layers have mathematical names, Examples and Dependencies. Definitions retain their APIs and at least three discriminating Checks. The theorem statements retain their hypotheses and locators, subject to R03 and R04; false Checks are R01 and R02. Main-branch ClassFieldTheory, SchemeAndStackFoundations and RepresentationTheory/QuiverRepresentations were read for house style and ownership. The order is mathematically constrained: finiteness before the ordinary-parts applications, coordinates and Iwahori algebra before extension modules, those modules before the multiplicity bound, and lattices before their endomorphisms and relative projectivity. There is no claim to follow a source's arrangement or chapter-named layer.

No existing roadmap is re-planned. No algorithm, copied source passage, sorry-valued data, set_option, admitted example, forbidden import or process residue was found in the roadmap text or Lean file. The all-prime finiteness claims retain p = 2,3 through their declared Ext contract. The depth bounds in Layers 3–9 are the hypotheses of the generic structure theorems, not substitutes for an advertised all-prime conclusion. Each of the twelve package-owned Lean names is declared and occurs in the README. No extra backticked API catalogue is attributed to this package.

### Seeded source verification

Locators below refer to the precise cached versions recorded in sources.toml. Statements were compared with the text, including standing hypotheses and proof steps used by the proposed routes. No newly flagged unverified locator was left unresolved. The two settled unavailable works are listed separately below.

| Target | Text opened and locator | Comparison |
| --- | --- | --- |
| §0.6 Hom base change and residue fields | CDN23 lines 500–523, Lemmes 1.6–1.7, p. 12 | Finitely generated source for Hom base change; irreducible admissible representation over finite k; finite endomorphism field and distinct scalar-extension factors. The admissibility restriction is retained. |
| §1.3 Finite type implies finite presentation | CDN23 lines 717–736, Proposition 1.19 and Proposition 1.20, p. 17 | The filtration argument works for all F using irreducible K-modules; Proposition 1.20 is the ℚ_p consequence. The corrected distinction agrees with the proof. |
| §1.5 Finite cosocle implies finite length | CDN23 lines 737–783, Théorème 1.21 and proof, p. 17 onward | Finite generation is retained; bounded semisimple quotient length is the finite-cosocle condition. The central-character/Ext reduction is not treated as a theorem for arbitrary groups. |
| §2.3 Finite obstruction and admissible length | HU12 lines 1734–1766, Proposition 3.30 and Corollaire 3.31, pp. 30–31; lines 1825–1828, Théorème 4.3, p. 33; lines 1900–1902, Proposition 4.4, p. 34; lines 1926–1927, Lemme 4.5, p. 35 | The finite-obstruction presentation criterion and admissible finite-length step match. HU12's absolute coefficient setting is handled by the new finite splitting extension. The proof's repeated positive-cell sign is corrected in the roadmap. |
| §2.4 Admissible finitely presented representations | CDN23 lines 823–837, Théorème 1.26, p. 19; lines 855–864, Lemme 1.29, p. 20; VIGNERAS11 lines 697–758, Théorèmes 5–6, pp. 19–20, and Proposition 8, p. 21 | Main theorem, subquotients and coefficient descent match. The universal admissibility Check does not: R02. Manifest page range: R04. |
| §5.6 First-order Serre-weight hulls | HW22 lines 558–565, Lemme 2.10, p. 12; lines 817–844, Theorem 2.23 and Corollaries 2.25–2.26, p. 17; lines 974–989, Theorem 2.30 and Corollary 2.31, p. 20 | Fixed injective hull, one occurrence of the socle, multiplicity-freeness, K₁-triviality for old constituents and the dual assertions agree. The f = 1 self-Ext exception r = p−2 is excluded. |
| §6.2 K₁-invariance and box torsion filtration | BHHMS23 lines 3102–3132, Lemma 6.2.3 and Proposition 6.2.4, pp. 60–61 | Strict socle depth, predecessor parity, the sign-dependent bounds, n−1 and odd-or-endpoint cosocles all match. |
| §6.6 Maximal first-order enlargement | BHHMS23 lines 3434–3470, Theorem 6.3.11, pp. 68–69 | Seven-deep hypothesis, protected opposite weights, maximal submodule, invariants, shifted-box quotient and constituent order agree. |
| §7.1 Connected Iwahori character sets | BHHMS23 lines 3668–3678, Definition 6.4.2 and Lemma 6.4.3, pp. 72–73 | Distinct endpoint characters require an occurring middle character with both Ext groups nonzero. It is a condition on support, not ordinary graph connectedness. |
| §7.2 Vanishing on the Loewy-three socle | BHHMS23 lines 3621–3667, Proposition 6.4.1, pp. 71–72 | Finite-length I-module, simple equal socle/cosocle, strict socle-radical inclusion, semisimple middle, interior weight and quotient multiplicity one all survive. |
| §7.6 Local GK bound | BHHMS23 lines 3815–3828, Theorem 6.4.7, p. 76 | Eight-deep tame weights, central character and the three specified socle/multiplicity/character hypotheses remain. Conclusion is an upper bound f, not equality or a bound without hypotheses. |
| §8.2 Preimage-lattice Bockstein | BHHMS23 lines 3922–3927, Lemma 7.1.4, p. 78 (section continues p. 79) | The denominator is p²V°, the map from sl₂⊗W is the restricted infinitesimal action, and the middle term uses coinvariants. |
| §8.5 Coinvariants and gluing reduction | BHHMS23 lines 4103–4140, Proposition 7.3.1, p. 82; lines 4144–4151, Lemma 7.3.2, p. 83; lines 4161–4196, Theorem 7.3.3, pp. 83–84 | Coinvariant identifications, tensor endpoint and short exact sequence have the stated sources and targets. They are not invariant-space identities. |
| §8.6 First radical truncation | BHHMS23 lines 4197–4229, Corollary 7.3.4, p. 84 | The cover is over K/Z₁, with K₁ radical squared; the dimension is (3f+1)dim Pσ. The proof's three erroneous K₁/Z₁ cover subscripts are not copied. |
| §9.3 Relative projectivity of quotients | BHHMS23 lines 4256–4305, Proposition 7.4.3 and Remark 7.4.4, pp. 85–86 | Bounds 5 < rᵢ < p−7, every quotient and its subquotients, Hom by precomposition, and the simple-cosocle surjection agree. Projectivity is relative to the specified subquotient-generated abelian category. |

BP12 equation (2), lines 479–488, pp. 13–14, was also checked for the new split-field clause; Proposition 14.7, lines 3302–3304, p. 83, and §16(iii), lines 3670–3676, p. 92, for the repaired Diamond example. LE19 was fetched legally as arXiv:1809.10247v3 through the sources service and read in full for R02. All original cited works have manifest entries. The original settled statuses were preserved.

### Computed adversarial table

“Pass” below means the specified computation agrees with the statement and its hypotheses, not that testing proves the theorem. Length means representation length unless explicitly identified as coefficient length. Arithmetic and Hom calculations were recomputed; the two false Checks are not hidden by a successful sorry build.

| Statement | Instances tried | Values on the two sides or wrong-model comparison | Result; change |
| --- | --- | --- | --- |
| §0.1 admissibility and Lean predicates | Trivial action on 𝒪/ϖᵐ, L/𝒪, and ⊕ℕ k; j = 0 | With p = uϖᵉ, killed-by-pʲ lengths are min(m,ej), ej, and ∞ for j ≥ 1 respectively; j = 0 gives 0. First two satisfy torsion admissibility, third fails. | Pass. Smoothness and torsion are supplied separately where needed. |
| §0.5 coherence; Lean kernel headline | Identity and zero maps on I(σ); even-determinant subgroup | Kernels are 0 and I(σ), with zero and finite coefficient presentation. Scalar ϖI₂ has determinant valuation 2; diag(ϖ,1) has value 1, so the even subgroup has index 2. | Pass. Neither kernel computation assumes finite length. |
| §0.6 Hom base change | H = 1, V = k², W = k; extension k′/k | dim Hom before extension = 2, after extension = 2. For V = ⊕ℕ k and k′ = k(t), values 1,t,t²,… span infinite k-dimension, whereas a tensor element has finite coefficient span. | Pass; finite generation is substantive. |
| §0.6 endomorphism field | C₃ on 𝔽₄ over 𝔽₂ | End has dimension 2 over 𝔽₂; over 𝔽₄ the two distinct character summands each have endomorphism dimension 1. | Pass; absolute irreducibility is not inferred over a nonsplitting field. |
| §1.1 supplier comparison, R03 | Reducible exceptional quotient I(1)/(T−1) | Nonirreducible = true; length = 2, infinite length = false. | The cited weaker property cannot establish the claimed negative control; delete the unsupported Check. |
| §1.2 changed filtration and R01 | F = ℚ₂₅, k = 𝔽₅, V = 𝔽₂₅ via ac(det) | Matrix ((0,2),(1,0)) has irreducible X²−2 since squares are 0,1,4. End_K(V) has dimension 2. One step from c-Ind(V restricted to K) works; Hom from every absolute k-weight is 0. After splitting, t⁵ = −t and mixed Hom(χ,χ⁵) = 0 versus the asserted quotient. | General theorem passes; final Check fails. Corrected individual inductions have Hom dimensions 1 and 1. |
| §1.2 split clause, small primes and ramification | GL₂(𝔽₂), GL₂(𝔽₃); ramified F with k_F = 𝔽_p | Numbers of simples are 2 and 6 = p(p−1), all defined over 𝔽_p. General count: (p−1)+(p−1)(p−2)/2+p(p−1)/2 = p(p−1). Ramification does not change the residue-field splitting argument. | Pass; neither p = 2 nor p = 3 is discarded. |
| §1.3 finite type ⇒ finite presentation; Lean headline | Trivial representation at p = 2,3; I(σ) | One group-algebra generator and length 1 for the character. I(σ) has a compact-induction presentation with zero relations but length ∞. | Pass. Finite presentation is not being confused with finite length. |
| §1.5 finite cosocle; Lean headline | π⊕π, exceptional principal series, N = 0 | Maximal semisimple quotient lengths 2 and 1; total lengths 2 and 2. If N = 0, a nonzero finitely generated module's simple quotient has length 1 > 0, so V = 0. | Pass; the bounded quotient condition is not the conclusion in disguise. |
| §1.6 smooth-dual criterion; Lean headline | k, Steinberg, ⊕ℕ Steinberg | (Length, smooth-dual dimension) = (1,1), (1,0), (∞,0). The third has no finite set of generators. | Pass in the stated domain; finite generation blocks the false converse. |
| §2.3 finite obstruction | Identity induction presentation; augmentation to k | Δ = 0 for disjoint support cells in I(σ); in the trivial quotient both images equal k, so dim Δ = 1. The former has infinite length and is nonadmissible; the latter has length 1. | Pass; finite Δ alone is not used as a finite-length criterion. |
| §2.4 finite length and subobjects; two Lean headlines | Trivial k²; Steinberg; nonsplit coefficient form | k² has length 2 and subobject lengths 0,1,2. Steinberg has representation length 1 but coefficient dimension ∞. The determinant k-form has length 1 over 𝔽₅ and two factors after splitting over 𝔽₂₅. | Main theorem and descent pass. |
| §2.4 universal admissibility Check, R02 | Le: p = 5, f = 3, λ₀ = 1, λᵢ = 2 otherwise | Irreducible length = 1, central character present, but dim π^{K₁} ≥ Σᵢ∈ℤ dim D₀(ρ̄) = ∞, whereas admissibility requires a finite value. | Fail. Insert admissibility as a hypothesis and keep this counterexample. |
| §§2.1–2.2, 2.5 ordinary-parts conventions | Character, Steinberg, lower-Borel induced module | Character transfer is qχ(t) = 0 mod p. Counit (kernel,cokernel) dimensions are (0,1), (1,0), (0,0), respectively. Lower-Borel induction returns the original torus character; upper-Borel induction swaps the two factors. | Pass; finite errors and opposite Borel agree with suppliers. |
| §2.6 Banach approximation; Lean headline | Θ = 0; trivial Θ = 𝒪; induced lattice; F of ef = 1 or 2 | With M = 0, error ranks are (0,0) and (0,1). For the induced lattice the identity gives (0,0). The Lean field exclusion is false for ℚ_p and true for an unramified quadratic or ℚ_p(√p): (e,f) = (1,1),(1,2),(2,1). | Pass; native coinduction, open bounded lattice and exact reduction submodule are used. |
| §3.5 repaired Diamond Check | p = 17, f = 1, r = 5 | Constituents have dimensions 6,10,12,4: total 32. D₁ dimension = 3¹−1 = 2, with diag(3,1) eigenvalues 5,1. Semisimplification instead gives dimension 4 and values 5,6,1,13. | Pass; the old false identification is excluded. |
| §4.1 zero/growth and §4.7 Iwahori headline | U = 1; U = ℤ_pᵈ acting on C∞(U,k); crossing support for f = 1,2 | Trivial nonzero module has grade 0, dimension 0 and invariants 1. Regular dual has δ = d and growth p^{rd} = [U:U^{pʳ}]¹. Crossing dimensions are 1 and 2, against ambient 3 and 6. | Pass; no δ/0 formula, and the headline uses the supplied multiplicity hypotheses. |
| §5.6 first-order hulls | p = 17, f = 1, σ = Sym⁵; distinct adjacent τ | Nonsplit I(σ,τ) has length 2, dimension 6+10 = 16 and σ multiplicity 1; K₁ acts trivially. H¹(K₁/Z₁,k) has dimension 3. The rank bound is (1+3)·34 = 136. r = 15 lies outside r ≤ 14. | Pass; multiplicity-one and the self-extension exclusion are retained. |
| §6.2 box torsion | p = 17, f = 1, r = 8, ε = −1, B = 3 | Bounds 5 ≤ 8 ≤ 13, parity 3 ≡ 1 mod 2. Labels 0,1,2,3 have dimensions 9,9,7,11. First torsion layer has dimension 18 and cosocle label 1; second has dimension 36 and cosocle label 3. | Pass; depth counts floor(a/2), not a. n = 0 is outside the stated range. |
| §6.6 maximal enlargement | Same λ with r = 8, p = 17 (7-deep) | D has length 2 and dimension 18; W has length 4 and dimension 36; shifted quotient has length 2 and dimension 18. Protected opposite neighbour has multiplicity 0; W^{K₁} has half the dimension of W. | Pass; replacing W by its invariants fails the quotient test. |
| §7.1 connected support | f = 1, p = 17, α of order 16 | Support {1,α²} has 0 allowed middle characters; {1,α,α²} has 1. Doubling multiplicities changes counts 1→2 but leaves support and the existence test unchanged. | Pass; ordinary graph connectedness is not the definition. |
| §7.2 Loewy-three vanishing | χ→χα→χ nonsplit three-layer module; its cosocle quotient followed by χ→F(λ) restricted to I | The map has rank 1 on the top and rank 0 on the bottom socle; [F(λ):F(λ)] = 1. For W = χ the adjunction unit has socle rank 1, but soc W ⊊ rad W is false. At p = 7 the only permitted r is 3; at p ≤ 5 there are none. | Pass; the excluded shorter module detects the Loewy condition. |
| §7.6 local GK headline | Dimension mechanism at f = 1,2; nonzero finite-dimensional modules | k[x,y]/(xy) has dimension 1; its two-factor tensor version has dimension 2, versus ambient dimensions 3 and 6. Finite-dimensional modules have δ = 0 ≤ f. | Pass on dimension/convention tests; the finite-dimensional examples are not asserted to satisfy the full generic GL₂ hypotheses. Source verifies those hypotheses and the bound. |
| §8.2 Bockstein exactness | Trivial V° = 𝒪², W a line; W = 0 and W = V°/p | V₁° = 𝒪e₁⊕p𝒪e₂. Quotient by p²V° has coefficient length 3 = 2+1, with β = 0. W = 0 gives middle length 2, while quotient by p²V₁° would give 4. Full W gives middle length 4 = 2+2. | Pass; the wrong denominator is detected. |
| §§8.1,8.3 signs and contraction | sl₂ basis e,f,h; p = 11,r = 3 | β(e⊗f) = h, β(f⊗e) = −h, β(h⊗e) = 2e. Eigenvalues −2r,4,2(r+2) are 5,4,10 mod 11, product 2 ≠ 0; at r = 0 or p−2 one is zero. | Pass; orientation and interior bounds are necessary. |
| §8.5 coinvariants; §8.6 lattice/truncation headline | p = 11, f = 1, r = 5 | dim Pσ = 22, dim R/pR = 88 = 66+22. Coinvariants have dimension 22; the injected K₁-trivial submodule already has dimension 66. A K₁/Z₁-only rank-one cover would give 4, not 88. | Pass; coinvariants and the K/Z₁ cover are essential. |
| §9.1 commutative endomorphism headline | f = 1 and 2 | Predicted equivariant endomorphism dimensions 2¹(1+1) = 4 and 2²(1+2) = 12. At f = 1 this is 4, not the full vector-space endomorphism dimension 88². | Pass; rational multiplicity-free lifting is substantive, not scalar algebra. |
| §9.3 relative-projectivity headline | Q = 0, σ, Tσ; a nonsplit two-constituent quotient Q | Hom dimensions on both sides are 0,1,4 for the first three self-targets at f = 1. For the two-constituent Q, maps to σ have dimensions 1 = 1; maps to its distinct socle τ have 0 = 0. Its projective cover is still Tσ, not Q. | Pass; projectivity is confined to the stated abelian subcategory. |

Additional controls on the unchanged formulas include the ramified ordinary transfer q/(2√5) = √5/2, residue coefficient 3 rather than 1; the crossing algebra's regular list (xᵢyᵢ), with dimension 2f−f = f and nonreduced-fibre/unit-ideal controls; cyclic predecessor parity for a two-coordinate box; the finite Borel conjugation χ↦χˢ; and the right End action (f·a)·b = f∘a∘b. The wrong inverse convention, zero infinitesimal action and postcomposition all fail these computations. No claim outside the stated characteristic, depth, nonzero-module or compactness domains was used to justify a theorem.

### Headline signatures and the padding probe

| README headline | Disposition in `packages/ModpRepresentationsOfGL2OverLocalFields/Suggested.lean` |
| --- | --- |
| Coherence for smooth finite presentation | `isFinitelyPresented_ker`, line 104. |
| Finite type implies finite presentation over ℚ_p | `isFinitelyPresented_of_finite`, line 121. |
| Finite cosocle implies finite length | `isFiniteLength_of_bounded_semisimple_quotients`, line 133. |
| Finite length detected by the smooth dual | `isFiniteLength_iff_finite_smoothDualSpan`, line 151. |
| Admissible finite presentation implies finite length | `isFiniteLength_of_admissible_of_finitelyPresented`, line 166. |
| Subobjects remain finitely presented | `isFinitelyPresented_subrepresentation_of_admissible`, line 180. |
| Finite-error Banach lattice approximation | `exists_coind_approximation_of_lattice`, line 202. |
| Exact ordinary parts, finite-error counit, exclusion of supersingular constituents | Docstring identifies the missing ordinary-parts functor and supersingular/principal-series constituent API. The statable existential Banach approximation is separately stated. |
| Iwahori multiplicity criterion and local GK bound | Docstring identifies the missing admissible GK dimension, labelled weights, tame weight set, D₁ and pseudocompact Iwahori truncations. |
| Projective truncation as a lattice reduction, commutative endomorphisms and relative projectivity | Docstring identifies the missing pseudocompact K/Z₁ covers and gluing lattice. No free predicate or arbitrary-module stand-in is introduced. |

Elaboration with the prescribed `lake env lean` invocation from the pinned content checkout succeeded: exit 0, exactly seven warnings, all declarations using sorry, at lines 104, 121, 133, 151, 166, 180 and 202. The sole import is `import Mathlib`; no TauCeti object file needed building.

A scratch copy containing `#check @name` for all twelve declarations also elaborated successfully. Each type was compared with the README. In particular the local-field characteristic and residue-characteristic binders, finite coefficient fields, smoothness/finite generation, and uniform semisimple-quotient bound survive. The Banach theorem retains CompleteSpace E, hF, hϖ, hB, openness, boundedness, joint continuity, the equality fixing S = ϖΘ, admissibility and finite presentation. No binder was lost; no change was made.

Every one of the seven sorry bodies was probed on another copy with goal-closing alternatives `rfl`, `infer_instance` and `simp`. None closed. Six ended with no simplification progress; the Banach existential retained unsolved goals. Exact-library candidates were compared at the pin: finite-length/Noetherian/Artinian equivalence and semisimple finite-module criteria require additional hypotheses and do not prove these headlines. The algebraic finite-presentation hits are about modules or algebras over a fixed ring, not the smooth compact-induction presentation predicate. No padding or absent statable headline was found.

### Library and ownership audit

The following are pinned files actually opened. Paths here are relative to the Mathlib or Tau Ceti repository, respectively. These checks also cover the external library names that `roadmaps resolve` explicitly says it did not check.

| File and line | Verified declaration or boundary |
| --- | --- |
| `Mathlib/RepresentationTheory/Basic.lean:48`, :142, :670; `Stabilizer.lean:27` | Representation, group-algebra module, inverse-action dual and vector stabiliser. None includes smoothness. |
| `Mathlib/RepresentationTheory/Induced.lean:59`, :77 | IndV and ind; compact induction comparison is supplied by the smooth-representation roadmap, not claimed as a native topological theorem. |
| `Mathlib/RepresentationTheory/Intertwining.lean:36`, :138; `Subrepresentation.lean:54`, :114; `Rep/Basic.lean:30` | Equivariant maps, kernels, subrepresentation action, quotient and bundled representation carrier. |
| `Mathlib/RepresentationTheory/Continuous/Basic.lean:55`, :81, :541, :558 | Continuous linear operators and intertwining maps; coindV covariance f(φ(b)g) = σ(b)f(g); right translation. Joint group-variable continuity is not part of ContRepresentation and is explicitly added. |
| `Mathlib/NumberTheory/LocalField/Basic.lean:46`; `Mathlib/Topology/Algebra/Module/ModuleTopology.lean:133` | Valuation-compatible locally compact nontrivial field; canonical module topology. CharZero is separate and retained. |
| `Mathlib/Algebra/Group/Subgroup/Basic.lean:634`; `Mathlib/Topology/Algebra/OpenSubgroup.lean:49`; `Mathlib/Topology/Algebra/Group/Quotient.lean` | Normal closure, open subgroup and quotient topology; irreducibility of ϖ excludes the scalar-zero junk case in the headlines. |
| `Mathlib/RingTheory/FiniteLength.lean:33`, :76, :92; `Length.lean:31`; `HopkinsLevitzki.lean:105` | Native finite length and ℕ∞ length, Noetherian/Artinian and semisimple criteria. No smooth-GL₂ finiteness headline is already proved there. |
| `Mathlib/RingTheory/SimpleModule/Basic.lean:66`; `Finiteness/Defs.lean:121`; `Mathlib/Algebra/Module/Torsion/Basic.lean:218`; `Mathlib/LinearAlgebra/Dual/Defs.lean:61`; `Span/Defs.lean:46` | Semisimplicity, Module.Finite, torsion, linear dual and span support the five simple native definitions. |
| `Mathlib/RingTheory/KrullDimension/Polynomial.lean:120`; `Regular/RegularSequence.lean:147` | Polynomial dimension and regular sequences; IsRegular includes nonzero final quotient. These are imported, not re-owned. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`, :161, :252; `Module.lean:99`, :112, :134, :143, :322 | Completed algebra, projections, group-element map, level action and its compatibilities; compact-module assembly requires compactness. The discrete noncompact assembly in §0.2 is additional work. |
| `TauCeti/Algebra/Module/ProjectiveCover/Existence.lean:195` | Projective covers over an algebra finite over an Artinian base, with scalar tower; does not supply the pseudocompact category. |
| `TauCeti/Algebra/Module/Projective/Lift.lean:89`; `Projective/Reduction.lean:73` | Complete endomorphism-ring lifting and radical-quotient uniqueness with projectivity/coatomic hypotheses. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced/Acyclic.lean:328` | Positive-degree coinduced acyclicity in the compact smooth-discrete setting used for N₀. |

Object searches used both pinned trees and `roadmaps grep`/`roadmaps show`, not just package declaration names: smoothness, compact and continuous induction, torsion admissibility, finite presentation/cosocles, augmented Iwasawa algebras, ordinary parts, GK dimension, Diamond modules, projective truncations, Bockstein maps and Brauer reciprocity. Near-match results were inspected as leads. Generic algebraic geometry smoothness and Bockstein-complex constructions have different carriers; they are not ownership of this local representation theory. No retained fully qualified name duplicates a readable sibling declaration.

The board package index and open-head list were read. The overlap report has no conflicting head, dropped cited id, revision-only id or unmapped dropped id. The package preserves its former MP identifier mapping. Scope comparisons at the closest heads give:

- PR #1688, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:623`, :958 and :1918: owns the general smooth category, contragredient and induction, which this package imports.
- PR #1312, `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:821`, :853 and :904: owns the ℚ_p classification and the specified general-F obstructions. R02–R03 identify the two places where this package overreads it.
- PR #1775, `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:718`: owns generic Brauer reciprocity. This package's §5.4 is explicitly the GL₂ application of the earlier projective pairing and pinned lifts; it does not take that generic ownership or add an upward dependency.
- PR #1745, `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:12`: imports this package's weights, Diamond modules, local GK bound and lattice. Its global patched-cohomology statements are different targets.
- PR #1757, `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:11`, :93: imports the MP finiteness calculus. Its Scholze functor and tower cohomology are different constructions.
- PR #1270, `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:235`: supplies ordinary parts for ℚ_p. The package states its broader F/ℚ_p extension and compatibility, rather than replanning the ℚ_p functor.

### Supplier resolution and order

Every supplier citation was resolved at main or its supplied open head. Apart from R03's stronger unsupported assertion, the consumed objects occur in the cited sections. Repository lines below identify the openings of the relevant contracts; the actual clauses, not only the headings, were read.

| Supplier | Sections resolved and file evidence |
| --- | --- |
| SmoothRepresentationsOfLocalGroups, PR #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:623`, :669, :704, :767, :871, :906, :958, :986, :1007: SR.0.1–0.4; :1675 SR.0d.1; :1918 onward SR.2.1. |
| PadicLocalLanglandsForGL2Qp, PR #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:206`, :270: §§0.1,0.3; :649 onward §§2.1–2.3; :821, :853, :904: §§2.6,2.7,2.9; :1691, :1752: §§5.1,5.3. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, PR #879 | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:8196`: R07.5.15, absolute Serre weights, compact induction and Hecke algebra, including the general-F extension. |
| PotentialAutomorphyInfrastructure, PR #1081 | `TauCetiRoadmap/PotentialAutomorphyInfrastructure/README.md:1272`, :1324: §§3.7,3.12, positive transfer/localisation and its derived comparison. |
| CompletedCohomologyAndLocalGlobalCompatibility, PR #1270 | `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:235`: §0.1, bounded ℚ_p torsion category and opposite-Borel adjunction. |
| NoncommutativeAndEquivariantIwasawa, PR #1307 | `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:211`, :273, :333, :378, :435, :458, :483, :570: §§0.3,0.5,0.7–0.8,F.1,0.10–0.11,0.13. Finite-index freeness, filtered hypotheses, grade/dimension and uniform-group cohomology are retained. |
| CompletedCohomologyPartII, PR #1035 | `TauCetiRoadmap/CompletedCohomologyPartII/README.md:186`, :1402: F.1 and §5.8; Banach lattices and nonzero-module growth with uniform dimension d > 0. |
| DeformationAndDerivedPatchingAlgebra, PR #1034 | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:629`: §3.4, regular sequences with nonzero quotient and the specified local hypotheses. |
| GL2AutomorphicRepresentationsAndTransfer, PR #931 | `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2928`: R17.5.11, Brauer character recognition and projective pairing. |
| ClassFieldTheory, main | `TauCetiRoadmap/ClassFieldTheory/README.md:1204`: Layer 7, geometric Artin normalisation, units/inertia and norm compatibility. The niveau-two character uses the extension field's Artin map. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1310`: §0.17, depth and Cohen–Macaulay inputs. |
| RepresentationTheory/QuiverRepresentations, main | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:507`: Layer 3, finite-dimensional algebra covers/envelopes and their imported structure. |

The required mechanical check returned:

```text
depcheck: 237 roadmaps, 2151 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. `roadmaps resolve` found no unresolved cross-roadmap citation or package-owned Lean name. The stronger mathematical content of citations was checked independently; this is why R03 remains a finding despite successful name resolution.

Both supplier gaps have identical slugs, named earlier suppliers and matching needs in `packages/ModpRepresentationsOfGL2OverLocalFields/design/plan.json` and the README:

- `ext1-finite-length-into-compact-induction`: PadicLocalLanglandsForGL2Qp §2.7; finite-dimensional Ext¹ for finite-length G′ representations into I(σ), including p = 2,3. DEG's p ≥ 5 result does not meet the full contract.
- `barthel-livne-finite-codimension`: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15; finite codimension of I₁-invariants of a nonzero subrepresentation of I(σ). The polynomial Hecke algebra and freeness alone do not state it.

These precise single-conclusion contracts are not unowned prerequisites. No gap has supplier none, and neither asks to duplicate an already supplied result. The findings do not require changing them.

## Not verifiable

- SERRE-LRFG, Part III, Chapters 14–15: settled as uncertified; no legal readable text was supplied for direct comparison. The GL₂ projective-lift application was checked against the readable local source and imported pairing. This work was not requested again.
- BARTHEL-LIVNE94, Proposition 18 and the classification locators: settled as waived; no direct-text verification is claimed. The finite-codimension dependency remains the declared supplier contract. This work was not requested again.

All fifteen seeded targets had readable cached primary text for the locators tabulated above. LE19 was obtained, so no unresolved source request remains. The stronger infinite-length statement in R03 was not established by its cited texts; this is reported as a repair, not silently certified. Lean elaboration and signature checks were available and completed; their success is not a mathematical proof of the sorry statements.

## Source issues

- **Error** in BP12 at Proposition 13.1 proof, printed p. 76 (line 3058): the source says the injective-envelope projection idempotent is unique; it should choose compatible summand projections, since off-diagonal maps give different idempotents with the same image; affects the proof.
- **Error** in VIGNERAS11 at Propositions 9–10, printed p. 22 (lines 827–836): the source says every generating module gives an obstruction containing its invariants and nonzero; it should impose the admissible hypotheses, since the identity compact-induction presentation has zero obstruction; affects a stated result.
- **Misprint** in HU12 at Proposition 4.4 proof, printed p. 36 (line 1980): the source says the positive-cell space intersects itself in finite dimension; it should intersect the positive and negative cell spaces, as in the next line; affects the proof.
- **Error** in LMS22 at Proposition 3.3(2), printed pp. 7–8 (lines 318–328): the source says translated tensor summands are always the indicated projective covers; it should use translated R-modules, identifying covers only outside the character exception; affects a stated result; corrected in print at LMS22-CORR, item (2), p. 1.
- **Error** in BHHMS23 at Lemma 6.1.1(i), printed p. 56 (lines 2882–2901): the source says noncentral characters in the third truncation have multiplicity at most one for p > 3; it should exclude p = 5, f = 1, where α² = α⁻² occurs twice; affects a stated result.
- **Misprint** in BHHMS23 at Corollary 7.3.4 proof, printed p. 84 (lines 4206–4208): the source says K₁/Z₁ in three projective-cover subscripts; it should say K/Z₁, consistently with the corollary and the constructed surjection; affects the proof.

For the idempotent issue, if 0 ≠ f:I_T→I_S kills the socle, the matrices ((1,0),(0,0)) and ((1,f),(0,0)) both square to themselves and have image I_S, but differ. For the p = 5 issue, α has order 4, so the two independent degree-two root monomials have the same nontrivial character α². These are source errors already avoided by the package, not additional package findings.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7b2eb7a62b2c8cf9ebf964e00bf1de434ec09437", "job": "REV-PKG-ModpRepresentationsOfGL2OverLocalFields~5", "model": "gpt-6-astra", "worker": "chris-10"} -->
