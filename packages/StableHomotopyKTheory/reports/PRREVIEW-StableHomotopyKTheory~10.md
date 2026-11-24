# Review of StableHomotopyKTheory (pull request #3027 at f3b4ab1)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 24 changed lines since `74a09b7`. It checked the new §4.24a (Arlettaz's bound on the kernel of the Hurewicz map of K-theory), the Dependencies and AlgebraicKTheory contract sentences and the two references against the cited sections here and on main; the integers Lₖ and Rⱼ, the three clauses and route steps (i), (ii) and (iv) were recomputed and hold. Accepted, with three small corrections (a missing locator, a scope sentence that does not account for §4.24a, and one in untouched text), no format notes, and one question on route step (iii). For the human reviewers: the decision on published theorems was applied, and Arlettaz's survey could not be read.

## C01 — The comparison §4.24a asks to prove first has no locator

The paragraph that opens with "Prove first" (README line 1741) says that Segal's zeroth space Ω|BA_C(1)| for finite projective modules is K₀(R)×BGL(R)⁺, so that BGL(R)⁺ is an infinite loop space. It cites only internal sections, so an implementer cannot find the published form of the step. Weibel, *The K-book*, Chapter IV, states it as Remark 4.11.2, p. IV.45 (WeibelKbookIV line 2118). The group completion produced by an infinite loop space machine is 4.5.2, p. IV.40. Uniqueness of group completions when π₀ has a countable cofinal submonoid is Theorem 4.4.3, p. IV.39 (line 1866). The fix is to add "(W IV Remark 4.11.2, p. IV.45, with 4.5.2 and Thm. 4.4.3, p. IV.39)" at the end of that paragraph.

## C02 — The scope section does not account for §4.24a

