# Review of AlgebraicTopology (pull request #1652 at c610f76)

**Verdict:** needs changes

Incremental re-review of the 4 lines changed since c204943 (`TauCetiRoadmap/AlgebraicTopology/README.md` only). The folder is clean: the May locator is repaired exactly as asked, the gate passes, and nothing in the changed passage or in text depending on it is wrong. One P3 finding remains, carried from the previous review and partly repaired; it is in the pull request's title and description, not in the README or `Suggested.lean`.

## R01 (P3) — Title and description still describe a different head, and do not say that DGFloerPartII §1.0 states §4.8's identification

**Location.** The title and description of the pull request: "AlgebraicTopology: compact Cech pairs and relative cup modules"; "Add a compact-metric Čech construction by finite-cover nerves and refinement colimits … This amendment changes only README mathematics; existing Lean modules are unchanged".

**Claim.** The previous R01 asked for three things in the pull request text. The order against the conflicting pull requests is now stated; the other two are not done.

**Witness.**
- **Wrong scope.** `TauCetiRoadmap/AlgebraicTopology/README.md:190`–`:191` puts "Compact closed-pair Čech theory, continuity and cube-module extensions" outside this roadmap, so the title names what the head excludes.
- **Unmentioned changes.** `git diff --stat origin/main...HEAD` shows seven Lean modules of the folder deleted and `Suggested.lean` rewritten (3178 lines changed), against "existing Lean modules are unchanged".
- **Two statements of one identification.** This head owns the identification of Mathlib's `GeneratedByTopCat` (family `CompHaus`) with `CompactlyGenerated` in §4.8 (`README.md:162`–`:166`, `:1797`–`:1807`). DGFloerPartII at c8e0b93 states the same identification in its §1.0 (`TauCetiRoadmap/DGFloerPartII/README.md:558`–`:566`) and `TauCetiRoadmap/DGFloerPartII/Suggested.lean:106` (`compactlyGeneratedToTop_isLeftAdjoint`), without citing §4.8. AlgebraicTopology is on main, so it is the owner.

**Repair.** In the pull request text only:
1. Retitle and describe the head: the Layer form at Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b, the seven deleted modules, §§6.6 and 8.13–8.16, the Hurewicz and representability headlines, Mathlib's coreflection consumed in §4.8, Hausdorffness of Mathlib's projectivization in §4.6, and the Stage-to-Layer anchor table.
2. State that DGFloerPartII §1.0's identification, convenient products, exponential law and pointed suspension–loop adjunction become citations of AlgebraicTopology §4.8 when this merges.

## Previous findings

- R01 — partly repaired: the description now has "`AlgebraicTopology`: **this pull request** → #1807 → #1808 → #1854 → #1187 (pin bump)"; title, body and the DGFloerPartII statement are unchanged. Carried above as R01.
- R02 — repaired: `README.md:4214`–`:4217` now reads "§3 (homotopy groups of Kan complexes), §§14–16 (the realization and its comparison with topological spaces) and §17 (Theorem 17.1 and Proposition 17.4, simplicial groups and the Moore complex), supply".

## Verified sound

**The changed passage** (`README.md:4214`–`:4217`, the closing source paragraph of §8.12). Read against may1967:
- contents, lines 53–79: §3 "Homotopy of Kan complexes" (Chapter I), §14 "The realization", §15 "Adjoint functors", §16 "Comparison of simplicial sets and topological spaces" (Chapter III), §17 "Simplicial groups" (Chapter IV);
- §3 begins at line 258, §15 at line 1604, §16 at line 1688 (Lemma 16.3 at 1748, Theorem 16.6 at 1762);
- Theorem 14.1 at lines 1578–1580 (the realization is a CW complex with one n-cell for each nondegenerate n-simplex);
- Theorem 17.1 at line 1822 (every group complex is a Kan complex) and Proposition 17.4 at line 1890 (homotopy groups of a group complex are the homology of its Moore complex).

The new sentence agrees with the three other May citations of the README (`:1757` §14; `:3270` §3; `:3303`–`:3304` §17) and with the References entry (`:4802`–`:4805`: §3, §14 Theorem 14.1, §17). The repair introduced no new problem: the verb now agrees with its plural subject, and no section number, name or supplier elsewhere depends on the sentence. None of the fifteen seeded sample targets falls in the changed passage; their checks stand as in the review of c204943.

**Gate, dependencies, build** (run on this head).
- The gate printed every counter at 0 and "OK", as `scratch/gate.md` does (there with `build=0`).
- The dependency check printed `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` exited in 53 s with 17 "declaration uses `sorry`" warnings and nothing else.
- `git diff --stat c204943 HEAD` is one file, 3 insertions and 1 deletion; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty. `Suggested.lean` is byte-identical to the file the previous review probed, so its padding probe (no theorem closes in one tactic) and its signature comparison (25 declarations) stand.

