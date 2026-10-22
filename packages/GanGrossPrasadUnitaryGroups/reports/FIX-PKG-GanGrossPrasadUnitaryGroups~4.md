# GanGrossPrasadUnitaryGroups repair report

## F01 (P2) — applied

All-place `gl-tempered-genericity` request → nonarchimedean genericity, retaining dyadic fields. Import archimedean genericity and Whittaker realization from their existing owners. Update the three consumers and Layer 3/5 dependencies; retain the precise smooth-dual and pairing supplements. Add rank-zero/rank-one and nongeneric-unitary boundary Checks. Preserve the slug, all-place conclusions and Lean signatures.

## Verification

- `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:431`, revision `bc8af0cee90d91cf9c2345e2b65630749b64609c`, states the genericity criterion on the continuous globalizations of §2.7. For an irreducible tempered representation take the single essentially tempered block and the whole-group parabolic: normalized induction is the original representation. This gives the required continuous functional for R and C in every positive rank. It uses temperedness, rather than an inference from unitarity.
- `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:241`, revision `691b4b3310d33d5ad6b2b5224005a407eff9a1f8`, supplies the archimedean smooth-globalization and contragredient comparisons. Its §AL.3 `whittaker-model`, lines 1959–1978, supplies `AL3.WhittakerModel.equivariance`, `.right_action`, `.ext` and `.realization` on the actual representation.
- No blanket extra tensor compatibility is assumed. Apply the imported realization to each generic representation, including its smooth contragredient with the specified opposite character. Tensor those isomorphisms using the algebraic tensor functor or NoncommutativeGeometry N1's completed tensor functor. Relative currying and the invariant Whittaker pairing/Fourier identity remain precisely the existing `local-categories`, `archimedean-globalization` and `whittaker-pairing-fourier` contracts. Thus no new supplier gap is needed.
- `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`, revision `28803294a655a2ad6315672600d108a08fcb7553`, SR.2.3, lines 2221–2244, constructs the general functional/quotient and character-orbit interfaces and proves the stated GL₂ specializations; it does not state all-rank tempered GL genericity. The retained finite-place supplement is additional mathematics.
- The legal cached texts agree with the unchanged relative conclusions: ggp line 2394–2405, Theorem 17.2, p. 68, distinguishes all finite-place odd codimensions from the adjacent all-place theorem; zhang-period line 1469–1473, line 1523–1548, §4.5, pp. 30–31, uses actual Whittaker models and tempered pairings. Genericity alone does not establish the higher-codimension archimedean prediction.
- Object searches in pinned Mathlib and Tau Ceti found no continuous Whittaker/globalization or tempered-GL genericity theorem. The native tensor and intertwiner objects remain imported: `Mathlib/RepresentationTheory/Basic.lean:618` and `Mathlib/RepresentationTheory/Intertwining.lean:36`. The seven named sibling roadmap snapshots have no competing genericity or Whittaker-realization supplier. ReductiveGroups, Completed RestrictedProducts and GlobalNumberFields were read for the upstream roadmap shape.

## Check outcomes

1. Prescribed `lake env lean` elaboration of `packages/GanGrossPrasadUnitaryGroups/Suggested.lean`, from the content checkout: **exit 0**. Exactly five diagnostics, all warning messages that a declaration uses `sorry`, at **25:8, 74:8, 121:8, 164:8 and 187:8**. No errors or other warnings. The sole import is `Mathlib`; no Tau Ceti module build was required.
2. Separate scratch elaboration with `#check @name` for all eleven named declarations: **exit 0**, with the same five warnings. The elaborated signatures retain the field, group, complex module, inner-product, finite-index and decidable-equality assumptions they use. Both Lean processes completed.
3. Prescribed dependency check: **exit 0**, with exactly this output:

```text
depcheck: 8 roadmaps, 57 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. AutomorphicFormsOnReductiveGroups and AutomorphicLFunctionsAndLocalFactors precede this roadmap; no ownership move or merge-order edit is required.

4. JSON comparison against the starting package: only the `gl-tempered-genericity` entry in the top-level `gaps` list changed, in its `title`, `section`, `needs` and `detail`. Every other gap and every other top-level plan value is identical. The slug, supplier and `neededBy` remain unchanged. All 36 gap slugs have the matching README supplier contract; the repaired `needs` and `section` agree exactly.
5. README/Lean consistency: all eleven named declarations occur in the README. `Suggested.lean` is unchanged: 203 lines, six real-bodied definitions/abbreviations, five theorem signatures and twelve proved examples, two per definition. The new analytic boundary Checks have no formalized local analytic carriers at the pins and remain README Checks. No admitted data or examples, option overrides or extra imports were introduced.
6. `metadata.toml` and `sources.toml` parse successfully. No new source was cited or fetched, and the existing `xue-bessel` waiver remains settled. There is no missing legal text needed for this repair. `git diff --check`: **exit 0**, no output.

## Adversarial mathematics pass

Each subsection row includes its definitions, subordinate API and Checks. These are boundary and interface checks of proposed statements, not proofs of the analytic theorems or a discharge of supplier gaps. Unchanged rows received no edit.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Algebraic/local conventions | Zero ring, inseparable algebra, split algebra, characteristic 2, dyadic residue fields | Field/étale hypotheses exclude the first two; Hermitian theory retains characteristic ≠2 while local characteristic zero includes residue characteristic 2. Split rank n gives GL_n. | None |
| Pairing, character and induction conventions | B(i,1), B(1,i), ν(h)=i, upper GL₂ at diag(a,1) | Values i, −i; right translation gives ν(h); modulus is abs(a), with inverse half-modulus for conversion to unnormalized induction. | None |
| Parameter and L-factor conventions | Degrees 1/2, eigenvalues a,b, empty parameter | Asai pole signs +/− and opposite adjoint signs agree; Frobenius inversion inverts both eigenvalues; empty factors equal 1. | None |
| Measures, universes and denominators | Haar factors 2 and 1/2, global Haar 2, zero vector, zero central value | Local product-one rescaling cancels; squared global period scales by 4. Vector quotients exclude zero; local factors are nonzero; global central value is never inverted. Universe changes add no analytic hypotheses. | None |
| §1.1 `RelevantHermitianPair` and frame API | W=0, H plus a line, definite rank 3, split (1,0), identity/composite isometries | Complement ranks 1/3 and nonzero-norm basis condition distinguish relevance from mere odd codimension. Transport and scalar extension use the actual forms. | None |
| §1.2 `besselDatum` | r=0/2, split upper GL₃, products of simple coordinates | Empty flag gives diagonal U(W); coordinates add; split character sees (x,−y), including both simple roots. | None |
| §1.3 `besselTransport` | Identity, composition, simultaneous negation, frozen changed character | Transport composes; negation preserves the groups and switches the line sign; character coordinates must be transported. | None |
| §2.1 `besselModel` and multiplicity API | Trivial H, U(1) weights (1,−1)/(1,1), completed tensor image | Dimensions 1/0; currying needs the dual; continuity and density control extensions; finrank is used after finiteness. | None |
| §2.2 invariant-distribution symmetry | Norm-one scalar, upper GL₂ unipotent, two noncommuting matrices | Conjugated inversion fixes the scalar; transpose reverses products; identity is not a noncommutative anti-automorphism. | None |
| §2.3 adjacent multiplicity | U(0) inside U(1), ramified Q₂ extension, split real pair | Scalar multiplicity 1; category and irreducibility assumptions persist without temperedness. | None |
| §2.4 finite-place reduction | r=1, W hyperbolic, forbidden support present/absent, modulus witness | Auxiliary rank is 2; chosen isotropic Y need not be maximal; support exclusion and irreducibility are required; open-orbit character is inverted. | None |
| §2.5 archimedean injection | dim S=0/1/2, reducible parameter, both line signs | Finite basis gives a common half-plane; generic irreducibility supplies a usable parameter. No whole-Hom uniformity or arbitrary-parameter injection is asserted. | None |
| §2.6 multiplicity one | Hypothetical two-dimensional model, incompatible compact weights, dyadic field | Reduction contradicts a two-dimensional subspace; zero multiplicity is possible and dyadic fields remain included. | None |
| §2.7 adjacent tempered integral | Compact H of mass a, trivial noncompact split pair, logarithmic weights | Compact value a; divergent constant coefficient is excluded by temperedness; relative decay must absorb every fixed logarithmic power. | None |
| §3.1 epsilon character | Empty tensor, χ₁ and χ₋₁, multiplicity-two constituent | Empty epsilon is 1; duality gives central product −1 in the two-character example; multiplicity two gives zero central coordinate while the generator remains. | None |
| §3.2 enhancement transport | Norm/nonnorm scaling, even/odd ranks, two sign changes | Norm class acts trivially; parity-dependent determinant twist is retained; two changes cancel with labels transported. | None |
| §3.3 tempered relative form | Compact mass a, weight sum zero/nonzero, higher codimension, induced object | Compact average detects the invariant part; higher codimension uses regularization; induction compares the full induced representation. | None |
| §3.4 geometric multiplicity | Identity, x=−1 on a complex line, zero quasi-character, empty regular germs | Determinants 1 and 4; zero functional value 0; empty orbit average is defined as 0; GL induction germ factor is retained. | None |
| §3.5 local trace formula | W=0, noncompact real group, normalized induction | Whittaker germ, regularized trace and the GL germ multiplier persist; no compactness shortcut. | None |
| §3.6 packet Fourier identity | μ=−ε/ε, order-two component group | Fourier mass is 0/1 respectively; transform (1,−1) selects the nontrivial enhancement. | None |
| §3.7 finite-place packet selection | W=0, ramified Q₂/Q₃, wrong enhancement | Complement fixes the relevant odd space; actual central restrictions select one pair and all others have multiplicity zero. | None |
| §3.8 real theta reduction and `realSeesawForm` | Counts (2,1), compact wrong weights, U(0), one oscillator weight and its shift | Counts descend 3→1; zero companion lifts retain vanishing. Equal-rank scalar values 1/0 and first/second i scaling pin the conjugate oscillator and pairing. | None |
| §3.9 real packet theorem | Compact U(2) weights, opposite line sign, W=0 | Dual-weight interlacing gives 1/0; negation transports labels; rank-one scalar model remains included. | None |
| §3.10 split prediction | GL₀/GL₁, R/C/Q₂, trivial unitary GL₂, ordinary versus generic GL₃ quotient | Positive-rank genericity comes from the correct field-specific owner. Trivial unitary GL₂ is nongeneric and nontempered. Ordinary quotient dimension 6 cannot replace generic dimension 1. | Added two boundary Checks and explicit supplier split |
| §3.11 split generic theorem | Adjacent pair at every place, finite-place rank gap 3, infinite-place rank gap 3 | All-place adjacent and finite-place higher-codimension conclusions persist; infinite higher codimension remains a prediction. | Updated genericity/realization imports |
| §4.1 global period | r=0, ν(h)=i, nonrational character | Empty unipotent contributes 1; inverse-character integral transforms by ν; nonrational character cannot descend. | None |
| §4.2 local obstruction/factorization | One zero local model, two modified factors 2/3, reference scalar a | Zero model kills the period; product changes by 6; reference functional rescales reciprocally. | None |
| §4.3 tensor L-representation | b=0, ranks (2,1), split local algebra | L=1 in zero rank; dimension is 4; split factors include both conjugate terms. Induction is from the index-two finite-Galois subgroup. | None |
| §4.4 fixed-pair conjecture | W=0, central zero, wrong prescribed form | Definition retains the Fourier coefficient, central-value condition and specified inner form; it is not exported as a general theorem. | None |
| §5.1 period normalizer | n=1, split place, global central zero | Δ₂ has signs η and 1; local factors are finite nonzero; the global normalizer may be zero. | None |
| §5.1a split Whittaker integral | GL₂×GL₁ at finite/R/C places, λ(W)=0, Haar doubled | Genericity uses both suppliers; raw nonzero test has value ab times abs(L(1/2))²; kernel vectors give zero and Haar doubling doubles the raw form. | Updated imports; all-place assertion retained |
| §5.2 normalized local period | Zero vector, scalar c, compact mass a, discontinuous form vanishing on algebraic tensors | α(0,0)=0; q excludes zero and is scale invariant. Density needs continuity; arbitrary algebraic extensions are not determined. | None |
| §5.3 spherical formula | Split q=2 eigenvalues 1/−1, unramified nonsplit rank one, ramified nonspherical datum | Split raw integral and C both 3; compact nonsplit raw value and C both 1. Nonspherical data do not meet the fixed-vector hypothesis. | None |
| §5.4 rescaling | Pairing 2, Haar factors 2/one-half, global Haar 2 | Local pairing cancels; product-one Haar changes cancel; global squared period scales by 4. | None |
| §5.5 all-place product | Spherical tail, one zero factor, good volume-2 place moved into S | Finite-modification definition is coherent; zero factor remains zero; the volume tail compensates for enlarging S. | None |
| §6.1 global Whittaker periods | n=1, zero vector, central zero, several constituents | Opposite Asai signs differ; central zero kills λ alone; leading coefficients use actual constituent-dependent pole orders. | None |
| §6.2 relative characters | Rank-one expansion, basis rescaling, zero period, spherical projector | Basis factors cancel; zero period gives zero distribution; local trace integral uses smoothing summability and adjacent decay before Fubini. | None |
| §6.3 star-generic contribution | Counts (1,1)/(2,1), repeated constituent, quotient centre | Coefficients 1/4 and 1/8; repeats violate hypotheses; full split-centre count is required. | None |
| §6.4 isolated comparison | Other forms vanish, several representations with one base change, dense infinite transfer | Remaining term is a class sum until local uniqueness; dense transfer requires continuity; isolation adds no auxiliary supercuspidal place. | None |
| §6.5 Euler identity | Missing local model, nontrivial κ with product 1, three constituents | Zero branch avoids division by a period; only product of constants cancels; coefficient is 1/8. | None |
| §7.1 adjacent nonvanishing | n=1, endoscopy, wrong prescribed form, nontempered data | The form is existential; n=1 and endoscopy remain; no temperedness premise is added. | None |
| §7.2 stable specialization | One constituent per degree, n=1 boundary, bad places | Two constituents give stable coefficient; source range n>1 remains; n=1 uses §7.1 independently. | None |
| §7.3 refined conjecture | Counts (1,1)/(2,1), zero vector, zero mixed pairing | Coefficients 1/4 and 1/8; nonzero diagonal norms required; polarization clears denominators instead of dividing by mixed pairings. | None |
| §7.4 GGP.8 | Central zero, endoscopic counts, vector/pairing and Haar rescalings | Central zero forces period zero with local terms defined; coefficients and scaling remain consistent; refined conjecture is not a premise. | None |
| `splitLineFrame` and its theorem | (1,1), (1,0), rational (2,1), characteristic 2 | Norms 1/0/2 distinguish units from nonzero or norm-one vectors; all-field signature is valid. | None |
| `linearFirstPairing` | (i,1), (1,i), scalar c, zero space | Values i/−i, first linearity and second conjugate-linearity; completeness is unnecessary. | None |
| `algebraicBesselModel` and equivariance | Scalar model, fixed tensor with target −1, trivial H | Covariance uses ν; target −1 forces the fixed tensor's value to vanish. No analytic structure is inferred. | None |
| `componentCentralElement` and character theorem | Empty index, multiplicity 2, two multiplicity-1 coordinates | Central parity differs from the generator; coordinate-sum character is 1 on either generator and 0 centrally. Finiteness binders persist. | None |
| `unitaryConstituentSigns` and cardinal theorem | Empty indices, counts (1,1)/(2,1) | Orders 1/4/8; both finite-index binders persist. | None |
| `unitaryConstituentCoefficient` and formula | Empty indices, counts (1,1)/(2,1) | Values 1, 1/4, 1/8; identity element makes the cardinal denominator nonzero. | None |
| Genericity/realization contracts | Whole-group induction, zero λ, rank one, smooth dual, tensor of two realizations | Archimedean genericity specializes exactly; zero λ gives no realization; tensor isomorphisms use existing functoriality, with relative dual/pairing gaps explicit. | F01 repair |
| Remaining geometry/local-category contracts | Split forms, zero rank, dyadic fields, ordinary/generic quotients | Arbitrary-form geometry and relative restriction comparisons remain precise additional contracts. | None |
| Tensor/globalization/Whittaker-decay contracts | Zero factor, scalar tensor, growth constant 2, GL₁, finite S | Existing tensor completion/nuclearity/growth are imported; relative smooth-dual topology and every decay order at fixed growth exponent remain distinct supplements. | None |
| Distribution/germ/spectral/smoothing contracts | Empty germs, compact/noncompact H, real/finite Fourier homogeneity, rank-one sums | Zero average, field-specific homogeneity, specified scaling cocharacter and absolute smoothing bounds retain their necessary hypotheses. | None |
| Enhancement/theta/transfer contracts | Repeated parameter, nonnorm change, zero theta lift, finite exact/infinite dense transfer | Actual enhancements, signature and central restrictions remain required; ordinary transfer does not assume enhanced classification or a GGP endpoint. | None |
| Adelic/factor/global-spectrum contracts | Quotient measure a/b, q=2, signs in degrees 1/2, central zero, enlarged S | Measures retain disintegration, actual pole orders and nonzero leading coefficients; spectrum/isolation contracts provide constructions before the relative calculation. | None |

## Maintainer consequences

Only `packages/GanGrossPrasadUnitaryGroups/README.md`, the permitted top-level gap entry in `packages/GanGrossPrasadUnitaryGroups/design/plan.json`, and this report changed. No declaration or downstream export was renamed; `GanGrossPrasadUnitaryGroups:GGP.8` and all eleven Lean names retain their signatures. `gl-tempered-genericity` now requests only finite-place mathematics. Its archimedean part and realization are consumed from earlier suppliers, with no supplier-file, scope or merge-order change. No commit or GitHub write was made. Independent review remains required.
