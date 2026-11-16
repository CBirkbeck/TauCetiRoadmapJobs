# Review of GlobalShtukasAndFunctionFieldLanglandsPartII (pull request #1845 at eeebf9a)

**Verdict:** needs changes

Incremental re-review of the 136 lines changed since 9a1ad06 (all in `README.md`), and of the pull request's title and description. The change itself is sound: it demotes 22 `###` headings to bold run-in titles under 11 group headings and adds 11 "This group …" paragraphs, with every section body byte-identical. R01 and R02 are not defects of that change: two suppliers moved after the review of 9a1ad06 (SmoothRepresentationsOfLocalGroupsPartII renumbered its Layer 5 on 2026-11-13; LieHighestWeightPartII was opened on 2026-11-13), and citations are resolved against the suppliers' heads every round. R03 is the description.

## R01 (P2) — fifteen citations of SmoothRepresentationsOfLocalGroupsPartII Layer 5 use a numbering its head no longer has

**Location:** `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md` lines 11, 75, 787, 793, 810, 832, 889, 895, 897, 919; e.g. line 75: "SmoothRepresentationsOfLocalGroupsPartII §§5.23–5.26 (half-integral generic unitary points, the fundamental separators, the local generic temperedness test and the noncentral G₂ witness)".

**Claim:** The cited sections §§5.22–5.28 do not exist at the supplier's open head, and it carries no table of the former numbering.

**Witness:** SmoothRepresentationsOfLocalGroupsPartII at 9228cb0 ends Layer 5 at §5.21: *half-integral-generic-unitary* is §5.16, *fundamental-separators* §5.17, *generic-temperedness-test* §5.18, *g2-noncentral-witness* §5.19, *signature-hecke-comparison* §5.20, *explicit-regions* §5.21 (its `README.md` lines 1305–1376).

**Repair:** Renumber by slug, old → head: 5.23 → 5.16, 5.24 → 5.17, 5.25 → 5.18, 5.26 → 5.19, 5.27 → 5.20, 5.28 → 5.21. Concretely: line 11 `§§5.1–5.28` → `§§5.1–5.21`; line 75 `§§5.7–5.12 and 5.27` → `§§5.7–5.12 and 5.20`, `§§5.23–5.26` → `§§5.16–5.19`; line 787 `§5.24` → `§5.17`, `§5.23` → `§5.16`; line 793 `§§5.23–5.25` → `§§5.16–5.18`; line 810 `§5.25` → `§5.18`, `§5.24` → `§5.17`, `§5.26` → `§5.19`, `§§5.10–5.11 and 5.27` → `§§5.10–5.11 and 5.20`; lines 832 and 919 `5.23–5.27` → `5.16–5.20`; lines 889 and 897 `5.25` → `5.18`; line 895 `§5.26` → `§5.19`. Line 801 (`§5.14`, PGL₃) still resolves: head §5.14 covers PGL(n) with n odd. Layers 6 and 7 are unchanged (same slugs at the same numbers).

## R02 (P2) — §8.0 proves again the recognition theorem that LieHighestWeightPartII §5.5 owns

**Location:** `README.md` line 1189 (§8.0, proof route): "Equal multiplicity functions for every τ give equal characters, and characters of algebraic representations separate semisimple conjugacy classes of Ĝ (the Weyl characters of ReductiveGroups §§10A–10B)."

**Claim:** The absolute step (equal weight multiplicities for every τ force conjugacy of the real parts) is stated and proved, by the same trace argument, by a roadmap earlier in the merge order; it must be cited, not planned again.

**Witness:** LieHighestWeightPartII (open, merge order line 255 against 389) `README.md` line 595, §5.5 `exists_conj_positiveRealPart_of_weightPattern_eq`, and line 24: "the recognition of positive real parts is owned here"; line 624 derives §8.0's statement from it.

