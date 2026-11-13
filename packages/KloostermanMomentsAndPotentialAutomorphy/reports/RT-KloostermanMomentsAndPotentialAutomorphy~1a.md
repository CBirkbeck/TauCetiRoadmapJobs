<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13156#issuecomment-6866750806 -->
Red team round 1 pass a (codex) of cdfffd9

Verdict: needs_changes

1. **F01** (P2) The coefficient-divisibility headline is missing from the acceptance test

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:2143` and `:2417`; `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean:13`.

   **Claim:** The Newton/Hodge comparison yields `v_p(c_n) ≥ n(n − 1)` for odd primes, and also at `2` for odd symmetric powers. None of the four Lean theorems tests this conclusion, and the module docstring does not account for it.

   **Witness:** At `(p,k)=(2,5)`, coefficients `1,−5,68,−64` have valuations `0,0,2,6`; the existing degree and complex-root bounds do not state these divisibilities. FSY line 2312 and line 2660 supply the result.

   **Exact repair:** Add the following headline, with its README name and a docstring citing FSY Corollary 5.27 and Remarks 5.28, 5.41:

   ```lean
   theorem momentSeries_coeff_divisibility (p : ℕ) [Fact p.Prime]
       (k : ℕ) (hk : 0 < k) (hpk : p ≠ 2 ∨ Odd k) :
       ∃ P : Polynomial ℤ,
         ((P.map (Int.castRingHom ℂ) : Polynomial ℂ) : PowerSeries ℂ) =
           momentSeries p k ∧
         ∀ n : ℕ, (p : ℤ) ^ (n * (n - 1)) ∣ P.coeff n := by
     sorry
   ```

   This uses only carriers already used in the file. Divisibility handles zero coefficients without treating `padicValInt p 0 = 0` as an infinite valuation. At `(2,5)`, the divisors at degrees `0,1,2,3` are `1,1,4,64`, dividing the displayed coefficients; beyond degree three they divide zero. At `k=1`, `P=1−X` satisfies the same statement. Signature proposed by inspection, not elaborated in this read-only pass.

2. **F02** (P1) The differential Galois carrier has no cited owner

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:879`, especially `:899` (“Needs: §§2.3–2.4”).

   **Claim:** §2.5 uses differential Galois groups, their solution representations, and finite-cover restriction, but its prerequisites supply only formal connections and symmetric powers. None of the supplier contracts supplies the differential Galois construction.

   **Witness:** `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:3117` already owns Picard–Vessiot rings, constants, automorphism groups and analytic comparison in §5.4; lines 3130–3133 give the solution representation and identity-component fixed field. No such citation occurs here.

   **Exact repair:** Add this supplier contract and add it to §2.5’s Needs: “DiophantineApproximationAndTranscendence §5.4, Picard–Vessiot fields and analytic solutions, supplies the Picard–Vessiot differential Galois group over `ℂ(z)`, its faithful solution representation, and the fixed-field correspondence. Use this carrier for `Kl_r` and its finite pullback; derive finite-cover restriction from that correspondence.” Keep the Kloosterman-specific group computation here. The main-roadmap owner is earlier than this package. The carrier distinguishes `y′=y`, whose group is `𝔾_m`, from its trivial analytic monodromy; merely using local monodromy would fail this test.


3. **F03** (P1) The local input at infinity is neither supplied nor ordered

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1931`, “§5.2's `ℓ`-adic counterpart”; also lines 1975–1977 and 1990.

   **Claim:** The proof of §8.1 uses the characteristic-`p` inertia invariants of every symmetric power. §8.2 attributes this local structure to CongruenceSpectralGap §4.2b and uses §8.1 to separate weights.

   **Witness:** `TauCetiRoadmap/CongruenceSpectralGap/README.md:721` supplies rank, Swan conductor one and total wildness for `Kl₂`, not its symmetric-power inertia. At `p=2,k=12`, Yun-moments lines 1654–1664 give two invariant lines; §5.2 has one regular summand.

   **Repair text:** “Before §8.1, prove the local symmetric-power input at characteristic two: the inertia image of `Kl₂` is the binary tetrahedral group, with lower ramification groups `D₀=2.A₄`, `D₁=Q₈`, `D₂=D₃={±1}`, `D₄=1`; a geometric Frobenius lift is `√2 φ₁`, with `φ₁` in `2.S₄ \ 2.A₄`. Deduce the Swan conductors and the invariant Frobenius multiplicities `a_k,b_k` stated in §8.2 (Yun, arXiv:1308.3920v2, §§4.3.1–4.3.2, Lemmas 4.3.3–4.3.4, pp.36–39). Use this target in §§8.1–8.2; at odd primes use the already cited RD.7.21a and RD.6.98 route. Remove the nonexistent counterpart citation and the attribution of this finer local structure to CongruenceSpectralGap §4.2b.” Add the primary source under its existing auxiliary key `Yun-moments` to the package manifest when applying the repair.

   **Repair test:** At `k=12,p=2`, the invariant space has dimension two and Frobenius trace zero, hence eigenvalues `64,-64`; its determinant is `(1−64T)(1+64T)`. The proposed input gives the boundary factor used by §8.2 without depending on §8.1. Odd symmetric powers have no invariants because the central involution acts by `−1`.


4. **F04** (P3) Several Checks only repeat the conclusion or its scope

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1222`, `:1224`, `:1332`, `:1633`, `:1680`, `:1736`, `:1737`, `:2374`, `:2376`, `:2429`, `:2430`.

   **Claim:** These bullets are presented as Checks, but repeat classicality, the weight formula, the excluded range, the characteristic range, or the stated conclusion without testing an instance.

   **Witness:** Lines 1736–1737 say that the argument includes characteristic two and permits interior singularities. Both repeat the preceding target. The chart test at line 1738 is the only computed Check in that block.

   **Exact repair:** Delete the listed scope-only bullets. In §7.1 replace its first two bullets by:

   - “Over `𝔽₂`, in the `k=2` chart at `(z₁,z₂)=(1,0)`, `g₁=0` and `∂g₁/∂z₁=1`; the boundary intersection is smooth even though `2=0`.”
   - “For `k=2` over `ℚ`, `(y₁,y₂)=(1,−1)` satisfies `g=0` and both derivatives `1−yᵢ⁻²=0`. Thus smoothness along the boundary cannot be strengthened to smoothness everywhere.”

   Replace §4.1's first two bullets by “At `r=2,k=2`, the full group is a line of type `(3,3)`, hence weight six; at `r=2,k=5`, its three types are `(2,4),(4,2),(6,6)`, of weights `6,6,12`. Declaring the full group pure of weight `k+1` fails in both cases.” Replace §4.5's weight-only bullet by “At `r=2,k=3,p=2`, the projected hypersurface piece before twisting has eigenvalue `−2`; the twist `(−1)` multiplies it by two, giving `−4` and raising weight two to four.” These computations retain discriminating Checks; the theorem statements keep their scope.

## Verified sound

Read all 2,581 README lines and all 219 Lean lines: 21 declarations (17 definitions, four theorems), 59 numbered subsections, and 44 bold target paragraphs, counting the Bessel Comparison. All 212 Check bullets were read and compared with their surrounding statements; the 64 README rows below record concrete computations and negative controls, with the 21 Lean rows recording their contexts separately. R04 identifies scope-only Checks. Numerical agreement is not a proof of a universal geometric claim.

