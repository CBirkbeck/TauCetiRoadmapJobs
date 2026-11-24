# Review of ChowFormsAndHeightsOfSubvarieties (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ChowFormsAndHeightsOfSubvarieties/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 108 changed lines since `aecb53a`. I checked the new Origin, Method and Corollary labels of 5.1, 6.1 and 6.2 against the sources they now cite (Soulé 1991, Philippon 1991, Chambert-Loir–Thuillier 2009, Chambert-Loir 2010 and Sombra 2005 were read; Bost–Gillet–Soulé could not be read), against the formal proof's `metricChange`, and against the new supplier sections of HeightsRationalPointsAndObstructions and DiophantineApproximationAndTranscendence at this head. There is one finding. After this change, the change-of-metric formula 5.1, the identity of 6.1, and the height of cycles in `ℙ(J^∨)` with its value (a7) are also stated, with identical hypotheses and the same routes, in HeightsRationalPointsAndObstructions §§5.17a.1, 5.9b.1 and 5.9b.2, and both roadmaps claim to own them. There are also four small corrections and one format note on untouched text, none blocking. Two questions are left for the human reviewers: Bost–Gillet–Soulé could not be read, and they should weigh the convention of proving the same statement twice.

## R01 (P2) — 5.1, the identity of 6.1 and the height of 6.2 (a) with its value (a7) now have two owners: this roadmap and HeightsRationalPointsAndObstructions §§5.17a.1, 5.9b.1, 5.9b.2

As written, an implementer would build the change-of-metric formula and the height `projectiveCycleHeight_J̄` twice, and the consumers would split between them. HeightsForLogSingularMetrics §4.3b cites 6.2 (a), (a7) here, while HeightsRationalPointsAndObstructions' own later section (its README line 3046) uses its §5.9b.2. The statements are not general theorems with special cases here. They are the same theorems:

- 5.1 (lines 56–63, route lines 81–84) matches HeightsRationalPointsAndObstructions §5.17a.1 (its lines 2811–2817) clause by clause: flat projective `𝒳` of relative dimension `d` over `O_K`, `f` invariant under conjugation with `e^{−f}‖·‖` smooth, the same conclusion and the same route.
- 6.2 (a) (lines 354–356) defines `projectiveCycleHeight_J̄` exactly as §5.9b.2 does (its line 2514). The value (a7) (lines 380–386) is `projectiveSpaceHeight_hermitian` with `projectiveSpaceHeight_value`.
- The identity of 6.1 (line 133) is `projectiveCycleHeight_eq_chowSphericalHeight` (§5.9b.1, its line 2492). The height of DiophantineApproximationAndTranscendence §1.3a has the same normalisation as SlopesOfHermitianVectorBundles §6.6.

Yet the Scope (line 599) keeps "This roadmap owns the change-of-metric formula for arithmetic intersection numbers (5.1); the comparison of the Fubini–Study height …". HeightsRationalPointsAndObstructions (its line 64) says "§5.17a.1 owns the change of metric in arithmetic intersection numbers" and that §§5.9b.1–5.9b.2 own the comparison and the heights in the projective space of a Hermitian bundle. The convention of lines 28–34 explains why the family states a special case now and the general theorem later. That rationale does not apply here: the general sections are no more general and need no more input (§5.17a.1 needs only §5.17a and ComplexComparisonPartII C5.4; §5.9b.2 needs the same sections as (a7)). Only Philippon's identity in §5.9b.1 is wider than 6.1 (iii).

The smallest change is to the Scope and ownership section, line 599. It would name HeightsRationalPointsAndObstructions §§5.17a.1, 5.9b.1 and 5.9b.2 as the owner of the change-of-metric formula, of the identity of 6.1, and of the height of cycles in `ℙ(J^∨)` with (a7). 5.1, 6.1 and 6.2 (a), (a7) stay here with their statements, as the record of the form the family uses, and 6.2 (a) says that its height is the one of §5.9b.2 rather than defining it again. Another option is to qualify the ownership as the Scope of MultiplierIdealsOfPairsAndPointSeparation in this pull request does. That would cover 6.1 (iii), but the definition in 6.2 (a) still needs a single owner.

