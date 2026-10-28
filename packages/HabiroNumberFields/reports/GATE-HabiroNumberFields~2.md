## H01 (CBirkbeck) — applied

The unqualified exterior-boundary factorization and Bloch-class vanishing in `TauCetiRoadmap/HabiroNumberFields/README.md:364` and `TauCetiRoadmap/HabiroNumberFields/README.md:372` now require odd n; the one-stage Kummer extension is explicit at line 362, and the all-order P construction, invariance, squared inversion and independent Chern torsors retain their scope. The new Check at line 378 computes P(1/2)=(2+√2)/4 and its cyclic-quartic square-root field, proving nonzero descent obstruction despite zero exterior boundary (CGZ line 416, line 534, line 555 and line 605; K3BlochGroups §3.13).

## H02 (CBirkbeck) — applied

The individual deep-factor assertion in `TauCetiRoadmap/HabiroNumberFields/README.md:716` is replaced by explicit containments Φ^(aE)∈(p^a,f), I^(aE+a−1)⊆(p^a,f), and (p^a,f)⊆I^N when a≥N and f has at least N factors counted with multiplicity. Line 723 contrasts Φ_(p^k)(1)=p with (q+1)^N(1)=2^N, and line 39 names the pinned characteristic-p cyclotomic reduction used in the proof; the completed inverse-system comparison and raw-cofinality warning remain.

## H03 (CBirkbeck) — applied

The claims that the unshifted half-power corrects the printed formula are replaced by agreement with published equation (57) in `TauCetiRoadmap/HabiroNumberFields/README.md:335` and `TauCetiRoadmap/HabiroNumberFields/README.md:339`, with the extraction locators corrected to GZ line 129, line 331 and line 868. The asymptotic, branch, uniformity, Gaussian and phase targets are unchanged; the endpoint Check at line 358 now identifies the vanishing half-power denominator.

**Validation and ownership.** Commit `8617991` changes only `TauCetiRoadmap/HabiroNumberFields/README.md`; `TauCetiRoadmap/HabiroNumberFields/Suggested.lean` is unchanged, and the worktree is clean. No push or external reply was made.

All six declarations were freshly elaborated together using `#check @name` in one scratch file and compared with README §§1.1–1.3. Both definitions retain their coefficient instances; quasi-periodicity retains the field, positive order, primitive root and shift bound; the phase-free theorem retains nonzero n in the field; the difference equation retains both nonsingularity conditions and the hypersurface relation; KMS retains every nonzero, nonsingularity, order and hypersurface hypothesis. No binder was lost and no signature needed changing.

Cross-roadmap names and section locators were re-resolved against main `82e5289` and the supplied open-head index; the mathematical contracts implicated by these findings were reread in the named supplier sections. Ownership was searched by object in main, the board packages and open roadmap heads: the exterior presentation remains K3BlochGroups §3.13; generic completion indices, cofinal changes and Chinese remainder remain HabiroCyclotomicCompletions §§1.2–1.3 and 5.2; completed étale Frobenius remains QWittVectors §6.1; analytic Pochhammer products and bilateral summation remain QSeriesPartitionsAndMockModularForms §§1.2–1.6 and 2.5. The finite P-to-obstruction comparison and the arithmetic p-chain comparison remain this roadmap's §§1.4 and 2.6, rather than duplicate constructions of those supplied objects. No ownership or merge-order move was needed, and no Lean declaration was added.

The pinned libraries used here are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In `Mathlib/RingTheory/Polynomial/Cyclotomic/Eval.lean:41`, `Polynomial.eval_one_cyclotomic_prime_pow` gives evaluation p for every positive prime-power order; `Mathlib/RingTheory/Polynomial/Cyclotomic/Expand.lean:156` gives the characteristic-p reduction with p prime, p∤m and k>0. Tau Ceti's native positive Kummer cocycle is σ(α)α⁻¹ in `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:149`; its absolute-Galois Kummer equivalence does not itself assert the roadmap's one-stage descent-obstruction factorization.

Source checks used the existing legal cached works. CGZ v3 §2.3 explicitly uses the odd-order normalization in its obstruction proof at CGZ line 555; the ordinary exterior convention is confirmed at K3BlochGroups §3.13. The publisher's mathematical markup of GZ (57), p. 235, confirms that the half-power is a denominator, whose fraction layout is flattened at GZ line 868. GSWZ line 297 and W-thesis line 1443 identify the completed local comparison being refined. The review's separate access limitation for Belabas–Gangl is settled by the existing extraction: BG line 1251 fixes d=|Δ|, and BG line 1268 lists d=4 among the trivial tame kernels. No additional source or missing-text request was needed.

