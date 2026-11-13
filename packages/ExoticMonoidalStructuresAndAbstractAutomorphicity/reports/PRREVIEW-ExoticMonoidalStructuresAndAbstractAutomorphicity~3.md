# Review of ExoticMonoidalStructuresAndAbstractAutomorphicity (pull request #1737 at dd68849)

**Verdict:** accepted

This is an incremental re-review of the 87 lines of `TauCetiRoadmap/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md` that changed since `a342646`. `Suggested.lean` and `metadata.toml` did not change. No new finding.

## Previous findings

- R01 — repaired: README line 745 "For any commutative unital ⊛-algebra A, with unit u:Iunit→A, …"; the route (line 749) derives (u∘ε)⋆f = f and the block-sum local units; Check line 763 is the zero-multiplication control; Needs line 765 adds `CategoryTheory.CommMon`.
- R02 — repaired: README lines 59, 205, 1364, 1458, 1475 cite AL.0.1, AL.0.3.1, AL.0.6.1 Curve additive analysis, AL.3.1–AL.3.2 and AL.3.10.3, each found at the AutomorphicLFunctionsAndLocalFactors head; gap sentences (lines 61, 67) keep the plan's wording.
- R03 — repaired: README line 13 "Invertible sheaves, their tensor products and the sheaf of differentials of the curve are pinned Tau Ceti declarations"; line 39 cites them by name, file and line; the AlgebraicVectorBundles contract is gone; §11.1 route and Needs (lines 1349, 1364) use them.
- R04 — repaired: README line 39 "`TauCeti.DiscreteRep` line 669, `TauCeti.SmoothDiscreteTopRep` line 656, `TauCeti.IsSmoothDiscrete` line 259, `TauCeti.discreteRepEquivSmoothTopRep` line 865", all correct at the new Tau Ceti pin `2fd255d`.
- R05 — repaired: README line 299 "isomorphism κ:Ṽ⊗G Y⊗G V≅K(V(−1))(1)", line 1446 "ZJL(jκ(β⊗Ψ),s)", Check line 309 "|t| = 1/3 and |t|⁻¹ = 3 … Normalized I(|·|¹ᐟ²,|·|⁻¹ᐟ²)". ν now means only the conductor, plus the local "ν = |·|F" of lines 87–89.
- R06 — repaired: the description reads "`Suggested.lean` declares nothing: no headline theorem is statable at the pins, and its module docstring names each one with the carrier it lacks; every target is in the README."
- R07 — repaired: the description reads "Validation: the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`)"; `lake env lean` at this head exits 0 with empty output.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.4 Kirillov spectral extension (κ, third Check) | 𝔽₃((t)); I(\|·\|¹ᐟ²,\|·\|⁻¹ᐟ²) and its swap | \|t\|=1/3, \|t\|⁻¹=3; Borel character δ¹ᐟ²χ₁χ₂ = \|a/d\| ≠ 1 here, = 1 after the swap, so constants are a sub of the swap; St sub here; Whittaker dims 1, 0 | sound; Dor23 line 416 is Theorem 2.2 | none |
| 5.6 Spherical algebra, unital | A=Iunit (u=id, m=λ); general unital A; block idempotent e_c | λ∘(ε⊛f)∘Δ = f by the counit law; (u∘ε)⋆f = m(u⊛id)λ⁻¹f = f; (e_c⊛id)Δ = Δe_c gives (u∘ε∘e_c)⋆f = f∘e_c = f on block c | sound; Dor23 line 1763 assumes unital and commutative | none |
| 5.6 zero-multiplication Check | A=E, m=0, a putative unit u | m∘(u⊛id) = 0 against invertible λ, E ≠ 0; f⋆g = 0, so Zsph⊗Zsph → Zsph is zero | Check true; excludes the non-unital model | none |
| 11.1 Unramified spin structure | ℙ¹/𝔽₃, ω = dt at ∞; L = O(−1) against L = O | ord∞(dt) = −2; annihilator of πᵃO is π²⁻ᵃO, so Λ∞ = πO∞; deg O(−1)² = −2 = 2g−2; deg O² = 0 ≠ −2 | sound; Dor23 line 2507 | none |
| Tau Ceti contract (spin carriers) | signatures at pin `2fd255d` | `InvertibleSheaf` is `FullSubcategory (SheafOfModules.isInvertible X)`; generic-stalk equivalence needs `[IsIntegral X]`, true for the curve; target `Ω[X.functionField⁄R]` | statement matches the pin | none |
| 12.1 Local zeta comparison (κ; AL.3.1–AL.3.2) | AL.3.2.1 at n=2, m=1, j=0, W′ ≡ 1; AL.2.1.2 at n=2 | RS exponent s−(n−m)/2 = s−1/2 = ZJL exponent; GJ exponent s+(n−1)/2 = s+1/2; shell \|π\|^(s−1/2)·\|π\| = \|π\|^(s+1/2) | sound; supplier's local statements cover both characteristics (its README line 50); Dor23 line 453 | none |
| 12.2 Function-field zeta comparison (AL.3.10.3) | degree-2 place of ℙ¹/𝔽₃ | q_v^(−s) = 9^(−s) = z², as AL.3.10.3 states q_v^(−s) = z^(deg v) | sound; Dor23 lines 1915, 2181 | none |
| 8.3 Poincaré unit map (Needs now AL.0.6.1) | u = u(b), b ∈ F | θ(u) = e(b) = 1 since e is trivial on F; summand independent of representative | sound; Dor23 line 2236; AL.0.6.1 found at its README line 580 | none |
| 0.4 / 1.1 Needs (AL.0.1, AL.0.3.1) | supplier headings | AL.0.1 "Annihilators and compact-open Fourier identities" (line 263); AL.0.3.1 "The local Schwartz–Bruhat space S(F), …" (line 484) | resolve as cited | none |

