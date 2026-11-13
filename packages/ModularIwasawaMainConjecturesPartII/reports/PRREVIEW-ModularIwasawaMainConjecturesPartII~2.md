# Review of ModularIwasawaMainConjecturesPartII (pull request #2281 at 227dc5d)

**Verdict:** needs changes

## R01 (P2) — Kronecker's formula still has two owners

**Location:** `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/README.md:312`: “Prove that they hold in this normalization”; the proof route is at line 318 and the supplier description at line 122.

**Claim:** Changing ordinary absolute values to squared norms does not extend the corrected formula already owned by NonordinaryCMSpecialValues §§2.2–2.3. Its current Check is also misquoted in the supplier contract.

**Witness:** PR #2290, `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:352` already has `2 Σ χ log|σ(u)| = (N(a) − χ(a)⁻¹)L′`; line 365 gives ordinary norm logarithm `−6 log 3`, doubled to `−12 log 3`.

**Repair:** Import these formulas in Scope and ownership; delete their theorem and proof route here. Retain the normalization dictionary and numerical Checks. Replace the contract's last sentence by “The supplier uses ordinary absolute values and an explicit factor 2; here `log(uū) = 2 log|u|_ordinary`, so its formulas and generators are unchanged.”

## R02 (P2) — The two-dimensional descent requires a height-one prime

**Location:** `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/README.md:852`: “let `𝔭 ∌ p`, `q` its inverse image, and `A = O_λ[[G_{p∞f}]]_q`, a regular local ring of dimension two”.

**Claim:** The settings of §§7.5–7.6 allow height-zero primes too. Their inverse-image localizations have dimension one, so the asserted dimension does not follow from the stated hypothesis.

**Witness:** Take the contained Gaussian case of §7.8: `Λ′ = ℤ₂[i][[T]]`, `𝔭 = (0)`. Its inverse-image localization is a DVR, of dimension 1. Kato line 5763 explicitly requires height 1 in Proposition 15.17.

**Repair:** Begin “In the setting of §7.5 (or §7.6), let `𝔭` be a height-one prime not containing `p`.” Add the Check “For `𝔭 = (0)` in the contained Gaussian case, `dim A = 1`; this is §7.8, outside this descent statement.”

## R03 (P3) — The normalization exists integrally

**Location:** `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/README.md:178`: “The normalization statement holds only after inverting `p`.”

**Claim:** This confuses the normalization with the normalization map being an isomorphism, and contradicts the integral normalization asserted at line 168.

**Witness:** `ℤ₂[C₂] → ℤ₂ × ℤ₂` has image `{(a,b) : a ≡ b mod 2}`. The missing idempotent `(1,0)` is integral, satisfying `e² − e = 0`; the integral closure is already the product.

**Repair:** Replace the sentence by “The normalization is `ℤ₂ × ℤ₂` integrally; the normalization map becomes an isomorphism only after inverting 2.”

## R04 (P3) — The summary presents planned arithmetic APIs as library APIs

**Location:** Pull request description, `roadmap-summary` block, “Approach and generality”: “It reuses Tau Ceti's cohomology, CM constructions and characteristic ideals alongside Mathlib's class groups, regulators and localization theory.”

**Claim:** The arithmetic objects used here are supplied by roadmaps; the pinned libraries do not yet provide these objects. The module docstring expressly records their absence.

**Witness:** `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/Suggested.lean:18`–23 lists the absent norm limits, CM theta values, arithmetic complexes and determinant lines; README lines 78–82 and 122 instead name their roadmap suppliers.

**Repair:** Replace that sentence by “It consumes the planned arithmetic cohomology, CM constructions and characteristic ideals of SelmerIwasawaCohomology, NonordinaryCMSpecialValues and PadicMeasuresIwasawaAlgebras, together with native Tau Ceti ray class fields and completed group algebras and Mathlib's class groups, regulators and localization theory.”

## Verified sound

Previous findings, checked against this head:

