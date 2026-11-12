<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12977#issuecomment-6791161389 -->
Review (codex) of 283b3af

Verdict: needs_changes

1. **F01** (P3) Cite convergent quotient closure in the curve rank proof

   **Location.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:1592`: “it maps nontrivially to `P` and MS.2.4 fixes its maximal slope”; the corresponding dependency is at line 1597.

   **Claim.** MS.2.4 applies to the image of the convergent realisation of the first overconvergent PBQ step in the convergent object `P`.

   **Witness.** README:1159–1162: the ordinary Legendre object's slope-one top is not overconvergent. MS.2.4, at :1077, concerns overconvergent objects; MS.2.9, at :1244–1245, supplies the required convergent quotient assertion.

   More explicitly, take `N† = L†|_U` on the ordinary Legendre locus and `P = Top(N)`. MS.2.5 gives `P_1(N†) = N†`; MS.3.9 supplies injectivity on dagger sections. The nonzero image in `P` is all of `P`, of rank 1 and slope 1, whereas `N†` has rank 2 and maximal slope 1. An overconvergent structure on `P` would lift the quotient map by full faithfulness and contradict irreducibility of `N†`. Thus this is an actual instance of MS.4.2 where the cited overconvergent quotient statement cannot be applied. It is a reference defect, not a counterexample to the rank theorem, and the necessary theory is already owned here.

   **Exact repair.** In the proof route, let `Q` be the nonzero convergent image of the realisation of `P_1(N†)` in `P`. Cite MS.2.9 for preservation of PBQ and the generic maximal slope under this convergent quotient. Since `Q` is a nonzero subobject of isoclinic `P`, its slope is `slope(P)`. Add MS.2.9 to the Needs line, replacing MS.2.4 there if it has no other use. Equivalently, state this step on generic modules and cite MS.0.10 explicitly. Do not impose overconvergence on `P`.

   **Retest.** In the Legendre instance, the repaired application has `λmax(P_1(N)_η) = 1 = slope(Q) = slope(P)` and `rank Top(N) = 1 = rank P`. It applies to a convergent quotient without inventing a dagger structure. For the unit identity it gives `0 = 0` and `1 = 1`. For `O(−1) ⊕ O(0) → O(0)`, the first PBQ step maps to zero, so the argument correctly cannot start; this map fails injectivity on dagger sections.

## Verified sound

### Previous findings checked first

All package locations in this section refer to `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md`.

| Previous finding | Repaired passage | Disposition |
| --- | --- | --- |
| Round 4 F01: missing convergent PBQ filtration | :1199–1205, “every convergent F-isocrystal `H` on `C` has a unique filtration”; :1552, “its convergent PBQ filtration (MS.2.9)” | **Repaired.** MS.2.9 provides the convergent construction, generic/interior compatibility, uniqueness and five Checks. The Legendre kernel has rank 1, slope 0, filtration `0 ⊂ H`, and no claimed overconvergent structure. R01 identifies a remaining occurrence of the category/reference mismatch in another proof step, not absence of this construction. |
| Round 4 F02: induced ambient object given the subobject's first step | :1818–1825 distinguishes `M′` and `N′` and states “`S_min(N′) = ⊕_(i<n) F^(i*)S_min(N)`” | **Repaired.** For unit `M`, zero `N`, and `n=1,2`, subobject ranks are `0=0`, ambient ranks `1=1` and `2=2`. The split two-slope example has rank 4 and first-step rank `2=2`. |

Neither repair was marked not actionable. No settled finding is re-raised. The comparison of the two package revisions, ignoring whitespace, finds exactly five changed numbered target blocks: MS.2.2, MS.2.9 (new), MS.4.1, MS.4.2 and MS.5.3. All five were read in full, including their routes, APIs and Checks. The changed Summary, scope, supplier paragraphs, layer descriptions, examples, dependency paragraphs and DAD correction were also inspected. No old target identifier was removed or renumbered.

For the other 64 numbered targets, the round-4 adversarial table has computed values for every target, rather than mere assertions of soundness. Those rows supply the unchanged-target evidence permitted by the brief. The sampled targets and headline results were additionally revisited below. R01 supersedes the earlier assessment of MS.4.2's proof reference.

### Computed adversarial pass

Write `L_s` for a constant slope-s line. The logarithmic object has `F(e₁)=q⁻¹e₁`, `F(e₂)=e₂`, and `∇e₂=e₁ dt/t`; its bounded quotient is the unit. These calculations check definitions, directions, hypotheses and negative controls; they are not formal proofs of the headline results.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Slope and Tate conventions | `q=p²`, eigenvalues `1,p²`; ramification index 2; iterate twice | Raw `(0,2)` divided by 2 is `(0,1)`; ramified raw `(0,4)` divided by 4 is `(0,1)`; iteration preserves these normalized values. `O(1)` has slope −1, dual +1 | Correct; `q=1`, equal-characteristic coefficients and the zero coefficient ring are excluded |
| Solution convention | Constant eigenvalue `a`; dual twice; scalar map 2 | Solution eigenvalue `a⁻¹`; double-dual scalar `2→2→2` | Correct variance |
| MS.0.7 bounded splitting headline | Zero, `L₁⊕L₀`, logarithmic object | Ranks/bounded-solution dimensions `(0,0),(2,2),(2,1)`; split extension class 0, logarithmic class nonzero | Correct boundary control |
| MS.0.9 sampled PBQ | Zero, unit, `L₁⊕L₀`, logarithmic object | Bounded quotient slope sets `∅,{0},{1,0},{0}`; PBQ `false,true,false,true`; quotient ranks `0,1,2,1` | Correct nonzero convention; Ohkubo's different zero convention is disclosed |
| MS.1.1 local filtration headline | Zero, unit, `L₁⊕L₀` | Filtration lengths `0,1,2`; split grade maxima `(1,0)`, nested maxima `(1,1)` | Correct grades, not nested terms |
| MS.1.8 growth/slope headline | Logarithmic object, `λ=−1,0,1`, `p=2,3` | Growth dimensions `0,1,2` equal shifted-slope dimensions `0,1,2`; coefficient at `n=pʳ` has norm `pʳ`; `pʳ/(pʳ+1)^λ` is unbounded for `λ<1` | Correct growth threshold and sign |
| MS.2.1 sampled curve PBQ | Zero, line, constant two-slope sum | Generic bounded ranks `0,1,2`; bounded slope sets `∅,{0},{1,0}`; PBQ `false,true,false` | Correct generic rather than fibrewise predicate |
| MS.2.2(4), added intersection | Zero; free line on `G_m`; `f=Σ pⁿx^(pⁿ)` | Zero intersection is 0; `f` has coefficients tending to 0 and lies in the completed algebra and every interior lattice. At infinity `|pⁿ|r^(−pⁿ)→∞` for each `r<1` | Correct: convergent intersection includes `f`; dagger intersection excludes it |
| MS.2.2(4), interior negative control | `C=A¹`, `1/x` | Generic field contains `1/x`; order at 0 is −1, so its bounded-disc lattice membership is false and completed-algebra membership is false | Interior condition discriminates |
| MS.2.5 curve filtration headline | Constant split; irreducible line | Lengths 2 and 1; grade maxima `(1,0)` and `(0)` | Correct |
| MS.2.9 definition and filtration | Zero, unit, split two slopes, logarithmic object, ordinary Legendre kernel `H` | PBQ `false,true,false,true,true`; lengths `0,1,2,1,1`; Legendre generic/interior/bounded ranks all 1, sole slope 0 | New construction covers the old counterexample without boundary conditions |
| MS.2.9 generic uniqueness | Diagonal in `O²`; proposed `xO⊂O` on `A¹` | Intersection with `E_η(1,1)` is `{(a,a)}`. For wrong model, `∇x=dx` is not in `xO dx`, and `O/xO` is not projective | Correct subobject restriction excludes the wrong model |
| MS.2.9 determinant gluing | `H=O²`, ranks `s=0,1,2` | Wedge kernels have ranks `0,1,2`: identity for `s=0`, kernel of `h↦e₁∧h` is `Oe₁`, target `∧³H=0` for `s=2` | Correct extremes and twist direction |
| MS.2.9 rank-one normalization | Constant Frobenius `q` | Original slope 1; twist by `q⁻¹` gives eigenvalue 1, slope 0; untwist restores 1 | Correct before using unit-root correspondence |
| MS.2.9 compatibility and quotient API | Unit on proper `P¹`; split projection; ordinary Legendre | Proper unit: length `1=1`, no boundary. Split projection to `L₀`: maximum `1→0`, source not PBQ. Legendre: quotient maximum `1→1`, kernel maximum 0 | Correct quotient hypothesis; R01 must cite this API |
| MS.4.1 repaired kernel construction | Ordinary Legendre; constant split projection; strict-rank algebraic model `O²→O`, sum map | Legendre `rank Top=rank P=1`, so strict hypothesis false, `P₁(H)=H` rank 1. Split has maxima `1≠0`. Sum model: top ranks `2>1`, kernel is rank-one antidiagonal, local and global kernels equal | Correct tests; sum model fails dagger-section injectivity, as a contradiction lemma requires |
| MS.4.1 interior saturation | `L⊂H⊂N`, with `H=ker(N→P)` | Exact quotient sequence has ranks `rank(N/L)=rank(H/L)+rank P`; unit-square sum example gives `1=0+1` | Quotient is finite projective; no boundary structure on `H` is assumed |
| MS.4.2 rank headline and R01 | Ordinary Legendre; unit identity; split projection; zero | Legendre maxima `1=1`, top/target ranks `1=1`, but quotient overconvergent=false. Unit `0=0`, `1=1`. Split `1≠0` and dagger kernel rank 1. Zero rank `0=0`, numerical slope undefined | Theorem survives; replace its quotient reference as R01 specifies |
| MS.3.7 local reconstruction headline | Log versus its unit saturation; unit map 2 or 0 | Tops have ranks `1=1`, total ranks `2≠1`; logarithmic source fails saturation. Unit lift is scalar 2; zero map rank 0 | Correct hypotheses |
| MS.4.6 specified-map headline | Irreducible unit, map 2; logarithmic source | Unique lift 2; logarithmic top rank 1 versus source rank 2, excluded by hypotheses | Correct |
| MS.4.8 minimal-slope headline | `O(1)` and double dual | Slopes `−1→1→−1`; scalar `2→2→2` | Correct direction after dualizing twice |
| MS.5.3 corrected induction | `M=O,N=0`, `n=1,2` | `rank S_min(M′)=1,2`, same as ambient RHS; `rank S_min(N′)=0,0`, same as subobject RHS | Old counterexample repaired |
| MS.5.3 split induction | `n=2`, `N=M=L₀⊕L₁` as `F²`-objects | Rank 4; induced slope-one block matrix has characteristic polynomial `T²−q²`, eigenvalues `±q`; full slopes `(0,0,1,1)`; first-step ranks `2=2` | Correct, also for `p=2` in characteristic-zero coefficients |
| MS.5.3 hull and pullback | `n=1`; induced ordinary Legendre unit-root line; general `n>0` | Identity hull unchanged; at `n=2`, subobject rank 2, hull rank 4, minimal ranks `2=2`. `F^*F^((n−1)*)=F^(n*)≅id` | Correct autoequivalence on the categories with `F^n`-structure |
| MS.5.7 curve MS headline | Ordinary line; proper curve; zero | Ordinary first-step ranks `1=1` although hull rank 2; proper hull equals the subobject; zero `0=0` | Correct |
| MS.5.8 docile headline | Unit over `𝔽_(p²)` on projective plane and line | Horizontal dimensions over `K` are `2→2`; restriction preserves both constants | Correct; docility retained |
| MS.6.1 sampled Lefschetz condition | Identity curve; `A¹_(𝔽_(p²))→A¹_(𝔽_p)` at origin, `p=2,3` | Identity has 1 residue-rational lift; constant extension has 0, since no embedding `𝔽_(p²)→𝔽_p`; both pullbacks have rank 1 | Correct negative control distinguishes a witness from image containment |
| MS.6.9 coefficient and purity control | `F=2` over `𝔽₃`; `a=(1+√5)/2` over `L=ℚ₃(√5)` | `w=2log₃2≈1.26186`, `3^(w/2)=2`; L-linear modulus `1.618034`, forgotten K-spectrum moduli `1.618034,0.618034` | Purity applies to coefficient-linear spectrum; forgetting L rejected |
| MS.6.13 finite-field existence headline | Equal irreducible lines; scalar top map 2 | Top ranks `1=1`; equal weights give Hom weight `w−w=0`; nonzero scalar has rank 1 | Correct weaker conclusion |
| MS.6.14 finite-field specified-map headline | Labelled lines, `Top(g′)=2`, `h=3` | `h∘Top(g′)⁻¹=3/2`, inverse `2/3`, and `(3/2)·2=3` | Correct map direction and endomorphism hypothesis |

### Sources and seeded sample

No author-flagged unverified locator occurs in the README. All nine cited works have their existing manifest entries; the repair only expanded TSU's `cited_for` range. No source fetch or manifest mutation was needed.

- **PBQ:** MS.0.9 matches TSU Definition 3.16, printed p. 16 (TSU line 864), and Definition 3.22, p. 17 (TSU line 920); CT11 Definition 5.1, printed p. 55 (CT11 line 996); OHK Definition 5.10 and Lemma 5.11, p. 27 (OHK line 1336 and line 1343). The README explicitly excludes zero, while OHK line 1341 explicitly includes it. MS.2.1 matches TSU Definition 3.26, p. 18 (TSU line 991), including the generic affine realization. The filtration and its corrected grade convention were compared with TSU Theorem 3.19 (TSU line 878) and Theorem 3.27 (TSU line 997).
- **Lefschetz condition:** MS.6.1 retains the separated finite-type base, irreducible object, smooth curve, morphism and residue-rational point of TSU §6.3, printed p. 28 (TSU line 1456–1463). Connectedness is compatible with irreducibility. AE §1.1 (AE line 153–178) and Theorem 3.10, p. 17 (AE line 747–760), support the coefficient-category and finite-set extension used in the declared Lefschetz contract. Merely containing a closed point in the image does not satisfy the source.
- **New convergent construction:** TSU line 1357–1362, proof of Proposition 6.1, p. 26, explicitly asserts the convergent PBQ filtration. The stated reconstruction route was compared with Lemmas 3.32–3.33, pp. 19–20 (TSU line 1035–1097) and the filtration proof, pp. 20–21 (TSU line 1098–1110). MS.2.9 explains the interior-only adaptation rather than citing the overconvergent theorem as if it already had the broader domain. The finite-projective intersection follows by direct summands from the scalar intersection. The wedge construction has the correct source, target and dual-line twist.
- **Repaired rank route:** TSU line 1363–1400 supplies the boundary kernel, rank comparison, injection and PBQ-cokernel argument. The first slope-identification step at TSU line 1352–1354 has the same inappropriate overconvergent-quotient citation now identified as R01. The generic quotient statement at TSU line 869 resolves it.
- **Induction:** DAD Lemma 4.1.4, printed p. 12 (DAD line 451–457), distinguishes the two induced objects. The corrected first-step formula in MS.5.3 and the amended source-correction entry retain that distinction.
- **Purity contract:** AE Theorem 2.7, p. 13 (AE line 539–553), is used in its algebraically closed coefficient category, not as purity after forgetting a finite coefficient structure. The previously repaired absolute-irreducibility requirement remains present.

### Pins, Lean acceptance test and headline coverage

The manifest pins agree with the README: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Fourteen referenced declarations were opened at those pins:

| Declaration | File and line at the pin | Verified scope |
| --- | --- | --- |
| `LinearMap.quotKerEquivRange` | `Mathlib/LinearAlgebra/Isomorphisms.lean:39` | Quotient by kernel to range; no analytic descent |
| `Representation.averageMap`, `averageMap_invariant`, `averageMap_id` | `Mathlib/RepresentationTheory/Invariants.lean:126`, :131, :137 | Finite group and invertible cardinality, binders at :121 |
| `LinearMap.trace`, `trace_one` | `Mathlib/LinearAlgebra/Trace.lean:75`, :190 | Trace uses a finite basis when available; finite-free identity trace is finrank |
| `Padic.norm_p_pow` | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:881` | Natural powers of the prime have norm `p^(−n)` |
| `FixedPoints.subfield` | `Mathlib/FieldTheory/Fixed.lean:103` | Fixed subfield of the monoid action |
| `WittVector.Isocrystal`, `isocrystal_classification` | `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`, :179 | Structure extends Module with `frob : V ≃ᶠˡ[p, k] V`; neither connection nor finiteness is a field; classification here assumes rank 1 and algebraically closed residue field |
| `PowerSeries.derivative` | `Mathlib/RingTheory/PowerSeries/Derivative.lean:50` | Formal derivation on power series |
| `PowerSeries.HasGaussNorm.subring`, `mem_subring_one_iff` | `TauCeti/RingTheory/PowerSeries/Bounded.lean:63`, :81 | Positive-radius bounded weighted coefficient norms; at radius 1, bounded coefficients |
| `PowerSeries.OnOpenDisc.subring` | `TauCeti/RingTheory/PowerSeries/OpenDisc/Basic.lean:295` | Series restricted at every smaller radius |

