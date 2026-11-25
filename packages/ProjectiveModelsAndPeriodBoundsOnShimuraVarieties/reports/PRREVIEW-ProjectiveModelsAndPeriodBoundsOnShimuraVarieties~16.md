# Review of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 15 lines changed since `3bddf73`: accepted. The previous report had no finding; its three small corrections (the provenance of 9.1 in the Labels paragraph, the Ekedahl–van der Geer locator, the missing `*Needs:*` line of 9.1) are all made, the new sentence of 6.2a (b) agrees with its Method label, and the re-pointed citation of the formal proof resolves in the published source. No finding, no small correction, and two format notes carried over, neither blocking; one scope fact is left for a human.

## N01 — The References entry "M. Candilera and V. Cristante, Ann. Sc. Norm. Sup. Pisa 10 (1983)" (line 774) has no title and no pages

Every other entry gives a title. The entry for Cristante (1980) just above it has no pages either.

## N02 — Deligne's Lemme 1.18 is cited for a step of its proof

The Origin of 6.7a (line 201) cites "Lemme 1.18" for the monodromy-invariant sublattice that extends across the boundary; the statement of the lemma is the logarithmic growth of the metric, and the sublattice is in its proof (pp. 33–34 of the exposé). "Lemme 1.18 and its proof, pp. 33–34", as ArakelovGeometryAndAbelianHeights §5.3 writes it, would send the reader to the right lines.

## Questions for the author

- 6.2a's Origin cites Bost (2004), section 2.4 and Corollary 2.7, for an algebraic proof that the Lie algebra of an abelian variety over a curve in characteristic zero is seminegative. Is Corollary 2.7 stated for an abelian scheme over the curve, or for a model of an abelian variety over its function field? The volume is behind a paywall and no legal copy was found, so the locator was not read. (Asked in the previous review as well; untouched text.)

## Previous findings

The previous review (at `3bddf73`) had no finding (no R-numbered remark). Its other remarks at this head:

- C01 — repaired: the Labels paragraph now reads "9.1 over every field of characteristic zero is published (Alper 2013, Theorem 10.3)", as 9.1's Origin says.
- C02 — repaired: the References entry reads "§5 (Extension to the boundary), pp. 27–28 of v2".
- C03 — repaired: 9.1 carries a `*Needs:*` line naming SchemeAndStackFoundations §1.17 and EquivariantIntersectionTheory §1.1 for the statement and the Route, and §1.5 for the deduction.
- N01, N02 — not changed: written again above.