| Previous finding | Head passage | Disposition |
|---|---|---|
| R01, doubled dyadic generator | README:419, `e(η⁻¹) = (N(a) − η(a)) z_p(η)`; line 469 uses the same lattice | Inconsistency repaired; dyadic comparison qualification below |
| R02, duplicated CM constructions | README:23, “NonordinaryCMSpecialValues §§2.1–2.6, stated there for every imaginary quadratic `K`, every prime `p`” | Partly repaired; remaining formula duplication is R01 |
| R03, false quadratic twist | README:368, “the quartic ray class character `ε` modulo `(5)`” | Repaired; factors computed below |
| R04, missing contracts | README:108, “Layer 1 … §2.37 … §2.39 … §2.44”; line 90 supplies integral Coleman inputs | Repaired for retained uses; Layer 5 dependencies at line 640 agree |
| R05, two primes above inert 3 | README:412, “the single omitted local factor is 1” | Repaired |
| R06, description and Lean | Description: “the Lean file states no declaration”; dependency prose includes #2290 | Repaired |

The calculations below test instances and conventions; they do not constitute proofs of the general theorems. “Model” identifies an algebraic test of a proof step, rather than a computation of an arithmetic Iwasawa module. Source locators in the seeded rows were checked against the text, including hypotheses and printed pagination.

