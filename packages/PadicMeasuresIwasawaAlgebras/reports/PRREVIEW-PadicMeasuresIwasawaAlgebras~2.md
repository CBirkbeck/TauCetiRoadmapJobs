# Review of PadicMeasuresIwasawaAlgebras (pull request #3183 at 3db587c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 191 changed lines since `94e80af`. I checked the new §6.5a and the passages it relies on (§4.5, §4.6, §6.3, §6.5, the Layer 6 dependencies, the scope and the supplier contracts). The six new statements and their Checks are true as stated: I recomputed every value, including c = 0, c a unit, a a unit, Q = 0, a module that is not finitely presented, and equal characteristic, and every library declaration the proof sketches name exists at the pins with the generality the text claims. The previous review of this same head had no findings; its small corrections stand, since the head has not changed. There are no findings, six small corrections (four on the change, two on untouched text for a separate pull request) and three format notes. Nothing is left for a human to decide.

## C01 — The product formula and the quadratic-case length that §6.5a routes through planned targets are already proved in the pinned Tau Ceti

In the statement on lengths over a discrete valuation ring (line 3773, and its *Needs:* at line 3784) and in the Layer 6 dependencies (line 3954), the product rule is cited as "`fittingIdeal_prod`, §4.5", a target of this roadmap. An implementer would wait for it or prove it again. The pinned Tau Ceti has it, for finite modules, as `TauCeti.fittingIdeal_prod_zero` (`TauCeti/RingTheory/FittingIdeal/Prod.lean`, line 133).

The "In particular" sentence of the statement on lengths at a point (lines 3798–3800) is covered at the pin too: Fitt⁰ = (det φ) is `TauCeti.QuadraticPresentation.fittingIdeal_eq` (`TauCeti/Algebra/Module/Presentation/Quadratic.lean`, line 133), and the length of the cokernel of a square matrix over a principal ideal domain is `Matrix.length_quotient_range_mulVecLin_eq_ord_det` (`TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Length.lean`, line 58).

Naming these three declarations in the two *Needs:* lines and in the Layer 6 dependencies, beside the §4.5 and §6.3 cross-references, is enough.

## C02 — The six statements of §6.5a carry no locator, while the README says every target states its source

The README's opening says "Every target below states its hypotheses and source" (line 57); §6.5a says its statements have "no source in this roadmap's register" (lines 3742–3743). A reader cannot then check the Fitting-ideal facts the sketches rest on, although all of them have exact locators in the Stacks Project, More on Algebra, Section 15.8 (PDF pp. 18–19), which I read:

- Lemma 15.8.2 (Tag 07Z8) computes the k-th Fitting ideal from a presentation indexed by an arbitrary set, which is the case of an infinite family S in the first statement;
- Lemma 15.8.4 (Tag 07ZA) gives Fitt^n = R for n generators (part 1), the product rule and its general form Fitt^l(M ⊕ M′) = Σ Fitt^k(M)·Fitt^{k′}(M′), which the second Check on homomorphisms into O′/a uses (part 2), base change (part 3) and Fitt⁰(R/I) = I (part 8);
- Example 15.8.5 (Tag 07ZB) gives the Fitting ideals of a free module.

Citing these in the section's opening "Built on" sentence (lines 3739–3743) would make line 57 true of the section; the alternative is to qualify line 57.

## C03 — The discrete case of this section's length statement is also asserted in AInfCohomology on main, and neither text points at the other

The new scope bullet (lines 4029–4031) claims "the lengths that Fitting ideals compute at points with values in discrete valuation rings". AInfCohomology on `main`, §AI.1.3 ("Finitely presented modules over a valuation ring and their Fitting ideals", README line 856), computes Fitt₀ of ⊕ V/a_iV over a valuation ring as (a_1⋯a_s), and §AI.6.7 ("Normalized length over a rank-one valuation ring", line 3296) defines a real-valued length as the valuation of Fitt₀ and says that for a discrete valuation ring with uniformizer p it is ordinary module length.

