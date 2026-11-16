# Review of GlobalShtukasAndFunctionFieldLanglandsPartII (pull request #1845 at 7a9ddeb)

**Verdict:** accepted

Incremental re-review of the 34 lines changed since eeebf9a (all in `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md`), and of the pull request's title and description. No finding.

## Previous findings

- R01 — repaired: all 15 citations renumbered as asked, e.g. line 75 "SmoothRepresentationsOfLocalGroupsPartII §§5.16–5.19 (half-integral generic unitary points, the fundamental separators, the local generic temperedness test and the noncentral G₂ witness)"; no §5.22–5.28 remains.
- R02 — repaired: §8.0 proof route (line 1193) now reads "By LieHighestWeightPartII §5.5, geometric ν and ν′ with equal multiplicity functions for every τ have q^ν and q^(ν′) conjugate in Ĝ"; contract added at lines 115–117; Scope and both *Needs* lines updated.
- R03 — repaired: the description now ends the sentence at "the all-prime étale Kloosterman anchor of §4.0" and names KloostermanSheavesAndBesselIsocrystals and LieHighestWeightPartII §§5.3–5.5 as imports.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.0 recognition (geometric ν, ν′ with equal n_(ν,τ) for all τ iff W_rel-conjugate), by the new route through LieHighestWeightPartII §5.5 | dual SL₂: ν=(½,−½), ν′=(−½,½), 0; dual G_m: ν=½, ν′=−½ | std: 1 at ±1 for ν and ν′ (Weyl-conjugate), 2 at 0 for 0 (not conjugate); G_m, z↦z: 1 at +1 against 1 at −1, W trivial, not conjugate | both directions hold; a central torus is covered by the supplier | none |
| §8.0, the geometric hypothesis under the new route | q=3, q^ν=diag(2,½), q^(ν′)=diag(5,⅕) in SL₂ | 2⟨μ,ν⟩=±2·log₃2 ∉ ℤ: both patterns vanish except at weight 0, real parts not conjugate | excluded: §8.0 says "two geometric ν, ν′", as the supplier's §5.5 requires | none |
| §8.0, n_(ν,τ)(i) = weight pattern of τ(q^ν) in degree i (supplier §5.3) | adjoint of SL₃ at ν=0; ν=(½,−½) at q=4 and q=16 | 8 at i=0 on both sides; std eigenvalues 2, ½ and 4, ¼, both patterns 1 at ±1 | the identification is independent of q>1 | none |
| Contract "From TauCetiRoadmap.LieHighestWeightPartII" (line 117) against the supplier's §§5.3–5.5 | its `README.md` lines 545–612 at c304311 | §5.3: eigenvalues of absolute value q^(i/2), q-geometric points; §5.4: positive factor of the polar decomposition; §5.5: semisimple, q-geometric, equal patterns ⇒ conjugate positive real parts | contract states the supplier's hypotheses exactly (connected complex reductive, q>1, semisimple, geometric) | none |
| §5.1 half-integrality criterion (citations renumbered only) | PGL₃; PGL₂ ν=(¼,−¼); G₂ witness | supplier §5.14 is *half-integral-origin-only*; §5.16 *half-integral-generic-unitary*, §5.17 *fundamental-separators*, §5.18 *generic-temperedness-test*, §5.19 *g2-noncentral-witness*, §5.20 *signature-hecke-comparison* | every slug named beside a number matches the supplier's heading at that number | none |
| §5.4 generic Ramanujan, *Needs* and Check (citations renumbered only) | lines 893, 899, 901 | §5.18 (temperedness test), §5.19 (G₂ witness), §6.3–6.4 unchanged at the supplier | resolve | none |

Statements the diff does not touch stand as in the previous review, of eeebf9a.

- Gate at 7a9ddeb, re-run: every scanner 0, result OK; the worker's gate adds build=0.
- `gate --depcheck … --movable`: `depcheck: 236 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. LieHighestWeightPartII is line 256 of the merge order, this roadmap line 391.
- `lake env lean` on `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/Suggested.lean`: exit 0, no output; the file declares nothing and is unchanged, so there is no `#check` comparison and no one-tactic probe to run. The outside-folder diff is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Cross-roadmap citations resolved at the suppliers' heads: all 38 distinct citation forms of SmoothRepresentationsOfLocalGroupsPartII (at 9228cb0: Layer 5 has §§5.1–5.21, Layer 6 §§6.1–6.4, Layer 7 §§7.1–7.13) and all 7 citations of LieHighestWeightPartII (at c304311: §§5.3, 5.4, 5.5). ReductiveGroups, ReductiveGroupsPartII and NilpotentOrbits are on main.
- Source locators re-read for the two sampled sections the diff touches (6 locators, 1 source): ch26 line 372 (§3 standing hypothesis, p. 8), line 609 (Theorem 5.4, p. 13), line 619 (table after it), line 1192 (Corollary 6.32, p. 25), line 1554 (Proposition 10.2, p. 32), lines 563 and 1330 (Proposition 4.5; central point, p. 28) — all as cited.
- Pull request text against the head: title and description agree with it (new roadmap; `Suggested.lean` declares nothing; imports from SmoothRepresentationsOfLocalGroupsPartII, KloostermanSheavesAndBesselIsocrystals and LieHighestWeightPartII §§5.3–5.5 named; the merge-order paragraph lists LieHighestWeightPartII). Remark: the generated `depends-on` block does not list LieHighestWeightPartII, which the merge-order block does.
- Remark: LieHighestWeightPartII `README.md` (References, ownership paragraph) still says this roadmap's §8.0 "proves it there from Weyl characters"; at this head §8.0 cites its §5.5. That sentence is the supplier's to update.
- Overlap check: read GlobalShtukasAndFunctionFieldLanglands, SmoothRepresentationsOfLocalGroupsPartII, KloostermanSheavesAndBesselIsocrystals, LieHighestWeightPartII; recognition of positive real parts by weight patterns is LieHighestWeightPartII §5.5's and is now cited, not restated; nothing shared.
- Source independence: 4 passages compared (changed passages only: the Scope sentence, the ReductiveGroups contract sentence, the LieHighestWeightPartII contract, the §8.0 proof route) with 1 source (ch26 lines 781, 1334, 1549–1562), longest shared run 4 words ("the weight pattern of"), none shared; largest share ch26, 44 of 106 `line` locators; contents not compared again (the diff adds, removes and reorders no layer).

## Not verifiable

- **Published numbering of gross-reeder** (carried): the README cites the author-page preprint of 1 March 2010; the journal pagination was not compared.
- **ghs, arXiv v3** (carried): the v3 wording of Theorem 1.2 was not read.
- **Other suppliers' heads** (carried; ArithmeticGaloisRepresentations, DeligneWeightsAndPurity, LanglandsParameterStacks, HeckeStacksAndLocalShtukas and the remaining contracts): checked only through the worker's resolver, which reports no missing id; a renumbering inside an existing range would not show there.

## Source issues

- none

## For the human reviewers

- Scope/licence: the source with the largest share of locators, ch26 (44 of 106), is read and cited from arXiv 2311.15300v1 (cache header of the text); lh is cited as a 2023 preprint. Whether published versions exist was not checked.