Line 2802 gives GeneralAlgebraicKTheory the "ring-specific comparisons". The list of local foundations at line 2806 names, for Layer 4, only the stable-linear and cofinality adapters and the function-ring model. §4.24a now states two things here: a ring-specific comparison (Segal's zeroth space against K₀(R)×BGL(R)⁺) and the Hurewicz bound that BernoulliBoundsForClassGroupEigenspaces 9.8 (a) consumes. A reader who uses the scope section to find them is sent to the wrong roadmap. Adding "the Segal-machine comparison for finite projective modules and the bounded exponent of the Hurewicz kernel (§4.24a)" to the Layer 4 clause of line 2806 would fix this. Line 2802 could say "the Q-construction comparisons for rings".

## C03 — Untouched text: README, Downstream consumers (line 2786) and Scope and ownership (line 2804) name a roadmap that does not exist

These lines name a roadmap HomotopyTheoryOfCategories, with its "Layer 4" and "§§2.3–2.4". No roadmap of that name is on main, in an open roadmap pull request or in the merge order, so neither citation can be followed. In a separate pull request, replace the name with the roadmap that states Theorem A for basic localizers.

## Questions for the author

- Step (iii) says Rₘ·kᵐ⁺¹(BGL(R)⁺)=0. Does Arlettaz's Theorem 7.17 (a) give Rₘ as a bound on the order of the k-invariant of every connected infinite loop space? Filter the stable k-invariant of a spectrum with homotopy in degrees 1,…,m−1 by universal coefficients, with one factor lcm(L_d, L_{d−1}) per degree d = 2,…,m. This gives exactly Rₘ for m ≤ 5, but 864 = 3·R₆ at m = 6, because d = 4, 5, 6 each contribute 6. The three clauses do not depend on this: the kernel of h is the image of the transgression from H_{m+r+1}(Y[m+r−1]), which (ii) shows is killed by Rₘ. I could not settle it because the survey could not be read.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §4.24a, Lₖ | k = 1,…,10; p = 2, 3, 5, 7 | L₂…L₈ = 2,2,6,6,2,2,30; L₉ = 30, L₁₀ = 2; p = 3, k = 6, 7: a₁ = 4 gives only sums 4, 5 | agrees |
| Lₖ against the stable homology | mod-3 homology of HF₃, counted with the Bockstein | integral ℤ/3 in degrees 4, 5, 8, 9, none in 6, 7, 10: the same pattern as 3∣Lₖ | agrees |
| §4.24a, Rⱼ | j = 2,…,8; the prime criterion | 2, 4, 24, 144, 288, 576, 17280 = 2⁷·3³·5; p first divides L_{2p−2}, so p∣Rⱼ ⟺ p ≤ j/2+1; R₃ lacks 3, R₇ lacks 5 | agrees |
| Clause 1, m = 1 | any ring | K₁ = GL/E; H₁(GL) = GL/[GL,GL] = GL/E (Whitehead) | an isomorphism, as stated |
| Clause 1, m = 2 | commutative R; the zero ring | kernel = image of d₃: H₃(K₁) → K₂; the determinant splitting makes it 0; K_*(0) = 0 | consistent with R₂ = 2 |
| Clause 1, general m | BGL(R)⁺ = Ω^rY, b = r+1, t = m+r−1 | ker h_m ⊆ image of H_{m+r+1}(Y[m+r−1]) → π, killed by L_m⋯L₂ = R_m by (ii) | holds |
| Clause 2, E(R) | b = r+2; m = 2, 3 | bound R_{m−1}; m = 2: Hurewicz isomorphism (R₁ = 1); m = 3: image of Γ(K₂), stably through K₂/2, killed by 2 | holds |
| Clause 3, St(R) | b = r+3; m = 3, 4 | bound R_{m−2}; m = 3: BSt⁺ is 2-connected, isomorphism; m = 4: image of H₅(K(K₃,3)) = K₃/2, killed by 2 | holds |
| Reading Kₘ through §3.31 and §3.33 | G = GL, P = H = E; A = K₂, E = St | the simply connected cover is BE⁺; π_m(BK₂) = 0 for m ≥ 2, so π_m(BSt⁺) ≅ K_m for m ≥ 3; π₂(BSt⁺) = 0 | holds |
| The "Prove first" comparison | R with uncountable Pic (affine elliptic curve over ℂ) | π₀ is uncountable, so the cofinal {[Rⁿ]} clause is needed and is supplied; Weibel IV Rem. 4.11.2 states the result | holds; C01 |
| Step (i) | n = 3, i = 5; n = 2, i = 4 | H₅(K(A,3)) = A/2A, killed by L₂ = 2; H₄(K(ℤ/2,2)) = Γ(ℤ/2) = ℤ/4, excluded by i < 2n | holds; the range is sharp |
| Step (ii) | Y = K(G,b) × K(G′,t) | cross terms start in degree b+t ≥ 2b > i; H_i is killed by lcm(L_{i−b}, L_{i−t}), which divides the product | holds |
| Step (iii) | m = 2,…,6, filtration by universal coefficients | 2, 4, 24, 144 equal R₂…R₅; the coarse bound at m = 6 is 864 = 3·R₆ | m ≤ 5 agrees; question |
| Step (iv) | K(π,m) → X[m] → X[m−1], principal | low-degree Serre sequence: ρk = 0 ⟺ ρι extends over X[m] ⟺ some θ has θh = ρ | holds |
| AlgebraicKTheory 5.1 contract | main, README line 487 | St(R) → GL(R) with image E(R), central kernel, universal for every ring, the zero ring included | as cited |
| Sample 1.32 (cited by §4.24a) | W IV App. 3.4.2 and (3.5), p. IV.28 | H_*(BG;M) = H_*(G;M) (WeibelKbookIV line 1251) | locator correct |
| Sample 3.20 (cited by §4.24a) | H AT Thm. 4.69, p. 412 | principal Postnikov tower ⟺ π₁ acts trivially on higher π (HatcherAT line 17826) | locator correct |
| Sample 4.21 (cited by §4.24a) | W IV Cor. 4.11.1, p. IV.45 | B(S⁻¹S) ≃ K₀(R)×BGL(R)⁺ for S = iso P(R) (WeibelKbookIV line 2115) | locator correct |

- Source locators checked against the text: 6. W IV App. 3.4.2, Thm. 4.4.3, 4.5.2, Cor. 4.11.1 and Rem. 4.11.2. H AT Thm. 4.69. Cartan, Séminaire H. Cartan 1954/55, exposé 11, Théorème 2 (CartanSem1954exp11 line 395: the p-primary part of the stable groups has exponent p).
- Cross-roadmap citations resolved: 5. On main: AlgebraicKTheory 5.1, AlgebraicTopology 8.3 and GeneralizedCohomology G2.8 (its API: the zeroth space of a special Γ-space is a group completion). At their heads: the consumer BernoulliBoundsForClassGroupEigenspaces 9.8 (a) and ArithmeticKTheoryPartII 8.3, which agrees that the first p-torsion appears in degree 2p−2.
- Internal citations resolved: 12, namely §§1.32, 3.12, 3.20, 3.31, 3.33, 3.36, 4.9, 4.14, 4.15, 4.17, 4.21 and 4.24.
- Automatic checks: all passed. Dependency check: "depcheck: 132 roadmaps, 1468 edges, 0 problem(s)". No UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` is unchanged by the pull request. It elaborates at the pins with 11 `sorry` warnings and no other message. §4.24a is not among the overview's headline theorems, so nothing is owed there.
- Record: no layer or item of the README at `74a09b7` is removed, renumbered or retitled. The new id 4.24a is fresh.
- Overlap check: I read GeneralizedCohomology, GeneralAlgebraicKTheory and AlgebraicTopology on main, and searched the open revisions for the Hurewicz kernel and for the infinite-loop comparison. Objects shared with §4.24a:
  - the Γ-space group completion: owned by GeneralizedCohomology G2.8, cited;
  - the Hurewicz map: owned by AlgebraicTopology 8.3, cited;
  - K(R) ≃ K₀(R)×BGL(R)⁺: GeneralAlgebraicKTheory §3.15 states it with the Q- and S-deloopings, a different model. GeneralAlgebraicKTheory is a later consumer, so the Segal-machine comparison is owned here.

  ArithmeticKTheoryPartII 8.3 (open) makes a different, p-local statement.
- Source independence: changed passages only. I compared 5 passages with 2 sources (WeibelKbookIV, CartanSem1954exp11), and nothing is shared beyond formulas the mathematics forces. Arlettaz 2000, the main source of the changed text, could not be read. The largest share of the README's locators is W IV, with 115 of 282 mentions counted by source abbreviation. The arrangement was not compared, because no layer is added, removed or reordered.
- Research link: §4.24a is Arlettaz's bound (1991; survey 2000) on the kernel of Kₘ(R) → Hₘ(GL(R);ℤ). BernoulliBoundsForClassGroupEigenspaces 9.8 combines it with group-homology bounds for the torsion of Kₘ(𝒪_L), alongside Soulé (1999). The roadmap is the homotopy foundation of Quillen–Waldhausen K-theory and ends with Burklund's Eₙ Moore spectra. This rests on the README.

## Not verifiable

- D. Arlettaz, *Algebraic K-theory of rings from a topological viewpoint*, Publ. Mat. 44 (2000): Definitions 7.11 and 7.14, Lemma 7.4, Proposition 7.10, Lemma 7.12, Corollary 7.13, Theorem 7.15, Corollary 7.16, Theorem 7.17 (a) and Corollary 7.19, pp. 52–55. The DOI resolves to the journal's page at mat.uab.cat. Neither that host nor the UAB repository (ddd.uab.cat) is classified by the sources service, and EuDML refused the connection because its certificate had expired. The statements were checked by computation instead (table above).
- D. Arlettaz, *The Hurewicz homomorphism in algebraic K-theory*, J. Pure Appl. Algebra 71 (1991): paywalled, not read.
- Sample targets 1.8, 1.20, 2.3, 2.33, 3.1, 3.3, 5.14, 7.5, 7.10, 7.16, 7.19 and 7.25 lie in text the change neither touches nor affects, so this review of the change did not check them.

## Source issues

- none

## For the human reviewers

- Decision applied: published theorems of the family live in the general roadmaps. §4.24a states in full the Hurewicz bound that BernoulliBoundsForClassGroupEigenspaces 9.8 (a) now cites, and nothing leaves this roadmap.
- Not tested: Arlettaz, Publ. Mat. 44 (2000), the source of §4.24a's statements and route, could not be read (hosts mat.uab.cat and ddd.uab.cat unclassified, EuDML certificate expired). Its wording and the attribution of steps (ii)–(iv) were not compared.
