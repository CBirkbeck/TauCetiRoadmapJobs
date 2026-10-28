## H01 (CBirkbeck) — applied

The general Deligne construction and universal character in §6.0a → imports of MotivicEtaleKTheory §§3.3–3.4, 4.1–4.2 and 7.1, retaining calibration, conjugation/transfer and the infinitesimal comparison here (`TauCetiRoadmap/BorelRegulators/README.md:13`, `:156`, `:722`). Those supplier sections and its downstream contract at `TauCetiRoadmap/MotivicEtaleKTheory/README.md:712` agree at head 9bcd1b6; `TauCetiRoadmap/BorelRegulators/Suggested.lean:25` now describes the same boundary.

## H02 (CBirkbeck) — applied differently

The implicit Coleman identification → the equality reg_∞=κₙ∘ch_D,n on K_(2n−1)(ℂ)⊗ℚ and its embeddingwise and integral-image consequences (`TauCetiRoadmap/BorelRegulators/README.md:728`, `:654`, `:799`), using the same classifying-nerve evaluation as burgos2002 line 4087–4106. ColemanIntegration’s existing Galois lattice theorem and coefficient pairings remain there: making it depend on this roadmap’s arithmetic theorem would reverse the stated supplier order, where ColemanIntegration precedes BorelRegulators; the rank-one normalization is explicitly (t/2)ℤ versus tℤ.

## H03 (CBirkbeck) — applied

The cone isomorphism alone → simultaneous transport of its universal class, evaluation and quotient coordinate, with κ_(f−r)∘S=κ_(r−f), S(r,f,ω)=(r,f,−ω) (`TauCetiRoadmap/BorelRegulators/README.md:726`, `:772`). At weights 2 and 3 the transported values are −P₁(−i)=i and −P₂(−1)=1, preserving burgos2002 line 4024–4036’s evaluation and the exact positive factor two.

## H04 (CBirkbeck) — applied

The compact-fibre comparison formerly after the arithmetic period theorem → §4.5 before §4.6, whose proof and Needs now explicitly consume that comparison and gap:multiplicative-serre-comparison (`TauCetiRoadmap/BorelRegulators/README.md:543`, `:570`, `:583`). The filtered/common-fibre argument supplies the full-group comparison and rank N without arithmetic periods; the bound a−1>4N(2n−1) is unchanged because only individual primitive degrees need comparison, as in borel1977 line 440–461 and line 499–515.

## H05 (CBirkbeck) — applied

Unspecified discriminant phases → δ_F=det(σᵢ(bⱼ)), δ_F²=disc F and the δ_F^(−(2n−1))-normalized embedding wedge, citing the 1980 erratum throughout the intermediate period argument (`TauCetiRoadmap/BorelRegulators/README.md:27`, `:506`, `:570`, `:599`, `:855`; borel1980 line 29–43). For ℚ(i), δ_F=−2i and δ_F⁻³=−i/8, while the final absolute discriminant powers reduce to √Δ_F times the positive rationals Δ_F^(n−1); §5.1 now uses the reality and nonzero absolute determinant of jℝ instead of the uncorrected phase calculation.

---

**Ownership, sources and signatures.** The five points separate the shared-owner, Coleman-map and cone-coordinate issues within finding 1, followed by findings 2 and 3. Ownership was searched by object in main, the board packages, the supplied sibling checkouts and the indexed open-roadmap catalogue; the cited supplier sections were resolved again. No additional open heads were fetched, and ownership against open pull requests without supplied files was not independently checked. The supplied MotivicEtaleKTheory head owns the general construction and expressly leaves the normalization and arithmetic interfaces here. The retained compact arithmetic-period and square-ideal/CE comparisons are specific to this roadmap’s normalization proof, not competing general Deligne or compact-cohomology carriers. No ownership was moved to a later supplier and no Lean declaration was given another roadmap’s fully qualified name.

