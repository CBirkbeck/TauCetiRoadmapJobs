# Review of ReductiveGroups (pull request #1797 at f925965)

**Verdict:** needs changes

This is an incremental re-review: 0 lines of `TauCetiRoadmap/ReductiveGroups/` changed since `a285fd7`, the head the previous review read. The two commits since then, `72178a20` and `f9259654`, touch only `TauCetiRoadmap/AlgebraicTopology/`, `TauCetiRoadmap/IntegralLattices/Suggested.lean` and `TauCetiRoadmap/QuadraticFormInvariants/`, all folders of this pull request. The one previous finding is about the pull-request description, which still has not been changed, so it stands. Everything inside the folder passes as before.

Paths: `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ReductiveGroups/…`.

## R01 (P3) — five conflicting open pull requests change this folder, and the description gives no merge order

Location: the pull-request description. Its ReductiveGroups paragraph says seven side files were "folded into Suggested.lean section IntegralRational … SignedADE … Spectral (63 statements)", that 18 Tau Ceti imports were added, and "No statement changes".

Claim: the order between the conflicting heads is settled, and the description describes this folder.

Witness: the overlap report lists conflicts with #1332, #1676 and #1808 (`README.md` and `Suggested.lean`) and with #1807 and #1854 (`README.md`). The description names none of them. `Suggested.lean:107–260` has no `section` at all. It has three namespaces, seven sorried headlines and ten `TauCeti.*` imports.

Repair: this is a change to the pull-request text; no file in the folder needs to change.
1. State the merge order. #1807 and #1854 change only main's Layer 9E lines 978–980, where they drop ReductiveGroupsPartII RG2.3.7 as a supplier. This head already makes that change (`README.md:28–30`, `:3655–3658`). If this pull request merges first, those two drop their ReductiveGroups hunk when they rebase. #1332, #1676 and #1808 rewrite the README differently: 3190, 3145 and 2480 changed lines against main, and 5296, 2009 and 1286 against this head. Say which of those merges first and that the others rebase on it.
2. Replace the ReductiveGroups paragraph with what the folder now is: the rewritten README with its supplier contracts, and the seven-headline `Suggested.lean` in the namespaces `StructureAcceptance`, `SpecialLinearAcceptance` and `PlaneBraidAcceptance`.

Re-raised: R01 of the previous review. No repair report says why it is not actionable, and the person who writes the description can make this change.

## Previous findings

- R01 — not repaired: the description at this head still says the seven side files became sections `IntegralRational` … `Spectral` and names none of #1332, #1676, #1807, #1808 or #1854; `Suggested.lean` has no section (see R01 above).

## Verified sound

