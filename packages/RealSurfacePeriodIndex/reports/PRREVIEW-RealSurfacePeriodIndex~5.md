# Review of RealSurfacePeriodIndex (pull request #2462 at f569636)

**Verdict:** accepted

**Summary.** Accepted: no statement of the README or of `Suggested.lean` was found false, unsupported or unowned, and the roadmap's corrections to its main source that I recomputed (the evaluation factor in Proposition 4.4, the local parameters of the u ≥ 4 witness, the order along R in Lemma 6.4, the vacuous case of Theorem 0.6 (ii)) are right. There are three small corrections (the description's dependency paragraph is out of date; main's QuadraticFormInvariantsPartII assigns to this roadmap two things it does not plan; the scope does not say that de Jong's theorem in positive characteristic is left out) and two format notes, none blocking. Three points are left for the human reviewers: the arrangement against the single article the roadmap is built on, the characteristic-zero scope of de Jong's theorem, and thirteen sources cited by locator that could not be read.

## C01 — The description's dependency paragraph describes an earlier head

A reader of the description learns the wrong prerequisites. It says "QuadraticFormInvariantsPartII, also named in the README, is a consumer, not a prerequisite", while at this head §0.7 imports the Tsen–Lang theorem from that roadmap's §§5.1 and 5.6 (README line 275), §0.3 takes real closures from its §6.0 (line 93), and the supplier contracts have a section for it (line 2789); the description's own opening block says the same. It also calls EnriquesSurfaces "an open pull request by another author (#1286), which must merge first as well", and that roadmap is on main. The long paragraph still lists "the Tsen–Lang theorem" among what the foundation builds.

The text that would be right: "QuadraticFormInvariantsPartII (on main) supplies the Tsen–Lang theorem (§§5.1, 5.6) and real closures of ordered fields (§6.0). EnriquesSurfaces §§1.1, 1.3 and 1.4 is on main." and, in the long paragraph, "the Tsen–Lang theorem, imported from QuadraticFormInvariantsPartII".

## C02 — Main assigns the level of a field and the quadric-level computations to this roadmap, which plans neither

QuadraticFormInvariantsPartII on main (its README, lines 116–118) says that "the level and the quadric-level computations of Benoist–Wittenberg) belong to `RealSurfacePeriodIndex` Layer PI.0". A reader who follows that pointer finds no Layer PI.0 here (the layer is Layer 0) and no target on the level of a field: the word occurs in this README only for the ramified levels of the Puiseux field. So after the merge these two items have an owner by name and no plan.

The other roadmap cannot be edited in this pull request, so the smallest change here is one sentence in "Scope and ownership": that Layer 0 is the layer QuadraticFormInvariantsPartII calls Layer PI.0, and that the level of a field and the quadric-level computations of Benoist–Wittenberg are not planned in this roadmap. If they are meant to live here, they would instead be targets of Layer 0 with their own locators. The matching edit of the pointer on main is a separate revision of that roadmap.

## C03 — The scope does not say that de Jong's theorem in positive characteristic is left out

B19 states de Jong's theorem for every algebraically closed field (B19 lines 24–25, Theorem 0.1, p. 63) and gets the general case from characteristic zero by a lifting argument it cites (B19 lines 198–200, §0.6, p. 68). §2.9 and `index_eq_orderOf_of_isAlgClosed` are in characteristic zero, which is all the real theorems use and is said in the title of §2.9, but "Scope and ownership" (lines 2671–2690) lists Lang's and Pfister's conjectures and Lieblich's bound as background and is silent on this. A later roadmap that needs period equals index over function fields of surfaces in characteristic p cannot tell from the scope whether it is planned.

One sentence would settle it: "De Jong's theorem is planned in characteristic zero; the positive-characteristic case of the source's Theorem 0.1, which the source reduces to characteristic zero (B19 §0.6, p. 68), is not planned here."

## N01 — "QuadraticFormInvariantsPartII §6.0, Corollary 2.5" reads as that roadmap's numbering