**Repair:** In §8.0 replace the first three sentences of the proof route by: "By LieHighestWeightPartII §5.3, n_(ν,τ) is the weight pattern of q^ν in τ, and q^ν is its own positive real part (§5.4 there). By LieHighestWeightPartII §5.5, geometric ν and ν′ with equal multiplicity functions for every τ have q^ν and q^(ν′) conjugate in Ĝ, hence W-conjugate in T̂, and ν and ν′ are W-conjugate because the exponential is injective on t̂_ℝ." Keep the W_rel sentence and the Aubert sentence. In the *Needs* lines of §8.0 and the Layer 8 Dependencies replace "ReductiveGroups §§10A–10B (algebraic Weyl characters and character separation); RepresentationTheory/LieHighestWeight Layer 6 (Weyl characters)" by "LieHighestWeightPartII §§5.3–5.5 (weight patterns, positive real part, recognition up to conjugacy)". Add `### From TauCetiRoadmap.LieHighestWeightPartII` under the supplier contracts with those three sections, for a connected complex reductive group and every q > 1. In Scope (line 11) replace "§8.0 keeps the recognition of real Satake classes by weight multiplicities" by "§8.0 keeps the normalization of real parts across residue cardinalities, the refinement from Weyl to relative-Weyl conjugacy on the Frobenius-fixed real space and the identity L_F(AZ(π)) = L_F(π); recognition up to Weyl conjugacy is LieHighestWeightPartII §5.5". The Checks of §8.0 stay (they test the normalization and the choice of τ).

## R03 (P3) — the description says the roadmap builds the Bessel companion, which the head imports

**Location:** pull request description, second paragraph: "It builds … the equal-characteristic Fargues–Scholze parameters with Li-Huerta's uniformization of global shtukas by local shtukas, and the all-prime Kloosterman anchor with its Bessel companion."

**Claim:** At this head the Kloosterman eigenobject, the Bessel F-isocrystal and its adjoint rigidity are a supplier's; the description's list of imports names SmoothRepresentationsOfLocalGroupsPartII only.

**Witness:** `README.md` line 13: "the Bessel F-isocrystals and their logarithmic extensions, and the adjoint rigidity of the Bessel object at every prime are KloostermanSheavesAndBesselIsocrystals §§KB.0–KB.4, KB.6 and KB.11, imported by target name and never constructed here".

**Repair:** End that sentence at "…by local shtukas, and the all-prime étale Kloosterman anchor of §4.0." and add after the sentence on SmoothRepresentationsOfLocalGroupsPartII: "The Kloosterman Hecke eigenobject, its Bessel F-isocrystal companion and the adjoint rigidity of that companion are imported from KloostermanSheavesAndBesselIsocrystals; §4.0 proves only the automorphic anchor and the transfer of the vanishing of adjoint inertia invariants to the étale sheaf." If R02 is repaired as written, add LieHighestWeightPartII to the imports named there.

## Previous findings

- none: the review of 9a1ad06 accepted with no finding of its own. Its three bullets record repairs in §4.0 (lines 594–628 at this head), which the diff since 9a1ad06 does not touch.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| The 33 hunks of the diff | 22 demoted sections, 11 group headings | 22/22 bodies identical to the removed paragraph after the bold title; 22/22 titles equal the removed heading; 11 paragraphs added, 0 other lines | pure regrouping | none |
| Group 1.3 paragraph (semisimple dual group, weight 0; consumers 4.2, 4.4, 4.5, 6.2) | GL₁, σ = 3^deg over 𝔽₄ | image in no proper parabolic, weight 2·log₄3 ≈ 1.585 ≠ 0; *Needs* naming §1.3 or §1.4: 4.2, 4.4, 4.5, 6.2 | "when the dual group is semisimple" is needed and stated; consumer list exact | none |
| Group 3.0 paragraph (consumers through §§3.2–3.3) | *Needs* lines and standing-hypothesis paragraphs | by *Needs*: 3.4–3.8, 4.0, 4.2, 4.4, 4.5, 5.3, 7.6, 8.0, 8.3; by text: 8.1 (line 1215), 8.2 (1238), 8.6 (1316) | list exact | none |
| Group 3.4 paragraph (consumers 4.5–4.8, 8.2) | same | *Needs*: 4.6, 4.7, 4.8, 8.2; text: 4.5 (line 715) | exact | none |
| Group 4.2 paragraph (4.6, 5.3, 8.6 through §4.5; §4.7 through §4.2) | same | *Needs* naming §4.5: 4.6, 5.3, 8.6; §4.7 names §4.2 at line 743 | exact | none |
| Group 4.6 paragraph (embedding independence needs geometricity) | Salem root of the quartic of §4.1, 1.72208… | modulus 1.722 at the real embedding, 1 at the complex ones: not a Weil number, excluded by "geometric local parameter" | summary keeps the hypothesis; §5.3 names §4.6 | none |
| Group 5.2 paragraph (integer weights, half-integral real parts) | q = 4, eigenvalue 2 | weight 1, ⟨α, ν⟩ = 1/2 ∈ ½ℤ, not in ℤ | "half-integral" is the right word; consumers 5.4 (both), 8.2 (§5.2) exact | none |
| Groups 5.4, 6.3, 7.3, 8.1 paragraphs | *Needs* and text | 6.5 names §5.4; Downstream consumers lists §§5.4–5.5, 4.5–4.8, Layer 6; 8.1 names 7.3, 7.6; 8.2 names 7.3, 7.4, 7.6; 8.3, 8.6 name 7.6; 8.3, 8.6 name 8.1, 8.2 | exact | none |
| §8.4 Property A, cited by the group 8.3 paragraph | a(0,±1)=1; a(1,3)=a(1,−1)=a(3,3)=1; a(2,2)=3 | r(0)=2, c(1)=1>r(1)=0; r=(2 at 1, 1 at 3), c(3)=2>r(3)=1; diagonal: r=c | holds | none |
| R01: SmoothRepresentationsOfLocalGroupsPartII Layer 5 ids | supplier at b197d70 and at 9228cb0 | 28 sections before, 21 at the head; ids 5.22–5.28 gone; slugs of old 5.23–5.28 at 5.16–5.21 | 15 stale citations on 10 lines | R01 |
| R02: §8.0 recognition against LieHighestWeightPartII §5.5 | adjoint of SL₃ at ν = 0; split G | both count 8 at i = 0; for split G, W_rel = W and the two statements coincide | same theorem, same proof | R02 |

