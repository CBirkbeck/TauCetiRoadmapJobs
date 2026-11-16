# Review of RealSurfacePeriodIndex (pull request #2462 at 3acc88c)

**Verdict:** accepted

No findings.

## Previous findings

The previous review (of this same head) raised none. Of the earlier findings it accounted for:

- R01 — not repaired: deferred (D01)
- R02 — repaired: line 105 reads "a closed subset A ⊂ M with a Whitney stratification each of whose strata is σ_M-invariant, such that f is proper on A and restricts to a submersion on every stratum".
- R03 — repaired: the description reads "The README also consumes EnriquesSurfaces §§1.1, 1.3 and 1.4 (…), an open pull request by another author (#1286), which must merge first as well".
- R04 — repaired: line 2780 reads "Layer 0 is general real-function-field theory (…) for any roadmap on quadratic forms over function fields." and names no importer.

## Deferred findings

- D01 — stands

## Verified sound

| Target | Instance | Computed: hypotheses or left side | Computed: conclusion or right side | Result |
|---|---|---|---|---|
| §0.4 signature at an ordering | ⟨1, −t⟩ over ℝ(t); ⟨√2⟩ over ℚ(√2) at √2 < 0 | t > 0: 1 − 1 = 0; t < 0: 1 + 1 = 2; −1 | constant on H(t) and on H(−t), not on X_F; EKM Theorem 33.3 (line 7241) | holds |
| §0.6a Pfister's local–global principle | q = ⟨1, −(1+t²)⟩ over ℝ(t); ⟨1, −t⟩; ⟨1⟩ over 𝔽₃ | sign_P(q) = 0 at every P; n⟨1, −t⟩ has signature 2n at t < 0 | 2q hyperbolic since ⟨1,1⟩ ≅ ⟨1+t², 1+t²⟩: order 2; infinite order; order 4 | holds; EKM line 6811 |
| §1.5 extension of algebraically closed fields | ℚ̄ ⊂ ℂ, (x, y); ℝ ⊂ ℂ, ℍ on Spec ℝ | ⟨1, −x, −y, xy⟩ anisotropic over both: ind 2 = 2 | ℍ: ind 2 over ℝ, 1 over ℂ, so k algebraically closed is needed | holds; B19 line 199 gives no proof, as stated |
| §2.7 dense splitting members | α = 0; general α of period n | class of T_b is dn·c₁(H); p_*p*α̃ = dn·α̃ = 0 | every b splits; density as B19 lines 242, 316–328 | holds |
| §2.8 unramified per = ind over ℂ | Enriques class, n = 2; α = 0 with 2T₀ ∈ \|2H\| | gcd(2d, 2d + 2) = 2; one d alone gives ind ∣ 4 | nonreduced member: length 2, component of degree 1, so smoothness is needed | holds |
| §5.8 integral pushforward adjustment | Enriques surface with S(ℝ) = 4 ℝℙ², Θ = N₁ ⊔ N₂ | cl_R(L) = h₁+h₂: c_Ψ = h₁+h₂ = cl_R(L). cl_R(L) = h₁+h₃: c_Ψ = h₁ | first: (c) holds, θ = θ₁+2μ+2L+2ν. Second: coefficient sum 1, not in w₁^⊥ | holds |
| §5.5 and E3 (touches §5.8) | twisted Bockstein on Ψ, [e+ω]₀ = 1+1 = 0 | (a₀, a₁, a₂) ↦ (0, a₁ + a₀∪[e]₁, β(a₁) + a₁∪[e]₁) | a₁ = 0 gives a₀∪[e]₁; B19 line 861 has [e]₁, true only where a₀ = 1 | correction confirmed |
| §6.7 branch section | orders along R of t = −h₁h₂ru | −1 (h₁) + 1 (r) + 0 (u in the (−2R)-twist) = 0; printed choice: 1 + 1 = 2 | rt = −h₁h₂·Σ(ru_i)², negative where h₁h₂ > 0, that is off Ξ | holds; E20 confirmed at B19 lines 1164–1170 |
| §6.8 branch conditions give cover hypotheses | Ξ = S(ℝ); a point with rs < 0 | Ψ = ∅; rs·v² = (sw)² ≥ 0 forces v = w = 0 | (i) holds; kernel of H¹(S(ℝ)) → H¹(Ψ) is H¹(Ξ), spanned by 6.1 (iii) | holds |
| §6.10 vanishing variation | ℙ¹×ℙ¹ → ℙ² branched along a conic | p*h = (1,1), p_*(a,b) = a+b; p_*λ_van = p_*λ − ½·2·p_*λ = 0 | vanishing lattice ℤ(1,−1); det((1,1),(1,−1)) = −2, index 2 | holds |
| §7.2 induction step | n = 2; n = 4 | (n/2)α_T = 0; cor(α_T) = 2α of period n/2 | n = 2: α_T = 0; n = 4: period of α_T is exactly 2 | holds; B19 lines 1293–1300 |
| §7.12 quartic del Pezzo | d = 4; d = 3 | h⁰(−K) = 5, h⁰(−2K) = 1 + 3·4 = 13, h⁰(ℙ⁴, O(2)) = 15 | kernel ≥ 2 quadrics; cubic: 10 = 10, no quadric | holds; VA13 lines 198, 388, 419 |
| §8.2 alternating cover | n = 2; simple branching; m_i even | sign on 𝔖₂ is an isomorphism, m_i = 2 − 1 = 1 | V = S ∖ Δ; fibre of odd size n − m_i has a real point | holds; B19 lines 1403–1419 |
| §8.3 trace-sequence lift | ℙ¹×ℙ¹ over ℝ, α = 0, α̃ = κ(O(1,0)) | η = ζ = 0 gives 0 ≠ (1,0) | η = cl(O(1,0)), ζ = 0 gives α̃ | holds; B19 line 1422 |
| §8.4 sign (touches §8.3) | n = 4, η = 0, ζ = [(1,0,0,0)] | ψ(ζ) = (−3,1,1,1), trace 0; α̃ = −1 = 3 | −ψ(ζ) ≡ (3,3,3,3) = p*α̃; +ψ(ζ) ≡ (1,1,1,1) | E6 confirmed at B19 line 1445 |
| §8.7 correcting bundle | n = 2; m_i = 4; m_i odd | 4 ∤ 1: every Δ_i enters θ; 4 ∣ 4: none | m_i odd: Δ_i(ℝ) ∩ Θ₀ = ∅, so cl_R(Δ_i) restricts to 0 on Θ₀ | holds; B19 line 1626 |
| §9.15 Puiseux counterexample | K = ⋃ ℝ((t^(1/n))), four sphere components | H¹(S(K)) = 0, so every lift has zero first component | ind ∣ 2·per = 4 and ind ≠ 2: 4 ≠ per | holds; B19 lines 106, 1805–1833 |
| §9.10 and E23 | real Enriques surface, one half empty | deg(w₁²) = K_S² mod 2 = 0, also cl_R(K_S) ∈ w₁^⊥ | odd number of odd-χ components never occurs | correction confirmed against B19 lines 79–80, 1786 |
| `HasZeroTotalSignature` | ⟨1,−1⟩, ⟨1,1⟩, ⟨1,0⟩ over ℝ; odd dimension | line x = y: 2·1 = 2; none; radical line: 2·1 = 2 | holds; fails; holds with signature 1 (degenerate, isotropic anyway); 2·dim W odd impossible | agrees with §0.6 |
| `index_eq_orderOf_of_isAlgClosed` | ℂ(x,y): (x,y); M₂ | per 2, norm form anisotropic by Springer twice | ind 2; 1 = 1 | holds |
| `index_dvd_two_mul_orderOf_of_isRealClosed` | Albert's (x,x)+(y,xy) over ℝ(x,y) | Albert form ⟨x,x,−1,−y,−xy,x⟩ anisotropic (Springer at y, then x) | ind 4 = 2·per | sharp |
| `index_eq_orderOf_of_not_isSemireal` | K ⊇ ℂ; K = ℝ(x,y) | de Jong case; real field | Albert's class has per 2, ind 4, so nonreality is needed | holds |
| `index_eq_orderOf_of_forall_isRealClosed` | nonreal K; ℍ ⊗ ℝ(x,y) | hypothesis empty; class survives at every ordering | reduces to Theorem 0.3; excluded. R : Type u suffices (`exists_realClosure`) | holds |
| `not_anisotropic_of_hasZeroTotalSignature` | dimension 5, real K; nonreal K; degenerate q | predicate false; predicate empty; radical v has 2q(v) = b(v,v) = 0 | vacuous; Theorem 0.10; isotropic | holds |
| `exists_anisotropic_hasZeroTotalSignature` | ℝ(x,y): ⟨1,−(1+x²)⟩ ⊗ ⟨1,−y⟩ | signs +,−,−,+ (y > 0) and +,−,+,− (y < 0): 0 | residue forms ⟨1,−(1+x²)⟩ anisotropic over ℝ(x) | holds |
| `not_anisotropic_of_not_isSemireal` | ℝ(x,y); ℂ(x,y,z) | 5⟨1⟩ positive at every ordering; ⟨⟨x,y,z⟩⟩ of dimension 8 | both anisotropic: nonreality and transcendence degree 2 are needed | holds |
| `exists_common_zero_of_not_isSemireal` | ℂ(x,y): ⟨1,x,y,xy,0⟩, ⟨0,0,0,0,1⟩; ℝ(x): 5⟨1⟩ | last coordinate 0, then ⟨1,x,y,xy⟩ anisotropic | no common zero: transcendence degree 1 and nonreality are needed | holds |

