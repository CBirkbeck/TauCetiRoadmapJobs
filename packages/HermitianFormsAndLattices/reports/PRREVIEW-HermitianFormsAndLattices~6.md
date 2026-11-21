# Review of HermitianFormsAndLattices (pull request #2882 at 3c0b86f)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 40 lines changed since `4e39735` and of the pull request's title and description. The new route of 6.2(c) is correct (the archimedean fibre measure is `β_∞(L)` times the compact-dual measure for every signature, so (c) follows from (b) and (a)), the new locator for strong approximation with an arbitrary finite set of places matches the source, and the description now agrees with the head. One small correction is carried over (four statements still have no locator at the claim) and four format notes stand from the previous review, none blocking. The human reviewers decide the provenance of the statements labelled as forms of the formal proof, which I could not read.

## C01 — Siegel's main theorem (6.5), Weil's rank-one identity (6.0a), Jacobson's theorem (1.3) and the theta inversion (7.1) still have no locator at the claim

The hypotheses of these four statements cannot be checked against a source, for instance whether [Weil65] has the mean-value identity of 6.5(a) for every signature and every `1 ≤ k ≤ n − 1`. Their sections name no source in the text; [Weil65], [Braun], [Jacobson] and [CohenResnikoff] appear only in the References, against lists of sections (lines 3652, 3676, 3680, 3714). Each has a complete route, so nothing is unsupported. The fifth statement of this remark in the previous review, 2.5(d) for a set `S` not containing the archimedean places, now has its locator (below).

One clause at each statement with the theorem or section number and the page would settle it, as was done at 2.5(d), 4.4(d) and 6.1a(d).

## N01 — Two attributions to [Kirschmer] are a little wider than its statements

Unchanged from the previous review. In 2.1 (lines 564–565) Theorem 3.2.3 and Corollary 3.2.4 cover (a) and the isotropy criterion of (c), not that both classes occur or that a binary space represents every `c`. In 5.4 (lines 1914–1916) Proposition 5.2.5 is for neighbours at one prime of `E`, with an extra hypothesis at a split place; the `w`-neighbours of (a) allow both primes.

## N02 — In the third Check of 6.3 the `1/72` in "`2·(1/72) = 1/36`" is the mass of `O_E²` in `⟨1, 1⟩`, not the norm-maximal mass named just before it

Unchanged (line 2877). "has mass `2·mass(O_E²) = 1/36`" would say which mass is meant.

## N03 — In 6.1a(a) and its route `η_v^n` is used as a number

Unchanged (line 2516): `η_v` is a character of `F_v^×` in the Conventions, and `η_v^n q_v^{−n}` means `η_v(ϖ_v)^n q_v^{−n}`. Writing the value, or a sign as in 6.0a, would remove the ambiguity.

## N04 — "The formal proof that the family follows" is identified nowhere in this README

Unchanged (lines 50–55 and every clause labelled *The form of the formal proof*). The Summary links the family index, but not for this; one clause there saying that the index names the formal proof would let a reader of this file alone find what is meant.

## Previous findings

The previous review had no finding; its small corrections and format notes are accounted for here.

- C01 — repaired: the description now reads "states 2 headline theorems … and the case of the first for CM extensions, the setting of the formal proof, proved from it", and lists the fifteen sections that carry a form of the formal proof; the list matches the head.
- C02 — repaired: "`hermitian_congr_iff_forall_place_of_cm` is not this form: it is the Gram-matrix equivalence above restricted to CM extensions, a corollary of `hermitian_congr_iff_forall_place`" (README lines 730–731); the docstring says the same.
- C03 — repaired: "The fibre measure of (b) is `β_∞(L)·μ^c`, with `β_∞(L)` the value of the formula of 6.1b, so (c) follows from (b) and (a)" (lines 2776–2777), with a route (lines 2792–2800) that I recomputed; 6.1b is in the Needs.
- C04 — repaired: "(a) contains the mass formula that AbelianSchemesAndArithmeticModuliPartII F5.7 states for that case, with its local factors at the ramified places, dyadic ones included, in the normalisation of 6.1" (lines 2768–2770), agreeing with the Scope section.
- C05 — partly repaired: 2.5(d) now cites "[Rapinchuk], Theorem 2.3, p. 12" (line 676), verified, with a References entry; 6.5, 6.0a, 1.3 and 7.1 are as before (C01 above).
- N01, N02, N03, N04 — not repaired: unchanged text; N01–N04 above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.2(c) compact-dual mass formula, and the Conventions sentence | `H = I_{p,q}`; `n = 2`, `H = diag(1, −1)`; `n = 1` | `Z = iW`, `W ∈ 𝔲(p,q)`: `Z^*H + HZ = 2HZ`; `Z = [[ia, b],[b̄, id]]`, `HZ = [[ia, b],[−b̄, −id]]` skew-Hermitian; `n = 1`: left side `Σ 1/|U(M)| = mass(O_E)` | holds | none |
| 6.2(c), last step | unimodular `L`, `E/F` unramified | `𝔳(L) = O_F = 𝔳(O_E^n)`, same `β_∞`; `L_vβ_v = ∏_{k=2}^{n} L_v(k, η_v^k)^{−1}` by 6.1a(a) at every finite `v`; quotient is 6.2(a) for `O_E^n` | holds | none |
| 2.5(d) general `S`, against Rapinchuk Theorem 2.3 | `SU(V)`, `n ≥ 2`; `S = {v}` split finite; `S = {∞}` definite | source: `G(K)` dense in `G(𝔸_S)` iff simply connected and `G_S` noncompact (lines 565–571, p. 12); `SL_n(F_v)` noncompact; definite `S = {∞}`: compact, fails, as the Check says | holds; locator matches | none |
| 3.1, `hermitian_congr_iff_forall_place_of_cm` | the term in the file | the classical statement with `IsTotallyReal F`, `IsTotallyComplex E` added; closed by one application; README and docstring call it a corollary | holds; marked as corollary | none |
| 6.2, sentence on F5.7 | F5.7 at its open head | F5.7 lists the unitary mass formula among what it proves (its README line 2785) and "owns CM unitary mass" (line 3168); 6.2(a) is for every CM extension and lattice | holds | none |
| Description against the head | the list of sections; the Lean count | label *The form of the formal proof* in exactly 2.5, 3.1, 4.0a, 4.0b, 4.1, 4.9, 4.11, 5.4, 5.9, 6.2, 6.3, 6.4a, 6.4b, 6.4c, 6.5; two sorried theorems and one proved corollary | agrees | none |

