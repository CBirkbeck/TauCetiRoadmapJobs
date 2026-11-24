# Review of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 178 changed lines since `74a09b7`. Checked: the new Origin and Method labels of all seven sections against their sources and the formal proof, the deduction of 9.1 from EquivariantIntersectionTheory §1.5, the cited Alper Theorem 10.3, and the formal proof's Siegel form of 7.17a (a); every new mathematical claim holds and no statement changes. Accepted, with three small corrections and one format note, none blocking: the Labels paragraph misclassifies 9.1's origin, the Ekedahl–van der Geer locator names no section, and 9.1 lacks the *Needs:* line the new convention refers to. Only a scope fact is left for a human.

## C01 — The Labels paragraph says the wider forms are adaptations or the roadmap's own formulations, but 9.1's Origin calls its wider form published

A reader using the Labels paragraph as a key to the sections is told the wrong provenance for 9.1. Lines 28–30 say that, apart from 7.31a (a), "the wider forms of the others are adaptations of published results or this roadmap's own formulations, as their `*Origin:*` labels say". The others include 9.1. But 9.1's Origin (line 674) labels it "published": Drezet–Narasimhan over `ℂ`, and Alper (2013), Theorem 10.3, over every field of characteristic zero. The changed sentence at line 694 says the same, and Alper's Theorem 10.3 does cover it (see the table). A repair would add a clause after "as their `*Origin:*` labels say": "; 9.1 over every field of characteristic zero is published (Alper 2013, Theorem 10.3)".

## C02 — The Ekedahl–van der Geer locator, "the section on the toroidal compactification", names no section

A reader cannot find the passage that 6.9a's Origin (lines 233–238) relies on. The References entry (line 769) gives only that phrase as its locator. The material is §5, "Extension to the boundary", pp. 27–29 of arXiv:math/0412272v2, where the Hodge bundle and the de Rham bundle are extended to a toroidal compactification of `A_g` with `0 → E → H → E^∨ → 0`, and the Verschiebung acts on the extended `E`. Name §5 in the References entry.

## C03 — 9.1, the only section with a *Corollary of:* line, has no *Needs:* line, although the new convention says that line lists what its route needs

The convention paragraph (lines 37–39) tells the reader that "the `*Needs:*` line lists what that route needs, and the deduction needs the section that the `*Corollary of:*` line names". 9.1 (lines 672–707) has a Route and a *Corollary of:* line but no *Needs:* line. Its inputs appear only in Layer 9's Dependencies (line 707). Add one line to 9.1: "*Needs:* SchemeAndStackFoundations §1.17; EquivariantIntersectionTheory §1.1 (the Route); EquivariantIntersectionTheory §1.5 (the deduction)."

## N01 — The References entry "M. Candilera and V. Cristante, Ann. Sc. Norm. Sup. Pisa 10 (1983)" (line 771) gives no title or pages

The paper is *Bi-extensions associated to divisors on abelian varieties and theta functions*, Ann. Sc. Norm. Sup. Pisa Cl. Sci. (4) 10 (1983), no. 3, 437–491 (Numdam). Cristante (1980), on line 770, is pp. 181–215 of its volume.

## Questions for the author

