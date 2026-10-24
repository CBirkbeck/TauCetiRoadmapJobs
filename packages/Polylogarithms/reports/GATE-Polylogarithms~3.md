## H01 (CBirkbeck) — applied

Replaced the transcendence-degree-only domain by finitely generated one-variable function fields in `TauCetiRoadmap/Polylogarithms/README.md:768`, retaining explicit `TauCeti.IsFunctionField` hypotheses for the degree law, uniqueness, lifted norms, towers and finite-cover construction at line 775, and qualifying the related finite-support API at line 755. The conventions and pinned supplier contract at lines 27 and 66, AlgebraicCurves Layer 12B–12C ownership at lines 13 and 100, and finite/infinite-support Checks at lines 798–799 make the restriction uniform; BNM line 1400 defines precisely this category, with Definition 6.2 at line 1415 and Theorem 6.3 at lines 1435–1443.

## H02 (CBirkbeck) — answered

The description's missing-supplier paragraph is obsolete: BorelRegulators §§2.3 and 5.1–5.4 and MotivicEtaleKTheory Layers 1–7 exist at their supplied open heads, while `TauCetiRoadmap/Polylogarithms/README.md:167` assigns the additional all-ring zero-component homology comparison locally. The worker should replace that paragraph with “BorelRegulators and MotivicEtaleKTheory are available as open supplier roadmaps; Polylogarithms §2.2 owns the additional all-ring zero-component homology comparison using the named spectrum suppliers”; PR-description edits are outside this job's permitted files.

## Verification

**Evidence, ownership and scope.**

BNM line 1400 requires finite generation as fields, lines 1402–1404 identify the finite morphisms and places, lines 1408–1427 define the truncated total residue and lifted homotopy, and lines 1455–1469 construct the system using finite embeddings of the rational function field. The version and pagination agree with the existing reference: arXiv:2404.06271v2, §6, printed pp.35–36. The neighboring results retain their separate generalities: RSR lines 185–208 give arbitrary-base affine residue exactness, perfect-base cohomological norms and smooth complex-curve reciprocity; BOL lines 181–188 and 238–240 use finitely generated one-variable function fields for the weight-three functorial system. These three texts were read from legal arXiv copies under the README's existing citation keys.

At the specified pins, `TauCeti/FieldTheory/FunctionField/Basic.lean:49` defines the intrinsic predicate by `∃ x : F, Transcendental k x ∧ FiniteDimensional k⟮x⟯ F`. Its parameter theorem is at line 62, finite generation at line 91, transcendence degree at line 123, and the converse under `Algebra.EssFiniteType k F` at line 192. It is an explicit proposition, not a typeclass, and does not impose algebraic closedness or characteristic zero; those remain separate hypotheses of the reciprocity system. `TauCeti/FieldTheory/FunctionField/Place/Zeros.lean:461` explicitly takes this predicate for finite support, including the library's empty support at the junk value zero. Mathlib's chosen-parameter `FunctionField` also requires a finite-dimensional extension, at `Mathlib/NumberTheory/FunctionField.lean:58`. The inspected revisions were Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

Ownership was checked by object on main `82e5289`, the board packages and the supplied open roadmap heads. AlgebraicCurves Layer 12B–12C owns the regular proper models, place dictionary and finite-cover correspondence; its models are smooth over the algebraically closed characteristic-zero bases used here. K2SymbolsBrauer §§9.11 and 10.29 retain general Milnor residues and reciprocity, K3BlochGroups §§3.13–3.16 retain the extended symbol carriers, and Polylogarithms retains its existing polylogarithmic homotopies and normalization adapters. No new carrier or shared construction is planned here, no declaration is added to another namespace, and no ownership moves to a later supplier. The related occurrences in §§3.3, 4.7, 5.13–5.17 already use individual valuations, rational function fields or proper curve function fields; §5.14 already explicitly requires finite generation. Citation resolution after the edits reports no unresolved roadmap citations or names; the newly cited pinned declarations were also inspected directly.

**Elaborated signatures.**

Every one of the 24 named declarations in `TauCetiRoadmap/Polylogarithms/Suggested.lean` was checked with `#check @name` in one scratch file, which elaborated successfully, and its resulting type was compared with the README. No section binder was lost or changed: number-field assumptions, the totally-real/even-weight assumptions, embedding equivalences, cycle hypotheses, finite matrix indices and both lattice instances remain present. The reciprocity headlines still lack the pre-Bloch/curve-complex/higher-Chow carriers identified in the module docstring, so no replacement Lean statement or predicate was added; `Suggested.lean` is unchanged.

**Adversarial mathematics: every amended assertion.**

Write W=u(2)∧u(3); the 2,3 valuation matrix on the rational constant subspace is the identity, with determinant 1, so W≠0 also after inclusion into U(ℂ). For the infinite extension, write aⱼ²=−j and choose the root aⱼ√(1−t/j); the following entries use exact rational coefficients, not a numerical truncation to infer nonvanishing.

