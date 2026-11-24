# Review of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 178 changed lines since `b8f3652`. Checked: the Origin and Method labels of all seven sections against their sources at the locators and against the formal proof's declarations, the deduction of 9.1 from EquivariantIntersectionTheory §1.5 and from Alper's Theorem 10.3, the two Siegel statements the new paragraph of 7.17a records, and every supplier section the change cites; no statement changes and every new mathematical claim holds. Accepted, with three small corrections and two format notes, none blocking: the Labels paragraph gives the wrong provenance for 9.1, the Ekedahl–van der Geer locator names no section, and 9.1 lacks the `*Needs:*` line that the new convention points to. The folder's text is the one the previous review read, so its three corrections and its note stand; a scope fact is left for a human.

## C01 — The Labels paragraph says the wider forms are adaptations or the roadmap's own formulations, but 9.1's Origin calls its wider form published

A reader who uses the Labels paragraph as the key to the sections is told the wrong provenance for 9.1. Lines 28–30 say that, 7.31a (a) apart, "the wider forms of the others are adaptations of published results or this roadmap's own formulations, as their `*Origin:*` labels say". The others include 9.1, whose Origin (line 674) reads "published": Drezet–Narasimhan over `ℂ` and Alper (2013), Theorem 10.3, over every field of characteristic zero, and the sentence changed at line 694 says the same. Alper's theorem does cover it (table below). Add after "as their `*Origin:*` labels say": "; 9.1 over every field of characteristic zero is published (Alper 2013, Theorem 10.3)".

## C02 — The Ekedahl–van der Geer locator, "the section on the toroidal compactification", names no section

The Origin of 6.9a (lines 233–238) rests on this paper for the Siegel case, and the References entry (line 769) gives only that phrase, so the passage cannot be found from it. The material is §5, "Extension to the boundary", pp. 27–28 of arXiv:math/0412272v2: the Hodge bundle extended to a smooth toroidal compactification, the Verschiebung acting on the extension, and the extended de Rham bundle with `0 → E → H → E^∨ → 0`. Write "§5 (Extension to the boundary), pp. 27–28" in the References entry.

## C03 — 9.1, the only section with a `*Corollary of:*` line, has no `*Needs:*` line, although the new convention says that line lists what its route needs

The convention (lines 37–39) says "the `*Needs:*` line lists what that route needs, and the deduction needs the section that the `*Corollary of:*` line names". 9.1 (lines 672–698) has a Route and a `*Corollary of:*` line and no `*Needs:*` line; its inputs appear only in the Dependencies of Layer 9 (line 707). The pointer therefore leads nowhere in the one section it applies to. Add to 9.1: "*Needs:* SchemeAndStackFoundations §1.17; EquivariantIntersectionTheory §1.1 (the Route); EquivariantIntersectionTheory §1.5 (the deduction)."

## N01 — The References entry "M. Candilera and V. Cristante, Ann. Sc. Norm. Sup. Pisa 10 (1983)" (line 771) has no title and no pages

Every other entry gives a title. The entry for Cristante (1980), line 770, has no pages either.

## N02 — Deligne's Lemme 1.18 is cited for a step of its proof

The Origin of 6.7a (lines 199–202) cites "Lemme 1.18" for the monodromy-invariant sublattice that extends across the boundary and generates the Lie algebra at `0`. The statement of the lemma is the logarithmic growth of the metric; the sublattice is in its proof (pp. 33–34 of the exposé). "Lemme 1.18 and its proof, pp. 33–34", as ArakelovGeometryAndAbelianHeights §5.3 writes it, would send the reader to the right lines.

## Previous findings

The previous review (at `374b9ce`) had no finding. Its small corrections C01, C02 and C03 and its format note N01 concern text this pull request adds; the folder has not changed since, and they are raised again above under the same numbers.

## Questions for the author

