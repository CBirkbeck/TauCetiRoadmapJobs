# Review of LogicAndDefinabilityInNumberTheory (pull request #2276 at f1d1e63)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason, and it is not a mathematical error: model completeness with Robinson's test, which §4.31 builds, is also built and claimed by the open roadmap SaturationAndQuantifierElimination (§2.5), and neither text names the other, so the object has two owners. No stated result was found false: every sampled locator was read at its source, the eleven Lean statements were recomputed on degenerate cases, and the supplier citations resolve. There are four small corrections and one format note, none blocking; the human reviewers are asked which of the two roadmaps should own the shared section, and the acceptance that would follow remains conditional on the four declared supplier gaps.

## R01 (P2) — Model completeness and Robinson's test (§4.31) are also owned by the open roadmap SaturationAndQuantifierElimination, with no citation in either direction

An implementer of either roadmap would build the same definition and the same theorem a second time, and a consumer could not tell which statement to import. In §4.31 (README lines 1264–1288) this roadmap defines "model complete" for a theory T (every embedding between models is elementary), defines existential closedness of an embedding, and sets as a target "T is model complete iff embeddings between its models are existentially closed", by the diagram and compactness argument. Pull request #2866 adds `TauCetiRoadmap/SaturationAndQuantifierElimination/README.md`, whose §2.5 (lines 243–254) defines `IsModelComplete T` by the same condition and proves Robinson's test, the first equivalence of which is the same statement; its Scope and ownership (line 416) says it owns "model completeness with Robinson's test", and its line 436 lists this roadmap's ownership as interpretations and the Denef–Pas language only. This README names that roadmap nowhere. Neither the pinned Mathlib nor the pinned Tau Ceti has the notion (no `ModelComplete` or existential-closedness declaration under `Mathlib/ModelTheory` or in `TauCeti`), so one of the two roadmaps must be the single owner.

The smallest change keeps §4.32 untouched, since it uses only the test. Either §4.31 imports the definition and the test from SaturationAndQuantifierElimination §2.5 (a line in *Needs*, a `### From TauCetiRoadmap.SaturationAndQuantifierElimination` contract, and the section keeps its Checks and the specialisation to ring embeddings of models of Th(ℚ)); or this roadmap, which is the one already placed in the merge order, stays the owner, and Scope and ownership says so in one sentence that names SaturationAndQuantifierElimination §2.5 as the general statement that will cite §4.31. Which of the two is for the authors and the human reviewers to settle; the text must state one of them.

## C01 — The ReductiveGroupsPartII contract sends Lang's theorem to §2.11, but §2.10(b) is where it is used

In "From TauCetiRoadmap.ReductiveGroupsPartII" (line 1912) the last sentence reads "Section 2.11 applies this to the connected Néron special fibres." The product formula `#𝒜(k)=#𝒜°(k)·#Φ_A(k)` and the étale-isogeny count are §2.10(b), whose *Needs* line (474) is the one that cites RG2.3.7; §2.11 (line 484) needs only §§2.7, 2.9 and 2.10. Write "Section 2.10(b)".

## C02 — The AbelianSchemesAndArithmeticModuliPartII contract says "Use" of four sections that no target uses

The contract (line 1948) reads "Use B2.6 …; B2.7 for free matrix word growth; B2.14 …; B2.15 …; and B2.18", and Scope (line 1859) says "the abelian group-action results are consumed from that roadmap". Only B2.6 occurs in a *Needs* line (§§6.14–6.16) or in a layer's Dependencies; B2.7, B2.14, B2.15 and B2.18 occur nowhere else in the README. A reader looking for where free matrix word growth or the abelian Ax theorem enter finds nothing. Say that these four are neighbouring results owned there and not consumed here (as the same paragraph already says "not targets of this roadmap"), or drop them from the "Use" sentence.

## C03 — The description still counts six suppliers as open; four of them are on main

The description says the README consumes "eleven on main (…) and six still open (NeronModelsAndSemistableAbelianVarieties, MotivesAndAlgebraicCycles, HeightsRationalPointsAndObstructions, ShimuraVarieties, AbelianSchemesAndArithmeticModuliPartII, WeilConjectures), which merge first". At this head NeronModelsAndSemistableAbelianVarieties, MotivesAndAlgebraicCycles, ShimuraVarieties and WeilConjectures are folders on main (the task list under it already ticks them). The sentence that would be right: "fifteen on main (… the eleven, and NeronModelsAndSemistableAbelianVarieties, MotivesAndAlgebraicCycles, ShimuraVarieties, WeilConjectures) and two still open (HeightsRationalPointsAndObstructions, AbelianSchemesAndArithmeticModuliPartII)".

