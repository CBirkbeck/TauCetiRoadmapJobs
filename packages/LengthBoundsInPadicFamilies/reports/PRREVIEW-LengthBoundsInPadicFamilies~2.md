# Review of LengthBoundsInPadicFamilies (pull request #2898 at f59066d)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LengthBoundsInPadicFamilies/`
**Verdict:** needs changes

**Summary.** I checked the mathematics of 1.7a–1.8e: the length bounds, the generic-determinant lemma, the Ribet-type bounds and every Check and Example. All of it holds, and the three Lean statements match the README. One finding blocks: the docstring of `Suggested.lean` says the third headline (the bound by Selmer groups) cannot be stated because the pins lack continuous H¹ of inhomogeneous cocycles, Selmer groups of local conditions and determinants. Pinned Tau Ceti and Mathlib have all three. Two small corrections and two format notes do not block. The human reviewers have a scope question: the most-cited source is an unrefereed formal proof announced on 20 November 2026, which could not be read here.

## R01 (P2) — The Lean docstring says the pins lack continuous H¹ of inhomogeneous cocycles, Selmer groups of local conditions and determinants on `A[G]`, but all three exist there, so the stated reason for leaving out the third headline does not hold

The module docstring is where the acceptance test records which headline is not statable and which carrier is missing. As written, it would send an implementer to build a second explicit H¹ and Selmer group, and it hides the possibility that the third headline (1.8c(3) with 1.8d(2), (3)) can be stated now. The docstring (lines 30–35) names three missing carriers: the class in continuous H¹ of an inhomogeneous cocycle, the Selmer group of local conditions at closed subgroups with discrete coefficients, and determinants of dimension `n` on `A[G]`. At the pinned Tau Ceti the first two exist:

