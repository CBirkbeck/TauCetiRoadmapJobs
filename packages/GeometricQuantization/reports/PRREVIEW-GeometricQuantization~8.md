# Review of GeometricQuantization (pull request #1186 at be6ed5f)

**Verdict:** needs changes

Incremental re-review of the 31 lines changed since bcc5698 (the Conventions sentence on `TauCeti.SmoothTwoForm`, the "From Tau Ceti" and "From TauCetiRoadmap.DifferentialGeometry" contracts, and the Layer 2 docstring bullets of `Suggested.lean`). The previous R02 is repaired. The previous R01 is repaired in its locator part only: the branch still builds against Tau Ceti `a91d3aa`, and every Tau Ceti name the changed passages add exists only at main's pin `2fd255d`. That is the sole finding, P3, and it needs no edit inside the folder.

## R01 (P3) — The branch's `lake-manifest.json` still pins Tau Ceti `a91d3aa`; the changed passages cite `2fd255d` only

**Location.** `TauCetiRoadmap/GeometricQuantization/README.md` lines 57–58: "`TauCeti.SmoothTwoForm I M` is the abbreviation for `TauCeti.SmoothForm I M ℝ 2`"; lines 121–123 (`TauCeti/Geometry/Manifold/DifferentialForm/Smooth.lean`); lines 161–162; `TauCetiRoadmap/GeometricQuantization/Suggested.lean` lines 14–15: "The pinned smooth principal bundles carry no principal connection".

**Claim.** The branch's `lake-manifest.json` pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3c` (merge base 83f4d77 with main; main pins `2fd255d` / `1b1ccf4` since a891cd1). At `a91d3aa`:
- `TauCeti.SmoothTwoForm` is a `structure` (`TauCeti/Geometry/Manifold/TwoForm/Basic.lean`:61), not an abbreviation of `TauCeti.SmoothForm`;
- `TauCeti/Geometry/Manifold/DifferentialForm/Smooth.lean` and `TauCeti.SmoothForm` do not exist;
- there are no smooth principal bundles (`TauCeti/Geometry/Manifold/FiberBundle/` does not exist), so the docstring's "pinned smooth principal bundles" names nothing;
- the Hamiltonian API the Conventions cite (`hamiltonianVectorField`, `poissonBracket`, `IsMomentMap`, `momentCocycle`, `InfinitesimalAction`) is absent, as the previous review reported.

At `2fd255d` every one of these claims is true: `abbrev SmoothTwoForm … := SmoothForm I M ℝ 2` (`TwoForm/Basic.lean`:37–39); `abbrev SmoothForm` (`DifferentialForm/Smooth.lean`:479); smooth principal bundles (`Geometry/Manifold/FiberBundle/Principal.lean`:96–385) with no connection or associated-bundle declaration anywhere under that directory; `IsMomentMap` and `momentCocycle` (`Hamiltonian/MomentMap.lean`:133, 388).

**Witness.** In the pull request's worktree, `grep rev lake-manifest.json` shows `a91d3aafa8…` for TauCeti; `ls .lake/packages/TauCeti/TauCeti/Geometry/Manifold/FiberBundle` fails; a grep of that package for `SmoothForm` returns nothing.

**Repair.** No change to the folder's text. Merge `origin/main` into the branch: `git merge-tree --write-tree HEAD origin/main` at this head is conflict-free (tree 0a13a43e), and main touches nothing in `TauCetiRoadmap/GeometricQuantization/`. After the merge `lake-manifest.json` pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`, and every citation above resolves. Then re-run the gate; `Suggested.lean` imports only `Mathlib` and declares nothing, so the bump cannot break it.

## Previous findings

- R01 — partly repaired: the locator sentence now reads "Use `TauCeti.SmoothTwoForm` in `TauCeti/Geometry/Manifold/TwoForm/Basic.lean` … and `TauCeti.SmoothTwoForm.IsSymplectic` in `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean`", which is right at both pins. The merge of main was not done: the manifest still pins `a91d3aa`. Carried as this report's R01.
- R02 — repaired: `Suggested.lean` lines 20–25 now name §2.3's three results (lift through the simply connected cover, descent exactly when the covering kernel acts trivially, the circle extension integrating a non-equivariant moment map) and the missing carriers (a principal connection and the group of connection-preserving automorphisms), and say that the pinned Lie-algebra `momentCocycle` is not the group-level extension. This matches README §2.3 (lines 444–493: "Descent of the action to G holds iff χ is trivial on F" at line 473, the circle extension at line 479) and `momentCocycle` at `MomentMap.lean`:388, which is a Lie-algebra 2-cocycle. I elaborated the file: exit 0, no output.
- No repair report marks a finding "not actionable in this package", so nothing is re-raised.

## Verified sound

**Gate, dependencies and elaboration at be6ed5f.**
- My gate run: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate (with `build=0`) agrees.
- Dependency check, complete output: `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. GeometricQuantization is at merge-order line 152, right after LieGroupoidsPoisson (151).
- `lake env lean TauCetiRoadmap/GeometricQuantization/Suggested.lean`: exit 0, no output, 5 s. The file declares nothing (docstring plus an empty namespace), so there is no `#check @` comparison and no one-tactic padding probe to run.
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

**The changed passages, checked at both pins.**

