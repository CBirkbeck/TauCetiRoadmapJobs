# Review of ExoticMonoidalStructuresAndAbstractAutomorphicity (pull request #1737 at dd68849)

**Verdict:** accepted

Incremental re-review of the 87 lines changed since `a342646`. No finding at this head.

## Previous findings

- R01 — repaired: README line 745 "For any commutative unital ⊛-algebra A, with unit u:Iunit→A, …"; the route (line 749) derives local units from (u∘ε)⋆f = f; the zero-multiplication negative control is the fourth Check; `CategoryTheory.CommMon` is in the Needs line.
- R02 — repaired: line 59 "Consume AL.0.1, Annihilators and compact-open Fourier identities, and AL.0.3.1, …"; "AL.0.6.1, Curve additive analysis" in 23 lines; the only remaining "AL.3, Curve additive analysis" is the gap sentence of line 61.
- R03 — repaired: the AlgebraicVectorBundles contract is deleted; line 39 cites `TauCeti.AlgebraicGeometry.InvertibleSheaf` (LineBundle/Basic.lean, line 119) and `InvertibleSheaf.tensorProduct` (TensorProduct.lean, line 65); §11.1 route and Needs cite them.
- R04 — repaired: line 39 "`TauCeti.DiscreteRep` line 669, `TauCeti.SmoothDiscreteTopRep` line 656, `TauCeti.IsSmoothDiscrete` line 259, `TauCeti.discreteRepEquivSmoothTopRep` line 865", each the declaration line at the pin of this head.
- R05 — repaired: line 299 "isomorphism κ:Ṽ⊗G Y⊗G V≅K(V(−1))(1)"; line 309 writes "|t| = 1/3 and |t|⁻¹ = 3" and "I(|·|¹ᐟ²,|·|⁻¹ᐟ²)"; line 1446 "ZJL(jκ(β⊗Ψ),s)".
- R06 — repaired: the description reads "`Suggested.lean` declares nothing: no headline theorem is statable at the pins, and its module docstring names each one with the carrier it lacks".
- R07 — repaired: the description reads "the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`)".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 5.6 Spherical algebra (statement, route, new Check) | unital A; A = E with m = 0 | (u∘ε)⋆f = m(u⊛id)∘(id⊛f)∘(ε⊛id)Δ = λ_A(id⊛f)λ_E⁻¹ = f; for m = 0: f⋆g = 0 on Zsph ≠ 0, and m(u⊛id) = 0 ≠ λ | sound; hypothesis as Dor23 line 1763 | none |
| 5.6 local units | infinitely many blocks | u∘ε has full support, not in the finite-support Hom; (u∘ε∘e_c)⋆f = f·e_c = f for f on the blocks of e_c | agrees with the fourth API bullet and third Check | none |
| 1.4 Kirillov spectral extension (third Check) | 𝔽₃((t)) | \|t\| = 3⁻¹, \|t\|⁻¹ = 3; ratio of (\|·\|¹ᐟ²,\|·\|⁻¹ᐟ²) is \|·\|, excluded; ratio of (1,1) is 1, not excluded | consistent with the contract's ν = \|·\|F (line 87) | none |
| 11.1 Unramified spin structure (carriers) | ℙ¹; L = O | deg O(−1)⊗² = −2 = 2g−2; deg O⊗² = 0 ≠ −2; pinned generic-stalk equivalence needs `IsIntegral X` and `X.Over (Spec R)`, both hold for C | carriers exist at the pin; ω readable in Ω[F⁄k] | none |
| 12.1 Local zeta comparison (κ; AL.3.1–AL.3.2 citation) | n = 2, m = 1, j = 0 in the supplier's integral | supplier exponent s−(n−m)/2 = s−1/2 on GL₁, equal to the README's \|y\|ˢ⁻¹ᐟ² for ZJL; j ranges over 0 ≤ j ≤ 0 | the cited case is the stated integral | none |
| 8.4 Petersson unit identity (sampled; Needs now AL.0.6.1) | unipotent integral | ∫_{A/F} e(b(q det ξ−1))db = 1 if q det ξ = 1, else 0; uses the residue character and quotient measure, both in AL.0.6.1 | citation supplies what the route uses | none |
| 0.4 Triality kernel, 4.2 Spherical counit (sampled; Needs now AL.0.1, AL.0.3.1) | supplier headings | AL.0.1 at line 263 and AL.0.3.1 at line 484 of the supplier's open head carry compact-open Fourier identities and S(F), S(V) | citations resolve | none |

