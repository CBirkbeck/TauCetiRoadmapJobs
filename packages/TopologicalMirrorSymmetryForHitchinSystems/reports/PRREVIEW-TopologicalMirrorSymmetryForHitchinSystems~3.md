# Review of TopologicalMirrorSymmetryForHitchinSystems (pull request #1814 at 12073e7)

**Verdict:** needs changes

Incremental re-review of the 132 lines changed in `TauCetiRoadmap/TopologicalMirrorSymmetryForHitchinSystems/` since 447001d, and the check of the pull request's title and description against this head. The folder's change is sound; the one finding is in the description.

## R01 (P3) — The description implies stated, sorried theorems; `Suggested.lean` declares nothing

**Location:** pull request description, paragraphs "Roadmap folder …" and "Validation: …": "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** At this head the acceptance file states no definition and no theorem and contains no `sorry`; the description says nowhere that every headline theorem is recorded as not statable at the pins, and both sentences suggest the opposite.

**Witness:** `TauCetiRoadmap/TopologicalMirrorSymmetryForHitchinSystems/Suggested.lean` lines 8–9: "None is statable at these pins"; lines 56–58 open and close the namespace with nothing between; `lake env lean` on it exits 0 with no output, so no `sorry` warning.

**Repair:** Replace the two sentences by: "the Lean file declares nothing: none of the 32 headline theorems is statable against the pinned Mathlib and Tau Ceti, and its module docstring names each one with the carrier it lacks; every target is in the README." and "Validation: the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`); …" (the rest of the line unchanged).

## Previous findings

- none: the review of 447001d listed no finding (its R01–R05 bullets account for the review of cceef7d, all repaired there; none of the passages they concern changed in meaning since: the diff only turns their `###` headings into bold run-in labels).

## Verified sound

**What the change is.** Twenty `### k.n` headings (1.2, 1.3, 1.5, 1.6, 2.2, 2.3, 2.5, 2.6, 2.8, 3.2–3.4, 3.7, 3.8, 4.2, 4.3, 4.5–4.7, 5.6) became bold run-in labels with their text byte-identical; ten headings (1.1, 1.4, 2.1, 2.4, 2.7, 3.1, 3.6, 4.1, 4.4, 5.5) were retitled as groups and each gained one sentence saying what the group delivers and who uses it; six lines of the `Suggested.lean` docstring gained a `(README §k.n)` pointer. No statement, hypothesis, locator, `*Needs:*` line, layer or supplier changed.

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| Group sentences (new): 38 "§a uses §b" claims in the ten sentences | each claim against the `*Needs:*` line of §a (lines 436–1083) | 37 found in the `*Needs:*` line; "§4.7 uses §3.7" found in §4.7's proof route (line 945), its `*Needs:*` line 953 lists §3.8 only | holds (see remark below) |
| §1.1 sentence: Split′ consumed "through §1.3" by §§1.4–1.6, 2.2, 4.5 | all `*Needs:*` lines citing §1.1, §1.2 or §1.3 | §1.3 cited by 1.4, 1.5, 1.6, 2.2, 4.5; §1.1 and §1.2 cited only inside the group | holds, list complete |
| §3.1 sentence: users §§3.5, 3.6, 3.9, 4.1–4.2, 4.4, 4.6 | `*Needs:*` of each | 3.5: §3.1, §3.3; 3.6: §3.1, §3.3; 3.9: §§3.1–3.4; 4.1, 4.2, 4.6: §3.4; 4.4: §3.1, §3.3 | holds |
| §4.1 heading and sentence (cites §§4.1–4.3); §4.2 degrees | (n, deg D) = (2,1), (4,1), (6,1), (3,1), (5,2) | deg M = −1, −6, −15, −3, −20; even n: deg T = −1, −3, −5, deg N = 0, 0, 0; odd n: deg Q = −1, −4, deg N = 0, 0 | holds |
| §4.1 against GWZ20 line 2500 (Theorem 7.15) | hypotheses on each side; n = 3, d = 1, e = 3 | both: n, d coprime, p ∤ nd, D⊗ω⁻¹ positive or trivial, primitive n^(2g)th root, e prime to n and p; e = 3 excluded on both sides | holds |
| §3.6 heading and sentence; norm target L M⁻¹ | n = 2; n = 1 | π_*O_Y = O⊕D⁻¹, M = D⁻¹; det π_*B = L gives Nm(B) = L·D = L M⁻¹; GWZ20 line 2347 prints L⊗det π_*O_Y = L D⁻¹; n = 1: M = O, both L | holds; the README's exponent is the right one |
| §5.5 heading and sentence; Tγ(ν) = (ν,γ)⁻¹Tγ(0) against GWZ20 line 2819 (Lemma 7.25) | ν = 0; order 3, χγ(ν) = ζ^(νγ) | ν = 0: factor 1 on both sides; order 3: factor ζ^(−νγ), source has (ν,γ′)⁻¹ | holds |
| §2.7 heading and sentence against GWZ20 line 2051 (Theorem 6.12) | statement on each side | both: finite field k, dual pair, equality of twisted stringy counts and, for every a ∈ A(k), of Frobenius traces on the inertia direct image with coefficients Nα(F) | holds |
| §2.4 heading and sentence against GWZ20 line 1872 | statement on each side | both: #^α_st(M_k)/q^(dim M) = ∫ over M(O_F)^♮ of conj(fα) dμ_orb; the cached arXiv copy numbers it Corollary 5.28, the README cites the published 5.29 | holds (numbering under Not verifiable) |
| §3.1 heading and sentence against GWZ20 lines 2236–2253 (Definition 7.1, Remark 7.2) | n = 1; n = 2, char ≠ 2 | n = 1: Tr θ = 0 forces θ = 0, E = L, a point; n = 2: scalar automorphisms of determinant 1 are μ₂, so μn-rigidification (README) is the fixed-determinant form of the source's 𝔾ₘ-rigidification | holds |