The objects differ (here `Module.length` over a discrete valuation ring of any characteristic, non-torsion modules included, at points of an arbitrary ring; there a normalised real valuation over rank-one valuation rings of mixed characteristic), so each roadmap keeps its own statement. One clause in the scope bullet would tell a reader where the other case lives: "the normalised length over rank-one valuation rings is AInfCohomology §AI.6.7, whose discrete case is the statement here".

## C04 — Two sentences of the description do not describe this head

"Layer 6 already owns the higher Fitting ideals this needs." §6.5 at this head (lines 3682–3686) says they are Tau Ceti's `TauCeti.fittingIdeal`, "consumed, not restated". Right would be: "Layer 6 already builds on Tau Ceti's higher Fitting ideals (§6.5)".

"Nothing else changes except the overview, the layer opening, the scope list and the dependency lists that name the layer's contents." The change also edits the opening of §6.5 (line 3700, which now names §6.5a), the Mathlib row "algebra, p-adics and topology" of the supplier contracts (line 4150) and the paragraph on the Fitting-ideal carrier shared with StableReduction (lines 4186–4187). Adding these three places completes the list.

## C05 — Untouched text: items of §4.5 and §6.3 that the pinned Tau Ceti now proves should name their declarations

For a separate pull request. Four items are proved at the pin, each for finite modules where `Suggested.lean` assumes finite presentation:

| Item | README | `Suggested.lean` | Pinned Tau Ceti |
|---|---|---|---|
| Fitt⁰ ⊆ Ann | §4.5, line 2472 | line 606 | `TauCeti.fittingIdeal_zero_le_annihilator` (`RingTheory/FittingIdeal/Determinant.lean`, line 143) |
| Fitt⁰ of a product | §4.5, line 2472 | line 609 | `TauCeti.fittingIdeal_prod_zero` (`RingTheory/FittingIdeal/Prod.lean`, line 133) |
| Fitt⁰ = R iff M = 0 | §4.5, line 2473 | line 613 | `TauCeti.fittingIdeal_zero_eq_top_iff` (`RingTheory/FittingIdeal/BaseChange.lean`, line 208) |
| Fitting ideal of a quadratic presentation | §6.3, lines 3537–3540 | line 923 | `TauCeti.QuadraticPresentation.fittingIdeal_eq` (`Algebra/Module/Presentation/Quadratic.lean`, line 133) |

Each item stays in its layer with its statement and gains an *In Tau Ceti:* line; its `sorry`'d restatement would leave `Suggested.lean`.

## C06 — Untouched text: the matrix form of §6.5 cites a paragraph of Dasgupta–Kakde that only fixes notation

For a separate pull request. The statement that Fitt^i is generated by the (n − i)×(n − i) minors (lines 3703–3709) cites "Dasgupta–Kakde, Appendix B.2, first paragraph, p. 93". That paragraph introduces the notation for the i-th Fitting ideal of a finitely presented module and the convention that the bare symbol means the zeroth; it does not describe the ideal by minors. The description by minors is Stacks Lemma 15.8.2 (Tag 07Z8) with the proof of part (4) of Lemma 15.8.4 (Tag 07ZA), which would be the right locator.

## N01 — The new section writes sub- and superscripts in TeX style outside code spans

For example `Σ_{j≥0} c^j·Fitt^j_P(Q)` at line 3746 and `π^{min(ℓ, v(a))}O′/aO′` at line 3839. This is the style of the whole README on `main`, so Unicode or code spans are a matter for the file as a whole.

## N02 — Untouched text: `Suggested.lean` has admitted `example`s, `letI` in theorem signatures, and `[Fintype K]` beside `[Field K]`

For a separate pull request. An `example` closed by `sorry` (the first at lines 100, 104, 141, 180) tests nothing: prove it or keep it as a README Check. The `letI` binders at lines 50–60, 125 and 266 would be instance binders, and line 295 would use `[Finite K]`.

## N03 — Untouched text: a pull-request number stands in the README

