# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #3027 at e47c8ec)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 15 lines changed since `374b9ce`: the `*Needs:*` lines of 8.14 and 8.19a, which now cite sections of ShimuraCompactifications and AutomorphicBundles instead of whole layers, and the new `*Sources:*` entry of 8.17a. The cited sections exist and state what the lines say of them; the two declarations of the formal proof named in 8.17a were opened and agree with the description given, constant by constant. There is no finding. Accepted with one small correction (the supplier contract for AutomorphicBundles does not yet list the newly cited §12.15) and one format note, carried over; neither blocks. Two facts are left for the human reviewers.

## C01 — The supplier contract for AutomorphicBundles does not list §12.15, which 8.19a now needs

The `*Needs:*` line of 8.19a (line 2312) now cites "AutomorphicBundles §12.15 (Fourier–Jacobi expansions with vector coefficients)". The contract "From TauCetiRoadmap.AutomorphicBundles" (line 2915) still reads "§§0.5, 5.3 (automorphic bundles and their canonical extension). Used in the setting of 8.11–8.19, 8.11, 8.14, 8.15, 8.18, 8.19.", so a reader who takes the contracts as the complete list of what is consumed misses the section, and 8.19a is absent from the places of use. Adding "§12.15 (Fourier–Jacobi expansion with vector coefficients; used in 8.19a)" to that bullet would close this. The contract for ShimuraCompactifications needs no change: it lists Layer 2, which contains §§2.3, 2.6, 2.7 and 2.9, and §7.15.

## N01 — Where `*KNOWN*` and `*NEW*` became `*Sources:*`, the qualifiers they carried still read as if they were sources

Carried over; the text is unchanged. "*Sources:* (this form; …" in 8.14 (line 522), "(statement; …" in 8.14a and 8.14b (lines 588, 653), "*Sources:* ingredients (…" in 8.13, 8.18, 8.18c, 8.18e and 8.19a′ (lines 410, 1404, 1753, 1854, 2468). Dropping "this form;", "statement;" and "ingredients" would fix these.

## Previous findings

The previous report had no finding (no R01); its small correction and format note are accounted for here.

- C01 — repaired: 8.17a (lines 1259–1267) now names `GlobalTheory.T.cuspForms_le_span_shortThetaSeries` and `GlobalTheory.T.short_thetaSeries_dominant_weight_isCuspForm` with their files, and says both assume one named statement; each agrees with the declaration.
- N01 — not repaired: the qualifiers stand as before (N01 above).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 8.17a spanning statement vs `GlobalTheory.T.cuspForms_le_span_shortThetaSeries` | `[E:ℚ] = 2`, `N = p + q`; `p_d = 1`; `p_d = 3` | formal threshold `8·([E:ℚ]/2)·(p+q) + 4 = 8N + 4`; README `4[E:ℚ]·N + 4 = 8N + 4`. Formal: weights antitone, `n` even, last entry positive at `τ ∈ Φ`; span over the coefficient field | equal; `p_d = 1` allowed on both sides, `3 ∣ p_d` excluded on both | none |
| 8.17a level and deeper level vs the same declaration | hypotheses read one by one | formal: similitude level `1`; same form and base point on all components; principal congruence subgroup of level `M` contained; characters trivial at dominant weights; level `M·p_d`, `p_d` coprime to `M`, `3 ∤ p_d`; section nowhere zero and of absolute value `1` at complex frames | the route's list and the `*Sources:*` clause, item for item | none |
| 8.17a second credit vs `GlobalTheory.T.short_thetaSeries_dominant_weight_isCuspForm` | conclusion unfolded | formal: for dominant weight, even `n`, positive last entries, the generating theta series lie in the cusp forms; no lower bound on `n` | "these theta series are cusp forms" | none |
| 8.17a "both take the same named statement as a hypothesis" | first premise of each theorem | both open with the closed premise `Formalism.MainNotions.ModuliIntegralCharts.H1.ChartIndepSt2`; no other closed premise in either | true | none |
| 8.14 `*Needs:*` (line 536): ShimuraCompactifications §§2.3, 2.6, 2.7, 2.9 | each section opened, at this head and on `main` | 2.3 toroidal gluing; 2.6 smooth at neat level for a smooth cone system; 2.7 projective when the cone system is projective; 2.9 model over the reflex field `E(G, X)` | the parenthesis "smooth projective toroidal compactifications and their models over the reflex field" is what the four give | none |
| 8.19a `*Needs:*` (line 2312): ShimuraCompactifications §§7.15, 7.22; AutomorphicBundles §12.15 | each section opened, at this head and on `main` | 7.15 Fourier–Jacobi morphism for `ω^{⊗k} ⊗ M`; 7.22 Koecher, with the dimension-one exception; 12.15 expansion for a finite projective representation of the Levi | as described; 8.19a (I5) uses coefficients of forms of vector weight `κ`, so §12.15 is the right supplier | C01 |

