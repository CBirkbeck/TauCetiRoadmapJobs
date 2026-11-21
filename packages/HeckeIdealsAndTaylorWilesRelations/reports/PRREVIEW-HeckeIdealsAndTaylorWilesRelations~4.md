# Review of HeckeIdealsAndTaylorWilesRelations (pull request #2893 at e54b1e0)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeckeIdealsAndTaylorWilesRelations/`
**Verdict:** needs changes

**Summary.** Changes are needed for four findings, all P2. In 9.9 (a)–(c) "irreducible on every open subgroup" has to be absolute irreducibility: over a small coefficient field a CM-type representation satisfies the hypothesis as written, and neither the route nor Newton–Thorne's theorem covers it. The statements attributed to the formal proof still carry no commit, file or declaration; 3.13a (f) is kept to `2 ≤ n ≤ 4` although the README says its route does not depend on `n`; and one sentence of 10.1 on lengths is false for ramified coefficients. There are four small corrections and three format notes. The human reviewers have to decide on targets whose only source is an unpublished formal proof, and on its licence.

## R01 (P2) — In 9.9 (a)–(c), "irreducible on every open subgroup" must be absolutely irreducible; as written the hypothesis admits CM-type representations that the route and the cited theorem do not cover

The coefficients are the integers `O` of a finite extension `E` of `ℚ_p` (Conventions, line 19), and (a) asks that `ρ` be "irreducible on every open subgroup of `G_F`" (line 307; likewise (b), line 311, (c) through (a), and the summary, line 7). An implementer will state irreducibility over `E`. That is strictly weaker than what the route uses. Take `n = 2`, an elliptic curve `A/ℚ` with complex multiplication by an imaginary quadratic field `K₁`, a prime `p` inert in `K₁`, and an imaginary quadratic `F ≠ K₁`; let `ρ` be `V_p(A)|_{G_F}` with `E = ℚ_p` (up to the twist into unitary type that the route of (a) itself allows). It is attached to a cuspidal representation of `GL₂(𝔸_F)`, the base change of a form with complex multiplication by `K₁ ≠ F`. On every open subgroup `H` of `G_{FK₁}` the `ℚ_p`-span of `ρ(H)` is the field `K₁ ⊗ ℚ_p`, so `ρ|_H` is irreducible over `E`; over `K₁ ⊗ ℚ_p` it is a sum of two characters.

For this `ρ` the first step of the route fails ("the identity component of the Zariski closure of its image acts irreducibly, hence so does its derived group", lines 344–345): the identity component is a non-split torus and its derived group is trivial. The image over `F(μ_{p^∞})` is not enormous, since an enormous subgroup acts absolutely irreducibly (NT23 line 948, Lemma 2.25), so ModularityAndLanglandsExtensions §4.1 does not apply; Newton and Thorne's own rank-two statement excludes the CM case (NT23 line 79). The repair is one word in (a) and (b) and in the summary, "absolutely irreducible on every open subgroup", or a line in the Conventions that irreducibility of a representation over `O` or `E` always means irreducibility after extension to `Ē`. The first Check of 9.9 (the cubic induction) already reads the hypothesis that way.

## R02 (P2) — The statements attributed to [FormalProof] have no commit, file or declaration, and the README does not say consistently which statements they are

Four places rest on that source alone: 4.2a ("This is a theorem of [FormalProof]", line 243, with the level modules and comparison maps given no route), 9.9 (d) (line 321, route "not given here" beyond an outline), the range and the clauses (w1), (w2) of 3.13a (f) ("that of the statement of [FormalProof]", lines 154–156), and the instance of 10.1 (lines 465–468). The reference (line 640) gives a repository only. The proof has 175,187 project modules (counted in the module list of the copy the operator holds), so a reader cannot find the statement and cannot check that it carries these hypotheses: `2 ≤ n ≤ 4`, (i)–(iii) and the conditions at `v₀` in 9.9 (d), the factor `f` and the exponent `n!` in 4.2a. I could not check them either.