| Passage | At `a91d3aa` (branch) | At `2fd255d` (main) | Outcome |
|---|---|---|---|
| README 57–58: `SmoothTwoForm I M` abbreviates `SmoothForm I M ℝ 2` | `structure SmoothTwoForm` (`TwoForm/Basic.lean`:61) | `abbrev SmoothTwoForm (I) (M) … := SmoothForm I M ℝ 2` (`TwoForm/Basic.lean`:37–39), arguments in the stated order | true at main's pin only (R01) |
| README 58, 161: DifferentialGeometry §0.4 "generic smooth forms" | — | main DifferentialGeometry README line 294, "0.4 Bundled forms": refactor `SmoothTwoForm` to `SmoothForm I M ℝ 2`, "retain the old name only as an abbreviation" | matches the README's wording |
| README 121–125: three file paths | `TwoForm/Basic.lean` and `Symplectic/Manifold/TwoForm.lean` exist; `DifferentialForm/Smooth.lean` does not | all three exist; `SmoothForm` at `Smooth.lean`:479, `IsSymplectic` at `Symplectic/Manifold/TwoForm.lean`:115 (closed and nondegenerate) | true at main's pin only (R01) |
| Docstring 11–16: no principal connection, no character-associated line | no principal bundles at all | `TauCeti.PrincipalBundle` smooth API in `Geometry/Manifold/FiberBundle/Principal.lean` and `Principal/Equivariant.lean`; grep for `Connection`, `connection`, `associated` in that directory: 0 hits | the "not statable" claim holds at both pins; "pinned smooth principal bundles" exist at main's pin only (R01) |
| Docstring 20–25: §2.3 headline named | — | `momentCocycle` (`MomentMap.lean`:388) takes a `SmoothTwoForm` and an `InfinitesimalAction`: a Lie-algebra cocycle, no group extension | R02 repaired |

**Cross-roadmap citations re-resolved this round.** DifferentialGeometry §0.4 and §1.4 (main lines 294, 325), Layer 3 §§3.1–3.4, §5.4; LieGroupoidsPoisson §G4.2 (main line 1181, `π♯=−(ω♭)⁻¹`); SmoothBundlesConnections B3–B6 (main). All exist as the previous report recorded; none of the changed lines alters a supplier citation.

**Adversarial table.** The diff changes no mathematical statement: it renames a carrier's description, moves file paths and adds a docstring bullet. The rows of the previous report (PRREVIEW-GeometricQuantization~7, 31 rows covering the Conventions, §2.1–2.3, §3.1–3.4, §4.2–4.3, §5.1–5.3 and §6.1–6.11, with the values computed there) carry forward unchanged for every untouched statement; the sampled targets 1.1, 2.1, 2.3, 3.1–3.3, 4.3, 6.1, 6.3–6.7, 6.9 and 6.11 are among them and none of their text changed. The rows for the changed statements are:

| Statement | Instances and values | Result |
|---|---|---|
| Conventions, line 57: `SmoothTwoForm I M = SmoothForm I M ℝ 2` | `2fd255d`: unfolding the abbrev gives `SmoothForm I M ℝ 2` with `[IsManifold I ∞ M]`; `a91d3aa`: a structure with fields `bilinFormAt`, `altAt` (Basic.lean:35–38, 61) | true at `2fd255d`, false at `a91d3aa` (R01) |
| Conventions, line 55–56: `[X_f,X_g]=−X_{ {f,g} }` (unchanged, re-read because its sentence was edited) | ω=dq∧dp, f=q², g=p: X_f=−2q∂p, X_g=∂q, [X_f,X_g]=2∂p; {f,g}=2q, X_{2q}=−2∂p; equal to −[X_f,X_g] | agrees with r7 |
| Docstring bullet 3: descent "exactly when the covering kernel acts trivially" | README §2.3: F acts through χ, descent iff χ trivial on F; μ≡ℏ: χ(2π)=exp(−2πi)=1; μ≡ℏ/2: exp(−πi)=−1 | agrees with README line 473 and the r7 negative control |
| Docstring bullet 3: bracket of the extension | `[−Y_ξ+sV,−Y_η+tV]=Y_{μ^[ξ,η]}+(c/ℏ)V`, central term −c/ℏ for translations with c=1 | agrees with r7 |

**Headline theorems and statability.** Unchanged from r7: thirteen headlines, now fourteen bullets with §2.3 added; every one is not statable at either pin for the carrier named. I re-searched `2fd255d` for principal connections, associated line bundles and character lines (0 hits under `Geometry/Manifold/FiberBundle/`, 0 hits for `PrincipalConnection|associatedBundle|CharacterLine` in the whole package) and confirm that the new `TauCeti.PrincipalBundle` API (equivariant trivializations, division map, vertical tangent space) does not make §2.1–2.3 statable. Nothing statable is missing.

**Ownership and overlaps.** The overlap tool reports no pull request changing this roadmap, no dropped id and no revision-only id. The closest roadmaps by vocabulary (ConvexityToric #1651, HamiltonianReduction/SymplecticGeometry #1187, #1854, #1808) were checked in r7 and the diff adds no new object; the smooth principal bundle API at `2fd255d` is a library carrier, cited by SmoothBundlesConnections on main, not an object this roadmap builds.

**Remarks on untouched text (no change requested).** None new.

## Not verifiable

- Elaboration and the gate at main's pin are outside this review's allowed Lean commands (they run only in the pull request's worktree, which builds at `a91d3aa`). R01's repair is tested by the conflict-free merge tree and by resolving every name at `2fd255d` in the content checkout.
- Sources: none of the sampled targets' text changed, so no locator was re-read this round; the r7 table stands. Graham–Vogan remains unreadable here (image-only text layer, no OCR), as recorded in r7.

## Source issues

- none
