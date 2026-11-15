# Review of DGFloer (pull request #1798 at 594f234)

**Verdict:** needs changes

Incremental re-review of the 22 lines changed since 46cd96a (all in `TauCetiRoadmap/DGFloer/README.md`: the titles of 5.5, 8.1 and 8.6, a new opening paragraph of 8.1, and 8.2–8.5 turned from `###` headings into bold run-in labels), with the pull request's title and description read against this head. R01 is in text the diff did not touch: it is raised because the supplier it cites, AlgebraicTopology at the head of #1807, was renumbered after the review of 46cd96a (that review read a Stage-form head, with "Stage 5.0 inventory" at `:1334`; the head is now 89357f3, in Layer form).

## R01 (P2) — "AlgebraicTopology Stage 4.8" is compact generation at the supplier's head

**Location** `TauCetiRoadmap/DGFloer/README.md:164–165`: "Layer 1 item 2's CW approximation of arbitrary spaces and its connected-map homology comparison (cited as connectedMapHomologyComparison): AlgebraicTopology Stage 4.8." The same citation is at `:219`, `:823`, `:1044`, `:1086`, `:1257`, `:1270`, `:1417`, `:1873`, `:1903`, `:1934`, `:3949`, `:4017`, `:4165`, `:4320`.

**Claim** Section 4.8 of AlgebraicTopology, at the head of #1807 and on main, is not CW approximation, so the 15 citations name a section that does not make the statement.

**Witness** #1807 at 89357f3, `TauCetiRoadmap/AlgebraicTopology/README.md:1026–1028`: Stage 4 item 8 is §4.8, compact generation; "§4.10 is connected maps, weak equivalences and CW approximation" (heading `:2082`). Its `:5354` says DGFloer consumes §4.10. Main `:1795`: 4.8 is compact generation.

**Repair** Replace "Stage 4.8" by "§4.10" in the 15 lines (`:823`: "4.10's CW approximation of every space and of pairs"; lists such as `:1270` become "AlgebraicTopology §4.10 and Stages 5.5, 8.3 and 8.8c"). Stages 5.0, 5.5, 8.3, 8.8, 8.8a, 8.8c and 8.8d resolve at 89357f3 through its Stage-to-section note and need no change.

## R02 (P3) — The description gives Stage 4.8 as CW approximation and as absent from main

**Location** Description, **What moves to AlgebraicTopology**: "CW approximation of arbitrary spaces and the connected-map homology comparison (Stage 4.8)"; **Merge order**: "Stages 4.8, 5.0, 8.8c and 8.8d are not on main".

**Claim** Both sentences are contradicted by AlgebraicTopology at #1807's head and on main.

