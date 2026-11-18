# Review of AbelianSurfacesModularity (pull request #1746 at cfb92db)

**Verdict:** accepted

**Summary.** Accepted: no finding. The head differs from the one last reviewed by a reordering of the README and by one supplier change (regular rank-two compatible systems now come from SerreModularityByCompatibleSystems `S7/regular-compatible-systems`, which states the theorem cited); the whole roadmap was read again, the sampled source locators agree with the texts, and every finite count, matrix and local example recomputed here reproduces. There are two small corrections (stale supplier pointers; one comparison that an earlier roadmap already states) and one format note, none blocking. For the humans: the main source is an arXiv preprint, and the README departs from it in three verified places.

## Previous findings

- none to repair: the previous review, of `b20dcf8`, accepted with no finding. The change since then is a reordering (scope and supplier contracts moved to the end; the 1251 lines are otherwise identical) plus six sentences that replace ClassicalSerreModularity R27.6 by SerreModularityByCompatibleSystems `S7/regular-compatible-systems`.

## C01 — Three supplier pointers name a heading or identifier that the supplier does not have

A reader who follows these pointers lands on nothing, or on a table that sends them to a different roadmap, so the contract does not say who supplies the statement.

- "PotentialAutomorphyInfrastructurePartII PL.0, Soluble and cyclic CM extensions with prescribed local behaviour" (the route and Needs of §3.1, lines 345 and 354; Needs of §3.2, line 370; the contract, line 1142). That roadmap has no such heading. Its table of earlier identifiers sends `PL.0/auxiliary-cm-extensions` to PotentialAutomorphyInfrastructure §§2.3 and 2.5, and §2.5 there gives cyclic extensions with places split completely and, for solvable extensions with prescribed completions, refers to PotentialModularityAndCompatibleSystems §2.16. What §3.1 uses (a solvable totally real extension, linearly disjoint from a given field, with prescribed completions above 2 and real places kept real) is exactly PotentialModularityAndCompatibleSystems §2.16. Citing that section, or PotentialAutomorphyInfrastructure §2.5 with it, would name the owner; both are earlier in the merge order.
- "AutomorphicLFunctionsAndLocalFactors AL.2, Centered entire functions and paired products" (Needs of §0.3, line 102; the contract, line 1176). On main the layer AL.2 has no heading of that title; its list of identifiers sends AL.2.5.1 and AL.2.5.2 (centered growth, the paired Hadamard theorem) to AnalyticNumberTheoryPartI §0.29 and §§0.29a–0.29b. The entire continuation and functional equation used in §0.3 are AL.2.4, Global Godement–Jacquet theory, which is cited correctly beside it.
- "EllipticCurveModularityPartIIGL2TypeAbelianVarieties GT.3" (Needs of §7.3, line 894; the contract, line 1210). That roadmap has no identifier GT.3; the theorem meant is its §3.6, Modularity of abelian varieties of GL₂-type, in Layer 3.

## C02 — The identification of BCGP near adequacy with relaxed adequacy is a stated target of an earlier roadmap and is re-derived here instead of cited

In §2.5 (line 301) the route derives the identification from the relaxed-adequacy predicate and the trace/spanning equivalence ("this identifies relaxed adequacy with BCGP25 near adequacy over the original characteristic-two field"), and the scope paragraph (line 1054) and the PotentialAutomorphyInfrastructurePartII contract (line 1142) attribute it to ArithmeticGaloisRepresentations §7.9 together with PL.4. OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.3, Weak adequacy with the full adjoint, and near adequacy, states precisely this (nearly adequate subgroups in the sense of BCGP25 Definition 5.3.3 are the relaxed-adequate subgroups when the field contains the eigenvalues), and its scope paragraph lists "the comparison of BCGP's near adequacy with relaxed adequacy" among what it owns (its README lines 81–91 and 675). That roadmap is already a supplier here, for §5.2.

Nothing stated in §2.5 is wrong: the two derivations agree, and §2.5 states no target for the comparison. Citing §1.3 for it, and keeping here only the scalar extension from a finite field containing the eigenvalues to an arbitrary field of characteristic two, would leave one owner. The theorem that A₅(b) is nearly adequate and not adequate stays here; the other roadmap has it only as a Check.

## N01 — Four Mathlib line numbers point one line above the declaration