The rows for the untouched statements stand as in the previous review, of `a342646`.

- Source locators checked against the text: 2 (Dor23 lines 1758–1764 for §5.6, lines 2505–2512 for §11.1); the sampled targets 0.4, 4.2, 8.4 and 10.1 are touched only in their Needs lines, the other eleven not at all.
- Library declarations opened at the pins of this head (the pins moved with the merge of main): Mathlib `Matrix.det_fin_two` Determinant/Basic.lean:815, `Matrix.trace` Trace.lean:43, `Rep.coinvariantsTensor` Coinvariants.lean:410, `SymmetricCategory` Braided/Basic.lean:364, `CommMon` CommMon_.lean:29, `Mod` Mod.lean:230; Tau Ceti SmoothDiscrete/Basic.lean:259, 656, 669, 865, D4/Tripled/Triality/Basic.lean:155, LineBundle/Basic.lean:119, LineBundle/TensorProduct.lean:65, Modules/Differentials/Basic.lean:85, Differentials/Rational.lean:61. All 17 agree with the README.
- Cross-roadmap citations resolved at the open head of AutomorphicLFunctionsAndLocalFactors: AL.0.1 (line 263), AL.0.3.1 (484), AL.0.6.1 (580), AL.3.1 (1433), AL.3.2 (1488), AL.3.10.3 (1931), Restricted tensor realizations (AL.R.3, 616). No citation of AlgebraicVectorBundles as a supplier remains.
- Gate at this head: every check passes (`… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`). Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`. Outside-folder diff against the base: empty.
- Elaboration of `Suggested.lean`: exit 0, no output; the file is unchanged and declares nothing, so there is no signature to compare and nothing to probe for padding.
- Pull request text read against this head: no sentence contradicted; the description names no supplier that the head dropped.
- Remark on untouched text: the gap sentences of lines 61 and 83 keep the plan's wording ("AL.3, Curve additive analysis"; "the line-bundle tensor carriers of AlgebraicVectorBundles"), while the body now cites AL.0.6.1 and the pinned Tau Ceti carriers.
- The eight source issues recorded in the review of `a342646` stand; none was added this round.

Overlap check: read AutomorphicLFunctionsAndLocalFactorsPartII, ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactors, GanGrossPrasadUnitaryGroups, MetaplecticAutomorphicForms, SmoothRepresentationsOfLocalGroups; nothing shared (unramified spin structures and the theta-characteristic contract occur in no other roadmap, on main or open).

Source independence: changed passages only; 4 passages compared with 1 source (Dor23), none shared; largest share Dor23, 46 of 62 locators; the diff adds, removes and reorders no layer, so the contents comparison stands as in the review of `a342646`: independent.

## Not verifiable

- Arm67 (existence of a rational theta characteristic): settled as uncertified; cited by locator through Dor23 line 2512 and owned by the FunctionFieldArithmetic gap.
- Dor20Z Claim A.3 (invertibility of S(F) over S(F×)): outside the sample and the changed passages; not opened.

## Source issues

- none

## For the human reviewers

- Scope: 61 of 62 locators are to three papers of one author; Dor23 is refereed (Forum of Mathematics, Pi, 2023), while Dor21, the only source of Layers 6 and 10, and Dor20Z are arXiv preprints; published versions were not searched for.
- Scope: the proof route of §10.2 (the four-term convolution identity with large-degree primes) is in no cited source; it replaces the argument at Dor21 line 2460, which fails for classes of non-positive degree.
- Acceptance test: `Suggested.lean` has no declaration. The §5.1 idempotent coherence theorem is statable at the pins with one structure of Mathlib data; the docstring (lines 9–11) classes it as supporting, not a headline.
- Licence: Arm67 is uncertified (paywalled, cited by locator only); the existence of a rational theta characteristic in §11.1 rests on it through the FunctionFieldArithmetic gap.