The rows of the previous review for the untouched statements stand as in that review, of `374b9ce`.

- Formal proof: 2 theorems and 9 definitions opened (`SpanningAtDominantWeight`, `ShortInCusp`, `DeltaDat`, `DeltaDat.IsLev`, `UnitC`, `HasPrinc`, `ChiOne`, `Dom`, `LastPos`); both cited files exist at the first commit of the repository, and both names are in the kernel export of the proof.
- Cross-roadmap citations resolved: 7 sections (ShimuraCompactifications §§2.3, 2.6, 2.7, 2.9, 7.15, 7.22; AutomorphicBundles §12.15), each present at this head and on `main` under the cited number and subject.
- Record: no heading, layer, statement or Lean declaration removed since `374b9ce` or against `main` (0 headings removed, 0 declarations changed). The family index's entries for this roadmap agree with the head.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1489 edges, 0 problem(s)`; the change adds no supplier (AutomorphicBundles and ShimuraCompactifications were suppliers already, both on `main`).
- Elaboration of `Suggested.lean`: only the `sorry` warning (line 68). The file is unchanged; the elaborated types of `logPeriod` and `chowlaSelberg_classMean` stand as read before.
- Description read against this head: nothing in it is contradicted; the change removes or renumbers no section, changes no declaration and adds no supplier, so it leaves nothing unstated.

Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (on `main`) as in the previous review; the list by results named is empty, and no open pull request changes this roadmap. The change adds no object; nothing shared.

Source independence: changed passages only. 3 passages (the `*Sources:*` entry of 8.17a and the two `*Needs:*` lines) compared with 1 source (the Lean source of [FormalProof]) and the two supplier roadmaps, none shared; largest share [FormalProof], 113 cited files against at most 5 locators for any published source. Arrangement not compared: the change adds, removes or reorders no layer.

Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967), read as a Faltings height (Colmez 1993). 8.14–8.19 bring Bost's slope method (Bost 1996), arithmetic Hilbert–Samuel and successive minima (Gillet–Soulé 1992, Zhang 1995, Bost–Gillet–Soulé 1994) and Mumford's proportionality (1977) to unitary Shimura varieties. Rests on the README's References.

## Not verifiable

- 8.17a: the formal spanning theorem also assumes, in the proof's own carriers, that the theta series exist as sections at the deeper level and a normalisation of their test functions; the README builds these into its definition of the theta series, and that identification was read, not computed.
- Yuan's published version (Compositio Math. 157, 2021): not opened; the README cites the numbering of arXiv:1808.03960. No changed passage cites it.
- Goldstein (1981–1982), Böcherer (2006), Weissauer (1986), Katz (1976, 1978): no legal copy found in earlier rounds; not retried, and no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Scope: of the 30 sections, 15 are labelled "particular to this proof", 14 "adapted from" and one (8.5) "published". The proof is the formal proof of GRH for Dirichlet L-functions announced on 20 November 2026 (README References), which has not been refereed.
- Licence: the repository of [FormalProof] carries no licence. The README cites its file paths and declaration names only and copies no code; whether citing it in this way needs anything more is for a human to read.
