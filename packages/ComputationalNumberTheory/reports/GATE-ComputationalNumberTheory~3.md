## H01 (CBirkbeck) — answered

The shared primitives remain owned by ComputationalNumberTheory, with the one-way supplier contract in `TauCetiRoadmap/ComputationalNumberTheory/README.md:116` and consumer comparisons at `:2665`; ComputationalNumberTheory precedes EffectiveDiophantineMethods at positions 159 and 204 of `merge-order/ORDER.txt`, so making the latter a supplier here would reverse that direction. The requested supplier/adaptor edit in EffectiveDiophantineMethods remains unresolved: this job authorizes only this roadmap's README and Suggested.lean, and supplies no companion checkout for a full recheck of its reported ownership conflict; this finding is not claimed as repaired or disputed.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/ComputationalNumberTheory/README.md:2053` replaces the undifferentiated GRH qualification with the unconditional F_ℓ application under (POS), the GRH-dependent G_ℓ application under real-axis positivity, and unconditional scalar formulas and bounds, retaining both automorphic implications outside scope. The published source gives (POS) and its implication at CT line 678 and CT line 680, the F_ℓ family at CT line 866, and the GRH extension at CT line 1535; searching the other GRH references found no second conflation.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/ComputationalNumberTheory/README.md:1073` adds `(multiplierRing I).toSubmodule = I / I`; `:208` and `:1079` name the pinned membership, scalar-subset and product-adjunction APIs, while `:1083` gives explicit zero, integer, noninteger and scaled-lattice Checks. The comparison holds for every stated characteristic-zero field and integer submodule, including zero, and was proved in scratch against the unchanged definition in `TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean:208`; no API-only theorem was added to the acceptance file.

### Signatures, citations and ownership limits

All 69 declarations were elaborated with fully qualified `#check @name` in one scratch file, which exited 0; I read each printed signature against its README statement. No mathematical signature changed and no required binder was missing: the complete-DVR hypothesis, full-order finite generation and rational span, all elliptic normal-form and prime hypotheses, residual scalar extensions, saturation quotient generation and ambient torsion, and analytic pole and denominator guards remain explicit. The preliminary signature inventory's unqualified-name errors do not recur. The same scratch elaboration checked the three native division declarations and proved the general multiplier comparison without `sorry` or an option override.

The verified pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; content main is `bec24db`. `Mathlib/Algebra/Algebra/Operations.lean:861` defines submodule division by the multiplication-preserving membership condition, with `Submodule.mem_div_iff_forall_mul_mem` at `:875`, `Submodule.mem_div_iff_smul_subset` at `:878`, and `Submodule.le_div_iff_mul_le` at `:885`. This is a submodule operation, with no finiteness or nonzero restriction; the subalgebra packaging additionally supplies multiplication closure and the integer scalar image. The order-specific carrier already uses self-division at `TauCeti/NumberTheory/NumberField/Global/Orders/ProperIdeal.lean:38`; it takes fractional ideals of a number-field order, rather than all integer submodules of any characteristic-zero field. NumberRings line 290 and NumberRings line 305 give the ideal-quotient and multiplier interpretations; NumberRings line 1121 gives the p-radical instance. The new comparison therefore extends neither mathematical scope nor carrier generality.

Ownership searches by object covered main, the 34 board-package READMEs and all 32 supplied sibling folders, as well as the required indexed-roadmap search. The matches involving ordinary module quotients, ring-map divisibility in HabiroNahmSeries, and EffectiveClassNumbers' use of the effective Diophantine interfaces do not supply a replacement owner for the shared primitive contracts. IntegralLattices Layer 2, milestone 2A remains the bounded-norm supplier (`TauCetiRoadmap/IntegralLattices/README.md:772`); no work was assigned back to it. No supplier was moved and no fully qualified declaration was reused from another roadmap.

The citation resolver reports no unresolved cross-roadmap citation. The four ClassicalArithmeticCompletion leads in the preliminary inventory are explicit planned names in its main README: `IntMatrix.IsSmithDecomposition` at `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:5341`, `IntMatrix.IsHermiteNormalForm` at `:5412`, `IntMatrix.IsHermiteDecomposition` at `:6073`, and `ClassGroupPresentation.index_relationLattice` at `:11171`; `PrattTree.validList` is declared locally at `TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean:93`. Ownership against additional open pull requests without supplied files was not fully checked: indexed excerpts are not a full-head audit, including for EffectiveDiophantineMethods, ZerosOfLFunctions, AlgebraicModularFormsAndSerreWeights and HeightsRationalPointsAndObstructions. Existing citations to those roadmaps were retained, not represented as independently recertified contracts.

The affected published CT passages and NumberRings passages were read in the supplied legal cached extractions, under their existing source keys. No new work was cited, no missing text was requested, and the settled mattuck waiver was not reopened.

### Adversarial mathematics record

These rows cover the repaired statements and their defining conditions, together with the shared-interface edge cases relevant to H01. Rational values and finite sets are exact; decimals are diagnostic evaluations, not rigorous enclosures or proofs of the general admitted headlines. The unchanged acceptance file's general statements remain admitted targets.

