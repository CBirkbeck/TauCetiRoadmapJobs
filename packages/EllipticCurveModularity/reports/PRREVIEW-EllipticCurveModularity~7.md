# Review of EllipticCurveModularity (pull request #1018 at ed6ed86)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or worked value in the folder was found false, the Lean file elaborates with `sorry` as its only warning, and every supplier section cited exists and says what is claimed of it. There are five small corrections (the description's dependency text, a supplier whose text still describes the earlier existence route, one misplaced locator, two unused table rows, two unused Lean definitions) and five format notes, none blocking. Two points are left to the human reviewers: existence now rests only on EllipticCurveModularityTotallyReal §4.4, whose own main sources are two unrefereed drafts of October 2026, and the Provenance section's external formalisation was not opened.

## C01 — The description's dependency text describes the earlier existence route

A reader of the description is told to wait for roadmaps this README no longer cites and is not told of the one it now depends on. The sentence "The open pull requests that must merge first are in the merge order below" is followed by a list and a chain that name ClassicalSerreModularity, SerreWeightAndLevelOptimisation and FiniteFlatGroupsAndIntegralPadicHodgeTheory; none of these names occurs in `TauCetiRoadmap/EllipticCurveModularity/README.md` at this head. The supplier that existence now comes from, EllipticCurveModularityTotallyReal (README lines 514–535 and 631–633), is in neither list, although the description's own summary names it.

The smallest change: regenerate the dependency list and the merge-order chain from this head, so that they contain EllipticCurveModularityTotallyReal with its chain and drop the three roadmaps above, and replace "everything else named in the README is a consumer" by a sentence that is true of the new list.

## C02 — The supplier still says this roadmap does not use its case K = ℚ

The two roadmaps now contradict each other about who supplies existence. This README takes the attached newform from EllipticCurveModularityTotallyReal §4.4 at `K=ℚ`. That roadmap, at its open head, says in its Summary (`TauCetiRoadmap/EllipticCurveModularityTotallyReal/README.md`, lines 38–41) that this roadmap obtains the newform "from classical Serre modularity; that roadmap does not use this case", and repeats it under "Outside this roadmap" (lines 1223–1227: "in Layer R29.3 … without this roadmap").

Nothing in this folder is wrong; the direction of supply is single (no citation back from that roadmap or from its suppliers was found, and the dependency check reports no cycle). The two sentences in the supplier need the matching revision, so that a reader of either text finds the same owner: §4.4 there, consumed by R29.3 here.

## C03 — Serre's Lemme 5 does not state the subgroup dictionary it is cited for

In "Cyclic subgroups and their Galois stability" (line 225) the API relating prime-order stable subgroups to residual invariant lines and to kernels of rational cyclic isogenies is located at "Serre §4.6, Lemme 5, p. 207". That lemma (serre lines 1266–1268) asserts that for large `p` the representation on `E[p]` is irreducible and has conductor `N`; it contains no statement about subgroups, lines or kernels. The two supplier citations in the same parenthesis carry the API on their own. Remove the Serre locator there, or attach it to what it supports (the absence of a stable line for large p).

## C04 — Two rows of the model table are used by no Check

"Concrete models used in the Checks" (lines 301–319) lists 26b1 and 274a1, and neither label occurs anywhere else in the README, so the section's title is not true of them and a reader looks in vain for the Checks they serve. Their displayed values are correct (Δ = −1664, c₄ = 129; Δ = −17536, c₄ = 337, recomputed). Delete the two rows, or say which Check uses each.

## C05 — `HasGoodReductionAt` and `HasMultiplicativeReductionAt` are declared but no statement uses them

`Suggested.lean` lines 55–61 define the two predicates, and none of the twelve theorems mentions either, so as targets they ask an implementer for nothing and the file keeps definitions that make no headline statable. Two repairs are available. One is to move them to the README as proposed names. The other, which uses them, is to state the part of "the level is the conductor" that is statable at the pins: for an attached `F` of level `M` and a prime ℓ, `ℓ ∣ M` exactly when `E` does not have good reduction at ℓ, and `ℓ ∣ M ∧ ¬ ℓ² ∣ M` exactly when it has multiplicative reduction there (R29.4 with NeronModelsAndSemistableAbelianVarieties §5.3g).