- Source locators checked against the text: 65 (B19 40, EKM 14, CT05 4, VA13 3, MVH98 3, BEC05 1), covering all 15 sampled targets; every one is at its stated theorem and page.
- Source corrections confirmed at the source: E1–E11, E14–E18 and E20–E23 (B19 lines 282–285, 306, 356, 546, 553–556, 691, 838–861, 889–902, 1164–1178, 1288, 1311, 1331–1333, 1445, 1465, 1783–1790, 1818; BW20 line 505).
- Library declarations opened at the pins: 29 in Mathlib and 36 in Tau Ceti, each at the file and line of the supplier contracts. The pins have no space of orderings, C_i predicate or u-invariant.
- Cross-roadmap citations resolved: about 95 section and declaration citations across 24 roadmaps, on main or at their open heads (AlgebraicTopologyPartII ccdd821, QuadraticFormInvariantsPartII b38ee3c, K3BlochGroups cf5467c, where §5.8 states quantifier elimination at its line 2052).
- Gate: every check 0, OK. Dependency check: `depcheck: 263 roadmaps, 2577 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Nothing is changed outside the folder.
- `lake env lean Suggested.lean`: 8 `sorry` warnings and nothing else. One-tactic probe (`simp`, `rfl`, `infer_instance`, `trivial`, `exact?`): none of the 8 theorems closes. `#check @` on all 9 declarations: each type agrees with its README statement and keeps every binder.
- Headlines: de Jong (§2.9), the norm bound (§2.10), Theorems 0.3, 0.4 (birational), 0.10, 0.12 (both parts) and the pair-of-quadrics form of 0.13 are stated. The docstring names Theorems 0.4 (scheme form), 0.5, 0.6, 0.13 (del Pezzo form) and Proposition 0.7 with the missing carriers.
- Gaps: the three declared gaps are precise, have the slugs of `packages/RealSurfacePeriodIndex/design/plan.json`, and a search of main and the open heads finds no roadmap that provides them. The description was read against the head and nothing in it is contradicted.

