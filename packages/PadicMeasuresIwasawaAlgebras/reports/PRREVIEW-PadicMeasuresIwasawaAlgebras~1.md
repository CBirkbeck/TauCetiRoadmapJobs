# Review of PadicMeasuresIwasawaAlgebras (pull request #3183 at 3db587c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 191 changed lines since `94e80af`. I checked the new §6.5a and the passages it relies on: §4.5, §4.6, §6.3, §6.5, the Layer 6 dependencies and the scope. All six new statements and their nine Checks are true as stated; I recomputed each value, including the degenerate cases c = 0, c a unit, a a unit, Q = 0, non-finitely presented Q and equal characteristic. The proof sketches use only library declarations that exist at the pins. There are no findings. There are six small corrections: four on the change (library declarations the new text should name, missing locators, a cross-reference to AInfCohomology, the description) and two on untouched text for a separate pull request. There are two format notes. Nothing is left for a human to decide.

## C01 — The product formula and the quadratic-case length formula that the new section routes through planned targets are already in the pinned Tau Ceti

The section on lengths over a discrete valuation ring (line 3773, *Needs:* at line 3784) cites the product rule as "`fittingIdeal_prod`, §4.5". The Layer 6 dependencies (line 3954) cite it the same way. The description says this is the one cited name missing from the pins. An implementer would therefore wait for a §4.5 target, or prove it again. In fact the pinned Tau Ceti proves the statement, for finite rather than finitely presented modules, as `TauCeti.fittingIdeal_prod_zero` (`TauCeti/RingTheory/FittingIdeal/Prod.lean`, line 133).

The "In particular" sentence of the statement on lengths at a point (lines 3798–3800) is also covered at the pin. It reads off v(x(det φ)) from the Fitting ideal of a quadratic presentation. That Fitting ideal is `TauCeti.QuadraticPresentation.fittingIdeal_eq` (`TauCeti/Algebra/Module/Presentation/Quadratic.lean`, line 133). The length of the cokernel of a square matrix with nonzero determinant over a principal ideal domain is `Matrix.length_quotient_range_mulVecLin_eq_ord_det` (`TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Length.lean`, line 58). Its `Ring.ord` is `IsDiscreteValuationRing.addVal` by Mathlib's `Ring.ord_eq_addVal`.

The fix is to name these three declarations in the two *Needs:* lines and in the Layer 6 dependencies, keeping the §4.5 and §6.3 cross-references if you wish. The description's sentence would then read: "Every Mathlib and Tau Ceti declaration named in the new text is in the pinned copies; the product formula of §4.5 is `TauCeti.fittingIdeal_prod_zero` there."

## C02 — The six statements of §6.5a carry no locator, though the README promises one for every target and the inputs have exact ones

The README's opening says that "Every target below states its hypotheses and source" (line 57). §6.5a instead says its statements have "no source in this roadmap's register" (lines 3742–3743), so a reader cannot check the Fitting-ideal facts the proofs rest on. Those facts are all in the Stacks Project, More on Algebra, PDF pp. 18–19:

- Lemma 15.8.2 (Tag 07Z8) computes Fitt_k from a presentation indexed by an arbitrary set J. This is exactly the case of an infinite family S in the first statement.
- Lemma 15.8.4 (Tag 07ZA) gives, in part (1), Fitt_n = R for n generators; in part (2), the product rule, including the general Fitt_l(M ⊕ M′) = Σ_{k+k′=l} Fitt_k(M)·Fitt_{k′}(M′) that the second Check on homomorphisms into O′/a (line 3832) needs; in part (3), base change; and in part (8), Fitt⁰(R/I) = I.
- Example 15.8.5 (Tag 07ZB) gives the jumps of a free module.

Citing these in the section's opening "Built on" sentence (lines 3739–3742) would make line 57 true again. The alternative is to qualify line 57.

## C03 — The new scope bullet and AInfCohomology on main both assert the comparison of module length with the valuation of Fitt⁰ over a discrete valuation ring

The new scope bullet (lines 4029–4030) claims "the lengths that Fitting ideals compute at points with values in discrete valuation rings". AInfCohomology on main owns two related statements:

- In §AI.1.3 ("Finitely presented modules over a valuation ring and their Fitting ideals"), it owns the diagonal form of finitely presented modules over a valuation ring and their Fitt₀.
- In §AI.6.7 ("Normalized length over a rank-one valuation ring"), it defines val_V(M) as the valuation of Fitt₀(M). It also says that for V a discrete valuation ring with uniformizer p, val_V(M) is ordinary module length.