## C04 — The Scope bullet on StratifiedSpacesAndTameTopology points to a roadmap that is neither on main nor in an open pull request

Scope and ownership (line 1873) says that roadmap's §4.1 owns triangulation for o-minimal expansions of ordered fields and §7.1 the C^p cell decomposition, and the description repeats the name. Main has no folder of that name (under `TauCetiRoadmap/` or `Completed/`), and no open roadmap pull request carries one, so neither section number can be checked and a reader following the pointer finds nothing. Nothing depends on it (the bullet itself says neither result is used). Name where the roadmap lives, or drop the bullet and the clause of the description until it exists.

## N01 — Two repetitions in Layer 4

§4.15 says twice in consecutive paragraphs that `Diophantine.mrdp` is the Lean statement (lines 977 and 979). The paragraph "α and β are arbitrary types, possibly empty or infinite. …" is repeated in each of §§4.1–4.9, including sections with no β (§§4.1–4.5); once, in the layer's opening paragraph, would do.

## Earlier findings

The previous review (of 8761a1c) had no finding, so there is nothing to recheck finding by finding. The change since then reorders the README (overview first, scope and supplier contracts at the end) and adds Macintyre's quantifier elimination to §2.2; both were read in full with the rest.

## Verified sound

| Statement | Instances tried | Left side / constructed value | Right side / required value | Result; change |
| --- | --- | --- | --- | --- |
| §2.8 positive-codimension loci null (sample) | Y={x=0}⊂𝔸²; Y=singular point of a nodal curve | zero set of a nonzero analytic function, Haar-null by Fubini; singular locus gets 0 by convention | Groechenig–Wyss–Ziegler Prop. 2.1(a), p.6: `μ_ω(Y(O_F))=0` | Agrees; none |
| §2.10 Néron point counts (sample) | Tate curve, ord Δ=n; Φ=ℤ/3 with σ=−1; S₃ on 𝔽₃³/diag | n(q−1) both sides; `#Φ^G=0=#Φ/(σ−1)Φ`; M^G=0, (M*)^G order 3 | Lorenzini Prop. 4.3, pp.2032–2033; Example 4.4 | Agrees; cyclicity needed, as stated; none |
| §2.6 tail identity `TZ=1+(T−1)A`; `igusa_poincare_rationality` | f=0; f=1; f=x; m=0, f=c; n=0 | 0; T; (1−q⁻¹)T/(1−q⁻¹T); counts 1 or 0; one-element quotient, count 1 | 0; T; same; polynomial or 1/(1−T); 1 | Identity and rationality hold; none |
| §3.4 Presburger functions (sample) | weight L⁻ⁿ on n≥0; on even n; constant 1 on ℕ | (1−L⁻¹)⁻¹; (1−L⁻²)⁻¹; divergent for every q>1 | Cluckers–Loeser §4.2, p.19; Thm 4.4.1, p.21 | Agrees; none |
| §3.7 motivic pushforward (sample) | axioms A0–A8 against the README's list; two-point map | composition, additivity, projection, inclusions, RF, ℤ, annulus `L^(−α−1)`, graphs; push of 1 is 2 | Cluckers–Loeser Thm 10.1.1, pp.59–60; §11 from p.61; Thm 14.1.1, p.78 | Agrees; not a ring map; none |
| §4.3, §4.5 polynomial comparison (sample) | X(X−1) at 0,1,2; X₀−X₁ collapsed; empty α | values 0,0,2; 0 on both sides of renaming; constants only | Mathlib `Dioph.lean` lines 48–51, 93, 197–204, 226–234; Freer `exists_mvPolynomial` | Agrees; none |
| §4.16 `hilbert_tenth_integers` (sample) | p=a−x²; n=0, p=a; four squares at −1 | decidable family; decidable; never −1 | existence of one family only; Poonen p.3 | Statement is existential, not refuted by decidable families; none |
| `Diophantine.mrdp` | S=∅; S=univ; n=0 | 1=0 has no root; 0=0; one-point domain, both sides decidable | r.e. in each case | Agrees; none |
| §4.19–4.20 trace sets (sample) | a,b<0; split algebra; (a,b)=(6,15) at 2 | S⊆[−2,2], T⊆[−4,4]; T=ℚ; triple (1,1,1) gives 69≡5 mod 8 | Koenigsmann Prop. 6, pp.76–78; needs ≡5 mod 8 | Agrees; source's row (1,1,0) gives 3 (see Source issues); none |
| §4.21 prime-class rings | R¹ at (1,3); R³₅ | Δ₍₋₂,₃₎=∅, Δ₍₂,₃₎={2,3}: ℚ; Δ₍₋₁,₋₅₎={2,∞}, Δ₍₂,₋₅₎={2,5}: ℤ_(2) | Prop. 10 with Observation 5 | Both Checks hold; none |
| §4.22 radicals (sample) | Δ′ empty; R=ℤ_(3)∩ℤ_(5) | J=ℚ, not Jac(ℚ)={0}; 3ℤ_(3)∩5ℤ_(5) | Koenigsmann Def. 12, Lemmas 13–14, pp.81–83 | Nonemptiness guard is needed and present; none |
| §4.24 `universal_integers` | t=1/2; t=0; S={3,5}, x=1/3 | rejected at 2; passes; x in ℤ_(5), so in R̃ | R̃=⋃ℤ_(ℓ) (Lemma 17), Prop. 18, p.86 | Union, not intersection, as stated; none |
| §4.25 `forall_exists_rational_undecidable` | z integral with P=0; P=2; z_i=1/2; no coordinates | product −1·nonzero ≠0; w=1/2 kills it; g(1/2,u)=0; Pw−1 | sentence fails exactly on solvable a | Complement of a noncomputable set; none |
| §4.28 `one_universal_variable` | source formula has one ∀p | finite ∧/∨ of Diophantine conditions gives one equation over ℚ | Koenigsmann Cor. 22, pp.90–91 | Agrees; none |
| §4.33 `two_universal_integer_formula` | a=b=1,t=0,u=(1,0,0,0); t=2; a=−1; monomial a²b²u₄⁸ | 0; 4·16=64; guard 0; coefficient 1, degree 12 | Koenigsmann p.79 formula, term by term | Lean body equals the source polynomial; none |
| §4.30 `nonpowers_diophantine` | r=2: −1, 4, 0; r=3: 2, −8 | in, out, out (x≠0 guard); in, out | Colliot-Thélène–Van Geel Thm 4.3, p.16 (r>0, complement in k×) | Agrees; none |
| §1.5 `ax_kochen_ring` | ∃x x²+1=0 at p=2,3,5; ℤ[i] at 5 and 13 | F/T; F/F; T/T; ι=2,3 give 3, 4; 6, 9 | N≥2; O-algebra isomorphism needed | Checks hold; bound depends on φ; none |
| §6.1 `IsOMinimalExpansion` (sample) | ℤ; ℚ; (0,1); empty language | frontier ℤ; ℝ; {0,1}; unary sets finite/cofinite but order undefinable | finite frontier ⇔ finite union of points and intervals | Predicate excludes all wrong models tried; none |
| §6.3 selected expansions (sample) | reducts R_an, R_exp | order, +, · remain definable | van den Dries–Miller §4.2, p.12 (analytic decomposition for R_an,exp); ShimuraVarieties §3.5a has no analytic cells | Gap is not already supplied; none |
| §6.4 components and paths (sample) | hyperbola; [0,∞); topologist's sine curve | 2 components; 1 component from 2 cells; not definable | van den Dries–Miller 4.3, 4.6, p.13; cells connected, p.12 | Agrees; none |
| §6.6 definable atlases (sample) | mixed map direction | φ_j⁻¹∘φ_i for charts into X | Bakker–Klingler–Tsimerman A.2, p.20 (finite atlas, definable overlaps) | Agrees; source prints ψ∘φ⁻¹ (see Source issues); none |
| §6.9 definable Chow (sample) | node branch; {1}⊂ℂ×; unit disc | closed, algebraic; algebraic; not closed analytic in ℂ, excluded | Mok–Pila–Tsimerman Thm 2.2, p.5; Peterzil–Starchenko Cor. 4.5, p.12 | Agrees; none |
| §6.14 `pila_wilkie` (sample) | X_t=(0,1); singleton; n=0 | alg. part all, count 0; count ≤1; counts 0 or 1 | ≤C·T^ε with C≥1 | Holds; source text waived, statement matches Pila 2009 Thm 3.5(3), p.6; none |
| §6.16 `bounded_degree_counting` | √2 at k=1,2; transcendental at T=1; z²−1 on (0,∞) | excluded, admitted (height √2); `absMulHeight₁`=1 but `IsAlgebraic` fails; smaller root −1∉X | Pila 2009 Thm 1.6, p.2; exponent ε/k absorbs 2^kT^k | Holds; branchwise covering needed, as stated; none |
| `algebraicPart` | finite X; X=(0,1); X a point | ∅; X; ∅ | connected semialgebraic with two points ⇔ positive dimension | Agrees with §6.11; none |
| §5.4 product map | q general | `q²(1−q⁻¹)²(1/(1−q⁻¹)²−1)` | 2q−1 | Equal; none |
| §7.1 Checks | g=1 lift; class-number-one list | 3a²≤\|D\|, height ≤2a≤\|D\|; 13 values, 1 not among them | k₁=2, a₁=1; {j₁=1} not special | Hold; none |
| §4.31 (R01) | definition and test in both roadmaps | "every embedding between models elementary"; existential-closure test | SaturationAndQuantifierElimination §2.5, lines 243–254, same two statements | Two owners; settle one |
| §2.10–2.11 (C01) | where Lang's theorem enters | §2.10(b), *Needs* line 474 | contract says §2.11 | Wrong pointer; correct it |