In §0.3 (line 108), §0.5 (line 165), §7.5 (line 1904) and the supplier contract (line 2791), "Corollary 2.5" is the number in the lecture notes that §6.0 cites, not a number of §6.0. "the statement §6.0 takes from Kuhlmann's Corollary 2.5 (the algebraic elements of a real closed overfield form a real closure)" would let a reader find it.

## N02 — The real closedness of the Puiseux field is statable at the pins

`IsRealClosed (TauCeti.puiseuxField R)` for a real closed `R` (§9.11) uses only carriers at the pins. It is a step toward Proposition 0.7 and not a headline, so its absence is no defect; the author may wish to state it, since Proposition 0.7 itself is not statable.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.9 Witt's theorem | (−1, t), (−1, 1+t²) over ℝ(t); pointless conic | (−1,t): f<0 where t<0, nonzero; 1+t² positive everywhere, norm form zero signature, isotropic by u ≤ 2 | agrees; B19 lines 698–703, EKM line 9272 | none |
| 0.12 Period and index | ℍ, M₂(ℍ) over ℝ; ℍ over ℝ(t), ℂ(t); Albert class | ind 2, 2 (degree 4); 2 and 1; Albert form ⟨−1,x,x,x⟩ ⊥ −y⟨1,x⟩ anisotropic, ind 4 | agrees; CT05 lines 150–180 | none |
| 1.3 Real class of a 2-torsion bundle | e = a₀ω + a₁; e = ω on a point | Sq¹e = (a₀,0,a₁²); ω∪e = (a₀,a₁,0); sum (0,a₁,a₁²); point: 1+1 = 0 | agrees; B19 lines 485–505 | none |
| 1.5 Extension of algebraically closed fields | k = K; ℝ ⊂ ℂ; ℚ̄ ⊂ ℂ with (x,y) | empty; ind 2 → 1 (k not closed); spread-out cover degree 2 specialises to degree 2 | agrees; B19 line 199, CT05 line 150 | none |
| 2.1 Hypersurface family | S = ℙ², A = O(1); quintic; n = d = 1 | H²K_X = 2(A·K−A²) = −8; quintic 5 = 5 excluded; member is blow-up at A² points, degree 1 | agrees; B19 lines 236–241 | none |
| 2.5 Voisin's cone | σ not (1,1) on S | p_*p*σ = dn·σ, so p*σ is (1,1) on no fibre; cone must lie in ker p_* | agrees; B19 lines 294–311, VOI06 lines 724, 773 | none |
| 3.3 Stein factorisation | crossing r = x, s = y | charts y = xa², x = yc², c = a⁻¹; sections k[r, rx, rx²] = k[r,z,s]/(z²−rs) | agrees; B19 lines 541–547, 990–994 | none |
| 3.4 Strata | smooth point of Δ; Sing Δ; R = D = ∅ | fibre κ[z]/(z²): length 2, one point; ℙ¹; E = ∅ | agrees; B19 lines 562–566, 608–610 | none |
| 5.4 Boundary component (correction E3) | (a₀,a₁,a₂) with e+ω = e₁ on Ψ | Sq¹: (0,a₁,a₁²); e₁∪: (0,a₀e₁,a₁e₁); degree one a₁ + a₀e₁; source drops a₀ | README right; B19 lines 856–861 | none |
| 5.5 Failure example | K3 x_j² = (By²)_j, B Vandermonde (1,2,3) | det 2, nine 2×2 minors 1,3,2,2,8,6,1,5,6; X(ℝ) = 4 spheres; other form empty; h₁·w₁ = 1 | h₁ ∉ w₁^⊥ = J (MVH98 line 500); τ ≠ 0 | none |
| 5.7 Curve adjustment | [d]₁ = 0 on S(ℝ) | ν = 0; in general ν = ΣΓ_k from Assumption 4.1 (ii), then Proposition 3.3 in degree 2 | agrees; B19 lines 900–902 | none |
| 5.8 Pushforward adjustment | (c) ⇒ (a) | p_*(β−2γ) = 2δ + cl θ₁ − 2(δ − cl μ − cl φ − cl ν) = cl(θ₁+2μ+2φ+2ν) | agrees | none |
| 6.5 Algebraic approximation | circle in ℝℙ² | class algebraic (H₁ = 𝔽₂ generated by a line); BCR statement not read | locator agrees with B19 line 1162 | none |
| 6.7 Branch section (correction E20) | order of t along R | source: h₁ zero + r zero = 2; README: −1 + 1 = 0; t ∈ A^l N²(−R), rt = −h₁h₂r²u < 0 | README right; B19 lines 1164–1170 | none |
| 6.13 Degree-two splitting | bundles of a₂ and t; cl_R(M) | a₂, t ∈ H⁰(A^l N²(−R)); a₂c ∈ L²(R); cl_R(M) = l·cl_R(A) + cl_R(N) = 0 | agrees; B19 lines 1198–1283 | none |
| 7.4 Theorem 0.3 | ℝ(x,y) (real); K ⊃ ℂ | Albert class ind 4 ≠ 2; nonreal case Θ = ∅, induction n → n/2 | agrees; B19 lines 43–44, 1301–1303 | none |
| 7.9 u ≥ 4 witness (correction E10) | w = u at (u²+1, v) | y_j ≡ (w²+1) + 2(1+i)z_j; det 2(1+i)(α₁+α₂+2(1+i)) = 0 at α = −(1+i); with w′: 4(1+i) | README right; B19 lines 1331–1334 | none |
| 9.1 Image of ρ | S(ℝ) = ∅; ℙ²_ℝ | image 0; ℙ²: only δ = 0 has [δ]₀ = 0, image all 4 pairs, matches |H²_G| = 4 | agrees; B19 lines 1703–1708 | none |
| 9.5 Empty half | four classes of H¹_G | 0, c ([c]₀ = 1), two lifts with [·]₀ the complements of the halves | agrees; B19 lines 1767–1784 | none |
| 9.8 w₁² (correction E23) | 2ℝℙ², one ℝℙ², 2 Klein bottles, 4ℝℙ² | 1+1 = 0; 1 excluded; 0+0; 4 = 0; w₁ = cl_R(K) ∈ w₁^⊥ | README right; B19 lines 1786–1790, MVH98 line 538 | none |
| 9.14 Not a quaternion class | orders along D = {u = 0} | sign constant on arc v/w<0 forces even order; jump needed on arc v/w>0 | agrees; B19 lines 1817–1833 | none |
| Lean: de Jong, norm bound | k = K excluded by trdeg 2; √−1 ∈ K | ind(α) ∣ 2·ind(α_L) = 2·per(α_L) ∣ 2n | true as stated | none |
| Lean: Theorem 0.4 birational | K nonreal; hypothesis over all real closed R | hypothesis empty, reduces to 0.3; factor through the algebraic elements, a real closure | equivalent to README §7.6 | none |
| Lean: `HasZeroTotalSignature` | ⟨1,−1⟩, ⟨1,1⟩, ⟨1,0⟩ over ℝ; odd dimension; nonreal K | holds; fails; holds (degenerate, isotropic); fails; holds for every form | determines the intended condition on nondegenerate forms | none |
| Lean: u ≤ 4, u = 4, Theorem 0.10 | K not finitely generated; ⟨1,y₁,−y₂,−y₁y₂⟩ | limit of closed loci empty ⇒ some empty; form ≅ ⟨1,1,−1,−1⟩ over every real closed R | true as stated | none |
| Lean: pairs of quadrics | ℝ(x): 5⟨1⟩; ℂ(x,y): ⟨1,x,y,xy,0⟩, ⟨0,0,0,0,1⟩ | no zero (real); no common zero (trdeg 2); K(t) nonreal of trdeg 2 | hypotheses both needed, statement true | none |
| C02 | search of this README for the level | only "ramified level" of the Puiseux field | main's pointer has no target | scope sentence |
| C03 | B19 Theorem 0.1 against §2.9 | source: any algebraically closed k; README: characteristic 0 | scope silent | scope sentence |

