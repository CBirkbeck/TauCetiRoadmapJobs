# GATE-CongruenceSpectralGap~3: reply to the human review of head ab7257da

The review was of `ab7257da`. Both findings had already been repaired in commit `4143db4`, the current head. This round re-checked those repairs against the review's mathematics and the cited roadmaps, and found nothing more to edit, so there is no new commit.

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/CongruenceSpectralGap/README.md` §0.5a (line 259) now separates the two rules: on points, `[x,a]↦[x,ak]` multiplies the component index by d=det(k) mod N; on functions, R(k) carries the summand of component a onto that of component ad⁻¹, with `R(k)P_a=P_(ad⁻¹)R(k)`, equivalently `P_aR(k)=R(k)P_(ad)`. The API bullet (line 267) changed from "permutes the summands by det(k)" to "carries the summand of component a onto that of component a·det(k)⁻¹", and the review's N=5 example with k=diag(2,1) at 5 is added as a Check (line 273): R(1_{c=1}) is supported on c=3=1·2⁻¹, not on c=2.

## H02 (CBirkbeck) — applied differently

The curve Euler–Poincaré formula with Swan conductors now has a single owner, but that owner is §4.2b of this roadmap rather than InverseGaloisAndArithmeticFundamentalGroups. Scope and ownership (line 19) states this. Under Downstream consumers (line 890), EtaleDualityAndPerverseSheaves §5.2 is named as consuming the algebraically closed case, while its finite-cover transport and Leray conductor estimates stay its own. The review allows any agreed common owner provided the order is acyclic, and this choice is acyclic: InverseGaloisAndArithmeticFundamentalGroups is at position 49 in the merge order, CongruenceSpectralGap at 100 and EtaleDualityAndPerverseSheaves at 116.

InverseGaloisAndArithmeticFundamentalGroups is still an open roadmap pull request outside this roadmap's folder, so it cannot be given the new extension target from here. Its "Euler characteristic of ℓ-torsion local systems on affine curves" covers only affine curves over an algebraically closed field of characteristic p>0 with 𝔽_ℓ coefficients, which is what the review itself observed.

So §4.2b (line 664) now spells out the extension in four steps, each part of the target:
1. Reduce 𝔽_λ to 𝔽_ℓ, then pass to Eλ through stable lattices and reduction mod λ. Swan conductors survive reduction because wild inertia acts through a finite p-group with p≠ℓ.
2. Get the proper case by removing one closed point and using excision.
3. Get characteristic zero from the Brauer character: Riemann–Hurwitz (SchemeAndStackFoundations §3.2 `scheme_riemann_hurwitz`) at the identity, and §IG.0.T1 `VanishingCycles.curveEndomorphismTrace` at the other ℓ-regular elements.
4. Regroup the residue degrees by Galois orbits.

All of these citations resolve: §IG.0.T1 is at the #850 head, line 466, and `scheme_riemann_hurwitz` is in SchemeAndStackFoundations §3.2 on main. EtaleDualityAndPerverseSheaves still constructs `curveEulerPoincareSwan` at its head (its README line 4916). Switching it to import §4.2b has to be done in that roadmap, which this job cannot edit.

## Adversarial pass on the statements changed in 4143db4

| statement | instances tried | computed values | result | change |
|---|---|---|---|---|
| Summand rule `R(k)P_a=P_(ad⁻¹)R(k)` | N=5, k=diag(2,1) at 5, f=1 on c=1 | (R(k)f)(g)=1 ⇔ 2c(g)≡1 ⇔ c(g)=3; 1·2⁻¹=3 ✓; point rule gives 2 ✗ | holds | none |
| Same | N=3, k=diag(1,−1) | d=2=d⁻¹; (u,0)↦(0,u) under both rules | consistent; does not separate the rules (as the Check says) | none |
| Same | N=1 | (ℤ/1)ˣ trivial, d=1, summand fixed | holds | none |
| Equivalence of the two projection identities | substitute a→ad in the first | R(k)P_(ad)=P_(a)R(k) | identical | none |
| Step 1: 𝔽_λ→𝔽_ℓ | f=[𝔽_λ:𝔽_ℓ]=2, rank n, Swan s | 𝔽_ℓ-rank 2n, Swan 2s, χ multiplied by 2 on both sides of the formula | holds | none |
| Step 2: proper case | U=C=P¹, remove x of degree 1 | χ_c(𝔸¹)=1·rank, +1·rank gives 2·rank=rank(2−0−0) | holds | none |
| Same | U=P¹ over 𝔽₃, remove a degree-2 point | χ_c(P¹∖x)=rank(2−2)=0 geometrically, +2·rank gives 2·rank | holds | none |
| Step 3: characteristic 0 | V→U free Q-action, σ≠1 | Tr(σ\|RΓ_c(V)) = #Fix_D(σ) − #(boundary fixed points) = 0 (fixed points transverse, since dσ is a nontrivial root of unity); at 1: χ_c(V)=\|Q\|χ_c(U) | class = χ_c(U)·free module | none |
| Same | Gₘ, constant sheaf, char 0 | χ_c=0, Swan sum 0 | matches the existing Check | none |

## Other occurrences of the defects

- A search of the README and `Suggested.lean` for `permut`, `det(k)`, Euler–Poincaré and the new citations found no other use of the point rule on summands.
- The intermediate-level descent (line 351) uses only the det≡1 stabilizer, so the corrected permutation does not affect it.
- The docstring of `Suggested.lean` already lists the curve Euler–Poincaré formula as not statable, because the rational-adic carriers are absent.

## Lean signatures

`Suggested.lean` is unchanged from `4143db4`. I compared the four elaborated types in the supplied signature dump against their README statements; no binders were lost and nothing changed. I did not elaborate a new `#check` scratch file because the Lean file did not change.

## Ownership and citations

Ownership was checked against the open roadmap pull requests with `roadmaps grep`, for `curveEulerPoincareSwan`, `curveEndomorphismTrace` and `scheme_riemann_hurwitz`. The six "found nowhere" leads in the citations list are cross-roadmap declaration names, not pinned-library names, and resolve as follows:
- `VanishingCycles.curveEndomorphismTrace` is at InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1.
- The `AnalyticLFunctionData` names belong to TauCetiRoadmap.LFunctions Layer 0, which this README cites as their supplier.

No source text was needed this round.

## Build and gate

- `lake build TauCetiRoadmap.CongruenceSpectralGap.Suggested`: Build completed successfully (8976 jobs). The only warnings are `declaration uses 'sorry'`, at lines 51, 62 and 78.
- Gate: `gate CongruenceSpectralGap: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- There is no new commit, because nothing changed.