For a separate pull request. "MassFormula #226" with its link appears in §6.3 (line 3604) and in the table of downstream consumers; a roadmap is cited by name and section.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| Valuation conventions (lines 3727–3732) | J = 0, π^kO′, J + J′, bJ with b = 0; image of an ideal I | ∞; k; min; v(b)+v(J), ∞ at b = 0; generated ideal has valuation min over d ∈ I | true; `idealOrderIsoENat : Ideal R ≃o ENatᵒᵈ` at pin |
| Fitt⁰(Q/cQ) = Σ_j c^j·Fitt^j(Q) | P/(b); P²; c = 0; c unit; Q = 0; ℤ/2⊕ℤ/2 with c = 2 | (b,c) = (b)+cP; (c²) = 0+0+c²P; Fitt⁰(Q) both sides; P = P; P = P; (4) = (4)+2(2)+4ℤ | true; Laplace step and k = 0 term checked |
| length(Y) = v(Fitt⁰ Y) over O′ | (O′/π)²; O′ × O′/π; 0; 𝔽_p⟦t⟧/t²; ℂ⟦t⟧/t² | 2 = v(π²); ∞ = v(0); 0 = v(O′); 2 = 2; 2 = 2 with infinite residue field | true |
| charIdeal(Y) = π^{length Y} for A = O′ (§4.6) | torsion Y over O′ | single height-one prime πO′, localisation is Y, exponent length(Y) | true; matches the definition at `Suggested.lean` line 476 |
| #Z = (#k′)^{length Z} | ℤ_p/p², ℤ_p/p ⊕ ℤ_p/p | p² = p²; p² = p² | true |
| length(O′ ⊗_x Q) = v(x(Fitt⁰_P Q)) | Λ/(T) at x_u; ℤ → ℤ_p with ℤ/p², ℤ/q; Q = P | v_p(u) both sides, ∞ at u = 0; 2 = 2; 0 = 0; ∞ = ∞ | true; base change at pin needs only `Module.Finite` |
| Quadratic case v(x(det φ)) | φ = diag(π, π²); φ with x(det φ) = 0 | 3 = v(π³); ∞ = ∞ | true |
| (i) Hom_P(Q, O′/a), length of Y/aY | O′/π², a = π; O′, a = π²; a unit | 1 = 1; 2 = 2; 0 = 0 | true; `liftBaseChangeEquiv` is linear over the larger ring at pin |
| (ii) min_j (j·v(a) + v(x(Fitt^j))) | O′ × O′/π³ × O′/π, a = π²; O′/π², a = π; a unit | ∞, 6, 5, 6 → 5 = 2+2+1; min(2, 1) = 1; 0 at j = n | true; argmin r + #{e_i > v(a)} rederived |
| (iii) aY = 0 gives length(Y) | O′/π, a = π; negative control O′/π², a = π | 1 = 1; 1 ≠ 2 | true; hypothesis needed |
| Points with values in O′/a | P̄ = O′/a with P̄, P̄², P̄/π; a unit | ideals 0, 0, (π); min(ℓ, v(a)) = v(a), v(a), 1; zero ring, ℓ = 0 | true |
| One element for all points | ℤ_p[T], P/(T), c = p at T ↦ 0 and T ↦ 1; x₀(c) = 0 | 1 by d = p, ∞ by d = T; 0 by d = T, 1 by d = p; j = 0 term uses c⁰ = 1 | true |
| §4.5 product rule (as cited by §6.5a) | ℤ/2 ⊕ ℤ/2 | (4) = (2)(2) | true; Stacks 07ZA (2); at pin |
| §6.3 Fitt⁰ = (det φ) (as cited) | R/(a); R^m with φ = 0 | (a); 0 | true; Dasgupta–Kakde §2.3, p. 16; at pin |
| §6.5 matrix form (as cited) | diag(a, b) | (ab), (a, b), R | true; locator is C06 |