## C01 — Soulé 3.7 remarks only that the identity follows from Philippon's Théorème 2; it publishes no deduction by the recursion along hyperplane sections

The route of 6.1 (lines 160–161) says that the deduction of the identity from (iii) "by this recursion is published: Soulé (1991), Théorème 3 and 3.7, notes it". The References entry (line 656) credits Soulé with "its derivation from Philippon's archimedean statement by the recursion along hyperplane sections". Soulé 3.7 (printed p. 369) is a single sentence saying that Théorème 3 is also a consequence of Théorème 2 of Philippon's preprint. Soulé's own proof (3.3–3.6, pp. 366–369) goes through the incidence hypersurface and a harmonic projection, not a recursion. Philippon (p. 256, after Théorème 2) makes the same one-line remark. Suggested wording: "Soulé (1991, 3.7, p. 369) and Philippon (1991, p. 256) remark that the identity follows from Philippon's Théorème 2; the recursion along one hyperplane section written here gives that deduction". In References: "Théorème 3, p. 366 (the identity), and 3.7, p. 369 (the remark that it also follows from Philippon's Théorème 2)".

## C02 — The new convention and the routes disagree about which proof is planned

The convention on corollaries (lines 30–32) says that what a `*Corollary of:*` line covers "is proved as [FormalProof] proves it". In 5.1, 6.1 and 6.2 the Method labels say that the written route differs. Yet the routes still begin "The formula is proved here, by this route" (line 74), "The identity is proved here by this route" (line 159) and "(a1)–(a7) and (b) are proved here, by these routes" (line 420). A reader cannot tell which argument the plan asks for. One fix would be to introduce each route as a second proof ("The route written here is an alternative to the formal proof's, described in the Method label"). The other would be to let the convention allow either route.

## C03 — The Origin label of 6.1 gives no origin for (i), or for (ii) when `s` is integral

The Labels convention (lines 25–26) says that `*Origin:*` gives where a section's statement comes from. The Origin of 6.1 (lines 108–111) covers the identity and (iii), and says that (ii) for non-integral `s` is this roadmap's own formulation. It says nothing about the hyperplane-section statement (i), or about (ii) for integral `s`, which [FormalProof] has as `ChowFormSection.Statement` and `ChowFormSectionVertical.Statement`. Add their origin: published with a locator, adapted, or particular to the proof.

## C04 — The DiophantineApproximationAndTranscendence contract runs the definition in the wrong direction

Line 613 says that the height `h_sph` of §1.3a is "defined as the spherical height `ht` of SlopesOfHermitianVectorBundles §6.6". That roadmap's §1.3a (its README line 614) defines `h_sph` directly, from `MeasureTheory.Measure.toSphere` and Gauss norms, and never mentions the family. At this head it is Slopes §6.6 that carries "*Corollary of:* DiophantineApproximationAndTranscendence §1.3a". As written, a general roadmap would seem to depend on a family roadmap. Write "which agrees with the spherical height `ht` of SlopesOfHermitianVectorBundles §6.6 (the same Gauss norms, …)".

## N01 — Untouched text: `Chow.properPushforward` (Exact supplier contracts, line 641) is in code font