- Source locators checked against the text: 74 (B19 50, EKM 14 with printed pages, CT05 4, MVH98 3, VOI06 2, BEC05 1); all agree.
- Library declarations opened at the pins: 66 with file and line (31 Mathlib, 35 Tau Ceti), all at the lines the contracts give; the definitions of `IsSemireal`, `TauCeti.Algebra.index`, `QuadraticMap.IsTotallyIsotropic` and `TauCeti.BrauerGroup.baseChange` read.
- Cross-roadmap citations resolved: 81 sections of 24 roadmaps and 30 named declarations, on main or at the open head (HeightsRationalPointsAndObstructions, PurityForFlatCohomology); the content of 16 sections read.
- Declared gaps: three, each with the same slug in the plan and in the contracts, each precise; none is already provided (MotivesAndAlgebraicCycles §7.8 uses the torsion-free cokernel without naming it, ComplexComparisonPartII has no equivariant comparison, AlgebraicTopologyPartII §16.2 assumes the control data).
- Elaboration: `sorry` the only warning (8 warnings, 0 errors); the 9 elaborated types compared with the README statements, all binders present.
- One-tactic probe: none of the 8 theorems closes with `simp`, `rfl`, `infer_instance`, `trivial` or `simp_all`.
- Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no change outside the roadmap folder.
- Automatic checks: all passed.