Also inspected `PowerSeries.OnOpenDisc.derivative` at :342 of the latter file. Derivative stability does not supply a compatible Frobenius differential-module category. Object searches of both pinned libraries for PBQ, bounded quotients, dagger hulls, Amice fields, bounded Robba fields and overconvergent isocrystals produced no missing native carrier that would make these headlines statable with a few elementary definitions. Ordinary Witt-vector isocrystals and bounded power-series rings are distinct supplied objects.

The prescribed `lake env lean` invocation, run from the content checkout against the package file, exited **0 with no output or warnings**. No Tau Ceti module build was necessary. `Suggested.lean` contains one `import Mathlib`, one module docstring, the correct empty namespace, and zero declarations. It has zero sorried theorems, sorried data, examples and `set_option` occurrences. The exhaustive one-tactic-probe inventory therefore has **0 entries**; the exhaustive `#check @name` inventory likewise has **0 entries**. There is no silently dropped declaration hypothesis and no padding to delete.

| Headline group | README targets | Module-docstring coverage / missing native structures |
| --- | --- | --- |
| Bounded splitting; local PBQ; growth/slopes; local reconstruction | MS.0.7, MS.1.1, MS.1.8, MS.3.7 | Suggested.lean:29–32; Amice/Robba differential Frobenius modules, generic solutions, slopes |
| Curve PBQ and curve rank theorem | MS.2.5, convergent variant MS.2.9, MS.4.2 | :26–28 names curve PBQ and the rank theorem; both curve PBQ variants need the absent convergent/overconvergent categories, generic modules and bounded quotients |
| Curve specified-map theorem and minimal-slope dual | MS.4.6, MS.4.8 | :19–23; isocrystals and extremal slope pieces |
| Minimal slope property on curves | MS.5.7 | :24–25; dagger-extendable objects and hulls |
| Docile Lefschetz full faithfulness | MS.5.8 | :36–37; docile overconvergent isocrystals |
| Finite-field existence and specified-map results | MS.6.13, MS.6.14 | :33–35; coefficient isocrystals, fibres, weights, Lefschetz curves |