- 6.2a's Origin cites Bost (2004), section 2.4 and Corollary 2.7, as an algebraic proof that the Lie algebra of an abelian variety over a curve in characteristic zero is seminegative. Is Corollary 2.7 stated for an abelian variety over the function field of a curve (the Lie algebra of which model, if any), and does section 2.4 hold that proof? No legal copy could be read: the publisher's page is paywalled, and the only copy online is on a third party's page, which was not used.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 9.1 *Corollary of* EquivariantIntersectionTheory §1.5 | 9.1 hypotheses against §1.5's; the Check `ℙ¹`, `Γ = {±1}`, `t ↦ −t`; `Γ` trivial | hypotheses imply §1.5's; §1.5's conclusion implies `π^*N ≅ L`. `O([0])`: −1 at 0, degree odd; `O(2[0]) = π^*O(1)` on both sides | agree | none |
| 9.1, line 694: a case of Alper (2013), Thm 10.3 | `[X/Γ] → W`, `|Γ|` invertible | Thm 10.3 (arXiv v3): good moduli space, locally noetherian stack, trivial stabiliser action at closed points ⇔ descends; stabiliser of a closed `x` is its inertia group | agree | none |
| 9.1 Origin: [DN] Théorème 2.3 | HAL copy, §2 setting | integral variety, reductive `G`, good quotient; condition at closed points with closed orbit; vector bundles; over `ℂ` | agree | none |
| Labels: provenance of the wider forms (lines 28–30) | Origin labels of the 7 sections | 6.2a adapted/own; 6.7a, 6.9a, 7.12a, 7.17a adapted; 7.31a published/adapted/particular; 9.1 published | disagrees for 9.1 | C01 |
| Labels: "Every section carries both labels" | 7 sections | 7 of 7 carry Origin and Method; one (9.1) carries *Corollary of* | agree | none |
| Corollary convention vs 9.1 | lines 37–39 and 672–707 | 9.1 has a Route and a Corollary line, and no *Needs:* line | pointer to a missing line | C03 |
| 7.17a: [FormalProof] has (a) in the Siegel case | `SiegelToroidalPolCharts`, `SiegelToroidalIntegral`, their two proofs, read in the source | first: every fan without self-intersections, some `d, N, k` with `ω^{Nk}(−BD)` ample; second: one fan, all `k ≥ k₀`; odd `n ≥ 3` | agree | none |
| 7.17a Origin: Stacks 29.38.8 (0C4K), 29.38.9 (0893) | Stacks text | 38.8: quasi-compact `S`, `M` g-ample, `L` f-ample ⇒ `L ⊗ f^*M^a` (g∘f)-ample for `a ≫ 0`; 38.9: base change preserves relative ampleness | agree | none |
| 7.17a (a), headline, on `X(3)` | 4 cusps, `μ = 12` | `deg ω = μ/12 = 1`; `ω^a(−d·cusps)` has degree `a − 4d`, ample iff `a ≥ 4d + 1`; `a₀` grows with `d` | agrees with its Check | none |
| 6.2a (b), headline | `X(3)`; constant abelian surface over `ℙ¹`; `G_m × E` on `{c} × X(N)` | `deg ω = 1 ≥ 0`; quotient `O² ↠ O(1)` of degree 1 ≥ 0; `O ⊕ ω` has quotients of degree ≥ 0 | agree | none |
| 6.2a Method: reduction to line subbundles of pull-backs | Hartshorne's criterion on curves | `E` nef ⇔ every quotient line bundle of every finite pull-back has degree ≥ 0 ⇔ line subbundles of pulled-back `Lie` have degree ≤ 0 | sound | none |
| 6.7a Origin: Deligne (1985), Lemme 1.18 | Numdam, Bourbaki 616, pp. 33–34 | the proof: `Λ°` = monodromy invariants, extends over 0 and generates `Lie` there; volume grows like `|log|z||^{2g−r}` | agree (in the proof) | none |
| 6.7a Origin, Dependencies: ArakelovGeometryAndAbelianHeights §§5.0a, 5.3 | at this head and on `main` | §5.0a: pairing `u·∏_j x_j^{s_j}` on a polydisc; §5.3: Deligne 1.18 sublattice, FC V.4.5 | agree | none |
| 6.9a Origin: GK §§6.1.2–6.1.4, Thm 6.2.1; EG | arXiv:1507.05032v3; arXiv:math/0412272v2 | GK: rank-`2g` canonical extension, Hodge part maximal isotropic, G-zip extends (hyperspecial Hodge type); EG §5: `0 → E → H → E^∨ → 0` (Siegel) | agree; EG locator vague | C02 |
| 7.31a Origin (b): Gabber's lemma | Astérisque 127, Thm 1.4 and 1.7(b) | proper surjective `S′ → S` with semi-abelian extension; `S′` may be taken projective, integral and normal | agree | none |
| 7.31a Origin (b′): Moret-Bailly (1985) | Astérisque 129, Ch. II and introduction | extension of cubical torsors over smooth group schemes; the cubical extension is unique | agree | none |
| 7.31a (b), headline: its Check on `K(N)` | `N = 15, 6, 3` | 15: prime-to-`p` parts 5, 3, 15, all ≥ 3, so neat; 6: level 2 away from 3, contains `−I`; 3: `GL₂(Ẑ^3) ∋ −I` | agrees with its Check | none |

