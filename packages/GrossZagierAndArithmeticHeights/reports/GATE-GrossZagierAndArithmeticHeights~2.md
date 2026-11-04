## H01 (CBirkbeck) — applied

The unnamed imported Hecke deformation formula is replaced by owned CM orbit-divisor, negative-congruence, ramified-base-change and Hom-filtration comparisons in `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:3922`, with the split multiplicities, inert parity and ramified lifting shifts of Gross–Zagier III (5.2)–(5.4) and §6 (gz86 line 1330; gz86 line 1398; gz86 line 1412). The prerequisites at `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:3951` now include §§7.2 and 7.42 and the actual ModularCurvesPartII correspondence/deformation interfaces; ownership and supplier contracts at lines 7 and 116 retain general modular geometry with its supplier, and the existing consumers §§7.72, 7.73, 7.76 and 7.83 retain the full degree-m formula.

### Evidence and ownership

| Check | Evidence and outcome |
| --- | --- |
| Legal source and exact statement | gz86 line 1303: Proposition III (4.4), p. 258, allows p∣m; gz86 line 1317: prime-to-p kernel argument; gz86 line 1330: ramified branch fields and orbit decomposition; gz86 line 1344: Frobenius and negative congruences; gz86 line 1367: fine-cover projection formula; gz86 line 1388: split vanishing; gz86 line 1398: inert comparison; gz86 line 1412: inert shifts; gz86 line 1416: ramified comparison and shift. The scanned formulas on printed pp. 259–261 were also read to resolve OCR ambiguity. |
| General correspondences | `TauCetiRoadmap/ModularCurvesPartII/README.md`, §§9.1–9.2 and 9.9–9.10: full and cyclic correspondences, scalar-subgroup factors, coprime composition and level transport. In particular §9.9 distinguishes degree 13 from degree 12 at m=9. |
| Deformation and special-fibre inputs | `TauCetiRoadmap/ModularCurvesPartII/README.md`, §11.2: cyclic-isogeny deformation ring with its rigidifier and source/target maps; §§11.5 and 12.4: Frobenius/Verschiebung components and maps. The CM orbit identity, negative congruence and comparison of ramified lengths with Hom orders are the additional targets here. |
| Ownership by object | Searches of main, open roadmap heads, the supplied sibling checkouts and package designs found no other owner of this complete CM Hecke-divisor/intersection comparison. LubinTateFormalModulesAndQuasiCanonicalLifts LT.5–LT.6 concerns the underlying formal-module lattice quotients and marked lifts; the repair uses the existing §§7.1–7.2 interface and adds only its modular CM specialization. No new external supplier or fully qualified Lean declaration is introduced. |
| Pattern and consumers | The unnamed p-power import occurred in §7.58. Its direct consumers remain §§7.72, 7.73, 7.76 and 7.83; §7.44's split vanishing uses ordinary canonical lifting independently. The numbered internal Needs graph has 292 targets and 761 edges, with no missing destination or cycle. |
| Citation resolution | Cross-roadmap citations resolved against main 35c9f96 and the supplied open-head index. The seven initial name leads are present in their named suppliers: ComplexMultiplicationAndExplicitReciprocity §§1.1–1.2 and 3.1, ShimuraVarieties §4.4, and AbelianSchemesAndArithmeticModuli A4.10. They are supplier targets, not claims of pinned library declarations. |
| Pins and acceptance carriers | Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Searches by CM/deformation objects found no pinned carrier supporting these new local statements; `Suggested.lean` already records the missing CM moduli and parametrization carriers. No stand-in was added. |
| Elaborated signature audit | Elaborated a scratch `#check @TauCetiRoadmap.GrossZagierAndArithmeticHeights.canonicalHeightRat_exists_unique` and compared it with README §0.2. Field, admissible absolute values, decidable equality, W and ellipticity all remain explicit; the unique rational quadratic extension and its pure-tensor condition agree. No binder or Lean declaration changed. The native integral quadratic map is `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:341`. |

### Computed adversarial pass

The pass covers every added or changed mathematical assertion and convention, the new Checks, and the retained acceptance declaration; unchanged targets outside this repair are not independently recertified.

