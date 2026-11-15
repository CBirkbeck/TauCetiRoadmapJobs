# GATE-AdicCoefficientsAndComparisonsPartII~2: answers to human review

Head at start: `0ed113b`. One comment, one point. No file was changed and nothing was committed.

## H01 (mycaule) — disputed

There is no overlap with this Part II. The AxiomMath/Weil file `Weil/Algebra/Module/LAdicRankOfInverseSystem.lean` (at commit 27cdb20) is about inverse systems of ℓ-power-torsion groups and their rational limits `ℚ_ℓ ⊗ limₘ Aₘ`; its main result says that, under Bockstein-type exact sequences, the ℚ_ℓ-dimension of that limit equals the ℤ-rank of a finitely generated group. None of these objects occurs in `TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md` or `Suggested.lean`. A search for inverse/projective systems, ℓ-adic modules and their ranks finds nothing. The only ℓ-adic content is the remark that a degree prime to ℓ is invertible on ℓ-primary coefficients, so that restriction is injective when restriction followed by trace is multiplication by the degree (README line 5 and §PA.6.9, line 1624). Where the README says "rank", it means the rank of a valuation (lines 3, 33, 535), the rank of a monoid or of a group of exponents (lines 35, 994, 1062) or the rank of a free module (lines 1194, 1675).

This roadmap's subject is alterations whose generic degrees have prescribed prime support (Temkin, Gabber). It builds no coefficient systems and no v-sheaves; the title's "adic coefficients … v-sheaves" names the base roadmap AdicCoefficientsAndComparisons. The closest object in that base roadmap is Layer L0 `L0/adic-coefficient-limit`, which reconstructs `D_ét(Y, Λ)` as the derived limit of the categories `D_ét(Y, Λ/Iⁿ)`. That works with categories of coefficients, not with ranks of modules. So even there it is not the Weil file's statement, and a citation of the external work belongs in this Part II only if it develops the same mathematics (CONTRIBUTING, "Porting existing work"), which it does not.

## Adversarial pass

No statement was added or changed. The table checks the one statement the answer relies on.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| README line 5: a degree d prime to ℓ is invertible on ℓ-primary coefficients; if restriction followed by trace is multiplication by d, restriction is injective | d = 3, ℓ = 2 on ℤ/4; d = 1; d = ℓ = 2 for Spec ℂ → Spec ℝ with ℤ/2 coefficients; ℤ_ℓ and ℚ_ℓ coefficients | 3·3 = 9 ≡ 1 mod 4, so 3 is a unit on ℤ/4; d = 1 is the identity; for d = 2: `H¹(ℝ, ℤ/2) = ℤ/2 → H¹(ℂ, ℤ/2) = 0` is not injective, because the trace composite is multiplication by 2, which is 0 on ℤ/2; a d prime to ℓ is a unit of ℤ_ℓ, and every nonzero d is a unit of ℚ_ℓ | holds as stated; "prime to ℓ" is needed (the d = 2 case fails without it) | none |

Suggested.lean was not changed, so the elaborated signatures recorded for the 6 declarations at `0ed113b` still hold and no new `#check` was needed.

## Build

`lake build TauCetiRoadmap.AdicCoefficientsAndComparisonsPartII.Suggested`: "Build completed successfully (8954 jobs)". The only warnings are `declaration uses 'sorry'` at Suggested.lean 127:8 (`analytic_uniformization`) and 137:8 (`analytic_uniformization_residue`).

## Gate

`gate AdicCoefficientsAndComparisonsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency direction (`gate --depcheck … --movable --pr 1796`): `depcheck: 239 roadmaps, 2256 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

## Notes

- The comment is an observation about another repository. It contains no instructions, and nothing in it was suspicious.
- Ownership against open pull requests: the answer adds no object, so no new ownership question arises. The base roadmap was read at the head of its open pull request (AdicCoefficientsAndComparisons, `c8f8961`).
- No source was fetched and no `needs-references.toml` was written. The external Lean file was read only to identify what it states.