- Source locators checked against the text: 12. They are [DN] Théorème 2.3 with its §2 setting; Alper Theorem 10.3, Definition 10.1, Remark 4.2 and Example 8.1; Deligne's Bourbaki Lemme 1.18 with its proof; Goldring–Koskivirta §§6.1.2–6.1.4 and Theorem 6.2.1; Ekedahl–van der Geer §5; Deligne's *Le lemme de Gabber* 1.4 and 1.7(b); Moret-Bailly Ch. II; and Stacks Tags 0C4K and 0893.
- [FormalProof], read in the operator's copy of the published source: the four declarations and four files that the new paragraph of 7.17a names, and the proof files of 6.2a (b) and 9.1 against their Method labels.
- Library declarations opened at the pins (Tau Ceti `2fd255d`): `TauCeti.AlgebraicGeometry.AbelianVariety` (`AbelianVariety/Basic.lean:95`) and `LineBundleClass.IsAmple` (`LineBundle/Ample.lean:71`), named in the unchanged docstring of `Suggested.lean`.
- Cross-roadmap citations resolved:
  - EquivariantIntersectionTheory §§1.1, 1.4, 1.5;
  - ArakelovGeometryAndAbelianHeights §§5.0a, 5.0b, 5.3;
  - ShimuraCompactifications §§7.17, 7.20, 7.31 (with its Lan locators) and §7.33;
  - no citation is found nowhere, and the 43 unresolved Lean names are declarations of [FormalProof], the four new ones confirmed.
- Record: no heading, layer id or Lean declaration is removed, added or renamed; every item of the README on `main` keeps its id and statement; `Suggested.lean` is unchanged.
- Dependency check: `depcheck: 132 roadmaps, 1469 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Automatic checks: all passed in the worker's run. Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; the file declares nothing, so there is nothing to probe.
- Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, HeightsForLogSingularMetrics, HodgeTateLatticesAndLubinTateLogarithms, MultiplierIdealsOfPairsAndPointSeparation (this pull request), ShimuraCompactifications and EquivariantIntersectionTheory. ArithmeticVolumes cites 6.2a, 6.7a, 6.9a, 7.12a, 7.17a (a), 7.31a and 9.1 as consumer. The descent of 9.1 is owned in general by EquivariantIntersectionTheory §1.5, and 9.1 is kept as its corollary. Nothing else is shared.

Source independence: 9 passages compared with 9 sources (changed passages only), none shared beyond standard terms. The passages are the Origin labels of 6.7a, 6.9a, 7.17a, 7.31a and 9.1, the sentence at line 694, the 7.17a paragraph on the formal proof, and the Method labels of 6.2a and 9.1. The sources are DN, Alper, Stacks, Deligne 1985 (Bourbaki), Goldring–Koskivirta, Ekedahl–van der Geer, Deligne 1985 (Gabber), Moret-Bailly and [FormalProof]. The largest share is [FormalProof], 44 of 102 locators. Contents were not compared, because the change adds, removes and reorders no layer.

Research link: Layers 6–7 extend the compactification theory of Faltings–Chai (1990) and Lan (2016, 2017) to normal projective models over all of `O_F` and to Hodge-metric bounds. 6.2a is the seminegativity of Lie algebras (Bost 2004; classical by Hodge theory). Both feed the arithmetic-volume step of Alpöge's announced proof (2026) of RH for Dirichlet L-functions. This rests on the README.

## Not verifiable

- Bost (2004), section 2.4 and Corollary 2.7 (6.2a): no legal copy. The publisher's page is paywalled; the only copy found is on a third party's page, which was not used.
- Lan (2016), Propositions 6.1 and 6.4, and Lan (2017), Theorem 6.1 (7.17a, 7.31a): the author's page returns HTTP 403. The publisher's host for 2016 is one the sources service does not classify; the 2017 paper is paywalled.
- Faltings–Chai (1990) (6.7a, 7.12a) and Chai (1985) (7.31a (b′)): books behind paywalls.
- Cristante (1980) and Candilera–Cristante (1983) (6.9a Method label): not opened. Both are cited as background, and Numdam holds both.
- Automatic checks set aside as false positives: run by hand without the family's settings, the check that a pull request changes nothing outside its folder lists 118 files. They all lie in the other roadmap folders this pull request names as its own.

## Source issues

- **Misprint** in DN at Théorème 2.3, §2 (p. 11 of the HAL copy): the statement introduces the equivariant bundle under one letter and then says a bundle under another letter descends; it should name the same bundle both times; affects nothing.

## For the human reviewers

- Scope: the largest share of this roadmap's locators (44 of 102) is [FormalProof], a Lean development announced on 20 November 2026 (References), not a refereed publication. The classical inputs it cites (Faltings–Chai 1990, Lan 2016 and 2017, Deligne 1985) are refereed.
- The two recorded decisions (the move out of GeneralizedRiemannHypothesisFromWindowBounds, and sections leaving the family for general roadmaps) do not bear on this folder: no section of it leaves the roadmap at this head.
