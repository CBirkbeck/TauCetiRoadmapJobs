# Review of HermitianFormsAndLattices (pull request #2882 at 0c604ca)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 9 lines changed since `c9d8907` (one sentence added to the Conventions paragraph on the formal proof, two sentences of 6.0b) and of the pull request's title and description. The three new restrictions (CM extensions unramified at every finite place for the gauge family; CM extensions and rank at least 4 for the independence of the chain; propositions quantified over the proof's datum) agree with the declarations of the formal proof at the commit the References pin. There are three small corrections, two of them about the description, and three format notes, none blocking. The human reviewers decide the licence question for the formal proof and whether the family index may carry its section on reviews.

## C01 — Siegel's main theorem (6.5), Weil's rank-one identity (6.0a) and the theta inversion (7.1) still have no locator at the claim

Unchanged from the previous review. The hypotheses of these three statements cannot be checked against a source, for instance whether [Weil65] has the mean-value identity of 6.5(a) for every signature and every `1 ≤ k ≤ n − 1`. Their sections (lines 2160, 3133, 3281) name no source; [Weil65], [Braun] and [CohenResnikoff] appear in the References against lists of sections. Each has a complete route, so nothing is unsupported.

One clause at each statement with the theorem or section number and the page would settle it, as was done in 1.3.

## C02 — The description says the family index is carried "with identical content" by every pull request of the family; the copy here differs from the one in #2954

A reader takes the index in this pull request to be the family's text. The description says: "The family index (…) is carried, with identical content, by every pull request of the family". The index README at this head and the one at the head of #2954 (`b5eb3e4`), which carries the whole family, differ in lines 17–22: this copy has "with the changes listed in its notes since" and the clause "the reference to the formal proof in each roadmap names that commit", the other has "changed since, as its notes describe" and no such clause. The index `Suggested.lean` and `metadata.toml` are the same in both, and the index of #2909 is the same as this one.

Dropping the words "with identical content" makes the sentence true whichever copy moves next.

## C03 — The description does not say that #2954 carries this folder as well, nor that the supplier OrbitMeasuresOnAdelicGroups exists only there