| Statement | Instance | Computed left side | Computed right side / wrong model | Result; change |
|---|---|---|---|---|---|
| §0.1, seeded; BT line 136, p. 3; Kato line 5182, p. 250 | `K = ℚ(i)`; `(p,f)=(2,1),(5,1),(2,3)` | Torsion orders `1,4,8`; pro-p rank `2` | Global-unit model gives `4`; prime-to-p restriction excludes `8` | Discriminates torsion and rank; none |
| §0.1, cyclotomic restriction | Gaussian field, `p=2,5` | Image indices `2,1` | Universal surjectivity predicts `1,1` | Contained case retained |
| §0.2, normalization | `ℤ₂[C₂]` | Integral closure `ℤ₂²`; image has equal parities | `(1,0)` integral but absent from image | R03 |
| §0.2, characteristic ideals | `A=ℤ_p[[T]]`; `A/(p)` | Rational characteristic ideal `(1)` | Integral ideal `(p)` | Rational convention discriminated |
| §0.2, lengths versus modules | `A/(T²)` and `(A/(T))²` | Both lengths at `(T)` are `2` | Both ideals `(T²)`; annihilators `(T²)` and `(T)` | No module-identification overclaim |
| §1.1, seeded; Kato line 5294, p. 253; JLK line 935, p. 22 | Gaussian field, `p=2`; twist value `χ(g)=i` | `T₂μ₄=0`; semilinear multiplier `i⁻¹=−i` | Finite roots have order `4`; opposite twist gives `+i` | Degree zero and inverse twist distinguished |
| §1.2, norm-limit definition | Cyclotomic `p=5`, levels `25→5`; transverse direction | `ζ₂₅^55=ζ₅`; transverse eventual norm `1` | Cyclotomic root system nonzero; full two-variable root limit zero | Wrong tower excluded |
| §1.2, p-units | Gaussian base, `p=5` | p-unit rank `2`, generated by `2±i` | Global-unit tensor rank `0` | Correct carrier |
| §1.3, Kummer and corestriction | Class of `ζ₂₅`, norm to `ℚ(ζ₅)` | Kummer of norm is `κ(ζ₅)` | Corestriction is `κ(ζ₂₅^55)=κ(ζ₅)` | Norm direction agrees |
| §1.4, Brauer correction | Gaussian base, split `5` versus ramified `2` | Kernel ranks of sum maps `1,0` | Class groups both `0`; H² at split `5` has rank `1` | Finite-level class/H² conflation excluded |
| §1.5, Euler factors | Gaussian `p=5,f=(3)`; trivial and `ω∘χ_cyc` components | Augmentations of `1−γ⁻¹`, `1+γ⁻¹`: `0,2` | Second factor is a unit; first is not | Inertia alone does not imply a divisor |
| §1.6, torsion | Zero class-module model | Generic rank `0`; annihilator contains `1` | A free rank-one module has generic rank `1` | Torsion permits zero, excludes free module |
| §1.7, seeded; Kato line 5190, p. 251; JLK line 1277, p. 30 | `Δ=C₈`; auxiliary ideal height `2` | `(x−1)(1+x+⋯+x⁷)=0`; `ht J=2` | Associated primes of `R/(a)` for regular `a` have height `1` | Zero-divisors distinguished; JLK sign issue below |
| §1.7, rank negative control | Zero module versus rank-one generic localization | Generic dimensions `0,1` | Torsion-freeness alone holds for both | Rank assertion necessary |
| §2.1, seeded; Kato line 883, pp. 138–140 | `c=5`, Laurent expansion at `z=0` | Leading coefficients `24/z`, `−24/z²`, `48/z³` | Successive derivatives give `24,−24,48` | Signs and derivative order agree |
| §2.2, auxiliary norm relation | Gaussian `a=(5),b=(7)` | Exponents `25−σ₅`, `49−σ₇` | Reversing norm and integer size exchanges `25` and `49` | Unequal auxiliary ideals discriminate |
| §2.2, modulus and units | Gaussian `p=2,m=(3)` | Added modulus has prime support `{(1+i),(3)}` | Two primes, versus one at modulus `(3)` | Global-unit criterion applicable |
| §2.3 and supplier contract | Gaussian modulus `(3)`, auxiliary `(5)`, trivial character | Ordinary log norm `−6.5916737320=−6 log 3` | Squared log norm and `24L′`: `−13.1833474640=−12 log 3` | Formula agrees; ownership/contract R01 |
| §2.3, quadratic character | Same field; `R=log(2+√3)` | Weighted squared log `10.5356631754=8R` | `24L′=24(R/3)=8R`; ordinary log gives `4R` | Factor 2 independently computed |
| §2.3, non-real character | `N(a)=25`, `χ(a)=i` | Correct smoothing scalar `25+i` | Missing inverse gives `25−i` | Character convention distinguished |
| §2.4, auxiliary ideal | `R/J=ℤ_p`, `dim R=3` | Quotient dimension `1`, codimension `2` | At height one `J_q=R_q`; at its own support J is proper | Local equality, not global principality |
| §2.5, cotorsion | Rank-one generic module, nonzero versus zero zeta vector | Quotient dimensions `0,1` | Torsion requires `0` | Nonvanishing needed |
| §3.1, auxiliary ideals | Quartic mod-5 twist, ideals `(7),(41)` | `ψ(7)=−49`, `ψ(41)=1681` | Auxiliary factors `49−(−49)=98`, `1681−1681=0` | Previous R03 repaired |
| §4.1, seeded; JLK line 642, pp. 15–17 | `Δ=C_p`, nontrivial character | Integral character evaluation sends `g↦χ(g)` | Idempotent requires coefficient `1/p` | Evaluation works without integral idempotents |
| §4.2, scalar Tamagawa normalization | `F=ℚ(ζ₁₂)`, `R=log(2+√3)` | Squared norms `2±√3`; `ζ_F*(0)=−R/12` | Class-number expression `−hR/w=−R/12`; ordinary regulator `R/2` | Scalar calculation agrees; dyadic comparison unverified below |
| §4.2, vanishing Euler factors | Quadratic η of `ℚ(ζ₁₂)/ℚ(i)`; `p=13,3` | At 13: `(1−1)²=0`; at 3: one ramified factor `1` | Zero vector versus line rank `1`; inert 3 gives one factor | Zero factors handled; previous R05 repaired |
| §4.2, scalar/equivariant distinction | `ℤ₇[C₃]`, tuple `(1,7,1/7)` | Scalar determinant `1` | Component valuations `(0,1,−1)` | Scalar statement does not imply component integrality |
| §4.3, regulator comparison | Gaussian quadratic η, `p=3,a=(5)` | `r(e)=8R` | `(25−1)L′=24R/3=8R` | No doubled generator |
| §4.4, seeded; JLK line 1257, pp. 30–31 | DVR rank-one model, generator `πⁿ` versus `2πⁿ`, `p=2` | Quotient lengths `n`, `n+v(2)` | Euler bound for original system uses `n` | Scaling weakens bound; previous R01 inconsistency repaired |
| §4.5, seeded; JLK line 1010, p. 24 | Gaussian `p=2,χ=1`, prime `(2)`, auxiliary `(5)` | `s_a mod 2=1−[σ_a]≠0`; localized valuation `0` | `J_χζ` and `aζ` have equal localized lattices | Integral smoothing is consistent |
| §4.5, twisted smoothing | Gaussian quadratic χ, `a=(2+i),b=(7)` | `6u/6=u`, `48u/48=u` | Untwisted denominator gives `6u/4=3u/2` | Independence needs twisted factor |
| §4.6, tame factors | Empty tame support; ramified χ; unramified χ(Frob)=−1 at `p=5` | Factors respectively `1,1`, and augmentation `2` | Unramified trivial character gives augmentation `0` | Factors and inertia conditions retained |
| §4.7, local-unit modules | Inert versus split place, one character component | Local ranks `2,1`; elliptic-unit rank `1` | Quotient ranks `1,0` | Inert quotient is not torsion |
| §4.8, seeded; Rubin91 line 545, p. 37; JLK line 1091, pp. 26–27 | `K=ℚ(√−7),p=2` | `−7≡1 mod 8`; `#μ(H)=2` | Split, but `2∤#μ(H)` is false | Rubin restriction retained; all-prime clause is distinct |
| §4.8, finite components | Gaussian `p=5`: conductor-one ray tower versus E[5]-tower | Finite torsion orders `4,16` | Dividing `(𝔽₅×)²` by diagonal μ₄ gives `16/4=4` | Towers not identified |
| §5.1, Coleman normalization | `θ=cT`, `c³=1`, `φ(c)=c²`, `g=1+X/c` | Transported logarithmic derivative at zero `1`; trace `5` | Omitting coefficient Frobenius gives `5c` instead of `5c²` | Coefficient descent distinguished |
| §5.1, inverse weighting and action | Formal measure `δ₁−δ₂`; pushforward by 2 | Mass `0`, first moment `−1`; pushforward first moment `−2` | Dilation multiplies first moment by `2`; inverse weighting removes the extra derivative twist | Action convention agrees |
| §5.1, Tor control | `A=O[[S,T]], C=A/(S−a,T−b), B=A/(T−b)` | At `(S−a)`, lengths of `C⊗B` and `Tor₁(C,B)` are `1,1` | Divisor difference `1−1=0` | Ordinary tensor alone gives false correction |
| §5.1, exceptional line | `Y=A/(S)`, specialize `T=0` versus `S=0` | First quotient torsion; second quotient free rank `1` | Torsion cannot be assumed on every line | Hypothesis retained |
| §5.2, Katz Euler factors | `E:y²=x³−x`, `p=5` | `#E(𝔽₅)=8`, `a₅=−2`; selected factor square `(32−24i)/25` | Conjugate place gives `(32+24i)/25` | Choice of p-adic place matters |
| §5.2, image versus divisor hull | `A=O[[S,T]], J=(S,T)` | Exact image `Jν` is proper in `Aν` | Height-one localizations agree; divisorial hull `Aν` | Image not replaced by hull |
| §5.3, specialization formula | Control module `B/(S−a)` in one error position | Error divisor coefficient `1` | Dropping it changes the equality by `1` | Control terms necessary |
| §5.4, seeded; CGLS line 380, pp. 7–8 | Local character θ trivial; compare `T` and `pT` | Local invariants have rank `1`; λ-values both `1` | θ=1 excluded; characteristic ideals differ by `(p)` | Local exclusions and λ/μ distinction retained |
| §5.5, functional equation | `ι(T)=−T/(1+T)`; unit root-number factor W | `ord_T ι(T)=1`; `λ(W)=0` | Double involution returns T; λ unchanged by W | Sign, involution and λ transport agree |
| §6.1, regular-prime lengths | One tame Euler divisor with local multiplicity `1` | `length H²_pf=length h²+1` | Quotient length increases by the same `1` | Tame term retained |
| §6.2, rational equivariant headline | Same local model; alternatively empty tame support | Ideal exponents `n+1`; empty-support exponent `n` | Corrected RHS `n+1`; printed RHS `n` in first case | Corrected identity passes localization test |
| §6.3, ranges | Gaussian `(p,f)=(2,(1+i)³)` versus `(5,(3))` | Tame products `1` versus `1−Frob₃⁻¹` on trivial component | Augmentations `1` versus `0` | Uncorrected form restricted correctly |
| §7.1, weight dictionary | Gaussian and Eisenstein weight-two forms | Levels `4·8=32`, `3·9=27`; type `(−1,0)` | For weight 3: type `(−2,0)`, unitary shift `N⁻¹` | Weight-two half-shift is not reused |
| §7.2, normalized induction | Scale a fixed comparison by `c=2` | Period image multiplied by `2` | Prescribed period image unchanged only for `c=1` | Unmarked isomorphism excluded |
| §7.3, CM comparison | Replace lattice T by `pT`; coefficient vector 0 | Both tensor source and image scale by `p`; zero maps to `0` | One-sided rescaling violates linearity | Source, target and lattice transport agree |
| §7.4, seeded; Kato line 5740, p. 265; JLK line 935, p. 22 | `χ_T(g)=i` | Basis map multiplier `−i` | Opposite convention `+i`; generic dimension remains `1` | Twisting agrees with §1.1 |
| §7.5, descent | Model `R=O[[S,T]]`, q above `(T−b)`, `p∉q`, kernel `(S)` | Local dimensions `2→1`; kernel generated by `S` | Above `(0)`, dimensions `1→0` | Dimension depends on prime height |
| §7.6, seeded; Kato line 5731, p. 264 | `p=2`, ζ₈; Gaussian field at `p=5` | `ζ₈+ζ₈³=i√2`; quadratic 5-power field is `ℚ(√5)` | Imaginary fields at 2 include `ℚ(√−2)`; `ℚ(i)` absent at 5 | Contained classification agrees |
| §7.7, length lemma | `A=ℤ_p[[T]], M=A/(T), a=p` | `length(M/pM)−length M[p]=1−0` | `length M_(T) · length A/(T,p)=1·1` | Both sides `1` |
| §7.7, excluded module | `M=A/(p),a=p` | `M_(p)≠0`; `dim(M/pM)=1` | Required codimension at least 2 fails | Hypothesis excludes counterexample |
| §7.8, generator headline | Generic rank-one line; z nonzero versus zero | Quotient dimensions `0,1` | Claimed generic quotient rank `0` | Identified generator stronger than rank assertion |
| §7.8, nonvanishing control | `y²=x³−25x`, `(x,y)=(25/4,75/8)` | `y²=5625/64` | `x³−25x=15625/64−10000/64=5625/64` | Central value need not be the nonzero twist used |
| §7.9, lattice inequality | Rubin condition (b) at `p=2` | `2` divides `#μ(H)` | Condition (b) false, so singular dyadic claim excluded | Regular dyadic primes remain included |
| §8.1, seeded; Kato line 5626, pp. 261–262 | Induced vector `(γ,0)`, `γ≠0` | Even part `(γ,ιγ)/2`; odd part `(γ,−ιγ)/2` | Both nonzero; multiplying comparison by 2 changes both periods | Periods fix the scalar |
| §8.2, modular reciprocity | `k=2,r=k−1=1`; zero coefficient vector | `(2πi)^(k−r−1)=1`; image of 0 is `0` | Interpolation multiplier `1`; RHS at γ=0 is `0` | Exponent and linearity agree |
| §8.3, seeded; Kato line 5768, p. 265; BT line 213, p. 5 | Tame inertia value `χ_T(g)=i`, cyclotomic image `g=1` | Twisted annihilator `−i−1`; norm `2` | In characteristic zero localization it is a unit; Euler module becomes `0` | Conductor ramification kills the correction |
| §8.4, seeded; Kato line 5759, p. 265; BT line 215, p. 5 | Nonzero interpolation value v in rank-one specialization | Elliptic image `v`, Beilinson–Kato image `v` | Scalar ratio `v/v=1`; rescaling by 2 gives `2v≠v` | Normalized bridge distinguished from arbitrary isomorphism |
| §8.5, equality descent | `A=k[[x,y]], a=x, M₁=M₂=A/(y)` | Quotient lengths `1,1`; a-torsion lengths `0,0` | Corrected lengths `1−0=1−0` | Cancellation works in dimension 2 |
| §8.5, missing hypothesis | Contained Gaussian case, `𝔭=(0)` | `dim A=1`, `dim Λ′_𝔭=0` | Text asserts `dim A=2` | R02 |
| §8.6, CM Kato headline; BT line 208, p. 5 | Rationalization of integral ideals `(p)` and `(1)` | Both become `(1)` in `Λ[1/p]` | Integral valuations at `(p)` are `1,0` | Endpoint makes no integral inference |
| §8.7, seeded; BT line 160, pp. 4–5 | Weight 2 central evaluation `σ_c↦c⁻¹` | Quotient coefficient ring O has `p≠0`; evaluation kernel excludes p | Weight 3 would require exponent `−3/2`; not an integral algebraic character | Even-weight condition necessary |
| Suggested.lean; description summary | Declaration and import counts | `0` declarations; one `import Mathlib` | `0` signatures or one-tactic probes to perform | No padding; description correction R04 |