Overlap check: read QuadraticFormInvariantsPartII, QuadraticFormInvariants and AlgebraicTopologyPartII (main), and searched LogicAndDefinabilityInNumberTheoryPartII, HeightsRationalPointsAndObstructions and SchemeAndStackFoundations (open); C_i fields, Tsen–Lang and real closures of ordered fields: QuadraticFormInvariantsPartII, cited; Springer's theorem for arbitrary diagonal forms over complete discretely valued fields: here (that roadmap's Layer 4 treats unit Pfister forms, its §2.5 the odd-degree theorem); Elman–Lam invariant, orderings, Artin–Lang, Amer–Brumer, Albert forms, period and index: here, stated nowhere else; double-cover topology and transport: AlgebraicTopologyPartII, cited; the level of a field: assigned here by main, not planned (C02).

Source independence: 12 passages compared with 4 sources (B19 at Theorem 1.5, Assumptions 4.1, 5.2 and 6.1, §5.1, Proposition 5.5, the definition of positivity, Lemma 6.4, Proposition 6.6; CT05 Propositions 2.2 and 2.6; EKM Lemma 19.5; MVH98 Theorem 1.3), none shared beyond formulas and lists of hypotheses; largest share B19, 131 of 256 locators; contents compared with B19: Layer 2 ↔ §1, Layer 1 ↔ §2 (in part), Layer 3 ↔ §3, Layer 5 ↔ §4, Layer 4 ↔ §5, Layers 6–7 ↔ §6, Layer 8 ↔ §7, Layer 9 ↔ §8; not one to one in order (two transpositions, one split, Layer 0 and §§1.5–1.9, 7.12–7.13 outside it), and the order is forced by the Dependencies lines (3 before 4 and 5; 4, 5 before 6; 6 before 7; 7, 8 before 9): independent. Thirteen sources cited by locator were not read.

Research link: The headline targets are the theorems of Benoist 2019 (period-index for function fields of real surfaces), with de Jong's theorem, Pfister's conjecture u ≤ 4 in transcendence degree 2 and Lang's conjecture for quadrics; Layers 3–8 feed the integral Hodge questions of Benoist–Wittenberg 2020. Rests on B19 §§0.1–0.5 and the README's "Downstream consumers".

## Not verifiable