In the Mathlib contract (lines 1064 and 1066): `Matrix.J` is at line 59 and `Matrix.symplecticGroup` at line 102 of `Mathlib/LinearAlgebra/SymplecticGroup.lean` (58 and 101 are the docstring and an attribute); `alternatingGroup` is at line 73 and `card_alternatingGroup` at line 137 of `Mathlib/GroupTheory/SpecificGroups/Alternating.lean` (72 is an attribute, 136 is blank).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.3 GSp₄ witness gives modularity and the functional equation | GL₄ witness; elliptic product; s=0,1 | exponent (1−4)/2=−3/2, GL₂ gives −1/2; s↦2−s sends 0→2, fixes 1; source twist \|ν\|^(−3/2) at BCGP25 line 682 | Agrees; reducible product fails absolute irreducibility | none |
| §1.4 fifteen allowed images | Table rows; full group; 3.1620.1 against 3.1620.2 | 15 ticks, 10 crosses (BCGP25 lines 6786–6810); orders 103680, 51840; Γ types <32,44> against <32,50> | Counts agree; column of each cross not readable (see below) | none |
| §2.1 basis and S₅ embeddings | Nine permutations in the basis e₁…e₄ | Gram matrix = J; images of (12)(34)(56), (12), (12345) equal README's; orders 2, 2, 5; all preserve J | Agrees; six-cycle matrix of BCGP25 p.203 is that of (164352) | none |
| §2.2 rational Weierstrass points | Quintic; trivial action; irreducible sextic | fixed letters ≥1; 6 fixed and 15 nonzero points; 0 fixed | Both directions consistent | none |
| §2.3 strongly odd involutions | I, (12), (12)(34), (12)(35)(46) | rank(g−I)=0,1,2,2; diag(gJ)=0000, 1000, 1100, 0000; n+1+⌊n/2⌋=4 at n=2 | Two odd, two non-odd classes; matches BCGP25 Remark 5.2.8 | none |
| §2.5 near adequacy of A₅(b) | V; H=1 on k² | dim End=16, socle 1+4=5; H¹(ad/k)≅H²(A₅,k), dim 1; span of {I} has dim 1<4 | Nearly adequate, not adequate; trivial group fails | C02 (citation only) |
| §4.3 three good ordinary Jacobians at 2 | C₁, C₂, C₃ over 𝔽₂, 𝔽₄ | point counts (5,7), (3,7), (3,3); (a,b)=(2,3), (0,1), (0,−1); Q(1)=14, 6, 4; all smooth | Polynomials agree; classes 10A, 6I, 6H taken from source | none |
| §4.4 enumeration over 𝔽₂ | All 2¹¹ pairs (h,f) | 768 smooth; 384 ordinary; by Q mod 3: 48, 48, 192, 96 ordinary and 144, 48, 48, 96, 48 not | Equals 6G+6H, 6I, 10A, 8A and 12C, 4D, 8A, 10A, 6G | none |
| §4.5(d) Weil-restriction class | F, B of README; cyclic-basis forms | FᵀBF=2B; (F²+I)²=0; 45 lines, 27 frames, cycle type 3⁵·6²; 8 compatible forms, fixed frames 0 or 3, u swaps the two families | 6H for the descended pairing; 6G for λu | none |
| §4.6 purely toric reduction in 2C, 6G | Y: y²+y=x⁵−x⁴+x³; t=1,2 | Y has counts (3,9), Q=X⁴+2X²+4, b even; X²+1 takes 1,2,2 on 𝔽₃ | Hypothesis (4) needed; t=1 impossible, so t=2 | none |
| §4.7 product and coupled-period seeds | A, B, C; diagonal and coupled periods | (x²−1)(x²+x+2)≡x⁴+x³+x²+2x+1; (x²+x+2)(x²−x+2)=x⁴+3x²+4; centralizers 48 and 16; fixed odd refinements 0 and 2; t²=8u+5; 8000=20³=5·40² | Classes 8A, 4D, 2D; only coupled periods give the marking | none |
| §4.8 odd-theta moduli | Degrees; proper subgroups; product locus | 720/120=6; trivial subgroup gives degree 120; dim 1+1=2<3; −1 acts as 2I≠I on 3-torsion | Agrees with BCGP25 Definition 9.2.1, BCGP21 Lemma 10.2.4 | none |
| §4.11 ordinary curves over 𝔽₃ | All 3⁷ polynomials | 40 ordinary Weil quartics; 1296 smooth; 864 ordinary; square Q: 4+1+1+4=10, none with a rational Weierstrass point; 4 classes with no Jacobian; 4+24+1+8+48+8+48=141 | Agrees with README and BCGP25 Lemma 9.3.1 | none |
| §4.13 local seeds at 3 | Distinguished quintics by q | 240 total: 42, 18, 54, 54, 36, 36; Q₋(1)=10, Q₊(1)=18 | Six nonscalar q occur; scalar classes need products | none |
| §5.3 infinitely many curves | Fibre of forgetting marking and framing | at most 6 markings and 103680 framings per curve | Finite fibres; infinitely many classes | none |
| §6.2, §6.3 modularity with allowed or surjective mod-3 image | Theorem A and Theorem 9.5.2 hypotheses; E×E | (X²+X+2)²≡X⁴+2X³+2X²+X+1; source hypotheses (1)–(3) equal README's; Q_(E×E)=Q_E² | Same hypotheses; supplier premises added, none dropped | none |
| §3.2 dyadic modularity | Theorem 8.3.2 hypotheses | (1) A₅(b)⊆image⊆S₅(b), (2) conjugation of order 2 in A₅(b), (3) ordinary, 2-distinguished | Same; conclusion restricted to ordinary primes | none |
| §7.1 potentially abelian automorphy | C₂ quotient, trivial V₁ | ∧²(1²⊕η²)=1²⊕η⁴, trace −2; Ind(det) trace 0; As⁺ trace 2, twisted −2 | 0+(−2)=−2; η twist required | none |
| §7.2 type dictionary | C₂ acting on ℝ×ℝ; FKRS12 counts | fixed dimensions 2 and 1; 52 types, 34 over ℚ (FKRS12 lines 192–194, 1002–1005) | Agrees | none |
| §7.3 automorphy for 32 types | Count; primes 5, 7; weights | 34−2=32; p=5 covers q=7, p′=7 covers q=5; weights {0,1} give k=a+1=2 in the supplier's route | Supplier states the regular-system theorem for weight ≥2 | supplier change verified |
| §8.1 density | Local proportions | 624/2048=39/128; 854/2187; product 33306/279936=5551/46656; 5551=7·13·61 | Equal | none |
| §9.3 mod-2 realization | E/𝔽₉; H types; partitions | #E(𝔽₉)=8, Q=X⁴−2X²+9; H split/mixed/irreducible: 16, 144, 224; [2,2,2] has 2 ordinary equations, both with square Q; other nine partitions have distinguished equations | Agrees | none |
| `Suggested.lean` | Elaboration | exit 0, no output; 0 declarations, so no signature comparison and no one-tactic probe applies | Docstring names each headline and its missing carrier | none |

