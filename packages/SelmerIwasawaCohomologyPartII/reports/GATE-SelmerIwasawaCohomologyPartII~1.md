## H01 (CBirkbeck) — applied

The acceptance file replaces the special-inert predicate and finite-period API catalogue with an explicit list of the geometric, level-raising, regulator, reciprocity and Selmer-rank headlines in `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/Suggested.lean:6`; `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/README.md:5` identifies the same endpoints. This repair is already present in the supplied commit `8b21886`: neither removed definition makes any headline statable on the pinned native carriers.

## H02 (CBirkbeck) — applied

Each unavailable headline now has its missing carrier identified in `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/Suggested.lean:10`: native unitary models and cohomology, diagonal Chow classes and arithmetic regulators, realised Galois/Hecke modules, Bloch–Kato Selmer conditions, or Hilbert modular cohomology. The pinned continuous-cohomology and elementary Selmer APIs do not provide these objects, so the file correctly states no substitute theorem; the actual reciprocity and rank endpoints remain those of ltxzz lines 6037, 6044, 6568 and 6773 with the README's additional realised-span premises retained.

## H03 (CBirkbeck) — applied

The Gaussian boundary theorems, square-norm exclusion, finite-period fibre identity and value-computing examples have been removed from the acceptance file, which contains zero declarations and zero examples. Their mathematical content remains in prose and discriminating Checks at `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/README.md:255` and `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/README.md:662`, including the nonempty double fibre, empty source, cancellation and coboundary sign.

## H04 (CBirkbeck) — applied

The former declaration references are now mathematical descriptions throughout the README, including the resolved component at line 423, localized support comparison at line 462, transpose-action comparison at line 655, product comparisons at line 701, and auxiliary-place Hecke comparison at line 859 of `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/README.md`. There are no remaining backticked identifiers claiming declarations of this roadmap, and the APIs, hypothesis domains, dependencies and Checks remain in the prose specification.

## Verification and ownership

All four requested repairs were already committed in `8b21886` when this run began; the worktree remains clean, no further content changes or commit were needed, and nothing was pushed. The comparison with `835984c` confirms that the removed Lean declarations were supporting definitions, boundary statements and finite-sum facts, rather than any of the roadmap's deep endpoints.

The pinned checkouts match Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Mathlib's `continuousCohomology` at `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131` is homogeneous-complex cohomology; Tau Ceti's `H1` at `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:712` is the continuous-cocycle/coboundary quotient with continuous action, without a crystalline finite local condition. Mathlib's `selmerGroup` at `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161` is a subgroup of power classes subject to valuations; Tau Ceti's elliptic `selmerGroup₂` at `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104` is a 2-descent object, not the Rankin–Selberg Bloch–Kato carrier. Object searches found no native unitary Shimura, nearby-cycle or arithmetic diagonal-regulator carrier that would make a listed headline statable by a few simple definitions.

The declaration/signature audit found zero named declarations after removing comments. Consequently the requested `#check @name` sweep has an empty input: no elaborated signature, section hypothesis or README/Lean generality discrepancy remains to change; the actual declaration-free module was elaborated by the specified build.

Ownership searches covered main, the indexed open roadmap heads, the board packages and all twelve supplied sibling roadmap folders. SelmerIwasawaCohomology §§0.12–0.13, 2.6–2.7, 4.8–4.11 and 4.24–4.25 retain the base cohomology/Selmer ownership, and EulerSystemsAndKolyvaginSystems §§1.6 and 1.15 retain general realised Frobenius detection; the continuation keeps the source-specific unitary realization, incidence and reciprocity comparisons and rank deductions specified in its Scope and ownership. GanGrossPrasadUnitaryGroups, Scope and ownership, explicitly excludes arithmetic cycles, derivative identities and Selmer ranks, so its analytic period theorems do not replace these endpoints or create a reverse dependency. No construction or ownership was added or moved, and no dependency was added. Citation resolution at main `0ed4485` and the supplied open-head index found no unresolved cross-roadmap citations; the relevant library objects were checked separately at the specified pins.

The retained special-inert definition agrees with ltxzz-published lines 1542–1556, and the source-counting convention agrees with ltxzz lines 6044–6050 and 6312–6313. The supplied legal cache sufficed; no additional source or missing-reference request was needed, and no source manifest was edited.

## Adversarial mathematics pass