- Source locators checked against the text: 8 (Stacks More on Algebra Lemmas 15.8.1, 15.8.2, 15.8.4 parts 1, 2, 3, 6, 8, Example 15.8.5, PDF pp. 17–19; Dasgupta–Kakde §2.3 p. 16 and Appendix B.2 p. 93, arXiv v3). Of the seeded sample only §6.5 and §6.5a fall in changed or affected text.
- Mathlib declarations opened at the pin: 5 (`IsDiscreteValuationRing.addVal`, `RingTheory/DiscreteValuationRing/Basic.lean` line 402; `idealOrderIsoENat`, line 510; `length_quotient_pow_maximalIdeal`, line 550; `Module.equiv_free_prod_directSum`, `Algebra/Module/PID.lean` line 255; `LinearMap.liftBaseChangeEquiv`, `LinearAlgebra/TensorProduct/Lift.lean` line 31).
- Tau Ceti declarations opened at the pin: 11 (`fittingIdeal`, `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_eq_top_of_surjective`, `fittingIdeal_eq_bot_of_lt_finrank`, `fittingIdeal_quotient_zero` in `Basic.lean`; `fittingIdeal_eq_minorsIdealOfSet`, `Generators.lean` line 100; `fittingIdeal_baseChange` and `fittingIdeal_zero_eq_top_iff`, `BaseChange.lean`; `fittingIdeal_prod_zero`; `fittingIdeal_zero_le_annihilator`; `QuadraticPresentation.fittingIdeal_eq`; plus `Matrix.length_quotient_range_mulVecLin_eq_ord_det`).
- Record: the README at the merge base against the head: no layer or item removed, renumbered or reduced; 6.5a is a new id; the 13 deleted lines are rewritten sentences that keep their content. No file changed outside the folder.
- Cross-roadmap citations: the new text adds none; its internal citations of §4.5, §4.6, §6.3 and §6.5 resolve to statements that say what is cited. No other roadmap cites §6.5a.
- Dependency check: `depcheck: 94 roadmaps, 1067 edges, 0 problem(s)`; no UPWARD and no CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` (unchanged by this pull request) exits 0 with 104 warnings, all "declaration uses `sorry`". The one-tactic probe was not run: the change adds or alters no Lean declaration.
- Headline theorems: the four of the overview (measures and ℤ_p⟦Γ⟧, the structure theorem, the growth formula, determinants and characteristic ideals) are untouched; §6.5a adds layer statements specified in the README only, as line 57 allows, and no headline.

Overlap check: read IntegralIwasawaTheory, InertAnticyclotomicCMMainConjecture, DirichletPadicLFunctions, EulerSystemsAndKolyvaginSystems and SelmerIwasawaCohomology (open), PadicFunctionalAnalysis, ColemanPowerSeries and LocallyAnalyticDistributions (main), and by object AInfCohomology and FiniteFlatGroupsAndIntegralPadicHodgeTheory (main). None states the quotient formula or lengths at points. Lengths from Fitt₀ over valuation rings: AInfCohomology §AI.1.3 and §AI.6.7 own the normalised real-valued length over rank-one valuation rings; this roadmap owns `Module.length` over discrete valuation rings at points of an arbitrary ring (C03). EulerSystemsAndKolyvaginSystems and FiniteFlatGroupsAndIntegralPadicHodgeTheory use the discrete fact inside proofs and own nothing here.

Source independence: changed passages only; 6 passages (the six statements with their sketches) compared with 2 sources, Stacks More on Algebra §15.8 and Dasgupta–Kakde §2.3 and Appendix B.2, none shared beyond formulas; largest share RJW, about 60 of 140 locators, unchanged by this pull request; contents not compared, since the change adds, removes and reorders no layer.

Research link: Layer 6 is the Fitting-ideal algebra of Dasgupta and Kakde, On the Brumer–Stark conjecture (arXiv 2010.00657v3, 2022), §2.3 and Appendix B; §6.5a adds the lengths that Fitting ideals give at points in discrete valuation rings, as used for Selmer modules with torsion coefficients. Rests on the README overview and on Dasgupta–Kakde §2.3.

## Not verifiable

- none

## Source issues

- **Misprint** in Stacks07ZA at More on Algebra, Lemma 15.8.4 (Tag 07ZA), proof of part (2), PDF p. 19: the source says the part "follows form" the corresponding statement on minors; it should be "follows from"; affects nothing.
- **Misprint** in DasguptaKakde at §2.3, first paragraph, p. 16: the source defines "quadratically presented" for a module named M, while the displayed sequence ends in N; it should use one name; affects nothing.

## For the human reviewers

- none