Overlap check: read QuadraticFormInvariantsPartII, LogicAndDefinabilityInNumberTheoryPartII, AlgebraicTopologyPartII, QuadraticFormInvariants (main and its open revision), MotivesAndAlgebraicCycles, SchemeAndStackFoundations and RealAlgebraicGeometry. C_i fields, Tsen–Lang and real closures at an ordering: two owners, D01. Springer's odd-degree theorem and henselian unit reduction for Pfister forms: QuadraticFormInvariantsPartII (different statements from §0.10). Quantifier elimination for real closed fields: K3BlochGroups §5.8. Witt ring and Clifford invariant: QuadraticFormInvariants. cl, cl_R and the real Lefschetz theorem: MotivesAndAlgebraicCycles. Trace-quotient and transport lemmas: AlgebraicTopologyPartII. Brauer groups of schemes: SchemeAndStackFoundations. Nothing else is shared.

Source independence: 32 passages compared with 6 sources, and a word-run scan of the README and `Suggested.lean` against 9 cached texts; outside titles and formulas the longest shared runs are 12 words (B19 lines 609–610) and 11 words (BEN18, the antilinear-action clause), both one-clause facts; largest share B19, 129 of 253 locators; contents compared with B19: independent (Layer 0 has no counterpart, Layers 1–2 reverse §§2 and 1, Layers 4–5 reverse §§5 and 4, §6 is split over Layers 6–7; Layers 8–9 follow §§7–8 because §9.7 needs §8.10).

Research link: The headline targets are the theorems of Benoist (2019) on de Jong's period-index theorem over function fields of real surfaces, which settle cases of Lang's and Pfister's conjectures (u(ℝ(S)) = 4); Benoist–Wittenberg (2020) relate Theorem 0.13 to the real integral Hodge conjecture. This rests on B19 lines 15–157 and the README summary.

## Not verifiable

