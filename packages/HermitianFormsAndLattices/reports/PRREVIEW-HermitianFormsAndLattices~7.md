# Review of HermitianFormsAndLattices (pull request #2882 at c9d8907)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 35 lines changed since `3c0b86f` (the locator for Jacobson's theorem, the paragraph and reference for the formal proof, and its file and declaration locators in 6.0b, 6.2, 6.3 and 6.4), of the family index and of the pull request's text. The Jacobson locator matches the source, and all seven declarations of the formal proof named in the README exist in the files named and say what the README attributes to them. There are three small corrections and three format notes, none blocking. The human reviewers decide the licence question for the formal proof and whether the family index may carry its new section on reviews.

## C01 — Siegel's main theorem (6.5), Weil's rank-one identity (6.0a) and the theta inversion (7.1) still have no locator at the claim

The hypotheses of these three statements cannot be checked against a source, for instance whether [Weil65] has the mean-value identity of 6.5(a) for every signature and every `1 ≤ k ≤ n − 1`. Their sections (lines 2158, 3130, 3278) name no source; [Weil65], [Braun] and [CohenResnikoff] appear in the References against lists of sections (lines 3699, 3703, 3737). Each has a complete route, so nothing is unsupported. The fourth statement of this remark in the previous review, Jacobson's theorem in 1.3, now has its locator.

One clause at each statement with the theorem or section number and the page would settle it, as was done in 1.3.

## C02 — Three of the new locators into the formal proof leave out restrictions that its declarations carry

The new paragraph of the Conventions (lines 230–233) says that where a target names [FormalProof], the hypotheses and ranges recorded are those of the proof. A reader who opens the declarations finds more than the text records:

- In 6.0b (lines 2388–2392) no hypothesis is recorded. `GlobalTheory.GaugeEx.exists_isGauge` is for a CM extension, and its compatibility clause is for rank at least 3 and a vector of nonzero norm; 6.0b is for every quadratic extension of number fields. `GlobalTheory.T.unitaryStabilizer_measure_independent_of_path` is for rank at least 4.
- In 6.2, 6.3 and 6.4 (lines 2790–2795, 2867–2869, 2933–2934) the declarations `VolSigIndep`, `GenusMassAt`, `ClassItemsAt`, `VolumeRatio₂` and `MassRatioUnderVolume` are quantified over the proof's own datum of a CM field with its auxiliary choices, not over every CM extension unramified at every finite place.
- These five are propositions (definitions of type `Prop`), not theorems: the file named gives the statement, and its proof is elsewhere (for the independence of the signature, `volume_signature_independent` in `CompanionTheory/AutomorphicTheory/SiegelUnitTheory/VolumeSignatureIndependent.lean`).

Adding "for CM extensions" to the sentence of 6.0b, and one sentence to the Conventions paragraph saying that a declaration named may be the proposition itself and that the formal proof states it for the CM fields it constructs, would make the paragraph true of every locator.

## C03 — The description does not mention two things this head adds

The description says of the family index only that it "lists the sub-roadmaps in merge order". The index now also has a section, *When a roadmap is wrong*, on how contributions that depart from a roadmap are written and reviewed, and it says that the formal proof was published without a licence. The description also does not say that 6.0b, 6.2, 6.3 and 6.4 now name files and declarations of the formal proof, with a [FormalProof] entry in the References pinned to a commit.

A sentence for each would do: "The index also states how a roadmap of the family that is wrong is corrected against the formal proof", and "6.0b, 6.2–6.4 name the files and declarations of the formal proof for the forms they record; the References pin the commit."

## N01 — Two attributions to [Kirschmer] are a little wider than its statements

Unchanged from the previous review. In 2.1 (line 571) Theorem 3.2.3 and Corollary 3.2.4 cover (a) and the isotropy criterion of (c), not that both classes occur or that a binary space represents every `c`. In 5.4 (line 1922) Proposition 5.2.5 is for neighbours at one prime of `E`, with an extra hypothesis at a split place; the `w`-neighbours of (a) allow both primes.

## N02 — In the third Check of 6.3 the `1/72` in "`2·(1/72) = 1/36`" is the mass of `O_E²` in `⟨1, 1⟩`, not the norm-maximal mass named just before it

Unchanged (line 2897). "has mass `2·mass(O_E²) = 1/36`" would say which mass is meant.

## N03 — In 6.1a(a) and its route `η_v^n` is used as a number

Unchanged (line 2528): `η_v` is a character of `F_v^×` in the Conventions, and `η_v^n q_v^{−n}` means `η_v(ϖ_v)^n q_v^{−n}`. Writing the value, or a sign as in 6.0a, would remove the ambiguity.

## Previous findings

The previous review had no finding; its small correction and format notes are accounted for here.

