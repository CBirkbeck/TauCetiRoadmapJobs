# PORT-AutomorphicCongruences

Branch `roadmap/automorphic-congruences`, created from main at a0ad405; head commit 90ff9a0
(`AutomorphicCongruences: roadmap (README, Suggested.lean, metadata)`). Files added:
`TauCetiRoadmap/AutomorphicCongruences/README.md`, `TauCetiRoadmap/AutomorphicCongruences/Suggested.lean`,
`TauCetiRoadmap/AutomorphicCongruences/metadata.toml` (`topic = "math.NT"`, as the neighbouring number-theory
folders on main). Nothing outside the folder was touched.

## Build

`lake build TauCetiRoadmap.AutomorphicCongruences.Suggested`:

```text
✔ [8954/8954] Built TauCetiRoadmap.AutomorphicCongruences.Suggested (2.7s)
Build completed successfully (8954 jobs).
```

Warning count: 0 (the file declares nothing, so there is no `sorry` warning either).

## Gate

```text
gate AutomorphicCongruences: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency direction (`gate --depcheck … --movable`), run on the committed README:

```text
depcheck: 233 roadmaps, 2129 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The resolver (`roadmaps resolve`) lists no cross-roadmap citation and no
Lean name found nowhere.

## Draft pull request body

Eisenstein congruences on unitary groups produce integral Galois extension classes and hence lower bounds for
Selmer groups, the "reverse" divisibilities of the Iwasawa main conjectures for GL₂. This roadmap builds those
congruence arguments as a library: the Σ-primitive ordinary Selmer groups over Iwasawa towers with their
control and Euler-factor comparisons, Eisenstein ideals of Λ-adic Eisenstein families, the polarized
three-block lattice construction of Skinner–Urban in the generality of a CM quadratic extension of a totally
real field, and the CM congruence input in its integral form; on top of them the ordinary GU(2,2) argument of
Skinner–Urban over an imaginary quadratic field, the semi-ordinary and general-weight GU(3,1) arguments of
Castella–Liu–Wan and Fouquet–Wan (with the two-family Fourier–Jacobi theorem that repairs the simultaneous-unit
step, Ichino's triple product formula and Ikeda's dense-image theorem stated in the generality used), the
Beilinson–Flach reciprocity laws and the seed main conjectures at crystalline-short and ordinary points,
Nakamura's universal zeta morphism and Fouquet–Wan's fundamental lines over the universal deformation ring,
Wan's totally real Hilbert-family engine through Fujiwara's minimal R = T, and the Burungale–Castella–Skinner
two-variable product bound with its projection to the cyclotomic line and four-twist factor separation. The
end theorems are the Skinner–Urban two-variable and cyclotomic divisibilities, the Castella–Liu–Wan localized
and p-inverted divisibilities, Fouquet–Wan's universal-family and pointwise main conjectures, Wan's parallel
Hilbert-family divisibility, and the rational and integral ordinary main conjectures for elliptic curves over ℚ
under the rank-one image condition. Each endpoint keeps its own residual, local, coefficient-ring and period
hypotheses; the scalar assembly of the main conjectures is left to ModularIwasawaMainConjectures and the
anticyclotomic applications to HeegnerPointEulerSystems, which consume this roadmap.

