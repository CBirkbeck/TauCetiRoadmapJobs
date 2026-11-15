# Review of DGFloer (pull request #1798 at b1d5c48)

**Verdict:** needs changes

Incremental re-review of the 62 lines changed since 594f234 (all in `TauCetiRoadmap/DGFloer/README.md`: 15 citations of AlgebraicTopology repointed to §4.10, a definition opening 5.5, the headings 8.1–8.5 restored under a new opening paragraph of Layer 8), with the pull request's title and description read against this head.

## R01 (P2) — The definition opening 5.5 drops orientability, and the third Check of 5.5 is false for it

**Location** `TauCetiRoadmap/DGFloer/README.md:1834–1839`: "Let `B` be a connected `n`-manifold, possibly with boundary … lives over the fundamental class … the target being trivialized by a local orientation at `b`"; and `:1873–1874`: "For `B = ℝP²` over `ℤ`, no class in `H₂(E; ℤ)` lives over an (untwisted) fundamental class, since `H₂(ℝP²; ℤ) = 0`".

**Claim** The source defines the notion for orientable manifolds only. As written here it applies, untwisted and over `ℤ`, to nonorientable `B`, where the Check at `:1873` fails; the paragraph's own closing sentence (`:1844–1846`) wants the `or_B`-twisted class there.

**Witness** `bdho-cotangent` line 1087: orientable. Double cover `S² → ℝP²`, `F` two points, `𝓕 = ℤ[ℤ/2]`: `∂e₂ = (1 + t)e₁`, so `[S²] = (1 − t)e₂ ∈ H₂(S²; ℤ)` and `i_![S²] = (1, −1) ≠ 0` in `H₀(F) = ℤ²`, although `H₂(ℝP²; ℤ) = 0`.

**Repair** Open 5.5 with: "Let `B` be a connected `n`-manifold, possibly with boundary, with basepoint `b`, oriented or taken over `𝔽₂`, and let `𝓕` be a DG local system on `B`. Say that a class `α ∈ H_*(B, ∂B; 𝓕)` *lives over the fundamental class* of `B` when its image under item 3's shriek map `i_! : H_*(B, ∂B; 𝓕) → H_{*−n}(𝓕)` of the inclusion `i : {b} → B` is nonzero (the source's Definition 2.3, `bdho-cotangent` lines 1092–1095). For nonorientable `B` over `ℤ` the notion is that of a class of `H_*(B, ∂B; 𝓕 ⊗ or_B)`, whose shriek image lies in `H_{*−n}(𝓕)` after the two orientation factors contract; such a class lives over `[B]_or`." The fibration sentence and the rest stay. Replace the third Check by: "For `B = ℝP²` over `ℤ` the untwisted notion is not defined, and non-vanishing of the untwisted shriek image would be the wrong extension: for the double cover `S² → ℝP²`, `H₂(ℝP²; ℤ) = 0` while `[S²]` has image `(1, −1) ≠ 0` in `H₀(F) = ℤ²`. With `π^*or_B` coefficients `[S²]` lives over `[ℝP²]_or`." Tested on the witness: twisted, `∂e₂ = (1 − t)e₁`, the cycle is `(1 + t)e₂`, image `(1, 1) ≠ 0`; for `F` a point, `H₂(ℝP²; or) = ℤ` and `[ℝP²]_or ↦ 1`.

## Previous findings