SchemeAndStackFoundations writes it in italics as a proposed name (its README line 8059), and no declaration has that name at the pins. Write it as that roadmap does.

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 5.1 against HRPO §5.17a.1 (R01) | hypotheses clause by clause; `ℙ¹_ℤ`, `L̄_0` trivial, `f = |x_0|²/‖x‖²`, `L̄_1 = Ō(1)` | both give `∫ f·c_1 = ½` (closed form ½; Monte Carlo 0.5003); hypotheses, conclusion and route identical | identical statement: R01 |
| 5.1 Method label against [FormalProof] `metricChange` | the proof term (InterDerived.lean lines 33–47) | tensor with `HermLine.ofWeight u`, additivity `hI.2.1`, recursion along `1` with `divSupp P 1 = ∅` | label correct |
| 5.1 Origin against CLT09 | Théorème 1.4 (p. 5) and §2 (p. 11) | 1.4: one bundle `L` repeated, any `M`; p. 11: trivial `L_0`, several `L_1…L_e`, term `∫ log‖s_0‖^{-1}·c_1(L_1)…c_1(L_e)` | supports "several bundles, trivial bundle" |
| 5.1 Origin against CL10 | 1.2.5 with (1.2.6), p. 6; (1.3.10); 1.3.12, p. 15 | 1.3.12: `L_k` trivial, `‖s_k‖ = e^{−φ}`, `∫ φ·c_1(L_0)…δ_Z` equals the local pairing | supports |
| 6.1 identity against Soule91 Théorème 3 (25), p. 366 | constant; `ℙ¹ ⊂ ℙ¹` | Soulé `½(n+1)(Σ_{j≤N}1/j)[k:ℚ]deg` becomes `((d+1)/2)H_n·deg`; `h'(ℙ¹)`: Monte Carlo −0.5003, formula `½ − 1 = −½` | agrees |
| 6.1 (iii) against HRPO §5.9b.1 Philippon identity | point `[1:1]`, `s = e_0` | left `½log2 − ½ = −0.15343` (Monte Carlo −0.1540); right `0 + ½log2 − ½ = −0.15343` | holds |
| 6.1 route: Soulé 3.7 (C01) | Soule91 p. 369; Philippon91 p. 256 | sources: one sentence each, "consequence of Théorème 2"; README: deduction "by this recursion is published" | overstated: C01 |
| 6.2 (a7) against HRPO §5.9b.2 (R01) | `N = 1…5` | value `0, ½, 5/4, 13/6, 77/24` from both forms; bound `0, 0.693, 1.648, 2.773, 4.024` | identical; holds |
| (a7) bound against Sombra05 Théorème 0.1, §3 (p. 11) | `ℙ²`, points with root-of-unity coordinates | `μ_1(ℙ^{N−1}) = ½log N`; `Σμ_i = 0.896 ≤ 5/4 ≤ 1.648` | supports |
| DAT §1.3a against Slopes §6.6 (C04) | normalisations; `u_0 + u_1`, `N = 2` | both: ideal-normalised Gauss norm, `toSphere/(2N·vol B)`, `1/[K:ℚ]`; `ht = −0.1534` on both | agree; direction misdescribed: C04 |
| 6.1 Method label against [FormalProof] | AlgebraProofs folder | Gaussian averaging, `CroftonFormulaFibreSum.lean`, cone integrals present | consistent |
| Supply direction | dependency check; HRPO and DAT at this head | 6 edges, 0 problems; neither cites a family roadmap | no cycle |

