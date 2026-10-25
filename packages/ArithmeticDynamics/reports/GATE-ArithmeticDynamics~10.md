## H01 (CBirkbeck) — applied

The signed energy domain is now X_v={ν : ν is finite signed Radon, ν(P¹)=0, and |ν| has continuous potential}, replacing signed-potential continuity in `TauCetiRoadmap/ArithmeticDynamics/README.md:2362`, the Cauchy–Schwarz statement at line 2386, its approximation conclusion at line 2398, and the norm-space argument at line 6919. Lines 2373–2384 supply domination, difference membership and vector-space closure; the same membership justification now appears in §§4.25, 4.27, 4.30–4.32, 4.56–4.57 and Correction 31, and lines 2408–2410 include cancellation, scaling and the atomless counterexample as discriminating Checks.

### Source evidence and ownership

Favre–Rivera-Letelier's integrability lemma requires continuous potential of the trace measure (`favre-rivera-letelier-2006 line 588`, Lemma 2.4, printed p.14), as does its positivity theorem (`favre-rivera-letelier-2006 line 649`, Proposition 2.6, printed p.15). The finite-place counterparts retain that condition (`favre-rivera-letelier-2006 line 1196`, Lemma 4.3; `favre-rivera-letelier-2006 line 1221`, Proposition 4.5, printed p.26). Fili uses the real span of local adelic differences, rather than arbitrary continuous signed potentials (`fili2017 line 464` and `fili2017 line 484`, §3.1, printed p.10). Both texts were read in their legal arXiv versions under the existing README source keys; no missing text is needed for this repair.

Domination is an elementary consequence of positive kernel potentials: for 0≤α≤β, the two finite lower semicontinuous normalized negative-logarithmic potentials add to the continuous potential of β, so each is also upper semicontinuous. This supplies the stronger condition for |ρ−σ|≤ρ+σ without identifying total variation with the sum. No change to the ordinary meaning of a continuous signed potential is used.

Object searches across main, board packages, indexed open heads and the supplied sibling checkouts identify TropicalAndBerkovichArithmetic §6.5 as the finite-place kernel/energy owner, with §3.3 supplying its graph Laplacian. The supplier contract at `TauCetiRoadmap/ArithmeticDynamics/README.md:188` now consumes this energy on the admissible subclass; ArithmeticDynamics retains its existing all-place interface and its membership adapter, with no second analytic carrier or pairing. No ownership move or supplier edge was added.

The pinned Mathlib carrier is `SignedMeasure α := VectorMeasure α ℝ` (`Mathlib/MeasureTheory/VectorMeasure/Defs.lean:63`); its definition imposes countable additivity, not Radon regularity or a potential condition. Its total variation is the sum of its positive and negative Jordan parts (`Mathlib/MeasureTheory/VectorMeasure/Decomposition/Jordan.lean:460`). Searches of Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` found no Hsia or logarithmic continuous-potential energy API to duplicate.

Cross-roadmap resolution against main `7bd35ba` and the indexed heads reports no missing cross-roadmap citation. The eleven supplied citation leads name planned supplier APIs: the four Berkovich methods occur in AlgebraicModuliForArithmeticGeometry §7.10.2, the three complex analytification comparisons in ComplexComparisonPartII §C−1.1, and the four bounded-height APIs in EffectiveDiophantineMethods §0.11; they are supplier targets rather than claims about pinned library declarations.

### Elaborated signatures

All 15 declarations were collected into one scratch signature file with `#check @name` and elaborated through the prescribed module build, then the original `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` was restored byte-for-byte and built again. Each elaborated type was compared with its README statement: no binder or generality changed, including the characteristic-zero field hypotheses in the orbit statements, essential finite type in Lech–Cassels, positive iteration in Ritt, nonsingular-point carrier in the projection, nondegenerate distinct Legendre parameters, both explicit ellipticity instances, and separate finiteness conclusions alongside natural cardinality.

The local energy and adelic pairing carriers remain among the module docstring's missing carriers. The repair therefore adds no auxiliary energy signatures or stand-ins to the acceptance test.

