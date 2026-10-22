# Repair report: GanGrossPrasadUnitaryGroups

## F01 (P2) — applied

Broad field-form request → import GeometryOfNumbersAndQuadraticArithmetic §2.9’s carrier and adjoints; retain only the additional quadratic-étale module and unitary geometry in `gap:hermitian-unitary`. Add `hermitianFieldCarrierEquiv`, its API and three Checks in §1.1; use it in §§1.3 and 3.4. Update the gap’s `needs`/`detail` and the `ggp` manifest citation. Preserve all field, split, signature and rank boundaries.

## F02 (P3) — applied

Plain or bold target/API identifiers → code spans throughout `packages/GanGrossPrasadUnitaryGroups/README.md`, including headings, API and Check labels, repeated prose references, pinned declarations and the `GGP.8` export label. Identifier spellings, mathematical assertions, Checks and source locators are preserved. A comparison after stripping identifier formatting isolates precisely the F01 changes.

## Mathematical verification

F01 is supported by `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1184` and `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean:750`, read at supplier revision `01c64f0cc5f154a3d190697951ead2fffc2af693`. The carrier requires a field with involution and finite-dimensional module; it imposes no local-field or odd-residue restriction. Its sign +1 specialization has conjugate-first form. Its README names the adjoint characterization, uniqueness, identity, composition reversal and involutivity. MetaplecticAutomorphicForms §3.3 independently uses the same field carrier and separates split coefficients.

Here is the comparison proof. Given the supplier’s form k, put h(x,y)=k(y,x). Commutativity gives h(ax,by)=a c(b)h(x,y), and Hermitian symmetry gives the required conjugate symmetry. Swapping again recovers k. Symmetry turns left separation into right separation, including on the zero module. Form-preserving linear equivalences agree after exchanging the variables, and k(s,x)=0 iff k(x,s)=0 identifies the orthogonal submodules. If T* is the supplier adjoint, then h(Tx,y)=k(y,Tx)=k(T*y,x)=h(x,T*y), using Hermitian symmetry twice. Thus the adjoint is unchanged. The unitary centralizers, moving subspaces and their determinant operators in §3.4 are consequently unchanged.

Pinned witnesses are `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:595` (`LinearMap.Nondegenerate`) and line 656 (`LinearMap.flip_nondegenerate`), and `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean:48` and line 54 (`Submodule.orthogonalBilin` and its membership equation). `Mathlib/LinearAlgebra/UnitaryGroup.lean:58` constructs the identity-Gram unitary group; it does not discharge arbitrary-form representability. Object searches at both pins find neither `SignedHermitianSpace` nor `signedHermitianAdjoint`, so the cross-carrier equivalence remains a README target. No unpinned roadmap import or duplicate carrier is added to `Suggested.lean`.

The relevant-complement geometry is checked against ggp line 229–257 and line 1567–1569; the independence of the model from simultaneous form scaling is checked against ggp line 2489–2519. The geometric discriminant convention agrees with bp-arch line 10204–10208, and its induction factor with bp-arch line 10531–10539. These source locators support the relative geometry; the slot comparison itself is the elementary proof above.

For F02, the two reported examples were present as claimed. All original target headings and API/Check identifier labels were inspected, reformatted without renaming, and checked against the original after removing code-span markup. The only remaining non-identifier changes are the F01 import, comparison and dependency additions.

## Adversarial mathematics pass