## N01 — R29.2's first theorem needs R29.4

The theorem that an attached form is residually attached at every prime uses the exact level and the all-coefficient comparison of R29.4 (stated at lines 376–377 and 408), so Layer R29.2 is not buildable before Layer R29.4. There is no cycle (R29.4 does not use R29.2); the guide to the layers could say that R29.2's definition comes first and its theorem after R29.4.

## N02 — Three links into ModularForms point at headings that are no longer there

The links to `#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`, `#layer-7-l-functions` and `#layer-8g-galois-stability-the-character-field-and-rationality` (lines 485, 571, 1352) land at the top of the page: on main those layers are "cross-level strong multiplicity one", "sharp L-series convergence" and §8.2. The citations themselves stay valid, since `TauCetiRoadmap/ModularForms/README.md` lines 330–345 map the earlier labels (Layer 7 to Tau Ceti's `CuspForm.frickeCompletedL_functional_equation`, Layer 8G to §8.2).

## N03 — Pinned declarations behind "supplied" facts are not named, and one name lacks its namespace

Multiplicativity of `WeierstrassCurve.LFunction` and its value 1 at 1, called "supplied" at lines 147–148 and used in the summability bound, are `WeierstrassCurve.isMultiplicative_LFunction` and `WeierstrassCurve.LFunction_apply_one` (`TauCeti/AlgebraicGeometry/EllipticCurve/LFunction.lean`, lines 76 and 81); the four-case reading of the local polynomial is `WeierstrassCurve.localPolynomial_eq_of_hasGoodReduction` and `…_of_not_hasGoodReduction` (`LocalPolynomial.lean`, lines 133 and 144). The cross-level theorem of the contracts table is `HeckeRing.GL2.Newform.level_eq_and_coe_eq_of_forall_notMem_prime_eigenvalue_eq`.

## N04 — Five lines of `Suggested.lean` exceed 100 characters

Lines 108, 110, 115, 117 and 123 (the signatures and docstrings of the three `IsNewformOf` theorems of R29.3 and R29.4).

## N05 — RankZeroOneBSD is named as a consumer but is no roadmap

Line 1504 and the description name RankZeroOneBSD; on main and among the open roadmaps there is only RankZeroOneBSDPartII, so a reader cannot find the consumer meant.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Hauptmodul relations (`three_isogeny_j`, `five_isogeny_j`) | 11a1 with v=−1/11; u=−3, −27; u=0, v=0; j=1728 | both sides 122023936/1771561; j=0 twice; 729=0 and 125=0 impossible; discriminants 432 and 80 nonsquare | holds | none |
| The 15-isogeny boundary (`fifteen_isogeny_j`) | four j-values; curve y²=x³−x²−8x+112 | 25·241³=349938025, 5·29³=121945, 5·211³=46969655; v₅=2,2,1,1; Δ=−2¹³5⁴, c₄=400, j=−25/2, additive at 5 | holds | none |
| Curve-level residual attachment | 11a1 at p=5 and p=3, Frobenius at 2 | a₂=−2: mod 5 trace 3, det 2, (X−1)(X−2); mod 3 trace 1, det 2 against trivial 2, 1 | holds | none |
| Conductor specialization | 11a1, 37a1, y²=x³−x | Δ=−11⁵, 37, 64; conductors 11, 37, 32; bad-prime product 2 ≠ 32 | holds | none |
| R29.1 rational endomorphisms (`rationalEndomorphisms_eq_int`) | [−2]; multiplication by i on y²=x³−x; zero map | scalar −2, degree 4; scalar i ∉ ℚ; scalar 0, degree 0; `End` is a ring of homomorphisms | holds | none |
| R29.1 rational cyclic subgroups | p=0, 1; 162b1 order 7; 11a1 orders 3, 7 | no finite subgroup of card 0; ψ₇ ≡ 0 mod x³−3x²+3, doubling permutes roots; #E(𝔽₅)=6; X²+2X+2 irreducible mod 3 and 7 | holds | C03 (locator) |
| Exhaustive Γ₀ decomposition | N′=1, 22, Mq², 23 | dimension 0; σ₀(2)=2 gives 2; σ₀(q²)=3; one orbit over ℚ(√5), dimension 2 | holds | none |
| Elliptic coefficient summability (`LFunction_LSeriesSummable`) | 11a1 over ℚ, ℚ(√17), ℚ(√5), ℚ(√2); s=7/4, 3/2 | a₄=2≤6; norm 2: −4, bound 4√2; norm 4: 8, bound 20; inert 0; ramified −2; exponents 5/4, 1 | holds | N03 |
| Attachment and uniqueness (`IsNewformOf`) | 37a1 against f₁₁; level 22 | a₃=−3 against −1; S₂(Γ₀(22)) of dimension 2 is two old copies, new part 0 | holds | none |
| `IsNewformOf.coeff_int`, `IsNewformOf.coeff_eq` | n=0, 1; 11a1 at 4, 6, 121 | 0=0; 1=1; a₄=2, a₆=2, a₁₂₁=1 (good recurrence would give −10) | holds | none |
| `IsNewformOf.localPolynomial_eq` | 11a1 at 7 and 11; 37a1 at 37; y²=x³−x at 2 | 1+2T+7T² (10 points); 1−T; −c₆=216≡31 nonsquare mod 37, 1+T; 1 | holds | none |
| `span_range_rationalTateRep` | CM curve, r=5; sum of two characters | conjugation exchanges the two lines, span M₂; diagonal image spans dimension 2 of 4 | holds | none |
| Existence and `modularity` | supplier §4.4 at K=ℚ, §4.2 items 6, 7; 11a1 | t₃=a₃=−1, s₃=1; trivial central character gives χ=1; newvector level the conductor | holds as supplier contract | C01, C02 |
| Completed L-series (both theorems) | 11a1; s=7/4 | Fricke −1 gives sign −(−1)=+1; N^(−s/2)(2π)^s/Γ(s) entire; literal series only for Re s>3/2 | holds | none |
| Modular parametrisation | 11a1, 11a3, 37a1 | degrees 1; 5n² with minimum 5; quotient isogeny an isomorphism, map of degree 2 | holds | none |
| Twist Check of R29.3 | twist of 11a1 by −1 | Δ=4096·(−161051), c₄=16·496; a₃,a₅,a₇,a₁₃=1,1,2,4 = χ₋₄·(−1,1,−2,4) | holds | none |
| Model table | nine rows | every Δ and c₄ recomputed equal to the table | holds | C04 |
| Rational Tate surjectivity | identity; E×E→E; [r] | identity; projection on summands; cokernel r² on T_r, isomorphism on V_r | holds | none |
| Vanishing of an algebraic integer | α=2 at one prime; integer 6 | 2∈(2) and 2≠0; divisors of 6 bounded by 6 | holds | none |

- Source locators checked against the text: 21, in 9 sources (serre, serre1970, brumer-kramer, milne, ribet-stein, barrios, ddt, gonzalez-jimenez-lario, and Cremona's Chapter II and Carayol read from the author's page and Numdam).
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): 19, among them `WeierstrassCurve.localPolynomial` and `LFunction` (`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` 43, 79), `ArithmeticFunction.eulerProduct` (`LFunction.lean` 260), `Newform.level_eq_and_coe_eq_of_forall_notMem_prime_eigenvalue_eq` (`StrongMultiplicityOne.lean` 451), `HeckeRing.GL2.Newform` (`Newform.lean` 104), `pointGaloisAction` (`Affine/Point/Galois.lean` 60), `tateModuleGaloisRepresentation` (`TateModule/Galois.lean` 80), `AbelianVariety.End` (`End/Basic.lean` 74), `hasse_bound` (`HasseBound.lean` 57).
- Cross-roadmap citations resolved: 16 roadmaps, the load-bearing sections read in full (EllipticCurveModularityTotallyReal §§4.2, 4.4; GL2AutomorphicRepresentationsAndTransfer R16.6.1–R16.6.2; AutomorphicGaloisRepresentations §§3.10, 6.1, 6.4; NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g, 5.3i; ModularCurvesPartII §§16.2–16.7, 17.3; FaltingsFinitenessAndIsogenyTheorems R28.6.1, R28.6.3, R28.6.4; AlgebraicModularFormsAndSerreWeights §7.5).
- Dependency check: `depcheck: 211 roadmaps, 2271 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 12 `sorry` warnings and nothing else; no `set_option`, no sorry'd data, imports are `Mathlib` and four existing Tau Ceti modules.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`) on a copy: none of the 12 theorems closes. Elaborated types of all 19 declarations compared with the README: no section binder lost.
- Headlines statable and stated: 12; not statable and named in the module docstring: exact conductor level, residual attachment, Tate comparison, quotient isogeny, parametrisation, Γ₀ decomposition, converse.
- Automatic checks: all passed at this head.