- `TauCeti.ContCohomology.Z1`, `H1` and `H1pi` are the continuous inhomogeneous 1-cocycles and their classes (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`, lines 506, 829, 834).
- `TauCeti.ContCohomology.explicitH1AddEquivContinuousCohomology` identifies them with Mathlib's `continuousCohomology` in degree 1 (`ContCohomology/CohomologyComparison.lean:145`).
- `TauCeti.ContCohomology.explicitRes1` restricts a class to a subgroup (`ContCohomology/ExplicitFunctoriality.lean:608`).
- `TauCeti.ContCohomology.SelmerStructure` and `SelmerStructure.selmerGroup` give the Selmer group of a family of local conditions along compatible pairs (`ContCohomology/SelmerStructure.lean`, lines 69 and 97).

ProfiniteCohomology Layer 2, which the README cites for its explicit cocycles, names these same declarations. For the third carrier, a dimension-`n` determinant is a Mathlib `PolynomialLaw` (`Mathlib/RingTheory/PolynomialLaw/Basic.lean:80`) that satisfies Tau Ceti's `PolynomialLaw.IsMultiplicative` (`TauCeti/RingTheory/PolynomialLaw/Multiplicative.lean:71`) and `PolynomialLaw.IsHomogeneousOfDegree n` (`Homogeneous.lean:73`). Characteristic coefficients enter only the proof route, not the statement. What I found missing at the pin is an `O`-module structure on the explicit `H1` and on `selmerGroup`: both are additive groups only, and the comparison is over `ℤ`. That is the one gap between these carriers and the `O`-length the headline needs.

Two repairs would work. One is to state the third headline against these carriers, importing the Tau Ceti module that declares `SelmerStructure`, and take the `O`-length of the Selmer group through an `O`-submodule of continuous cocycles that the file defines with a real body. The other, if that encoding is judged too long, is to rewrite the docstring paragraph so that it names only what is actually missing (the `O`-linear structure on Tau Ceti's explicit `H¹` and its Selmer group) and names the Tau Ceti declarations that already exist.

## C01 — A Check and an Example of 1.8e(4) use an element `g` that (4) excludes, and conclude `v_δ = 0`

The Check on (4) (line 411) and the matching Example (line 426) give the unit case as "`p > t + 1` and `ε(g)` a generator modulo `p`, so `v_δ = 0`". But (4) assumes `ε(g) = 1 + p^{s₀}u` with `s₀ ≥ 1`, so `ε(g) ≡ 1 mod p`. Under that hypothesis `v_δ = Σ_{0<i<t}(s₀ + v_p(i)) ≥ t − 1`, which is positive whenever `t ≥ 2`, so (4) never yields the unit case. The next sentence of the Check (no unit `δ` when `ε̄(G) ⊆ 𝔽_p^×` and `p ≤ t`) also presupposes a wider form of (4). CongruenceModulesOfThetaLifts §7.7a cites 1.8e(4) for exactly this unit case (`χ_cyc(g)` a generator modulo `ℓ`, `ℓ > t + 1`).

The route of (4) uses the hypothesis on `g` for only two things: that the values `χ_c(g)` are distinct, and the valuation formula. The smallest repair is to state (4) for every `g` with `ε(g)^i ≠ 1` for `0 < i < t`, with `v(δ_{A′}(π′)) = Σ_{0<i<t} v(1 − ε(g)^{−i})`, and to keep `Σ(s₀ + v_p(i))` as the case `ε(g) = 1 + p^{s₀}u`. Alternatively, mark the unit case in the Check and the Example as lying outside (4).

## C02 — The description says `Suggested.lean` states three headline theorems; it states two of the three

The description says: "`Suggested.lean` states 3 headline theorems with `sorry` proofs … its docstring says which other headlines are not statable and which carriers they lack". The README has three headlines. The file states the first in two forms (1.7a(4) and (4′)) and the second (1.8b), and leaves out the third (docstring, lines 7–9). Suggested text: "`Suggested.lean` states two of the three headline theorems in three declarations (the length bound of 1.7a in two forms and the determinant lemma of 1.8b); its docstring says why the Selmer-group bound is not stated." The last clause should follow whatever repair R01 receives.

## N01 — ArithmeticGaloisDuality §R02.1.2 is cited for the continuous cohomology of 1.8d, whose coefficients are discrete

The places are the Conventions (line 21), the *Needs* of 1.8d (line 267) and the supplier contract (line 464). That section concerns continuous cochains with values in inverse limits (compact coefficients). Discrete coefficients are ProfiniteCohomology Layers 1–3. Would cite those for 1.8d and keep §R02.1.2 for the compact coefficients of 1.8e (Col) and (3a).

## N02 — The *Needs* of 1.8b cite the one-variable `Polynomial.content` and `Polynomial.IsPrimitive.mul`, but the route's Gauss lemma is in `O[X_1, …, X_m]`

A sentence saying how the route reduces to one variable (for instance by a Kronecker substitution) would let a reader find the input.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.7a(1)–(3), Ψ_e and `M[𝔞_Y]` | `A = M = O×O`, `Y = {1}`; `A = O[ε]/(ε², ϖε)`, `e = 1` | `M[𝔞_Y] = O×0 = M∩V_Y`; wrong variant gives `0×O`. `Ann(A) = 0 ≠ kε` | holds; both Checks true | none |
| 1.7a Check, `A = O[t]/(t² − ϖ^{2n})` | `e = (1 + t/ϖⁿ)/2`, odd residue characteristic | `A ≅ {(u,w): u ≡ w mod ϖⁿ}`, `Ψ_e(A) = O/ϖⁿ` | holds | none |
| 1.7a(4), `…_relCongruence` | `A = {a ≡ b mod ϖⁿ}`, `M = A^m`, `Z = {1}`; `M = O^X`; `Z = ∅`; `Z = X` | `mn ≤ m·n`; `0 ≤ n`; `0 ≤ 0`; `0 ≤ 0` (`cc_X = O`) | holds; filtration route checked | none |
| 1.7a(4′), `…_of_endomorphisms` | `M = A`, `S = {1}`, `α` = multiplication by `(ϖⁿ, 0)`; (4) with `α_π = f_π α` | `n ≤ 1·n`; `a_π = f_π(π)A_α`, `v = v(cc) + v(A_α)` | holds | none |
| 1.8b, `…_blockSolutions` | `𝒜 = O`, `Rel = ϖⁿO`; `𝒜 = O×O`, `Rel = ϖ^aO×ϖ^bO`; `B = ∅`; `R_b` not of full rank | `n ≤ n`; `a+b ≤ a+b`; `J ∋ 1`, `0 ≤ 0`; right side `⊤` | holds | none |
| 1.8c(1), (2), two-point Check | `X = {π,x}`, `c(π) = ϖ^mO`, free `G` on four generators, `E = (1 + r(g₁))/2` | `Y_s` = `ϖ^mO²` in first column at `x`; both `Hom` = `(K/O)[ϖ^m]`; `m ≤ 2m` | holds; cocycle law `y_{γγ′} = u_γy_{γ′} + y_γ` | none |
| 1.8c(5), distinct roots | `A` congruent mod `ϖ²`, `P = T² − (ϖ², 0)` | `f = T`: `f(π,ϖ) = ϖ ∉ ϖ²O`; with distinct roots Vandermonde gives `f_i(x) = 0` | holds; hypothesis needed | none |
| 1.8c(3), supply | rank of lifted idempotent `E(x)`; `r_π` irreducible, `r̄_π` reducible | rank = multiplicity of `χ̄` in `r̄_x^{ss}` = 1; proper order, no surjection (Brauer–Nesbitt) | holds | none |
| 1.8d(3), (3′) | `E = ϖ^a e`; two-sided ideal `I_χ`; `H⁰` clause | `δ_A = ϖ^a`: bound `d_b·a`, true `C_b = 0`; `u_h(u_g−1) = (u_{hg}−1)−(u_h−1)`; `ψ_{b₀}(E) = δ_A(π)` | holds | none |
| 1.8d, class-number Check | `F`, `p` odd, unramified everywhere | `H¹_𝒮 = Hom(Cl_F, ℚ_p/ℤ_p)`, length `v_p(#Cl_F)`; `H¹(ℝ, ℚ_p/ℤ_p) = 0` | holds | none |
| 1.8e(1), kernels | each block at one column | `ρ_0`: `j(e′+v_δ)+h⁰+Nv_δ`; `χ`: `e′+3v_δ`; `χ_c`: `h⁰+v_δ`; dimension `j+1+dim V > j+dim V` | holds | none |
| 1.8e(2), total | sum of kernels and coboundaries; `Col = Row = ∅`, `v_δ = 0` | `Σ_w(…+(N+t)v_δ)+(N+t−1)v_δ` ≤ stated; reduces to `Σ H¹_𝒮` | holds | none |
| 1.8e(3a) | coboundary of `f(g) = −a_gu_gE` | `df(g,h) = a_gu_g(u_h−1)E`; `H²(G_w, M(1)) = M` natural, `Y ↪ 𝒜E` | holds | none |
| 1.8e(4) and its Check | `t = 2`, `p` odd, `s₀ = 1`; `p = 2`, `s₀ = 1`; `ε(g)` generator mod `p` | `v_δ = 1`; `1 + 2u = −1` root of unity; generator violates `ε(g) ≡ 1` | (4) holds; Check outside (4) | C01 |
| Headline 3 and the Lean docstring | carriers named as missing, opened at the pins | docstring: three missing; pin: `H1`, `explicitRes1`, `selmerGroup`, polynomial laws exist; missing: `O`-module on `H1` | docstring false | R01 |

- Source locators checked against the text: Hida §0 and §6 (Hida lines 25–127, 1261–1300); BC09 §§1.3–1.5 (Lemma 1.4.3 at BC09 line 1218, Theorem 1.5.5 at line 1462, table of contents at lines 14–17); the announcement (Announcement lines 5–80). That is 3 sources and 4 locators.
- Library declarations opened at the pins, Mathlib (7): `Module.length` (`RingTheory/Length.lean:31`), `Polynomial.IsPrimitive.mul` (`RingTheory/Polynomial/Content.lean:371`), `Matrix.aeval_self_charpoly` (`LinearAlgebra/Matrix/Charpoly/Basic.lean:222`), `Polynomial.discr` (`RingTheory/Polynomial/Resultant/Basic.lean:934`), `Polynomial.SplittingField` (`FieldTheory/SplittingField/Construction.lean:213`), `PolynomialLaw` (`RingTheory/PolynomialLaw/Basic.lean:80`), and `ContCohomology/LowDegree.lean` (degree 0 only).
- Library declarations opened at the pins, Tau Ceti (9): `TauCeti.ContCohomology.Z1`, `H1`, `H1pi`, `explicitH1AddEquivContinuousCohomology`, `explicitRes1`, `SelmerStructure`, `SelmerStructure.selmerGroup`, `PolynomialLaw.IsMultiplicative`, `PolynomialLaw.IsHomogeneousOfDegree`.
- Cross-roadmap citations resolved (22): on main, PadicFamilies §§1.7, 1.8; IntegralHeckeAndGaloisDeterminants §§0.5, 1.2, 1.3, 1.4 and Layer 6; SelmerIwasawaCohomology §§2.1–2.9; ProfiniteCohomology Layer 2; ArithmeticGaloisDuality §§R02.1.2, R02.4.2. At open heads, SelmerLengthBoundsAndLocalLifting §§4.10b–4.10f and CongruenceModulesOfThetaLifts §§7.1, 7.6, 7.7a, 7.7b, 7.7c, 7.10a, 7.10b. All exist and say what is cited.
- Dependency check: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)`, so no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: three `sorry` warnings and nothing else. `#check @name` for all three declarations agrees with the README statements and no binder was lost, so nothing changed. The one-tactic probe (`simp`, `rfl`, `exact le_top`) fails on all three, so there is no padding.
- Automatic checks: all passed at this head. Nothing changes outside the folder except the family index, which is the pull request's own.
- Overlap check: read CongruenceModulesOfThetaLifts, SelmerLengthBoundsAndLocalLifting, HeckeIdealsAndTaylorWilesRelations, UniformWildKernelBounds, WachLatticesOverTheCyclotomicTower (open), and PadicFamilies, IntegralHeckeAndGaloisDeterminants, EulerSystemsAndKolyvaginSystems (main). Nothing shared: the first two cite 1.7a–1.8e as consumer or supplier, owner this roadmap; IntegralHeckeAndGaloisDeterminants Layer 6 is a different two-dimensional Fitting-ideal statement, owner that roadmap.

Source independence: 7 passages compared with 3 sources (Hida §6 against the definition in 1.7a; Hida §0 against the Summary; BC09 Lemma 1.4.3, Theorem 1.5.5 and the §1.3 overview against the routes of 1.8c; the announcement against the References; the `Suggested.lean` docstrings against Hida §6). None shares wording beyond notation and standard names. Largest share: FormalProof, 4 of 9 in-text locators (1.7a, 1.8c, 1.8d, 1.8e). Its text could not be read, so wording and contents were not compared with it. Contents compared with BC09 Chapter 1 (§§1.3–1.6): independent. The numbering 1.7a and 1.8b–1.8e continues PadicFamilies §§1.7–1.8, a roadmap, not a source.

Research link: 1.7a extends Hida's congruence modules of Hecke algebras (Hida 1986, §§0 and 6). 1.8c–1.8e put Ribet's construction of unramified extensions (Ribet 1976) into length form, using the generalized matrix algebras and reducibility loci of Bellaïche–Chenevier (2009, Chapter 1). The bounds feed CongruenceModulesOfThetaLifts within the family built on Alpöge's announced formal proof (2026). This rests on the README and the sources read.

## Not verifiable

- [FormalProof] (Lean repository): the sources service has no licence class for the GitHub host. The announcement names code archives on the author's page, which I did not download. Its support for 1.7a(4), (4′), 1.8b, 1.8d and 1.8e is unchecked.
- [Ribet76] §§2–4: the EuDML record (eudml.org/doc/142394) points to a GDZ viewer page, and the service extracted no text from it.

## Source issues

- none

## For the human reviewers

- Scope: the most-cited source of this roadmap, [FormalProof] (README References, line 479), is an unrefereed Lean formalization of the Riemann hypothesis announced on 20 November 2026 (Announcement lines 5–53). Its own targets rest on refereed work (Hida 1986, Ribet 1976, Bellaïche–Chenevier 2009).
- Not tested: [FormalProof], the source with the largest share of locators (4 of 9), could not be read. Wording and arrangement were not compared with it.
- Licence: the licence of the formal-proof repository was not read; the sources service has no licence class for its host.