- Sources: all 15 seeded targets checked; 11 further passages compared; 10 cached source texts read; one additional supporting preprint unavailable.
- Pins: 20 native declarations opened, including `Mathlib/RingTheory/Length.lean:31`, `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:84,113`, `Mathlib/NumberTheory/NumberField/Units/Regulator.lean:267,290`, and `Mathlib/RingTheory/Ideal/Height.lean:36`.
- Tau Ceti carriers: `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`, `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`, `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123,209`; Newform bundles a normalized eigenform, not a Galois realization.
- Suppliers: 24 supplier texts opened; 55 indexed contract locators and the Selmer, Kato and Nonordinary target blocks checked; citation resolver returned 0 unresolved names; the old ClassFieldTheory §2.6 resolves through its explicit map to Conventions C.6.
- Dependency check: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`; no UPWARD or CYCLE; 0 changes outside this folder.
- Gate: all worker checks passed, including the targeted build; independent `lake env lean` elaboration exited 0 with no warnings; 0 named declarations require `#check` or one-tactic probes.
- Headline coverage: §§4.2–4.5, 4.8, 5.1–5.5, 6.2, 7.2, 7.8 and 8.1–8.6 are named in the module docstring with missing arithmetic carriers; no stand-in theorem or sorry'd data.
- Shape/overlaps: 9 layers inspected; 0 second copies, dropped cited ids or competing heads reported; new folder adds 979 lines and removes 0 base headings or Lean declarations; CZ.4–CZ.6 have an explicit old-to-new map.

