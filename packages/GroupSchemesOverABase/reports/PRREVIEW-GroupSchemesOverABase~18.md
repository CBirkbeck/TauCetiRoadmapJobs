# Review of GroupSchemesOverABase (pull request #1522 at 2e1e5e7)

**Verdict:** accepted

This is an incremental re-review of the 28 lines changed since acbc20b: the product sentence of 4.8 and the EllipticCurveModularityPartII, HeightsRationalPointsAndObstructions and PurityForFlatCohomology bullets under **Downstream consumers**. `Suggested.lean` is unchanged since 9265182 and nothing outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GroupSchemesOverABase'` is empty).

No finding remains in this folder. For the human approver: three objects are still stated twice across open pull requests, because #1491, #1017 and #1840 each still prove the material themselves and do not name this roadmap. This roadmap is the earlier one in the candidate order (67th, against 276, 142 and 221), its bullets now say so truthfully, and the remaining edits are in those three pull requests (listed under **Verified sound**).

## Previous findings

- R01 — repaired: "EllipticCurveModularityPartII §6.0f uses Cartier's theorem for group schemes locally of finite type over a field of characteristic `0`, which is 4.5's `smooth_of_charZero` … 4.5 owns that statement (Scope and ownership), and §6.0f is to cite it."
- R02 — repaired: "HeightsRationalPointsAndObstructions §3.8e uses the Picard groups of a connected split reductive group and of its flag variety over a field, which are 6.2's … §3.8e is to cite 6.2 for `Ḡ_red`".
- R03 — repaired: "PurityForFlatCohomology §§7.12a–7.12e use diagonalizable groups, groups of multiplicative type and tori over a base … which are 0.1, 1.1–1.5, 2.1–2.3 and 2.7's, for its §§7.13–7.15 and Layer 8"; the second sentence is deleted.
- R04 — repaired: "(Milne, the paragraph before Proposition 2.37 for the identification with the `π₀` of 1.29, and Proposition 2.37 (e))".

None of the four repairs introduced a new problem. "(its contract *From TauCetiRoadmap.GroupSchemesOverABase*)" now occurs 0 times in the README.

## Verified sound

### Gate, dependency check, elaboration

- **Worker's gate** (`scratch/gate.md`): every counter `0`, including `build=0`; `OK`.
- **My rerun** of the gate with `--order` set to the candidate order: every counter `0` (`depcheck=0`, `dropped=0`, `outside-folder=0`, `readme-ids-missing=0`, `stray-files=0`); `OK`. Without `--order` the same command reports `depcheck: NOT IN ORDER: GroupSchemesOverABase (insert it after its last supplier)`, which is the placement notice for a roadmap the project's order does not list yet, not a defect; the candidate order lists it at line 67.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean`: exit 0, exactly 25 `declaration uses sorry` warnings, no other message. The file is byte-identical to the one the previous review elaborated with `#check @…` for all 33 declarations, so the signature comparison of that round stands (0 lost binders in `scratch/signatures.md`).
- **Headlines and padding.** `Suggested.lean` is unchanged, so the earlier rounds' headline list and one-tactic probe stand.

### The changed passages, resolved at the consumers' heads (index of 20:14 UTC, 9 Nov.)

| Pull request | Head | What it says | The bullet here |
| --- | --- | --- | --- |
| #1491 EllipticCurveModularityPartII | 504db2f | §6.0f (heading at line 778): the intersection `B₁ ∩ B₂` is smooth by Cartier's theorem (782), "Prove Cartier's theorem in the generality used here" (784), *Needs:* "proved within this subsection" (794); 0 mentions of this roadmap | "uses … which is 4.5's … §6.0f is to cite it": true |
| #1017 HeightsRationalPointsAndObstructions | 3dc9d71 | §3.8e (heading at line 1560, text at 1568): proves the field case on `Ḡ_red = Ḡ/R_u(Ḡ)`, with the torsor under the unipotent radical and `groupUnitsPic_product` on `Ḡ × X̄`; 0 mentions | "uses … which are 6.2's … keeping the reduction along the unipotent radical and the product with `X̄`": true, and 6.2 (line 1207) states neither of the two kept items |
| #1840 PurityForFlatCohomology | fb0e7fb | §§7.12a–7.12e (lines 2564–2904) define and prove the theory; §7.13 (2905), §7.14 (2945), §7.15 (2994) and Layer 8 (3046) cite §§7.12a–7.12e in their *Needs:* lines; lines 212–217 say the theory "is owned here"; 0 mentions | "use … for its §§7.13–7.15 and Layer 8 … are to cite them, keeping the comparisons with Tau Ceti's `𝔾_m` and `μ_n` and the Kummer sequence": true |