No mathematical statement was added or changed in this run. The following computations revalidate the prose definitions and Checks corresponding to the acceptance-test removal; they do not claim a new proof of the full roadmap's geometric theorems.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Special inertness at the Gaussian prime 3 | F=ℚ(i), v=(3) | Squares modulo 3 are 0,1, so −1=2 is nonsquare; the extended residue size is 3²=9 | Special inert; rational residue size 3 is the wrong upper-field value | Existing prose retained |
| Gaussian split-prime exclusion | F=ℚ(i), v=(5) | 2²=−1 modulo 5; the extension algebra splits, so the extended ideal is not prime | Special inertness is false | Existing prose retained |
| Gaussian even-prime exclusion | F=ℚ(i), v=(2) | 2 is even; (2) is associated to (1+i)² | Special inertness is false | Existing prose retained |
| Square-norm exclusion | p=2 and p=3 | Norms p²=4,9 are composite, whereas required prime norms would be 2,3 | Both rejected independently of upper inertness | Existing prose retained |
| Very-special predicate when the reflexive closure equals F | F=ℚ(i) | F⁺rflx/F⁺ has degree 1; splitting degrees are 1=1 | Very special and special coincide | Existing prose retained |
| Quartic special/very-special separation | p=17, √2=6 | 6²=2; α²=3; 3⁸=16 and 7⁸=16 modulo 17; discriminant 7168=2¹⁰·7 is nonzero modulo 17 | Inert and unramified, but not split in the real reflexive closure | Existing prose retained |
| Quartic very-special positive case | p=103, √2=38 | 38²=2; α²=35; 35⁵¹=102; 7⁵¹=1 and 25²=7 modulo 103 | Inert, unramified and split in the real reflexive closure | Existing prose retained |
| Period definition on singleton and empty source | f=1 over ℤ | Singleton sum=1; empty sum=0 | Both agree with source-counting definition | Existing prose retained |
| Fibre multiplicity formula | Source values 3,3,4, with the first two over one pair | Direct sum=10; grouped sum=2·3+1·4=10; image-only sum=7 | Multiplicity is necessary | Existing prose retained |
| Period under a doubled fibre | Two source points at the same pair, f=1 | Sum=2; average=1; over 𝔽₂ sum=0 | Counting survives coefficient reduction; averaging fails | Existing prose retained |
| Additivity of the period | Value lists (1,2) and (3,4) | Sum of pointwise sums=10; separate sums 3+7=10 | Additive-monoid law agrees | Imported API retained |
| Left regular scalar linearity | Scalar 3 and values (1,2) in ℤ | 3·(1+2)=9; 3+6=9 | Left multiplication agrees with finite summation | Imported API retained |
| Coefficient-map compatibility | Values (3,4), reduction modulo 5 | Reduction of sum=2; sum of reductions=2 | Agrees on the actual coefficient map | Imported API retained |
| Source reindexing invariance | Values (1,4,2) and reversed labels | Both sums=7 | Bijective relabelling preserves the period | Imported API retained |
| Nonzero period implies a nonzero summand, without the converse | Values (1,2), then (1,−1) | First sum=3 with nonzero summands; second sum=0 with both summands nonzero | Only the stated implication survives cancellation | Imported API and negative Check retained |
| Coboundary sign in the period | C₂ sign action on ℤ, m=1 | d0(1)(1)=0 and d0(1)(−1)=−2; source sum=−2 | Agrees with Tau Ceti d0_apply; opposite sign gives 2 | Existing prose retained |
| Transpose Hecke convention | Three-cycle P and f=(1,4,2) over 𝔽₇ | Pf=2f, Pᵗf=4f; ⟨(P−2)e₀,f⟩=4−2=2 | Same-action annihilator would not descend evaluation | Existing prose retained |
| Rank, twist and regulator degree conventions | n=2, ranks 2 and 3 | Tensor rank 6; twists 1+1=2; weight 1+2−4=−1; factor middle degrees 1+2=3 and cycle degree 2n=4 | Matches Vλ and the H¹ regulator of degree 3 | Existing prose retained |
| Inert Frobenius normalization | p=3 on Eλ(1) | Arithmetic action=9; geometric action=1/9, not 3 | Upper-field residue degree remains two | Existing prose retained |
| Product E₂ concentration degree | n=2 | Positions (−1,4),(0,3),(1,2) all have total degree 3=2n−1 | Agrees with nearby concentration degree | Existing prose retained |
| Product support comparison at empty strata | c=3 | Q(3)=∅; compact and ordinary groups are both 0; canonical map 0→0 is an isomorphism | Empty case included without a new Lean boundary theorem | Existing prose retained |

Build command: `lake build TauCetiRoadmap.SelmerIwasawaCohomologyPartII.Suggested` — exit 0.

Exact build outcome:

```text
✔ [8976/8976] Built TauCetiRoadmap.SelmerIwasawaCohomologyPartII.Suggested (2.4s)
Build completed successfully (8976 jobs).
```

Dependency check with the specified order and `--movable` — exit 0; complete output below, with no UPWARD or CYCLE line:

```text
depcheck: 13 roadmaps, 99 edges, 0 problem(s)
```

Gate with `--base origin/main` — exit 0. Exact summary:

```text
gate SelmerIwasawaCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