That last sentence is a special case of this section's statement on lengths over a discrete valuation ring. The objects differ: Module.length over a discrete valuation ring of any characteristic here, a normalised real valuation over rank-one valuation rings there. So this is not a second owner. Still, a reader of either roadmap cannot tell where the other case lives. One clause in the scope bullet would keep a single owner for each case: "the normalised length over non-discrete rank-one valuation rings is AInfCohomology §AI.6.7, whose discrete case is the statement here".

## C04 — Two sentences of the description do not describe this head

"Layer 6 already owns the higher Fitting ideals this needs." The head's §6.5 (lines 3682–3686) says the higher Fitting ideals are Tau Ceti's `TauCeti.fittingIdeal` and are "consumed, not restated". Better: "Layer 6 already builds on Tau Ceti's higher Fitting ideals (§6.5)".

"Nothing else changes except the overview, the layer opening, the scope list and the dependency lists that name the layer's contents." The change also edits the opening of §6.5 (line 3700, which now names §6.5a) and the paragraph on the Fitting-ideal carrier shared with StableReduction (line 4186). Adding "§6.5's opening sentence and the shared-carrier paragraph" would make the list complete.

## C05 — Untouched text: §4.5 and §6.3 items that the pinned Tau Ceti now proves should name their declarations, and their `sorry`'d restatements should leave `Suggested.lean`

This is for a separate pull request. Four items are proved at the pin:

| Item | README | `Suggested.lean` | Pinned Tau Ceti |
|---|---|---|---|
| Fitt⁰ ⊆ Ann | §4.5, lines 2471–2478 | line 606 | `TauCeti.fittingIdeal_zero_le_annihilator` (`RingTheory/FittingIdeal/Determinant.lean`, line 143) |
| Fitt⁰ of a product | §4.5, lines 2471–2478 | line 609 | `TauCeti.fittingIdeal_prod_zero` (`Prod.lean`, line 133) |
| Fitt⁰ = R iff M = 0 | §4.5, lines 2471–2478 | line 613 | `TauCeti.fittingIdeal_zero_eq_top_iff` (`BaseChange.lean`, line 208) |
| Fitting ideal of a quadratic presentation | §6.3, lines 3537–3540 | line 923 | `TauCeti.QuadraticPresentation.fittingIdeal_eq` (`Algebra/Module/Presentation/Quadratic.lean`, line 133), on Tau Ceti's own `TauCeti.QuadraticPresentation` (line 87 of the same file) |

The pinned versions need only finite modules where the restatements assume finite presentation. Each item would stay in its layer with an *In Tau Ceti:* line, and its `sorry`'d restatement would leave `Suggested.lean`.

## C06 — Untouched text: the matrix form of §6.5 cites a paragraph of Dasgupta–Kakde that only fixes notation

This is for a separate pull request. The statement that Fitt^i is generated by the (n − i)×(n − i) minors (lines 3703–3711) cites "Dasgupta–Kakde, Appendix B.2, first paragraph, p. 93". That paragraph only introduces the notation Fitt^i_R(M) and the convention Fitt = Fitt⁰. The minors description is Stacks Lemma 15.8.2 (Tag 07Z8), which §4.5 already cites; it would be the right locator.

## N01 — The new section writes sub- and superscripts in TeX style outside code spans

The new section has 30 such lines, for example `Σ_{j≥0} c^j·Fitt^j_P(Q)` at line 3746 and `π^{min(ℓ, v(a))}O′/aO′` at line 3839. This is the style of the rest of the README (361 such lines on `main`), so Unicode or code spans are a matter for the whole file.

## N02 — Untouched text: `Suggested.lean` has 36 `example`s closed by `sorry`, `letI` in theorem signatures, and `[Fintype K]` beside `[Field K]`

This is for a separate pull request.