Mathlib 6b7abb3 and Tau Ceti a91d3aa were checked at the manifest pins. In particular, `CSA` in `Mathlib/Algebra/BrauerGroup/Defs.lean:40` carries centrality, simplicity and finite dimension; `TauCeti.Algebra.IsSplittingField` in `TauCeti/Algebra/CentralSimple/Splitting.lean:120` permits an existential matrix size 0 for general algebras, which the division hypotheses exclude. `IsZLattice` in `Mathlib/Algebra/Module/ZLattice/Basic.lean:433` requires both a separate discrete topology and full real span. `TauCeti.Hodge.tate` in `TauCeti/Geometry/Hodge/Tate/Basic.lean:91` is a Hodge structure, not the scaled coefficient lattice. Searches of the pinned objects found no general real Deligne/K-regulator carriers that would make the omitted Layer 6 headlines statable.

All four declarations were elaborated together with `#check @name` and compared with README §§1.3, 3.1, 3.2 and 5.1. The field and number-field instances, hZ/hseries, n≥2, positive division degree, evenness and total-reality hypotheses all remain in the elaborated signatures; no binder or theorem type changed. The Lean edits update only the ownership/missing-carrier explanation and the erratum citation, with no substitute declarations.

The erratum was read from its legal Numdam copy, including its displayed determinant and the corrected equation numbers. Its single source key is borel1980; the source record, including its legal-fetch metadata, is prepared in the job scratch `sources.toml` because the authorized repository edits exclude a source manifest. The remaining references use their existing keys; weil1961 remains waived and beilinson1985 remains uncertified, with neither reopened. The moved general constructions no longer carry their separate Burgos94/BKK/BF reference blocks here.