**The changes outside the folder** (all in the pull request's own folders):
- `git diff --stat origin/main...HEAD` outside the six folders the brief names is empty. Since `a285fd7`, `git diff --stat` touches only `AlgebraicTopology/README.md` and `Suggested.lean`, `IntegralLattices/Suggested.lean`, and `QuadraticFormInvariants/README.md` and `Suggested.lean`.
- **AlgebraicTopology.** `README.md` cites it three times, by name only: `:4037` (based van Kampen in the plane-braid `*Needs:*`), `:4083` (based van Kampen and CW-cell interfaces) and `:4254` (Layer 11 Dependencies). At this head the AlgebraicTopology README still has "Stage 1: van Kampen through the fundamental groupoid" (`TauCetiRoadmap/AlgebraicTopology/README.md:567`) and "Stage 4: CW pairs, cellular homology, and cofibrations" (`:795`). Its completion item at `:31` still promises based van Kampen without connectedness assumptions on intersections.
- **IntegralLattices.** `README.md:2724–2727` and `:3519` cite IntegralLattices only for the native `IntegralLattice.integralForm`, `ofIntegralForm`, `carrierIsometry` and `rationalizationIsometry`. The IntegralLattices commit rewrites one Layer 3G Hilbert-reciprocity `example` and none of these. I opened them at the Tau Ceti pin: `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:167` (`integralForm`), `Rationalization.lean:37,45` (`rationalizationIsometry`, `ofIntegralForm.carrierIsometry`) and `Algebra/Module/ZLattice/RationalModel.lean:122` (`ofIntegralForm`).
- **No cycle.** `grep ReductiveGroups` over the AlgebraicTopology, IntegralLattices and QuadraticFormInvariants READMEs and Suggested files at this head finds nothing, so none of them consumes this roadmap.

**Gate, dependency check, build**:
- The worker's gate at this head reports every check at zero and `OK`. Run here with `--build`, it reports `build=0` and zeros everywhere except `outside-folder=45`. All 45 hits are files of this pull request's own folders: AlgebraicTopology 9, GeometricTopology 30, IntegralLattices 1, QuadraticFormInvariants 3 and LieHighestWeight 2, against 9 in ReductiveGroups and 54 in total, with none elsewhere. So this is not a finding.
- `gate --depcheck … --movable`: `depcheck: 237 roadmaps, 2345 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- `lake env lean Suggested.lean`: exit 0 in 110 s. The only warnings are `declaration uses sorry` at lines 124, 143, 160, 177, 199, 247 and 253. The file is byte-identical to `a285fd7` (sha256 `2a8cf651…`), and `lake-manifest.json` and `lean-toolchain` are unchanged.
- **One-tactic probe.** On a scratch copy I replaced each of the seven `sorry`s with `first | rfl | (simp; done) | infer_instance | trivial | decide | (simp_all; done) | sorry`. All seven still report `declaration uses sorry`; none closes, so there is no padding.
- **Signatures.** The worker's file lists 15 entries with 0 lost binders. One entry, `on` at line 98, is a parsing artifact of the docstring phrase "structure on", not a declaration. The other 14 are the declarations the previous rounds compared with `README.md:1708–1714`, `:1930–1934`, `:1959–1966`, `:2166–2171`, `:3996–4001`, `:4050` and `:4290–4292`.

**Seeded sample** (the folder is unchanged; I re-opened the cited source lines):
- §1.1 (`README.md:847`): `jantzen-1985` line 1100 (§2.8, the comodule map), line 1507 (§3.3, induction) and line 1690 (§3.9, injectives under induction from a flat subgroup scheme), as cited at `:855`, `:873` and `:883`.
- §8.1 (`:2600`): `conrad-rgs` Definition 5.1.1 at line 5651 (split over a non-empty scheme, cited at `:2613`) and Theorem 5.1.13 at line 6011 (`:3248`).
- §8.2 (`:2632`): Definition 6.1.1 at line 7725 and Remark 6.1.2 at line 7738 (`:2636`); Theorem 6.1.16 at line 8159 and Theorem 6.1.17 at line 8173 (`:3278`).

**Adversarial table.** No statement changed, so every row is carried forward from the previous report (PRREVIEW-ReductiveGroups~58, itself carried from ~54). Its values hold for the byte-identical file.

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
- The overlap report lists no cited id dropped by an open pull request, no id defined only by an open revision, and no dropped id that others cite. Its five conflicting heads are R01. I fetched each with `roadmaps show --pr`: #1807 and #1854 are main plus the same three-line Layer 9E edit; #1332, #1676 and #1808 are full rewrites.
- The closest roadmaps in vocabulary are GroupSchemesOverABase, AdelicAlgebraicGroups, ClassicalGroupsPartII, SchubertGeometry and RootSystemsPartII. Earlier rounds settled them, and this folder has not changed since.

## Not verifiable

- Waterhouse, Borel and Springer are settled as uncertified and cited by locator only.
- The manifest key `milne-iag` records Milne's v2.00 notes. The README's numbering is that of the 2017 author copy, which earlier rounds read from RootSystems' cache.
- Howlett–Lehrer, Dipper–Du, Carter §1.17, Lang 1956, Steinberg 1968, Serre §§2.3, 3.3 and Gassmann are references for Layers 7a–7f without locators into their texts, and none is in the cache.
- Ownership against open pull requests was checked through the overlap report and earlier rounds' `roadmaps grep` runs, not against board packages that are not open pull requests.

## Source issues

- none