- Source locators checked against the text: 78, in 17 sources (Koenigsmann 14, Cluckers–Loeser 2008 9, Pila–Tsimerman 2014 8, van den Dries–Miller 7, Pila 2009 6, the exponential paper 5, and eleven others).
- Library declarations opened at the pins: 26, among them `NumberField.absMulHeight₁` (`Mathlib/NumberTheory/Height/NumberField.lean` line 136, value 1 on non-integral input), `Rat.mulHeight₁_eq_max` (line 532), `Poly.induction` (`Mathlib/NumberTheory/Dioph.lean` line 197), `TauCeti.IsSemialgebraic` (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean` line 75), `TauCeti.finite_setOf_absMulHeight₁_le` (`TauCeti/NumberTheory/Height/Absolute.lean` line 187).
- Cross-roadmap citations resolved: 45 on main or at open heads (ShimuraVarieties §§3.4b–3.4e, 3.5a, 3.5d and the bridge `exists_oMinimalStructure_definable_iff`; NeronModelsAndSemistableAbelianVarieties §4.6, which says perfectness beyond the semistable case is not asserted; AbelianSchemesAndArithmeticModuliPartII B2.6; HeightsRationalPointsAndObstructions §§2.16b–2.21); one not resolvable (C04).
- Declared gaps: the four slugs agree between `packages/LogicAndDefinabilityInNumberTheory/design/plan.json` and the README; each asks for one statement its supplier does not yet state.
- Automatic checks: all passed on this head. Dependency check, my run: `depcheck: 4 roadmaps, 62 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder is changed.
- Elaboration of `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/Suggested.lean`: eleven `sorry` warnings, nothing else. The 14 elaborated signatures were compared with their README statements; no binder is lost and the file is unchanged since the previous review.
- One-tactic probe on a copy of the file (`first | simp | rfl | infer_instance` for each of the 11 theorems): none closes. All statable headlines of the Summary are stated; the unstatable ones are named in the module docstring.
- Overlap check: read SaturationAndQuantifierElimination, LogicAndDefinabilityInNumberTheoryPartII, AbelianSchemesAndArithmeticModuliPartII, HeightsRationalPointsAndObstructions, RandomGraphs, ShimuraVarieties, ComputabilityTheory; model completeness with Robinson's test is shared with SaturationAndQuantifierElimination and has no single owner (R01); nothing else shared (Part II consumes §§0.1–0.4 here; ShimuraVarieties owns general o-minimality and R_an,exp; B2.6 owns the block decomposition).

Source independence: 33 passages compared with 13 sources, none shared beyond formulas and notation; the closest are §4.30 against the proof of Colliot-Thélène–Van Geel Theorem 4.3 and §2.11 against the proof of Groechenig–Wyss–Ziegler Proposition 2.2 (same steps, own words); largest share `cluckers_loeser_2008`, about 36 of 130 locators; contents compared with `cluckers_loeser_2008`: independent (its §§2, 7–9, 11, 13–15 are spread over Layers 1–3, Layer 3 also carries the transfer paper, and the order of §§3.3–3.8 is forced by their *Needs* lines).

Research link: Layers 1–3 state Ax–Kochen transfer and the motivic integration and transfer of Cluckers–Loeser (2008, 2005) used by Cluckers–Gordon–Halupczok (2014); Layer 4 states Koenigsmann (2016) and Colliot-Thélène–Van Geel (2014); Layers 6–7 give the Pila–Wilkie (2006) and Pila (2009) counting behind Tsimerman (2018) and Gao (2013). Rests on the README's sources and the texts read.

## Not verifiable

- Denef 1984, Theorems 1.1–1.2 (`denef_1984`, uncertified): cited for §2.6 and `igusa_poincare_rationality` over every finite extension of ℚ_p; the text was not read.
- Davis 1973 (`hilbert_s_tenth_problem_is_unsolvable`, uncertified): all locators of §§4.10–4.16 are cited without the text.
- Pila–Wilkie 2006, Theorems 1.8 and 1.10 (`pila_wilkie`, waived): the sampled §6.14 was checked against Pila 2009, Theorems 1.4 and 3.5, instead.
- Bosch–Lütkebohmert–Raynaud §7.3, Proposition 6 (`blr`), Schneider Proposition 6.4 (`schneider`), Hodges §5.3 (`hodges`), and the waived `vd_dr_tame`, `vd_dr_macintyre_marker`, `cl_addenda`: cited by locator only.
- StratifiedSpacesAndTameTopology §§4.1 and 7.1: no text on main or in an open pull request (C04).

## Source issues

- **Error** in koenigsmann_defining_z at the proof of Proposition 6, table for p=2, printed page 78: the source says the row (6,15) uses the triple (1,1,0), whose value −21 is 3 modulo 8; it should be a triple of value 5 modulo 8, for instance (1,1,1) with value 69; affects the proof.
- **Misprint** in koenigsmann_defining_z at the proof of Proposition 10(b), printed page 81: the source says the class-five and class-seven rings have first entries −2p, 2p and −p, 2p; it should be the entries −2, 2 and −1, −2 of Definition 7; affects nothing.
- **Error** in koenigsmann_defining_z at the proof of Proposition 21(d), printed page 89: the source says the set of x with no odd-valuation prime of class 3 is a union of three product sets; it should be signs and powers of 2 times squares times the product of the three; affects the proof.
- **Misprint** in koenigsmann_defining_z at the proof of Corollary 22, printed page 91: the source says the dyadic guard is the class of k modulo the 2-local ring; it should be modulo 8 times that ring; affects nothing.
- **Misprint** in on_the_algebraic_points_of_a_definable_set at Definition 5.1 and Lemma 5.2, author pages 7–8: the source says coefficient vectors have k entries, giving degree at most k−1; it should be k+1 entries, for degree at most k; affects the proof.
- **Gap** in on_the_algebraic_points_of_a_definable_set at the proof of Theorem 5.3, author page 8: the source says blocks covering the projected coefficient family are carried into the fibre by the root sections; it should cover, for each section, the tuples whose chosen root lies in the fibre; affects the proof.
- **Error** in cluckers_loeser_2008 at §15.1, printed page 83: the source says every affine open of a variety is isomorphic to an affine open of affine space; it should use closed embeddings into affine space, an affine elliptic curve being a counterexample; affects the proof.
- **Misprint** in bkt at Appendix A.2, printed page 20: the source says the mixed transition of two atlases is the second chart composed with the inverse of the first; it should be the inverse of the second composed with the first; affects nothing.

## For the human reviewers

- Ownership (R01): this roadmap §4.31 and SaturationAndQuantifierElimination §2.5 (pull request #2866, another author) both build model completeness with Robinson's test. This roadmap is in the merge order; that one is not listed yet.
- Conditional acceptance: once R01 is settled, acceptance rests on four declared gaps not yet stated by their suppliers: NeronModelsAndSemistableAbelianVarieties §4.6, ShimuraVarieties §§3.5a and 3.5d, AbelianSchemesAndArithmeticModuliPartII B2.6 (README lines 1908, 1938, 1940, 1950).
- Licence: §§4.1–4.9 follow the statements of Cameron Freer's public formalisation `Hilbert10/PolyBridge.lean` and `NormalForm.lean` (README lines 1986–1987 give Apache-2.0); `Suggested.lean` declares none of them.
- Wording: the proof plan of §4.30 (line 1250) has the five steps and the notation N_v, D₁, D₂, E, D₃ of the proof of Colliot-Thélène–Van Geel Théorème 4.3 (p.16), condensed from about twenty lines of French to five sentences.
- Not tested: Denef 1984, Davis 1973, Pila–Wilkie 2006, Bosch–Lütkebohmert–Raynaud, Schneider and Hodges are cited by locator without the text (uncertified or waived).
- Scope: the four end theorems of Layer 7 are stated under input data (§§7.1, 7.5–7.7) whose clauses are published theorems that no roadmap plans; the README says so at lines 1725 and 1978.