- Source locators checked against the text: 10 locators in 5 sources: Soule91 Théorème 3 (p. 366) and 3.7 (p. 369), page images read; Philippon91 p. 256; CLT09 Théorème 1.4 (p. 5) and §2 (p. 11); CL10 1.2.5 with (1.2.6) (p. 6), (1.3.10) and 1.3.12 (p. 15); Sombra05 Théorème 0.1 and §3 (pp. 2, 9–12).
- Formal-proof declarations opened in a local copy: `MetricChangeStatement` (ThmISt.lean line 80), `metricChange` (InterDerived.lean line 33), `MahlerSectionStatementHolds.lean`.
- Cross-roadmap citations resolved at this head: HeightsRationalPointsAndObstructions §§5.9b.1, 5.9b.2, 5.17a.1 and line 64; DiophantineApproximationAndTranscendence §1.3a; SlopesOfHermitianVectorBundles §6.6 and its Conventions; the consumer lines of HeightsForLogSingularMetrics; the Scope of MultiplierIdealsOfPairsAndPointSeparation.
- Merge base against head: both layers and all three sections kept with their statements; one heading added (the DiophantineApproximationAndTranscendence contract); no statement, Check or `Suggested.lean` declaration changed; pins unchanged.
- Dependency check: `depcheck: 1 roadmaps, 6 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the worker's run passed every check. A plain rerun flags only the files of the other folders named as this pull request's own, and the pull request changes nothing else outside them.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message; the file declares nothing, and its docstring is unchanged and still accurate at the unchanged pins.
- Overlap check: read HeightsForLogSingularMetrics, SlopesOfHermitianVectorBundles, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (on main), HeightsRationalPointsAndObstructionsPartII, MultiplierIdealsOfPairsAndPointSeparation (open), and HeightsRationalPointsAndObstructions at this head. Spherical heights are owned by SlopesOfHermitianVectorBundles §6.6 and DiophantineApproximationAndTranscendence §1.3a (cited here). The height of `ℙ(Ē)` is cited from 6.2 (a7) by HeightsForLogSingularMetrics. The change-of-metric formula, the identity of 6.1 and the height in `ℙ(J^∨)` are owned twice, with HeightsRationalPointsAndObstructions (R01).

Source independence: changed passages only; 9 passages compared (the Origin labels of 5.1, 6.1 and 6.2; the route sentences of 6.1, 6.2 and (a7); the References entries for Soulé, Chambert-Loir–Thuillier, Chambert-Loir and Sombra) with 5 sources (Soule91, Philippon91, CLT09, CL10, Sombra05). They share nothing beyond phrases the mathematics forces. The largest share is BGS94, 10 of 32 mentions of published sources, which could not be read. The arrangement was not compared, since no layer is added, removed or reordered.

Research link: 6.1 compares the Arakelov height of a projective cycle with Philippon's spherical height of its Chow form (Soulé 1991, Théorème 3; Philippon 1991, Théorème 2; Bost–Gillet–Soulé 1994). 6.2 (a7) is the height of projective space with Sombra's (2005) bound from successive minima. This line rests on the README's References and on Soule91, Philippon91 and Sombra05 as read.

## Not verifiable

- BGS94 (Proposition 3.2.1 (iv), (3.2.2), Lemma 3.3.1, §4.1, Proposition 4.1.2, (4.1.4), Theorem 4.3.2, (4.3.12), Theorem 4.3.8): the DOI leads to pubs.ams.org, a host the sources service does not classify. Sombra (p. 11) cites its Lemma 3.3.1 for the height of `ℙ^n`, and Chambert-Loir–Thuillier (pp. 5–6) cite its (3.2.2) for the hyperplane-section identity.
- Whether BGS94 Theorem 4.3.2 is stated for an arbitrary Hermitian vector bundle, as the References entry says: same reason.

Automatic checks set aside as false positives: the check that a pull request edits nothing beyond the roadmap under review (so that no other roadmap is changed without its own review) reports the 115 changed files of the other roadmap folders this pull request adds or revises; each of those folders is this pull request's own roadmap with a review of its own, and nothing else changes outside them.

## Source issues

- **Misprint** in Soule91 at (34) and (35), printed p. 369: the source writes the harmonic sum carried over from (33) as starting at `j = 0` (and ending at `n` in (34)); it should run from `j = 1` to `N`, as in (33) and in Théorème 3 (25); affects the proof.

## For the human reviewers

- Not tested: BGS94 has the largest share of the published-source mentions (10 of 32) and could not be read (an AMS host the sources service does not classify). Its locators and wording were not compared.
- The convention of README lines 28–34 keeps, in the family, statements that general roadmaps now own, to be proved by the formal proof's method until the general theorem lands. Here three of them are identical to their general statements (R01).
- [FormalProof] (README line 660) is an external formalisation, read here in a local copy; its licence was not checked.