| Statement | Instances tried | Computed values on the two sides or defining conditions | Result | Change |
| --- | --- | --- | --- | --- |
| Native quotient membership and direction | I=ℤ, J=2ℤ and the reverse; x=1/2 | xJ⊆I holds in the first case since x·2=1; it fails in the reverse since x·1=1/2∉2ℤ; membership pairs are true/true and false/false | Pass | Native API cited |
| Native scalar-subset comparison | I=J=2ℤ; x=1 and 1/2 | 1·2=2∈2ℤ and 1·I=I; (1/2)·2=1∉2ℤ and (1/2)·I=ℤ⊄2ℤ | Pass | Native API cited |
| Native product adjunction | J=6ℤ, K=3ℤ; M=2ℤ and ℤ | J/K=2ℤ; M≤J/K and MK≤J are true/true for 2ℤ (MK=6ℤ), false/false for ℤ (MK=3ℤ) | Pass | Native API cited |
| Multiplier/self-division equality | I=0; x=0,1,1/2,2,−1/3 | Every x gives x·0=0; both submodules are ℚ, including membership of 1/2; this excludes scalar-division-by-zero conventions | Pass | General comparison and zero Check added |
| Multiplier/self-division equality | I=ℤ; x=0,1,1/2,2,−1/3 | Products with 1 are 0,1,1/2,2,−1/3; both membership lists are true,true,false,true,false and both submodules equal ℤ | Pass | Agreement and negative Checks made explicit |
| Multiplier/self-division equality under scaling | I=2ℤ, (1/2)ℤ, −2ℤ; x=1 and 1/2 | Products with a generator are (2,1), (1/2,1/4), (−2,−1); each gives membership true,false and multiplier submodule ℤ | Pass | Scaling Check added; excludes the wrong model I/I=I |
| Subalgebra closure and integer scalars | I=2ℤ; multipliers 1,−1,2 and nonmultiplier 1/2 | Sums and products of 1 and −1 give 0,2,−1, all integral; integer 2 sends 2 to 4∈2ℤ; 1/2 sends 2 to 1∉2ℤ | Pass | Native quotient reuse specified |
| Zero and full submodules | I=0 and I=ℚ inside ℚ | Both stabilizers and both self-quotients are ℚ; x=1/2 gives 0 at I=0 and sends every rational to a rational at I=ℚ | Pass | Zero remains permitted; no finite-order assertion |
| Odlyzko kernel definition and denominator | x=0,1,−1 | r(0)=2/π²≈0.202642367285, r(1)≈0.061462154880, r(−1)≈0.454147310368; x²+π²>0 throughout | Pass | Kernel unchanged |
| Kernel decay | (x,t)=(0,0),(0,1),(1,1),(2,0) | Left/right: 0.202642367285=0.202642367285; 0.061462154880≤0.074547960834; 0.013887134101≤0.022610663190; 0.013887134101=0.013887134101 | Pass | Scalar bounds unchanged |
| F_ℓ positivity application | ℓ=1,2; x=0,ℓ/2,ℓ | F_ℓ(0)=1, F_ℓ(ℓ)=0; midpoint values are 1/(π cosh(1/4))≈0.308615322242 and 1/(π cosh(1/2))≈0.282283218022; the strip condition and unconditional implication are CT line 678 and CT line 866 | Pass | Hypotheses distinguished |
| G_ℓ positivity application | ℓ=1,2; x=0,ℓ/2,ℓ | G_ℓ(0)=1, G_ℓ(ℓ/2)=1/π≈0.318309886184, G_ℓ(ℓ)=0; the GRH-dependent real-axis extension is CT line 1535 | Pass | GRH attached to this application |
| Unconditional scalar normalization and parameter range | ℓ=1,2; excluded ℓ=0 | Indices 1 and 4 both equal 8/π²≈0.810569469139 at 1 and 16/π²≈1.621138938278 at 2; ℓ=0 is outside the analytic scaling domain | Pass | Scalar formulas retain ℓ>0 and no GRH |
| Shared ball zero branch | p=3, N=2, centre 9; N=0, centre 1/3 | 9+9ℤ₃=9ℤ₃ has record (2,2,0); 1/3+ℤ₃ has record (0,−1,1) | Pass | Ownership retained |
| Shared selected-root primitive and disc restriction | X²; X²−1 on [−2,2]×{0}; root 1 in the unit disc boundary | Distinct root counts 1 and 2; a rectangle containing 1 cannot lie inside the open unit disc since its point 1 has norm 1 | Pass | Extra squarefree/label/disc data remain consumer refinements |
| Shared local-image interpretation | y²=x³−x over ℝ; x=−1/2,2 | Cubic values 3/8 and 6 are positive; x−root sign triples (+,−,−) and (+,+,+) generate order 2=(1+3)/2 | Pass | Shared subgroup interpretation retained |
| Shared saturation and ambient torsion | A=ℤ, G=6ℤ at p=5,2,3; A=ℤ×ℤ/2, G=ℤ×0 at p=2 | gcd(6,p)=1,2,3 gives saturation true,false,false; in the last case 2·(0,1)=0∈G but (0,1)∉G, despite G∩2A=2G | Pass | Essential torsion condition retained |
| Shared affine ellipsoid and positive definiteness | G=[1], t=1/2, R=1/4; G=[0], R=0 | First set is {0,1}, both boundary values 1/4; second set is all ℤ with value 0, so positive definiteness is essential to finiteness | Pass | Existing IntegralLattices supply retained |

### Build, gate and commit

Committed the README-only repair as `37b9f6f5ca83439fe4fe5408364f9448ae8681b9`, with message `ComputationalNumberTheory: review repairs (distinguish GRH applications and compare multiplier submodules)`. The worktree is clean; nothing was pushed. H01's counterpart edit remains outstanding.

`lake build TauCetiRoadmap.ComputationalNumberTheory.Suggested` exited 0, with 32 expected admitted-target warnings and no errors:

```text
Build completed successfully (9016 jobs).
```

The complete dependency-direction output, exit 0, is:

```text
depcheck: 33 roadmaps, 301 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The first content gate failed only for the uncommitted README (`dirty=1`); after the requested commit, the same gate exited 0 with this exact summary:

```text
gate ComputationalNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