**Adversarial pass.** Each row records computed instances of a statement or defining law; these are tests of scope and normalization, not substitutes for the cited general proofs. “Retained” records that the computed instance required no mathematical change.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 Tate fixed coordinates | ℚ, n=2,3; ℚ(i), n=2,3 | Real coordinate t=−t forces 0 at n=2; t=t at n=3; imaginary pairs (t,−t), (t,t) each give dimension 1 | Correct parity and complex-pair count | Retained |
| §1.1 normalized lattice and measure | Generator in weight 3; tℤ; dimension 0 | (−4π²)/(−4π²)=1; covolume(tℤ)=abs(t); empty determinant=1 | No unscaled or zero empty value | Retained |
| §1.2 restriction and trace | ℚ(i)/ℚ, n=2,3; identity extension | T(t,−t)=0; T(R(t))=2t; identity gives t | Full sum, not average | Retained |
| §1.3 native analytic order/leading coefficient | ℚ, n=2,4 | d=0; (−1/12)/(1/6)=−1/2; (1/120)/(1/90)=3/4; 0!=1 | Nonzero rational factors; no derivative denominator 0 | Types retained |
| §1.3 arbitrary value at 1 and excluded weight | Z(1)=0 or 7; ℚ,n=1 | Both give the same germs at −1 and −3; actual order at 0 is 0 versus the proposed odd-weight rank 1 | No constraint at 1 needed; n≥2 needed | Retained |
| §2.1 Chern calibration | ε₂, ε₃ | Rational values 1,1; twisted values −4π²,−8π³i; doubled values −8π²,−16π³i | Zero and doubled maps excluded | Retained |
| §2.2 additive regulator and torsion | x=0; mx=0, m>0 | r(0)=0; mr(x)=0 implies r(x)=0 in a real vector space | No integral torsion image | Retained |
| §2.3 real isomorphism dimensions | ℚ weights 2,3; real quadratic weight 3 | Source/target ranks (0,0), (1,1), (2,2) | All embeddings and both parities retained | Retained |
| §2.3 transfer law and sufficient range | ℚ(i)/ℚ,n=3; N=1,q=5 | TR(t)=2t=[E:F]t; a=22 gives 21>20, a=21 gives 20=20 | Degree factor 2 and strict sufficient bound | Retained |
| §3.1 native period=index | Split class; invariants (1/2,1/2), (1/3,−1/3) | Period/index (1,1), (2,2), (3,3); dimensions 1,4,9 for division representatives | Split period is 1, not 0 | Types retained |
| §3.1 admissible invariant family | Single invariant 1/3 versus opposite pair | Sums 1/3≠0 and 0 in ℚ/ℤ | Single-place family excluded | Retained |
| §3.2 native division existence | a=1,2,3; a=0 | F has dimension 1; two finite invariants give dimensions 4,9; a=0 demands dimension 0 for a nonzero division ring | Degree-one endpoint included; degree zero excluded | Types retained |
| §3.2 infinite splitting | Indefinite quaternion versus Hamilton quaternion | Infinite invariant 0 gives M₂(ℝ); invariant 1/2 gives ℍ | Hamilton case excluded | Retained |
| §3.3 rational gauge scaling | ℚ, ω→2ω; ℚ(i),h=3 | Infinite/finite multipliers 2 and 1/2, product 1; 4^(−3/2)·2³=1 | One discriminant factor | Retained |
| §3.4 norm-one mass | Division degrees 2,3; degree 1 | Group dimensions 3,8 and Tamagawa mass 1; degree 1 gives point dimension 0, excluded from absolute almost simplicity | No torus substitution | Retained |
| §3.5 all finite factors | SL₂ over 𝔽₂,𝔽₃; SL₃ over 𝔽₂; q=1 | 6/8=3/4; 24/27=8/9; 168/256=21/32; q=1 gives 0 and is excluded | Small primes and denominator hypothesis respected | Retained |
| §3.6 finite-index volume | Subgroup index 3 | Finite mass m_f/3 and infinite volume 3v give product v·m_f=1 | Direction fixed | Retained |
| §4.1 indecomposable quotient | Λ(x₃,x₅); k[u₂]; k | H⁸ dimension 1 but Q⁸ dimension 0; u₂² maps to 0 in Q⁴; Q(k)=0 and det=1 | Quotient, not full cohomology | Retained |
| §4.2 degree correction | q=0,1,2,3,5 | 1,i,−1,−i,i; i·(−1)=−i=i³ | Multiplicative correction, no constant odd-degree phase | Retained |
| Conventions: ordered discriminant | ℚ; ℚ(i), basis (1,i) | δ=1 and δ²=1; det[[1,i],[1,−i]]=−2i, square −4=disc, absolute value 2=√4 | Signed square root required before absolute value | Added explicit convention |
| §4.3 rational Lie generator | ℚ(i), n=2,3 | δ⁻³=−i/8, δ⁻⁵=i/32; absolute values 1/8=4^(−3/2), 1/32=4^(−5/2) | Compact discriminant exponent correct | Corrected ordered normalization |
| §4.3 embedding-order independence | Swap the two embeddings of ℚ(i), n=2 | New δ⁻³=i/8 and new wedge=−old wedge; product =−i/8 times old wedge | No orientation mismatch | Added Check |
| §4.3 compact absolute period | ℚ,n=2; ℚ(i),n=2 | Classes π²·ℚ_>0 and (π⁴/8)·ℚ_>0; abs((2πi)²)/π²=4 | Nonzero compact determinant | Clarified absolute convention |
| §4.4 normalized cumulative wedge | ℚ(i), j=1,2 | Total primitive degrees 3 and 8; δ⁻³=−i/8 and δ⁻⁸=1/256; gauge absolute factors 4^(−3/2)=1/8 and 4⁻⁴=1/256 | Same δ in every primitive wedge | Made normalization explicit |
| §4.4 compact-cycle dimensions | N=1,j=1,2; N=2,j=1 | N(j²+2j)=3,8,6 | Field degree factor present | Retained |
| §4.4 representation restriction | j=1,2; N=1,2 | (j+1)^(jN)=2,9,4,81 | Restriction factors nonzero | Retained |
| §4.4 lower-generator ideal | Λ(x₃,x₅), earlier wedge x₃ | x₃∧x₃=0; x₃∧(x₃x₅)=0; x₃∧x₅≠0 | Only the specified ideal is killed | Retained |
| §4.5 compact and arithmetic exact sequences | ℚ,n=2,3; ℚ(i), either parity | Ranks (base,full,fibre)=(0,1,1),(1,1,0),(1,2,1); base+fibre=full in each case | Full-group rank N precedes periods | Moved before §4.6 |
| §4.5 common-fibre determinant | Fibre ranks 0 and 1 | det(id₀)=1 and det(id₁)=1; replacing id₁ by 2 gives 2 | Exact identity needed for cancellation | Explicit prerequisite |
| §4.5 independence of lifts | Triangular change [[1,2],[0,1]] | det=1·1−0·2=1 | Splitting choices do not change determinant | Retained |
| §4.5 low-degree range | N=1,n=3,a=23; even a=22 | q=5; 22>20 and 21>20; cumulative degree 3+5=8>5; extra even SO₂₂ Euler degree 21>5 | No total-degree strengthening | Added discriminating Check |
| §4.6 successive determinant quotient | j=0,1,2 | ζ_F(2)/1=ζ_F(2); ζ_F(2)ζ_F(3)/ζ_F(2)=ζ_F(3), denominator positive | Cumulative pairing gives individual zeta factor | Named §4.5 and filtered comparison |
| §4.6 full versus relative rank | ℚ,n=2 | Full indecomposable rank N=1 while relative rank d=0 | Relative supplier alone insufficient | Bridge explicit |
| §5.1 absolute discriminant reduction | ℚ(i),n=2,3 | Δ^((2n−1)/2)=8,32; √Δ=2; quotients 4,16=Δ^(n−1) | Same final rational class | Replaced phase reconstruction |
| §5.1 empty comparison | ℚ,n=2; ℚ(√5),n=2 | Empty determinant 1; ζ(2)/π²=1/6, quotient 6; √5ζ_F(2)/π⁴=2/75, quotient 75/2 | Rank zero is substantive, not zero determinant | Retained with absolute argument |
| §5.1 native positive rational value | ℚ,n=2,4; totally real quadratic n=2 | q=1/6,1/90,2/75; each >0 | Evenness and total reality retained | Only erratum docstring changed |
| §5.2 homotopy/Tate conversion | ℚ,n=2,3,5; imaginary quadratic n=2 | Covolumes 1,4π,2π,2π; at n=1 SU/SO has π₁=0 instead of required rank 1 | Weight-one homotopy claim excluded | Retained |
| §5.3 integral versus rational image | Rank 1 with coordinate t≠0; rank 0 | Integral tℤ has covolume abs(t); rational tℚ has nonzero t/m→0; rank-zero covolume 1 | Rational span not a lattice | Same-map citation made explicit |
| §5.4 determinant normalization | ℚ,n=3 | Cohomological π exponent −3 versus regulator exponent 1−3=−2; conversion factor 4π | No cohomology/Tate conflation | Retained |
| §5.5 S-integers and orders | S empty; index m=2; rank 0 | Integral-image ratio 1; order-image covolume 2abs(t); rank-zero index and covolume 1 | No artificial deleted primes or inverted index | Retained |
| §6.0a universal calibration and block stabilization | ε₂, ε₃; trailing identity | Values 1 and 1; adding identity adds 0 in positive degree; zero/doubled classes give 0/2 | Shared character fixed by Chern normalization | Construction replaced by comparison |
| §6.0a cone chain map | r=1+2i, f=3−4i, dω=7−2i | −(r−f−dω)=9−8i=(f−r)+dω | S commutes with differential | Coordinate transport explicit |
| §6.0a point cohomology | n=2,3; n=0 | Positive weights have H⁰=0,H¹ of real dimension 1; n=0 has kernel {(r,r)}, dimension 1, and cokernel 0 | No weight-zero quotient stand-in | Retained |
| §6.0a transported point evaluation | n=2,ω=i; n=3,ω=1 | −P₁(−i)=i=P₁(i); −P₂(−1)=1=P₂(1) | Raw untransported coordinates would give −i,−1 | Added explicit sign witness |
| §6.0a conjugation and real descent | Imaginary pair, weight 2; real point, weights 2,3 | Conjugate-and-swap fixes (i,−i); fixed real targets have dimensions 0,1 | Both actions required | Retained on imported complexes |
| §6.0a finite trace and projection formula | Two points; degree-two cover | Trace(i,2i)=3i; trace(i,i)=2i=2·i | Average would give i | Explicit source/target and sheet-sum law |
| §6.0a trace uniqueness and towers | Identity; empty cover; degrees 2 then 3 | i→i; empty sum 0; successive sums 2i→6i equal degree-six trace | Zero/rescaled traces excluded | Added Check and trace law |
| §6.0a smooth/étale scope | Spec ℂ[ε]/ε²→Spec ℂ | ε²=0 with ε≠0; relative differentials contain dε≠0, so map is not étale | Nilpotent cover excluded, not silently used as two sheets | Hypotheses explicit |
| §6.0a Adams/Chern compatibility | Character polynomial ch₃=x³/6, ψ²:x→2x; a=1 | At x=1, ch₃=1/6; ch₃(2)=4/3=8·(1/6); a=1 gives 1 | Compatibility does not assume K-theory pure weight | Retained on shared character |
| §6.0a Coleman equality | Integral image of a class with normalized quotient [z]; n=2,z=i; n=3,z=1 | Both evaluation presentations give i and 1; after §6.2 a Borel coordinate t gives t/2 on both | Same universal class and point map, not ranks | Added exact equality |
| §6.0b square-ideal definition | GL₁ in degree 1 | In ℂ[t,t⁻¹]/(t−1)², x=t−1≠0,x²=0; in ℂ[[x]], x²≠0 | Completion is wrong model | Retained |
| §6.0b CE comparison | Trivial group; complex GL₁; its real Lie algebra; sl₂ | Dimensions (1,0,0),(1,1,0),(1,2,1); for [e,f]=h, d(h*)(e,f)=−1 | No complex/real conflation or all-zero nonabelian differential | Retained |
| §6.0b evaluation projection | Weight 2 or 3, z=1+i | Values i and 1 in both transported presentations; degree-zero constant stays 1 | Projection transported with S | Explicit transport clause |
| §6.1 quotient projection and inverse | n=2,3; z=1+i | P₁(z)=i, difference 1∈ℝ(2); P₂(z)=1, difference i∈ℝ(3); P₁(i)=i,P₂(1)=1 | Both inverse identities | Clarified quotient representative |
| §6.1 positive-weight boundary | n=1; erroneous natural subtraction at n=0 | P₀(1+i)=1; at n=0, P₀(1)=1≠0 despite 1∈ℝ(0) | n>0 necessary for point model | Retained |
| §6.1 integral structure | Generator (2πi)^(n−1); generator of ℤ(n) | Selected divided coordinate 1; ℤ(n) quotient image 0 | Correct twist shift | Retained |
| §6.2 Borel=twice Beilinson | Rank 1; zero rank | t=2·(t/2); det(id₀)=1=2⁰·1 | Exact positive factor | Coleman map linked explicitly |
| §6.2 determinant and lattice ratio | Rank 2 with Borel matrix diag(2,3); rank 1 with t | det_Bo=6, det_Be=3/2, ratio 4=2²; covolumes abs(t),abs(t)/2 | Same-basis and same-integral-source requirements | Integral Coleman comparison explicit |
| §6.3 Adams consequence | ℚ,n=3,a=2; real quadratic; ℚ,n=2 | Scalar 8 and determinants 8,64,1; a=1 gives 1 | Rank-zero determinant not 4 | Retained |

