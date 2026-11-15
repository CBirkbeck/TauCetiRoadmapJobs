# Review of VStackSheavesAndLisseCategories (pull request #1230 at e674772)

**Verdict:** accepted

Incremental re-review of the 32 changed lines since d7ccf5e (README only: three section titles, three new opening paragraphs, five `###` headings turned into bold run-in labels), and the first check of the pull request's title and description against this head. No finding.

## Previous findings

- none: the review of d7ccf5e was an acceptance and listed no finding of its own (its R01–R03 bullets, all "repaired", concern the head before it and are untouched by this diff).

## Verified sound

| Statement (README line) | Instances | Values on the two sides | Result; change |
| --- | --- | --- | --- |
| VS2.4 opening: "VS3, … VS4 and the lisse duality of VS5.3 consume it" (852) | every `*Needs:*` line citing a VS2.4–VS2.6 target from outside | VS3.1–VS3.4: 8 targets (974–1104); VS4.1–VS4.4: 9 targets (1169–1311); VS5: exactly one, lisse Bernstein–Zelevinsky duality (1404, relative solid homology). None in VS0, VS1, VS5.1, VS5.2, VS5.4. | Pass; no change. |
| VS4.3 opening: supplies four items; "duality, Künneth and lisse ULA results of VS5 consume them" (1260) | the four targets under VS4.3/VS4.4; every VS5 `*Needs:*` line | Supplied: strict locality, `L_b`, HN localization with invariance, compact generation: 4 of 4. Consumers: torsion homology, BZ, Verdier (1337–1353), torsion Künneth (1386), lisse BZ, Verdier, Künneth, ULA (1404–1436). Torsion ULA (1394) cites none directly, and is not claimed. | Pass; no change. |
| Same: "IgusaVarietiesAndTorsionConcentration §3.0f uses the stratum extensions and compact generators" (1260) | that roadmap's open head, README 1402–1408 | §3.0f exists; its adapter paragraph names "the extension `L_b = π_{b♯}q_b^*` of VS4.3, its compact generators and finite-support criterion of VS4.4"; its `*Needs:*` has VS4.2–VS4.4. A consumer, no supply edge. | Pass; no change. |
| VS5.1 opening: "VS5.4 consumes the lisse duality and ULA results, and the lisse Künneth formula uses the torsion one" (1327) | `*Needs:*` at 1420 and 1471 | 1471 cites lisse ULA/perfect invariants and lisse BZ duality; 1420 cites `VS5/torsion-kunneth`. | Pass; no change. |
| Torsion Künneth, compactness of `A_i` (1380–1384), cited by the new VS5.1 paragraph | `G₁=G₂=1`, `Λ=𝔽_ℓ`; `A_i=B_i=Λ`; then `A_i=⊕_ℕΛ` | Compact: `Λ⊗Λ=Λ=RHom(Λ,Λ)`. Non-compact: `(∏_ℕΛ)⊗(∏_ℕΛ)→∏_(ℕ×ℕ)Λ` has image the finite-rank matrices; the identity matrix is missed. The hypothesis is needed and stated. | Pass; no change. |
| Lisse ULA ⇔ perfect invariants (1430–1434), cited by the new VS5.1 paragraph | `G=1`, `Λ_disc=ℚ_ℓ`; `V=ℚ_ℓ^n`; `V=⊕_ℕℚ_ℓ` | `V=ℚ_ℓ^n`: `V^∨⊗V→End(V)` is `n²→n²`, bijective; `V` perfect. `V=⊕_ℕℚ_ℓ`: image is finite-rank operators, `id_V` missed; `V` not perfect. Both sides agree in both cases. | Pass; no change. |
| Regrouped labels VS2.5, VS2.6, VS4.4, VS5.2, VS5.3 (923, 933, 1295, 1378, 1396) | citations from other open roadmaps; internal references and anchors | HeckeStacksAndLocalShtukas 880, 889, 2417 (§VS5.3, §VS4.4) and VStackSheavesAndLisseCategoriesPartII 1725 (§VS5.2, "Torsion ULA and perfect invariants") still find the label and the target; `roadmaps resolve` on both: none found nowhere. README: 208 anchor links, 0 broken; lines 94 and 852 name labels that exist. | Pass; no change. |

Rows for every other statement stand as in the previous review, of `d7ccf5e` (the diff changes no statement and no `*Needs:*` line).

- Pull request text against this head: title equals the README title; each claim of the summary block and prose has its passage (`SolidAb` and its three theorems in `Suggested.lean` 44–62; BunGAndNewtonStrata handoff, README 33; `CondensedMod.IsSolid`, `LocallyConstant.freeOfProfinite`, 64–65; Artin without quasiseparatedness, 98 and 106; Igusa consumer, 31 and 1489; folder of three files, nothing removed). No sentence contradicted; the regrouping changes nothing the text describes.
- Source locators checked against the text (FS, author-hosted file, fetched through the sources service), for the sampled sections that fall in the changed passages: VII.4 opening and VII.4.1–VII.4.3 (FS lines 10150–10242, pp.261–263); VII.2.6 (9880, p.255); VII.3.2–VII.3.5 (10012–10149, pp.258–261); V.2.3 (6640, p.172); VII.7.3 (10584, p.273); V.4.1 (6842–6911, pp.177–179); VII.7.4–VII.7.5 (10606–10627, pp.273–274); V.7.2–V.7.3 (7070–7078, pp.183–184); V.7.1 with proof ending at 7121 (pp.183–185); VII.7.6–VII.7.10 (10645–10703, pp.274–276). 17 locators, all exact. The four sampled VS4.0 targets are untouched and stand as in the previous reviews.
- Gate, run again on this head: `gate VStackSheavesAndLisseCategories: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (the worker's run adds `build=0`).
- Dependency check: `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Changes outside the folder: none.
- Elaboration: `lake env lean` on `TauCetiRoadmap/VStackSheavesAndLisseCategories/Suggested.lean` exits 0 with three warnings, `declaration uses sorry` at lines 50, 53, 59. The file is byte-identical to `d7ccf5e`, so the `#check @` comparison and the one-tactic probe of the previous review stand; the four elaborated signatures the worker recorded for this head equal those.
- Overlap check: read VStackSheavesAndLisseCategoriesPartII (scope and base-roadmap paragraph, lines 1–12, and its supplier section), HeckeStacksAndLocalShtukas (its citations of this roadmap), DiamondSixOperations, DiamondEtaleCohomology, AdicCoefficientsAndComparisons, DiamondsAndVStacks, EtaleCohomologyFoundations (the last five as in the previous review; the diff touches no object of theirs); nothing shared. Part II owns layers VS6–VS11 and states where this roadmap stops.
- Source independence: changed passages only; 3 passages (the new opening paragraphs of VS2.4, VS4.3, VS5.1) compared with 1 source (FS, the opening of §VII.4 and the statements of V.4.1, V.7.1, VII.7.2–VII.7.10), none shared; largest share FS, 76 of 97 locators; contents not compared again (no layer added, removed or reordered).
- Remark on untouched text: the References entry calls FS the "author-hosted 356-page edition"; the file at the linked address has 383 pages, and the README's page locators are that file's.

## Not verifiable

- Ownership against open pull requests whose files the brief does not list was checked only through the index (`roadmaps grep`, `roadmaps show`).

## Source issues

- **Misprint** in FS at Proposition VII.7.10, printed page 276: the source says the exterior product of compact lisse objects is compact in the étale category of `Bun_G`; it should be the lisse category `D_lis(Bun_G,Λ)`, as its displayed functor has; affects nothing.

## For the human reviewers

- none