**Witness** As R01: at 89357f3 the content is §4.10; §4.8 (compact generation) is on main at `TauCetiRoadmap/AlgebraicTopology/README.md:1795`. Not on main: 4.10, 5.0, 8.8c, 8.8d (no such heading in main's file).

**Repair** "…the connected-map homology comparison (§4.10)" and "§§4.10, 5.0, 8.8c and 8.8d are not on main".

## R03 (P3) — The description plans rebases of #1652 and #963, which are no longer open

**Location** Description: "#1652, an AlgebraicTopology revision that conflicts with #1807 … is rebased onto #1807's AlgebraicTopology before it merges and keeps that revision's stage numbers." and the paragraph "#963, another revision of DGFloer, conflicts with this one … It is rebased onto this pull request before it merges".

**Claim** #1652 has merged, with its own numbering, and #963 is not an open pull request; neither sentence describes what will happen.

**Witness** Main 9ecced85 (2026-11-10): "AlgebraicTopology: Layer form at the current pins … (#1652)". The index of 476 open roadmap pull requests (2026-11-15) has no #963; the overlap check lists no other open pull request changing DGFloer.

**Repair** Replace the #1652 paragraph by: "AlgebraicTopology on main is in Layer form (its §4.8 is compact generation, and its §5.5 consumes DGFloer Layer 1 item 2); #1807 revises that text and keeps its section numbers." Delete the #963 paragraph.

## R04 (P3) — #1854 does not carry AlgebraicTopology

**Location** Description: "#1808 and #1854 carry the same AlgebraicTopology stages and conflict with #1807. If one of them lands those stages instead, it is the one this pull request follows".

**Claim** At its head #1854 changes no AlgebraicTopology file.

**Witness** #1854 at 57ba017 changes BanachSpaceTheory, MorseNovikov, OperatorTheory and SelfAdjointSpectralTheory only. #1808 (705e4f6, draft) does carry AlgebraicTopology, still in Stage numbering (its Stage 4.8 is CW approximation, `:113–117`).

**Repair** "#1808 carries the same AlgebraicTopology targets, in Stage numbering (CW approximation as Stage 4.8), and conflicts with #1807. If it lands them instead, it is the one this pull request follows, and the README's citations take its numbering."

## R05 (P3) — TangentialBordism and HomotopySpheres are on main, not open pull requests

**Location** Description, **Why.**: "DGFloer on main consumes TangentialBordism, HomotopySpheres and ImplicitAtlases, which are still open pull requests".

**Claim** Two of the three are roadmaps on main.

**Witness** Main 5f7befb6 (TangentialBordism, 2026-11-11) and 3ba54598 (HomotopySpheres, 2026-11-11) added the folders; both are in main's `TauCetiRoadmap/`. Only ImplicitAtlases (#974) is open.

**Repair** "DGFloer on main consumes TangentialBordism and HomotopySpheres, both on main, and ImplicitAtlases, still an open pull request; TangentialBordism, HomotopySpheres and StringOrientation consume it, so these roadmaps form a dependency cycle on main."

## R06 (P3) — After the retitling, 5.5 never says what "lives over the fundamental class" means

**Location** `TauCetiRoadmap/DGFloer/README.md:1832–1835`: "### 5.5 Fibre shriek maps and the top column of the index spectral sequence — Construct the source's Definition 2.3 and the chain characterization of Proposition 2.5 with the coefficient and orientation data."

**Claim** The former title was the only text naming the notion Definition 2.3 defines; "lives over the fundamental class" is now used at `:1856`, `:1862`, `:1864`, `:1865` without a definition.

**Witness** `bdho-cotangent` lines 1092–1095: the definition is non-vanishing under the shriek map of the basepoint. DGFloerPartII (#1799) `README.md:1346–1347` cites "living over the fundamental class in the sense of DGFloer Layer 5 item 5".

**Repair** Open 5.5 with: "Say that a class `α ∈ H_*(B, ∂B; 𝓕)` *lives over the fundamental class* of the `n`-manifold `B` when its image under the shriek map `i_! : H_*(B, ∂B; 𝓕) → H_{*−n}(𝓕_b)` of a point `i : {b} → B` is nonzero (the source's Definition 2.3), and for a fibration `E → B` apply this to `𝓕 = C_*(F)`. Prove the chain characterization of Proposition 2.5 with the coefficient and orientation data." Tested on the three Checks: `i_!([B] × α) = α ≠ 0`; `i_![S³] = [S¹] ≠ 0`; `H₂(ℝP²; ℤ) = 0`.

## R07 (P3) — The id 8.1 now names both the group 8.1–8.5 and its first item

**Location** `TauCetiRoadmap/DGFloer/README.md:3704`: "### 8.1 The DG Floer complex, its continuation maps and their homotopies", followed by the unlabelled representing-chain-systems target and the run-in labels `**8.2 …**` to `**8.5 …**` (`:3727`, `:3744`, `:3757`, `:3784`).

**Claim** The title of 8.1 describes 8.3–8.5, while every use of 8.1 or "item 1" means the representing chain systems, which now have no label; 8.2–8.5 are numbered targets without the `### k.n` heading that every other numbered section has.

**Witness** `:3746` (8.3, the DG Floer complex): "*Needs:* items 1–2" — circular if item 1 is the heading's "DG Floer complex". `:4589`: "Props 3.4, 3.6, Def 3.5 | 8.1".

**Repair** Either restore the five headings (`### 8.1 Representing chain systems for Floer moduli spaces`, `### 8.2 …` to `### 8.5 …`) and keep the new paragraph as the layer's opening text, or head the group `### 8.1–8.5 The DG Floer complex, its continuation maps and their homotopies` and start its first target with `**8.1 Representing chain systems for Floer moduli spaces.**`. With either, "item 1" at `:3729` and `:3746` and the row at `:4589` read as the chain systems.

## Previous findings

- none: the review of 46cd96a accepted with no finding.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 5.5, the notion of Definition 2.3 (R06) | `Y = S¹`, `𝓕 = ℤ`; trivial `B × F → B`; Hopf; `ℝP²` over `ℤ` | `j_![S¹] = 1`, `j_![pt] ∈ H₋₁ = 0`: exactly the nonzero multiples of `[S¹]`; `i_!([B] × α) = α`; `i_![S³] = [S¹]`; `H₂(ℝP²; ℤ) = 0` | holds with the repair's definition |
| 5.5 new title against its content | Def 2.3, Props 2.5, 2.6, 2.12, Lemma 2.14, Cor 2.13 | shriek of `{b} → B` has degree `−n`; `E^∞_{n,*}` is the top column `p = n`; both named in the title | title accurate |
| 8.1 new paragraph: "8.6 and 8.7 use 8.3–8.5" | the `*Needs:*` lines of 8.6, 8.7 | 8.6: items 3–5 (`:3803`); 8.7: items 3–6 (`:3828`); both contain 3–5 | holds |
| 8.1 as an id (R07) | `*Needs:*` of 8.2, 8.3; coverage table | 8.2 needs item 1, 8.3 needs items 1–2; `:4589` maps Props 3.4, 3.6 to 8.1: item 1 = chain systems, not the complex | title wrong for the id |
| 8.6 new title against its content; its `T²` Check | `T²`, `n = 1`, height function | Morse indices of `−H`: `2, 1, 1, 0`; `CZ = n − ind = −1, 0, 0, +1`; `FH_k ≅ H_{k+1}`: ranks `1, 2, 1`, sum `4` = number of orbits, `χ = 0` | holds |
| AlgebraicTopology citations at #1807 (89357f3) (R01) | sections 4.4, 4.5, 4.8, 4.10, 5.0, 5.5, 8.3, 8.8, 8.8c, 8.8d | headings at `:1485`, `:1626`, `:1976` (compact generation), `:2082` (CW approximation), `:2162`, `:2367`, `:3894`, `:4252`, `:4344`, `:4439` | 4.8 wrong; the rest resolve |

Rows for the untouched statements stand as in the previous review, of `46cd96a`.

- Gate, rerun at 594f234: `gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also records `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/DGFloer/Suggested.lean` (unchanged since 46cd96a): seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244), nothing else. The diff changes no Lean statement, so the `#check` comparison and the padding probe were not rerun.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty; `git diff 46cd96a..HEAD` touches `README.md` only (11 insertions, 11 deletions).
- Source locators checked: 2 (`bdho-cotangent` lines 1081–1095 for Definition 2.3; lines 45–57 for the section titles). No seeded target falls in the changed passages; the README flags no locator as unverified.
- Cross-roadmap citations resolved: 10 AlgebraicTopology sections at #1807's head (table), main's AlgebraicTopology `:876`, `:1795`, and 3 citations of Layer 5 item 5 in DGFloerPartII (#1799, `:1347`, `:1391`, `:1869`), which keep resolving. No roadmap on main or open cites Layer 8 items 1–5 or the former titles of 5.5, 8.1 and 8.6.
- Description, sentences confirmed at this head: the title; the summary block; **Other suppliers** (the README names none of TangentialBordism, HomotopySpheres, ImplicitAtlases; HamiltonianReduction R1a, TaubesGromov and Layer 7.G are cited); the moved ids of **What moves to DGFloerPartII** (numbering note `:186–199`); **Shape** (the `##` headings in the order it lists); **Suggested.lean** (`import Mathlib` and four `TauCeti.*` modules, seven declarations); main's AlgebraicTopology still consumes DGFloer Layer 1 items 2–4 (`:2029`, `:2035`, `:2044`). The retitlings of this head change no heading that main has, so the description owes them no sentence.
- Remark, no change requested: the generated `depends-on` and `merge-order` blocks name #1807 as "AdicSpacesPartIII (and 12 other roadmaps)"; AlgebraicTopology is one of the 12.

Overlap check: read AlgebraicTopology (main and #1807) and DGFloerPartII (#1799) where the changed passages and their citations touch them; the diff adds no object, so nothing new is shared. The scopes of FukayaTheory, HeegaardFloer and HamiltonianFloerOperations were not read again.

Source independence: changed passages only; 8 passages (three new titles, the new paragraph of 8.1, four run-in labels) compared with 1 source, `bdho-cotangent`, none shared (the former title of 5.5 coincided with the source's §2.4 title and is gone; "Homotopies" in 8.5 is one word); the arrangement was not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- Whether #963 was closed or merged under another number: it is absent from the index of open pull requests and from main's log; nothing further was looked up.
- Carried from the previous reports: Weibel 5.5.1(2) and 5.5.10 (1.3); Serre 1951 and 1953 (1.2, 1.4); the texts settled as uncertified (Palais 1960, Hofer–Zehnder, Struwe, Bröcker–tom Dieck, Massey, Whitehead, Hofer–Salamon).

## Source issues

- none

## For the human reviewers

- none