No statable headline is omitted or forced through a stand-in. The absence of declarations is appropriate for these pins; successful elaboration is not evidence that the prose proof routes are correct.

### Suppliers, gaps and duplication

All 69 Needs paragraphs, including continuation lines, and all seven layer dependency paragraphs were read. The 72 distinct explicitly numbered parent IDs appearing in the README resolve at the indexed head of **#1002 PadicDifferentialEquationsAndRigidCohomology**. The consumed statements were compared with the supplier contracts. Representative exact locations, including every newly used category interface, in `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md` are:

| Input group | Sections and supplier line locations |
| --- | --- |
| Analytic carriers and coefficient extension | RD.0.1 :673; RD.0.9 :910; RD.0.17 :1120; RD.0.26 :1370; RD.0.34 :1559; RD.0.35 :1597; RD.0.36 :1630; RD.0.37 :1670; RD.0.38 :1695; RD.0.39 :1716; RD.0.42 :1794; RD.0.48 :1976; RD.0.53 :2120 |
| Differential modules and slopes | RD.1.13 :2537; RD.1.22 :2779; RD.1.25 :2853; RD.1.27 :2921; RD.1.32 :3030; RD.1.35 :3094; RD.1.36 :3131; RD.1.37 :3162; RD.1.39 :3203; RD.1.40 :3223; RD.1.41 :3247; RD.1.43 :3282; RD.1.44 :3324; RD.1.45 :3346; RD.1.72 :4033; RD.2.22 :4693; RD.2.28 :4893 |
| Categories, realizations, lifts and descent | RD.3.15 :5957; RD.3.16 :5973; RD.3.19 :6048; RD.3.22 :6133; RD.3.25 :6219; RD.3.29 :6331; RD.3.31 :6378; RD.3.32 :6404; RD.3.33 :6436; RD.3.34 :6474; RD.3.37 :6604; RD.3.38 :6641; RD.3.39 :6663; RD.3.40 :6690; RD.3.41 :6708; RD.3.45 :6824; RD.3.47 :6879; RD.3.48 :6913 |
| Full faithfulness, compactification, duality and docility | RD.4.19 :7541; RD.5.2 :8665; RD.5.4 :8693; RD.5.7 :8756; RD.5.8 :8780; RD.5.8c :8846; RD.5.29 :9309; RD.5.89 :10638; RD.5.100 :10886; RD.5.103 :10995; RD.5.112 :11227 |
| Finite-field fibres, traces and weights | RD.6.2 :11440; RD.6.4 :11506; RD.6.23 :11961; RD.6.28 :12056; RD.6.42 :12392; RD.6.47 :12563; RD.6.57 :12830; RD.6.59 :12893; RD.6.60 :12923; RD.6.61 :12938; RD.6.77 :13286; RD.6.82 :13385; RD.6.85 :13454 |