Statements the diff does not touch stand as in the previous review, of 9a1ad06.

- Gate at eeebf9a, re-run: every scanner 0 (including target-ids, layer-ids, readme-ids-missing, outside-folder, stray-files), result OK; the worker's gate adds build=0.
- `gate --depcheck … --movable`: `depcheck: 236 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `lake env lean` on `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/Suggested.lean`: exit 0, no output; the file declares nothing (unchanged since 9a1ad06), so there is no `#check` comparison and no one-tactic probe to run. The outside-folder diff is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Source locators re-read at their lines for the sampled sections that the diff retitles (5 locators, 3 sources): st line 4018 (Lemma 11.4, p. 83), ghs line 408 (Lemma 3.6), ch26 line 372 (standing hypothesis, PSU(2n+1) excluded), ch26 line 609 (Theorem 5.4), ch26 line 1549 (§10.1) — all as cited.
- Cross-roadmap citations resolved at the suppliers' heads: KloostermanSheavesAndBesselIsocrystals is now readable as an open roadmap; its `README.md` lines 508–523 map the former labels to its sections, and all 15 slugs cited here are in that table (*affine-depth* §0.2 … *all-prime-corollaries* §11.5). GlobalShtukasAndFunctionFieldLanglands (99 ids) and FunctionFieldArithmetic (50 ids) lost no id since 9a1ad06. SmoothRepresentationsOfLocalGroupsPartII Layers 6 and 7: unchanged; Layer 5: R01.
- Citations of this roadmap by others: only LieHighestWeightPartII cites a section (§8.0), which is still a `###` heading; no demoted id is cited elsewhere.
- Overlap check: read GlobalShtukasAndFunctionFieldLanglands, SmoothRepresentationsOfLocalGroupsPartII, KloostermanSheavesAndBesselIsocrystals, LieHighestWeightPartII; recognition of real parts by weight patterns is shared with LieHighestWeightPartII, owner LieHighestWeightPartII §5.5 (R02); nothing else shared.
- Source independence: 22 passages compared (the 11 added paragraphs and 11 new headings, changed passages only) with the 23 cited sources in the cache, longest shared run 7 words ("whose image lies in no proper parabolic", forced by the mathematics); largest share ch26, 44 of 97 line locators; contents not compared again (the diff adds, removes and reorders no layer).

## Not verifiable

- **Published numbering of gross-reeder** (carried): the README cites the author-page preprint of 1 March 2010; the journal pagination was not compared.
- **ghs, arXiv v3** (carried): the v3 wording of Theorem 1.2 was not read.
- **Suppliers without a readable head in this round's index beyond the resolver** (ArithmeticGaloisRepresentations, DeligneWeightsAndPurity, LanglandsParameterStacks, HeckeStacksAndLocalShtukas and the others of the contracts): checked only through the worker's resolver, which reports no missing id for them; a silent renumbering like R01's inside an existing range would not show there.

## Source issues

- none

## For the human reviewers

- Scope/licence: the source with the largest share of locators, ch26 (44 of 97), is read and cited from arXiv 2311.15300v1 (cache header of the text); lh is cited as a 2023 preprint. Whether published versions exist was not checked.