- 6.2a's Origin cites Bost (2004), section 2.4 and Corollary 2.7, as an algebraic proof that the Lie algebra of an abelian variety over a curve in characteristic zero is seminegative. Does Corollary 2.7 state this for an abelian scheme over the curve, or for a model of an abelian variety over its function field, and is the proof in section 2.4? The volume is behind a paywall and no legal copy was found, so the locator was not read.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 9.1 as a corollary of EquivariantIntersectionTheory §1.5 | hypotheses of 9.1 against §1.5; `ℙ¹`, `Γ = {±1}`, `t ↦ −t`; `Γ` trivial | char 0 ⇒ order invertible; every point ⊇ closed points. `O([0])`: −1 on `T_0`, +1 at `∞`, degree 1 odd; `O(2[0])`: +1, `= π^*O(1)`, degrees 2 = 2·1 | agree | none |
| 9.1, line 694: a case of Alper (2013), Theorem 10.3 | `[X/Γ] → W`, `Γ` of invertible order | Thm 10.3: good moduli space, locally noetherian, trivial stabiliser action at closed points ⇔ pull-back; tame coarse space is good (Ex. 8.1); stabiliser over closed `x` = inertia group | agree | none |
| 9.1 Origin: [DN] Théorème 2.3 | DN line 408–410 | `G`-vector bundle descends ⇔ stabiliser acts trivially at closed points with closed orbit; attributed to Kempf | agree | none |
| Labels paragraph, lines 28–30 | Origin labels of the 7 sections | 6.2a adapted and own; 6.7a, 6.9a, 7.12a, 7.17a adapted; 7.31a published, adapted, particular; 9.1 published | disagrees for 9.1 | C01 |
| Labels: "Every section carries both labels" | 7 sections | 7 Origin labels, 7 Method labels, 1 Corollary line (9.1) | agree | none |
| Corollary convention against 9.1 | lines 37–39, 672–698 | 6 `*Needs:*` lines in the layers, none in 9.1 | pointer to a missing line | C03 |
| 7.17a: the formal proof has (a) in the Siegel case | the two statements and their proofs, read in the published source | first: every fan without self-intersections, `g ≥ 1`, odd `n ≥ 3`, some `d, N`, one `k`; second: one fan, all `k ≥ k₀` | agree | none |
| 7.17a Origin: Stacks 29.38.8, 29.38.9 | Stacks lines 3885–3896 | 38.8: `S` quasi-compact, `M` g-ample, `L` f-ample ⇒ `L ⊗ f^*M^a` (g∘f)-ample, `a ≫ 0`; 38.9: base change keeps f-ampleness | agree | none |
| 7.17a (a), headline, on `X(3)` | 4 cusps, index 12 | `deg ω = 12/12 = 1`; `deg ω^a(−d·cusps) = a − 4d`; ample iff `a ≥ 4d + 1`; `a₀(1) = 5`, `a₀(2) = 9` | agrees with its Check | none |
| 6.2a (b), headline | constant abelian surface on `ℙ¹`; non-split torus; `G_m × E` on `{c} × X(N)`; `g = 0` | `O² ↠ O(1)`: 1 ≥ 0; `Lie` trivial on a finite cover: 0 ≤ 0; `O ⊕ ω`: quotients ≥ 0; `Lie = 0` | agree | none |
| 6.2a Origin (a): link to ArakelovGeometryAndAbelianHeights §5.3 | `Q = E`, `g = 1` at a cusp | `det h_λ = π^{−1}‖·‖²_Fal`; §5.3 Check `‖dz‖² = −(1/2π)log|q|`; README `Im τ/π` | agree | none |
| 6.7a Origin: Deligne (1985), Lemme 1.18 | Bourbaki 616, pp. 33–34 | in the proof: `Λ°` = local monodromy invariants, extends over 0, generates `L_0`; volume grows like a power of `|log|z||` | agree, in the proof | N02 |
| 6.7a Origin and Dependencies: ArakelovGeometryAndAbelianHeights §§5.0a, 5.3 | this head | §5.0a: pairing `u·∏_j x_j^{s_j}` on a polydisc; §5.3: invariant sublattice, Deligne 1.18, Faltings–Chai V.4.5 | agree | none |
| 6.9a Origin: Goldring–Koskivirta; Ekedahl–van der Geer | arXiv:1507.05032v3 §§6.1.2–6.1.4, Thm 6.2.1; arXiv:math/0412272v2 §5 | GK: rank `2g` canonical extension, Hodge part maximal isotropic, G-zip extends; EG: `0 → E → H → E^∨ → 0`, `V` on extended `E` | agree; EG locator vague | C02 |
| 7.12a Origin and Method against its statement | hypotheses of 6.9a, clause by clause | semi-abelian, abelian generically, cubical `L_0`, two isomorphisms, fibre condition: 5 of 5 named in 7.12a | agree | none |
| 7.31a Origin (b): Gabber's lemma | Astérisque 127, 1.4 and 1.7 (b) | proper surjective `S′ → S` with semi-abelian extension; `S′` may be projective, integral, normal | agree | none |
| 7.31a Origin (b′): Moret-Bailly (1985) | Astérisque 129, contents and introduction | Ch. II: extension of cubical torsors on smooth groups; the cubical extension is unique | agree | none |