Overlap check: read EllipticCurveModularityPartIIGL2TypeAbelianVarieties, EllipticCurveModularityPartII, EllipticCurvePeriodsAndModularParametrizations, EllipticCurveModularityTotallyReal, AutomorphicGaloisRepresentations, AlgebraicModularFormsAndSerreWeights, ModularForms, ModularCurvesPartII (the third list is empty); existence of the newform over ℚ: EllipticCurveModularityTotallyReal §4.4, consumed here; residual attachment predicate: AlgebraicModularFormsAndSerreWeights §7.5; the quotient `A_f⁰`: ModularCurvesPartII §16.5; elliptic coefficient summability: here, consumed by EllipticCurvePeriodsAndModularParametrizations §3.1; the J₁ decomposition of the GL₂-type roadmap's §1.6 and the J₀ decomposition of R29.6 are different objects.

Source independence: 16 passages compared with 9 sources, none shared beyond formulas and standard names; largest share Cremona, 12 of 54 locators; contents compared with Cremona Chapter II (§§2.1–2.15): independent.

Research link: The headline is the modularity theorem for elliptic curves over ℚ in Serre's 1987 formulation (§4.6, Theorem 4), with Carayol 1986 for conductor and local factors and Faltings 1983 for the isogeny; existence is imported from the totally real case (README, R29.3 and References).