- BCR (§§0.1–0.3, 0.5a, 0.9, 6.5, 9.11, 9.12): uncertified, cited by locator; B19 lines 1162, 1317 and 1802 cite it for the same facts.
- ARA75, SPR55, EL73, BRO80, CTP90, SCH94, GG73, DIM85: uncertified, cited by locator; B19 lines 521, 1128, 1164–1166, 1258, 1317, 1335 and 1815 and BEC05 line 102 cite them for the statements used.
- DK96 and DIK00 (§§9.2, 9.7, 9.10): uncertified; B19 lines 74, 82 and 1773 cite them for the halves and the classification.
- SER06 and BRE97 (§§4.6, 4.7): uncertified; each supports one standard step that the proof sketch also derives.

## Source issues

- **Error** in B19 at §3.1, p. 76: the source says {rv² = sw²} is a finite double cover of S; it should be proper of generic degree 2 with ℙ¹ fibres over R ∩ D; affects a stated result.
- **Misprint** in B19 at §3.1, pp. 76–77: the source says the fixed singular points lie over Sing R where v vanishes; it should be where w vanishes; affects nothing.
- **Gap** in B19 at Lemma 1.4, proof, p. 70: the source says p_*β reduces to p_*p*α̃ for any integral lift β; it should first choose β with β mod n = p*α̃; affects the proof.
- **Misprint** in B19 at Theorem 1.5, proof, p. 71: the source says Voisin's Proposition 9 is applied with n = dl; it should be degree dn; affects nothing.
- **Misprint** in B19 at (2.1), p. 72: the source says the Gysin source has coefficients M(−k) with k the degree; it should be M(d′ − d), as in BW20 (1.22); affects nothing.
- **Gap** in B19 at Proposition 4.2, proof, p. 80: the source says the remaining curves are exceptional divisors of the blow-up; it should also treat the ℙ¹ fibres over R ∩ D; affects the proof.
- **Error** in B19 at Proposition 4.4, proof, p. 84: the source says [ζ]₁ = [e]₁ on Ψ; it should be [α̃]₀ ∪ [e]₁, so the proposition fails for some Ψ ⊋ Θ; affects a stated result.
- **Gap** in B19 at Proposition 4.5, proof, p. 84: the source says β on T_U equals p*α̃ + 2ε + cl(ϕ), adding a mod-2 class to integral ones; it should use an integral lift; affects the proof.
- **Gap** in B19 at Proposition 4.5, proof, p. 85: the source says Proposition 3.3 and Assumption 4.1 (ii) give p_*γ = δ − cl(θ₂); it should first subtract curve classes avoiding Ψ; affects the proof.
- **Misprint** in B19 at Proposition 4.5, proof, p. 85: the source says [p_*ε]₁ = 0 in H¹(S(ℝ)); it should say only that its restriction to Ψ vanishes; affects nothing.
- **Error** in B19 at Lemma 6.4, proof, p. 92: the source says h₁ vanishes to order one along R and H; it should have a simple pole along R, or t vanishes doubly along R; affects the proof.
- **Misprint** in B19 at Lemma 6.5, proof, p. 92: the source says p(T(ℝ)) is disjoint from Θ; it should be disjoint from Ψ = S(ℝ) ∖ Ξ; affects nothing.
- **Misprint** in B19 at Proposition 6.7, p. 95: the source says a lift of (n/2)α is given for every n; it should require it for even n only; affects nothing.
- **Gap** in B19 at the proof of Theorem 0.12, p. 95: the source says K is the union of the finite extensions of K₀; it should first add a transcendence basis to K₀; affects the proof.
- **Gap** in B19 at the proof of Theorem 0.12, p. 96: the source says z_j not proportional to w² + 1 make y₁, y₂ parameters; it should replace w by (w² − 1)/(2w); affects the proof.
- **Misprint** in B19 at Lemma 7.3, p. 98, and (7.13), p. 103: the source says p*α̃ is the reduction of p*η + ψ(ζ); it should be p*η − ψ(ζ); affects nothing.
- **Misprint** in B19 at Lemma 7.3, proof, p. 99: the source says the two maps agree because Q → j_*j*Q is injective; it should use injectivity of the target p_*(ℤ/n) → j_*j*p_*(ℤ/n); affects nothing.
- **Error** in B19 at Theorem 0.6 (ii), p. 65, and its proof, p. 107: the source says one nonempty half with an odd number of odd-χ components gives index 4; it should note this case never occurs, since deg(w₁²) = 0; affects the proof.
- **Misprint** in B19 at the proof of Theorem 0.6, p. 107: the source says the class δ with [δ]₀ = 0 is unique; it should be the unique nonzero class; affects nothing.
- **Misprint** in B19 at the proof of Proposition 0.7, p. 107: the source says α = (f, g) in the Brauer group of the real function field; it should be Br(K(S)) for the Puiseux field K; affects nothing.

## For the human reviewers

- none