The rows for untouched statements stand as in the previous review, of `4e39735`. None of the sampled targets (1.3, 1.4, 2.2, 3.2, 4.0a, 4.3, 4.10, 4.11, 5.1, 5.8, 6.0a, 6.1, 6.1d, 6.4a, 7.2) falls in a changed passage.

- Source locators checked against the text: 1 new (Rapinchuk, Theorem 2.3, p. 12, at Rapinchuk lines 565–571: statement, page and hypotheses agree; the source's density in the adeles away from `S` is the README's density of `SU(V)(F)·SU(V)(F_S)` in the full adele group).
- Cross-roadmap citations resolved for the changed passages: AbelianSchemesAndArithmeticModuliPartII F5.7 (open head, lines 2785, 3168), AdelicAlgebraicGroups §4.2 (main), MetaplecticAutomorphicForms §3.2a (main, named in the description).
- Dependency check: `depcheck: 171 roadmaps, 1995 edges, 0 problem(s)`. Every automatic check passed; no change outside the folder and the family index.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 65 and 112) and nothing else. No statement changed since `4e39735`; only one docstring did.
- Title and description read against the head and the folder's change (a new roadmap, 96 headings and 3 declarations added, none removed): no sentence contradicted, no change left unstated.

Overlap check: read OrbitMeasuresOnAdelicGroups, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, IntegralLattices, GeometryOfNumbersAndQuadraticArithmetic, EndoscopicTransferAndUnitaryTraceComparisonPartII, AdelicAlgebraicGroups at the previous review; the change adds no object. Strong approximation for `S` containing the archimedean places: AdelicAlgebraicGroups §4.2, cited; the general `S` for `SU(V)`: this roadmap, 2.5(d). The unitary mass over imaginary quadratic fields of class number one: AbelianSchemesAndArithmeticModuliPartII F5.7, recorded in the Scope section and now consistently in 6.2.

Source independence: changed passages only: 3 passages compared with 1 source (Rapinchuk), none shared; largest share Kirschmer, 22 of 34 in-text locators; contents compared with Kirschmer at the previous review: independent; the change adds, removes or reorders no layer.

Research link: Layers 5–6 state Siegel's mass formula for Hermitian lattices as in Kirschmer 2016 (Theorem 4.2.3, Proposition 4.2.7), with the local densities of Gan–Yu 2000 and Weil's `τ(U(V)) = 2` (Weil 1965); Layer 3 is Landherr 1936. The family's theta-lift roadmaps consume them. Rests on Kirschmer's text and the README's Downstream consumers.

## Not verifiable

- The formal proof the README refers to: not among the texts at hand. That 6.2(c) with the compact-dual measure is the form it has is unchecked; what I checked is that (c) follows from (b) and (a).
- The source of AbelianSchemesAndArithmeticModuliPartII F5.7: not read, so the clause of 6.2 that its local factors are "in the normalisation of 6.1" is unchecked.
- [Weil65], [Braun], [Jacobson], [CohenResnikoff]: no locator to check (C01); the other texts listed in the previous review were not opened again.

## Source issues

- none

## For the human reviewers

- Provenance: the README states "forms of the formal proof" in fifteen sections and `Suggested.lean` has a CM corollary for it; the formalisation is named only in the family index and the description, and I could not read it or compare the Lean with it.
- Scope: explicit results exclude the dyadic places that ramify in `E` (4.1, 4.2(b), (d), scale-maximal lattices in 4.4, 6.1a(b), (d), 6.1d, 6.3(a), (b)); the Scope section says so. 6.1, 6.2 and the first formula of 6.3 cover every place.
- Licence: Kirschmer's Habilitationsschrift (2016), with 22 of the 34 in-text locators, is read from its author's page; Rapinchuk's survey from arXiv (1207.4425v1); the journal articles Kirschmer quotes and [Weil65] were not read.