- Each bullet's "(Scope and ownership)" resolves: **Owned here** (lines 40–63) names 0.1, 1.1–1.5, 2.1–2.3 with the anti-equivalence, 2.7, 4.5 with Cartier's theorem, and 6.2. The twelve section ids the bullets name resolve to headings with that content (0.1 at line 286; 1.1–1.5 at 337, 358, 373, 389, 413; 2.1–2.3 at 453, 489, 501; 2.7 at 592; 4.5 at 817; 6.2 at 1207). `smooth_of_charZero` is declared at `Suggested.lean` line 301.
- **Single owner.** This roadmap owns the three objects by the merge order. What remains is in the other pull requests and is not a finding here: #1491 §6.0f cites 4.5 and drops its own statement and route; #1017 §3.8e cites 6.2 for `Ḡ_red`; #1840 §§7.12a–7.12e cite 0.1, 1.1–1.5, 2.1–2.3 and 2.7, and its paragraph at lines 212–217, which claims ownership of the theory over an arbitrary base, is withdrawn.
- **4.8, Milne.** *Algebraic groups* (2017 PDF, cache text, printed pp. 51–52): the paragraph before Proposition 2.37 (lines 2486–2492) constructs `π₀(G)` and identifies `G → π₀(G)` with the map of 1.29 (Proposition 1.29 at line 1001, the largest étale subalgebra); part (e) (lines 2507–2509) is the product formula, proved from 1.30 (b) (line 2516). Parts (c) and (d), which belong to NeronModelsAndSemistableAbelianVarieties 2.2, are no longer cited. Part (a) (line 2494) still supports the universal property as cited.
- **Other consumers.** FlagVarieties on main (line 19, "GS7") and SpringerResolutionAndCharacteristicCycles at #1828 (line 10, "§7.6") are unchanged; #2114 (FlagVarieties, line 21) keeps the same sentence.
- **Overlaps** (`scratch/overlaps.md`): no other open pull request changes this roadmap; no cited id is dropped; ReductiveGroups §8.1 and §8.2 are defined only by open revisions (#1332, #1676, #1797, #1808), and the pull-request description names #1676 and the other three under "Depends on".
- **Citations** (`scratch/citations.md`): no cross-roadmap citation found nowhere. The two Lean-name leads (`IsMultiplicativeType.exists_etale_cover`, line 491; `IsMultiplicativeType.isotrivial`, line 540) are this roadmap's own declarations in untouched text, and the gate's `readme-ids-missing=0` confirms `Suggested.lean` declares them.

### The seeded sample where it falls in the change

Of the sample, 0.1, 1.2, 1.3, 1.5 and 2.3 are named by the Purity bullet and resolve as above; their text is untouched. The other sampled targets (2.4, 3.2, 3.5, 4.9, 5.1, 5.2, 5.5, 6.3, 7.3, 7.7) lie outside the change, and the previous reviews passed them.

### Remarks on untouched text (no change requested)

- AlgebraicModuliForArithmeticGeometry §7.9 overlaps 4.6's first statement; 0.2 cites §7.9 and 4.6 does not. Carried from the previous rounds.

### Adversarial table

Rows 1–43 and 48–52 are the previous report's (PRREVIEW-GroupSchemesOverABase_r17, rows 1–43 carried there from r15), for statements this change does not touch. Rows 44–47 and 49 were recomputed at this head and at the consumers' current heads.

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1–43 | as in r17 | as in r17 | as in r17 | ok |
| 44 | ECM bullet: 4.5 `smooth_of_charZero` is what §6.0f uses (#1491 504db2f, lines 782–794) | `μ_n/ℚ`; `α_p/𝔽_p`; `B₁ ∩ B₂` proper, not affine; `ker F × 0` in `E × E^(p)` | étale on both sides; excluded on both by characteristic `0`; covered by both (locally of finite type, no affineness); #1491 line 813 uses it as the characteristic-`p` control, order `p`, tangent dimension 1, not smooth | same statement; bullet true |
| 45 | HRPO bullet: 6.2 is what §3.8e uses on `Ḡ_red` (#1017 3dc9d71, line 1568) | `SL₂`; `PGL₂`; `GL_n`; torus; `𝔾_a ⋊ 𝔾_m` | `Pic = 0`; `ℤ/2`; `0`; `0` on both sides; `Ḡ_red = 𝔾_m`, `Pic = 0` after the affine-bundle step, which 6.2 (reductive only) does not state | bullet true, the kept items are outside 6.2 |
| 46 | Purity bullet: Layers 0–2 targets are what §§7.12a–7.12e use (#1840 fb0e7fb) | `D_S(ℤ/6)`; `μ_n`; `𝔾_m × μ₂`; §§7.13–7.15, Layer 8 *Needs:* | smooth over `ℤ[1/6]` on both sides; `X*(μ_n) = (ℤ/n)_S`; `Hᵗᵒʳ = 𝔾_m`; lines 2926, 2972, 3003, 3100, 3128, 3163 cite §§7.12a–7.12e | bullet true |
| 47 | Purity bullet, kept comparisons | points of `D_S(ℤ)`, `D_S(ℤ/n)`; Kummer sequence | #1840 lines 2081 and 2698: `D_S(ℤ)` points give `𝔾_m`, `isLimitMuKernelFork` gives `μ_n`; neither is a target of Layers 0–2 here | ok |
| 48 | 4.8 `exists_componentGroup` | as in r17 | as in r17 | ok |
| 49 | 4.8 products, Milne 2.37 (e) with the paragraph before 2.37 | `μ₃ × ℤ/2` over `ℚ`; `𝔾_m × ℤ_k`; `μ_p × μ_p` over `𝔽_p` | `π₀` of order `3·2 = 6` on both sides; `1 × ℤ_k`, locally of finite type, outside 2.37 and stated here only for finite type; `1 × 1 = 1` | ok; locator now exact |
| 50–52 | as in r17 | as in r17 | as in r17 | ok |

## Not verifiable

- **Carried and untouched:** Sansuc 1981 §6 and Popov 1974 §4 (the cached `sansuc1981` text is the GDZ landing page); Demazure–Gabriel, *Groupes algébriques* I (no legal online copy); Slodowy, LNM 815 (paywalled); Jantzen II.1.8 and II.4.4, Humphreys 1.12, Bourbaki Lie VI §3 no. 4 (not read); Milne's CUP print (the 2017 PDF has the cited numbers; printed page = PDF page − 12).

Ownership was checked against the open roadmap pull requests: `roadmaps grep --fixed 'GroupSchemesOverABase'` over main and the 459 open heads (matches: this pull request, #1828, #2114 and FlagVarieties on main); the sibling checkouts of #1491 and #1840 and `roadmaps show` for #1017, whose heads match the index.

## Source issues

- none