### Computed adversarial pass

Here G=ζ(0,1), H=ζ(0,2), and E denotes the local kernel energy. Circle probabilities over ℂ are denoted λ_r; λ_1 is the standard probability. Every mathematical assertion added or changed by the repair is covered below; unaltered headline signatures were checked for agreement as described above.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Supplier energy domain and Laplacian sign, line 188 | Retracted s on a nonclassical unit segment | Δs=δ₀−δ₁; −∫s dΔs=1=∫₀¹1 ds; the variation has mass 2 on nonclassical endpoints | The imported energy applies with the same sign and admissible domain | Make the domain restriction explicit |
| X_v definition, lines 2362–2367 | ν=0; ν=δ_G−δ_H; ν=δ₀−δ₁ | Masses 0,0,0; E=0,log 2,0 respectively; the last variation has a logarithmic pole at 0 and at 1 | Mass zero and a diagonal-excluded finite value do not imply membership | Require continuous potential of ∣ν∣ |
| Positive domination, lines 2373–2377 | α=0,β=0; α=δ_H,β=δ_G+δ_H; α=δ₀,β=δ₀+δ_G | Zero potentials in the first case; normalized negative-log potentials of α and β at (G,H) both equal (0,log 2); in the last case β's potential at 0 is +∞ | Domination preserves the positive continuous-potential class, but only under its stated premise | Add the domination fact and its semicontinuity route |
| Equal-mass differences, lines 2378–2381 | ρ=σ=λ_v; ρ=δ_G,σ=δ_H | Cancellation gives ∣ρ−σ∣=0≤2λ_v; disjoint support gives ∣ρ−σ∣=δ_G+δ_H with mass 2 and energy log 2 | Equality with the sum is unnecessary and generally false | Add difference membership |
| Regularized difference membership, line 2381 | F={0},ρ=δ_G,r=1/2; limiting r=0 | For r=1/2 the positive factors have mass 1 and difference energy log 2; r=0 would give δ₀−δ_G with a classical singularity | Positive radius and nonempty F matter | State those hypotheses explicitly |
| Real vector-space closure, lines 2382–2384 | ν=δ_G−δ_H; −ν,2ν,ν−ν | E(−ν)=log 2; E(2ν)=4log 2; ∣ν−ν∣=0≤2∣ν∣ and E(0)=0 | Negative scalars and cancellation remain in X_v | Add closure using total-variation domination |
| Piecewise-C² and smooth test membership and energy identity, line 2386 | Tree φ=s²; sphere φ=cos θ on the unit sphere | Tree Δφ=2ds−2δ₁, mass 0, E=4/3=∫₀¹4s²ds; on the sphere the normalized Laplacian has variation mass 2 and Dirichlet energy 4/3 | Both test classes have admissible Laplacians; endpoint flux is retained | Specify Δφ∈X_v |
| Cauchy–Schwarz, line 2386 | Tree φ=s,ν=δ₁−δ₀; constant φ=2 | Squared integrals 1 and 0; Dirichlet-energy products 1·1=1 and 0·1=0 | Equality holds in both cases within the correct domain | Quantify ν∈X_v |
| Mixed continuous and atomic coordinate changes, lines 2386 and 2396 | ν=λ_1−λ_2+δ₀−δ₁, η=2ν, γ(z)=2z | E(ν) changes log 2→3log 2, difference 2log 2=(1²+(−1)²)log 2; E(ν,η) changes 2log 2→6log 2, difference 4log 2 | Atomic corrections persist; the continuous signed part is admissible | Retain the variation condition on each signed part |
| C¹ approximation conclusion, line 2398 | φ_m=s²+s(1−s)/m, ν=δ₁−δ₀, m=1,2,3 | Value/slope errors ≤1/(4m),1/m; energies 1,13/12,31/27→4/3; squared test integrals stay 1≤each energy | Limit passage uses finite ∣ν∣ and the same admissible energy | Retain ν∈X_v in the conclusion |
| Positive-definiteness Check, line 2407 | 0 and δ_G−δ_H | E(0)=0; E(δ_G−δ_H)=log 2>0 | Zero-energy equivalence is valid on X_v | Replace the weaker signed-potential class |
| Domain negative-control Check, line 2410 | Bumps n=2,3 and the infinite family | Variation/C=1/4,1/9, total π²/6−1; absolute self-kernel contributions/C²≥16−log 2/16 and 81−log 2/81; the full sum diverges while g(0)=0 | A continuous ordinary signed potential can lie outside X_v; atomlessness makes diagonal deletion ineffective | Add the counterexample |
| Dynamical-energy Fubini domain, §4.25 | At v=2, f=z² and g=2z², with canonical measures δ_G and δ_H | E(δ_G−δ_H)=log 2; its affine kernel potential is −log 2 at G and 0 at H, so −∫gν dν=log 2 | Fubini and positivity apply to the actual canonical difference | Cite difference membership |
| Regularized lower-bound domain, §4.27 | F={0},ρ=δ_G,r=1/2 at a finite place | Raw energy 0; regularized energy log 2; the bound is 0≥log 2−log 2=0≥−log 2 | The regularized positivity step is justified | Cite difference membership |
| Adelic-pairing finiteness/domain, §4.30 | Standard λ and ρ_p with radius p at its single changed finite place | Only one nonzero local difference; E=log p and global pairing=(log p)/2 | The finite sum consists of admissible local differences | Cite difference membership |
| Weak-convergence route, §4.31 | N-th roots of unity with p∤N, regularized at fixed 0<r<1 | Distinct residue discs give regularized difference energy (−log r)/N→0; a retracted test supported towards 0 and zero at G integrates to 0 against both measures | Regularized differences satisfy the Cauchy–Schwarz premise throughout the limiting argument | Cite difference membership |
| Quantitative route, §4.32 | Same root sets, r=1/N, N≥3 | Local energy=(log N)/N≥0→0; the test integral above is 0 and its Dirichlet bound is nonnegative | Positivity is applied to admissible regularized differences | Cite difference membership at each place |
| Pairing nondegeneracy, §4.56 | ρ=σ=λ; ρ=ρ_p,σ=λ | Local energy and global pairing are both 0 in the first case; they are log p and (log p)/2 in the second | Equality and strict positivity have the intended domains | Cite difference membership |
| Heights along small sequences, §4.57 | Roots of unity for ρ=λ, compared with σ=ρ_p | h_λ=0 for every root; h_ρ_p=(log p)/2 for every root, equal to ⟨λ,ρ_p⟩ | The potential/Fubini step uses an admissible signed difference | Cite difference membership |
| Local norms and global triangle inequality, §4.62 | ρ₂,ρ₃ changing radii at distinct primes; zero difference | d(ρ₂,ρ₃)=sqrt(log 6/2)≈0.946509≤sqrt(log 2/2)+sqrt(log 3/2)≈1.329857; zero difference has norm 0 | The direct-sum norm gives the claimed metric on actual adelic differences | Use the same X_v and its membership fact |
| Positivity formulation, Correction 31 | ν=δ_G−δ_H; equal positive measures | E(ν,ν)=log 2>0; E(ν,−ν)=−log 2<0; equal-measure difference has E=0 | Positivity is self-energy on the admissible class, not arbitrary cross-energy | Retain total variation and positive equal-mass hypotheses |

### Validation and commit

Committed as `e1dd455` — `ArithmeticDynamics: review repairs (preserve total-variation energy domain)`. Only `TauCetiRoadmap/ArithmeticDynamics/README.md` changed; `Suggested.lean` is unchanged, the worktree is clean, and nothing was pushed.

`lake build TauCetiRoadmap.ArithmeticDynamics.Suggested` exited 0, with eleven expected declaration-uses-sorry warnings and no errors. Exact completion line:

```text
Build completed successfully (8976 jobs).
```

Dependency-direction output (exit 0; no UPWARD or CYCLE line):

```text
depcheck: 47 roadmaps, 537 edges, 0 problem(s)
```

Final gate summary (exit 0):

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