- C01 — partly repaired: 1.3 now reads "([Jacobson], §2, the Theorem and formula (7), p. 267)" (line 428), verified; 6.5, 6.0a and 7.1 are as before (C01 above).
- N01, N02, N03 — not repaired: unchanged text; N01–N03 above.
- N04 — repaired: the References now have "[FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions", with the repository and commit (lines 3741–3745).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.3, locator to Jacobson | `E = ℚ(i)`, `d = −1`; `ℂ/ℝ`, `h = ⟨1, −1⟩` | Source: `i² = −λ`, block `[β, λβ]`; `λ = −d` gives `⟨a, −da⟩`; `d = −1`: `⟨a, a⟩` both sides; `⟨1,−1⟩ ↦ ⟨1,1,−1,−1⟩` | holds; Theorem and (7) at Jacobson lines 134–141, printed p. 267; char `≠ 2` at line 13 | none |
| 6.4(b), sentence on the formal proof | `VolumeRatio₂` read in its file (line 2330) | Formal: `vol W′/vol W = ((2π)^n/(n−1)!)^f·((2v)^f)^{1/2−n}/L(n, η^n)`, rank `≥ 3`, norm `±1`; `2v` root discriminant; reciprocal of README's `|d_F|^{(2n−1)/2}((n−1)!/(2π)^n)^d L(n, η^n)` | agrees, taking `f = [F:ℚ]` (not opened) | none |
| 6.2(c), independence of `(p, q)` | `VolSigIndep` (PNamed.lean line 14) | Two spaces of equal rank, constant signatures `(P, Q)`, `(P₀, Q₀)`: covolumes of fundamental domains equal | agrees with (c) | none |
| 6.3, the form of (c) | `GenusMassAt`, `ClassItemsAt` (lines 112, 171 of the file named) | Signature `(rank, 0)` at every embedding, unimodular base lattice: mass equals that of the standard lattice of rank `n` | agrees; totally positive definite only, as the README says | none |
| 6.0b, sentence on the gauge family | `exists_isGauge` (line 205), `…independent_of_path` | Family is Haar, basis-invariant, compatible for rank `≥ 3` and `β ≠ 0`; matches `n′ ≥ 3`, `t ≠ 0`; CM only; path independence for rank `≥ 4` | agrees; restrictions unrecorded | C02 |
| Conventions, *Statements of the formal proof* | the seven declarations above | Two theorems, five `Prop`-valued definitions; five quantified over the proof's datum | true of 6.2(c), 6.4; incomplete for 6.0b | C02 |

The rows for untouched statements stand as in the previous review, of `3c0b86f`. None of the sampled targets (0.1, 0.2, 1.0, 1.2, 3.2, 3.5, 4.3, 4.10, 4.11, 4.12, 4.13, 5.1, 5.9, 6.0a, 6.1d) falls in a changed passage.

- Source locators checked against the text: 1 published (Jacobson, the Theorem and formula (7), p. 267) and 7 declarations of the formal proof in 6 files, read in the copy the operator holds; all found, in the namespaces the README gives.
- Library declarations: none added or changed; `Suggested.lean` is unchanged since `3c0b86f`.
- Cross-roadmap citations: the changed passages add none; the Needs of 6.0b are unchanged.
- Dependency check: `depcheck: 133 roadmaps, 1480 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 65 and 112) and nothing else.
- Changes outside the folder: the family index only (its README; 53 lines added and 12 removed, among them the section of C03 and the moved entry for FrobeniusRestrictedRieszSums).
- Title and description read against the head: no sentence contradicted; two changes unstated (C03).

Overlap check: read OrbitMeasuresOnAdelicGroups, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, IntegralLattices, GeometryOfNumbersAndQuadraticArithmetic, EndoscopicTransferAndUnitaryTraceComparisonPartII, AdelicAlgebraicGroups at the earlier reviews; the change adds no object and no owner changes. Strong approximation for `S` containing the archimedean places: AdelicAlgebraicGroups §4.2, cited; the unitary mass over imaginary quadratic fields of class number one: AbelianSchemesAndArithmeticModuliPartII F5.7, recorded in the Scope section.

Source independence: changed passages only: 7 passages compared with 2 sources (Jacobson; the formal proof, of which the README gives file paths and declaration names and no text), none shared; largest share Kirschmer, 22 of the 35 in-text locators to published texts; contents compared with Kirschmer at an earlier review: independent; the change adds, removes or reorders no layer.

Research link: Layers 5–6 state Siegel's mass formula for Hermitian lattices as in Kirschmer 2016 (Theorem 4.2.3, Proposition 4.2.7), with the local densities of Gan–Yu 2000 and Weil's `τ(U(V)) = 2` (Weil 1965); Layer 3 is Landherr 1936. The family's theta-lift roadmaps consume them. Rests on Kirschmer's text and the README's Downstream consumers.

## Not verifiable

- The commit the References pin (`40e56ba…`) and the two web addresses: the repository's host is one the sources service does not classify, so nothing was fetched. The declarations were read in the operator's copy, which records another commit (`e50d098…`) of the same repository.
- That the exponent `f` in `VolumeRatio₂` is `[F:ℚ]`: its definition was not opened.
- The source of AbelianSchemesAndArithmeticModuliPartII F5.7 and [Weil65], [Braun], [CohenResnikoff]: as in the previous review (no locator to check, C01).

Automatic checks set aside as false positives: when run again here, the checks reported that this roadmap is not yet listed in the merge order (it is placed after its last supplier) and that three files of the family index lie outside the folder (they are the pull request's own).

## Source issues

- none

## For the human reviewers

- Licence: the family index says the formal proof "was published without a license" and is mirrored for verification only. The README cites its file paths and declaration names (6.0b, 6.2, 6.3, 6.4) and no text; `Suggested.lean` is unchanged.
- Policy: the family index adds a section, *When a roadmap is wrong*, saying what a review of a contribution that departs from a roadmap checks and does not block. Whether an index may set this is yours to decide.
- Provenance: the locators were checked in a copy at commit `e50d098…`; the README pins `40e56ba…`, which I could not read.
- Scope: explicit results exclude the dyadic places that ramify in `E` (4.1, 4.2(b), (d), scale-maximal lattices in 4.4, 6.1a(b), (d), 6.1d, 6.3(a), (b)); the Scope section says so. 6.1, 6.2 and the first formula of 6.3 cover every place.
- Licence: Kirschmer's Habilitationsschrift (2016), with 22 of the in-text locators, is read from its author's page; Jacobson (1940) from the AMS open archive; the journal articles Kirschmer quotes and [Weil65] were not read.