`Suggested.lean` states nothing: none of the headline theorems is statable against the pinned Mathlib and Tau
Ceti. Its module docstring names each headline and the carrier it lacks (Σ-primitive ordinary Selmer groups
over Iwasawa towers and their characteristic ideals, the p-adic L-functions of Skinner–Urban, Castella–Liu–Wan,
Fouquet–Wan, Wan and Mazur–Swinnerton-Dyer, universal deformation rings with Selmer complexes and determinant
lines, nearly ordinary Hilbert Hida families, Nakamura's zeta morphism on completed homology).

Written with AI assistance (Claude).

## Suppliers that are still pull requests

Cited suppliers on main: EllipticCurves, PadicMeasuresIwasawaAlgebras, ProfiniteCohomology (and IntegralLattices,
named in Scope as retaining its ownership). Completed: NumberFieldArithmetic (and LocalGaloisGroups,
ProfiniteArithmetic, named in Scope only). Cited suppliers that are still open pull requests, all earlier in the
merge order (depcheck confirms): ArithmeticGaloisDuality, AutomorphicBundles, AutomorphicGaloisRepresentationsPartII,
AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, ClassicalSerreModularity,
CompletedCohomologyAndLocalGlobalCompatibility, DeformationAndDerivedPatchingAlgebra, DirichletPadicLFunctions,
EulerSystemsAndKolyvaginSystems, EulerSystemsCyclotomicMainConjecture, GL2ModularityLifting,
GlobalGaloisDeformations, GrossZagierAndArithmeticHeights, IgusaVarietiesAndTorsionConcentration,
IntegralHeckeAndGaloisDeterminants, IntegralIwasawaTheory, KatoEulerSystems, LocalGaloisDeformationRings,
MetaplecticAutomorphicForms, ModularSymbolsPadicLFunctions, OrdinaryAutomorphicFormsAndModularityLifting,
PELModuli, PadicFamilies, PadicHodgeRegulators, PadicLocalLanglandsForGL2Qp, PhiGammaModulesAndIwasawaCohomology,
SelmerIwasawaCohomology, SerreWeightAndLevelOptimisation, ShimuraCompactifications,
SmoothRepresentationsOfLocalGroups. The sixteen `What <Supplier> must provide (gap:<slug>)` contracts of the
accepted package are kept verbatim (the review was accepted conditional on them). Consumers named in the README
(ModularIwasawaMainConjectures, HeegnerPointEulerSystems) are later in the order; RankOneConverse (open) also
cites §2.22 as a consumer.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfied the acceptance-test rule: a module docstring listing
the headline theorems with the carrier each lacks, and no declarations. I re-checked the carriers at this
worktree's pins (Tau Ceti 358314d, Mathlib f6090c7): grep for `Selmer` finds only the Mordell–Weil descent
Selmer groups (`TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean` and neighbours) and
Mathlib's S-unit `selmerGroup`; `Iwasawa`, `charIdeal`, `charDivisor`, `Hida`, `padicL`, `Yager`, `zetaMorphism`
have no hit as carriers; `completedGroupAlgebra` and `fittingIdeal` exist and carry no Selmer condition. So no
statable headline is absent and nothing is forced through a stand-in. Changes to the Lean file: the
`Copyright … Authors: Codex` header was dropped (most Suggested.lean files on main, and the sibling ports, start
with `module`), and the empty `@[expose] public section … end` was removed; the docstring is unchanged and its
section numbers agree with the README. `#check @name` audit: zero declarations, so nothing to elaborate; stated
here as required.

## Review notes applied (REV-PKG-AutomorphicCongruences~6, four P3 notes)

- F01 (Domain-of-β Check, now §5.4): already repaired in the package head (the Check now states the
  "exactly when w(κ0) = 0" clause only for a surviving anticyclotomic variable and gives γ_cyc − c as the
  kernel example). No change.
- F02: §5.5 source line now reads "Proposition 96, pp. 78–79, and its proof, pp. 79–81".
- F03: §5.4 source line now says the only prime restriction "Wan's printed proof adds beyond the hypotheses
  of Hung2017 Theorem B (cited by locator)" is the stabilizer argument.
- F04: one sentence added to the first Scope paragraph recording that ArithmeticStatisticsPartVI's
  anticyclotomic main-conjecture implication uses the weight-two anticyclotomic specialization of §2.22 and
  that §2.22 is the general statement. Verified at the current head of ArithmeticStatisticsPartVI (README line
  2399, "Prove the needed Wan divisibility and its anticyclotomic specialization"). It is not a supplier edge;
  depcheck is unchanged.

## Other README edits (reported as an upstream reviewer would)

- "Exact supplier contracts" intro: dropped "with the same slug in design/plan.json" (a board artifact, not
  part of the roadmap).
- §6.4 Check: "The suggested integer predicates distinguish these cases" referred to Lean predicates that the
  acceptance test does not declare; now "the two congruence classes modulo 8 distinguish these cases".
- §5.13 proof: "BOTH" → "both".
- §8.1: "no hidden 'assume the divisibility' field" → "no hypothesis assuming the divisibility is admitted",
  since there is no Lean structure to have a field.

No target was found wrong or vacuous; the computed pass below records what was recomputed.

## Supplier replacements and duplication removals

None. Every library declaration named in the README exists at the pins (checked by grep at this worktree's
`.lake/packages`): `TauCeti.ContCohomology.H1` (LowDegree.lean:725), `TauCeti.fittingIdeal`
(FittingIdeal/Basic.lean:343), `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`
(QuadraticTwist/Basic.lean), `NumberField.ncard_primesOver_multiquadratic_iff`, `TauCeti.Multiquadratic.isGalois`,
`TauCeti.Multiquadratic.oddPrimeDiscriminant` (Prime/Discriminant/Basic.lean:50); Mathlib `Module.length`
(RingTheory/Length.lean:30), `Matrix.coeff_charpolyRev_eq_neg_trace` (Charpoly/Coeff.lean:334),
`RingHom.quotientKerEquivOfSurjective_apply_mk` (Ideal/Quotient/Operations.lean:93), `Ideal.mk_ker`,
`RingHom.comap_ker` (Ideal/Maps.lean:769), `Ideal.span_singleton_mul_left_unit`, `IsRegularLocalRing`,
`LocalizedModule`. The three supplier names that are not Lean declarations, `charDivisor` and `detLine`
(PadicMeasuresIwasawaAlgebras README §§4.6 and 5.1, on main) and `wilesMainConjecture` (IntegralIwasawaTheory
README §12.1), are README target names of their owners and are cited as such. Main-branch section citations
resolved by hand: PadicMeasuresIwasawaAlgebras §§4.1, 4.4, 4.6, 5.1, 6.5; ProfiniteCohomology Layer 7;
EllipticCurves Layers 2 and 7; NumberFieldArithmetic §1.1.

Duplication sweep by object (`roadmaps grep` over main and the 460 open heads, index of 2026-11-05):
- Nakamura's universal zeta morphism (§3.7): CompletedCohomologyAndLocalGlobalCompatibility only recalls
  Nakamura's objects as inputs to his zeta morphisms (its lines 456, 1028, 1607, 2172) and does not plan the
  morphism; CMRankZeroConverse and KatoEulerSystems use Kato's classical zeta morphisms. Owner here.
- Yager module (§2.19): the only other hits are Rubin–Yager mentions and the bibliography entry in
  NoncommutativeAndEquivariantIwasawa. Owner here.
- Klingen Eisenstein series: SiegelModularForms plans Klingen Eisenstein series on Sp₄; the families here are on
  the unitary groups GU(2,2) and GU(3,1) with p-adic interpolation, a different object. No overlap.
- Eisenstein ideals: IntegralIwasawaTheory defines `ordinaryEisensteinIdeal` for the level-one GL₂ ordinary
  algebra and EisensteinIdealAndRationalTorsion owns Mazur's ideal; §0.4 here is the Λ-adic Eisenstein-family
  construction used on unitary groups and distinguishes itself from both (its Checks name the Mazur setting).
- The weight-two anticyclotomic specialization of §2.22 is planned again by ArithmeticStatisticsPartVI (earlier
  in the order, so it cannot cite this roadmap); recorded in Scope per F04. The restatement on that side is for
  its author or the operator.
Ownership against open pull requests was checked through the roadmap service for these objects only.

## Adversarial mathematics pass (computed)

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Conventions, reciprocal polynomial (used in §§0.5, 1.3, 1.8, 2.6, 3.7, 4.6, 5.6) | eigenvalues 1,2,3,4 | e₁=10, e₂=35, e₃=50, e₄=24, so det(1−MX)=1−10X+35X²−50X³+24X⁴; minus coefficient 1 is 10 = trace | Matches. No change. |
| §0.3(ii) direction | A=ℤ_p[[T]], 𝔞=(T), X=A/(p,T) | X pseudo-null so Ch_A(X)=(1); X/TX=𝔽_p has Ch=(p); (1) mod T ⊇ (p) | Containment direction right; reverse would need 1∈(p). No change. |
| §0.4 Eisenstein ideal | weight 12, level 1, p=691 and p=5 | τ(2)−(1+2¹¹)=−24−2049=−2073=−3·691, v₆₉₁=1; at p=5, −24≡1, 2049≡4, not congruent | 𝔈_E=(691) at 691, unit ideal at 5. No change. |
| §0.7 negative control | K=ℚ(i), p=5, S-unit 1+i | (1+i)²=2i, (1+i)⁴=−4=1−5, primitive principal unit at both primes above 5 | Middle Selmer group zero while ord_P(J)=1: N′=0 alone gives no J-bound. No change. |
| §0.9 Check | K=ℚ(√−23), p=3; 𝔫=7, 5 | h_K=3; −23≡1 mod 3 so 3 splits; φ(7)=6 (v₃=1, case (D)), φ(5)=4 (unit, case (B)) | Cases selected as stated. No change. |
| §1.1 Igusa fibre | p=3 | |GL₂(𝔽₃)|=(9−1)(9−3)=48, 48²=2304, torus 2⁴=16; UV=[[2,1],[1,1]], VU=[[1,1],[1,2]] | Noncommutative, counts right. No change. |
| §1.5(iii) nonsplit witness | 11a1, p=7, K=ℚ(√−3), ℓ=113 | point count gives a₁₁₃=9 (also a₇=−2 unit); 113≡2 mod 3 inert, 113≡1 mod 7; ((113+1)²−81)/113²=12915/12769, 12915=3²·5·7·41, v₇=1 | SU Prop. 12.3.6 fails at Σ∪{113}; (iii)(b) bound holds. No change. |
| §1.5 split factor μ=0 | (1+Y)^u, u=p^k·m, p∤m | binom(u,p^k)≡m mod p (Lucas) unit; binom(u,j) for j<p^k divisible by p | First unit coefficient at Y^(p^k): μ=0. No change. |
| §1.7(ii) level test | K=ℚ(√−7), p=11, M⁻=3, M⁺∈{13,29} | −7≡4=2² mod 11 split; −7≡2 mod 3 inert; −7≡6 mod 13 nonsquare (squares 1,3,4,9,10,12) inert, rejected; −7≡22=14² mod 29 split, accepted | As stated. No change. |
| §1.10 pulled-back prime | P₀=Q·𝕀[[Γ_K]], E∈𝕀[[Γ⁺_K]] | ord_{P₀}(E)=ord_Q(E) (flat extension); ord_{P₀}(Ch^Σ)=ord(Ch^{Σ∖Σ^ns})+ord_Q(E^ns)≥ord_Q(E^ns)≥ord_{P₀}(L^Σ) | Euler-factor route closes. No change. |
| §1.11 field choice | 11a1, p=7, K=ℚ(√−3); p=5 | −3≡4=2² mod 7 split; −3≡8 mod 11 nonsquare (squares 1,3,4,5,9) inert; 11a1 has a rational 5-torsion point so (irred) fails at 5 | As stated. No change. |
| §2.4 raw versus normalized triple-product identity | added prime 2, Satake (i,−i) each | ζ₂(2)=4/3; L₂(1/2,Π,r)=(3/2)⁻⁴=16/81; L₂(1,Π,Ad)=(8/9)³=512/729; J₂=(16/9)(16/81)/(512/729)=1/2; omitted Euler factor ×2 and J₂ ×1/2 cancel | Identity Σ-independent; mixed convention off by 32/9 or 2. No change. |
| §2.10 archimedean multiplier | (k,m,κ)=(2,0,6) | Γ(5)Γ(6)=24·120=2880; 2^(−17); π^(−11); i^(−5)=−i | Formula as printed. No change. |
| §2.15 fixed-form instance | 11a1, p=3, K=ℚ(√−2) | a₃=−1 unit; −2≡1 mod 3 split; −2≡3 mod 5 nonsquare so 5 inert; a₅=1; X²−(a₅²−10)X+25=X²+9X+25≡X²+1 mod 3 irreducible | (irr_K) holds; neither CW (p>3) nor FW (11 ramified) form applies. No change. |
| §2.18 field choice | ℓ=7, p=5 | (−7/5)=(3/5)=−1 inert, rejected; −91≡4 mod 5, (4/5)=1 split, accepted | As stated. No change. |
| §2.19 Yager convention | 𝔽₂₇=𝔽₃[a]/(a³−a−1), τ(a)=a+1 | y(a)=(a,a+1,a+2); y(a)^τ=(a+1,a+2,a); e_{τ²}·y(a)=(a+1,a+2,a); the inverted pairing gives (a,a+2,a+1) whose conjugate (a+1,a,a+2)≠τ⋆ image (a+2,a+1,a) | Convention pinned by the witness. No change. |
| §3.2 Check | B=O[[x,y,z]][t]/(t²−x²), O[t]/(t²) | B finite free rank 2, reduced for p odd (distinct factors t±x), singular since t²−x²∈m²; O[t]/(t²) flat, not reduced | Finite flatness gives neither. No change. |
| §4.5 parity | p=5 weight 2; p=3 | det=ω^(k−1)=ω; scalar χ̄⊕χ̄ gives ω^(2a): 2a≡1 mod 4 and mod 2 unsolvable | Scalar case excluded automatically. No change. |
| §4.8 projectors | 𝔽₅, Δ=𝔽₅^×, η Teichmüller | 1/4=4; e_η=4[1]+2[2]+3[3]+[4]; [2]·e_η=3[1]+4[2]+[3]+2[4]=2·e_η | η-component right; p=2 excluded. No change. |
| §5.2 congruence line | T=ℤ₅[x]/(x(x−5))↪ℤ₅², x↦(0,5) | image {(a,b): a≡b mod 5}; e=(1,0)∉T; T∩ℚ₅e=ℤ₅(5,0); ℓ=(5,0), ℓ²=(25,0)=5ℓ, η=5; period 10/5=2, unit rescale 2η gives 1, η=25 gives 2/5 | Not idempotent; unit invariance only. No change. |
| §5.4 stabilizer argument | p=3,5,7, p unramified in F | [F(ζ_p):F]=p−1=2,4,6; order-p element forces p−1≤2 | p=5 admitted, p=3 excluded (F03 wording applied). |
| §5.5 Δ+ Checks | F=ℚ(√29), M=Fℚ(√−7), p=23; F=ℚ(√3), M=ℚ(ζ₁₂), p=13 | 11²=121≡6≡29 and 4²=16≡−7 mod 23; disc M=29·7·203=203², N(D_{M/F})=49; (−7/29)=(29/7)=1; second: 144/12²=1 so M/F unramified, M the narrow Hilbert class field; 4²≡3, 5²≡−1 mod 13 | Δ+ separates the pairs. No change. |
| §5.13 inertia test | p=5, ℓ=19, 11 | 19≡−1 inert in F, q_v=361≡1; 11≡1 split, q_v=11≡1; ℓ=19 split would give q_v≡−1 | Both tests discharged. No change. |
| §6.4 Checks | K=ℚ(√−7), F=ℚ(√29) | −7≡1 mod 8 so 2 splits; 29 odd, −7≡22=14² mod 29 so 29 splits in K; 7∤29 so FK/F ramified above 7 | Δ+ automatic. No change. |
| §7.6 twist stability | σ=[[1,u],[0,1]], u unit; u=p; p=2 | cokernel ℤ_p for u unit; ℤ_p⊕ℤ/p for u=p; σ²: (1+N)²−1=2N, 2 unit for p odd, nonunit at p=2 | As stated. No change. |
| §7.8 factor separation | defects (1,0,0,0), (1,−1,0,0), (0,0,0,0) | sums 1, 0, 0; individual bounds force each ≥0 | Only zero survives. No change. |
| §7.10 integral example | E: y²=x³−4x+7, p=5 | Δ=−16·1067=−16·11·97; #E(𝔽₃)=7, a₃=−3; #E(𝔽₅)=4, a₅=2; disc(X²+3X+3)=−3≡2 nonsquare mod 5; c₄=192 unit at 11, v₁₁(Δ)=1, −c₆=6048≡9=3² mod 11 split multiplicative; 1−1/11=10/11, v₅=1 | Included in the integral endpoint; unsaturated criterion fails. No change. |
| Headlines §§1.10–1.11, 2.7–2.8, 2.14, 2.20–2.22, 4.3, 4.5, 5.10, 6.6, 7.9–7.10 | (ϖ³)⊆(ϖ²) versus (ϖ)⊄(ϖ²); (p) versus (1) after inverting p; O[[S,T]] localized at O[[S]] | reverse-divisibility direction and the localized/p-inverted distinctions as in the Checks | Directions consistent across layers. No change. |

Standing hypotheses: coefficient rings are nonzero normal domains or p-adic integer rings; p=2 is excluded where
idempotents (1±c)/2 are used (§§4.8, 7.2) and p=3 where the stabilizer or Hid06 inputs need it (§§0.9, 5.4,
5.10). Natural-number subtraction and division by a possibly-zero quantity occur nowhere in a statement (§3.4
and §4.4 explicitly refuse to invert a vanishing Euler factor).

## Unresolved

- Nothing blocks the submission. The sixteen gap contracts remain conditions on their suppliers, as in the
  accepted review.
- Hung2017, Ichino2008, Ikeda1994, Harris1984, Rubin2000 and BST19 are uncertified or waived sources cited by
  locator, as in the package; their contents are not claimed verified here.
- Ownership against open pull requests was checked through the roadmap service for the objects listed above
  only.
- No fetched text asked for a command, a credential or a change of behaviour; nothing suspicious to quote.


Pull request: #1816 (roadmap/automorphic-congruences at 90ff9a0)