| Statement | Instances tried | Computed values / both sides | Result and change |
|---|---|---|---|
| Function-field convention and finite generation | k(t)/k; k/k; k(s,t)/k; infinite multiquadratic union | Parameter degree 1 and transcendence degree 1; transcendence degrees 0 and 2 for the next two; union has transcendence degree 1 but finite-stage degrees 2,4,8,… | Native predicate admits the first and excludes the other three; finite generation made explicit. |
| Proper curve models and cover direction | ℂ(y), t=y²+1 | Field degree 2; cover ℙ¹_y→ℙ¹_t has two points y=±i over t=0, each residue field ℂ and ramification index 1 | Imported from AlgebraicCurves Layer 12B–12C; no local reconstruction. |
| Supplied parameter and finite-generation APIs | k(s) with parameters s and s² | Degrees [k(s):k(s)]=1 and [k(s):k(s²)]=2; one field generator over k | Both parameter choices give finite extensions; the condition is independent of a chosen rational parameter. |
| Finite support of exterior residues | ℂ(t), t∧2∧3 | Raw residues at (0,∞,other points) are (W,−W,0), with sum 0 | Finite support retained with the explicit function-field hypothesis. |
| Constant-factor residue vanishing | Wedges of units from k | Each local order is 0; each residue and their total are 0 | General individual residues remain available; no infinite-sum operation introduced. |
| Residue-field target | ℚ(t), place t²+1 | Residue field ℚ(i) has degree 2 over ℚ; specialized i has D(i)>0 | Target written T(κ(v),n−1)[−1], avoiding identification of residue field and constant field. |
| Shift signs and chain identity | n=3, [3]₂⊗t; n=4 component signs | n=3 components are (+1,−1), and both sides of the chain identity are −u(2)∧u(3); n=4 components are (−1,+1) | Existing sign convention retained in the qualified API. |
| Shifted total residue | Degree-three t∧2∧3 over ℂ(t) | Shifted residues are (−W,W,0); total 0=−(W−W) | Finite-support Check records both sign conventions. |
| Homotopy domain and lowest permitted weight | m=2 and m=3 over k(t); m=0,1 | First target is B₂(k) at m=2, and (B₂(k)⊗U(k))/im d at m=3; target indices m−2 are 0 and 1 | m≥2 retained explicitly; no negative exterior degree or extra incoming quotient at m=2. |
| Rational normalization and exclusion of zero/rescaled systems | m=2, a=i; m=3, a=3,c₄=5 | h(input)=−[i]₂ with period −D(i)≠0; at m=3 its shifted boundary and residue each evaluate to −1 on the 2,3,5 determinant | Zero and twice-normalized systems fail the first value; normalization and the full-system uniqueness quantifier retained. |
| Degree law and lifted-norm tower | Identity; t=s²; degrees 2 then 3 | Coefficients 1,2,6; normalized restriction divides 2h by 2 to give h; 2·3=6 | Same finitely generated category on every field in the law and tower. |
| Finite-cover construction | k(t)⊂k(s), t=s²; identity parameter | Cover degree 2 versus 1; inverse degree factors 1/2 versus 1 | Both denominators are nonzero in ℚ; no normalization by an infinite extension degree. |
| Infinite extension degree | Adjoin √(t−j), j=1,2,3 | Orders of t−j at t=j give the 3×3 identity mod 2; extension degrees are 2,4,8 | Unbounded degree excludes finite generation of the union. |
| Distinct branches give distinct discrete places | j=1,2,3 at t=0 | √(1−t/j) begins (1,−1/2,−1/8), (1,−1/4,−1/32), (1,−1/6,−1/72); squaring gives coefficients (1,−1/j,0) | Positive-root differences have order 1; negative-root differences have constant −2aⱼ≠0 and order 0, distinguishing valuations. |
| Nonzero infinite residue support | Every independent branch choice on the union | v(t)=1; residue field ℂ; raw residue W has determinant value +1 at every place, shifted residue −W has value −1 | The infinite algebraic sum is undefined; the new negative-control Check excludes its field. |

**Native acceptance statements: concrete agreement controls.**

Here G=D(i) is Catalan's positive constant. These controls accompany the comparison of the elaborated types; they do not replace the roadmap's general theorem statements.