Rows for every other statement stand as in the previous review, of `447001d`; no statement changed.

- Gate (worker, at 12073e7): every check 0, `OK`. Dependency check, my run: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/TopologicalMirrorSymmetryForHitchinSystems/Suggested.lean` exits 0 with no output. The file declares nothing, so there is no declaration for `#check` or for the one-tactic probe; its 32 docstring entries each name a README target (26 by a bold label or heading that still carries that title, 6 by the added `(README §k.n)` pointer, all six resolved).
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- Source locators checked against the text: 6 (the sampled targets that fall in changed passages: §§2.4, 2.7, 3.1, 3.6, 4.1, 5.5), in GWZ20's arXiv copy 1707.06417v3, lines 1872, 2051, 2236, 2345, 2500, 2728 and 2818. The sampled targets §§0.1, 0.2, 0.5–0.7, 3.5, 3.10, 5.1, 5.4 lie in untouched passages.
- Cross-roadmap citations: none added or changed; the worker's resolver lists none unresolved. No other roadmap, open or on main, cites a section of this one by number (CountingBundlesAndHallAlgebrasOfCurves line 1570 and MixedHodgeModulesAndIrregularHodgeTheory line 1183 name it as a consumer only), so turning headings into run-in labels breaks no citation.
- Pull request text, the rest: the title, the summary block, the list of thirteen contracts (13 `gap:` slugs in the README, matched one to one), the end theorems (§§5.1, 5.2, 5.4, 5.6), "the Lean imports none of them" and the folder's three files agree with the head. The regrouping changes nothing the description names.
- Remark (untouched text): §4.7's `*Needs:*` line (README line 953) omits §3.7, which its proof route uses directly; §3.8, which it lists, needs §3.7.
- Remark: 25 parenthetical glosses in `*Needs:*` and `### Dependencies` lines keep the former titles of the ten retitled headings (for example "§2.7 (fibrewise arithmetic mirror symmetry)"); each still describes the first target under that number.

Overlap check: read CountingBundlesAndHallAlgebrasOfCurves, GlobalShtukasAndFunctionFieldLanglands, AlgebraicModuliForArithmeticGeometry (the lists of roadmaps on main and of roadmaps close by results are empty); nothing shared: the first owns the canonical-twist GL Higgs geometry and purity, the third gerbes, rigidification and quotient inertia, and this roadmap cites both for them.

Source independence: changed passages only; 20 passages (ten headings, ten group sentences) compared with 1 source (GWZ20, arXiv v3, its subsection titles at lines 16–57 and the statements above), none shared; largest share GWZ20, 77 of 101 locators; no layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- GWZ20 published version (Inventiones 221, 2020): paywalled, recorded `uncertified`; read in the arXiv v3 copy. As the review of cceef7d recorded, the published numbering the README cites is one higher than the arXiv copy's in §5.6 and §6.3 (arXiv Corollary 5.28, Lemma 6.15, Theorem 6.16 = README Corollary 5.29, Lemma 6.16, Theorem 6.17); the published page numbers were not checked.
- Ownership against the open pull requests beyond the three closest roadmaps was not searched again: the diff adds no object.

## Source issues

- **Misprint** in GWZ20 at Lemma 7.8(a), §7.2, p.579: the source says the SL Hitchin fibre is the norm preimage of L tensor the determinant of the direct image of the structure sheaf; it should be L tensor the inverse of that determinant, by the norm formula in its own proof; affects nothing. (Already recorded by the review of cceef7d; seen again at line 2347.)

## For the human reviewers

- none
