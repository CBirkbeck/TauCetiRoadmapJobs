# FIX-PKG-ArithmeticStatistics~2

Repair of the findings of REV-PKG-ArithmeticStatistics (round 2) on `packages/ArithmeticStatistics`. Files changed: `README.md`, `Suggested.lean` (docstring only), `sources.toml` (new). `metadata.toml` and the plan are untouched (there is no `design/plan.json`, and no supplier gap is needed).

## F01 (P3) — applied

Old: seven links into `../AnalyticNumberTheory/README.md#…`, each landing on a "Read in Part II" stub. New: the seven links point to the owner, `../AnalyticNumberTheoryPartII/README.md#s5-4`, `#s5-5`, `#s5-6`, `#s5-7`, `#s5-21`, `#s5-28`, `#s5-29`, with the owner's headings as link texts, under `### From TauCetiRoadmap.AnalyticNumberTheoryPartII`. All seven anchors resolve at the AnalyticNumberTheoryPartII head (README lines 763, 782, 807, 827, 1193, 1553, 1581).

## F02 (P2) — applied differently

Old: AnalyticNumberTheory credited with Perron, Tauberian and Euler-product inputs and said to "supply every part". New: ArithmeticDirichletSeries Layers 3, 6, 9 (Parts III, V; Part I Layers 6, 9). AnalyticNumberTheoryPartI §2.5 (Parts I, V) and Layer 3 (Parts III, VII). "Used below" is deleted. Parts IV and VIII take nothing from these suppliers.

Why the suggested repair was changed:
- "Parts I–VII directly" is false for Part IV. Part IV's "Analytic boundary" paragraph says that both analytic parts are not inputs to it.
- The suggested citation "AnalyticNumberTheory §2.5, §§5.12 and 5.30" points at two more stubs in the AnalyticNumberTheory index (lines 428, 1456, 1708). No part consumes §5.12 or §5.30.

The per-part map was computed from the eight part READMEs at their heads:
- AnalyticNumberTheoryPartII: Part I uses §§5.4–5.7, 5.21, 5.28, 5.29; Part II §§5.4–5.5; Part III the same as Part I; Part V the same plus §5.8; Part VI §§5.4–5.7; Part VII §5.29 only.
- AnalyticNumberTheoryPartI: Parts I, III, V and VII.
- ArithmeticDirichletSeries: Parts I, III and V.

## F03 (P3) — applied

Old docstring: "Arithmetic statistics: package entry point …". New docstring: "Arithmetic statistics: target signatures". It says that README.md is the roadmap, that the parts own every headline and state it or name the carrier it lacks, and that the index states nothing. Old README sentence: "light definitions, milestones and discriminating examples". New: each part's `Suggested.lean` states that part's headline theorems against the pins.

## F04 (P3) — applied differently

Changes:
- The analytic contract moves into `## Exact supplier contracts` under three `### From TauCetiRoadmap.<Name>` subsections.
- "Displayed basis/sign adapters" becomes "the basis and sign conventions of §5.5".
- The deleted text: "original", the free-lattice clause, the repeated no-input sentence, "not an unspecified package", every "package", and the analytic sentence that sat under consumers.
- `## Downstream consumers` now names HeightsRationalPointsAndObstructions and ModularityAndLanglandsExtensions.

Why the suggested repair was changed:
- `C(F,φ,Σ)` is defined in Part III, not Part VII. Its definition is the "windowed cubic counting contract", anchor `support-coregular-count`. Part VII README line 49 consumes it. The link therefore goes to Part III.
- The summed tail is the even-degree clause of Part III's `refinement-binary-summed-tail`. It is now spelled out: `δ, η > 0`, `ξ ≥ 0`, `τ < 1`, `(2n+1)τ < n+1` and `τ = max(η, (η+ξ)/δ)`.
- The cross-part note sits in `## How to read the build`, so that the links to later parts are not read as supply edges.
- Same pattern: the flagged sentence also claimed that §k.n locators are unambiguous across the parts. That is false, since Parts IV and V both use §§3.2–3.9. The README now says so.

## F05 (P3) — applied differently

Old: a register of 132 entries covering 84 works, with the e2/e19 conflict, duplicate dates, broken spacing and access-date narrative. New: one sentence pointing to the parts' bibliographies, plus the two works the README cites in the parts table: Fouvry–Klüners [as-ref-022], Theorem 1 (Part V row), and de Jong [as-ref-056], Theorem 1.2 (Part VII row). Each work has one key.

