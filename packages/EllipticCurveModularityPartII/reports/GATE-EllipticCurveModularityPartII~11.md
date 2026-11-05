# GATE-EllipticCurveModularityPartII~11: answers to human review

Review answered: CBirkbeck, 2026-11-03T08:38:24Z (AI review of `22c6c24`), findings F01–F03. New head `2a13bc72`.

## H01 (CBirkbeck) — applied differently

F01, README part: `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` lines 67 and 69 now open in the house declaration form. Old: "The additional supplier contract gap:kato-labelled-pushforward belongs to PadicFamilies §4.0.1. …" and "The separate supplier contract gap:kato-labelled-reciprocity belongs to PadicFamilies §4.0.2 …". New: "What PadicFamilies must provide (gap:kato-labelled-pushforward): in §4.0.1, …" and "What PadicFamilies must provide (gap:kato-labelled-reciprocity): in §4.0.2, …". Each opens with a needs sentence that keeps both label cases (a(A) with prime(mA)⊆S; ξ∈SL₂(ℤ) with prime(mN)⊆S), independence from the auxiliary level, the targets H¹(ℚ(μ_m),W_N(1)) and H¹(ℚ(μ_m),W_f(1)) over K_f,λ, and the period, Euler and smoothing factors of Kato Theorems 9.6–9.7. The auxiliary-level domains and the four Checks are unchanged.

The plan part is not actionable in this package: `packages/EllipticCurveModularityPartII/design/plan.json` is outside the files this job may edit. The worker must add two top-level `gaps` entries with supplier `PadicFamilies`: slug `kato-labelled-pushforward` with section `4.0.1`, and slug `kato-labelled-reciprocity` with section `4.0.2`. Each `needs` should be the sentence after the colon on README line 67 or 69. The gaps are minimal. PadicFamilies (open PR head `f3b762c`, merge order 155, before this roadmap at 181) states only the raw two-index classes in §4.0.1. Its §4.0.2 reciprocity requires every prime of M to divide N, and so does not cover the auxiliary pair (14,70), whose image is needed for the raw-inadmissible pair (2,5).

## H02 (CBirkbeck) — answered

F02 concerns only `design/plan.json`, which this job cannot edit. The README already has the ownership the finding asks the plan to follow. Line 114 imports the residual-conductor formula from NeronModelsAndSemistableAbelianVarieties §5.3h, not ArithmeticGaloisRepresentations. Line 154 makes cyclic-isogeny-degrees the local target §5.0b. The README declares no `gap:` other than the two Kato contracts (lines 67, 69). The design-stage slugs in parentheses (for example "(residual-conductor-away-from-ell)") label imports and targets; they are not gap declarations. This is not actionable in this package: the worker should cut the plan's 27 design-stage `gaps` down to the two Kato entries of H01. Every other slug is either a local target or an existing supplier section cited in the README. In particular, `residual-conductor-away-from-ell` (supplier ArithmeticGaloisRepresentations) and `cyclic-isogeny-degrees` (supplier EisensteinIdealAndRationalTorsion) should both be removed.

## H03 (CBirkbeck) — answered

The package manifest already registers all thirteen cited works. In the committed `packages/EllipticCurveModularityPartII/sources.toml`, Kenku1982 is the record at line 129 and is still `uncertified`. It is followed by Kato2004 (line 143, certified, open-repository; locator covering §§5.1–5.2, 6.3, 8.1–8.12 and Theorems 9.5–9.7, 12.5(1), 14.2(2)), GaudronRemond2011 (156), Chen1998 (174), DeSmitEdixhoven2000 (192, author-page) and Elkik1990 (205). That makes 13 `id` entries for 13 cited works, and no manifest is in the PR folder.

## Build

`lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested`: Build completed successfully (9233 jobs), with only `declaration uses sorry` warnings. `Suggested.lean` is unchanged by this round, so its 24 elaborated signatures are the ones in the job's signature list: compared with the README, no binder was lost and none changed. The module docstring (line 47) already names both contracts, so README and Lean agree.

## Gate

`gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (`--movable`):

```text
depcheck: 204 roadmaps, 1647 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

## Adversarial pass on the changed statements

| Statement | Instances tried | Computed values | Result / change |
|---|---|---|---|
| gap:kato-labelled-pushforward needs sentence (line 67), label a(A) | p=7,N=5,m=2,A=1,S={2,7},c=5,d=11 | gcd(55,6)=1, gcd(11,5)=1, prime(55)∩S=∅, prime(mA)={2}⊆S | Admissible; the sentence keeps the domain stated before the rewrite. |
| same, auxiliary independence | (M,L)=(14,70),(28,140) | L/M=5,5; prime(M)={2,7}=S; prime(L)={2,5,7}=S∪{5} | Both qualify. The needs sentence asks for independence of the pushed images, not of maps from different sources. |
| same, matrix label | ξ=1, S={2,7} vs {2,5,7} with c=13 | prime(mN)={2,5}⊄{2,7}; with S={2,5,7}: prime(143)∩S=∅ | The two-case label condition is kept verbatim. |
| same, degenerate inputs | m=0; S=∅; m=N=1, p=2, (M,L)=(4,4) | 0≥1 false; 7∉∅; M+L=8≥5, L=4≥4, gcd(35,6)=1 | m=0 and S=∅ are excluded; level 1 and p=2 are allowed. |
| gap:kato-labelled-reciprocity needs sentence (line 69) | k=2,r=r′=1; zero class | k−2=0, k−r=1, max(r,r′)=1=k−1; exp*(0)=0 ≠ a nonzero prescribed value | The hypotheses of Theorems 9.6–9.7 are met. A zero-map substitute is excluded by the Check kept at line 76. |
| Minimality versus PadicFamilies §4.0.2 | raw pair (2,5) | prime(2)={2}⊄prime(5)={5} | The supplier's raw reciprocity does not apply, so the gap asks for something not already provided. |
| W_f definition moved (line 67) | m=1,2,4 | [ℚ(μ_m):ℚ]=1,1,2 | The target stays H¹(ℚ(μ_m),W_f(1)); level m=4 is not collapsed to ℚ. |

Ownership against open pull requests: checked for PadicFamilies (the supplier of both gaps) with `roadmaps grep`. Its §§4.0.1–4.0.2 headings exist at its open head, and no other roadmap states the labelled pushforward. No suspicious instructions appeared in the review text.