## Not verifiable

- Silverman, AEC (III.1, III.4–III.5, III.9, V.1.1, VII.1, VII.5): no legal copy read; the facts cited are standard and the Hasse bound was read at the pin instead.
- Faltings 1983, §5 (Satz 3, Satz 4, Korollar 1, 2, pp. 360–361) and Miyake, Theorem 4.6.19: texts not read; the statements used were read in the supplier sections and in the pinned theorem.
- The Provenance section's account of `LeanPool/lean-pool` (file count, licence, the named declarations): repository not opened.

## Source issues

- **Error** in gonzalez-jimenez-lario at §19.1, printed page 93: the source says the four noncuspidal rational points of X₀(15) are CM points; it should be that they are non-CM points, their j-invariants not being integers; affects nothing.

## For the human reviewers

- Scope: existence of the attached newform (headline `modularity`) is taken only from EllipticCurveModularityTotallyReal §4.4, whose References give as main sources a discussion draft of 7 October 2026 and a preprint of 4 October 2026; README lines 1662–1663 cite no refereed proof of existence.
- Licence: the Provenance section (README lines 1394–1446) maps targets to the Apache-2.0 folder `LeanPool/FLTEichlerShimura`, and lines 256–257 and 368–369 say two choices follow the Imperial College London FLT project; neither repository was opened, so agreement of Lean declarations with them is unchecked.