The locators can be given: the sibling roadmap BernoulliBoundsForClassGroupEigenspaces cites the same proof at a named commit by file and declaration (its Conventions and §6.17), and the files it names are in the module list I read. The same list has modules that look like the homes of these targets, for instance `…/AutomorphicVarieties/WeilGroupCharacters/UniversalOrdinaryDeterminantRing`, `…/AutomorphicVarieties/PatchingModules/NilpotentLevelLowering/LevelModule`, `NilKill` and `PairRel`, and `…/HeckeAlgebras/OrdinaryHeckeCharacters/HeckeDeterminantSatisfiesDeformationRelations`. The repair: name the commit in the References, and after each of the four claims give the file and declaration that states it, with what differs from the README's form.

At the same time make the three lists agree. Line 243 attributes all of 4.2a to the formal proof, lines 539 and 640 only "the existence of the level modules and comparison maps"; lines 154–156 treat 3.13a (f) as one of its statements, and lines 539 and 640 do not list it.

## R03 (P2) — 3.13a (f) is kept to `2 ≤ n ≤ 4` and to the clauses (w1), (w2), although the README itself says its route uses neither

A library target narrower than its own proof is a restriction taken from one route, which every later user inherits. The text says so: "the route above does not depend on `n`, but (f) for other `n` is not a statement of [FormalProof] and is not claimed here" (lines 155–156), and the consumers "use 3.13a (f) in the range `2 ≤ n ≤ 4`" (line 524). I checked the three inputs of the route: PotentialAutomorphyInfrastructurePartII §3.5 (1) (descent, any `n`), §0.5 (ordinary Galois representation of level potentially prime to `l` gives `ι`-ordinary, any `n`) and the first Check of §3.12; none restricts `n`. The step from the flag to potential crystallinity needs only that no two characters are in ratio `ε` (then `D_cris(W^∨(1))^{φ=1} = 0` for each graded piece), so (w1) is not used; (w2) is not used anywhere in the route.

The Conventions already provide the repair ("A wider or sharper form stated beside it is this roadmap's own, proved by the route written here"), and 9.9 (d′) and 10.1 use it. State (f) for every `n ≥ 1` without (w1) and (w2) as this roadmap's statement, and record beside it that the formal proof has the case `2 ≤ n ≤ 4` with (w1) and (w2). If a step does need one of them, name the step.

## R04 (P2) — In 10.1, "`length_O / e_O`" does not take values in `ℕ∞`

"Their lengths `length_{ℤ_p}` (or `length_O / e_O`) take values in `ℕ∞`" (lines 438–439). For `O = ℤ_p[√p]` and the module `O/ϖ`, `length_O = 1` and `e_O = 2`, so the normalized length is `1/2`. The two quantities in the sentence are also different normalizations (`length_{ℤ_p}(O/ϖ) = f_O`, not `1/e_O`), so "or" misleads. Say that `length_{ℤ_p}` takes values in `ℕ∞` and that the `O`-length divided by `e_O` takes values in `(1/e_O)ℕ ∪ {∞}`, as the sibling BernoulliBoundsForClassGroupEigenspaces does in its Conventions.

## C01 — The second Check of 10.1 says the wrong thing fails at `e = 0`

"enlarging `S` can add unramified-at-`v` classes that are nontrivial at `v`" (lines 489–490). Enlarging `S` adds no such class to either kernel: `Ш¹_{S′;Σ∪(S′∖S)}` always lies in the image of `Ш¹_{S;Σ}` under inflation, and at `e = 0` the inclusion can be strict, because a class of `Ш¹_{S;Σ}` need not vanish at `v`. For instance `F = ℚ`, `p = 3`, `S = {3, ∞}`, `Σ = ∅`, `S′ = S ∪ {7}`: `Ш¹_{S;∅}(ℚ, ℚ₃/ℤ₃) = ℚ₃/ℤ₃` (characters of the cyclotomic `ℤ₃`-extension), while `Ш¹_{S′;{7}} = 0`, since `7 ≢ 1 mod 9` makes the Frobenius at `7` a topological generator. Write that inflation does not land in the smaller kernel.

## C02 — The determinant hypothesis of 9.9 (c) is not used and is not definite

"`det W = η_F` (times a power of the cyclotomic character)" (line 315) leaves the power open, and the route does not use it: `ad r ≅ ad⁰W ⊕ η_F` holds for every `W` whose restriction to `G_F` has a `𝒢₂`-valued extension as in (a), because the symplectic adjoint of a trace-zero `2 × 2` matrix is its negative. Drop the hypothesis, or say which step needs it and which powers are meant.