No repair introduced a new problem.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 9.1 (cited by the new `*Needs:*` line and the Labels sentence) | `ℙ¹`, `Γ = μ₃`, `t ↦ ζt`; `Γ` trivial | `O([0])`: `ζ` acts by `ζ^{±1} ≠ 1` at `0`, degree 1 ∤ 3: no descent. `O(3[0])`: trivial at `0`, `∞`; `= π^*O(1)`, 3 = 3·1. Trivial `Γ`: `N = L` | agree | none |
| 9.1 `*Needs:*` line against its suppliers | SchemeAndStackFoundations §1.17; EquivariantIntersectionTheory §§1.1, 1.5 | §1.17 "Categorical and geometric quotients" (finite-group quotient of a projective scheme); §1.1 linearised invertible sheaves; §1.5 iff-descent, finite group of invertible order | all three exist and say what is cited | none |
| Labels paragraph, lines 28–30, against the seven Origin labels | 9.1; 7.31a (a) | 9.1 Origin: "published", Alper Thm 10.3 for char 0; Labels now says the same; §1.5 cites Thm 10.3, p. 2386 | agree | none |
| 6.2a (b), new sentence on characteristic zero | Method label (lines 56–64); Route | Method: char 0 "through the existence of the formal path with integral coefficients at every place"; Route: Griffiths semipositivity of the Hodge metric. Two proofs, two entries | agree | none |
| 6.2a (b), statement (hypothesis the sentence explains) | constant abelian surface on `ℙ¹`; `g = 0`; char `p` control (Moret-Bailly's pencil, recalled, not re-read) | `O² ↠ O`: 0 ≥ 0; `Lie = 0`: nothing to bound; char `p`: `E ≅ O(p) ⊕ O(−1)`, quotient of degree −1 < 0 | hypothesis needed | none |
| 7.31a, "Why (b) does not extend `ℒ_A`": the formal-proof citation | published source at the commit the References name | `ExistsCubicalRigidifiedExtension.lean` declares `GlobalTheory.DenseCubeExt.exists_cubical_extension`: `Y` normal, locally noetherian; `M` on `G` given; rigidified `L′`, cubical `c′`, symmetry preserved | agree with the sentence | none |

The rows for the untouched statements stand as in the previous review, of `3bddf73`.

- Source locators read this round: 2 files of [FormalProof] at its published commit (the proof file now cited and the statement file cited before; the second delegates to the first, so both citations were true). The Ekedahl–van der Geer locator is the one the previous review read and proposed.
- Cross-roadmap citations resolved at this head: SchemeAndStackFoundations §1.17 (on main), EquivariantIntersectionTheory §1.1 (on main) and §1.5 (stated by this pull request in that roadmap, which the pull request owns).
- Record: no heading, layer id, section or Lean declaration is removed, added or renamed; `Suggested.lean` is unchanged.
- Dependency check: `depcheck: 119 roadmaps, 1368 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean` exits 0 with no output; the file declares nothing (its docstring names each headline and the carrier it lacks), so there is no signature to compare and no theorem to probe.
- The pull request's text: the change touches no statement, section number, supplier roadmap or declaration, and the description's account of the labels and of the general roadmaps still agrees with this folder. Every folder the pull request changes is one of its own roadmap folders or a family index.
- Overlap check: read HeightsForLogSingularMetrics, HodgeTateLatticesAndLubinTateLogarithms, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, and EquivariantIntersectionTheory; the descent of a linearised invertible sheaf to a finite quotient is owned by EquivariantIntersectionTheory §1.5 and 9.1 cites it as its corollary; nothing else shared.

Source independence: changed passages only: 4 passages compared with 2 files of 1 source ([FormalProof]) and with 2 supplier sections, none shared; largest share [FormalProof], 44 citations (next: Lan, 15); contents not compared, since the change adds, removes and reorders no layer.

Research link: Layers 6–7 extend the compactifications of Faltings–Chai (1990) and Lan (2016, 2017) to normal projective models over `O_F` and Hodge-metric bounds; 6.2a is the seminegativity of Lie algebras (Bost 2004). They serve the arithmetic-volume step of Alpöge's announced proof (2026) of RH for Dirichlet L-functions. Rests on the README.

## Not verifiable

- Bost (2004), section 2.4 and Corollary 2.7 (6.2a): behind a paywall; no legal copy found.
- Lan (2016, 2017), Faltings–Chai (1990), Chai (1985), Madapusi Pera (2019), Cristante (1980), Candilera–Cristante (1983): not read, as in the previous review; the change does not touch what they are cited for.
- The seeded sample falls in no changed statement; the seven sampled sections were checked in the previous review and only their labels, one `*Needs:*` line and one explanatory sentence changed.

## Source issues

- **Misprint** in DN at Théorème 2.3, §2 (DN line 408; p. 11 of the HAL copy): the source says the equivariant bundle is introduced under one letter and a bundle under another letter is then said to descend; it should be the same bundle both times; affects nothing.

## For the human reviewers

- Scope: the source cited most in this roadmap (44 citations) is [FormalProof], a Lean development announced on 20 November 2026 (References), not a refereed publication. Its classical inputs (Faltings–Chai 1990, Lan 2016 and 2017, Deligne 1985) are refereed.
- The two recorded decisions (the move out of GeneralizedRiemannHypothesisFromWindowBounds; sections leaving the family for general roadmaps) were applied and do not bear on this folder: no section leaves it at this head.