| Statement | Instances tried | Values computed on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Full intersection/Hom formula and properness | Split p, r_A(m)=0; degree zero; identical sections | Intersection 0 = sum of half counts 0; degree-zero fibre contains 0 fixed by sign, giving 1/2 rather than an integer; identical local equations give a quotient of infinite length | General formula retained; m≥1 and proper intersection essential | Explicit positivity and no-common-component explanation |
| Decomposition m=p^t r and prime-to-p route | m=1; m=3 at p=3; m=9 at p=3 | (t,r)=(0,1), (1,1), (2,1); t=0 gives orbit degree 1 and shift 0 on both routes | No p∤m restriction introduced | §§7.2 and 7.42 explicitly connected |
| Full versus cyclic p-power correspondence | p=3,t=2 | Full degree 1+3+9=13; cyclic degree 9+3=12; missing scalar branch has degree 1 | Cyclic-only model excluded | Scalar factors retained |
| Orbit divisor with a marking | D=−3,p=2,s=1 | Marked orbit degree 2+1=3; unmarked order class number 1·2·(1+1/2)/3=1, so one j-value need not represent three distinct coarse neighbours | Marking and multiplicities essential | Fine-cover definition and exceptional-unit Check |
| Split orbit degrees and multiplicities | p=3,t=0,1,2,3 | 1=1; 2+2=4; 3+4+6=13; 4+6+12+18=40; omitting multiplicities at t=2 gives 9≠13 | Correct t−s+1 multiplicity | Full split orbit formula |
| Inert orbit degrees and parity | p=3,t=0,1,2,3 | 1=1; 4=4; 1+12=13; 4+36=40; including all levels at t=2 would give 1+4+12=17≠13 | Parity s≡t mod2 essential | Full inert orbit formula |
| Ramified orbit degrees | p=3,t=0,1,2,3 | 1=1; 1+3=4; 1+3+9=13; 1+3+9+27=40 | All levels required | Full ramified orbit formula |
| Orbit-degree identities beyond displayed examples | p=2,3,5,7; t=0,…,12 | Each of the 156 split/inert/ramified expressions equals Σ_(i=0)^t p^i; for p=2,t=2 all three arithmetic expressions equal 7 | Arithmetic identities agree; ramified p=2 has no geometric instance under odd D | No good-prime shortcut |
| Frobenius/transpose convention | p=3,t=1,2 | Graph/transpose degrees 1+3=4 and 1+3+9=13; treating transpose as inverse graph instead gives 2 and 3 | Inseparable multiplicities retained | Explicit two-term Frobenius Check |
| Canonical reduction and twists | Inert and ramified t=0,1,2 | Canonical twist parity 0,1,0; ramified ideal norms 1,3,9 and 𝔭²=(3), whose class is 1 | Same parity convention as source | Twists and source/target named |
| Negative congruence | Fine coordinate difference uπ_y with u a unit; wrong difference π_y² | Reduction modulo π_y is 0 in both; modulo π_y² the first has valuation 1 and is nonzero, whereas the second is 0; lengths 1 versus 2 | Wrong second-order congruence excluded | Positive-level negative congruence owned explicitly |
| Ramified base change of two divisors | a=0, a=π; e=1,2,3,4 | Original length 1; pulled-back lengths 1,2,3,4 = e·1 | Unnormalized lengths cannot be equated | Index e retained |
| Orbit descent and further extension | e conjugate branches of length 1; e=1,2,3,4; further index 2 | Sums 1,2,3,4 divided by e all give 1; at e=4 further extension gives total length 8 divided by 8 =1 | Branch length and orbit length distinguished | Projection identity and further-base-change compatibility |
| Finite maximal Hom orders | One sign orbit lifting through k=2; empty fibre | Half-count tails (1,1,0,…) sum to 2; empty tails sum to 0; an integral map instead gives (1,1,1,…) | r_A(m)=0 excludes the infinite case | Finiteness explained |
| Inert even filtration, both directions | t=0,2,4; base orders k=2,2,1 | New orders 2,3,3; tail sums 2=2+0, 3=2+1, 3=1+2; multipliers 1,3,9 have degrees 1,9,81 | Shifts and degree fibres agree | Converse degree-fibre identification required |
| Inert odd filtration, both directions | t=1,3,5; one degree-pr sign orbit | New orders 1,2,3; tail sums 1=(1+1)/2, 2=(3+1)/2, 3=(5+1)/2; scalar degrees 1,9,81 multiply pr into p^t r | Shift (t+1)/2 and degree-pr starting fibre agree | Maximal order one and exhaustive scaling stated |
| Ramified filtration, both directions | k=2 and t=0,1,2 | Orders 2,3,4; tail sums 2=2+0, 3=2+1, 4=2+2; using inert t/2 at t=2 instead gives 3≠4 | W-uniformizer shift is t | Ideal isogeny and its source/target explicit |
| Ramified valuation convention | ord_π(π)=1; ramified p=3 | ord_π(3)=2 versus ord_3(3)=1; t=2 adds 2 to order 2, yielding 4 | Base valuations distinguished | No substitution of the unramified shift |
| Split vanishing, including nonempty Hecke divisor | p=3,t=2,r_A(m)=0 | Divisor degree 13; intersection 0 and each half Hom count 0 | Divisor degree is not an intersection multiplicity | Ordinary lift proof included |
| Reviewer's inert example | D=−7,N=2,p=m=3,A principal | −7 mod8=1; −7 mod3=2, a nonsquare; ideal count r_A(3)=0; orbit degree 4 and branch ramification index 4; four fine-chart lengths give 4/4=1 per matching orbit | Outside the old W-section argument | Explicit example and π_y comparison |
| Dyadic and unit boundary | Inert p=2,t=1,2 | 3 and 1+6=7; using p^s alone would give 2 and 5 | p=2 included where the standing hypotheses permit it | Dyadic and stabilizer Check |
| Rational canonical-height headline, unchanged | P=0; torsion P; scalar 0,1,2,1/2 | H(0)=0; tensor torsion=0 and height=0; values 0,H,4H,H/4 on both rational-extension conventions | Explicit hypotheses and tensor direction agree with README §0.2 | No Lean change |

### Validation

Commit: `4c1d51f9` — `GrossZagierAndArithmeticHeights: review repairs (supply p-power Hecke-CM orbit and lifting comparisons)`.

Only `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md` changed; the worktree is clean and nothing was pushed. The initial pre-commit gate reported only `dirty=1`; the final gate below passed after the required commit.

Build command: `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested` — exit 0.

```text
⚠ [8981/8981] Built TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested (2.4s)
warning: TauCetiRoadmap/GrossZagierAndArithmeticHeights/Suggested.lean:38:8: declaration uses `sorry`
Build completed successfully (8981 jobs).
```

Dependency check — exit 0; no UPWARD, CYCLE or moved line:

```text
depcheck: 50 roadmaps, 580 edges, 0 problem(s)
```

Gate — exit 0:

```text
gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