## C03 — One step of the route of 4.2a is called "a theorem of the literature" with no reference and no supplier

"that these characters are those of the semisimplified Langlands parameter of `π` is not given here" (line 261; line 539 calls it a theorem of the literature). An implementer has nowhere to look. Name the reference, or the supplier section: EndoscopicTransferAndUnitaryTraceComparison constructs the semisimple local parameter, and SmoothRepresentationsOfLocalGroups §§SR.3.1 and SR.3.3 have supercuspidal support, so the statement may already have an owner.

## C04 — The description lists fewer formal-proof statements than the README

The description says "In this roadmap those are the existence of the level modules and comparison maps of 4.2a, and the vanishing theorem 9.9 (d)". The head also takes from the formal proof the range and clauses of 3.13a (f) (lines 154–156), all of 4.2a (line 243) and the instance of 10.1 (lines 465–468). Once R02 settles the list, repeat it in the description.

## N01 — The fifth Check of 3.13a tests nothing

"The integer congruences that a consumer extracts from `V(J)` …" (lines 187–188) is a remark about consumers; it could move to Downstream consumers.

## N02 — `Sp` in 4.2a depends on `N`

It is defined through `charpoly D(φ_{N,j})` (line 237) but written without an index.

## N03 — The family index says the family "follows" a source

