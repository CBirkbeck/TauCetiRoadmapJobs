# Review of ReductiveGroups (pull request #1797 at ea37f0f)

**Verdict:** needs changes

This is an incremental re-review: 0 lines of `TauCetiRoadmap/ReductiveGroups/` changed since `f925965`, the head the previous review read (both files have the same sha256 as at `f925965` and at `a285fd7`). The two commits since then, `9864ff4a` and `ea37f0f7`, touch only `TauCetiRoadmap/QuadraticFormInvariants/README.md` and `TauCetiRoadmap/AlgebraicTopology/README.md` and `Suggested.lean`, two of the pull request's own folders, and neither mentions ReductiveGroups. The one previous finding is about the pull-request description, which is still the same text, so it stands. Everything inside the folder passes as before.

Paths: `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ReductiveGroups/…`.

## R01 (P3) — five conflicting open pull requests change this folder, and the description gives no merge order

Location: the pull-request description. Its ReductiveGroups paragraph says seven side files were "folded into Suggested.lean section IntegralRational … Spectral (63 statements)", that 18 Tau Ceti imports were added, and "No statement changes".

Claim: the order between the conflicting heads is settled, and the description describes this folder.

Witness: the overlap report at this head lists conflicts with #1332, #1676 and #1808 (`README.md` and `Suggested.lean`) and with #1807 and #1854 (`README.md`). The description names none of them (a grep for the five numbers and for "rebase" finds nothing). `Suggested.lean:107–258` has no `section` at all: three namespaces, seven sorried headlines and ten `TauCeti.*` imports.

Repair: this is a change to the pull-request text; no file in the folder needs to change.
1. State the merge order. #1807 and #1854 change only main's Layer 9E lines 978–980, where they drop ReductiveGroupsPartII RG2.3.7 as a supplier of Lang's theorem. This head already makes that change (`README.md:28–30`, `:3655–3658`). If this pull request merges first, those two drop their ReductiveGroups hunk when they rebase. #1332, #1676 and #1808 rewrite the README differently (3190, 3145 and 2480 changed lines against main; 5296, 2009 and 1286 against this head). Say which of those merges first and that the others rebase on it.
2. Replace the ReductiveGroups paragraph with what the folder now is: the rewritten README with its supplier contracts, and the seven-headline `Suggested.lean` in the namespaces `StructureAcceptance`, `SpecialLinearAcceptance` and `PlaneBraidAcceptance`.

Re-raised: R01 of the previous review (PRREVIEW-ReductiveGroups~62, itself re-raising ~58, ~54 and r49 R04). No repair report says why it is not actionable, and the person who writes the description can make this change.

## Previous findings

- R01 — not repaired: the description at this head still says the seven side files became sections `IntegralRational` … `Spectral`, still says "No statement changes", and names none of #1332, #1676, #1807, #1808 or #1854 (see R01 above).

## Verified sound

