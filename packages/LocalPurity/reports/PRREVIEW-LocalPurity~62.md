# Review of LocalPurity (pull request #1807 at ed37e7d)

**Verdict:** accepted

No findings.

## Previous findings

- none: the previous report (r61, at `2faed4d`) had no findings.

## Verified sound

The folder is byte-identical to `2faed4d`. The supplier has changed: main moved from `7a5597a` to `33620f6`, and in between #1656 revised SchemeAndStackFoundations' README (+1531/−430). The rows below re-check the supplier contract (README lines 274–292) and the steps of §1.3 and §2.1 that consume it.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §1.3 *formalSections_of_localCohomology* uses SchemeAndStackFoundations §2.6 `serre_affineness_criterion` (main line 4404) | `Spec A` against `𝔸²_k ∖ 0` | `Spec A`: `H^q(M~) = 0` for every `q > 0`. `𝔸²∖0`: `H¹(𝒪) = ⊕_{a,b≤−1} k·xᵃyᵇ ≠ 0`, so it is not affine | §1.3 uses only the affine-implies-vanishing direction, and main still states it | none |
| §1.3 *restrictHypersurface_fullyFaithful* uses §2.7 `depth_localCohomology_vanishing` (main 4465, `(q:ℕ∞) < depth_I M`) | `k[x,y,z]_(x,y,z)`; `k[x,y]_(x,y)`; `M = 0` | Depth 3: `H⁰ = H¹ = H² = 0` and `x⁻¹y⁻¹z⁻¹ ∈ H³_𝔪 ≠ 0`. Depth 2: `H²_𝔪 ∋ x⁻¹y⁻¹ ≠ 0`. `M = 0`: depth is `⊤` and every group vanishes | `depth ≥ 3` is needed and is enough for `H¹ = H² = 0` | none |
| §1.3 uses §2.7 *localCohomology_flat_baseChange* and `localCohomology_module_comparison` (main 4459, 4450; both require Noetherian rings) | `A = k[x,y]_(x,y) → Â = k⟦x,y⟧` | Both rings are Noetherian and `Â` is flat over `A`. `H²_𝔪(A)` is `𝔪`-torsion, so `Â ⊗ H²_𝔪(A) = H²_{𝔪Â}(Â)`, spanned by the `x⁻ᵃy⁻ᵇ` with `a, b ≥ 1` on both sides | The hypotheses of main's statement are met where §1.3 applies it | none |
| §2.1 `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` | `A = ℚ[x,y]_(x,y)` with `B = A[t]/(t²−2)`, `A[t]/(t²−x)` and `A × A/𝔪` | `t²−2`: disc `8`, a unit, so `B` is étale and the hypotheses hold. `t²−x`: disc `4x`, so `hpunct` fails at `(t)` over `(x) ≠ 𝔪`, and `B` is not étale. `A × A/𝔪`: `x·(0,1) = 0`, so it is not torsion free | true; torsion freeness excludes the counterexample of Convention 5 | none |

The rows of r61 and r60 for the untouched statements (§0.14 contract, §§1.1–1.4, §2.1, §2.2, `depth_eq_ringKrullDim`) stand as in the previous review, of `2faed4d`.

- **Diff and pins.** `git diff 2faed4d HEAD -- TauCetiRoadmap/LocalPurity` is empty. `lake-manifest.json` and `lean-toolchain` have no diff, and Tau Ceti is at `2fd255d`. The 8 files changed since `2faed4d` lie in 7 sibling folders that this README does not cite.
- **Supplier on main `33620f6`.** All 10 contract names resolve in the sections they are cited from:
  - §0.9 (heading at line 1262): name at 1273;
  - §0.14 (1562): names at 1564 and 1586;
  - §2.6 (4357): name at 4404;
  - §2.7 (4433): names at 4441, 4450, 4459 and 4465;
  - §4.8 (6658): names at 6667 and 6670.

  `git diff 7a5597a 33620f6` changes no sentence that defines these names; it only adds uses of them.
- **Gate.** The worker's gate passes, build included. My bare rerun is 0 on every check except `outside-folder=24`, which is the 12 sibling folders the brief names, 2 files each. Depcheck: `depcheck: 206 roadmaps, 1898 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.**
  - `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` exits 0, with only the 4 `sorry` warnings, at lines 34, 45, 58 and 69.
  - `#check @` of the 4 declarations matches `signatures.md` exactly.
  - One-tactic probe (`first | rfl | infer_instance | simp_all | exact?`): none of the 4 closes (errors at lines 36, 51, 61, 74).
- **Library at the pin.** These three resolve:
  - `TauCeti.IsLocalRing.PurityHolds` (`AlgebraicGeometry/FiniteEtale/PuncturedSpectrum.lean:63`);
  - `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` (`RingTheory/RegularLocalRing/CohenMacaulay.lean:110`);
  - `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` (`RingTheory/RegularLocalRing/Purity.lean:75`).

  The two names that `citations.md` reports as found nowhere are this roadmap's own declarations, at `Suggested.lean` lines 34 and 45.
- **Sources (8 locators re-read).**
  - stacks-pione: line 2391 (0BM9, p. 51), line 2459 (0BLM, p. 53), line 2503 (0BMA, p. 53), line 2604 (0EY7);
  - stacks-more-algebra: lines 11453, 11528 and 11624 (05EL, 05ER, 05EU);
  - stacks-algebraization: line 1923 (0EII) and line 2094 (0EKP).

  They agree with §§1.2–2.2. The README flags no locator as unverified.
- **Overlaps and pull-request text.**
  - No cited id is dropped by an open pull request, and #1808 and #1854 are ordered after this one.
  - The LocalPurity paragraph, the "Targets retired" bullet and the summary block hold at this head:
    - at this head, LocalPurity names PurityOfBranchLocus only under Downstream consumers (line 863);
    - on main, LocalPurity cites PurityOfBranchLocus §0.3 (main lines 33, 287);
    - at this head, PurityOfBranchLocus cites LocalPurity §2.1 (its lines 33, 266).
- **Remarks (no change asked here).**
  - PurityForFlatCohomology (#1840) still cites §2.1 by main's name `purityHolds_of_isRegularLocalRing` (lines 105, 599).
  - SchemeAndStackFoundations §0.9 on main still says the properties are "inherited from a finite stage" (line 1277).

## Not verifiable

- The description's count of "six loops on main". No tool available here lists main's cycles, and the claim is not specific to this folder.

## Source issues

- **Error** in stacks-pione at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says a finite `A → B` with `B` normal that is finite étale over the punctured spectrum is étale; it should add that `B` is torsion free over `A`, since `A × A/𝔪` is normal and étale over `U` but not flat; affects a stated result.
- **Error** in stacks-pione at Lemma 58.20.3 (0BM9), p. 51: the source says `V ↦ Γ(V, 𝒪_V)` is an equivalence onto all finite normal `A`-algebras étale over `U`; it should restrict the target to torsion-free algebras, since `A × A/𝔪` is no `Γ(V, 𝒪_V)`; affects a stated result.
