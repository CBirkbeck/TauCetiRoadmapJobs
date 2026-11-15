# Review of DeformationAndDerivedPatchingAlgebra (pull request #1034 at 53608b1)

**Verdict:** accepted

No finding. Incremental re-review of the 40 lines changed since `fab28ea`.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/Suggested.lean:413` keeps `CochainComplex.linearHomComplex R P`, which the new Mathlib pin defines (`Mathlib/Algebra/Homology/HomotopyCategory/HomComplex.lean:980`); the file elaborates.
- R02 — repaired: the local-instance attribute is gone; `Der`, `H`, `derivedSupport` and the four derived-category theorems carry `[HasDerivedCategory.{v} (ModuleCat.{u} R)]` (for the CM action theorem, over `S`).
- R03 — repaired: `Suggested.lean:211` reads `Module.Finite O (integralClosure O E) ∧ ∃ f : B →ₐ[O] integralClosure O E, …`, with no `letI`; the instance is `IntermediateField.algebra'`.
- R04 — repaired: `Suggested.lean:302` declares `nonempty_localCI_parafactorial`; `README.md:1346` uses the new name and maps the former one, which PurityForFlatCohomology cites.
- R05 — repaired: `Suggested.lean:423` declares `nonempty_finiteActionCanonicalDuality_ext`; `README.md:1798` uses the same name. No other roadmap cites the former name.
- R06 — repaired: the description's Validation paragraph now reports a passing targeted build with 18 admitted theorems and a Mathlib module-system warning; the build at this head shows exactly that.
- R07 — repaired: the description says “This pull request adds the new `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra` roadmap … It revises no existing roadmap.”

## Verified sound

Here `O` is a complete DVR with uniformizer `π` and residue field `k`.

| Statement | Instances tried | Computed left side | Computed right side | Result / change |
|---|---|---|---|---|
| `Der`, `H`, `derivedSupport` (explicit choice) | Field stalk `k[0]` over `k` | `H⁰=k`, other degrees `0`; support `{(0)}` | Same for any `HasDerivedCategory` choice | Parameter changes no value |
| `codimension_amplitude_inequality` | `O →π O` in degrees `0,1`, `n=l=1`; `O[0]`, `l=0` | Support `{m}`, `dim O/m=0`; support all, `dim O/(0)=1` | `n−l=0`; `n−l=1` | `0≤0`, `1≤1`: both equalities |
| `balanced_dimension_concentration` | `O →π O`, `n=l=1,a=0`; control `O[0]` with `l=1` | `H⁰=0`, `H¹=k`, `pd k=1`, support dimension `0`; control support dimension `1` | Endpoint `a+l=1`, `pd=l=1`, `n−l=0`; control bound `0` | Agrees; control excluded by the support hypothesis (`1>0`) |
| `cohenMacaulay_action_concentration` | `S=O`, `R=N=k`, `P=[O →π O]`, `d=l=1` | `H¹=k`; both residue-Ext depths `0`; `dim R=0` | `d−l=0` in all three | Agrees; the `S`-side choice parameter is the one used |
| `patched_dual_concentration` | `P=[O →π O]` in degrees `0,1`; same shifted to `2,3` | Hom complex lives in degrees `−1,0` (resp. `−3,−2`); cohomology `k` in degree `0` (resp. `−2`) | `−a=0` (resp. `−2`); `Ext¹_O(k,O)=k` | Agrees with Mathlib's Hom complex |
| `exists_integral_point_of_not_nilpotent` | `O=B=ℤ₂`, `E=K=ℚ₂`; control `B=𝔽₂` | Integral closure `ℤ₂`, rank `1`, identity map local; control image of `2` is `0` | `O→E` through `algebra'` equals `O→K→E` by the scalar tower | Point exists; control fails the nonnilpotence hypothesis |
| `nonempty_localCI_parafactorial` | `A=𝔽₃[[x₁,…,x₄]]`, empty sequence; control `k[[x,y,z,w]]/(xy−zw)` | `Pic(U)=0` (dimension `4`, factorial); control `Pic(U)=ℤ`, dimension `3` | Trivial line bundle; control needs `4≤3` | Holds; control excluded by the dimension hypothesis |
| `nonempty_finiteActionCanonicalDuality_ext` | `S=O`, `Q=R=N=k`, `d=1,e=r=0`; `S=O[[x]]`, `Q=R=N=O`, `d=2,e=1`, `r=1` and `r=0` | `Ext¹_O(k,O)=k`; `Ext¹_S(O,S)=O`; `Ext²_S(O,S)=0` | `Hom_k(k,k)=k`; `Hom_O(O,O)=O`; `Ext¹_O(O,O)=0` | Both sides agree for every `r` tried |

The rows for untouched statements stand as in the previous review, of `fab28ea`.

- Gate: every check passes at `53608b1` (text scanners, statement-hygiene 0, outside-folder 0, build 0). Targeted build exits 0; direct elaboration gives 18 `sorry` warnings and nothing else.
- 32 `#check @name` signatures elaborate in a scratch copy with the binders the README states; the one-tactic probe (`rfl`, `infer_instance`, `simp`, `exact ⟨_, rfl⟩`, `trivial`) closes none of the 18 theorems.
- 14 pinned declarations opened at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, among them `CochainComplex.linearHomComplex` (`Mathlib/Algebra/Homology/HomotopyCategory/HomComplex.lean:980`), `IntermediateField.algebra'` (`Mathlib/FieldTheory/IntermediateField/Basic.lean:408`), `TauCeti.linearHomComplexEnrichedCategory` (`TauCeti/Algebra/Homology/LinearHomComplex/Enrichment.lean`), `TauCeti.fittingIdeal_baseChange` (`TauCeti/RingTheory/FittingIdeal/BaseChange.lean:151`); all 25 backticked `TauCeti.*` names of the README exist at the new pin.
- 4 cross-roadmap citations of the changed scope bullet resolved: DeformationAndDerivedPatchingAlgebraPartII K0.1, K0.4–K0.7 and K3.1 at its open head, whose scope also places Macaulayfication in neither roadmap; ArithmeticGaloisDuality §D7.1.
- Source locators: 0 of the seeded-sample targets fall in a changed passage, and the diff changes no locator; none was reopened.
- Pull request text read against this head: the summary block, the scope paragraph (Part II, Macaulayfication), the explicit derived-category choice, the two existence statements, the 32 signatures and the validation paragraph all agree with it. No file changes outside the folder.
- Remark: the previous review's scope remark on `README.md:21` (Macaulayfication assigned to Part II) no longer applies; the bullet now agrees with Part II.

Dependency-check output:

```text
depcheck: 245 roadmaps, 2214 edges, 0 problem(s)
```

Overlap check: read DeformationAndDerivedPatchingAlgebraPartII, PurityForFlatCohomology and ArithmeticGaloisDuality for the changed objects (the other closest roadmaps stand as read at `fab28ea`). Secant sequences, CM blowups and Rees modules belong to Part II; complete-local bounded-complex duality to ArithmeticGaloisDuality; the CI parafactorial theorem to this roadmap, which PurityForFlatCohomology cites.

Source independence: changed passages only — 6 changed passages (the scope bullet, two pin sentences, the convention clause, two target-name sentences) compared with 0 sources, since none of them restates a source; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Unchanged locators in Calegari–Geraghty (Lemma 6.1 and the correction) and Avramov's book chapter keep the certification limits of the earlier reviews; this round needed no further text.

## Source issues

- none

## For the human reviewers

- none