- An admitted `example` (the first at lines 100, 104, 141 and 180) tests nothing. Each would be proved or moved to the README as a Check.
- The `letI` binders at lines 50–60, 125 and 266 would be named instances or instance binders.
- Line 295 would use `[Finite K]`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| Valuation conventions (lines 3727–3732) | J = 0, π^kO′, J + J′, bJ; x(I) for I ideal of P | v(0)=∞; v(π^k)=k; min rule; v(b)+v(J); ideal generated by x(I) has valuation min over d∈I | true; `idealOrderIsoENat : Ideal R ≃o ℕ∞ᵒᵈ` at pin |
| Fitt⁰(Q/cQ) = Σ_j c^j Fitt^j(Q) | Q = P/(b); Q = P²; c = 0; c unit; Q = 0; P = k[x₁,x₂,…], Q = P/(x_i), c = x₁ | (b,c)=(b)+c·P; (c²)=0+0+c²P; c=0: Fitt⁰(Q); unit: P=P; P=P; (x_i)=(x_i)+x₁P | true; Laplace step checked |
| length(Y) = v(Fitt⁰_{O′}Y) | (O′/π)²; O′×O′/π; 0; ℤ_p/p²; 𝔽_p⟦t⟧/t²; ℂ⟦t⟧/t² | 2=v(π²); ∞=v(0); 0=v(O′); 2=2; 2=2; 2=2 (infinite residue field) | true |
| charIdeal(Y) = π^{length Y} (§4.6, A = O′) | Y torsion over DVR | one height-one prime πO′, O′_{πO′} = O′, exponent length(Y) | true |
| length(O′⊗_x Q) = v(x Fitt⁰_P Q) | Λ/(T), x_u, u∈pℤ_p; ℤ→ℤ_p, ℤ/p², ℤ/q; non-f.p. Q, x_i↦t^i | v_p(u)=v_p(u), ∞ at u=0; 2=2; 0=0; 1=min_i i | true |
| Quadratic case v(x(det φ)) | P=O′, φ=diag(π,π²); det x(φ)=0 | length 3 = v(π³); ∞ = ∞ (not torsion) | true; `length_quotient_range_mulVecLin_eq_ord_det` at pin |
| (i) Hom_P(Q,O′/a) ≅ Hom_{O′}(Y,O′/a), length = length(Y/aY) | Q=O′/π², a=π; Q=ℤ/p³, a=p²; Q=ℤ, a=p² | 1=1; 2=2; 2=2 | true; `liftBaseChangeEquiv` is A-linear |
| (ii) length = min_j(j v(a)+v(x Fitt^j)) | O′×O′/π³×O′/π, a=π²; a unit; Q=O′/π², a=π | ∞,6,5,6 → 5 = 2+2+1; 0 at j=n; min(2,1)=1 | true; argmin j=r+#{e_i>v(a)} verified |
| (iii) aY=0 ⇒ length(Y) | Y = O′/π, a = π; a unit, Y = 0 | 1 = v(π); 0 = 0 | true; hypothesis needed (Q=O′/π², a=π gives 1≠2) |
| Points with values in O′/a | P̄=O′/a: P̄, P̄², P̄/π; lifts O′, O′² | ideals 0,0,(π̄); min(ℓ,v(a)) = v(a), v(a), 1; Fitt⁰ (a), (a²) | true |
| One element for all points | ℤ_p[T], Q=P/(T), c=p at T↦0, T↦1; c=0; c unit | 1 by d=p, ∞ by d=T; 0 by d=T, bound 1 by p; 0·∞=0 convention needed and stated | true |
| §4.5 product (Stacks 07ZA (2)) | ℤ/2⊕ℤ/2; R/I⊕R/J | (4)=(2)(2); IJ; general Fit_l sum matches Check 2 of (ii) | true; at pin as `fittingIdeal_prod_zero` |
| §6.3 Fitt⁰ = (det φ) (DK §2.3 p. 16) | R/(a), φ=(a); R^m, φ=0 | (a); 0 | true; at pin |
| §6.5 matrix form | diag(a,b) | Fitt⁰=(ab), Fitt¹=(a,b), Fitt²=R | true; source is Stacks 07Z8 (C06) |