**The changes outside the folder** (all in the pull request's own folders):
- `git diff --stat origin/main...HEAD` outside the six folders the brief names is empty. Since `f925965`, the diff touches only `AlgebraicTopology/README.md` (51 lines), `AlgebraicTopology/Suggested.lean` (19) and `QuadraticFormInvariants/README.md` (43).
- **AlgebraicTopology.** `README.md` cites it by name only, at `:4037` (based van Kampen in the plane-braid `*Needs:*`), `:4083` (based van Kampen and CW-cell interfaces) and `:4254` (Layer 11 Dependencies). The AlgebraicTopology diff adds the native `TauCeti.homotopyGroupMulAction` family to its supplier contract, re-points its GeometricTopology citation at 12.1 and Layer 11, renames a pole to `e₀`, and narrows the Brown locator to Theorem 6.7.2 and Theorems 8.4.1 and 9.1.2. None of that touches what this roadmap consumes: "Stage 1: van Kampen through the fundamental groupoid" (`TauCetiRoadmap/AlgebraicTopology/README.md:580`), "Stage 4: CW pairs, cellular homology, and cofibrations" (`:809`) and the completion item at `:31` promising based van Kampen without connectedness assumptions are all still there.
- **QuadraticFormInvariants.** `README.md` does not cite QuadraticFormInvariants, and its diff (Checks for `discr` and `localHasse`, pin names, Milestone 2 universe) does not mention ReductiveGroups.
- **IntegralLattices and LieHighestWeight** are unchanged since the previous review; `README.md:2727`, `:3519` (IntegralLattices) and `:2811`, `:3004`, `:3212`, `:4127` (LieHighestWeight Layers 3–4 and 7) cite them as before.
- **No cycle.** `grep ReductiveGroups` over the AlgebraicTopology, GeometricTopology, IntegralLattices, QuadraticFormInvariants and LieHighestWeight READMEs and Suggested files at this head finds nothing, so none of them consumes this roadmap.

**Gate, dependency check, build**:
- The worker's gate at this head reports every check at zero and `OK`. Run here with `--base origin/main`, it reports zeros everywhere except `outside-folder=45`. All 45 hits are files of this pull request's own folders: AlgebraicTopology 9, GeometricTopology 30, IntegralLattices 1, QuadraticFormInvariants 3 and LieHighestWeight 2 (the pull request changes 54 files, 9 of them in ReductiveGroups), with none elsewhere. So this is not a finding.
- `gate --depcheck … --movable`: `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line for ReductiveGroups.
- `lake env lean Suggested.lean` from the worktree: exit 0 in 9 s (the module's dependencies were already built). The only warnings are `declaration uses sorry` at lines 124, 143, 160, 177, 199, 247 and 253. `lake-manifest.json` and `lean-toolchain` are unchanged.
- **One-tactic probe.** On a scratch copy I replaced each of the seven `sorry`s with `first | rfl | (simp; done) | infer_instance | trivial | decide | (simp_all; done) | sorry`. All seven still report `declaration uses sorry` (the only other output is the unused-tactic linter on each alternative); none closes, so there is no padding.
- **Signatures.** The worker's file lists 15 entries with 0 lost binders. One entry, `on` at line 98, is a parsing artifact of the docstring phrase "structure on", not a declaration. The other 14 are the declarations the previous rounds compared with `README.md:1708–1714`, `:1930–1934`, `:1959–1966`, `:2166–2171`, `:3996–4001`, `:4050` and `:4290–4292`; their elaborated types are unchanged.

**Seeded sample** (the folder is unchanged; I re-opened the cited source lines):
- §1.1 (`README.md:847`): `jantzen-1985` line 1100 (§2.8, the comodule map), line 1507 (§3.3, induction) and line 1690 (§3.9, injectives under induction from a flat subgroup scheme), as cited at `:855`, `:873` and `:883`.
- §8.1 (`:2600`): `conrad-rgs` Definition 5.1.1 at line 5651 (split over a non-empty scheme, cited at `:2613`) and Theorem 5.1.13 at line 6011 (`:3248`).
- §8.2 (`:2632`): Definition 6.1.1 at line 7725 and Remark 6.1.2 at line 7738 (`:2636`); Theorem 6.1.16 at line 8159 and Theorem 6.1.17 at line 8173 (`:3278`).

**Adversarial table.** No statement changed, so every row is carried forward from the previous report (PRREVIEW-ReductiveGroups~62, carried from ~58 and ~54). Its values hold for the byte-identical file.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `IsMaximalTorus.exists_conjugate_eq` | `GL₂/k̄`, `T` and `uTu⁻¹` | conjugate by `u`; both minimal among torus-quotient ideals (~58) | Pass |
| same, nonreduced | `μ_p × 𝔾_m`, char `p` | torus quotient reduced, ideal contains `(t−1)`; unique maximal torus, `g = 1` (~58) | Pass |
| same, disconnected / trivial | constant `S₃`; `H = k` | augmentation ideal, conjugates equal it; `H = k`: only Hopf ideal `0` (~58) | Pass |
| same, wrong field | `SL₂/ℝ`: diagonal vs `SO₂` | unbounded vs compact real points, not conjugate; excluded by `[IsAlgClosed k]` (~58) | Pass |
| `IsParabolic.exists_levi_complement` | `P = G`; `GL₂`, `P = B` | `U = 1`, `J = 0`; `J = (b)` iso, `J = (a−1)` not injective, `J = 0` not surjective (~58) | Pass |
| same, hypotheses | `SL₂(W₂)` Greenberg, char `p` | smooth connected, no Levi; `hred` fails, `R_u = 𝔤^[1]` (~58) | Pass |
| same, nonsplit | quasi-split `SU₃`; anisotropic `G` | Levi = non-split maximal torus; only `P = G`, `J = 0` (~58) | Pass |
| `exists_levi_complement` (6A) | `𝔾_a`; `SL₂`; `𝔾_a ⋊ 𝔾_m` | `J` = augmentation; `J = 0`; `J = (x)` (~58) | Pass |
| `lang_surjective` | `𝔾_a/𝔽₂`; `𝔾_m/𝔽_q`; `μ₂`, `q` odd; constant `C₂` | `θ² − θ = 1`; `g^(q−1)` onto; `(±1)^(q−1) = 1` misses `−1`, `C₂` fails, both excluded by `hconn` (~58) | Pass |
| `exists_coordinatePresentation` | `n = 0, 1, 2` | `det ∅ = 1`; `x − 1`; over `ℤ/4` the inverse of `[[1,1],[0,1]]` has entry `3` (~58) | Pass |
| `nonempty_plane_braid` | `n = 0, 1, 2` | `π₁ = 1 = B₀`; `1`; `ℂ × ℂ^×`, `π₁ = ℤ = B₂` (~58) | Pass |
| `permutation_nonsplit` | `n = 2`; `n = 0, 1` | section needs `2m = 0`, `m` odd; trivial `S_n` excluded by `2 ≤ n` (~58) | Pass |
| `permute` direction | `n = 3`, `σ = (012)` | `(0,1,2) ↦ (2,0,1)`; wrong convention gives `(1,2,0)` (~58) | Pass |
| 3A.5 chart Check and natives | `D(t) → 𝔸¹`; origin `→ 𝔸¹` | `ℂ^× ⊂ ℂ` open; `{0}` closed, not open (~58) | Pass |
| `V₄ ⊂ PGL₂` | char 3 vs char 2 | `diag(1,−1)`, `[[0,1],[1,0]]` generate `V₄`; char-2 involutions unipotent (~58) | Pass |
| 7b, 9A.1b, 9B.1, 9C, 10C, 11 Checks | as in ~58 | `P ∩ Q` dim 2 vs 1; `12 + 2`, `48 + 4`; `#SL₂(ℤ/4) = 48`; `E^(1)E^(1) = 2E^(2)`; discriminant `4t²` (~58) | Pass |

**Cross-roadmap and overlaps**:
- `roadmaps resolve` lists 12 Lean-name leads. All are declared in `Suggested.lean` (`Suggested.lean:109–258`), and no cross-roadmap citation is unresolved.
- The overlap report lists no cited id dropped by an open pull request, no id defined only by an open revision, and no dropped id that others cite. Its five conflicting heads are R01: #1807 and #1854 are main plus the same three-line Layer 9E edit; #1332, #1676 and #1808 are full rewrites (as read with `roadmaps show --pr` in the previous rounds; the overlap list at this head is the same five).
- The closest roadmaps in vocabulary are GroupSchemesOverABase, AdelicAlgebraicGroups, ClassicalGroupsPartII, SchubertGeometry and RootSystemsPartII. Earlier rounds settled them, and this folder has not changed since.

## Not verifiable

- Waterhouse, Borel and Springer are settled as uncertified and cited by locator only.
- The manifest key `milne-iag` records Milne's v2.00 notes. The README's numbering is that of the 2017 author copy, which earlier rounds read from RootSystems' cache.
- Howlett–Lehrer, Dipper–Du, Carter §1.17, Lang 1956, Steinberg 1968, Serre §§2.3, 3.3 and Gassmann are references for Layers 7a–7f without locators into their texts, and none is in the cache.
- Ownership against open pull requests was checked through the overlap report and earlier rounds' `roadmaps grep` runs, not against board packages that are not open pull requests.

## Source issues

- none