**Validation.**

Commit: `b8bd21c` — `BorelRegulators: review repairs (ownership, regulator identification, comparison dependencies and discriminant normalization)`. Only the two authorized repository files changed; the working tree is clean and nothing was pushed.

Build: `lake build TauCetiRoadmap.BorelRegulators.Suggested` — exit 0. Exact output:

```text
⚠ [9010/9010] Built TauCetiRoadmap.BorelRegulators.Suggested (2.5s)
warning: TauCetiRoadmap/BorelRegulators/Suggested.lean:51:8: declaration uses `sorry`
warning: TauCetiRoadmap/BorelRegulators/Suggested.lean:77:8: declaration uses `sorry`
warning: TauCetiRoadmap/BorelRegulators/Suggested.lean:86:8: declaration uses `sorry`
warning: TauCetiRoadmap/BorelRegulators/Suggested.lean:104:8: declaration uses `sorry`
Build completed successfully (9010 jobs).
```

Elaborated-signature check — exit 0; all four `#check @name` outputs match the README and retain their explicit hypotheses.

Dependency-direction check — exit 0; full output, with no UPWARD or CYCLE line:

```text
depcheck: 33 roadmaps, 301 edges, 0 problem(s)
```

Gate against `origin/main` after committing — exit 0; exact summary line:

```text
gate BorelRegulators: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