- Source locators checked against the text: 8. These are Stacks More on Algebra Lemma 15.8.1 (Tag 07Z7), Lemma 15.8.2 (Tag 07Z8), Lemma 15.8.4 (Tag 07ZA) parts (1), (2), (3), (6) and (8), and Example 15.8.5 (Tag 07ZB), at PDF pp. 17–19; and Dasgupta–Kakde §2.3 p. 16 and Appendix B.2 first paragraph p. 93 (arXiv v3).
- Mathlib declarations opened at the pin: 7. They are `IsDiscreteValuationRing.addVal` (`RingTheory/DiscreteValuationRing/Basic.lean`, line 402), `idealOrderIsoENat` (line 510), `length_quotient_pow_maximalIdeal` (line 550), `Module.equiv_free_prod_directSum` (`Algebra/Module/PID.lean`, line 255), `LinearMap.liftBaseChangeEquiv` (`LinearAlgebra/TensorProduct/Lift.lean`, line 31), `Ring.ord_eq_addVal` (`RingTheory/OrderOfVanishing/Noetherian.lean`, line 89) and `Module.length`.
- Tau Ceti declarations opened at the pin: 14. They are `fittingIdeal` (`RingTheory/FittingIdeal/Basic.lean`, line 334, `Module.Finite` only), `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_eq_top_of_surjective` (line 358), `fittingIdeal_eq_bot_of_lt_finrank` (line 392), `fittingIdeal_quotient_zero` (line 409), `fittingIdeal_eq_minorsIdealOfSet` (`Generators.lean`, line 100, any generating set), `fittingIdeal_baseChange` (`BaseChange.lean`, line 151, any algebra), `fittingIdeal_zero_eq_top_iff`, `fittingIdeal_zero_le_annihilator`, `fittingIdeal_prod_zero`, `fittingIdeal_le_maximalIdeal_pow`, `QuadraticPresentation.fittingIdeal_eq`, `Matrix.length_quotient_range_mulVecLin_eq_ord_det` and `Ideal.length_quotient_eq_multiplicity`.
- Record check: the merge-base README against the head, layer by layer. No layer or item is removed or renumbered. The new id 6.5a is fresh. All 13 deleted lines are rewritten sentences whose content is kept.
- Cross-roadmap citations resolved: the new text cites none outside this roadmap. Its internal citations of §4.5, §4.6, §6.3 and §6.5 resolve to statements that say what is cited. Ownership was searched by object in AInfCohomology (§AI.1.3, §AI.6.7), FiniteFlatGroupsAndIntegralPadicHodgeTheory (line 941, which uses the DVR fact inside a proof without owning it) and ShortGRH, all on `main`.
- Dependency check: `depcheck: 73 roadmaps, 938 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line, and there are no changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` (unchanged by this pull request) exits 0 with 104 warnings, all "declaration uses `sorry`", and no other message.
- Automatic checks: the TeX-syntax hits are real; 30 are in the new section (N01) and the rest are untouched. The admitted-`example`, `letI` and `Fintype` hits are real but untouched (N02). No check reported a failure in the new statements.

Overlap check: I read the scope of IntegralIwasawaTheory, InertAnticyclotomicCMMainConjecture, DirichletPadicLFunctions, EulerSystemsAndKolyvaginSystems and SelmerIwasawaCohomology at their open heads, and of PadicFunctionalAnalysis, ColemanPowerSeries and LocallyAnalyticDistributions on `main`. None states the quotient formula, the DVR length formula or lengths at points, and none cites §6.5a. One object is shared with AInfCohomology on `main`. AInfCohomology §AI.1.3 and §AI.6.7 own the Fitting ideals and normalised length over rank-one valuation rings. This roadmap owns Module.length over discrete valuation rings of any characteristic, at points of an arbitrary ring. The two meet only in the discrete-valuation-ring case of §AI.6.7 (C03).

Source independence: changed passages only. The 178 added lines (2555 words) were compared with 2 sources, Stacks More on Algebra §15.8 and Dasgupta–Kakde §2.3 and Appendix B.2. The longest shared runs are 6 words of generic phrasing, so nothing is shared. The largest share of the README's locators is RJW, about 59 of roughly 125 locator mentions, and this change does not alter it. The arrangement was not compared: no layer is added, removed or reordered.

Research link: Layer 6 is the Fitting-ideal algebra of Dasgupta and Kakde's proof of the Brumer–Stark conjecture (arXiv 2010.00657, 2020–2022, §2.3 and Appendix B), which the README names as its consumer. §6.5a extends that algebra to lengths at points with values in discrete valuation rings. This line rests on the README summary and on Dasgupta–Kakde §2.3.

## Not verifiable

- none

## Source issues

- **Misprint** in Stacks07ZA at More on Algebra, Lemma 15.8.4 (Tag 07ZA), proof of part (2), PDF p. 19: the source says the part "follows form" the lemma on minors; it should be "follows from"; affects nothing.
- **Misprint** in DasguptaKakde at §2.3, p. 16: the source defines "quadratically presented" for a module called M, but its displayed exact sequence ends in N; it should name one module throughout; affects nothing.

## For the human reviewers

- none