- BCR (§4.1, Example 7.1.4, §10.3, Theorem 12.4.11, Example 15.2.2), ARA75, SPR55, EL73, BRO80, DK96, DIK00, CTP90, SCH94, SER06, GG73, BRE97, DIM85: paywalled, cited by locator; where B19 cites the same item the number agrees (B19 lines 1162, 1164, 1317, 1802, 1815).
- §6.5 (sample): the statement of BCR Theorem 12.4.11 was not read; only its use in B19 Lemma 6.4.
- The "if and only if" of §5.5 was checked against B19 (4.2)–(4.8) and Proposition 3.3; the form of the chase relation in AlgebraicTopologyPartII §16.4 was not opened beyond its heading.
- The stratification of §6.11 and the Kodaira–Spencer comparison of §4.7 were read for consistency, not recomputed.

Automatic checks set aside as false positives: the listing of elaborated signatures counts ten declarations, one of them a structure named "," at line 68; that is the word "structure" in the docstring of the zero-total-signature predicate, and the file declares nine names.

## Source issues

- **Error** in B19 at Proposition 4.4, p. 84, after (4.8): the source says the degree-one boundary component on Ψ equals that of the cover class; it should be that class multiplied by the evaluation of α, which is zero on Ψ ∖ Θ; affects a stated result.
- **Error** in B19 at Lemma 6.4, proof, p. 92: the source says the auxiliary function vanishes to order one along R and H; it should have a simple pole along R, otherwise the section vanishes doubly along R; affects the proof.
- **Gap** in B19 at the proof of Theorem 0.12, lower bound, p. 96: the source says two non-proportionality conditions make y₁, y₂ local parameters; it should require the determinant 2(1+i)(α₁+α₂+2(1+i)) to be nonzero; affects the proof.
- **Error** in B19 at Theorem 0.6 (ii), p. 65, and proof, p. 107: the source says one nonempty half with an odd number of components of odd Euler characteristic gives index 4; it should say this case never occurs, the first Stiefel–Whitney class being orthogonal to itself; affects the proof.
- **Gap** in B19 at the proof of Theorem 0.12, p. 95: the source says the field is the union of the finite extensions of a finitely generated subfield; it should first enlarge that subfield by a transcendence basis; affects the proof.
- **Gap** in B19 at Proposition 4.5, proof, p. 85: the source says Proposition 3.3 applies once the first component vanishes on Ψ; it should first subtract classes of curves avoiding Ψ given by Assumption 4.1 (ii); affects the proof.
- **Misprint** in B19 at §3.1, p. 77: the source says the fixed singular points are where v vanishes; it should be where w vanishes; affects nothing.
- **Misprint** in B19 at the proof of Theorem 1.5, p. 71: the source says Voisin's proposition is applied with n = dl; it should be with degree dn, n being the period; affects nothing.
- **Misprint** in B19 at the proof of Proposition 0.7, p. 107: the source says the class is a symbol in the Brauer group of R(S); it should be of K(S) for the Puiseux field K; affects nothing.

## For the human reviewers

- Arrangement: the roadmap is built on one article (B19, 131 of 256 locators); Layers 3, 5, 4, 8, 9 have the scope of its §§3, 4, 5, 7, 8, in an order the Dependencies lines force. Whether that is independent enough is yours to judge.
- Scope: de Jong's theorem is planned in characteristic zero only (§2.9, and `[CharZero k]` in `Suggested.lean`); B19 Theorem 0.1 states it for every algebraically closed field. No roadmap I searched plans the positive-characteristic case.
- Not tested: thirteen sources are cited by locator without their text (BCR, ARA75, SPR55, EL73, BRO80, DK96, DIK00, CTP90, SCH94, SER06, GG73, BRE97, DIM85); the wording was not compared with them.
- Ownership: QuadraticFormInvariantsPartII on main (README lines 116–118) assigns the level and quadric-level computations to this roadmap under the name "Layer PI.0"; that text needs a revision of its own whichever way C02 is settled.
- The roadmap asserts that B19's Proposition 4.4 is false as printed and gives an example (§5.5 Checks); I recomputed the example and the corrected formula, but the claim concerns a published theorem and deserves a specialist's eye.