**Adversarial table.** The diff changes no statement, definition, Check or Lean declaration. The one changed passage has its own row with the values read; every other row is carried from the review of c204943 (its "Adversarial table"), where the computed values are recorded.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| May locator, §8.12 source paragraph (changed) | contents of the book; the four sections named; the two numbered results | README: §3, §§14–16, §17, Thm 17.1, Prop. 17.4. Source: §3 line 56/258, §14–§16 lines 72–75/1604/1688, §17 line 79, Thm 17.1 line 1822, Prop. 17.4 line 1890; no "Chapter 12" remains | repaired |
| 1.1/1.3 cover colimit versus based presentation | S¹ by two arcs | free product of trivial groups 1 against π₁(S¹)=ℤ; groupoid on two basepoints gives ℤ | carried, holds |
| 1.5 wedge and circle | S¹∨S¹; two-arc S¹ | F₂; ℤ | carried, holds |
| 3.4 / 5.7 Mayer–Vietoris and augmented Čech row | point covered twice | 0→R→R²→R→0, c↦(−c,c), (a,b)↦a+b exact | carried, holds |
| 4.4 isometry A; 4.6; 4.7 radial map | n=1, 2; z=(1,0) | det +1, −1=(−1)^(n+1); weights (0,2/3,1/3) | carried, holds |
| 6.2 `lsCupLength_add_one_le_categoryCount` | point; S¹; T² | 1≤1; 2≤2; 3≤3 | carried, holds |
| 6.4 `poincareDuality_of_isFundamentalClass`, `poincareDuality_twoTorsionCoefficients` | two points; 2[S¹]; RP² over ℤ/4 and 𝔽₂ | bijective; local image 2 not fundamental; Betti 1,1,1 | carried, holds |
| 6.6 `productBallImages_intersect` | p=q=0; f(x)=(x,0), g(y)=(0,y) | one point; common point (0,0) | carried, holds |
| 7.1 Euler–Poincaré with local systems; 7.2 `finsum_finrank_singularHomology_fiberBundle` | Möbius system on S¹; Hopf; Klein bottle | χ=0=1·0; 0=2·0; 0=0·0 | carried, holds |
| 8.3 `hurewicz_bijective`; 8.4 `relativeHurewicz_bijective` | S², n=0; (D³,S²); (D²,S¹∨S¹) | ℤ=ℤ; ℤ→ℤ; F₂→ℤ² excluded by simple connectivity of A | carried, holds |
| 8.5 `homologicalWhitehead`, `properStrongDeformationRetract_of_inverse` | Poincaré sphere; (ℝ,{0}) | π₁ of order 120, excluded; g not proper, excluded | carried, holds |
| 8.7 CW type and recognition | ℕ discrete; n=0, 1 | no finite model; `2 ≤ n` needed | carried, holds |
| 8.8 `groupClassifyingSpace_isEMOne` | trivial group; ℤ/2; S₃ | point; RP∞; π₁ of order 6 | carried, holds |
| 8.10 `ordinaryEMRepresentability` | K=S¹, X=S¹, S²; K=S²; Warsaw circle | ℤ=H¹(S¹), 1 class and H¹(S²)=0; [S³,S²]=ℤ against 0 excluded; CW type of X needed | carried, holds |
| 8.11 `finiteSourceMappingCWType` | X=∅; S¹ into S¹⊂ℝ² | one point; components ℤ against contractible | carried, holds |
| 8.13 `exists_transverse_circle_classifying_map` | M=∅; M=S¹, a=k | empty map; z^k with k regular preimages | carried, holds |
| 8.14–8.15 `elementaryAbelianPair_sphere_action_has_stabilizer` | n=0, 1, 2 with p=2 | 4>2 points; cyclic deck group; dim H³=4 against ≤1 | carried, holds |
| 8.16 essential map T³→S² | f=p∘q | homotopy and reduced homology maps 0; lifted nullhomotopy contradicts degree 1 | carried, holds |

**Library declarations and cross-roadmap citations.** The diff names no library declaration and no roadmap; the 60-odd pinned declarations and the supplier citations opened in the review of c204943 are untouched. For R01 I opened DGFloerPartII at its open head c8e0b93 (`README.md:548`–`:570`, `Suggested.lean:99`–`:108`) and this README's `:162`–`:166`, `:188`–`:191`, `:1797`–`:1807`. The worker's resolver lists one lead, `Singular.BrouwerFixedPoint` (`README.md:397`), which is a module name, as before.

**Overlaps.**
- Conflicting heads: #1187, #1807, #1808, #1854. The description now orders all four after this pull request; #1797 no longer conflicts.
- No id this README cites is dropped by an open pull request or defined only by an open revision.
- The four `#stage-k-…` anchors the overlap check lists are mapped by the table "Former anchor (Stage numbering) | Anchor now | Section now" in the README, so they are not a finding.
- Ownership against the other open pull requests was checked through the overlap list and DGFloerPartII's folder, not by reading every open folder.

## Not verifiable

- **Uncertified manifest entries cited by locator** (unchanged): Thom 1954, Chapter II; Lee, Theorems 6.26, 6.30, 6.35, 6.36; Milnor, *Morse Theory*, Lemmas 3.6–3.7; Freedman–Quinn §7.7; Weibel; tom Dieck; Serre 1953; Dowker 1952.
- **May's text** is an OCR of a two-pages-per-scan copy: section headings and theorem numbers are legible at the lines given; the formula of Proposition 17.4 is garbled in the extraction and was read with the surrounding prose (lines 1886–1890).
- **G. W. Whitehead, Chapters IV–VII** (same sentence, untouched): no manifest copy; cited by chapter.

## Source issues

- none
