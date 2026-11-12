# Review of ModularIwasawaMainConjecturesPartII (package, round 2)

**Verdict:** needs changes

Nine findings: five P1, one P2 and three P3; six blocking. The package files were reviewed without changing the mathematical text. The source service added the previously unrecorded BKO21 work; existing source entries were preserved. Lean elaboration and the dependency-direction check pass, but do not detect the counterexamples below.

## Verification of the previous repairs

Locations in this table are in `packages/ModularIwasawaMainConjecturesPartII/README.md`.

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01: circular import of the CM module theorem | Repaired in this package | Line 22: “Their CM cases are theorems of this roadmap”. New §7.8, lines 762–769, supplies the module theorem before §7.9 and the equality descent. Its analytic input is KatoEulerSystems §4.2, not its CM module theorem. The new codimension argument in §1.7 is also correct; see the table below. Supplier-side edits explicitly marked not actionable in the repair report remain settled: this worker cannot edit those suppliers. |
| F02: duplication of the rational-CM two-variable theorem | Repaired as ownership | Line 29 names “NoncommutativeAndEquivariantIwasawa §4.3”; lines 523, 556, 570 and 580 identify the imported special case and the larger generality owned here. The cited head has that construction and theorem. New mathematical defects in the extensions are R03–R04, not a renewed ownership finding. |
| F03: missing relative Coleman construction | Partly repaired | Line 543 now asks for a “unique Coleman power series” on the CM formal group; lines 545–548 give its laws. This supplies a named target, but the asserted transport of coefficient Frobenius is false in a changed coordinate (R02). The one-variable extension has an independent obstruction (R03). |
| F04: CM supplier section drift | Repaired | Line 94 cites “§1.2 (the Serre tensor by a CM ideal” and “ImaginaryQuadraticClassNumber §H3.1”. The current CM head has the Serre tensor and period comparisons in §1.2, and H3.1 supplies the lattice dictionary. No remaining consumption of the formerly cited nonexistent §1.3 was found. |
| F05: an earlier roadmap named as downstream | Repaired | Line 895 identifies the CMRankZeroConverse inputs as “§6.2”, “§7.6”, “§7.8”, “§8.6” and “§8.7”. The inert anticyclotomic roadmap remains only a scope exclusion. Its former downstream edge is gone. The consumer's old design labels are external to this package. |
| F06: missing §1.4 Checks | Repaired | Line 219 computes a Brauer kernel “of rank one”; line 220 computes both base-layer correction terms as zero; line 221 gives annihilator height at least two. The rank and dimension calculations are correct. |
| F07: unspecified Tamagawa predicate | Partly repaired | Line 447 now names “ETNC(h⁰(F), ℤ[Gal(F/K)])”. PS.5.2 is a real supplier, and excluding PS.6.5's weight range is correct. However, the replacement changes the scalar-coefficient theorem into a group-ring theorem and reverses a determinant twice (R01). |
| F08: second elliptic-unit builder | Repaired as ownership | Line 30 distinguishes “Kato's ideal-indexed elliptic units” from the one-variable norm limits in EllipticCurvePeriodsAndModularParametrizations. The current latter head imports its unit theorem through EulerSystemsCyclotomicMainConjecture; it does not supply the all-modulus Kato construction here. No unsupported equality of the two normalizations is asserted. |

The repaired-pattern search included every occurrence of torsion-freeness, roots of unity, Coleman interpolation, pseudo-nullity, character projection, ETNC, the CM supplier sections and the downstream names. In particular, the correct new one-variable negative control at line 254 refutes the still-unrepaired injectivity assertion at line 559.

## R01 (P1) — The scalar Tamagawa theorem is replaced by a stronger predicate and the determinant is inverted twice

**Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:447`, §4.2. Quoted claims: `ETNC(h⁰(F), ℤ[Gal(F/K)])` and `Det⁻¹_{O_p} RΓ(O_K[1/p], O_p(η⁻¹)(1))[1]`.

**Claim:** JLK Theorem 2.6 proves that group-ring ETNC predicate, equivalently the displayed tensor of inverse determinants of shifted complexes.

**Witness:** JLK lines 401–420 define an E-line and scalar O_p-lattice equality. Lines 512–522 use `Det RΓ(...)[1]`, without inverse determinant. A shift already inverts the determinant.

For a determinant lattice of valuation 1, `Det(C[1])` has valuation −1, whereas `Det⁻¹(C[1])` has valuation +1. Thus the displayed expression is the opposite line. Independently, scalar product information is not componentwise group-ring integrality: in `ℤ_7[C₃] ≅ ℤ_7³`, the tuple `(1,7,1/7)` has scalar determinant 1, but component valuations `(0,1,−1)`. Even retaining the trivial-component condition does not fix the other two components. JLK Corollary 2.11 tensors the character lines; it does not identify each integral character lattice separately. The predicate supplier is `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1105`, PS.5.2, open pull request #1496.

**Exact repair:** State JLK's scalar-coefficient Tamagawa conjecture for `h⁰(F)` (and its scalar extension), using PS.5.2 with the corresponding scalar order, not `ℤ[Gal(F/K)]`. Preserve the tensor-over-characters conclusion needed by §4.3. Write either `Det(RΓ(...)[1])` or `Det⁻¹(RΓ(...))`, not both operations. Do not infer integral equivariant ETNC from this tensor identity. The repaired determinant gives −1 on the valuation test; the scalar predicate no longer claims to distinguish the `(1,7,1/7)` components.

## R02 (P1) — Coefficient Frobenius is not preserved by the formal-group coordinate change

**Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:543`, especially lines 545, 547–548. Quotation: “composed with `θ⁻¹`; the Frobenius twist `φ^{−n}` records that `θ` is defined over `Ô`”.

**Claim:** Transporting the cyclotomic Coleman series through any allowed `Ô`-isomorphism gives the stated coefficientwise Frobenius interpolation, norm law and logarithmic-derivative law on F.

**Witness:** Take `p=5`, `c³=1`, `c≠1`, `φ(c)=c²`, `θ(T)=cT`, and `F(X,Y)=X+Y+XY/c`. Then `g=1+X/c` has `Ng=g`, but `g^φ=1+cX≠g`.

This is an allowed coordinate of a split height-one CM formal group over `Ô`. Choose `ξ_n=c(ζ_{5^{n+1}}−1)` and `u_n=ζ_{5^{n+1}}`. The transported cyclotomic series is exactly `g=1+X/c`. At n=1, the advertised interpolation evaluates to `1+c²(ζ₂₅−1)`, not `ζ₂₅`. With the normalized logarithm `λ_F=c log(1+X/c)`, `D log g=c⁻¹=c²`; line 547 has left side `5c` and right side `5c²`. Coleman79 lines 61–85 fix a Lubin–Tate group over the Frobenius-fixed base O_K before taking an unramified coefficient extension. They do not support the claimed coordinatewise transport on an arbitrary F over `Ô`.

**Exact repair:** Keep the general CM formal group, but specify the Frobenius descent/isogeny data, or explicitly transport the entire cyclotomic construction through θ. In the latter presentation use `Φ_θ(g)=((g∘θ)^φ)∘θ⁻¹`, not coefficientwise φ, and transport the differential as well. The derivation in multiplicative coordinates is `D_θ=θ′(0)D_F`; if normalized `D_F` is retained, its Frobenius-period factor must be included. State interpolation, norm and equivariance with these compatible operations. On this example `Φ_θ(g)=g`, interpolation returns `ζ_{5^{n+1}}`, and `D_θ log g=1`, giving `5=5`. Add this coordinate-change test; constants and the coordinate fixed by φ do not detect the defect.

## R03 (P1) — Arbitrary one-variable specialization loses torsion and codimension-one corrections

**Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:556–560`; also the rank-one reading of lines 523, 570 and 580. Quotation: “On each `χ`-component, `Col` is injective with pseudo-null cokernel”.

**Claim:** The two-variable Coleman map and its pseudo-null error specialize with those same properties to any Rubin one-variable extension.

**Witness:** Let `K=ℚ(i)`, `p=5`, `K₀=K(μ₅)`, `K_∞=K(μ_{5^∞})`. In its local units, `(ζ_{5^{n+1}})_n≠0` is killed by `σ−κ(σ)`. Every Λ-linear map to the torsion-free component Λ kills it.

All these fields satisfy §4.7: `H=K`, `[K₀:K]=4`, `5∤#μ(K)`, and the tower is abelian of rank one. The curve `y²=x³−x` has good ordinary reduction at 5 and is defined over K₀. Norm compatibility is explicit: `N(ζ₂₅)=ζ₂₅^{1+6+11+16+21}=ζ₂₅^55=ζ₅`. These roots belong to the principal local units. The χ=ω component contains their Tate module. Extending coefficients to `Ô` does not kill it. The package already computes precisely this obstruction in §1.7, line 254.

Pseudo-nullity also does not survive arbitrary specialization. For `A₂=O[[S,T]]`, `A₂/(S−a,T−b)` has codimension two. Setting `T=b` gives `A₁/(S−a)`, of length 1 at the height-one prime `(S−a)`. JLK lines 1091–1129 use the two-variable algebra. Rubin91 lines 556–562 identify the p-adic L-function for the full two-variable tower and the particular one-variable extension unramified outside 𝔭; they do not assert the arbitrary-line formulation in §5.3.

**Exact repair:** Retain the full two-variable map and its exact image. Provide a separate one-variable specialization/control theorem, including the kernel from norm-compatible roots of unity and the local and Tor terms that survive in codimension one. Only claim injectivity on the appropriate quotient, and only discard correction terms after proving that they vanish on the specified character component. Scope the JLK classical form in §4.8 to its two-variable input; supply the additional control argument for other towers. Recompute §§5.2–5.4 with those terms, rather than asserting unrestricted push-forward of characteristic ideals. On the test above the kernel contains `ℤ_5(1)`; on the specialization test the correction has length 1, not 0. The general one-variable theory must be supplied, not silently replaced by a good-component restriction.

## R04 (P1) — The image ideal is confused with its characteristic ideal

**Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:570,575`, §5.2. Quotation: “`Col(𝒞̄_∞)^χ` generates, as an ideal” the Katz component; “`N(a) − σ_a`, a unit at height one”.

**Claim:** Removing an auxiliary factor makes the literal image ideal equal to the principal Katz ideal, and each such factor is a unit at height one.

**Witness:** On the cyclotomic component put `A=Ô[[S,T]]`, `J=(S−a,T−b)`. The supplied Coleman law gives `Col(𝒞̄)=Jν`. For `ν≠0`, `Jν≠Aν`, although `(Jν)^{**}=Aν`.

The exact supplied law is in open pull request #1307, `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2077`: image J and `Col(β(𝔞))=(σ_𝔞−N𝔞)ν`. Its lines 2083 and 2093 explicitly retain the exceptional image ideal. Here `A/J≅Ô` has codimension two, so every height-one localization of J is A, but J is a proper ideal. A fixed nonzero `N(a)−σ_a` in J is a nonunit; in this regular factorial ring it has a height-one prime divisor. It is the ideal generated by all auxiliary factors that becomes the unit ideal at every height-one prime. JLK lines 968–975 make the codimension-two distinction too.

**Exact repair:** State the exact image with its auxiliary-factor ideal and conductor conditions. State equality with the Katz principal ideal only after taking the divisorial/reflexive hull, or directly as equality of characteristic ideals. Replace the assertion about an individual auxiliary factor by the correct assertion about their generated ideal. Retain one-variable correction factors from R03. On `J=(S−a,T−b)`, the repaired statements give `Jν≠Aν`, `(Jν)^{**}=Aν`, and localized quotient length 0 at height one, simultaneously.

## R05 (P1) — Inertia-trivial components need not have a nonunit Euler factor

**Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:651–653`, §6.3(c); the same error is in the Check at line 238. Quotation: “on a component where `I_𝔩` acts trivially” the factor is “non-unit”.

**Claim:** Infinite order of Frobenius forces its Euler factor to be a nonunit on every inertia-trivial finite-character component.

**Witness:** Take `K=ℚ(i)`, `p=5`, `f=(3)`, and the finite character `χ=ω∘χ_cyc`. It is unramified at `(3)`, but `χ(Frob_(3))=ω(9)=−1`.

Write Frobenius as its finite part times γ in the pro-5 part. On this χ-component, `1−Frob⁻¹` becomes `1+γ⁻¹`, with augmentation 2, a unit of `ℤ_5[[Γ]]`. The local Euler module is zero and contributes the unit ideal, even though Frobenius has infinite order. On the trivial finite-character component the factor is `1−γ⁻¹`, with augmentation 0, and is a genuine nonzero divisor. Thus the global localization sequence and its product formula can be right while the asserted componentwise nonunit criterion is false.

**Exact repair:** Keep the exact Euler factor after finite-character projection, including the finite Frobenius eigenvalue. Assert a nonunit on the trivial component, or give the full decomposition-character criterion; triviality on inertia alone is insufficient. Correct the §1.5 Check, §6.3(c), its examples and the interpretation of the tame worked example. Test both components: χ gives the unit 2 modulo the maximal ideal; the trivial component gives 0 and the nontrivial Euler divisor. The conductor-ramified components used in §8.3 remain unaffected.

## R06 (P2) — The central specialization requires even weight

**Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:877`, §8.7. Quotation: “the kernel of `σ_c ↦ c^{−k/2}`”.

**Claim:** The central character and its kernel are defined throughout the standing range `k≥2`.

**Witness:** For odd k, at `c=−1` any character h satisfies `h(−1)²=1`; the proposed square `c^{−k}` is −1. No such character exists on the full cyclotomic group.

Weight-three CM newforms are within the package's scope. BT line 224 explicitly assumes even weight in Theorem 3.1; its central-character construction is at lines 231–243. The package carried over that construction but not the parity hypothesis.

**Exact repair:** Add `k` even to this central-specialization paragraph and any use of it. Keep the main conjecture of §8.6 for every `k≥2`. The repaired test at k=2 gives `c↦c⁻¹` and quotient O_λ; k=3 is excluded from this particular specialization, without excluding its main conjecture.

## R07 (P3) — Four explicit Checks compute the wrong objects or values

**Locations:** `packages/ModularIwasawaMainConjecturesPartII/README.md:190,206,345,529,574`.

These are Check defects; they do not require narrowing the corresponding main theorems.

| Location and claim | Witness | Exact repair, tested |
|---|---|---|
| Line 190 identifies finite-level invariants of `ℤ_p(1)` with `μ_{p^∞}(K′)` and says restriction retains a divisible group. | For `K′=ℚ(i)`, p=2, `μ_{2^∞}(K′)=μ₄`, order 4, but `H⁰(K′,ℤ_2(1))=T₂μ₄=0`. Restriction between these zero groups still gives 0. | Distinguish finite/discrete roots from the Tate module. Replace this Check by `T₂μ₄=0`; give a separate two-variable transverse-norm argument for line 206. Do not use this false finite-level identification to justify the norm-limit claim. A one-variable root limit is nonzero, as line 254 correctly computes. |
| Line 345 says an omitted prime with `χ(𝔩)=1` always raises the order at zero to at least two. | For trivial χ, `K=ℚ(i)`, `f=(3)`, `L_f(1,s)=ζ_K(s)(1−9^{−s})` has order 1 and derivative `−log(9)/4≠0`. | Add the nontrivial-character hypothesis to this Check. Retain the trivial-character example as a negative control: order 1 versus order at least 2 for a nontrivial character with an additional vanishing Euler factor. |
| Line 529 says the division tower `K(E[5^∞])` for `E:y²=x³−x` has four χ-components. | CM reciprocity and CRT give `[K(E[5]):K]=#(O_K/5)^×=4²=16`: a generator congruent to 1 modulo `(1+i)³` can have any invertible residue modulo 5. | Replace four by sixteen for this division tower. The four-component computation at line 527 belongs to the different conductor-one ray tower `K(5^∞)`, where the diagonal μ₄ is divided out: `16/4=4`. Keep the distinction explicit. |
| Line 574 calls `ψ((π))=π` a character of type `(1,0)`, under the idelic convention of line 41. | Principal-idèle triviality forces `ψ_∞(z)=z⁻¹`; its idelic type is `(−1,0)`. Its ideal-valued type is `(1,0)`. | Label `(1,0)` as the ideal convention, or use `(−1,0)` consistently with Conventions; explain the supplier conversion at `ψ⁻¹`. The point count 8, trace −2 and Euler product `(32−24i)/25` remain correct. |

## R08 (P3) — The missing-carrier inventory is stale at the pinned Tau Ceti

**Location:** `packages/ModularIwasawaMainConjecturesPartII/Suggested.lean:18–19`. Quotation: “Tau Ceti has `TauCeti.GlobalNumberFields.RayClassGroup` but no ray class field”.

**Claim:** Native ray class fields as number fields are missing at the pins.

**Witness:** `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123` defines `TauCeti.ClassFieldTheory.rayClassField`; lines 135, 139 and 143 provide finite-dimensionality, NumberField and abelian-Galois instances. Line 209 defines `rayClassArtinEquiv`.

**Exact repair:** Remove this claimed absence and cite the native ray class field and reciprocity APIs in the README's Tau Ceti supplier contract. Retain the genuine missing carriers: arithmetic inverse-limit/cohomology constructions, normalized elliptic-unit classes and Katz/Coleman maps. Also explicitly account for the summary's §5.5 functional equation and λ-identity in the docstring; they still require the absent Katz measure. This repair does not require an artificial Lean theorem: having ray class fields alone does not make these main conjectures statable with a few simple definitions. The repaired inventory gives an actual NumberField carrier when instantiated at a modulus, while still identifying the missing arithmetic construction.

## R09 (P3) — The reference list omits cited works

**Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:903–912`, compared with the Coleman citations at lines 543–545 and BKO citation at line 31.

**Claim:** The references describe the works and versions underlying the roadmap's citations.

**Witness:** The eight bibliography bullets contain neither Coleman79 nor Burungale–Kobayashi–Ota, although the text cites both. Coleman79 is in the original manifest; BKO21 was absent and has now been added.

**Exact repair:** Add bibliographic entries for Coleman, *Division values in local fields*, Inventiones 53 (1979), 91–116, Theorem A and Theorem 11/Corollary 12; and Burungale–Kobayashi–Ota, *Rubin's conjecture on local units in the anticyclotomic tower at inert primes*, Annals 194 (2021), 943–966, Theorems 6.1–6.2. Use the existing manifest keys and legal copies, not duplicate keys. The repaired reference inventory has ten works, matching all ten manifest entries. BKO21 lines 799–823 confirm the signed main conjecture and the rank bounds used only to describe the scope boundary.

## Verified sound

The entire 912-line README, all 51 numbered targets, the 36-line Lean file, metadata, source manifest, previous review and repair were read. All changed mathematics was recomputed. Untouched statements were carried forward only where the prior review supplied actual computed values; its erroneous finite-level H⁰ and inertia-trivial-component rows were overridden by R05 and R07. The table below records the seeded targets, headline theorems, changed arguments and all mathematical findings; it is not a claim that an admitted Lean build proves them.

### Principles, shape and Lean

The Part II boundary is explicit: the existing ModularIwasawaMainConjectures formulation is imported, and the CM all-prime proof is the extension. No executable algorithm, copied source passage, `set_option`, sorry-valued data, or replacement of the endpoint by a free predicate was found. No route restricted to good primes is used for the rational CM endpoint. Restrictions in Rubin's theorem and in the ordinary Katz branch are stated separately from that endpoint. The gap `height-one-explicit-reciprocity` has a named supplier, precise relative-height-one hypothesis and matching slug in `design/plan.json` and README line 108; it is a declared contract, not an unowned prerequisite.

The README has Summary, ownership, conventions, exact suppliers, build explanation, nine layers numbered 0–8, layer Examples and Dependencies, downstream consumers and references. Definitions have API prose and Check lists; the false Checks needing repair are identified above. Claims have source locators and target-level Needs lines. No local machine paths, job identifiers, pull-request numbers, HTML anchors or implementation algorithms were found in the roadmap text. Main-branch shape comparisons used QuadraticCharactersAndReduction, ImaginaryQuadraticClassNumber and TensorProductCombinatorics.

The headline inventory is: CM module structure (§7.8); Kato's CM main conjecture at every prime (§8.6); the rational equivariant equality (§6.2); Johnson-Leung–Kings at every prime (§4.5); Rubin's theorem/classical form (§4.8); the Katz and anticyclotomic component equalities (§§5.3–5.4); and the functional-equation λ-identity (§5.5). The first six groups are named in the docstring with missing arithmetic carriers. The last needs the explicit inventory correction in R08. None becomes statable merely from native newforms, ray fields, class groups and completed group rings: the attached representations, normalized classes and arithmetic limit constructions remain absent. No statable headline omission or stand-in was found.

`Suggested.lean` has exactly one `import Mathlib`, one module docstring and the required namespace. It has **zero declarations, zero sorried theorems and zero examples**. Consequently the exhaustive one-tactic padding probe and the `#check @name` signature audit each have zero targets; there is no hidden section-variable generality loss. No Tau Ceti import or targeted object build was needed. The required `lake env lean` invocation on this package's absolute Suggested.lean path, run from the pinned content checkout, returned **exit 0, no output, no warnings**. No Lean process remains running. The absence of warnings is expected for a declaration-free file.

### Source verification

All nine originally recorded works were available as cached legal extractions. No author-marked unverified locator remains in the manifest. BKO21 was fetched through the sources service from its institutional NSF copy and recorded under one new key, with bibliographic metadata; all original manifest entries remain unchanged. There is no outstanding missing-reference request. Source excerpts were not copied into the repository.

| Seeded target | Source text actually inspected | Hypotheses, locator and result |
|---|---|---|
| §1.2 tower units/classes | BT lines 138–145, §2.1.1, p.3; Kato lines 5181–5195, §15.1, p.251 | Norm limits of p-units and class groups agree. The root-of-unity Check's cross-reference does not: R07. |
| §1.7 unit structure | Same passages; JLK Theorem 6.4(2), lines 1257–1280, p.30, and Corollary 7.3 | Rank one is the two-variable statement. The new Cohen–Macaulay/J argument handles p-torsion in Δ without pretending that the Tate invariants vanish. |
| §2.6 auxiliary-free element | Kato lines 5288–5292 and 5321–5336, §§15.5–15.6, pp.253–254; JLK lines 957–975, §5.1 | Auxiliary denominator and ideal J agree. Non-zero-divisor does not mean unit: the later misuse is R04. |
| §3.1 CM realization | Kato lines 5395–5456, §§15.7–15.8, pp.256–258 | Type `(−r,0)`, r≥1, one-dimensional realizations, inverse arithmetic Frobenius and period pairing match. |
| §3.3 explicit reciprocity | Kato lines 5463–5527, Proposition 15.9 and proof, pp.258–259 | Relative O_𝔭-height one is the actual proof input, including at nonsplit rational primes. The declared regulator gap matches lines 5495–5504. OCR overbars are a limitation below. |
| §4.2 Tamagawa theorem | JLK lines 399–432, 450–455 and 512–542, Theorem 2.6/Corollary 2.11, pp.10–13; HuberKings Proposition 2.3.1 | The cited theorem is scalar, all p, with a single determinant inversion. R01. |
| §4.4 Euler-system bound | JLK lines 1248–1313, Definition 6.3, Theorem 6.4, Corollary 6.5, pp.30–31 | Large-level ramification, first H²₀ and then H² with pseudo-null local terms, and two-variable coefficients are retained. |
| §4.7 Rubin modules | Rubin91 lines 485–543, §4, pp.36–37 | One- or two-variable tower, H⊂K₀, p∤[K₀:K], p∤#μ(H), and integral finite-character splitting match. |
| §5.1 Coleman series/map | Coleman79 lines 61–89, Theorem A, pp.91–92, and 513–530, Theorem 11/Corollary 12, p.102; Yager Chapter 3, lines 466–545 | Fixed-base hypothesis in Coleman is not transported by coefficientwise φ: R02. The arbitrary one-variable injectivity claim fails independently of OCR: R03. |
| §5.3 Katz form | Rubin91 lines 545–562, Theorem 4.1 and Remark (1), p.37 | The theorem of module ideals is broader than the remark's stated L-function identification, which names two variables or the 𝔭-ramified line. R03–R04. |
| §6.2 rational equivariant equality | BT lines 152–157, Theorem 2.1, p.4; JLK lines 1471–1515, §7.2, pp.35–36 | JLK uses the p f-open complex. The package rightly retains the omitted tame Euler factors. Its further nonunit assertion is separately false (R05). |
| §7.1 CM characterization | BT lines 199–206, Theorem 2.6 setup, p.5; Kato §15.10, lines 5572 onward, p.261 | k≥2, imaginary quadratic CM, type `(1−k,0)` and induced realization agree. |
| §7.6 contained case | Kato lines 5731–5734, §15.14, p.264, and 5753, 5772, p.265 | Replace G∞ by Gal(ℚ(μ_p∞)/K), apply the contained-case descent, then induce back. No division by 2 in an integral dyadic algebra is assumed. |
| §8.3 ψ-components | Kato lines 5738–5753 and 5768–5772, §§15.15–15.17, p.265; BT lines 213–218 | At p-inverted primes, conductor ramification makes the tame Euler module vanish. Equality must use JLK plus the length computation, not just Kato's inequality. |
| §8.6 all-CM all-prime Kato equality | BT lines 208–218, Theorem 2.6, p.5; Kato §15.17 | The rational endpoint, all primes and full finite-character group are supported. The repaired §7.8 supplies its module theorem; §8.5 supplies equality descent. |

Also rechecked the repaired §5.2 moment against the two named suppliers, §5.4 against CGLS lines 394–421, §5.5 against Kriz lines 1034–1064 and CGLS lines 834–837, and §8.7 against BT lines 224–243. The last comparison detects the dropped even-weight hypothesis. BKO21 lines 799–823 support the scope exclusion, not an input to this roadmap.

### Adversarial mathematics: computed values

In the table, O denotes a p-adic integer ring, and A is the displayed power-series ring. “Retain” means the computation supports that statement; it is not a substitute for the stated general proof route.

| Statement | Instance tried | Values computed on both sides | Result / change |
|---|---|---|---|
| §0.1 finite ray group | K=ℚ(i), f=1, p=2 and 5 | At 2, `(μ₄×ℤ₂²)/μ₄=ℤ₂²`, Δ=1; at 5, torsion `(μ₄×μ₄)/μ₄` has order 4 | Retain |
| §0.1 dyadic tame component | K=ℚ(i), p=2, f=(3) | `(μ₄×C₈)/diag μ₄` has order 8 and is cyclic; 2 divides it | Retain full Δ |
| §0.2 characteristic convention | `A/(p)` after p inversion; `A/(T²)` versus `(A/(T))²` | First module becomes 0 with ideal (1); latter modules each have length 2 at (T), hence ideal `(T²)` | Retain; ideals do not classify modules |
| §1.1 lattice H⁰ | K′=ℚ(i), p=2 | `μ₄` has 4 elements; `T₂μ₄=0`; restriction limit of the H⁰ groups is 0 | R07 |
| §1.1/Conventions twisting | χ(g)=i | `φ(gx)=i⁻¹gφ(x)=−i gφ(x)`; opposite convention gives `+i gφ(x)` | Retain inverse twist; order-two test alone does not distinguish it |
| §1.2 S-units | K=ℚ(i), p=5 | Global units tensor ℤ₅: 0; 5-units tensor ℤ₅: ℤ₅², from 2±i | Retain |
| §1.3 Kummer norm | ζ₂₅→ζ₅ | Norm exponent 55≡5 mod25; Kummer corestriction and field norm both give ζ₅ | Retain |
| §1.4 new Checks | K=ℚ(i), p=5 versus 2 | `ker(ℤ₅²→ℤ₅)` rank1; `ker(ℤ₂→ℤ₂)=0`; base class groups both 0 | Retain |
| §1.4 pseudo-nullity | M finite over ℤ_p in dim3 R | `dim R/Ann(M)≤1`, annihilator height≥2, so every height-one localization is 0 | Retain; does not apply in dim2 |
| §§1.5,6.2 localization | A=O[[S,T]], D one pro-p direction | Local term A/(S), dimension2 in dim3; length at (S)=1; `length H²_pf=length H²_p+1` there | Retain Euler correction |
| §§1.5,6.3 χ-components | K=ℚ(i), p=5, l=(3) | χ=ω∘χ_cyc gives finite Frob value −1, Euler constant2 and module0; trivial χ gives constant0 and a divisor | R05 |
| §1.7 repaired torsion proof | R dim3, x regular, J cyclotomic | `dim R/x=2`, associated primes have height1; `ht J=2`, hence `(R/x)[J]=0`. In one variable J has height1 and roots survive | Retain; R03 must respect the negative control |
| §1.7 rank | zero module; totally imaginary rank-one coefficients | Zero has rank0, not1; finite-level Euler characteristic difference is `[K′:K]`, normalized difference1; H² rank0 gives H¹ rank1 | Retain |
| §2.1 series convention | z+λ=1+i, k=1, s=0 | `(1+i)⁻¹=(1−i)/2`; conjugate expression `(1−i)/|1+i|²=(1−i)/2` | Retain the k+s/2 supplier conversion |
| §2.2 theta normalization | constant rescaling u; b=2,3 | Norm preservation gives `u³=u⁸=1`, hence u=1; a primitive cube root passes first and fails second | Retain uniqueness |
| §§2.2–2.3 divisor/isogeny | ideal a, quotient by E[a] | Degree `N(a)−#E[a]=0`; quotient pushes divisor to `N(a)(0)−N(a)(0)=0` | Retain coprime-degree hypothesis |
| §2.3 canonical level | K=ℚ(i), f=3 or (1+i)³ | Unit-group orders 8 and4; divide by w_K=4 to get ray degrees2 and1; μ₄ injects in both | Retain |
| §2.5 inverse convention | N(a)=25, χ(a)=i | Correct auxiliary scalar `25+i`; reversed scalar `25−i` | Retain |
| §2.5 extra zero | trivial χ, K=ℚ(i), f=3 | `ζ_K(0)=−1/4`; `1−9^{−s}=s log9+O(s²)`; derivative `−log9/4≠0`, order1 | R07 |
| §2.6 auxiliary ideal | A=O[[S,T]], J=(S−a,T−b) | A/J=O, codimension2; `J_q=A_q` at height1 but J≠A; a fixed factor in J is nonunit | Retain definition; R04 corrects its later use |
| §2.7 nonvanishing | nontrivial primitive finite η, no added vanishing Euler factor | Order at zero1 and leading coefficient nonzero by L(η̄,1)≠0; an added factor with η(l)=1 raises order to2 | Retain choice of character |
| §3.1 realization convention | q=(2+i), r=1 | `|ψ(q)|=√5`; arithmetic-Frobenius inverse eigenvalue has absolute value `1/√5`; dimension of each CM component1 | Retain inverse eigenvalue |
| §3.2 denominator | r=1; r=2, a=(c) | r=1 gives modulus at least `N(a)−√N(a)>0`; r=2 and trivial twist can give `ψ((c))=N(a)`, difference0 | Retain auxiliary-choice argument, not arbitrary inversion |
| §3.3 and §7.8 L-factor bridge | ℓ=ll′ split, l divides conductor only | Ramified l factor1; surviving l′ factor `(1−ψ̄(l′)χ(ℓ)ℓ^{−s})⁻¹` on both Hecke and newform sides | Retain conductor-sensitive comparison |
| §4.1 integral projection | G=C_p | Character quotient is defined integrally; idempotent coefficient 1/p is not integral | Retain quotient, not integral idempotent |
| §4.2 coefficient order | ℤ₇[C₃] and tuple(1,7,1/7) | Scalar determinant1; component valuations0,+1,−1 | R01 |
| §4.2 shift | determinant lattice valuation1 | `Det(C[1])`: −1; `Det⁻¹(C[1])`: +1 | R01 |
| §4.2 class-number Check | F=K=ℚ(i) | `−hR/w=−1/4`; v₂=−2, v_p=0 for odd p | Retain scalar TNC Check |
| §4.4 local terms | O-finite H²_local over O[[S,T]] | Dimension≤1, codimension≥2, localized length0; Euler-system length bound remains `ℓH²≤ℓ(H¹/z)` | Retain two-variable hypothesis |
| §§4.5–4.6 headline determinant | J=(S,T), H¹=A, z=t≠0, torsion model H²=A/(t) | At height1, J=A and both lengths `v_q(t)`; multiplying z by Euler e changes length to `v_q(t)+v_q(e)` | Retain characteristic/determinant form |
| §4.7 idempotents | p∤#Δ versus p=2, Δ=C₂ | First idempotents integral; `(1±g)/2` not integral in second, though defined after p inversion | Retain stated splitting hypothesis |
| §4.8 small primes | K=ℚ(√−7), p=2 | −7≡1 mod8, hence split; μ(H)=μ₂, so Rubin excludes2, JLK's two-variable result includes2 | Retain |
| §4.8 new division-tower Check | E:y²=x³−x, p=5 | Full mod5 CM image `(𝔽₅^×)²` has order16; conductor-one ray quotient has order4 | R07 |
| §5.1 new Frobenius transport | c³=1≠c, φc=c², F=X+Y+XY/c | `Ng=1+c²X`, `g^φ=1+cX`; derivative sides5c versus5c² | R02 |
| §5.1 existing constant Check | Teichmüller d, u_n=φ^{-n}d | Norm gives `(φ^{−n−1}d)^5=φ^{−n}d`; g=constant d works | Retain, but cannot detect coordinate error |
| §5.1 one-variable injectivity | cyclotomic roots at p=5 | Nonzero system Nζ₂₅=ζ₅; `(σ−κσ)u=0`; any Λ-linear image in Λ is0 | R03 |
| §§4.8,5.1–5.3 specialization | A₂/(S−a,T−b), set T=b | Before: codim2, all height-one lengths0; after: length1 at(S−a) | R03 |
| §5.2 image versus ideal | J=(S−a,T−b), ν≠0 | Image Jν strictly smaller than Aν; their height-one hulls equal Aν | R04 |
| §5.2 new moment | E:y²=x³−x over 𝔽₅ | Affine count1+1+2+2+1=7, plus infinity=8; a₅=−2; Euler square `(6−2i)²/25=(32−24i)/25`; conjugate differs | Retain numerical values; correct type label in R07 |
| §5.4 small split p | K=ℚ(√−2), p=3 | −2≡1 mod3, split; h_K=1, unit order2, so 3 divides neither | Retain permitted small-prime example |
| §5.5 λ-involution headline | series T under ι | `ι(T)=(1+T)⁻¹−1=−T/(1+T)`; λ both1; unit factor does not change degree | Retain convention; not a substitute Lean headline |
| §7.1 non-CM control | level11 newform, a₂=−2 | Only possible imaginary discriminant dividing11 is −11; 2 is inert since −11≡5 mod8, so CM would require a₂=0 | Retain |
| §7.2 comparison normalization | scalar multiple c of irreducible comparison | Galois comparison alone permits c≠1; fixed nonzero de Rham generator gives c·v=v, hence c=1 | Retain marked normalization |
| §7.6 contained case | p odd; p=2 | Unique odd-p quadratic subfield imaginary exactly p≡3 mod4; dyadic imaginary possibilities ℚ(i), ℚ(√−2); index2 induction has dimension2 | Retain |
| §7.7 length lemma | A=ℤ_p[[T]], M=A/(T), a=p | M/aM=𝔽_p of length1, M[a]=0; right side `1·[𝔽_p]` | Retain |
| §7.8 new generator argument | w in aH¹; χ through cyclotomic quotient | χ(a)=0; all but finitely many χ have χ(s)≠0; a nonzero twisted L-value gives `0=L·γ≠0` | Retain contradiction, using KES §4.2 only |
| §7.8 new module argument | minimal prime; then p-kernel | `dim A=1`, A/a a field, H¹/a dimension1, H² length≤0 hence0; stabilized norms on T/p equal multiplication by p=0 | Retain |
| §7.8 abelian negative control | T=ℤ_p(1) versus irreducible CM induction | Roots give nonzero torsion for first; a nonzero map from an abelian-action representation to the irreducible induction would force its nonabelian image to be abelian | Retain exclusion; reinforces R03 |
| §§7.9,8.5 specialization | A dim2 regular, a prime, M₂=H¹/Aw, H¹_(a)=A_(a) | If ah∈A and h=y/s with a∤s, then a divides ah in A and h∈A; thus M₂[a]=0 | Retain saturation step |
| §8.3 Euler cancellation | g in conductor inertia, p inverted, χ_T(g)≠1 | Untwisted local module has g=1; twisted relation gives annihilator `χ_T(g)⁻¹−1≠0`, a coefficient-field unit, hence localized module0 | Retain |
| §8.5 equality bookkeeping | let b=ℓ(M₁[a]), c=ℓ(M₂/a) | Length lemma gives ℓ(M₁/a)−b=c; descended H¹/Z length c+b=ℓ(M₁/a)=descended H² length | Retain equality, not just inequality |
| §8.6 coefficient descent | finite coefficient extension, local length n | Both characteristic-divisor lengths multiply by the same local ramification factor e: en=en iff n=n; faithful flatness detects equality | Retain rational endpoint |
| §8.7 central character | k=2 versus k=3, c=−1 | k2: exponent−1, character square1; k3 would require a character square−1 at an element of order2 | R06 |

### Pinned library and duplication audit

Pins checked: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The declarations were opened at those pins, not inferred from the name resolver.

| Native object | File and line | What it supplies, and the relevant limit |
|---|---|---|
| `ClassGroup` | `Mathlib/RingTheory/ClassGroup/Basic.lean:89` | Quotient of invertible fractional ideals for a domain; not an arithmetic norm tower. |
| `Module.length` | `Mathlib/RingTheory/Length.lean:31` | Length from the submodule lattice; infinite length is allowed. |
| `Ideal.height` | `Mathlib/RingTheory/Ideal/Height.lean:36` | Ideal height, through minimal primes. |
| `IsLocalization.AtPrime` | `Mathlib/RingTheory/Localization/AtPrime/Basic.lean:50` | Localization at a prime complement. |
| regulator / nonzero regulator | `Mathlib/NumberTheory/NumberField/Units/Regulator.lean:267,290` | Regulator of the unit lattice and nonvanishing; the existing unit-lattice theory is the input, not a new regulator construction here. |
| `NumberField.Units.torsion` | `Mathlib/NumberTheory/NumberField/Units/Basic.lean:145` | Torsion units; does not identify them with H⁰ of the Tate module. |
| `NumberField.IsTotallyComplex` | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:210` | All infinite places complex; number-field hypotheses still come from the standing setting. |
| `IsCyclotomicExtension` | `Mathlib/NumberTheory/Cyclotomic/Basic.lean:74` | Roots and generation with nonzero exponents; not a CM Iwasawa cohomology construction. |
| `cyclotomicCharacter` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:308` | The intended character when the field has the required p-power roots; the total definition also has a fallback, so that hypothesis matters. |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | The native inverse-limit ring; arithmetic modules are additional objects. |
| Modulus / RayClassGroup | `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98`; `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean:130` | Native modulus and ray-class quotient. |
| HeckeCharacter | `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70` | Continuous idèle-class homomorphism; not Kato's realizations. |
| `HeckeRing.GL2.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | Eigenform, newness and normalization; no attached Galois realization field. |
| rayClassField / rayClassArtinEquiv | `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123,209` | Actual number fields and Artin equivalence; R08 corrects the contrary claim. |
| `TauCeti.Iwasawa.charIdeal` | `TauCeti/RingTheory/Iwasawa/Char/Ideal.lean:85` | Generic characteristic-ideal construction already exists; arithmetic equalities here are additional results. |

The native definitions were inspected, including their actual fields and types: `rayClassField (𝔪 : Modulus K) : IntermediateField K (SeparableClosure K)`; `HeckeCharacter := ContinuousMonoidHom (IdeleClassGroup (𝓞 K) K) ℂˣ`; and `Newform ... extends EigenformAwayFromLevel N k` with fields `isNew` and `isNorm`. These give, respectively, a field carrier, a continuous character and a normalized newform, not an arithmetic Iwasawa module or an attached Galois realization. `Module.length` uses `(Order.krullDim (Submodule R M)).unbot ...`, so finite length is a theorem to establish, not part of the carrier.

Object searches covered units and elliptic units, ray fields and class modules, Coleman interpolation, Katz measures, CM realizations, determinant lines and characteristic ideals, rather than merely proposed names. The package declares no Lean names, so no fully qualified declaration collision can occur. The retained general arithmetic targets are not restatements of the native ring/class-field carriers. No extra padding or duplicate target was found beyond the inaccurate missing-carrier description.

### Suppliers, open ownership and direction

The board package index was read before checking existence. Open heads were inspected through the roadmap service. The overlap data reported no conflicting revision, dropped cited id or id available only in an unnamed revision. The closest heads were read: KatoEulerSystems #1804, AutomorphicCongruences #1816, ModularIwasawaMainConjectures #1499, EulerSystemsAndKolyvaginSystems #1272 and CMRankZeroConverse #1744. The first supplies the zeta machinery and analytic input; the next supplies congruence arguments, not the CM equality; the base roadmap supplies the formulation; EulerSystems supplies general bounds; CMRankZeroConverse consumes the result. None justifies importing a later consumer back into this package.

Every supplier citation was resolved by section and content, with the following grouped audit. The R01–R04 findings concern the strength or use of existing inputs, not missing section numbers.

| Supplier | Sections resolved and content checked |
|---|---|
| GlobalNumberFields; ClassFieldTheory; completed ProfiniteProPGroups | Layers 2,9,10; ClassFieldTheory's former §2.6 maps to its conventions, including arithmetic Frobenius, and Layers 10,11,13 contain Brauer, Artin and ray fields; completed ProfiniteProPGroups Layer 9 prerequisites contain the completed algebra. |
| ModularForms; EllipticCurves; ModularCurves | Layers 4,5,7,9; Layers 1–2; Layers 0,2: forms/L-functions, formal groups/isogenies and divisors, respectively. |
| PadicMeasuresIwasawaAlgebras | Layer 1 and §§4.1,4.6,5.1: measures, pseudo-nullity, characteristic ideals, determinant lines. Generic objects remain supplied, not redefined here. |
| SelmerIwasawaCohomology | §§0.9–0.10,2.8,3.0–3.3,3.7,3.13,3.15,3.17. Its cyclotomic odd-p rank formula is expressly not used as the ray-tower formula. Its twist is `Tw_κ(g)=κ(g)g`, agreeing with the inverse-semilinear convention computed above. |
| ArithmeticGaloisDuality; IntegralIwasawaTheory | §§R02.4.3,R02.4.4,D7.5; §§2.6,7.1–7.2,10.0. Weak Leopoldt is stated for every cyclotomic tower; the Coleman input in §7.1 is cyclotomic/unramified, not the arbitrary-coordinate conclusion of R02. |
| EulerSystemsAndKolyvaginSystems | §§2.2,2.5,8.1,8.2,8.6,8.7,8.14,8.25,8.37. General Euler systems, twisting, weak Leopoldt and divisibility are present; the all-p use retains the stated hypotheses. |
| ComplexMultiplicationAndExplicitReciprocity; ImaginaryQuadraticClassNumber | §§1.2,2.2,3.2,4.1,4.2; H3.1. CM §1.2 is at `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:354`, #1254. The ideal-tensor isogeny has kernel E[a], degree N(a), and lattice a⁻¹Λ. |
| AutomorphicGaloisRepresentations and PartII | §§1.5,7.3 and AG2.0: newform representations/compatible family and algebraic Hecke-character realization. |
| AutomorphicLFunctionsAndLocalFactors; LFunctions | AL.1 global distributions, Euler products and rank-one Hecke comparison; Layer 7 nonvanishing. |
| PadicHodgeRegulators | §§1.4,1.7: dual exponential and compatibilities. The relative-height-one reciprocity extension is the correctly declared gap, not claimed present. |
| AutomorphicPadicLFunctionsPartII | §§3.3–3.4,8.5: Eisenstein–Kronecker functions and ordinary Katz measure; the displayed one-dimensional series conversion was recomputed. |
| PadicFamilies; KatoEulerSystems | §4.0.1 theta units; KES §§4.2,5.1,5.3 for analytic nonvanishing and zeta classes. KES §4.2 is at `TauCetiRoadmap/KatoEulerSystems/README.md:1673`, #1804. CM module results of §§4.4,7.2 and PadicFamilies §4.0.3 are explicitly not used for the new CM argument; their supplier-side ownership repair remains settled as explained above. |
| ModularIwasawaMainConjectures | §§0.1,0.6,0.7, including full cyclotomic torsion and the rational endpoint; §0.7 is at `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:467`, #1499. |
| NeronModelsAndSemistableAbelianVarieties | §5.1 Néron–Ogg–Shafarevich, the good-reduction input to reciprocity. |
| NoncommutativeAndEquivariantIwasawa; ColemanPowerSeries; AnticyclotomicLocalUnits | §4.3, including the exact image J (R04); cyclotomic Layers 1–2, whose scope excludes general Lubin–Tate interpolation; §1.1 height-two theory, not a supplier of the split height-one extension. |
| PeriodsAndSpecialValues | PS.5.2 predicate exists at line 1105 of its README, #1496; PS.6.5's weight≤−3 range indeed excludes h⁰(F)(0). Naming PS.5.2 does not strengthen JLK's theorem (R01). |

EllipticCurvePeriodsAndModularParametrizations #1715 was read at its updated one-variable contract and elliptic-unit module: it now requests the EulerSystemsCyclotomicMainConjecture supplier theorem and keeps its Vatsal normalization. The package's larger ideal-indexed CM construction is a legitimate different target; no unsupported normalization identification is imported. “CM pair” in ComplexMultiplicationAndExplicitReciprocityPartII refers to CM algebra/type data, not Kato's marked elliptic curve and division point. These object comparisons give no new duplicate owner. The absent open file for InertAnticyclotomicCMMainConjecture is recorded below; the package does not consume it.

Dependency check, run with the supplied merge order and movable setting:

```text
depcheck: 234 roadmaps, 2127 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No prohibited supplier is consumed. The citation resolver found no missing cross-roadmap section or own Lean name; library names were independently checked as above. No process file or merge-order file was changed.

## Not verifiable

- Yager's thesis is an OCR scan. Chapter 3's basic formulas are readable, but portions of the hypotheses and the full generality of Chapter 8/Theorem 1 remain too garbled to certify independently. Coleman79's fixed-base theorem and Rubin91's explicit restriction in Remark (1) are readable; they do not validate the stronger claims in R02–R03.
- Some overbars and displayed factors in Kato (15.4.4), (15.5.1) and (15.9.1)–(15.9.2) are lost in extraction. The inverse-character and Frobenius conventions were tested independently; a typographic overbar in those individual displays is not certified from OCR alone.
- Rubin91 Theorem 4.1 and its Remarks are readable; a complete independent verification of every argument in the optional proof route through §§8–10 was not performed. The source's stated theorem, hypotheses and page were checked.
- The roadmap service supplied no readable main/open file for InertAnticyclotomicCMMainConjecture. Its scope boundary was checked against BKO21, and no dependency on that roadmap is asserted here. Ownership against other open pull requests whose files the brief does not provide was not checked. The supplied open heads were searched through the roadmap service.

## Source issues

- **Error** in BT at Theorem 2.1, printed page 4: the source says the two characteristic ideals agree without tame conductor corrections; it should retain the Euler modules at primes of f away from p, or use H² over the p f-open; affects a stated result.
- **Error** in Kato at Theorem 15.2(2), printed page 251: the source says the conductor-f elliptic-unit quotient and class module have identical lengths throughout the stated range; it should retain tame Euler factors on components where they are nonunits; affects a stated result.
- **Gap** in BT at the proof of Theorem 2.6, printed page 5: the source says the equality follows through Kato's descent; it should include the equality bookkeeping from Lemma 14.15, since the cited Proposition 15.17 supplies an inequality; affects the proof.
- **Misprint** in Kato at the proof of Proposition 15.17, printed page 265: the source says the needed length result is Lemma 14.12; it should cite Lemma 14.15; affects nothing.
- **Misprint** in Kato at (15.4.2), printed page 252: the source says the CM theta norm identity holds for an unrestricted linear isogeny; it should require isogeny degree prime to N(a), since quotienting by E[a] pushes the divisor to zero; affects a stated result.
- **Gap** in CGLS at Theorem 1.2.2, printed page 8: the source says Rubin's theorem supplies the needed characteristic-ideal comparison under the displayed assumptions; it should justify the missing prime-to-p class-field-degree hypothesis or invoke an appropriate all-prime theorem; affects the proof.
- **Misprint** in JLK at §1.2, printed page 4 (JLK line 164): the source says a character factors through a subgroup identified as Gal(F′/K); it should say quotient group for the subextension F′/K; affects nothing.