`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 9: "The family follows the formal Lean proof". A wording such as "its targets include results first proved in" keeps the credit without describing the plan as a source's.

## Questions for the author

- Is 9.9 (a) kept to `n ∈ {2, 3}` for a reason? The route needs only that the derived group of the identity component, acting irreducibly, contains regular semisimple elements, and the route of (b) already uses this in rank four. By my count every irreducible representation of a connected semisimple group of dimension at most `7` has weights of multiplicity one (the first exception being the adjoint representation of `SL₃`), but I did not check the classification against a reference.
- Does the formal statement of 9.9 (d) carry exactly the hypotheses written here, and does the formal statement of 4.2a have the exponent `n!`? No locator is given, and the copy available to me holds module names and kernel terms, not readable statements.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 3.13a, direction of `Frob_w` (last Check) | `n = 2`, constants, weight 0 | Hecke polynomial `X² − (Nw+1)X + Nw`; `(1 ⊕ ε̄⁻¹)(Frob_w)` geometric has eigenvalues `1, Nw`; dual twist `ε̄⁻¹` ✓; agrees with PAIPII §3.7 | holds |
| 3.13a (1), ordinary relation (third Check) | flag with sub `ψ₁`; scalar `ρ`; `(φ, θ, φ)`; `det(χ₁ ⊕ χ₂)` | flag: product `0`; scalar: first factor `0`; `(φ,θ,φ)`: product `0`, flag forces dependent classes; both orders give trace `0` | holds |
| 3.13a, first Check | `n = 1` | relation gives `ψ = χ|_{G_ṽ}`; pro-`l` twists with `θθ^c = 1` are trivial on `𝔸_{L⁺}^×`, descend through `x/x^c` | holds |
| 3.13a (b), kernel of `D` | GMA of type `(1,…,1)`, `w = xz` | `e_a w e_a = tr(w e_a)e_a = 0`; closed words vanish; `e_aRe_b` words have `D(1 − tv) = 1` | holds |
| 3.13a (b), `v₀` | residual characters equal, `Nv₀ ≢ 1 mod l` | tame eigenvalue orbits under `ζ ↦ ζ^{Nv₀}` of size `> 1` would give distinct residual Frobenius eigenvalues; so inertia acts unipotently, `D` unramified | holds |
| 3.13a, `Λ` and `[L⁺:ℚ] ≥ 2` | product formula for `η_{L/L⁺}(−1)` | `(−1)^{[L⁺:ℚ]} = 1`, so the degree is even; `Λ` has `n[L⁺:ℚ]` variables | holds |
| 3.13a (d), bound | all `m_i = 1` | eigenvalues `q^{(n−1)/2}α`, `q^{−1/2} < |α| < q^{1/2}`; ratio `< q` | holds |
| 3.13a (f) | route inputs for general `n`; `W = εη`, `η ≠ 1` | PAIPII §§3.5(1), 0.5 for all `n`; `h²(εη) = 0`, `H¹ = H¹_f`; only ratio exactly `ε` obstructs | R03 |
| 3.13a (g) | `D ⊗ γ`; finite `Q`; `O`-valued `γ` | relation scaled by `γ(h)∏γ(g_i)`; `(B/J)[Q][1/l]` separated by pairs (point, character); `τ_γτ_{γ⁻¹} = id` | holds |
| 4.2a, `f`, `Sp` | distinct and coinciding `χ̄_i(σ_j)`; `q = 0`; `n = 1` | `f̄ = ∏(ū_i − ū_{i′})² ≠ 0`; `n = 2` coinciding: `Sp` free of rank 2, ramified; `q = 0`: `f = 1`, `Sp = B` | holds |
| 4.2a, relations and exponent | generic classical point; irreducible `π` with `π^{Iw₁} ≠ 0` | both `r` vanish on `⊕χ_i`; `dim π^{Iw₁} ≤ dim π_N ≤ n!`; nilpotent on dimension `d` has `d`-th power `0` | holds |
| 4.2a, level modules and maps | — | no locator into the formal proof; not checked | R02 |
| 9.9 (a) | `n = 2, 3`; CM curve, `p` inert, `E` small | derived groups `SL₂`, `SL₃`, `Sym²SL₂` have regular elements; CM case: torus, derived group trivial, not enormous | R01 |
| 9.9 (b) | `Sp₄`, `Sym³SL₂`, `SL₂ ⊗ SL₂` | `X₁₁` of `I`, `diag(1,0,0,−1)`, `diag(1,−1,−1,1)` is `1, 1, 1`; `2 ⊗ 2` preserves a symmetric form | holds given R01 |
| 9.9 (c) | any `W` with odd polarization | pairing `ω(W(c)x, y)` symmetric iff `det W(c) = −1`; `ad r = ad⁰W ⊕ η_F`; `H¹_f(ℚ, η_F) = 0` | holds; C02 |
| 9.9 (d), Check on (i) | pure point, Frobenius lift in `ker ε` | `|a_i/a_j| = p^{±(m_i − m_j)} ≠ 1`, so ratios have infinite order; (i) excludes ratio `ε` up to finite order | holds |
| 9.9 (d) | — | no locator; hypotheses not compared with the formal statement | R02 |
| 9.9 (d′) | gap `1` and `≥ 2`; dimension count | `h²(ε^kη) = 0` unless `k = 1, η = 1`; embedding dimension `≤ dim Λ − 1 ≤ dim (B/J₀)_𝔭` | holds |
| 10.1 (a), (b) | `F = ℚ`, `S = {p, ∞}`, `T = ℤ_p(1)` | kernels commute with `colim` and `lim`; `(T/pⁿ)^D = T^D[pⁿ]`; `Ш¹_S(ℚ_p/ℤ_p) = 0 = Ш²_S(ℤ_p(1))` | holds |
| 10.1 (e) | `e ≠ 0`; `e = 0`, `p = 3`, `v = 7` | `Nv^{−e} − 1 ≠ 0` acts surjectively; at `e = 0`: `ℚ₃/ℤ₃` against `0` | holds; C01 |
| 10.1, first Check | `p = 2`; `p = 3`, `S = {3, 61, ∞}` | `H¹(ℝ, ℚ₂/ℤ₂(−e))` is `ℤ/2` (even), `0` (odd); `3⁵ ≡ −1`, `3²⁰ ≡ 1 mod 61` | holds |
| 10.1, fourth Check | `T = ℤ_p(1)`, `ℤ_p` | `Ш¹_S(ℚ_p/ℤ_p) = Hom(Cl_S, ℚ_p/ℤ_p)`; `rank H²(G_S, ℤ_p) = −r₂ − 1 + (1 + r₂ + δ) = δ` | holds |
| 10.1, lengths | `O = ℤ_p[√p]`, `O/ϖ` | `length_O/e_O = 1/2`; `length_{ℤ_p} = 1` | R04 |
| `Suggested.lean` | elaboration at the pins | exit 0, no output, no declarations; docstring's library names exist | holds |

- Source locators checked against the text: NT23 Theorem A (lines 57–60, p. 2), Definition 2.23 (937–939), Lemma 2.25 (948–949), Lemma 2.28 and Example 2.29 (1059–1082), Theorem 5.2 (1906–1909); Che14 Proposition 3.7 and Example 3.6 (1778–1786); BZ77 §2.12 (329–334); Announcement (lines 9–13, 45–53, 180–181).
- Library declarations opened at the pins: `Field.absoluteGaloisGroup` and `.map` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42, 87`), `ContinuousCohomology.tateShafarevich` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:72`), `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:105`), `PolynomialLaw` (`Mathlib/RingTheory/PolynomialLaw/Basic.lean:80`), `BDeRham` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:88`); `TauCeti.unramifiedOutsideKummerCohomology` is referenced in Tau Ceti. Neither library has `G_{K,S}`.
- Cross-roadmap citations resolved: about 75 section ids in 20 roadmaps, by heading, on main or at the open heads of PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, BaseChangeAndGaloisRepresentationsForUnitaryGroups and the three consumers; all exist. PAIPII §§0.5, 3.5–3.7 and ModularityAndLanglandsExtensions §4.1 read in full, PAIPII §§3.12–3.14 at the cited statements and Checks.
- Dependency check: `depcheck: 171 roadmaps, 2001 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. `lake env lean` on `Suggested.lean`: exit 0, no output. No declarations, so the `#check @name` comparison and the one-tactic probe had nothing to act on. No change outside the folder and the family index.
- Headlines (the Hecke ideal, the patching data, adjoint vanishing, the kernels with lattice coefficients): none statable at the pins for lack of `G_{L,S}`; each is named in the module docstring with what it lacks. Nothing is padding.
- Overlap check: read UniformWildKernelBounds, ModularityAndLanglandsExtensionsPartII, PotentialAutomorphyInfrastructurePartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, CongruenceModulesOfThetaLifts, GlobalGaloisDeformations, ClassicalSerreModularity, AutomorphicGaloisRepresentationsPartII; big ordinary Hecke algebras and Taylor–Wiles data at non-Eisenstein ideals: PotentialAutomorphyInfrastructurePartII; Newton–Thorne vanishing: ModularityAndLanglandsExtensions §4.1; Sha kernels for finite modules and lattice Poitou–Tate: ArithmeticGaloisDuality; the universal ordinary determinant ring, the Hecke ideal, its patching data and the lattice kernels: this roadmap, cited (not restated as targets) by UniformWildKernelBounds, BernoulliBoundsForClassGroupEigenspaces and CongruenceModulesOfThetaLifts.
- Source independence: 7 passages compared with 4 sources (NT23, Che14, BZ77, Announcement), none shared beyond forced terms; largest share FormalProof, 14 of 21 in-text source citations, none with a locator; its text could not be read, and its contents were compared through its module tree only: independent as far as that shows (the layers carry PotentialAutomorphyInfrastructurePartII's numbering).
- Research link: 9.9 (a)–(c) apply Newton–Thorne's vanishing of adjoint Bloch–Kato Selmer groups (NT23, Theorem A, 2023); 3.13a and 4.2a carry Hida theory and Taylor–Wiles patching on definite unitary groups to Eisenstein ideals through Chenevier's determinants (Che14); the family uses them toward Alpöge's announced formal proof (2026). Rests on the README, NT23, Che14 and the Announcement.

## Not verifiable

- 4.2a (level modules, comparison maps, exponent), 9.9 (d), the range and clauses of 3.13a (f) and the instance of 10.1, against [FormalProof]: the README gives no commit, file or declaration; the sources service does not read the repository's host; the copy the operator holds has module names and kernel terms, not readable statements.

## Source issues

- none

## For the human reviewers

- Scope: the level modules and comparison maps of 4.2a and all of 9.9 (d) rest only on an unpublished, unrefereed Lean formalization announced on 20 November 2026; the announcement says a written account is still to come (Announcement lines 45–49). README lines 243–244, 321, 377–378.
- Licence: the licence of the formal-proof repository was not read (its host is in no licence class of the sources service). The description says the roadmap was drafted by reading that proof.
- Not tested: [FormalProof] has the largest share of the citations (14 of 21) and could not be read at the level of statements; wording and arrangement were compared with its module names only.