In particular RD.3.33 supplies locally free convergent objects and equality with overconvergent objects on proper schemes; RD.3.34 supplies the completed-affine realization with Frobenius and automatic convergence; RD.3.40 supplies convergent as well as overconvergent Zariski gluing. RD.3.25 and RD.3.34 supply the Frobenius pullbacks used in MS.5.3. These newly used sections really exist with the required interfaces.

The other suppliers were reopened on main: `TauCetiRoadmap/AlgebraicCurves/README.md:478` (Layer 2, Dedekind bridge), :1468 (Layer 12, smooth models over perfect fields); and `TauCetiRoadmap/RigidAnalyticGeometry/README.md:434` (Layer 5, finite-cover Tate acyclicity). Their opening and layer formats were also used for the house-shape comparison. No supplier is later than this package or forbidden by the brief. The package divides the parent's raw slopes by `v_π(q)` and keeps its Tate convention; the numerical checks above verify that translation.

All **nine** declared gaps have exactly equal `needs` text in the README and `design/plan.json`, with the same slug and a named parent supplier: extended-log-robba-growth; dejong-disc-robba-submodules; unit-root-correspondence-perfect-base; legendre-kummer-extension; irreducible-iota-purity; lefschetz-curves-irreducibility; docile-curve-restriction; coefficient-linear-weil-ii; dejong-generic-affine-line-comparison. Their hypotheses and requested extensions remain explicit. Comparison with the cited parent interfaces and the pin searches revealed no duplicate request. The convergent part of MS.2.9 uses the already declared unit-root contract; no additional gap is needed. These contracts are not findings.

