# GATE-GrossZagierAndArithmeticHeights~10: answers to the review of `bbb4297`

Commit `ed7ee121` on top of `bbb4297`; README only, `Suggested.lean` unchanged.

## H01 (rwst) — disputed

LubinTateFormalModulesAndQuasiCanonicalLifts LT.3 and LT.6 stay as a supplier in the README (supplier row :125, §7.2 *Needs* :2983, §7.46a item 4). LubinTateFormalModulesAndQuasiCanonicalLifts is a separate roadmap with a finished design whose scope includes LT.3 (marked and universal finite-height deformations) and LT.6 (canonical and quasi-canonical lifts, their endomorphism rings and smallest marked fields). It sits at line 294 of the merge order, above this roadmap at line 341, and `gate --depcheck` reports 0 problems. The second repair (making LT.3 and LT.6 targets of §7.2) would plan that roadmap's content a second time, which the single-owner rule forbids. The first repair is the right one, but it is a PR-level action and not a README edit: LubinTateFormalModulesAndQuasiCanonicalLifts has to be opened as its own pull request and named in this pull request's dependency paragraph and `merge-order` block before this one merges. The finding is correct that no such pull request exists yet and that nothing in the repository enforces the order today.

## H02 (rwst) — applied differently

§7.46a *Outline* (:3654): the old clause "the same deformation argument applies with ST-2" is replaced by a three-step transport. (1) AbelianSchemesAndArithmeticModuli A4.9, the Serre–Tate equivalence for abelian schemes with prescribed endomorphisms and polarizations (Katz Thm 1.2.1), identifies deformations of (A₀, O_𝔅-action) with deformations of A₀[p^∞] with its M₂(ℤ_p)-action. (2) The idempotent e (Morita) reduces these to deformations of e·A₀[p^∞] ≅ E₀[p^∞]. The polarization adds no condition: the positive involution is b ↦ s bᵀ s⁻¹ with s symmetric, so a compatible alternating self-duality of e·A[p^∞] ⊗ ℤ_p² is a ℤ_p^×-multiple of the Weil pairing of the elliptic deformation that ST-1 attaches. (3) A [Γ(pⁿ)]-structure is a full set of sections of the pⁿ-torsion group, so it depends on that finite flat group alone; through e and ST-1 it becomes a level structure on the elliptic deformation, where ST-2 and ST-4 apply.

PELModuli M2.9 is not used because it does not contain these steps. M2.9 is only the universal family at neat level. PELModuli's deformation theory (M2.6) is stated at good primes with étale level prime to `□`, and it takes its Serre–Tate step from A4.9 anyway. The A4.9 citation was added to the §7.46a *Needs*, the AbelianSchemesAndArithmeticModuli supplier row (:102, which now links 7.46a) and the Layer 7 *Dependencies*. A new Check (:3663) at 𝔅 of discriminant 6, p = 5 shows the dimension count: 4 for unrestricted deformations of A₀[5^∞], 3 with polarization, and 1 = dim W(k)⟦T⟧ for e·A₀[5^∞]. Applying ST-2 without the idempotent would therefore give the wrong chart.

## H03 (rwst) — answered

The pull-request body is not in this roadmap's files, so the worker that submits the branch has to correct it. Against the README, the body should: drop #1406 as a direct supplier (README line 9 denies it); add ArithmeticGaloisRepresentations as a direct supplier (it is cited in the README); and add LubinTateFormalModulesAndQuasiCanonicalLifts to the dependency paragraph and the `merge-order` block (see H01).

## H04 (rwst) — answered

No change is needed. The repair for the previous round's M01 is commit `bbb4297`: §9.11 has one root, summed over all of Cl(O_K), and §9.15 sets u = t_K·(transport unit). The review confirms this under M01.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Morita reduction of O_𝔅-deformations to e·A[p^∞] | 𝔅 disc 6, p = 5 (split): O_𝔅⊗ℤ₅ = M₂(ℤ₅), e = E₁₁ | A[5^∞]: height 4, dim 2; e·A[5^∞]: height 2, dim 1; deformation dimensions d(h−d): 2·2 = 4 versus 1·1 = 1; polarized abelian surface g(g+1)/2 = 3 | holds; the old wording (ST-2 on the whole group) gives 4 ≠ 1 | Outline rewritten, Check added |
| Polarization adds no condition | involution b′ = t⁻¹ b̄ t with b̄ = J bᵀ J⁻¹, J antisymmetric, t̄ = −t | s = t⁻¹J satisfies sᵀ = −J t⁻ᵀ = t⁻¹J = s (symmetric), so ψ(x⊗u, y⊗v) = φ(x,y)·uᵀs⁻¹v is alternating exactly when φ is; alternating perfect φ on a rank-2 Tate module = unit · Weil pairing | holds; with a symplectic-type involution (s antisymmetric) φ would have to be symmetric, which is excluded here | stated in the Outline |
| Level transport | [Γ(pⁿ)], n = 1, p = 5 | the level on e·A[5] is a homomorphism (ℤ/5)² → e·A[5], a full set of sections of a rank-25 finite flat group; A[5] = (e·A[5])² has rank 625 | holds | stated in the Outline |
| Supersingular at a split place (item 4(a), unchanged) | p = 5 split in 𝔅, A₀ supersingular | e·A₀[5^∞] is connected of height 2, so it is ≅ E₀[5^∞] over k̄ (Dieudonné, R07.2) | consistent with the new steps | none |

Context and generality: the false elliptic branch applies only at F = ℚ with 𝔅 ramified at a finite place and v a place where 𝔅 splits, which is the hypothesis of item 4. A4.9 is stated for p nilpotent on an Artin or complete local base, which covers the deformation rings used here.

## Citations and ownership

- AbelianSchemesAndArithmeticModuli A4.9 was resolved at the head of its pull request (README "A4.9 The Serre–Tate equivalence with structures"; merge order line 43, above this roadmap).
- ModularCurves Layer 7F ST-1, ST-2 and ST-4 were resolved on main.
- PELModuli M2.6 and M2.9 were read at the copy `roadmaps show PELModuli` serves.
- No new construction was added, so ownership is unchanged. The cited owners are AbelianSchemesAndArithmeticModuli and ModularCurves.
- No new source was added, so the manifest is unchanged.

## Lean

`Suggested.lean` was not changed and no declaration was affected, so the `#check @name` comparison was not rerun this round.

## Build and gate

- `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested`: `Build completed successfully (8981 jobs).` The one warning is the expected `declaration uses 'sorry'` at Suggested.lean:39.
- Gate after the commit: `gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 163 roadmaps, 1163 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