Overlap check: read KatoEulerSystems, NonordinaryCMSpecialValues, AutomorphicCongruences, ModularIwasawaMainConjectures and CMRankZeroConverse. KatoEulerSystems owns the modular zeta morphism and unmarked CM module structure; NonordinaryCMSpecialValues owns CM pairs, realizations, reciprocity and both Kronecker formulas (R01); ModularIwasawaMainConjectures owns KMC and its cohomology datum; AutomorphicCongruences owns automorphic reverse bounds; CMRankZeroConverse consumes the CM equality and owns the p-converse. This roadmap owns the identified elliptic generator and CM equality descent. The closest-on-main and result/heading lists were empty.

Source independence: 26 passages compared with 10 sources; no copied prose, tables or example lists identified. Largest share: Kato, 39 of 103 explicit author-led locator groups. Contents compared with Kato line 35: independent; §§1.3, 2.4, 4.3–4.5, 6.1 and 8.3–8.5 force the cohomology → elliptic units → determinant equality → descent order; the separate split-prime branch uses Yager and CGLS, not Kato's chapter sequence.

## Not verifiable

- The dyadic compact-support comparison behind §4.2: JLK Theorem 2.6 refers to Itakura §3.1 (JLK line 432); the sources service found no legal copy of *Tamagawa number conjecture and Iwasawa main conjecture for Dirichlet motives at the prime 2*. Recorded as Itakura in the reference request.