Ownership searches used `roadmaps grep` over main and the indexed open heads, native-library searches, and the available board packages. The board-package index and supplied open-work index were read. Searches for PBQ, pure/maximally bounded quotients and dagger hulls found no other owner. The lexical “Lefschetz condition” hits in **#1725 SatoTateGroups**, `TauCetiRoadmap/SatoTateGroups/README.md:888`, concern centralizers in a compact group, not curves preserving irreducibility.

The closest open scopes were opened: **#879 FiniteFlatGroupsAndIntegralPadicHodgeTheory**, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:52`, owns group schemes and integral classifications; **#1062 PadicHodgeTheory**, `TauCetiRoadmap/PadicHodgeTheory/README.md:7`, owns periods and comparison theory; **#1205 VectorBundlesAndIsocrystals**, `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:7`, owns Fargues–Fontaine geometry and finite-isocrystal comparisons; **#857 CrystallineCohomology**, `TauCetiRoadmap/CrystallineCohomology/README.md:50`, owns crystalline and de Rham–Witt theory. None owns the PBQ constructions, dagger hulls or minimal-slope reconstruction developed here. The foundational carriers remain the parent's imports.

The supplied overlap report records no conflicting head, dropped cited ID or revision-only ID. No such conflict was found in the inspected heads. `roadmaps resolve` reports no unresolved cross-roadmap citations or Lean names; its explicit omission of pinned-library checking was covered manually above.