- Source locators checked against the text: 31 in BCGP25 (Theorems A, B, 8.3.2, 9.2.3, 9.5.1, 9.5.2, 10.2.1; Lemmas 5.2.7, 6.4.1–6.4.3, 8.1.2, 8.1.3, 8.2.2, 8.2.4, 8.2.8, 8.2.9, 9.1.3, 9.1.4, 9.2.8, 9.2.13, 9.2.14, 9.2.17, 9.3.1; Definitions 1.8.10, 1.8.25, 5.3.3, 9.1.2, 9.2.1; Remarks 1.8.20, 1.8.26, 5.2.8, 8.2.3, 9.3.2, 9.4.3, 9.4.4, 10.2.2), 4 in BCGP21, 3 in FKRS12.
- Library declarations opened at the pins: 11 in Mathlib and 6 in Tau Ceti; all exist with the stated content; 4 line numbers are off by one (N01).
- Cross-roadmap citations resolved at main or the open heads: 33 supplier roadmaps, about 140 section ids; all found except the three of C01.
- Declared gaps: 14 slugs, the same in the plan and in the README; each names a supplier and a single requirement.
- Dependency output: `depcheck: 203 roadmaps, 2213 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks rerun at this head: every check 0, `OK`. Outside the folder: 0 files changed against the base.
- Pull request text: title, the summary block and three prose paragraphs read against the head; no sentence is contradicted. It says the pull request adds the roadmap, that `Suggested.lean` has no declarations and that the topic is `math.NT`; all hold.
- Headline theorems (§0.3, §§3.1–3.2, §4.10, §§5.2–5.3, §§6.1–6.6, §§7.1–7.3, §8.1, §§9.3–9.4): none statable at the pins; each is named in the module docstring with the missing carrier. No padding: the file has no declarations.

Overlap check: read OrdinaryAutomorphicFormsAndModularityLiftingPartII, GSp4NonregularModularityLifting, ModularityAndLanglandsExtensions, ModularityAndLanglandsExtensionsPartII, EllipticCurveModularityImaginaryQuadratic, AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, LocalGaloisDeformationRings (the third list is empty); the near-adequacy/relaxed-adequacy comparison is owned by OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.3 (C02), GSp₄-reasonableness by its §5.2, nonregular lifting by GSp4NonregularModularityLifting, S₅(b) and rational 2-torsion by NeronModelsAndSemistableAbelianVarieties §6.13; near adequacy of A₅(b), the 2–3 switch, the odd-theta moduli and the Layer 6 endpoints are owned here only.

Source independence: 16 passages compared with 3 sources (BCGP25, BCGP21, FKRS12), none shared beyond formulas and forced lists of hypotheses; largest share BCGP25, 82 of 96 locator groups; contents compared with BCGP25: independent (Layer 1 draws on §6.4 with parts of §§9.1–9.2, Layer 2 on §5.2.4, §5.3 and §§8.1–8.2, Layer 4 rearranges §§9.1–9.3, Layers 7 and 8 reverse §10.2 and §10.1; the order 2→3→5→6 is forced by the Needs lines of §§3.2, 5.2 and 6.2).

Research link: Layer 6 states Theorems A and B and Theorems 9.5.1–9.5.5 of Boxer–Calegari–Gee–Pilloni (2025), Layer 7 their Theorem 10.2.1 with the Galois types of Fité–Kedlaya–Rotger–Sutherland (2012), Layer 9 their Theorem 10.3.9; it builds on their 2021 potential modularity paper. Rests on the sources read.

## Not verifiable

- KIS99 Theorem 5.1, THORNE17 Definition 2.20, FC90 II Theorem 6.2/Remark 6.3 and III Theorem 7.1/Corollaries 7.2–7.4: settled as uncertified; no text.
- §1.4, which of conditions (1)–(3) each of the ten rejected groups fails: the cached text of BCGP25 Table 6.4.4 keeps the ticks and crosses but not their columns; only the split 15/10 was confirmed.
- The projective classes of the explicit curves (10A, 6I, 6H for C₁, C₂, C₃; 6G for Y and for the curve of §4.9): they need the degree-40 and degree-27 resolvents; checked against the source's statements and the characteristic polynomials only.

## Source issues

- **Misprint** in BCGP25 at §9.2.16, p. 198 (line 9181): the source says the Frobenius polynomial at 2 of Y is x⁴+2x²+1; it should be x⁴+2x²+4 (counts 3 and 9 over 𝔽₂ and 𝔽₄); affects nothing.
- **Error** in BCGP25 at Lemma 9.2.13, pp. 196–197: the source says unramified 3-torsion of class 2C or 6G with mod-2 image in S₅(b) forces purely toric reduction; it should also assume bad or semistable ordinary reduction, since Jac(Y) of §9.2.16 has good reduction and class 6G; affects a stated result.
- **Error** in BCGP25 at the proof of Lemma 9.2.14, pp. 197–198 (lines 9152–9172): the source says the displayed mod-2 Frobenius has centralizer of order 16; it should be 48 for the Weil pairing e⊗I₂ of that product, and it fixes no odd theta characteristic; affects the proof.
- **Misprint** in BCGP25 at Lemma 6.4.1(2), p. 149 (line 6759): the source says the images lie in PSp₄(𝔽₃); it should be PGSp₄(𝔽₃), the elements having multiplier −1; affects nothing.
- **Misprint** in BCGP25 at the proof of Lemma 6.4.3, p. 150 (line 6822): the source says Γ = Γ′ ∩ GSp₄(𝔽₃); it should be Γ′ ∩ Sp₄(𝔽₃); affects nothing.

## For the human reviewers

- Scope: the source with 82 of 96 locator groups, BCGP25, is cited as arXiv v1 (2025), a preprint; the README's References give no journal publication for it.
- Scope: in §4.6 and §4.7 the README departs from BCGP25 (an added hypothesis in Lemma 9.2.13; a coupled-period construction replacing the proof of Lemma 9.2.14). Both departures were checked here by computation; no refereed source states them.