The source ledger below records 47 locator families checked against three available package sources, plus six further prose comparisons. The fourth package source, Saito-orthogonal, remains uncertified as instructed. The auxiliary Yun-moments text was read for R03. Cross-roadmap contracts were checked in 20 suppliers, plus the main Picard–Vessiot owner found by object search. Declared gaps remain conditional contracts, not missing-supplier findings.

The four existing acceptance theorems are the polynomial/integrality/degree result, the root-weight result, and the odd and even meromorphic functional equations. The additional statable scalar headline is R01. The Hodge table, monodromy and differential Galois groups, exponential/classical comparison, Nori motive, local Galois realizations and potential automorphy are individually accounted for in the module docstring as lacking their geometric carriers. No free predicate, admitted data, lost section binder, one-tactic theorem, boundary theorem or Check masquerading as a Lean headline was found. The 17 definitions are used by the four headline signatures; the near-matches do not prove those headlines.

The package diff lists eight files, all under `packages/KloostermanMomentsAndPotentialAutomorphy/`; no outside-package change was found. `Suggested.lean` has the single `import Mathlib`, the required namespace, declaration docstrings and layer order, four honest `sorry` proofs, no `lemma`, no `set_option`, and no computational algorithm. No process narrative or pull-request number was found in the README or Lean docstrings. The supplied signature record, rather than a new Lean process, was used because this pass forbids Lean builds.

### Dependency and ownership record

The required dependency check returned:

```text
depcheck: 240 roadmaps, 2187 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. Object searches used the official `roadmaps grep`/`show` interface, the supplied open heads, main active and completed roadmaps, and both pins. The closest companion `KloostermanSheavesAndBesselIsocrystals` expressly imports the scalar constructions from this package (its README lines 77–80 and 240–255); its general reductive-group constructions do not duplicate them. `PotentialAutomorphyDworkMotivesPartII` owns Dwork families and switching, not these moment motives. Generic Hodge/Fourier theory and rigid comparisons have been left with their suppliers. No duplicate fully qualified Lean declaration was found.

| Supplier, current section checked | Contract comparison and witness |
| --- | --- |
| CongruenceSpectralGap §§4.2a–4.2b | Unit parameter, nontrivial character, geometric Frobenius sign, all positive ranks and all characteristics; README 647–725. Fine infinity structure is missing: R03. |
| PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a, RD.6.53, RD.6.94–RD.6.98, RD.7.20–RD.7.22 including RD.7.21a | Formal normal form and residue degrees; all-prime basic rigid construction, coprime-rank Fourier comparison; unit thickness versus declared extension; full odd-prime boundary factorization. README 12803–12831, 13683–13827, 14344–14435. |
| SpringerResolutionAndCharacteristicCycles §§8.1–8.4, 9.1–9.7 | Good filtrations, ordinary differential operators, transfer, duality, intermediate extension and holonomicity; characteristic zero preserved. |
| MixedHodgeModulesAndIrregularHodgeTheory §§2.1–2.5, 4.3, 4.6, 5.1–5.4, 6.1–6.7, 7.1, 7.5–7.7, 8.1–8.5, 8.7–8.8, 9.1–9.6, 10.1–10.8 | Fourier sign, regular-input condition, exponential projector, weight shifts, supports, and compactification hypotheses agree; irregular stationary phase remains the declared extension. |
| ComplexComparisonPartII §§C5.1, C5.6–C5.7 | Ordinary operators and localization; regular singular/logarithmic comparison is used on its own domain, not as an irregular comparison. |
| EtaleCohomologyFoundations §§F.0.4, F.2.4–F.2.7, F.4.5, F.5–F.7, F.10.1–F.10.2b | Finite-type/separated hypotheses, invertible coefficients, rational realization and geometric versus arithmetic Frobenius retained. Purely inseparable degree-two map has equivalent étale topoi, not an étale cover. |
| InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 | Rational constructible trace formula with descent, every extension degree, finite coefficient extension; target curves meet finite-type/separation hypotheses. |
| EtaleDualityAndPerverseSheaves §§2.3, 2.8, 3.3 | Intermediate extension is an image in the perverse heart; field coefficient extension is exact and preserves it. |
| DeligneWeightsAndPurity §§0.16, 0.18, 7.12, 7.15, 8.14, 8.19, 8.24 | Pairing multiplier, exact weight decomposition, pure middle image, geometric semisimplicity, and smooth-proper boundary spectral sequence. Singular compactifications use this package's §7.1 instead. |
| SchemeAndStackFoundations §§2.11, 4.11, 4.13, 4.17 | Artin–Schreier, chosen-center strict transforms, regularity, reduced normal-crossing divisor; projective finite-type models meet finiteness requirements. |
| ShimuraCompactifications §§0.16–0.18 | Finite-fan schemes over arbitrary rings, properness and boundary flatness, including nilpotents; README 752–814. |
| AnalyticToricGeometryPartII §§0.3, 0.5 | Character modules and Cartier trivializations over arbitrary rings; projective embedding remains a declared gap, not a claim already made by §0.5. README 168–220. |
| LefschetzPencilsAndVanishingCycles §§2.4–2.8, LPV.2 examples, §6.6 | §2.7 retains arbitrary quadratic smoothing thickness; §2.8's regular-total-space hypothesis is not a replacement for it. The FSY signed radicand is explicit at 2299–2303. Characteristic-two isolated concentration is at 3463–3473. |
| MotivesAndAlgebraicCycles §2.7, §§5.3–5.9 | Nori category and realizations supplied; weight filtration and orthogonal root-number theorem are declared additions. |
| ArithmeticGaloisRepresentations §§1.7, 2.5–2.7, 3.3, 5.3, 7.4 | Semisimplification, pure graded WD comparison retaining N, local constants/conductor, Frobenius recognition and polarization agree. Form on semisimplification is a separate declared contract. |
| CohomologyComparisons §§2.13, 3.4–3.5, 4.3–4.4 | Proper smooth/semistable hypotheses, filtration and chosen period embeddings retained; finite-base maps are imported through their agreement theorem. |
| PadicHodgeTheory §§3.2, 5.1–5.3 | Supplier uses HT(cyclotomic)=+1, opposite to this package; the stated sign conversion is correct. D_pst is exact on potentially semistable representations, not arbitrary representations. |
| PotentialModularityAndCompatibleSystems §§1.1, 1.5–1.6, 1.15 | Weak versus strict compatibility and the Hodge archimedean recipe agree; no coefficient-prime inference is made from away-prime compatibility alone. |
| ModularityAndLanglandsExtensions §§2.42–2.43, 2.49 | Semisimple potential automorphy and strict purity, plus the irreducibility premise consumed by AG2.6, resolve. |
| AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6 | Away-prime comparison and totally real coefficient-prime descent with its explicit irreducibility premise and monodromy. |
| DiophantineApproximationAndTranscendence §5.4 | Main owner of the missing generic differential Galois carrier, README 3117–3147: R02. |

The table contains 20 cited suppliers plus the additional owner, i.e. 21 roadmap comparisons. The contracts contain multiple section citations; this count is by distinct roadmap, not by every occurrence of a section number.

The six slugs `higher-thickness-picard-lefschetz`, `irregular-stationary-phase`, `nori-weight-filtration`, `orthogonal-motive-root-number`, `semisimplification-similitude-form`, and `toric-polytope-projective-embedding` occur with matching owners in `design/plan.json` and the README's Exact supplier contracts. Their extra inputs are not already supplied by the cited sections or the pins. They specify hypotheses and outputs rather than free propositions. They were not raised as defects merely because implementation is outstanding.

### Pinned-carrier and padding checks

| Pinned item | Evidence and boundary interpretation |
| --- | --- |
| `GaloisField` | `Mathlib/FieldTheory/Finite/GaloisField.lean:68`: splitting field of `X^(p^m)−X`; `m=0` is the zero polynomial and does not create a field with one element. |
| `ZMod.stdAddChar`, trace APIs | `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83`; `Mathlib/RingTheory/Trace/Defs.lean:110` and `:137`; `Mathlib/FieldTheory/Finite/Trace.lean:37` and `:49`; finite-free tower hypotheses match the finite-field use. |
| Character orthogonality | `Mathlib/Algebra/Group/AddChar.lean:354` uses a finite additive group and domain coefficients; trivial character has value one despite its additive-carrier notation `0`. |
| `SymmetricPower` | `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53` is a quotient of tensor power by permutation relations. It has neither a connection nor a Kloosterman realization. |
| `hsymm` and Chebyshev near-matches | `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312` gives the complete symmetric polynomial, not the two-variable trace recurrence with determinant parameter and the moment theorem. The simple recurrence is needed to state the headline. |
| Formal exponential/substitution | `Mathlib/RingTheory/PowerSeries/Exp.lean:50`, `Substitution.lean:158`, and `Log.lean:135`: the dot-notation orientation is the outer series followed by the substituted series. The exponent here has zero constant term. |
| Dirichlet series/Euler product | `Mathlib/NumberTheory/LSeries/Basic.lean:74` and `:164`; `Mathlib/NumberTheory/EulerProduct/Basic.lean:225`. The zero term, normalization and absolute summability assumptions are retained. These results do not prove continuation of the new moment L-functions. |
| Meromorphic normal form | `Mathlib/Analysis/Meromorphic/NormalForm.lean:51` and `:632`: local Laurent normal form fixes values at poles; it does not permit arbitrary exceptional-point values. |
| Mixed Hodge structures | `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` has finite filtrations and pure graded pieces; finite dimension and polarizability are additional conditions. Strictness is in `Mixed/Strictness.lean:110` and `:131`; Tate weight `−2m` in `Mixed/Basic.lean:307`. None constructs exponential cohomology or a Nori motive. |

### Lean declarations and elaborated contexts

All names below have namespace `TauCetiRoadmap.KloostermanMomentsAndPotentialAutomorphy`. There are no section variables or `include` blocks. `Type*` is universe-polymorphic; `F` and `R` need not be small. I compared all 21 supplied elaborated signatures with their source declarations and README statements. No lost binder was found. I did not run Lean; the supplied elaboration record is the evidence for elaboration, not a new build.

Here `p!` abbreviates the explicit instance `[Fact p.Prime]`, not an extra hypothesis. The integer divisions in the definitions are natural-number divisions. Tests below are computations, not proofs of the universal theorems.

| Declaration (Lean line; README section) | Complete external context | Instances and computed values | Result/change |
| --- | --- | --- | --- |
| `kloostermanSum` (52; 0.2) | `F : Type u`, `[Field F] [Finite F]`, `ψ : AddChar F ℂ`, `a : F` | F₂: `K(1)=1`, `K(0)=−1`; F₃ nontrivial character: `K(1)=−1,K(2)=2`; trivial F₅ character: every sum `4` | Unit restriction needed only for product-fibre comparison; zero ring excluded by Field |
| `traceChar` (61; 0.2) | `p,m : ℕ`, `p!`; no positivity on `m` | F₄/F₂: `Tr(1)=0`, character `1`, versus F₂ character `−1`; `Tr(ω)=Tr(ω²)=1`; F₉/F₃: `Tr(1)=2`, character `ζ₃²`; at `m=0`, splitting field of zero polynomial is Fₚ | Tower is relative trace, not restriction equality; README handles `m=0` |
| `symmetricTrace` (68; 0.1) | `R : Type u`, `[CommRing R]`, `t,d : R`, argument `k : ℕ` | `h₂(3,2)=7≠9`; `h₃(2,1)=4`; `h₂(−1,2)=−1`, `h₃(−1,2)=3`; zero ring: all values `0=1` | Recurrence valid in every commutative ring; no division |
| `moment` (76; 0.2) | `p,k,m : ℕ`, `p!` | `(p,m)=(2,1)`, k=0,1,2,3: `1,−1,−1,3`; p=3,m=1,k=4: `−10`; m=0 uses determinant 1, not p | No theorem includes m=0 as a finite field of cardinality 1 |
| `momentSeries` (83; 0.3) | `p,k : ℕ`, `p!` | p=2,k=0 coefficients `1,1,2,4`; k=1: `1,−1,0,0`; k=3: `1,3,−4,0` | Constant exponent coefficient zero; nonzero denominators m≥1 |
| `momentSeries_weights` (92; 8.1) | `p,k : ℕ`, `p!`, `hk : 0<k` | p=2,k=3: Q=`1+4T`, root `−1/4`, norm `1/4=2^−2`; p=3,k=6: Q=`1+27T`, root norm `1/27=3^−3`; k=1: Q=1, no roots | Statement passes; proof input R03 |
| `momentDegree` (102; 8.2) | `p,k : ℕ`, no primality instance | `(3,9)→3`, `(2,12)→3`, `(2,1)→1`; junk `(0,3)→2`, `(1,3)→0`, k=0→0 | Junk values are outside headline hypotheses |
| `momentSeries_eq_intPolynomial` (111; 8.2) | `p,k : ℕ`, `p!`, `hk : 0<k` | `(3,4)`: `[1,−10,9]`, degree2=2; `(2,12)`: `[1,−1,−4096,4096]`, degree3=3; k=1 degree1=1 | Native ℤ polynomial; k=0 excluded and gives rational function instead |
| `thetaPlus` (118; 8.3) | `k,p : ℕ` | `(9,3)={3}`, `(3,3)=∅`, `(12,2)=∅`; a=0 fails Odd | Correct parity and lower endpoint |
| `thetaMinus` (122; 8.3) | `k,p : ℕ` | `(9,3)={1}`, `(15,3)={1,5}`, `(3,3)={1}`; for `(9,3)` cardinal sum `1+1=⌊12/6⌋=2` | Natural valuation zero at nondivisible a is intentional |
| `oddEulerFactorInv` (129; 8.5) | `k,p : ℕ`, `p!` | k=3,p=2: `1+4T`; k=3,p=3: `1`; k=9,p=3: `(1+54T+59049T²)(1−243T)`, since `a′=1`, `(-1)^5·2=−2≡1 mod3` | Plus-set factor has correct sign; scalar denominator nonzero |
| `oddEulerFactor` (136; 8.5) | `k,p : ℕ`; local prime instance inside conditional | k=3,p=2 coefficients `1,−4,16`; p=0,1,4 values `1`; k=1 every prime factor `1` | Inverses are units with constant term1 |
| `oddConductor` (144; 8.5) | `k : ℕ` | k=1→1; k=3→3; k=9→`3·5·7=105`, not radical(9)=3 | Empty product and finite prime cutoff correct |
| `evenEulerFactorInv` (150; 8.6) | `k,p : ℕ`, `p!` | k=4,p=3: Z=`(1−T)(1−9T)`, quotient1; k=6,p=3: quotient `1+27T`; k=8,p=3: quotient `1+81T` | Formula interpreted as motive factor only for positive even k, odd p |
| `evenEulerFactor` (155; 8.6) | `k,p : ℕ`; local prime instance inside conditional | p=2 and nonprime p:1; k=6,p=3 coefficients `1,−27,729`; k=2 every odd factor1 | 2-factor intentionally omitted, restored by existential P |
| `evenConductor` (163; 8.6) | `k : ℕ` | k=2→1; k=6→3; k=12→`3²·5=45`; k=0→1 | Finite product agrees with floor exponents |
| `middleDim` (168; 5.5/10.2) | `k : ℕ` | k=0,1,2,3,4,5,6,7,8: `0,0,0,1,0,2,2,3,2` | Truncated subtraction at0 is not asserted as cohomological dimension |
| `paperGamma` (176; 10.2) | `d : ℕ`, `s : ℂ` | d=0→1; standard/paper ratios d=1→π^(1/2), d=2→π^(3/2); at d=1,s=3: paper=π^(−3/2), standard=π^(−1) | Correct nonzero constant; no s-dependent discrepancy |
| `eulerCoeff` (183; 10.4) | `L : ℕ→PowerSeries ℂ`, `n : ℕ` | all L=1: a(1)=1,a(2)=0; a(0)=1 ignored by LSeries; Lₚ=(1−T)^−1: a(12)=1; L₂=2, others1: coefficient construction a(1)=1 versus product constant2 | README and docstring require normalization for Euler-product interpretation |
| `oddMoment_functionalEquation` (193; 11.4) | `k : ℕ`, `hk : Odd k` | k=1: N=1,d=0,L=1,Λ=1, reflection `1=1`; k=3: N=3,d=1,L=L(χ₋₃,s−2), reflection s↦5−s, sign+1 | Correct native series and NF continuation; no free predicate stand-in |
| `evenMoment_functionalEquation` (208; 11.5) | `k : ℕ`, `hk : Even k`, `hk0 : 0<k`; ∃r,P,ε,Λ precede ∀s | k=2,4: r=0,P=1,ε=1,Λ=1 give `1=1`; k=6,p=3 local inverse=`1+27T`, N′=3,d=2, reflection s↦8−s | Unknown 2-factor has constant1, rational coefficients; quantifiers uniform in s |

### README targets, definitions, and conventions

Rows cover every numbered subsection and every bold target (separate rows for the extra targets of §§7.1 and 11.2). “Agrees” means that the displayed instance agrees with the statement and the identified source, not that a theorem has been formally proved. The admitted domains are respected: there is no field of cardinality one, `Field` excludes the zero ring, ℓ=p is excluded from étale realizations, and rank-zero/k-zero cohomological claims are not inferred from total scalar definitions.

| Statement / README line | Instances tried; computed sides or diagnostic values | Result/change |
| --- | --- | --- |
| 0.1 symmetric trace, 466 | Eigenvalues1,2 give Sym² trace `1+2+4=7=h₂(3,2)`; eigenvalues1,1 give Sym³ trace4=h₃(2,1); zero endomorphism has h₀=1,h₁=h₂=0 | Agrees; detects tensor trace9 |
| 0.2 sums, characters, moments, 495 | F₂ sum1, first moment−1, second−1, third3; F₃ sums−1,2 yield first−1; trivial F₅ character yields first−16, not−1; zero parameter F₂ sum−1 versus empty product fibre0 | Agrees with nontrivial/unit hypotheses |
| 0.3 generating series, 567 | p=2,k=3 moments3,−17,63 give coefficients1,3,−4,0 using `2c₂=−17+9=−8`, `3c₃=63−51−12=0`; k=0 gives `(1−T)/(1−2T)` | Agrees; negative control for k≥1 |
| 1.1 normalization, 611 | r=2,p=2 raw sum1 gives normalized trace−1/√2; extension degree2 multiplies by c^−2=1/2; replacing c by−c reverses odd extension traces for even r | Agrees; c^m convention retained |
| 1.2 irreducibility/local structure, 645 | Rank2 at0 has one invariant versus two for trivial rank2; F₂ characteristic polynomial `1+T+2T²` has det2 and trace−1; total Swan1 excludes rank2 trivial module Swan0 | Agrees |
| 1.3 monodromy groups, 676 | r=2: Sp₂=SL₂, dimension3; odd r=3,p=2: SO₃ preserves quadratic invariant in Sym², unlike SL₃; r=7,p=2 exceptional G₂ dimension14 versus SO₇ dimension21 | Table agrees with XZ; no small-prime exclusion |
| 1.4 cohomology and pairing, 699 | k=0 has H²_c rank1 and is excluded; k=1 has det(1−FT)=1−T and moment−1; k=3,p=2 reciprocal root−4 pairs to16/(−4)=−4 | Agrees |
| 1.5 integer moments, 734 | F₃,k=4: h₄(1,3)=1−9+9=1, h₄(−2,3)=16−36+9=−11, sum−10; F₄,k=3 gives−17; scaling a by c² permutes unit parameters | Agrees |
| 2.1 connection, 771 | r=2 matrix sends v₀↦v₁,v₁↦zv₀, hence θ²v₀=zv₀; r=3 dual sign is z↦−z; λ=0 would give regular nilpotent system | Agrees |
| 2.2 cover, 800 | r=2 substitution x=ty gives x+z/x=t(y+y⁻¹); dz/z=2dt/t; r=3 incorrect action y↦ζy changes ty byζ², correct y↦ζ⁻¹y fixes it | Agrees |
| 2.3 formal structure and Fourier, 825 | r=2 slope1/2 with rank2 gives irregularity1; r=3 gives3·1/3=1; E^(1/(x²+1)) on P¹ minus its poles has two geometric simple poles, index0−1−1=−2 on punctured curve | Agrees with curve-index supplier |
| 2.4 symmetric connections, 856 | rank2,k=2: monomial basis3 versus tensor rank4; k=0: rank1 trivial; zero module,k>0: rank0 | Agrees |
| 2.5 differential Galois groups, 881 | r=2 group SL₂ and Sym² rank3 irreducible; finite quadratic pullback leaves connected group SL₂; exponential y′=y group Gₘ while analytic monodromy1 | R02 |
| 2.6 Bessel comparison, 903 | Cyclic generator θ^r−λ^r x; horizontal first coefficient θ^r−(−1)^rλ^r x; r=2 signs agree, r=3 signs differ; λ=0 loses irregularity | Agrees with corrected convention |
| 3.1 potentials, 940 | r=2,k=1: ambient2, g dimension1; r=3,k=2: ambient5, g dimension4; k=0: empty potential0, excluded from positive-power claims | Agrees |
| 3.2 projectors, 961 | r=2,k=2 swap sign−1 on geometric degree-one tensor factors, signed projector picks Sym² dimension3 not exterior² dimension1; r=2,k=3 cover ranks4/3 descend to2/1 | Agrees; Qℓ permits division by group order even when ℓ divides it |
| 3.3 relative Thom–Sebastiani, 1005 | r=2,k=2: relative degree2, base cohomology total3=nk+1; transposition gives−1; r=3,k=2 gives degree4 and swap+1 | Agrees |
| 3.4 middle image, 1025 | r=2,k=1: full rank1, middle0; k=3 full2,middle1; k=4 full2,middle0; image of zero map0 | Agrees, not ordinary cohomology |
| 3.5 exponential cohomology, 1050 | r=2,k=6 pairing sign(−1)^7=−1, middle dimension2; k=7 sign+1, middle dimension3; concentration degree k+1=7 or8 | Agrees |
| 3.6 inverse Fourier construction, 1082 | k=1 M rank1, ΠM rank2, quotient1; k=2 M rank2 with Fourier costalk dimension1, so rank≠cohomology dimension; k=0 gives punctual input, excluded | Agrees |
| 3.6 pure input and constant correction, 1100–1170 | k=2 pure input weight2, Fourier class weight4/type(2,2), quotient Fourier weight6/type(3,3); k=3 pure input weight3, Fourier middle3 at weight4 | Agrees; ambient and variation weights differ by1 |
| 4.1 classicality, 1195 | k=3 downstairs H¹ weights4 and8, H¹_mid rank1 weight4; E^t on A¹ has all groups0; g=0 has H⁰=Q,H²_c=Q(−1) | Agrees with supplied classical criterion |
| 4.2 hypersurface, 1234 | r=2,k=2 equation numerator `(y₁+y₂)(1+y₁y₂)` singular at(1,−1); k=3 has no balanced sign vector in Q but(1,1,1) in F₃ has g=6=0 | Agrees; smoothness not assumed |
| 4.3 hypersurface comparison, 1260 | r=2,k=3: grW₂H²_c(−1) has weight4= nk+1, downstairs rank1; support degree4 versus compact hypersurface degree2; k=1 excluded by nk≥2 | Agrees; singular case keeps supports |
| 4.4 motive, 1286 | k=1,2,4 ranks0; k=3 rank1 weight4; twist−1 changes weight2→4 | Conditional on declared Nori-weight gap |
| 4.5 finite-field comparison, 1314 | r=p=2 map t↦t² has inseparable degree2, geometric point fibre1; étale cohomology unchanged; k=3,p=2 middle eigenvalue−4 has weight4 | Agrees; no separability claim |
| 5.1 explicit frame, 1357 | k=2: θu₀=2u₁, θu₁=u₂+zu₀, θu₂=2zu₁; diagonal trace0; endpoint terms vanish by coefficients0 | Agrees |
| 5.2 formal structure, 1378 | k=1 cover exponentials±2t, irregularity2 versus downstairs1; k=2 exponents−4t,0,4t, downstairs regular monodromy−1; k=4 regular monodromy+1 | Agrees in characteristic zero; not R03's missing input |
| 5.3 intermediate extensions, 1400 | k=2 regular monodromy−1 gives invariants0 and equality; k=4 gives invariants1 and quotient rank1; at0 one Jordan block has cokernelN dimension1 | Both directions of iff agree |
| 5.4 inverse Fourier local structure, 1421 | k=1 singularities−2,2, rank M1/ΠM2, local eigenvalue−1; k=2 singularities−4,0,4, ranks2/3, eigenvalue+1 | Conditional on declared stationary-phase gap |
| 5.5 dimensions, 1453 | k=1,2,3,4,5,6: full1,1,2,2,3,3; middle0,0,1,0,2,2; cover k=2 full2,middle0 and k=3 full4,middle3 | Agrees |
| 5.6 bases, 1473 | k=3 downstairs basis j=0,1 (2 classes); cover j=0..3 (4); leading determinant9z²; k=2 kernel u₂−zu₀ with graded differential2zu₁−2zu₁=0 | Agrees |
| 5.7 constant quotient weight, 1494 | k=1,2,3: variation weights2,4,6; module weights3,5,7; Fourier quotient weights4,6,8, all rank1 | Agrees; no off-by-one |
| 6.1 fan and projectivity, 1543 | k=1 rays2,cones2, polytope[−1,1] sections3 gives conic; k=2 rays8,cones8, lattice points21 gives P²⁰; primitive cone generators determinant1 | Conditional on declared embedding gap |
| 6.2 compactification, 1594 | k=1 no balanced sign point; k=2 two balanced points; local f=Q(z)/u: first exceptional order2−1=1, second0 | Agrees |
| 6.3 Newton geometry, 1620 | xᵢ exponent has h=1; z/xᵢ exponent has2−1=1; z^j h=2j; k=2 critical point x₁=−x₂ with z=x₁², while odd number of signs cannot sum0 in characteristic0 | Agrees with iff and characteristic restriction |
| 6.4 cover Hodge numbers, 1642 | k=2: (2,2),(3,3), rank2; k=3: (1,3),(2,2),(3,1),(4,4), rank4; middle ranks0,3 | Agrees; primitive index k−1 |
| 6.5 basis filtration, 1666 | k=3: cover F⁴ rank1,F³ rank2,F² rank3; downstairs F⁴ rank1,F³ rank1,F² rank2; pullback z dz/z=2t²dt/t | Agrees; bounds intersect finite basis range |
| 6.6 downstairs Hodge numbers, 1687 | k=3 middle(2,2); k=5 middle(2,4),(4,2); k=6 middle(2,5),(5,2); k=8 middle(2,7),(7,2) plus(5,5),(9,9) in full H¹ | Agrees; all multiplicities1 |
| 7.1 boundary smoothness, 1724 | k=2 chart g₁=1+z₁+z₁z₂²+z₁²z₂²: on z₂=0 and g₁=0, z₁=−1 and derivative1=−1/z₁; on z₁=0, g₁=1, intersection empty | Agrees with restricted derivative assertion |
| 7.1 boundary localization, 1741 | Proper smooth Y: E₂ weights force differentials0; nodal cubic Y: H¹ weight0, so smooth-Y purity cannot be used; empty D: compact/ordinary map identity | Agrees; general singular-Y claim retains grW |
| 7.2 quadratic singularities, 1796 | k=9,p=3: a=1,3 constants6,18, valuations1,2, thickness1,2; k=3,p=2: unique sign point, constant6 valuation1, regular total space but nonordinary fibre | Declared higher-thickness gap correctly used |
| 7.3 even resolution, 1821 | k=4: open grW₂H³_c rank1 versus proper H³ grW₂ rank0; k=6,p=3: balanced section removed but extra b=2 node remains | Agrees; proper/open distinction retained |
| 7.4 Galois realization, 1867 | k=6 rank2 with alternating form to Qℓ(−7); k=7 rank3 symmetric to Qℓ(−8); k=1 zero realization with unique empty pairing | Agrees |
| 8.1 middle polynomial definition, 1910 | M₃(2)=1+4T, M₆(3)=1; α=−4 gives 2⁴/α=−4, erroneous 2²/α=−1 | Agrees with corrected reciprocal involution |
| 8.1 weight theorem, 1925 | k=6,p=3: Z=(1−T)(1+27T), middle rank0, boundary norm3^−3; k=3,p=2 boundary removed leaves norm2^−2 | Formula agrees; R03 prerequisite |
| 8.2 degree/factorization, 1960 | k=12,p=2: degree3, a=b=1, middle0, Z=1−T−4096T²+4096T³; k=10,p=2: degree3, a=b=0, middle2; k=8,p=3: u=v=1,m=2, middle0 | Numerical factors agree; R03 ordering |
| 8.3 odd local structure, 1993 | k=9,p=3: two vanishing lines; a=1 radicand6 ramified, a=3 radicand−18 square class−2≡1 mod3 unramified; invariant eigenvalue243 | Agrees; unramified may be trivial |
| 8.4 even local structure, 2026 | k=6,p=3: dimV2, dimU1, N²0, dimVᴵ1 and inverse factor1+27T; k=4,p=3: V0, H¹_c dim2, E dim2, quotient0 | Agrees |
| 8.5 odd conductor, 2066 | k=9: exponents at3,5,7 each1, N105; k=3,p=3 invariants0 in rank1 so conductor exponent1; p2 exponent0 | Agrees |
| 8.6 even conductor, 2101 | k=6 odd part3; k=12 odd part45, v₃=2,v₅=1; k=2,4 odd part1 | Agrees; unknown 2-exponent not guessed |
| 9.1 p-adic realization/input discharge, 2133 | k=9,p=3 requires thickness2, not unit thickness; k=6,p=5>k/2 good; coefficients k=5,p=2 valuations0,0,2,6 versus n(n−1)=0,0,2,6 | Higher-thickness gap declared; R01 for scalar acceptance consequence |
| 9.2 compatible systems, 2171 | k=3 weights{2}, multiplier χ_cyc^−4 even; k=6 weights{2,5}, multiplier χ_cyc^−7 odd; opposite HT convention sends these to{−2,−5} | Agrees with sign conversion and declared form gap |
| 10.1 determinant, 2212 | k=1 discriminant+1/exponent0; k=3 discriminant−3/exponent−2; k=7 discriminant+105/exponent−12; k=3 middle conjugation sign−1 | Agrees |
| 10.2 gamma comparison, 2241 | d=1 ratioπ^1/2; d=2 ratioπ^3/2, because sum j/2=3/2; d=0 ratio1; k=5 Hodge pair(2,4) gives Γℂ(s−2) | Agrees with corrected constant |
| 10.3 epsilon factors, 2257 | k=3 infinity i^((9−1)/8)=i; k=6,p=3 v=⌊6/12⌋=0, sign+1 and exponent1·(4−s); k=8 infinity−1 | Agrees with additive-character convention |
| 10.4 completion and Dirichlet coefficients, 2282 | Normalized geometric factors yield coefficient a(12)=1; unnormalized L₂=2 yields product constant2 versus a(1)=1; Lₚ=1+T−T² at s0 has evaluated factor1 but a(p)=1, nonsummable | Agrees; absolute summability and normalization necessary |
| 11.1 potential automorphy, 2361 | k=3 rank1, Hodge{2}; k=6 rank2,Hodge{2,5}; k=1,2,4 ranks0 excluded; direct sum of two rank1 systems gives isobaric rank2, not forced cuspidal | Agrees with supplier's semisimple form |
| 11.2 pure local factors, 2383 | k=6,p=3 WD eigenvalues−27,−81 and N rank1: weights6,8 centered7, invariants polynomial1+27T; killing N would give degree2, not1 | Agrees; semisimplification is global with pure graded hypothesis |
| 11.2 coefficient-prime slopes, 2395 | k=3,p=2 middle1+4T slope2=Hodge2; k=5,p=2 middle1−4T+64T² has slopes2,4=Hodge2,4; N0 at odd k | Agrees with coefficient-prime supplier hypothesis discharge |
| 11.2 valuation corollary, 2417 | k=5,p=2 full coefficients1,−5,68,−64: valuations0,0,2,6; zero coefficients satisfy divisibility by every 2-power | R01 |
| 11.3 odd root number, 2446 | k=1 empty motive root1; k=3 quadratic Dirichlet χ₋₃ shifted by2 has completed sign+1; i at infinity requires cancelling finite factor−i | Conditional on settled orthogonal-motive gap |
| 11.4 odd functional equation, 2468 | k=1 Λ=1 gives Λ(3−s)=1; k=3 Dirichlet variable u=s−2 reflected to1−u, giving s↦5−s | Agrees |
| 11.5 even functional equation, 2492 | k=2,4 d0,N′1 allow P1,r0,ε1,Λ1; k=6 d2,N′3 center4, involution8−s twice returns s | Agrees; no conjectural explicit 2-factor |

The finite-field calculations were independently performed by quotient-field arithmetic for F₂,F₄,F₈,F₃,F₉,F₂₇. For example the raw-sum distributions over F₄ are `3` once and `−1` twice; over F₈, `−5` once, `−1` three times, `3` three times. Over F₉ they are `5` once, `2` three times, `−1` twice, `−4` twice. The coefficient recurrence then gives the displayed coefficients without assuming the polynomial theorem. Computations through degree three do not prove that subsequent coefficients vanish; that assertion was compared with the cited degree theorem.


### Source-locator and expression ledger

Each row is one locator family, including its proof when the roadmap extracts a step from the proof. Source formulas were compared with the package's formulas; prose was compared for copied or clause-by-clause expression. Standard names, forced mathematical hypotheses and displayed formulas were not counted as copied expression. Page numbers are those of the explicitly cited arXiv versions, not the journal pagination. The package corrects several source slips; those are listed separately below rather than charged to the package.

| Locator family read | Package use | Comparison |
| --- | --- | --- |
| FSY §1.1, (1.1), pp.2–3; line 55 | §§0.1–0.3 | Trace sign, symmetric rather than ordinary moments, exponential series. |
| FSY Theorems 1.2–1.3, pp.3–4; line 129 | §§11.4–11.5 | Odd sign +1; even unknown 2-factor, conductor exponent and sign. |
| FSY §1.2, (1.5), pp.4–5; line 180 | §§1.1–1.5 | Signed sheaf trace, middle image and degree; rank typo at line 232 corrected in package. |
| FSY Theorem 1.8, pp.7–8; line 314 | §6.6 | All listed Hodge multiplicities and exceptional diagonal types. |
| FSY Proposition 2.4, pp.10–11; line 441 | §§2.1–2.3 | Cyclic operator, slopes and dual sign. |
| FSY Proposition 2.7, p.12; line 529 | §2.5 | SL/Sp differential groups and symmetric-power irreducibility; generic carrier requires R02. |
| FSY Proposition 2.10, pp.12–13; line 565 | §3.3 | Relative tensor/direct-image comparison. |
| FSY Corollary 2.11 and Proposition 2.13, pp.13–15; line 590 | §§3.2–3.5 | Degree nk+1 and signed permutation projector. |
| FSY Corollary 2.15, p.15; line 649 | §§3.4–3.5 | Compact and middle concentration, duality and parity. |
| FSY Proposition 2.21 and its proof, pp.16–18; line 695 | §3.6 | Pure input of weight nk, constant quotient and exponential projector. |
| FSY (3.1), p.18; line 777 | §4.4 | Weight-graded Nori motive and rational projector; conditional weight-filtration supplier. |
| FSY Theorem 3.2, pp.19–21; line 805 | §4.1 | Classicality of all three cohomologies, middle weight nk+1. |
| FSY Theorem 3.8, pp.21–23; line 891 | §§4.2–4.3 | Support cohomology for singular hypersurfaces and compact comparison, nk≥2. |
| FSY §3.2.1, pp.23–24; line 956 | §§1.1, 4.5 | Finite-field Fourier/Thom–Sebastiani presentation; single-object torus typo at line 987. |
| FSY Theorem 3.12, pp.24–25; line 1034 | §4.5 | Finite-field hypersurface comparison and weight/Tate twist. |
| FSY Proposition 4.6, pp.26–27; line 1141 | §§5.1–5.2 | Explicit rank-two frame and local structure. |
| FSY Lemma 4.7, pp.27–28; line 1163 | §5.2 | Formal exponentials, regular factor and parity. |
| FSY Corollaries 4.9–4.10, pp.28–29; line 1189 | §§5.3–5.4 | Intermediate extension criterion; Fourier singularities and block sizes. |
| FSY Proposition 4.12 and (4.13), p.30; line 1251 | §5.5 | All four dimension formulas. |
| FSY Proposition 4.14, Lemmas 4.15 and 4.17, pp.30–32; line 1287 | §5.6 | Basis range, graded complex and even kernel. |
| FSY Proposition 4.20 and proof, pp.32–33; line 1378 | §§5.7, 6.4 | Cover Hodge numbers and constant quotient; primitive index corrected. |
| FSY Proposition 4.21 and completion of proof, pp.34, 38–39; line 1456 and line 1613 | §§6.5–6.6 | Filtration bounds, equality and restricted even range. |
| FSY Newton argument, pp.34–35; line 1474 | §6.3 | Degree of z is two; odd-rank-power nondegeneracy test. |
| FSY toric charts, pp.35–36; line 1514 | §6.1 | Signed-permutation chambers and chart equation; projectivity uses declared toric extension. |
| FSY compactification/blow-up calculation, pp.36–38; line 1550 | §6.2 | Exceptional orders and nondegeneracy after two blow-ups. |
| FSY (5.1)–(5.4), pp.39–40; line 1668 | §§8.1–8.2 | Degrees and all boundary multiplicities, including p=2; source reciprocal involution corrected. |
| FSY boundary calculation, pp.40–41; line 1740 | §7.1 | Derivative restricted to hypersurface-boundary intersection; distinct components. |
| FSY (5.6) and surrounding local equations, pp.41–42; line 1771 | §7.2 | Signed points and constant terms 2ap; higher valuation retained. |
| FSY Theorem 5.8 and proof, pp.42–44; line 1806 | §§7.1, 7.4, 8.3 | Vanishing lines, boundary kernel and quadratic characters. |
| FSY (5.13)–(5.14), pp.44–45; line 1940 | §§8.3, 8.5 | Unramified extra Euler factors and conductor from odd valuations. |
| FSY Theorem 5.17, pp.45–46; line 1983 | §8.4 | Unipotent local representation and tame monodromy. |
| FSY (5.18)–(5.20), pp.46–47; line 2020 | §7.3 | Open resolution versus projective closure and the weight k−2 correction. |
| FSY (5.21)–(5.22), pp.47–49; line 2074 | §§8.4, 8.6 | Local unipotent factor and even Euler polynomial. |
| FSY Proposition 5.23, pp.49–51; line 2199 | §9.1 | de Rham and crystalline/semistable ranges; unit-thickness error handled by declared gap. |
| FSY Corollary 5.27 and Remark 5.28, pp.51–52; line 2294 | §9.1 | Newton/Hodge and coefficient bound; full small-prime boundary input supplied separately. |
| FSY Corollary 5.30 and proof, pp.52–53; line 2338 | §§10.1–10.2 | Determinant, middle real sign and standard gamma constant. |
| FSY §5.3.1–§5.3.2, pp.53–56; line 2416 | §10.3 | Global character sign and finite/infinite epsilon factors; ordering error in (5.32) is not copied. |
| FSY Theorem 5.38 and Corollary 5.39, pp.57–58; line 2569 | §§9.2, 11.1 | Regular polarized compatible systems; semisimple constituent automorphy. |
| FSY Lemma 5.40 and end of proof, p.58; line 2629 | §§11.2–11.3 | Pure graded WD comparison; Saito invocation checked only as an invocation. |
| FSY Remark 5.41, p.59; line 2660 | §11.2 | Coefficient-prime slope consequence; package uses a stronger explicit supplier route, not the erroneous displayed invariants equality. |
| FSY Appendix A: A.3, A.13, A.19, A.27, A.30–A.31; lines 2872, 2972, 3024, 3208, 3241, 3256 | Supplier contracts and §§3.6–4.3 | Shift, classical embedding, exponential cohomology, support comparison and Fourier costalk; no separate appendix theory is replanned here. |
| XZ §1.1.1, p.2; line 58 | §2.6 | Cyclic generator versus horizontal scalar equation. |
| XZ §1.1.2, p.3; line 105 | §1.1 | Weight-zero normalization and geometric Frobenius trace. |
| XZ §1.1.2, pp.3–4; line 120 | §§1.2–1.3 | Local conditions and full classical/exceptional monodromy table. |
| XZ §2.1.5, p.10; line 480 | Conventions | Dwork connection and direction of horizontal Frobenius. |
| XZ §4.1.13, p.42; line 1974 | §2.6 and conventions | Exponential D-module parameter agrees after the specified sign correction. |
| Serre-orthogonal Theorem 4.2.1, Lemma 4.2.4, pp.9–10; line 382 | §9.2 supplier gap | Characteristic-zero symmetric/alternating form survives semisimplification; three proof misprints do not alter the theorem. |

Six additional prose comparisons, outside the target statements: the normalization discussion at README 619 against XZ line 105; the inverse Fourier proof plan at README 1082–1137 against FSY line 695; the constant-quotient proof at README 1500 against FSY line 1403; the toric construction at README 1543 against FSY line 1514; the resolution discussion at README 1821 against FSY line 1997; and the odd functional-equation docstring at Suggested.lean 186 against FSY line 129. No non-forced copied sentence, translated passage, clause-by-clause paraphrase, source table or figure was identified in these comparisons. The shared short expressions are mathematical names and formulas.

FSY has the largest share: 94 of 102 source-labelled locator groups before References (a group may contain several theorem numbers; two bare mentions of FSY without a locator are excluded). XZ has six, Serre-orthogonal one, and Saito-orthogonal one. FSY's contents were read at FSY lines 14–35 and 44–51. The comparison was: Layers 2–3 use parts of FSY §2, Layer 4 uses §3, Layers 5–6 use §4, Layers 7–9 split §5.1 by geometry, local representations and p-adic comparison, Layer 10 combines §5.2 with §5.3.1–2, and Layer 11 uses §5.3.3. This is not a one-to-one run with the same section scopes. In particular the toric and blow-up inputs precede the Hodge table here but occur inside its proof in FSY, and generic Appendix A theory is imported from another roadmap. The Needs chains §5.6→§6.5→§6.6→§9.2→§11.1 and §§7.1–7.4→§8.3→§9.1 explain the retained mathematical order. No arrangement finding is made.

## Not verifiable

- Saito-orthogonal is settled as uncertified. Its main theorem was not read; FSY line 2656 confirms that it is the theorem invoked here. No renewed source request was made.
- The six declared supplier extensions are precise planned contracts. This pass verifies their declaration, location and use, not future implementations or proofs.
- No fresh Lean build, elaboration or proof checking was run, as required. All 21 supplied elaborated signatures were compared; R01's proposed signature is checked by inspection only.
- Finite-field calculations used six fields and coefficients through degree three. They detect sign, trace, degree and small-prime errors but do not certify every coefficient or every prime. Geometric universal statements were checked against their cited sources and hypotheses.
- The lack of the named geometric carriers at the pins was checked by object/name searches and the actual nearby APIs. This is not a claim that no possible elaborate encoding exists; such encodings are excluded by the acceptance-test contract.

## Source issues

- **Misprint** in FSY at §1.2, p.5 (FSY line 232): the source says the rank-two middle image uses rank `n+1` sheaves on its right; it should be `Kl₂` on both sides; affects a stated result.
- **Misprint** in FSY at §1.3, p.7 (FSY line 300): the source says the z-coordinate period equation has constant coefficient `−1`; it should be `y″+z⁻¹y′−z⁻¹y=0`, or explicitly change coordinate to `2√z`; affects a stated result.
- **Misprint** in FSY at §3.2.1, p.23 (FSY line 987): the source says the single Kloosterman object uses a torus of dimension `nk`; it should be dimension `n`, reserving `nk` for k tensor factors; affects the proof.
- **Misprint** in FSY at proof of Proposition 4.20, p.33 (FSY line 1408): the source says the primitive index is `k`; it should be `k−1` for a block of size k centered at k−1; affects the proof.
- **Error** in FSY at §5.1.1, p.40 (FSY line 1731): the source says reciprocal roots pair by `α↦p^((k+1)/2)/α`; it should be `α↦p^(k+1)/α`; affects a stated result.
- **Error** in FSY at §5.1.2, p.41 (FSY line 1761): the source says the derivative is nowhere zero on the whole boundary chart; it should be nonzero on its intersection with the hypersurface, with distinct components for codimension counts; affects the proof.
- **Error** in FSY at proof of Proposition 5.23, p.50 (FSY line 2249): the source says every quadratic point has unit thickness over `ℤ_p[√−p]`; it should allow thickness `e=1+v_p(a)`, e.g. k=9,p=3,a=3 gives e=2; affects the proof.
- **Error** in FSY at proof of Corollary 5.27, p.51 (FSY line 2309): the source says only the generic one- or two-dimensional boundary factor is restored; it should restore the full small-prime factor, e.g. k=6,p=3 has slopes 0,3; affects the proof.
- **Error** in FSY at Corollary 5.30, p.52 (FSY line 2350): the source says the standard archimedean factor equals its displayed paper-normalized product; it should include the factor `π^(d(d+1)/4)`, equal to `√π` at d=1; affects a stated result.
- **Error** in FSY at (5.32), p.54 (FSY line 2443): the source says remove tame monodromy by multiplying on the right by `exp(−tN)`; it should multiply on the left, or rescale the right-hand exponent by `p^n`; affects the proof.
- **Error** in FSY at Remark 5.41, p.59 (FSY line 2676): the source says the inertia-invariant Euler polynomial equals the determinant on the whole semistable module over L; it should retain `ker N` and inertia descent invariants; affects the proof.
- **Error** in FSY at Appendix A.2, p.62 (FSY line 2832): the source says the Verdier dual of the constant perverse Hodge module has twist `−d`; it should have twist `+d`, giving dual weight `−d`; affects a stated result.
- **Misprint** in FSY at Example A.3, p.63 (FSY line 2876): the source says the derived closed pullback is the degree-zero constant perverse object of the divisor; it should be that object shifted by `[1]`, with its nonzero cohomology in degree −1; affects a stated result.
- **Misprint** in FSY at Example A.27, p.71 (FSY line 3222): the source says the pushforward supported on the zero fibre is the zero map; it should say the underlying morphism factors through the point zero, not that the pushforward vanishes; affects the proof.
- **Misprint** in XZ at §1.1.1, p.2 (XZ line 62): the source says the homogeneous Bessel equation has a unique holomorphic solution at zero; it should specify the normalization `f(0)=1`, since scalar multiples are also solutions; affects a stated result.
- **Error** in XZ at §1.1.1, p.2 and §4.1.13, p.42 (XZ line 97 and line 1979): the source says the same exponential parameter represents both `d−λdx` and `D/(∂−λ)`; it should use `d+λdx` for that left D-module, with the corresponding odd-rank horizontal sign; affects a stated result.
- **Error** in XZ at §2.1.5, p.10 (XZ line 489): the source says multiplication by `exp(π(x−x^p))` is horizontal from Frobenius pullback to `d+πdx`; it should use its inverse in that direction, or reverse the connection sign; affects a stated result.
- **Misprint** in Serre-orthogonal at proof of Theorem 4.2.1, p.10 (Serre-orthogonal line 393): the source says total isotropy requires vanishing on all pairs in E; it should require pairs in S; affects the proof.
- **Misprint** in Serre-orthogonal at proof of Theorem 4.2.1, p.10 (Serre-orthogonal line 394): the source says compatibility follows from (4.2.2), the conclusion being proved; it should cite the original involution compatibility (4.1.1); affects the proof.
- **Misprint** in Serre-orthogonal at proof of Lemma 4.2.4(ii), p.10 (Serre-orthogonal line 411): the source says S has half the dimension of M; it should have half the dimension of `M⊥`; affects the proof.
- **Misprint** in Yun-moments at Lemma 4.3.4, p.37 (Yun-moments line 1660): the source says the invariant Frobenius lines have twist `+d/2`; it should be `−d/2`, since its proof gives geometric eigenvalues `±2^(d/2)`; affects a stated result.
- **Gap** in Yun-moments at §4.4.1, p.40 (Yun-moments line 1805): the source says determinant calculation implies ramification at every odd p≤d; it should also prove representation ramification when the determinant is unramified, e.g. d=15,p=3 with valuation four; affects the proof.

For the noncommuting-order error in FSY (5.32), take `N=[[0,1],[0,0]]`, geometric Frobenius `φ=diag(1,p)` and tame inertia `exp(tN)`. The printed operation returns `exp((1−p⁻¹)tN)φ`, whereas the corrected operation returns `φ`. For the whole-period-module error in Remark 5.41, k=6,p=3 has period rank two and inertia-invariant rank one. These are source errors, not additional package findings: the package's local-factor statements retain N and the required invariants.

Source independence: 53 passage comparisons with 3 package sources; no non-forced expression reuse identified; largest share FSY, 94 of 102 locator groups; contents compared with FSY: no one-to-one arrangement found. Saito-orthogonal text remains uncertified; FSY, the largest-share source, and its contents were available.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cdfffd9b058d84dceef7b41b74d255604f5fea1f", "job": "RT-KloostermanMomentsAndPotentialAutomorphy~1a", "model": "gpt-6-astra", "worker": "chris-10"} -->