The prescribed dependency check returned:

```text
depcheck: 237 roadmaps, 2140 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. R01 is an internal reference correction and does not alter the supply direction.

### Principles, shape and completeness

The roadmap extends its named parent rather than re-planning its carriers. It retains general perfect fields and characteristic-zero discretely valued coefficients in the curve theory, and all primes in the theorems. The `p≡1 mod 4` restriction belongs to the Legendre–Kummer example. No algorithm, source-chapter layer title, copied passage, source-order claim, process narrative, HTML anchor, machine path, sorry'd data or `set_option` was found in the mathematical package. The dependency order explains the progression from bounded quotients through PBQ and saturation to reconstruction, then coefficient/Lefschetz theory.

There are **69 numbered targets**, **69 Needs paragraphs**, **7 layers**, and **20 explicit definition API blocks**. Check counts in API-block order are `3,5,4,4,3,3,3,5,3,3,3,3,3,3,3,3,3,4,3,4`. Every such block meets the three-Check floor; the new convergent definition has five. Targets retain their hypotheses and source locators, and layers end in Examples and Dependencies. Backticked native declarations were resolved at the pins; mathematical notation is not represented as an undeclared local Lean API. No fully qualified declaration collision is possible in the empty Lean namespace. The only required package repair identified in this round is R01.

## Not verifiable

- **DEJONG98, Proposition 6.4:** settled uncertified/paywalled; its text was not available. Its declared contract was checked for precision and ownership, not certified against the inaccessible paper. No repeat request was made.
- **TSU98, Theorems 4.2.6 and 7.2.3:** settled uncertified/paywalled; checked via the declared contract and its use in TSU, not against the original text. No repeat request was made.
- Ownership checks cover main, the indexed readable open heads and the available board contents. The board index identifies other branch contents; this review does not claim to have inspected unseen package branches.
- Lean elaboration checks this acceptance file's syntax and imports, not the unformalized mathematical targets. The computed adversarial instances are review evidence, not formal proofs.

## Source issues

- **Misprint** in TSU at Theorem 3.19(1), printed page 16: the source says maximal slopes of nested PBQ terms strictly decrease; it should be maximal slopes of successive grades that strictly decrease; affects a stated result.
- **Misprint** in TSU at proof of Proposition 6.1, printed page 26: the source says to use overconvergent quotient closure from Lemma 3.30 for a convergent image; it should use Lemma 3.17 on generic modules; affects the proof.
- **Misprint** in DAD at proof of Lemma 4.1.4, printed page 12: the source says the induced hull itself equals its first slope step; it should apply the first-step operator also to the initial sum of hulls; affects the proof.
- **Misprint** in OHK at Corollary 5.12, printed page 27: the source says every quotient of an arbitrary module is PBQ; it should assume the original module is PBQ; affects a stated result.

For the last entry, OHK line 1350–1352 omits that premise: the identity quotient of the bounded split object `L₀⊕L₁` has slopes `{0,1}` and is not PBQ. The package's quotient targets already include the correct premise, so this source issue creates no additional package finding. Other source corrections inherited from previous rounds were not all re-certified in this round.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "283b3af2a4d3e3e8d0a528ea774b31963343419e", "job": "REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~5", "model": "gpt-6-astra", "worker": "chris-8"} -->