| Declaration | Instances tried | Computed values / both sides | Result and change |
|---|---|---|---|
| polylog | z=0, n=0,1,2; z=1,n=2 | 0,0,0; Li₂(1)=π²/6 | Endpoints match; unchanged. |
| singleValued | n=2,3; z=1,−1 | L₂(1)=L₂(−1)=0; L₃(1)=ζ(3), L₃(−1)=−3ζ(3)/4 | Parity and endpoint match; unchanged. |
| blochWigner | z=i,−i,1 | G,−G,0 | Argument sign and real values match; unchanged. |
| unitVector | 0,1,2,3 | u(0)=u(1)=0; prime-valuation matrix on u(2),u(3) is identity | Guarded zero branch and nonzero units match; unchanged. |
| FiveTermFunction | b=0; b indicator of 2 at (x,y)=(2,3) | Five-term sums 0 and 1−0+0−0+0=1 | Universal relation distinguishes the bad model; unchanged. |
| trilogCyclic | b=0; b=1; a=c=d=1 | Cyclic block values 0 and 2 | Real-body cyclic formula distinguishes zero and constant functions; unchanged. |
| TrilogRelationFunction | b=0; b=1 | Endpoint 0=0 versus 1≠0; three-term equality 0=0 versus 3≠1 | Genuine relations, not a free predicate; unchanged. |
| IsCycle3 | Raw [1], zero sum, raw [3] over ℚ | Boundary values 0,0,(u(2)∧u(3))⊗u(3); valuation detector gives 1 on the last | Kernel condition matches the README; unchanged. |
| periodMatrix | ℚ, n=3, one embedding, family [1]; zero family | Matrices [ζ(3)] and [0] | Rows, columns and rational coefficients match; unchanged. |
| normalizedPeriod | ℚ, n=3, [1]; ℚ, n=2, empty family | ζ(3); π²·det(empty)=π² | Discriminant and empty determinant match; unchanged. |
| lobachevsky | 0,π/2,π/4 | 0,0,G/2 | Integral and Fourier normalizations match; unchanged. |
| blochWigner_lobachevsky | z=i | Angles (π/2,π/4,π/4); RHS 0+G/2+G/2=G=LHS | Upper-half-plane hypothesis retained; unchanged. |
| idealRegion | z=i, w=(1+i)/4, h=1,1/10; real z | Circumcenter (1+i)/2, radius squared 1/2; face expressions 9/8≥1/2 and 27/200<1/2; real region empty | Geometric domain matches; unchanged. |
| signedIdealVolume | z=i,−i, real z | Orientation factors +1,−1,0; volumes G,−G,0 | Positive product measure and orientation agree; unchanged. |
| idealRegion_finiteVolume | z=i, infinity cusp cutoffs H=1,2 | Base area 1/2; tails 1/4 and 1/16 from A/(2H²) | Finite cusp tail and factor four agree; unchanged. |
| idealTetrahedron_volume | z=i,−i | Both sides G and −G, respectively | Conjugation and signed formula agree; unchanged. |
| blochWigner_kummer | z=i; z=2 | Arguments (−1,i,i), giving (0+G+G)/2=G; at 2 both sides 0 | All stated denominators protected; unchanged. |
| singleValued_three_relations | x=1 in three-term relation; a=c=d=1 in 22-term relation | ζ(3)+0+0=ζ(3); each cyclic block ζ(3)/4, so 3ζ(3)/4−3ζ(3)/4=0 | Odd endpoint retained; unchanged. |
| zagier_three_exists | F=ℚ, family [1] | Cycle boundary 0; normalized period ζ(3)=1·ζ(3), q=1≠0 | Embedding and nonzero-scalar requirements match; unchanged. |
| zagier_three_everyFamily | F=ℚ, zero family and [1] | 0=0·ζ(3), ζ(3)=1·ζ(3) | Zero scalar allowed only in every-family statement; unchanged. |
| zagierExistence_totallyRealEven | F=ℚ, n=2,4 | π²=6ζ(2), π⁴=90ζ(4) | Empty determinant and nonzero rational factors match; unchanged. |
| ellipticCharacter | Λ=ℤ+iℤ, γ=1, z=0,i/4 | Covolume 1; character values 1 and exp(πi/2)=i | Positive-covolume sign matches; unchanged. |
| ellipticTrilogSummand | Same lattice, x=y=z=0, triad (1,i,−1−i), then swap last two | Numerators −1+2i and 1−2i; denominator 2; summands −1/2+i and 1/2−i | Nonzero/zero-sum subtype and alternation match; unchanged. |
| ellipticTrilogKernel_summable | Nonzero triads; dyadic large-frequency index s | Balanced shell degree is 4−5=−1; the section's s·2^(−s) majorant has sum 2 for s≥1 | Discreteness and full-lattice instances retained; unchanged. |

**Validation.**

Commit: `cc121bb` — `Polylogarithms: review repairs (require finite generation throughout reciprocity system)`. Only `TauCetiRoadmap/Polylogarithms/README.md` changed; the worktree is clean and nothing was pushed.

`lake build TauCetiRoadmap.Polylogarithms.Suggested` exited 0, with nine `declaration uses sorry` warnings and no other warnings:

```text
Build completed successfully (8976 jobs).
```

The final dependency-direction command exited 0 and emitted no UPWARD, CYCLE or moved line:

```text
depcheck: 33 roadmaps, 311 edges, 0 problem(s)
```

The final full gate exited 0:

```text
gate Polylogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