- Source locators read against the text: 12 (DN Théorème 2.3; Alper Theorem 10.3, Definition 10.1, Remark 4.2, Example 8.1; Deligne's Bourbaki Lemme 1.18 and proof; Goldring–Koskivirta §§6.1.2–6.1.4 and Theorem 6.2.1; Ekedahl–van der Geer §5; *Le lemme de Gabber* 1.4 and 1.7 (b); Moret-Bailly Ch. II; Stacks Tags 0C4K and 0893).
- [FormalProof], read in the published source: the two Siegel statements of 7.17a and the two declarations that prove them, and the declarations cited for 6.2a (b) and 9.1.
- Cross-roadmap citations resolved at this head: EquivariantIntersectionTheory §§1.1, 1.4, 1.5; ArakelovGeometryAndAbelianHeights §§2.0, 2.1, 2.2, 2.7, 2.8, 5.0a, 5.0b, 5.3; ShimuraCompactifications §§0.15, 2.7, 6.1–6.9, 6.15, 6.18, 7.3, 7.16, 7.17, 7.19, 7.20, 7.31, 7.33; SchemeAndStackFoundations §§1.17, 1.22, 1.23. None is missing. The 43 Lean names found in no pinned library are declarations of [FormalProof].
- Record: no heading, layer id or Lean declaration is removed, added or renamed; the diff adds labels, two convention paragraphs, citations and References entries; `Suggested.lean` is unchanged.
- Dependency check: `depcheck: 129 roadmaps, 1441 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean` exits 0 with no output; the file declares nothing (its docstring names each headline and the carrier it lacks), so there is no signature to compare and no theorem to probe.
- The pull request's text: its description of the labels and of EquivariantIntersectionTheory §1.5 agrees with this folder; no section, headline, declaration or supplier roadmap of this folder is removed or added.
- Overlap check: read HeightsForLogSingularMetrics, HodgeTateLatticesAndLubinTateLogarithms, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ShimuraCompactifications, EquivariantIntersectionTheory; the descent of a linearised invertible sheaf to a finite quotient is owned by EquivariantIntersectionTheory §1.5 and 9.1 cites it as its corollary; ArithmeticVolumes is a consumer; nothing else shared.

Source independence: 9 passages compared with 9 sources (changed passages only), none shared beyond standard terms; largest share [FormalProof], 44 citations (next: Lan, 15); contents not compared, since the change adds, removes and reorders no layer.

Research link: Layers 6–7 extend the compactifications of Faltings–Chai (1990) and Lan (2016, 2017) to normal projective models over `O_F` and Hodge-metric bounds; 6.2a is the seminegativity of Lie algebras (Bost 2004). They serve the arithmetic-volume step of Alpöge's announced proof (2026) of RH for Dirichlet L-functions. Rests on the README.

## Not verifiable

- Bost (2004), section 2.4 and Corollary 2.7 (6.2a): behind a paywall; no legal copy found.
- Lan (2016), Propositions 6.1 and 6.4, and Lan (2017), Theorem 6.1 (7.17a, 7.31a): not read; the locators agree with those of ShimuraCompactifications §7.31, which is on `main`.
- Faltings–Chai (1990) (6.7a, 7.12a) and Chai (1985) (7.31a (b′)): books behind paywalls.
- Madapusi Pera (2019) (7.31a (b)), Cristante (1980) and Candilera–Cristante (1983) (6.9a, Method label): not opened; cited as background, for no stated result.

## Source issues

- **Misprint** in DN at Théorème 2.3, §2 (DN line 408; p. 11 of the HAL copy): the source says the equivariant bundle is introduced under one letter and a bundle under another letter is then said to descend; it should be the same bundle both times; affects nothing.

## For the human reviewers

- Scope: the source cited most in this roadmap (44 citations) is [FormalProof], a Lean development announced on 20 November 2026 (References), not a refereed publication. Its classical inputs (Faltings–Chai 1990, Lan 2016 and 2017, Deligne 1985) are refereed.
- The two recorded decisions (the move out of GeneralizedRiemannHypothesisFromWindowBounds; sections leaving the family for general roadmaps) were applied and do not bear on this folder: no section leaves it at this head.