Each numbered-target row includes its subordinate API, hypotheses and Checks. “Retained” means the attempted boundary cases agree with the stated target, not that the analytic theorem or a supplier gap has been proved. Algebraic characteristic 2 is excluded in the Hermitian theory; dyadic characteristic-zero local fields remain included. The signatures of `splitLineFrame` alone allow every field.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Algebraic conventions | Zero ring, inseparable quadratic algebra, split E, zero module, characteristic 2 | Field/étale/characteristic hypotheses exclude the invalid bases; constant E-rank is preserved in the split and zero cases. | Retained |
| Pairing, action and induction conventions | (i,1), (1,i), ν(h)=i, upper GL₂ at diag(a,1) | Values i and −i; inverse-character integration transforms by ν; δ=abs(a) fixes the half-modulus direction. | Retained |
| Parameter, factor and measure conventions | Degrees 1 and 2, empty parameter, two eigenvalues, Haar factors 2 and 1/2 | Opposite Asai signs differ; empty factors are 1; Frobenius inversion changes both eigenvalues; product-one changes cancel. | Retained |
| Universes and denominators | Zero vector, zero central value, zero rank, algebraic representation without topology | Norm quotients exclude zero; local factors have separate nonvanishing inputs; the global central value is never inverted. | Retained |
| 1.1 relevant pairs and frames | W=0, rank 3, definite and both indefinite real signatures, split (1,0) | Correct ranks and relevance; a nonzero split idempotent cannot frame a line. | Import field carrier; add comparison |
| `hermitianFieldCarrierEquiv` and its five API statements | Complex line with both slot orders, zero module, quadratic extension of Q₂, scalar a=2 and a≠c(a) | Slot values i/−i, zero-rank identity, adjoint c(a); neither omitted conjugation nor inverse adjoint works. Isometries and orthogonals agree by the proof above. | Three comparison Checks added |
| 1.2 Bessel datum | Empty flag, r=2, split upper GL₃, multiplication of simple coordinates | Diagonal model at r=0; root coordinates add; split character uses both x and −y. | Retained |
| 1.3 transport | Identity, composites, simultaneous negation, changed character with frozen coordinates | Transport composes; negation changes the complement sign; freezing coordinates prevents equality. | Use imported carrier through comparison |
| 2.1 model and currying | Trivial group, U(1) weights (1,−1) and (1,1), dense tensor image | Dimensions 1 and 0; currying uses the smooth dual; continuity is required at infinity. | Retained |
| 2.2 invariant distributions | Norm-one scalar, upper GL₂ unipotent, noncommuting matrices | Conjugated inversion fixes the scalar; transpose reverses products; identity is not an anti-automorphism. | Retained |
| 2.3 adjacent bound | U(0) inside U(1), ramified quadratic field over Q₂, split real pair | Scalar multiplicity 1; irreducibility and the field-appropriate representation category remain required. | Retained |
| 2.4 finite-place reduction | r=1, hyperbolic residual W, excluded and allowed support, GL₂ modulus | Auxiliary GL rank 2; Y need not be maximal isotropic; exclusion and unnormalized induction remain essential. | Retained |
| 2.5 archimedean injection | S of dimensions 0, 1 and 2, reducible parameter, both line signs | A common half-plane is needed only for finite S; the irreducible parameter depends on S. | Retained |
| 2.6 multiplicity one | Two independent model vectors, compact wrong weight, dyadic field | Adjacent reduction forbids dimension 2; dimension 0 remains possible. | Retained |
| 2.7 adjacent integration | Compact H of mass a, trivial noncompact split coefficient, fixed logarithmic powers | Compact value a; the nontempered trivial example diverges; relative decay absorbs each fixed logarithmic power. | Retained |
| 3.1 epsilon character | Empty parameter, opposite odd characters, multiplicity-two constituent | Empty epsilon 1; duality gives product −1; the central coordinate can vanish while its generator survives. | Retained |
| 3.2 enhancement transport | Norm and nonnorm scalars, ranks 2 and 1, two successive sign changes | Norm change trivial; even-side generator sign changes; odd-side label does not; two changes cancel. | Retained |
| 3.3 tempered form | Trivial H of mass a, compact inverse/wrong weights, higher codimension, reducible induction | Values a, 1 or 0 as appropriate; higher-codimension regularization and whole induced representation are required. | Retained |
| 3.4 geometric multiplicity | x=1, x=−1 on C, zero quasi-character, compact centralizer without regular nilpotents | Moving determinants 1 and 4; empty germ average is zero; slot exchange changes no determinant operator. | Use imported field forms and comparison |
| 3.5 trace formula | W=0, real noncompact group, proper-Levi induction | Whittaker germs, Schwartz regularization and GL germ multiplier remain necessary. | Retained |
| 3.6 packet Fourier identity | μ=ε, μ=−ε, component group of order 2 | Total masses 1 and 0; Fourier values (1,−1) select the nontrivial enhancement. | Retained |
| 3.7 finite-place packet selection | W=0, quadratic fields over Q₂ and Q₃, wrong enhancement | Fixed complement determines the rank-zero form; wrong enhancement has multiplicity 0. | Retained |
| 3.8 real theta reduction and auxiliary form | Counts (2,1), vanishing companion lift, compact wrong weights, U(0), oscillator weights k and k+1 | Lower Bessel counts (1,0); zero branches stay zero; scalar integrated values 1 and 0, with i/−i slot scaling. | Retained |
| 3.9 real packet selection | Compact U(2) restriction, opposite complement sign, W=0 | Dual-weight interlacing distinguishes 1 from 0; negation transports labels; U(1) remains included. | Retained |
| 3.10 split prediction | GL₀, GL₁, R/C/Q₂, trivial unitary GL₂, ordinary GL₃ coinvariants | Rank zero is direct; unitarity alone is insufficient; ordinary coinvariants of dimension 6 differ from generic dimension 1. | Retained |
| 3.11 split theorem | Adjacent pairs at all places, rank gap 3 at finite and infinite places | Finite higher codimension is included; infinite higher codimension remains a proposition without an exported proof. | Retained |
| 4.1 global period | r=0, ν(h)=i, character nontrivial on rational H | Empty unipotent contributes 1; covariance factor i; the nonrational character cannot descend. | Retained |
| 4.2 local obstruction | A zero local model, local changes 2 and 3, reference scalar a | Global period vanishes in the obstruction branch; changes multiply by 6; reference scalar cancels reciprocally. | Retained |
| 4.3 tensor L-representation | b=0, ranks (2,1), split localization | Dimensions 0 and 4; empty factor 1; split localization has both conjugate-dual factors. | Retained |
| 4.4 fixed-pair conjecture | W=0, central zero, wrong prescribed inner form | Fourier coefficient remains; central nonvanishing is a separate conjunct; no inner form is substituted. | Retained |
| 5.1 normalizers | n=1, split local algebra, zero global central value | Δ₂ has signs η then 1; local factors remain nonzero while the global numerator may vanish. | Retained |
| 5.1a split Whittaker period | GL₂×GL₁, λ-kernel vector, doubled Haar and pairing scales | Reference value is ab times the squared functional; kernel value 0; Haar doubling doubles the raw form. | Retained |
| 5.2 normalized form | Zero vector, scalar multiple, compact H, discontinuous form vanishing on dense tensors | α(0,0)=0 but q(0) is excluded; q is scale invariant; density determines only continuous forms. | Retained |
| 5.3 spherical identity | Split q=2 and eigenvalues 1/−1, nonsplit unramified dyadic rank one, nonspherical ramification | Split raw integral and C are 3; compact nonsplit values are 1; nonspherical data have no spherical evaluation. | Retained |
| 5.4 rescaling | Pairing factor 2, local Haar factors 2 and 1/2, global Haar factor 2 | Pairing and product-one factors cancel; squared global period scales by 4. | Retained |
| 5.5 infinite product | Spherical tail, zero exceptional factor, good place of volume 2 | Coherent finite modification; zero factor remains defined; enlarging S preserves the value. | Retained |
| 6.1 Whittaker periods | n=1, zero vector, central zero, several constituents | Degree-wise Asai signs differ; central zero kills λ but not β; actual constituent counts determine pole orders. | Retained |
| 6.2 relative characters | One-dimensional realization, basis rescaling, zero period, spherical projector | Correct scalar character; basis scalars cancel; zero period gives zero distribution; smoothing interchange uses integrability. | Retained |
| 6.3 spectral contribution | Counts (1,1) and (2,1), repeated constituent, quotient by centre | Coefficients 1/4 and 1/8; repeats are excluded; full split-centre dimension is required. | Retained |
| 6.4 isolated comparison | Transfer zero on other forms, several realizations with one base change, dense infinite transfer | The whole base-change class is isolated first; continuity extends from dense transfers. | Retained |
| 6.5 Euler identity | Local obstruction, product-one comparison constants, three constituents | Both sides vanish without division by periods; constants cancel globally; coefficient 1/8. | Retained |
| 7.1 adjacent nonvanishing | n=1, endoscopic parameter, unsuitable fixed h, nontempered components | h is existential; n=1 and endoscopy are included; no temperedness premise is introduced. | Retained |
| 7.2 stable specialization | One constituent in each degree, n=1 boundary, bad places | n>1 is the stable source range; n=1 comes from 7.1; bad places remain included. | Retained |
| 7.3 refined proposition | Counts (1,1) and (2,1), zero vector, zero mixed pairing | Coefficient varies; positive diagonal norms alone are divided; polarization avoids a mixed denominator. | Retained |
| 7.4 GGP.8 | Central zero, endoscopy, vector/pairing/Haar rescaling | Zero central value forces zero period with defined local terms; normalization tests agree; endpoint is never a premise. | Retained |
| `splitLineFrame` and its theorem | (1,1), (1,0), rational (2,1), characteristic 2 | Norms 1, 0 and 2 distinguish generators from nonzero or norm-one vectors; theorem has all-field scope. | Retained |
| `linearFirstPairing` | Both scalar slot orders, c-scaling, zero space | Values i/−i and first linear/second conjugate-linear scaling; no completeness needed. | Reuse proved witness for field comparison |
| `algebraicBesselModel` and equivariance | Scalar character, trivial group, fixed tensor with target −1 | Covariance uses ν; the fixed tensor is annihilated for target action −1. | Retained |
| `componentCentralElement` and character theorem | Empty index, multiplicity two, two multiplicity-one constituents | Central element records parity; the coordinate-sum character gives 1 on generators and 0 on their sum. | Retained |
| `unitaryConstituentSigns` and cardinal theorem | Empty pair, counts (1,1) and (2,1) | Orders 1, 4 and 8 with both finite-index hypotheses explicit. | Retained |
| `unitaryConstituentCoefficient` and formula | Same counts, possible zero cardinal denominator | Values 1, 1/4 and 1/8; the sign group has an identity, so its finite cardinal is nonzero. | Retained |
| Supplier contracts and their normalizations | Dyadic/split fields, rank zero, opposite characters, Haar quotient factors, zero lifts, empty germ set | Field carrier is imported; remaining contracts retain their named owners, hypotheses and positive/nonzero conditions. The finite genericity gap still excludes the imported archimedean theorem. | Narrow only `hermitian-unitary` |

