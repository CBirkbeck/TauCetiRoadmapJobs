# Review of StableHomotopyKTheory (pull request #3027 at 45a4865)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 24 changed lines since `74a09b7`. It checked the new §4.24a (Arlettaz's bound on the kernel of the Hurewicz map of K-theory), the two changed sentences (Layer 4 Dependencies, the AlgebraicKTheory contract) and the two new references; the integers Lₖ and Rⱼ, the three clauses and route steps (i)–(iv) were recomputed and hold, and step (iii), left as a question by the earlier review, is settled (the universal-coefficient sequence splits, so the bound is Rₘ). Accepted, with four small corrections (the `*Needs:*` line of §4.24a omits what its route uses, a missing locator, a scope sentence that does not account for §4.24a, and one in untouched text) and no format notes; none blocks. For the human reviewers: the decision on published theorems was applied, and Arlettaz's survey could not be read.

## C01 — The `*Needs:*` line of §4.24a omits what steps (i)–(iii) of its route use

An implementer who follows the route (README line 1743) meets two inputs the `*Needs:*` line (line 1747) does not name. Step (ii) runs "the Serre exact sequences of the Postnikov fibrations": that is DGFloer Layer 1 item 2, which eleven other `*Needs:*` lines of this README name and this one does not. Step (i), that Lᵢ₋ₙ kills Hᵢ(K(G,n);ℤ) for every abelian group G and 2≤n<i<2n, is the heaviest input of the section and is stated by no roadmap: a search of the roadmaps on main and of the open ones for the integral or stable homology of Eilenberg–Mac Lane spaces finds only §3.35 here (membership in a Serre class, no exponent) and TangentialBordism §4.4 (B4.7), Cartan's computation of `H*(K(ℤ/p,n);𝔽_p)`. The text says (i) is "cited from the published proof", which leaves open whether it is proved here.

The smallest change: say that step (i) is proved in this section, and add to the `*Needs:*` line DGFloer Layer 1 item 2 (the Serre exact sequence) and, if the mod-p computation is the intended starting point for (i), TangentialBordism B4.7. Both roadmaps are already suppliers of this one, so no supplier is added.

## C02 — The comparison §4.24a asks to prove first has no locator

The paragraph beginning "Prove first" (line 1741) states that Segal's zeroth space Ω|BA_C(1)| for finite projective modules is K₀(R)×BGL(R)⁺, so that BGL(R)⁺ is an infinite loop space, and cites only internal sections. Weibel, *The K-book*, Chapter IV, states it as Remark 4.11.2, p. IV.45 (WeibelKbookIV line 2118), resting on Corollary 4.11.1 (line 2115) and on the uniqueness of group completions when π₀ is countable or has a countable cofinal submonoid, Theorem 4.4.3, p. IV.39 (line 1866). Adding "(W IV Remark 4.11.2, p. IV.45, with Thm. 4.4.3, p. IV.39)" at the end of that paragraph would do.

## C03 — The scope section does not account for §4.24a