**Source bookkeeping outside the edit scope.** The existing GZ `version_note` in the read-only `packages/HabiroNumberFields/sources.toml` repeats the incorrect sign attribution. It needs the corresponding correction to say that published (57) agrees with the negative half-power in README §1.3; that manifest was not edited because only the two roadmap content files were authorized.

**Adversarial mathematics pass.** Rows cover each repaired mathematical assertion and the six retained acceptance declarations; attribution-only changes preserve their formulas.

| Statement | Instances tried | Computed values on the two sides or in the proposed models | Result | Change |
| --- | --- | --- | --- | --- |
| One-stage H=L(a^(1/n):a∈Fˣ) | F=ℚ, n=1,2; cyclic-quartic candidate at n=2 | n=1: H=ℚ; n=2: every Galois element squares to 1, whereas the candidate generator has order 4 | The quartic cannot enter H by iterating radicals | Definition made explicit |
| Normalized all-order P | X=1/2, n=1,2 | n=1: D(x)=D(1)=P=1; n=2: D(1)=2 and P=1/2+√2/4 | Denominator is nonzero; order zero and characteristic dividing n remain excluded | All-order domain retained |
| All-order Kummer invariance | n=2, X=1/2 and its conjugate | P̄/P=3−2√2=(√2−1)²; P̄≠P as representatives | Class invariance holds without descent | Basic law clarified |
| Inverse cyclotomic root law | F=𝔽₁₉, n=5 in 𝔽₃₆₁=𝔽₁₉[u]/(u²−2), ζ=7+9u, X=3, x=10 | P_ζ=2+2u, P_(ζ²)=3+4u; their class indices are 4 and 2 modulo 5, with 3·4=2; ratio to P_ζ³ has 72nd power 1, ratio to P_ζ² has 72nd power 7+10u≠1 | Exponent 3=2⁻¹ holds; exponent 2 fails | Root-law scope retained |
| Odd exterior factorization, including repeated basic law | Degree-one diagonal cup on C₂ and C₃ | Exterior a∧a=0 in both; on C₂ cup(1,1)=1 while every normalized coboundary there is 0; on C₃ cup values at (1,1),(1,2),(2,2) are 1,2,1, equal to the coboundary of h=(0,0,2) | Diagonal cup can survive at 2 and dies at odd order | Odd n required in both occurrences |
| Boundary-zero vanishing and quadratic negative control | F=L=ℚ, n=2, [1/2]; t²=2+√2 | Exterior boundary=0; g(t)=0 for g=T⁴−4T²+2; g(t³−3t)=0 and σ²(t)=−t; [P]≠1, while the image of ℚˣ/ℚˣ² is {1} | Connecting obstruction is nonzero | Negative Check added; vanishing restricted to odd n |
| Universal versus finite-witness comparison | n=2, class 2 over ℚ; trivial finite witness | ℚˣ/ℚˣ² contains [2]≠1, but H¹({1},μ₂)=0; in universal H, restriction of [2] is 1 | A trivial finite witness cannot supply the claimed universal isomorphism | Coprimality and finite-image qualifications retained |
| Squared inversion versus odd inversion | n=1,2,3,4 in the exponent calculation | T=n(n−1)/2 gives 0,1,3,6; 2T gives 0,2,6,12, divisible by n; at n=3 also T=3 is divisible by n | Squared inversion remains all-order; odd inversion is stronger | No restriction added to raw inversion |
| Characteristic-p cyclotomic reduction and e(k) | (p,m,k)=(2,1,0),(2,1,1),(2,1,2),(3,1,1),(2,3,2) | Reductions are Φ₁, Φ₁, Φ₁², Φ₁², Φ₃² respectively; the last is q⁴+q²+1 on both sides | k=0 is separately e(0)=1; positive k uses the pinned theorem | Exact supplier and exponents specified |
| Product reduction f≡Φ^E | p=2,m=1, f=(q−1)(q+1); empty product | With x=q−1, f=x²+2x≡x² and E=2; empty f=1 has E=0 and zero quotient | Positive E requires a nonempty product | Multiplicities and nonemptiness explicit |
| Φ^(aE)∈(p^a,f) | p=2,m=1,f=q+1,E=1,a=1,2,3; f=Φ₄,E=2,a=2 | x^a at q=−1 is −2,4,−8, giving 0 modulo 2,4,8; for Φ₄, x⁴≡−4≡0 modulo 4 | Power containment survives finite reduction | Finite-level containment explicit |
| I^(aE+a−1)⊆(p^a,f) | p=2,f=q+1,E=1,a=1,2,3 | Exponents are 1,3,5; all monomial generators evaluate to 0 modulo 2,4,8 respectively | Both p-heavy and Φ-heavy monomials vanish | Second containment explicit |
| Individual factors belong to I, not uniformly to I² | p=2,3,m=1,k=1,2,3 | Evaluations are 2,2,2 and 3,3,3; all I-orders are 1, whereas evaluation of I² is divisible by 4 or 9 | Increasing depth does not imply I²-smallness | False proof step deleted |
| Product length counts repetitions | p=2,m=1, f=(q+1)^N, N=0,1,2,3 | In x=q−1 the coefficient lists are [1], [2,1], [4,4,1], [8,12,6,1]; I-orders are 0,1,2,3; evaluations are 1,2,4,8 | f∈I^N and f∉I^(N+1), even with repeated identical factors | Product-length Check added |
| (p^a,f)⊆I^N and completed comparison | p=2,N=a=1,2,3, f=(q+1)^N; a=1,N=2 control | Both generators have I-order N in the admitted cases; scalar 2 has order 1 in the control; B/(q+1)=ℤ₂ has rank 1 and B/(1)=0 has rank 0; scalar 2 maps to 2≠0 modulo q+1 | a≥N is necessary for this argument; raw ideals cannot replace the double system | Bounds explicit; p-completeness retained |
| Radial asymptotic and negative half-power | x=0 for arbitrary n; n=1,x=−1, ε=0.1,0.05,0.025; x=1 endpoint | x=0 gives 1=1; normalized values 0.704166632,0.705635176,0.706370595 approach 1/√2=0.707106781, rather than √2=1.414213562; endpoint denominator=0 | Formula and branch stay unchanged; denominator at the cut endpoint vanishes | Attribution and endpoint wording corrected |
| Product-limit/Gaussian normalization in the attribution passage | n=1, X=1/5,Y=2,Z=−4/5 | S=4/9, C=169/36, prefactor=4/13; (4/13)√C=2/3=√S | The existing scale witness agrees on both sides | Formula unchanged |
| `cyclicDilog` | Orders 0,1,2; ζ=−1,x=2; zero coefficient ring | Values are 1,1,3; at n=2 the reversed orientation gives −1; zero ring gives 0=1 | Empty-product and ring generality agree with README | Signature unchanged |
| `cyclicDilog_quasiPeriodicity` | n=2,s=1,ζ=−1,x=1,2 | Cleared sides are 0=0 and 3=3 | Singular factor is permitted; field, positive n, primitive root and s≤n are retained | Signature unchanged |
| `cyclicDilog_one_pow_twentyFour` | n=1,2; n=3 in 𝔽₇ with ζ=2 | Sides are 1=1, 16777216=16777216, and 1=1 respectively | Nonzero n and primitive-root hypotheses remain explicit | Signature unchanged |
| `cyclicHypergeom` | n=0,1; n=2 over ℚ at (2,3,5); singular (−1,−1,1) | Values are 0,1,23/3; singular total sum=1 versus geometric sum=2 | Total division is retained without asserting cancellation at 0/0 | Signature unchanged |
| `cyclicHypergeom_shift` | n=1 over ℚ at (2,3,1/2); n=2 in 𝔽₁₁ at (2,4,3), ζ=−1 | Sides are 1/2=1/2 and 10=10; in the second case (1−Y)Z=7·9=8=1−X | Hypersurface and nonsingularity binders survive elaboration | Signature unchanged |
| `kms` | Same admitted order-one and 𝔽₁₁ order-two inputs | Cleared sides are 1=1 and 2=2; order-two X=4,Y=5,Z=9 satisfy X,Y≠1 and X≠Y | Even order remains covered by the finite identity, independently of odd Bloch descent | Signature unchanged |

**Build.** `lake build TauCetiRoadmap.HabiroNumberFields.Suggested` exited 0. The only warnings were the four intended `sorry` declarations at lines 45, 52, 64 and 73.

```text
Build completed successfully (8976 jobs).
```

**Dependency direction.** Exit 0; no UPWARD, CYCLE or moved line.

```text
depcheck: 33 roadmaps, 308 edges, 0 problem(s)
```

**Gate.** The final clean-tree run exited 0.

```text
gate HabiroNumberFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