Why the register was not reduced to nothing:
- The package gate needs a manifest, with at least one entry, of the works the package cites.
- The board main's manifest already holds both settled keys with recorded resolutions. A manifest merge restores them.
- Citing both works keeps the README and the manifest in agreement.

## F06 (P3) — applied

New file `sources.toml` (schema `tauceti-roadmap-sources/v1`). It holds `as-ref-022` and `as-ref-056`, both waived, with their `resolution` links unchanged. Each has `venue`, `url`, a theorem locator and `cited_for` (the parts-table row). No second key exists for Fouvry–Klüners, so nothing is filed under the old [90]. `sources check` reports 0 problems.

## F07 (P3) — not actionable in this package: merge-order placement is the intake's decision

The index sits at merge-order line 99 and its parts at lines 124–128 and 157–159. This brief forbids editing the merge-order file, and the links are not supply edges, so no README edit moves the index. After this repair the index's suppliers are AnalyticNumberTheoryPartI (96), AnalyticNumberTheoryPartII (97) and ArithmeticDirichletSeries (main). A placement right after ArithmeticStatisticsPartVIII (159) stays below all three.

## Checks

- **Elaboration.** From the content checkout, `lake env lean packages/ArithmeticStatistics/Suggested.lean` exits 0 with no messages. It was run after both docstring edits. There is no `TauCeti.*` import.
- **`#check` sweep.** `Suggested.lean` declares nothing, so the scratch file holds no `#check @name` line and there is nothing to compare. No binder changed.
- **Depcheck.** `gate --depcheck … --name ArithmeticStatistics --order … --movable` prints `depcheck: 41 roadmaps, 412 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
  - The extracted edges of this README are ArithmeticDirichletSeries (lines 9, 27, 29), AnalyticNumberTheoryPartI (lines 9, 23) and AnalyticNumberTheoryPartII (lines 9, 19).
  - No edge points to any ArithmeticStatistics part.
- **Package text gates** (the scan on the package folder): every count is 0, and the summary line reads `OK`. All four package files are present. The manifest check gives no problems, and the source-material scan gives none.
- **Citations.** `roadmaps resolve packages/ArithmeticStatistics/README.md` finds no cross-roadmap citation and no Lean name that is unresolved. Every cited anchor was checked by hand:
  - AnalyticNumberTheoryPartII `s5-4` to `s5-29`.
  - AnalyticNumberTheoryPartI `s2-5` (README line 1115).
  - ArithmeticStatisticsPartIII `support-coregular-count` (line 2270) and `refinement-binary-summed-tail` (line 1917).
  - Completed ArithmeticDirichletSeries Layer 3 (line 190), Layer 6 (line 256) and Layer 9 (line 337) on main.

## Gate failure: missing sources.toml

Cleared. `packages/ArithmeticStatistics/sources.toml` now exists and records every work the README cites, two in all. It uses the settled keys `as-ref-022` and `as-ref-056`, both waived, with the resolution links of the board main's manifest. Each entry has `id`, `authors`, `title`, `year`, `locator_scheme` (theorem), `locator`, `licence_class` (`none`, as for any waived text), `status` and `cited_for`.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Layer assignment of the parts | Layer headings of the eight parts | I 0, II 1, III 2, IV 3, V 3, VI 4, VII 5, VIII 5 | true | kept, now spelled out |
| "§k.n locators unambiguous across the parts" | Section numbers of the Layer 3 and Layer 5 parts | IV {3.1–3.11}; V {3.2–3.9, 3.19–3.37}; overlap {3.2–3.9}, e.g. IV §3.2 Gaussian coefficients against V §3.2 cubic splitting densities. VII {5.1–5.11, 5.23–5.32} against VIII {5.12–5.22}: disjoint | false for Layer 3 | restated: a Layer 3 citation names its part |
| ANT-II supplies the cubic sections to Parts I, II, III, V, VI and §5.29 to Parts I, III, V, VII | Link and § mentions per part | Cubic sections: I 7, II 2, III 7, V 8, VI 4, VII 0, IV 0, VIII 0. §5.29: I, III, V, VII yes; II, VI no | true | new sentence |
| Parts IV and VIII take no analytic input | Part IV "Analytic boundary"; Part VIII text | IV: both analytic parts "are not inputs to this part". VIII: 0 mentions of ANT-I, ANT-II or ADS | true (refutes "every part" and "I–VII") | stated |
| ADS Layers 3, 6, 9 to Parts III, V; Layers 6, 9 to Part I | Part I README line 62, Part III line 60, Part V line 49 | I "Layers 6 and 9"; III Layer 3 `EulerProductData`, Layer 6 `perronFormula`, Layer 9 `wienerIkehara`; V "Layers 3, 6 and 9" | true | new sentence |
| §5.4 covariance that the §5.5 conventions rely on | `u³−v³` under diag(2,1) and λI | `P(u³−v³) = −27`; image `4u³ − v³/2` has `P = −27·16·¼ = −108 = det² · (−27)`; λI gives `λ⁴P = det(λI)²P` | true | none |
| `C(F,φ,Σ)` owner | Parts III and VII | Defined at Part III README line 2272 ("windowed cubic counting contract"); Part VII README line 49 consumes it and retains all seven items | owner is Part III, not VII | link to Part III |
| Even-degree tail inequalities | Part III `binary summed tail` at n=4 | (δ,η,ξ) = (1/2, 1/100, 0): τ = 1/50, 9τ = 0.18 < 5 and τ < 1. (1/100, 1/2, 0): τ = 50, both fail. τ = 0.6: τ < 1 holds and 9τ = 5.4 ≥ 5 fails | true; `τ<1` is implied, since τ ≥ η > 0 and (n+1)/(2n+1) < 1 | stated as in Part III; note below |
| FK Theorem 1 as the four-rank moments | as-ref-022 lines 43–56, 85–93 and 97 | Theorem 1 gives Conj±(2,α) for all α ≥ 0. α=0: empty product, mean 1 = 2⁰. α=1: M⁻(2^rk₄ − 1) = 1 gives 2, and M⁺ = 1/2 gives 3/2, matching (2) and (1) | true | cited in Part V row |
| de Jong Theorem 1.2 as the function-field 3-Selmer bound | Part VII target "Function field 3 selmer average bound", its locator line | Part VII cites [56] Theorem 1.2 with author DVI pp. 1–2; the text was not readable here | cited by the owning part's locator (waived key) | cited in Part VII row |
| Downstream consumers | HeightsRationalPointsAndObstructions README line 39; ModularityAndLanglandsExtensions line 1387 | HRPO uses Part I §0.22, Part II §1.12, Part III §2.17. MLE needs Part I §0.1 ("relative density in the specified height ordering") | true | named |
| `Suggested.lean` | Elaboration; declaration count | exit 0; 0 declarations; namespace `TauCetiRoadmap.ArithmeticStatistics` is used by no other roadmap | sound | docstring |

## Ownership and sources

- **Ownership.** The index states no object. Ownership against open roadmap pull requests was checked with `roadmaps grep` over every open head and main. Davenport–Heilbronn, Cohen–Lenstra and Selmer-average objects are owned by the parts, and none is planned here. The open-PR index used is that of 2026-10-24T23:44:22Z.
- **as-ref-022.** Fouvry–Klüners was read from the authors' Paderborn page, a legal author copy (cache sha256 `73ca99eb…bf791f`). The locator is checked at `as-ref-022 line 97`. The entry stays waived as settled; a maintainer may certify it from that copy.
- **as-ref-056.** de Jong cannot be read here. The service rejects the author DVI as "an unrecognised file", and the DOI landing page returns HTTP 403. Theorem 1.2 is the locator given by ArithmeticStatisticsPartVII. The key is waived, so it is cited by locator, and no `needs-references.toml` was written.

## For the maintainer

- **Changed citations.** This roadmap no longer cites AnalyticNumberTheory. It cites AnalyticNumberTheoryPartII, AnalyticNumberTheoryPartI and ArithmeticDirichletSeries directly. No Lean name exists or changed.
- **Parts IV and V.** Both use section numbers §§3.2–3.9 for different targets. A renumbering there would make Layer 3 locators unique.
- **Parts III and V.** In the even-degree binary summed tail, `τ < 1` follows from `(2n+1)τ < n+1`, because τ ≥ η > 0. This is a P3 redundancy.
- **Part VIII.** Its downstream-consumer paragraph names CrystallineLocalGlobalCompatibilityCM. At that roadmap's head, its README does not mention ArithmeticStatistics.
- **Register errors in the parts.** The errors of the old register recur in the parts' own bibliographies:
  - Fouvry–Klüners is listed twice, as [22] and [90], in Parts IV and V.
  - BSW Global Fields I is listed as [20] and [92] with conflicting dates in Part V, and as [20] in Part IV.
  - Part II [76] calls arXiv v1 "published text".
  - Part V [54] carries "Retrieved2026-10-05".
- No untrusted text contained instructions.
