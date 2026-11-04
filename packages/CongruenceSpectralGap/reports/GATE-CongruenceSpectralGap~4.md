# GATE-CongruenceSpectralGap~4: reply to human review

## H01 (CBirkbeck) — answered

The ownership decision is already complete on this roadmap's side, and the review also says no change is needed here. `TauCetiRoadmap/CongruenceSpectralGap/README.md` line 19 makes §4.2b the single owner, §4.2b (line 664) states the residue-degree formula for finite Eλ with coefficient extension, the proper case and every characteristic, and line 890 records EtaleDualityAndPerverseSheaves §5.2 as the consumer of its algebraically closed case. The remaining work is all in EtaleDualityAndPerverseSheaves, which this job cannot edit. At its head `d1fab8f` that roadmap still claims the construction in its scope (line 14 of the `roadmaps show` output), still plans `curveEulerPoincareSwan` itself (lines 4921–4927), and does not cite CongruenceSpectralGap in its *Needs* (line 4981). That roadmap has to change to import §4.2b. It can keep its finite-cover transport and Leray-sheaf conductor bounds as its own targets.

The supply direction is downward. The merge order puts CongruenceSpectralGap on line 100 and EtaleDualityAndPerverseSheaves on line 116. None of §4.2b's suppliers comes from that roadmap: EtaleCohomologyFoundations F.0–F.6/F.4.0/F.10, ArithmeticGaloisRepresentations §§3.1/3.7, InverseGaloisAndArithmeticFundamentalGroups and SchemeAndStackFoundations §3.2.

Two details for the consumer. First, its statement uses `ℚ̄_ℓ` coefficients, and it gets them from §4.2b by descending to a finite Eλ and then applying the coefficient-extension compatibility that §4.2b includes. Second, if its "finite coefficient-field form" means torsion `𝔽_λ` coefficients rather than finite extensions of `ℚ_ℓ`: on affine curves over an algebraically closed field of positive characteristic that is the InverseGaloisAndArithmeticFundamentalGroups formula, which §4.2b's route uses as its first step, so it should be imported from there.

## Adversarial pass on the statement concerned (§4.2b, unchanged)

| statement | instance | computed | result | change |
|---|---|---|---|---|
| §4.2b formula, algebraically closed specialization | all `deg_k(x)=1` | `χ_c(U,L)=rank(L)(2−2g−#(C∖U))−ΣSw_x(L)`, which is the reviewer's displayed formula | agrees | none |
| §4.2b, constant rank r on Gₘ / P¹ | g=0, 2 or 0 boundary points | r(2−2)−0=0; r·2=2r | agrees with Check 1 | none |
| §4.2b, Lψ(xᵃ) on A¹, p∤a | Sw_∞=a | 1·(2−1)−a=1−a; a=1→0, a=2→−1 | agrees with Check 3 | none |
| §4.2b, Lψ(1/(x²+1)) over 𝔽₃ | one degree-2 boundary point, Sw=1 | (2−2)−2·1=−2; geometric: (2−2)−(1+1)=−2 | perfect-base and geometric forms agree | none |

## Build and gate

Nothing changed in this round, so there is no commit.

- `lake build TauCetiRoadmap.CongruenceSpectralGap.Suggested`: Build completed successfully (8976 jobs). The only warnings are `declaration uses sorry`, at lines 51, 62 and 78.
- Gate: `gate CongruenceSpectralGap: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
- Signatures: `Suggested.lean` is unchanged. The four elaborated types in the worker's signature list match their README statements, and none of them dropped a binder.