A reader of the Dependencies paragraph and of the list of suppliers under it (#2909 alone) cannot tell which pull request merges the folder or where the second family supplier is. 6.0b needs OrbitMeasuresOnAdelicGroups §§2.6 (*homogeneous-gauge-measure*) and 3.4a (*tamagawa-number-unipotent-radical*), and the supplier contracts have a subsection for it (line 3598); that roadmap has no pull request of its own and is at the head of #2954 only, where both sections are found. #2954 also carries this folder: at its head `README.md` and `Suggested.lean` of the folder are the same files as here. The description says only: "Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first."

A sentence in the Dependencies paragraph would do, for example: "#2954 carries the whole family, this folder included, and takes each revision of the folder from here; the family supplier OrbitMeasuresOnAdelicGroups (6.0b) is carried by #2954 only, DiscreteSeriesCoefficientsAndAutomorphicMetrics by #2909 as well."

## N01 — Two attributions to [Kirschmer] are a little wider than its statements

Unchanged. In 2.1 (line 571) Theorem 3.2.3 and Corollary 3.2.4 cover (a) and the isotropy criterion of (c), not that both classes occur or that a binary space represents every `c`. In 5.4 (line 1922) Proposition 5.2.5 is for neighbours at one prime of `E`, with an extra hypothesis at a split place; the `w`-neighbours of (a) allow both primes.

## N02 — In the third Check of 6.3 the `1/72` in "`2·(1/72) = 1/36`" is the mass of `O_E²` in `⟨1, 1⟩`, not the norm-maximal mass named just before it

Unchanged. "has mass `2·mass(O_E²) = 1/36`" would say which mass is meant.

## N03 — In 6.1a(a) and its route `η_v^n` is used as a number

Unchanged: `η_v` is a character of `F_v^×` in the Conventions, and `η_v^n q_v^{−n}` means `η_v(ϖ_v)^n q_v^{−n}`. Writing the value, or a sign as in 6.0a, would remove the ambiguity.

## Previous findings

The previous review had no finding; its small corrections and format notes are accounted for here.

- C01 — not repaired: 6.5, 6.0a and 7.1 name no source at the claim (C01 above).
- C02 — repaired: 6.0b now reads "For a CM extension unramified at every finite place, the quotient of `τ_G` by `τ_H` …" and "(two chains of two vectors of nonzero norm with the same orthogonal complement, `n′ ≥ 4`)"; the Conventions add the sentence on propositions and the proof's datum. All three verified.
- C03 — repaired: the description now names the section *When a roadmap is wrong*, the licence statement, and the files and declarations cited in 6.0b, 6.2 and 6.3 with the pinned commit.
- N01, N02, N03 — not repaired: unchanged text; N01–N03 above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.0b, sentence on the gauge family | `GlobalTheory.GaugeEx.exists_isGauge` (line 205 of the file named); its hypothesis `CMData`; `E = ℚ(i)`, `P = (1+i)`; inert and split primes | Hypothesis: `F` totally real, degree 2, conjugation fixed field `F`, and at each maximal `P` some `θ` with `θ − θ̄ ∉ P`. `ℚ(i)`: `θ − θ̄ = 2bi ∈ P` always, excluded. Inert: `θ` a residue generator. Split: `θ ∈ P̄ ∖ P`. Compatibility clause: rank `M + 1 ≥ 3`, `β ≠ 0` | agrees with "CM extension unramified at every finite place", `n′ ≥ 3`, `t ≠ 0` | none |
| 6.0b, sentence on independence of the chain | `GlobalTheory.T.unitaryStabilizer_measure_independent_of_path` (the statement file named) | Hypothesis `IsCMExt` (totally real, totally complex, degree 2; no condition at finite places); Gram matrix of size `M + 2` with `2 ≤ M`, so rank `≥ 4`; two chains `(x₁, y₁)`, `(x₂, y₂)`, each step with norm `≠ 0`; frames of the complements equal (`B₁C₁ = B₂C₂`) | agrees with "For a CM extension", "two chains of two vectors of nonzero norm with the same orthogonal complement, `n′ ≥ 4`" | none |
| Conventions, sentence on propositions and the datum | `VolSigIndep`, `VolumeRatio₂`, `MassRatioUnderVolume`, `GenusMassAt`, `ClassItemsAt` | All five are definitions of type `Prop` over one datum; its field for the CM extension is the `CMData` above, so unramified at every finite place; `exists_isGauge` and the path statement are theorems | agrees: "may be the proposition", "(6.2–6.4)", "all unramified at every finite place" | none |
| 6.2(c) with 6.4(b), as cited by the changed Conventions sentence | `VolumeRatio₂` | rank `≥ 3`, constant signature `(P, Q)`, vector of norm `+1` if `P ≥ 1` or `−1` if `Q ≥ 1`; README line 2936: rank `n ≥ 3`, same signature at every real place, norm `±1` | agrees | none |

The rows for untouched statements stand as in the previous review, of `c9d8907`. None of the sampled targets (0.1, 1.0, 1.6, 1.7, 2.3, 4.1, 4.3, 4.4, 4.6, 4.9, 4.11, 4.13, 5.2, 5.6, 6.1a) falls in a changed passage.

- Source locators checked against the text: 7 declarations of the formal proof in 6 files, and 3 definitions they rest on, read in the operator's copy; each file exists at the pinned commit `40e56bab` and is unchanged between it and that copy.
- Library declarations: none added or changed; `Suggested.lean` is unchanged since `c9d8907`. Its three elaborated signatures were compared with README 3.1 and 3.2: no binder lost.
- Cross-roadmap citations: the changed passages add none. OrbitMeasuresOnAdelicGroups §§2.6 and 3.4a (the Needs of 6.0b) resolved at the head of #2954.
- Dependency check: `depcheck: 133 roadmaps, 1480 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 65 and 112) and nothing else.
- Changes outside the folder: the family index only (three files, the pull request's own); unchanged since `c9d8907`.
- Title and description read against the head, sentence by sentence: the list of sections with *The form of the formal proof* (2.5 … 6.5) matches the README; the count of Lean statements, the suppliers on main (MetaplecticAutomorphicForms §3.2a, AbelianSchemesAndArithmeticModuliPartII F5.7), the sources paragraph and the validation sentence hold; one sentence contradicted (C02), one fact unstated (C03).
- Padding: `hermitian_congr_iff_forall_place_of_cm` is proved in the file from the general statement and its docstring says so; nothing new.

Overlap check: read OrbitMeasuresOnAdelicGroups at the head of #2954 (the measure on a homogeneous space and the Tamagawa number of a group with unipotent radical: owner OrbitMeasuresOnAdelicGroups, cited by 6.0b); ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, IntegralLattices, GeometryOfNumbersAndQuadraticArithmetic, EndoscopicTransferAndUnitaryTraceComparisonPartII and AdelicAlgebraicGroups were read at the earlier reviews; the change adds no object and no owner changes.

Source independence: changed passages only: 3 passages compared with 1 source (the formal proof, of which the README gives file paths and declaration names and no text), none shared; largest share Kirschmer, 22 of the 35 in-text locators to published texts; contents compared with Kirschmer at an earlier review: independent; the change adds, removes or reorders no layer.

Research link: Layers 5–6 state Siegel's mass formula for Hermitian lattices as in Kirschmer 2016 (Theorem 4.2.3, Proposition 4.2.7), with the local densities of Gan–Yu 2000 and Weil's `τ(U(V)) = 2` (Weil 1965); Layer 3 is Landherr 1936. The family's theta-lift roadmaps consume them. Rests on Kirschmer's text and the README's Downstream consumers.

## Not verifiable

- The two web addresses of the References ([FormalProof], [Announcement]): not fetched; the repository's host is one the sources service does not classify. The declarations were read in the operator's copy, compared file by file with the pinned commit.
- That the exponent `f` in `VolumeRatio₂` is `[F:ℚ]`: as in the previous review, its definition was not opened.
- [Weil65], [Braun], [CohenResnikoff]: no locator to check (C01).

Automatic checks set aside as false positives: run again here, the checks reported that this roadmap is not yet listed in the merge order (it is placed after its last supplier, and the check against the candidate order reports no problem) and that three files of the family index lie outside the folder (they are the pull request's own).

## Source issues

- none

## For the human reviewers

- Licence: the family index says the formal proof "was published without a license" and is mirrored for verification only. The README cites its file paths and declaration names (6.0b, 6.2, 6.3) and no text; `Suggested.lean` is unchanged.
- Policy: the family index has a section, *When a roadmap is wrong*, saying what a review of a contribution that departs from a roadmap checks and does not block. Whether an index may set this is yours to decide.
- Merge: #2954 carries this folder with the same two files; the family index README here differs from its copy in lines 17–22. Which pull request merges the folder is not stated in the description.
- Scope: explicit results exclude the dyadic places that ramify in `E` (4.1, 4.2(b), (d), scale-maximal lattices in 4.4, 6.1a(b), (d), 6.1d, 6.3(a), (b)); the Scope section says so. 6.1, 6.2 and the first formula of 6.3 cover every place.
- Licence: Kirschmer's Habilitationsschrift (2016), with 22 of the in-text locators, is read from its author's page; Jacobson (1940) from the AMS open archive; the journal articles Kirschmer quotes and [Weil65] were not read.