- R01 — repaired: `:165` "AlgebraicTopology §4.10"; no "Stage 4.8" remains in the README (the 15 lines read §4.10; `:1417` "among them §§4.10, 5.0 and 5.5"); §4.10 resolves at #1807 (89357f3) `:2082`.
- R02 — repaired: description, "…the connected-map homology comparison (§4.10)" and "the sections … that main lacks: §§4.10, 5.0, 8.8c and 8.8d".
- R03 — repaired: the #1652 and #963 paragraphs are gone; "On main, AlgebraicTopology is in Layer form, with compact generation as §4.8 … #1807 revises AlgebraicTopology, keeping compact generation as §4.8".
- R04 — repaired: "#1808 carries the same AlgebraicTopology targets in Stage numbering, with CW approximation as Stage 4.8, and conflicts with #1807"; #1854 is no longer named.
- R05 — repaired: "DGFloer on main consumes TangentialBordism and HomotopySpheres, both on main, and ImplicitAtlases, still an open pull request".
- R06 — partly repaired: `:1834–1841` now defines "lives over the fundamental class", but for every connected `n`-manifold, which the Check at `:1873` contradicts; written again as R01.
- R07 — repaired: `### 8.1 Representing chain systems for Floer moduli spaces` (`:3716`) and `### 8.2`–`### 8.5` (`:3735`, `:3753`, `:3767`, `:3795`) are headings again; the group paragraph opens Layer 8 (`:3712–3714`).

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 5.5, the definition at `:1834–1839`, orientable case | `B = S¹`, `𝓕 = ℤ`; `B = Dⁿ`; trivial `B × F`; Hopf | `i_![S¹] = 1`, `i_![pt] ∈ H₋₁ = 0`; `H_n(Dⁿ, ∂Dⁿ) → H₀` iso, absolute `H_*(Dⁿ) → H₋ₙ = 0` (so `∂B` is needed); `i_!([B] × α) = α`; `i_![S³] = [S¹]`, degree `3 − 2 = 1` | holds |
| 5.5, the same definition on nonorientable `B` (R01) | `S² → ℝP²`, `F` two points; `F` a point | untwisted: `[S²] = (1 − t)e₂ ↦ (1, −1) ≠ 0` while `H₂(ℝP²; ℤ) = 0`; twisted: `(1 + t)e₂ ↦ (1, 1)`; `H₂(ℝP²; or) = ℤ ↦ 1` | Check 3 false as written; holds with the repair |
| 5.5, the fibration sentence `:1839–1841` | Example 2.4; *Needs:* line | `H_*(E, ∂E) ≅ H_*(B, ∂B; C_*(F))` is item 4, the shriek item 3; both in "*Needs:* items 3–4"; target `H_{*−n}(F)` as at `bdho-cotangent` lines 1104–1108 | holds |
| Layer 8 opening paragraph: "items 6 and 7 use items 3–5" | *Needs:* lines of 8.6, 8.7 | 8.6: items 3–5; 8.7: items 3–6; both contain 3–5 | holds |
| 8.1–8.5 as ids after the headings return | *Needs:* of 8.2, 8.3, 8.5; coverage table | 8.2 needs item 1 (chain systems, `:3716`); 8.3 needs items 1–2; 8.5 needs item 4; Props 3.4, 3.6, Def 3.5 ↦ 8.1: all read as the titled sections | holds |
| AlgebraicTopology §4.10 at #1807 (89357f3) against what the 15 lines cite it for | CW approximation of every space and of pairs; connected-map comparison with local coefficients; cohomology and pair forms | `:2082` heading; `exists_cwApproximation` for non-path-connected spaces, pair form (Hatcher Example 4.14), `k`-connected comparison on twisted chains, Hom/cohomology comparison for pairs: all in §4.10; its `:5354` names DGFloer as consumer | resolves |

Rows for the untouched statements stand as in the previous review, of `594f234`.

- Gate, rerun at b1d5c48: `gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also records `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/DGFloer/Suggested.lean` (unchanged since 594f234), rerun: seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244), nothing else. The diff changes no Lean statement, so the `#check` comparison and the padding probe were not rerun.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty; `git diff 594f234..HEAD` touches `README.md` only (37 insertions, 25 deletions).
- Source locators checked: 16 in `bdho-cotangent`, for the seeded targets 5.5, 8.1, 8.3 and 8.5, which the diff touches: Definition 2.3 (lines 1092–1095, p. 26), Example 2.4 (1105–1108), Propositions 2.5 (1111), 2.6 (1184), Remark 2.10 (1209), Corollary 2.13 (1237); Proposition 3.4 (1721), Definition 3.5 (1735), Proposition 3.6 (1737); Definition 3.12 (1823), Proposition 3.13 (1836); Proposition 3.30 (2404), Definition 3.31 (2469), Proposition 3.32 (2477), Definition 3.35 (2498); the standing orientability hypothesis (1087). The README flags no locator as unverified; the other seeded targets lie outside the changed passages.
- Cross-roadmap citations resolved: §4.10 and the sections 4.4, 4.5, 4.8, 5.0, 5.5, 8.3, 8.8, 8.8c, 8.8d at #1807's head (headings `:1485`–`:4439`, numbering note `:998–1040`); main's AlgebraicTopology `:1795` (4.8, compact generation) and `:2029–2044` (it consumes DGFloer Layer 1 items 2–3); #1808's AlgebraicTopology `:113` (Stage 4.8, CW approximation); DGFloerPartII (#1799) `:1347`, `:1391`, `:1869`, which cite Layer 5 item 5 and keep resolving. Overlaps: §4.10 is defined only by #1807, which the description's **Merge order** names as the dependency.
- Description read against this head: every sentence of **Why**, **What moves to AlgebraicTopology** and **Merge order** holds (the three repairs above); #1807, #1808 and #1799 are open, with the contents the text gives them. The definition added to 5.5 and the restored headings change nothing the description states.
- Remark, no change requested: the generated `depends-on` and `merge-order` blocks name #1807 as "AdicSpacesPartIII (and 12 other roadmaps)"; AlgebraicTopology is one of the 12.

Overlap check: read AlgebraicTopology (main, #1807 and #1808) and DGFloerPartII (#1799) where the changed passages and their citations touch them; the diff adds no object, so nothing new is shared. The scopes of FukayaTheory, HeegaardFloer and HamiltonianFloerOperations were not read again.

Source independence: changed passages only; 8 passages (the definition and the fibration sentence of 5.5, the opening paragraph of Layer 8, the five headings 8.1–8.5) compared with 1 source, `bdho-cotangent`, none shared (the definition shares at most 5 consecutive words with lines 1092–1095, which the mathematics forces; "Homotopies" in 8.5 is one word); the arrangement was not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- Carried from the previous reports: Weibel 5.5.1(2) and 5.5.10 (1.3); Serre 1951 and 1953 (1.2, 1.4); the texts settled as uncertified (Palais 1960, Hofer–Zehnder, Struwe, Bröcker–tom Dieck, Massey, Whitehead, Hofer–Salamon).

## Source issues

- none

## For the human reviewers

- none