## Source issues

- **Error** in Kato at (15.5.1), printed p. 253, and (15.6.5), printed p. 255: the source says the ordinary absolute-value logarithm equals the stated L-derivative expression; it should be twice that logarithm, equivalently the squared-norm logarithm; affects a stated result.
- **Error** in JLK at Proposition 3.3(4), printed pp. 14–15: the source says the ordinary absolute-value logarithm equals the derivative times the smoothing factor; it should be twice that logarithm, as the Gaussian modulus-3 computation demonstrates; affects a stated result.
- **Misprint** in JLK at proof of Theorem 6.4(2), printed p. 30, JLK line 1280: the source says the finite-level rank difference is rank H² minus rank H¹ and equals one; it should be rank H¹ minus rank H²; affects the proof.
- **Misprint** in Kato at proof of Proposition 15.17, printed p. 265, Kato line 5769: the source says to apply Lemma 14.12; it should be Lemma 14.15, the codimension-two length identity; affects the proof.
- **Error** in BT at Theorem 2.1, printed p. 4, BT line 152: the source says the elliptic-unit quotient and class module have equal characteristic ideals for arbitrary tame modulus; it should be an equality retaining the tame decomposition-group factors, or restricted to components where they vanish; affects a stated result.
- **Error** in Kato at Theorem 15.2(2), printed p. 251: the source says the equality uses the class module for arbitrary modulus; it should be an equality retaining tame Euler terms for the fixed-modulus elliptic-unit module, as in README §6.2; affects a stated result.

## For the human reviewers

- JLK line 394 explicitly chooses the ordinary Beilinson regulator; README:399 replaces it by the Dirichlet regulator while retaining the comparison (8). The scalar numerical calculation was verified; the dyadic integral comparison through the unavailable Itakura preprint was not.