## Checks and maintainer notes

- Required elaboration: `lake env lean` on `packages/GanGrossPrasadUnitaryGroups/Suggested.lean`, run from the content checkout, exited **0**. Exactly five diagnostics: `declaration uses sorry` at **25:8, 74:8, 121:8, 164:8 and 187:8**. No errors or other warnings. Its sole import is `Mathlib`; no Tau Ceti module build was required.
- Explicit binders: a scratch copy with `#check @name` for all **11** declarations and the two pinned comparison lemmas exited **0**, with the same five warnings. The output retains field/group/module/inner-product/finite-index/decidable-equality hypotheses as applicable. An initial scratch attempt had no input file because its creation used the wrong working directory; the corrected creation and elaboration completed successfully.
- `Suggested.lean` remains unchanged: **203 lines**, six real-bodied definitions/abbreviations, five theorem signatures and twelve proved examples. Each Lean name remains in the README. The new comparison depends on two unpinned supplier carriers, so it and its general API are stated in the README; the existing proved complex-slot example supplies the available numerical Check.
- Required dependency gate exited **0**, with exactly this output:

```text
depcheck: 8 roadmaps, 58 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. ReductiveGroupsPartII precedes GeometryOfNumbersAndQuadraticArithmetic, and both precede this roadmap. The comparison stays here and creates no dependency between the two suppliers.

- Both TOML files and the plan JSON parse. Structural comparison confirms that only the existing `hermitian-unitary` entry’s `needs` and `detail` changed in the plan’s top-level `gaps` list; all other plan data are identical. All **36** gap slugs have matching README contracts, and all **40** numbered target sections and seven layers remain.
- `git diff --check` exited **0** with no output. Identifier code spans are balanced, report headings match the required finding/severity format, and the authored files contain no machine paths. All Lean processes completed; none remains running.
- All sixteen certified cached source texts are present. No additional work was cited or fetched; the new comparison is elementary and uses the existing `ggp` citation. The waived `xue-bessel` entry stays waived, and no missing-reference request is needed.
- Read shape examples `TauCetiRoadmap/ReductiveGroups/README.md` and `Completed/RestrictedProducts/README.md`. Searched the seven named sibling roadmap contexts and the available content branches: none supplies a duplicate field-carrier comparison or the Bessel geometry here. ArithmeticDynamics’ Hermitian line bundles, ErdosProgressionPowers’ Hilbert-space Bessel inequality and the scalar modular-form pairings concern different objects.
- No existing mathematical target or Lean declaration was renamed or deleted. The only added target family is `hermitianFieldCarrierEquiv` with `_apply`, `_symm_apply`, `_isometry`, `_orthogonal` and `_adjoint`. Consumers of §§1.1, 1.3 and 3.4 acquire the explicit earlier field-carrier dependency. The residual `hermitian-unitary` contract is still a supplier gap, not a theorem discharged by this repair. No supplier, merge-order or downstream roadmap file was changed. Nothing was committed or pushed.