Line 2802 gives the "ring-specific comparisons" to GeneralAlgebraicKTheory, and the list of local foundations (line 2806) names for Layer 4 only the stable-linear and cofinality adapters and the function-ring model. §4.24a now states here a ring-specific comparison (Segal's zeroth space against K₀(R)×BGL(R)⁺) and the Hurewicz bound that BernoulliBoundsForClassGroupEigenspaces 9.8 (a) consumes, so a reader who uses the scope section to find their owner is sent elsewhere. Adding "the Segal-machine comparison for finite projective modules and the bounded exponent of the Hurewicz kernel (§4.24a)" to the Layer 4 clause of line 2806 would fix it.

## C04 — Untouched text: README, Downstream consumers (line 2786) and Scope and ownership (line 2804) name a roadmap that does not exist

These lines name a roadmap HomotopyTheoryOfCategories, with its "Layer 4" and "§§2.3–2.4". No roadmap of that name is on main, in an open roadmap pull request or in the merge order (the name occurs only in this README), so neither citation can be followed. For a separate pull request: replace the name with the roadmap that states Theorem A for basic localizers.

## Previous findings

The earlier review (at f3b4ab1) had no finding. The folder is unchanged since that head, so its three small corrections stand and are C02, C03 and C04 above. Its question on step (iii) is answered: for Y an r-fold delooping of BGL(R)⁺ the k-invariant lies in `H^{m+r+1}(Y[m+r−1]; πₘ) ≅ Hom(H_{m+r+1}, πₘ) ⊕ Ext(H_{m+r}, πₘ)`, a split sum, and step (ii) kills the two homology groups by Rₘ and Rₘ₋₁; so the group is killed by lcm(Rₘ, Rₘ₋₁) = Rₘ, with no extra factor at m = 6.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §4.24a, Lₖ | k = 1,…,14; p = 2,…,13, enumerated | 1, 2, 2, 6, 6, 2, 2, 30, 30, 2, 2, 42, 42, 2; p = 3, k = 6: a₁ = 4 allows only sums 4, 5 | agrees with the text's L₂…L₈ |
| §4.24a, Rⱼ | j = 2,…,14 | 2, 4, 24, 144, 288, 576, 17280, …; primes of Rⱼ equal the primes ≤ j/2+1 for every j ≤ 14 | agrees |
| Lₖ for arbitrary G | G = ℤ/3, degrees 4, 5 | stable groups: `H₄(Hℤ)⊗G` and `Tor(H₄(Hℤ),G)`; 3 divides L₄ and L₅, not L₆, L₇ | the "0 or 1" clause is the Tor term |
| Clause 1, m = 1 | any ring; zero ring | K₁ = GL/E = GL/[GL,GL] = H₁(GL); for R = 0 both sides 0 | isomorphism, as stated |
| Clause 1, m ≥ 2 | Y with b = r+1, t = m+r−1, i = m+r+1 | (ii) gives LₘLₘ₋₁⋯L₂ = Rₘ on H_{m+r+1}(Y[m+r−1]); then (iii), (iv) | holds |
| Clause 2, E(R) | BE⁺ is 1-connected, b = r+2; m = 2 | bound Rₘ₋₁; at m = 2 it is R₁ = 1, the Hurewicz isomorphism | holds |
| Clause 3, St(R) | BSt⁺ is 2-connected, b = r+3; m = 3 | bound Rₘ₋₂; πₘ(BSt⁺) = Kₘ for m ≥ 3 since πₘ(BK₂) = 0 for m ≥ 2; at m = 3, R₁ = 1 | holds |
| Step (i) | n = 3, i = 5; n = 2, i = 4 | H₅(K(A,3)) = A/2A, killed by L₂ = 2; H₄(K(ℤ/2,2)) = ℤ/4 lies outside i < 2n | holds; range needed |
| Step (i) against Cartan | exposé 11, Théorème 2 | p-part of the stable group is a sum of Π/pΠ and p-torsion of Π over words with a₁ ≡ 0 mod 2p−2 (CartanSem1954exp11 line 395) | exponent p; supports (i) |
| Step (ii) | induction on t over K(πₜ,t) → Y → Y[t−1] | middle term killed by Lᵢ₋ₜ times Lᵢ₋ᵦ⋯Lᵢ₋ₜ₊₁; needs i < 2b ≤ b+t | holds |
| Step (iii) | i = m+r+1 and m+r | Hom part killed by Rₘ, Ext part by Rₘ₋₁, sum split | Rₘ·k = 0 |
| Step (iv) | K(π,m) → X[m] → X[m−1], both directions | transgression sends id to k; ρk = 0 ⟺ ρ·id extends to H^m(X[m];π) ⟺ θ∘h = ρ; Ext(H_{m−1}(K(π,m)),π) = 0 | iff holds |
| "p divides Rⱼ exactly when p ≤ j/2+1" | independent quotation | Banaszak, arXiv:1208.2137, proof of Thm. 4.8 (line 947): from Arlettaz Cor. 7.19, h₂ₙ injective mod ℓ for ℓ > n+1 | agrees (j = 2n) |
| "Prove first" comparison | π₀ uncountable (large Picard group) | classes of Rⁿ are countable and cofinal, as Thm. 4.4.3 requires; W IV Rem. 4.11.2 states the result | holds; C02 |
| AlgebraicKTheory 5.1 contract | README on main, line 487 | St(R) → GL(R) with image E(R), central kernel, universal, for every ring | as cited |
| Sample 3.20 (cited by §4.24a) | H AT Thm. 4.69, p. 412 | principal Postnikov tower ⟺ π₁ acts trivially on higher πₙ (HatcherAT line 17826) | locator correct |
| Sample 4.24a | Arlettaz, Publ. Mat. 44, Cor. 7.19 | text unreadable; clauses recomputed above and matched to Banaszak's quotation | not verified at the locator |

- Source locators checked against the text: 6 (W IV Thm. 4.4.3, Cor. 4.11.1, Rem. 4.11.2; H AT Thm. 4.69; Cartan, exposé 11, Théorème 2; Banaszak's quotation of Arlettaz Cor. 7.19).
- Cross-roadmap citations resolved: 5. On main: AlgebraicKTheory 5.1 (line 487), AlgebraicTopology 8.3 (line 3032), GeneralizedCohomology G2.8 (line 842, group completion for Γ-spaces). In this pull request: the consumer BernoulliBoundsForClassGroupEigenspaces 9.8 (a) and its contract (line 1216), which restate §4.24a's Rⱼ and first clause correctly.
- Internal citations resolved: 12 (§§1.32, 3.12, 3.20, 3.31, 3.33, 3.36, 4.9, 4.14, 4.15, 4.17, 4.21, 4.24).
- Automatic checks: all passed. Dependency check output: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` is unchanged by the pull request and elaborates at the pins with 11 `sorry` warnings and nothing else. §4.24a is not among the overview's headline theorems, so no declaration is owed.
- Record: no layer or item of the README at `74a09b7` is removed, renumbered or retitled; the id 4.24a is new. The pull request's description names §4.24a and its consumer correctly; nothing to correct there.
- Overlap check: read GeneralizedCohomology, GeneralAlgebraicKTheory, AlgebraicTopology; the Γ-space group completion is GeneralizedCohomology G2.8's and the Hurewicz map AlgebraicTopology 8.3's, both cited; the Hurewicz-kernel bound is stated nowhere else (BernoulliBoundsForClassGroupEigenspaces 9.8 (a) cites it); the Segal-machine identification of K₀(R)×BGL(R)⁺ is owned here, GeneralAlgebraicKTheory being a later consumer with other deloopings.
- Source independence: changed passages only; 5 passages compared with 4 sources (WeibelKbookIV, HatcherAT, CartanSem1954exp11, Banaszak arXiv:1208.2137), none shared beyond forced formulas; Arlettaz 2000, the source of the changed text, could not be read; largest share W IV, opening 70 of 195 locator lines; contents not compared, since no layer is added, removed or reordered.
- Research link: §4.24a is Arlettaz's bound (1991; survey 2000) on the kernel of Kₘ(R) → Hₘ(GL(R);ℤ), which BernoulliBoundsForClassGroupEigenspaces 9.8 uses with group-homology bounds for torsion in Kₘ(𝒪_L) and Banaszak (2012) uses for wild kernels; the roadmap is the homotopy foundation of Quillen–Waldhausen K-theory. Rests on the README and Banaszak's text.

## Not verifiable

- D. Arlettaz, *Algebraic K-theory of rings from a topological viewpoint*, Publ. Mat. 44 (2000), Definitions 7.11 and 7.14, Lemmas 7.4 and 7.12, Proposition 7.10, Corollaries 7.13, 7.16 and 7.19, Theorems 7.15 and 7.17, pp. 52–55: the DOI resolves to the journal's own page, a host the sources service does not classify, and no other legal copy was found. The statements were checked by computation and against Banaszak's quotation of Corollary 7.19.
- D. Arlettaz, *The Hurewicz homomorphism in algebraic K-theory*, J. Pure Appl. Algebra 71 (1991): paywalled, not read.
- Sample targets 1.3, 1.6, 1.7, 1.9, 2.9, 2.10, 2.28, 2.33, 3.13, 4.24, 4.26, 5.7 and 7.14 lie in text the change neither touches nor affects; this review of the change did not check their locators.

## Source issues

- none

## For the human reviewers

- Decision applied: published theorems of the family live in the general roadmaps. §4.24a states in full the Hurewicz bound that BernoulliBoundsForClassGroupEigenspaces 9.8 (a) now cites; nothing leaves this roadmap.
- Not tested: Arlettaz, Publ. Mat. 44 (2000), the source of §4.24a's statements and route, could not be read (the journal's host is unclassified). Its wording and the numbering of the cited items were not compared.