Rows for untouched statements stand as in the previous review, of `a342646`.

- Source locators checked against the text: 7 locators of the changed sections (Dor23 lines 416, 1758–1763, 2236, 2507, 453, 1915, 2181). The README flags none as unverified. The diff adds or removes no locator.
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): all 8 Mathlib line numbers in the contract are right (`Matrix.det_fin_two` 815, `Matrix.trace` 43, `trace_transpose` 71, `trace_mul_comm` 156, `Rep.coinvariantsTensor` 410, `SymmetricCategory` 364, `CommMon` 29, `Mod` 230). All 9 Tau Ceti line numbers are right (R04 lines, `trialityAutomorphism` Triality/Basic.lean 155, `InvertibleSheaf` 119, `tensorProduct` 65, `relativeDifferentials` 85, `relativeDifferentialsGenericStalkEquiv` 61).
- Cross-roadmap citations resolved: 7 AutomorphicLFunctionsAndLocalFactors ids at the head of its open pull request (`19069a6`). FunctionFieldArithmetic's own contracts cite §AL.0.6.1 (its README line 430), matching line 75 here. `roadmaps resolve` reports nothing missing.
- Gate at this head: every check passes. Dependency check: `depcheck: 222 roadmaps, 1971 edges, 0 problem(s)`. Outside-folder diff against the merge base: empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file has no declarations, so there is no signature to `#check` and nothing to run the one-tactic padding probe on.
- Ownership: `roadmaps grep` for unramified spin structure, theta characteristic, spherical algebra of invariants, Jacquet–Langlands zeta and exotic tensor finds no second owner. The only hits are the unrelated unary theta characteristics g(a,b;τ) of QSeriesPartitionsAndMockModularForms §6.1.
- Remark (untouched text, no change asked): the gap sentence on line 83 (plan wording) still names AlgebraicVectorBundles for line-bundle carriers that line 39 now cites from Tau Ceti.
- Remark (untouched text, no change asked): the `Suggested.lean` docstring (lines 29–31) lists "the theta characteristic … carriers" as missing. The same carriers existed at the previous pin, and the bullet's headlines still lack I and the adelic coalgebra.

Overlap check: read GanGrossPrasadUnitaryGroups (newly in the vocabulary list), AutomorphicLFunctionsAndLocalFactors (supplier and owner of the cited AL sections), AutomorphicLFunctionsAndLocalFactorsPartII and ExceptionalThetaCorrespondencesForG2 (scope and grep for Kirillov, exotic, Jacquet–Langlands and triality), and SmoothRepresentationsOfLocalGroups (as in the previous review). Nothing is shared.

Source independence: changed passages only. 6 passages compared with 1 source (Dor23): §5.6 statement, route and new Check; the §1.4 Check; the Tau Ceti spin-datum sentence; the §11.1 route. At most 2 consecutive words are shared ("quasi-unital commutative"). Largest share is still Dor23, 46 of 62 locators. The diff adds, removes and reorders no layer, so the contents were not compared again.

## Not verifiable

- Arm67 (existence of a rational theta characteristic) is settled as uncertified. It is cited by locator through Dor23 line 2512 and owned by the FunctionFieldArithmetic gap.

## Source issues

- none

## For the human reviewers

- Scope: 61 of 62 locators are to three papers by one author. Dor23 is refereed (Forum of Mathematics, Pi, 2023). Dor21, the only source of Layers 6 and 10, and Dor20Z are arXiv preprints (v1); I did not search for published versions.
- Scope: the §10.2 proof route (README line 1244, the four-term convolution identity with large-degree primes; Check line 1248) is in no cited source. It replaces the argument at Dor21 line 2460, which fails for classes of non-positive degree.
- Acceptance test: `Suggested.lean` has no declaration. The §5.1 idempotent coherence theorem is statable at the pins with one structure of Mathlib data; the docstring (lines 9–11) classes it as supporting, not as a headline.
- Licence: Arm67 is uncertified (paywalled, cited by locator only). The existence of a rational theta characteristic in §11.1 rests on it through the FunctionFieldArithmetic gap.
