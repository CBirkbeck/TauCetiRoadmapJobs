# Review of EllipticKTheory (pull request #1489 at 52dfcf3)

**Verdict:** needs changes

## R01 (P1) — Geometric integrality is attributed to a declaration absent at the pin

**Location.** `TauCetiRoadmap/EllipticKTheory/README.md:529–542`, also lines 71 and 257, and `TauCetiRoadmap/EllipticKTheory/Suggested.lean:17–19`: “Tau Ceti's instance `WeierstrassCurve.geometricallyIntegral_projModelOver` proves it for the structure morphism over every commutative ring. It is cited, never re-proved.”

**Claim.** This is an available pinned prerequisite, including the singular-cubic case, rather than outstanding work.

**Witness.** At pinned Tau Ceti a91d3aaf, `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Integral.lean:60` provides only `isIntegral_projModel`. After building that module, `#check @WeierstrassCurve.geometricallyIntegral_projModelOver` returns “Unknown constant”. ModularCurves Layer 2A, README line 647, supplies the smooth case.

**Repair.** Remove the nonexistent declaration from Scope, the supplier contract, §1.2 and the module docstring. Cite ModularCurves Layer 2A for the elliptic geometric-integrality prerequisite. If retaining geometric integrality for arbitrary, possibly singular Weierstrass cubics, explicitly make that extension a target, using the supplied base-change comparison and the pinned integrality theorem over extension fields; do not restore the duplicated smooth-case acceptance theorem. This repair preserves the singular Check: over every extension of 𝔽₅, `y²−x³` remains irreducible and its projective closure integral, while the origin has both partial derivatives zero. It distinguishes the valid mathematics from the missing implementation.

This is a missing named prerequisite, hence P1 under this review's supplier-drift rule; it is not a claim that geometric integrality is false. The previous review itself distinguished the pin from a later implementation, but its proposed wording erased that distinction. No later revision can certify this pin.

## Verified sound

The entire 2,711-line README and 239-line Lean file were reviewed, including unchanged passages. The review is read-only: the diff outside this roadmap is empty and the worktree remains unchanged. There is **one finding, one blocking finding**. No additional mathematical counterexample, route-specific restriction, computational algorithm, copied source passage, sorry'd data or option override was identified.

**Disposition of the previous review, checked before the full pass.**

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01, duplicated geometric-integrality headline | README §1.2: “ModularCurves Layer 2A proves it for the smooth projective cubic”; Lean docstring: “Layer 1 states no headline” | Duplication repaired: the theorem is deleted and the owner cited. The replacement's pinned-instance claim is wrong; see this review's R01. |
| R02, undeclared and doubly owned gaps | README lines 341, 346, 417, 425 each begin “What … must provide (gap:…)” | Repaired. All four slugs match `packages/EllipticKTheory/design/plan.json`; the former local foundational targets are gone. |
| R03, invented supplier declaration names | README lines 322–340: “§2.2 the derived pullback”; lines 355–360 cite Q-theory by section; lines 311–320 cite the marked-model interface by section | Repaired. The listed invented names were removed; the cited sections contain the mathematical contracts. `genericFibreInclusion`, the old resolver lead, is a real local definition at Lean line 114. |
| R04, revision/process narrative | README contract now cites `LocallyOfFinitePresentation.iff_locallyOfFiniteType` by name; §5.7 cites “p. 504” for the e-invariant correction | Style repaired. Removing revision language did not make the absent instance available: that separate factual error is R01. |
| R05, redundant Bloch-correction hypotheses | Lean line 213 onward uses `(C : ℕ)` and the explicit principal-divisor hypothesis, without `hCpos` or `hC` | Repaired. At C=0, every auxiliary divisor is zero and every correction residue is 1. For C>0, the point annihilation follows from the principal divisor. |

**Gate and elaboration.** The worker's gate at this exact head reports every scanner, dependency, metadata, stray-file, outside-folder and targeted-build check zero, ending `build=0 OK`. I independently ran the prescribed dependency check:

```text
depcheck: 204 roadmaps, 1498 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. I built the missing imported object with `lake build TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.ProjModel`, then ran `lake env lean` on the unchanged acceptance file: exit 0, six `sorry` warnings only. The separate Integral-module build and deliberately failing pin probe establish R01; they are not failures of the acceptance-file build. The citation resolver found no missing roadmap section, but explicitly could not inspect the Lake pins on its host; its clean result therefore does not resolve R01.

**Headline and Lean audit.** The README's end results are the elliptic K₀ ring/comparison, curve localization and two-column coniveau, the integral regular-curve motivic tower and Adams comparison, Harder finiteness and positive finite-field descent/classification, twisted-kernel orders, minimal marked models and their terminal uniqueness, the model-independent integral part and vertical characterization, last-place reciprocity, Bloch correction and quotient descent. Six headline signatures are present:

| Declaration | Elaborated scope and adversarial control |
|---|---|
| `card_twistedFrobeniusKernel` | Elliptic W over a finite field, algebraic closure, i≥1. The i=0 ordinary characteristic-two example below explains the bound. |
| `exists_minimalRegularProperModel` | Number field, finite set of finite places, the native S-integer subalgebra, elliptic W and its actual projective scheme. |
| `locallyMinimal_terminal` | A minimal marked regular proper model; unique marked morphism from every such model. |
| `minimal_unique` | Two minimal marked models; unique isomorphism compatible with both the base and generic marking. |
| `tame_last_point` | Actual places, `IsFunctionField k K`, a degree-one place, and all other tame values 1. |
| `blochCorrection` | Actual Weierstrass function field, finite subgroup support, the chosen auxiliary functions' exact principal divisors and residue identifications; C may be zero. |

The docstring names the other headlines and missing higher scheme K-group, motivic-tower and étale carriers; it also distinguishes the wider excellent-Dedekind theorem and the missing supplier-model carrier. No statable missing headline or replacement by a free predicate was found. The model structures bundle native schemes, properness, flatness, regular stalks and a genuine generic-fibre isomorphism; their equivalence to the supplier's marked models is a README target, not a silently changed object.

I elaborated `#check @` for **all 14 declarations** in a scratch copy. No standing hypothesis disappeared, and no signature repair was needed. There are six theorems and eight supporting definitions/structures, one `import Mathlib`, six individually used Tau Ceti imports, real data bodies and no `set_option`. Each theorem was tested in a copy with `rfl`, closing `simp`, `infer_instance` and single-library-lemma search (`exact?`). Five remained unproved; the Bloch-correction search reached the default heartbeat limit without closing. Reading their actual carriers and conclusions also revealed no definition restatement, boundary theorem or Check masquerading as a headline. These probes test padding, not mathematical truth.

**Pinned declarations inspected.** File paths in this paragraph are relative to the indicated library repository. In Mathlib: `AlgebraicGeometry/EllipticCurve/Affine/Basic.lean:123,249` supplies irreducibility and the elliptic equation/nonsingularity equivalence; `Projective/Point.lean:556` the point-group comparison; `FieldTheory/Finite/Basic.lean:333,345` the q-power algebra homomorphism; `AlgebraicGeometry/FunctionField.lean:37,148` the generic stalk and affine fraction-ring comparison; `Geometrically/Integral.lean:40` the morphism property; `Noetherian.lean:271` finite presentation over a locally noetherian base; `Morphisms/Separated.lean:288` the reduced-source/dominant comparison; `RingTheory/RegularLocalRing/Defs.lean:51` regular local rings; `RingTheory/DedekindDomain/SInteger.lean:65` S-integers; and `RingTheory/Flat/TorsionFree.lean:137` Dedekind flatness.

In Tau Ceti: `AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean:80,85,111,118,160` gives the structure morphism, properness, origin and variable-change isomorphism; `Scheme/Integral.lean:60` ordinary integrality; `Scheme/Smooth.lean:176` elliptic smoothness; `Projective/Chart/Basic.lean:184` and `Projective/Chart/BaseChange.lean:97` the chart equivalences; `Affine/FunctionField/PointPlace.lean:334`, `Divisor/Class.lean:79,88`, and `TorsionDivisor.lean:42` the place, divisor-class and torsion-function interfaces. I also opened `FieldTheory/FunctionField/Place/Residue.lean:113,140`: the former requires order zero and returns a **unit**; the latter's norm has junk value 1 without finite-dimensionality. The explicit function-field hypothesis in `tame_last_point` supplies that finiteness. `Place/Zeros.lean:461` supplies finite support.

The inspected scheme Picard bridges are `AlgebraicGeometry/WeilDivisor/Scheme/Picard.lean:253` and `GenusOne.lean:244`, with noetherianness, integral source, codimension-one DVRs, dimension bound, rational base point and exact constant-field hypotheses as appropriate. The latter is a point/Pic⁰ **bijection**, so the roadmap's compatibility with the Weierstrass group law is additional content. `EllipticCurve/Isogeny/Basic.lean:139` is a pointed coordinate-pullback structure for nonzero isogenies, not a carrier including the zero morphism; `Isogeny/Kernel.lean:147` bounds kernel size by degree rather than asserting equality for inseparable maps. `TateModule/Basic.lean:80,94` retains the prime-to-characteristic assumption. Searches also located the remaining unique names in the exact supplier contract; R01 is the absent instance, not an inference from a stale checkout.

**Ownership and supplier resolution.** I used the roadmap search/show tools, main-branch content, the provided open heads, the board's packages, and object searches in both pinned libraries. Search objects included higher K-groups and cycle towers, Adams operations, rank–determinant/Picard equivalences, marked proper models and surface resolution, Steinberg homology, tame symbols, Bloch correction and twisted Frobenius torsion. No conflicting fully qualified declaration of this Lean namespace was found. The native model adapter imports the proper/regular full subcategory of RelativeJacobians §0.1 and its §5.1 existence theorem; it is not a second owner. The integral tower on regular curves over imperfect fields goes beyond the smooth perfect-field tower, whereas the rational comparison is imported from MotivicEtaleKTheory §2.3. The general excellent-surface and nonlocal Dedekind contraction targets extend the DVR scope of StableReduction Layers 4–5. No move to a later supplier is required.

Resolved supplier groups (all paths `TauCetiRoadmap/<name>/README.md`; line numbers are evidence at the copies read):

| Supplier | Sections and witness lines |
|---|---|
| ModularCurves, main | 1A–1B, 1D(6), 2A–2D; 449,466,563,601,647,751. Smooth geometric integrality belongs here. |
| EllipticCurves, main | Layers 0.5–3; 398,423,647,683: points/divisors, degree and inseparability, torsion/Tate modules, Frobenius. |
| AlgebraicCurves, main | Layer 12A–12D; 1468–1633: regular curves, function fields, places and divisor comparison. |
| JacobianChallenge, main | A, B, D; 111,135,218: divisor/Picard, coherent cohomology, pointed descent and the Brauer obstruction. |
| StableReduction, main | Layers 4–5; 529,552: normalized blowups, common resolution and minimal regular models over a DVR, including the genus-zero exception. |
| SchemeAndStackFoundations, main | §§4.13,5.7,5.11; 5643,6987,7273: regularity, degree-zero K/G and the general finite-field curve bound. |
| RelativeJacobiansAndIntegralCurveModels | §§0.1,5.1; 93,895: marked Dedekind models and global regular-model existence. |
| SchemeKTheoryOperations | §§2.2–2.7 (525–757), 3.3/3.5–3.7 (901,966,1018,1117), 4.5 (1469), 5.1–5.2/5.5 (1787,1813,1896), 6.8–6.9/6.11 (2569,2628,2720), 7.6 (2960). Properness, perfectness, Tor independence, boundary orientation and the restricted operation scopes are retained. |
| GeneralAlgebraicKTheory | §§2.4–2.5,3.2,4.6,4.8,4.14,13.8c; 331,347,419,772,800,890,3028. Exact-functor naturality and finite-field calculations are genuinely stated. |
| KTheoryLowDegrees | §§8.1,11.2,12.1–12.4; especially 1450–1547. The rank–Pic classification, square-zero product and abstract elliptic decomposition are supplied; this roadmap keeps their concrete Weierstrass compatibility. |
| K2SymbolsBrauer | §§5.12,6.16,7.2,8.2–8.3,9.2–9.4,9.7,9.11,9.13,9.15,10.21,10.27,10.29–10.30,10.32c–10.33,11.1,11.6,12.1,12.11; 697,1145,1222,1310,1426,1530,1603,1651,1680,2133,2278,2320,2347,2457,2469,2501,2592,2649,2854. The two tame-boundary conventions and norm/residue directions agree. |
| KTheoryFiniteLocalFields | §§1.5–1.6,3.0–3.0a,3.4,5.17; especially 513–552,1205–1235. Shared Bloch complexes and perfect-field towers are not replanned. |
| MotivesAndAlgebraicCycles | §§4.4,4.7–4.8,4.17; 603,676,691 and the perfect-field comparison. The arbitrary-field Bloch/Suslin identification remains the declared gap. |
| ArithmeticKTheory | §§1.1,2.1,2.4,3.2–3.4; 515,653,847,951,1029,1191. The criterion is general Dedekind; its proved Steinberg-homology target is number-field-specific. |
| MotivicEtaleKTheory | §§2.2–2.3; 283,306. Full-support rational comparison covers regular quasi-projective schemes over arbitrary fields, not only smooth ones. |
| K3BlochGroups | §§2.1,2.2,2.5; 342,384,505. Milnor image, injectivity, motivic edge and number-field rational ranks. |
| NeronModelsAndSemistableAbelianVarieties | §§1.8,2.7,5.3b,6.5; 939,1234,3348,3993. Properness/good reduction and regular-model smooth loci are distinguished. |
| StableHomotopyKTheory | §§7.1–7.4,7.8,7.21–7.29; 2341,2368,2390,2398,2448,2594. The coefficient Bockstein retains its one-degree shift. |
| DeligneWeightsAndPurity | DWP.0 §0.2(iii), DWP.1 §§1.4,1.6–1.7; 601,960,990,1006. Reciprocal roots and the base-point-free curve/Jacobian comparison. |
| EtaleDualityAndPerverseSheaves | §§0.3,0.5; 465,526,669. Curve trace and Kummer/H¹ duality require invertible coefficients. |
| WeightsInEtaleCohomology | R34.2; 273–289. Arithmetic Frobenius on Tate modules and contragredient H¹ agree with this roadmap's twists. |
| ArithmeticGaloisDuality; SelmerIwasawaCohomology | R02.2, D7; 1175,4668; and §2.7,490. Compact/rational and discrete torsion coefficients are distinguished. |
| ProfiniteCohomology, main | Layers 10–11 and the procyclic example; 1549,1739,2444. H² vanishing is for torsion or divisible coefficients, not arbitrary discrete modules. |

All `Needs` lines were read for direction and ownership. The four gaps are precise contracts, not unowned prerequisites: noetherian pullback-compatible Adams operations; Adams/étale compatibility of the shared smooth tower; arbitrary-field and filtered-subfield motivic comparisons; function-field Steinberg-homology finite generation independent of Harder. Their same slugs occur in the package plan and README, with named suppliers. Their grouped naturality clauses specify the same comparison, rather than unrelated deliverables. The suppliers' narrower current scopes do not themselves constitute findings. No circular use of Harder was found in §5.5's finite-generation route.

**Seeded source sample.** All fifteen selected targets were checked, including theorem numbering, version, hypotheses and the displayed derivations. No additional locator is flagged “unverified” in the README. Sources were read from the supplied legal cache; the additional Quillen report was fetched through the sources service from the Oberwolfach institutional repository. The review changed no source manifest. The four previously settled unavailable works remain settled below.

| Target | Locator inspected and outcome |
|---|---|
| §1.1 | Poonen §5.7.6, (5.7.29), PDF p.158, poonen line 6048–6063: the general Weierstrass cubic supports the dehomogenizations; the two-chart cover follows by setting Y=Z=0. |
| §1.2 | Stacks 53.9.2/53.9.3, 0BYC/0BYD, stacks line 211644–211675: dimension one and arithmetic genus (d−1)(d−2)/2, including H⁰=k. Mathematical statement passes; library attribution fails R01. |
| §1.3 | Stacks 29.15.6, 10.140.3, 10.119.7; stacks line 116605,38345,34111. Noetherianness, smooth-to-regular and dimension-one DVR assertions have the needed hypotheses. |
| §2.4 | Weibel I.5.16, pp.58–59, weibel line 3337–3355. The source assumes an algebraically closed field, as the README explicitly says. Arbitrary-field compatibility comes from the opened pinned point/Picard bridges, not an invented extension of that example. |
| §2.7 | Weibel VI.6.4, p.503, weibel line 30690–30704, n=0; KTheoryLowDegrees §12.4 supplies the arbitrary-field abstract decomposition. The new assertion is its concrete coordinate compatibility. |
| §3.7 | Weibel V.6.12, p.416, weibel line 25026–25049. The rational injection is a consequence of localization plus ArithmeticKTheory's torsion residue groups, not an integral injectivity claim attributed to V.6.12. |
| §3.8 | Weibel VI.6 opening, p.502, weibel line 30600–30613; all closed residue fields are finite, so K₂ of the residues vanishes. The degree-two point test detects the omitted-point error. |
| §4.5 | Levine §3.2, Lemma 3.3/Proposition 3.5, pp.12–14, levine line 583,618; Theorem 12.12, pp.58–59, line 2644; Theorem 14.7(3),(5), pp.73–74, line 3399–3437. The regular K/G comparison is not restricted to smooth curves over perfect fields. Rational comparison is separately imported; integral weights are not split without hypotheses. |
| §5.1 | Weibel V.3.11, p.395, weibel line 23664–23695, and V.3.3.2, p.386. Proper transfer/perfectness and the affine restriction-of-scalars interpretation agree. The flasque-model omission is a source issue, already avoided by the README. |
| §5.2 | Weibel V.3.12, p.395, weibel line 23707–23713. The formula is multiplication by [f_*O], not blindly by the degree. |
| §5.10 | Weibel VI.1.7 and VI.6.4/6.7, pp.503–505, weibel line 30690–30704,30778 onward. Arithmetic fixed points of the i-th twist satisfy qⁱπP=P; p-primary points are excluded. |
| §6.9 | Scholl Proposition 1.3.6 and proof, p.9, scholl line 317–326, with the local model comparison at line 267–297; Weibel VI.6, p.502. The good-fibre assertion also uses the separately supplied finite-field K₁ calculation; Scholl alone is not claimed to calculate it. |
| §6.10 | DDZ (3.5)–(3.6), Remark 3.8, p.6, ddz line 247–263; Scholl (0.1), p.1, scholl line 23, combined with arithmetic-surface localization. The rational vertical criterion has an explicit proof. Young's rank formula is waived, so its text remains unverified; the incidence-graph calculation is independently tested below. |
| §7.1 | DDZ (3.1), p.4, ddz line 173; Weibel III.6.3, p.234, weibel line 13461–13488. DDZ's convention matches the README; Weibel's is its inverse, which the supplier and README explicitly transport. |
| §7.6 | Bloch p.514 and Young Lemma 3.1 p.37 are waived. Their original wording/numbering cannot be certified here. The stated correction identity was checked directly from its divisors and tame values, including C=0, as recorded below. |

**Computed adversarial pass.** In the following table “match” means the displayed instance agrees with the statement under its hypotheses, not that finite testing proves the general theorem. Exclusions are negative controls. Groups are written additively except residue units. E₋ and E₊ denote y²+y=x³+x and y²+y=x³+x+1 over 𝔽₂. O is the elliptic origin. Each row records actual values or maps, not merely a check count.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Conventions: tame orientation | ℚ(t), {2,t} at 0 | README residue 2; inverse convention 1/2 | distinguishes conventions | none |
| Conventions: sign | {t,t} at 0, char 0 and 2 | (−1)·res(1)=−1; in char 2 this is 1 | matches, including p=2 | none |
| Conventions: residue degrees | ℚ(t), div(t²+1) | degree 2−2·1=0; unweighted count 1−2=−1 | norms/degrees necessary | none |
| §1.1 projective cubic/chart equations | Z=1, Y=1, and Y=Z=0 | affine equation is y²+a₁xy+a₃y−x³−a₂x²−a₄x−a₆; missing-chart locus requires X³=0, hence X=0 | two charts cover | none |
| §1.1 origin and point dictionary | [0:1:0]; cusp y²=x³/𝔽₅ | origin in Y-chart only; cusp has 6 projective points but 5 nonsingular group points | ellipticity required for dictionary | none |
| §1.1 elliptic point group | y²=x³−x/𝔽₅ | affine point count 7, plus O gives 8=4·2; (2,1) doubles to (0,0) | ℤ/4⊕ℤ/2 | none |
| §1.2 geometric integrality | y²=x³ over any extension of 𝔽₅ | y-degree-one factor would require a polynomial square of degree 3; 2 deg g cannot equal 3. Both partial derivatives vanish at (0,0) | integral, not smooth; claimed pin unavailable | R01 |
| §1.2 dimension/cohomology | irreducible cubic, smooth or cuspidal | dimension 1; h⁰=1; h¹=(3−1)(3−2)/2=1; χ=1−1=0 | matches arithmetic genus | none |
| §1.3 regularity and DVRs | smooth closed point; generic point | closed stalk dimension=embedding dimension=1; generic field dimension 0 | DVR assertion correctly codimension-one only | none |
| §1.3 regular versus smooth | k=𝔽₂(t), (y−x)²=t | ring k(√t)[x] regular; after √t base change, ε²=0 with ε≠0 | smoothness fails; regular scope meaningful | none |
| §1.4 function field/closed points | y²=x³+1/ℚ, y=3 | x³−8=(x−2)(x²+2x+4); second residue field has degree 2 | not all closed points rational | none |
| §1.5 group/divisor comparison | P=(2,1) on y²=x³−x/𝔽₅ | 2P=(0,0), −P=(2,4); class of (P)−(O) corresponds to P, not −P | sign fixed | none |
| §1.6 isogeny degree and zero map | identity, [2] in char 0, zero | degrees 1,4; zero has no finite function-field degree; identity kernel size 1; [2] kernel size 4; zero fibre is all E | zero excluded from finite-isogeny carrier | none |
| §1.6 inseparability | Frobenius in char 2 | degree 2, geometric kernel has 1 point; differential 0 | degree need not equal point-kernel size | none |
| §1.6 line-bundle pullback by zero | origin-valued constant morphism | pulled-back line is a 1-dimensional constant fibre, Pic class 0 | actual constant morphism retained | none |
| §2.1 rank–determinant | closed point on curve; Spec F | [Oₓ]↦(0,O(x)); on Spec F its sole point gives (1,O) | dimension-zero exception correct | none |
| §2.1 rank–Pic inverse | (r,L)=(0,O(P)) | (r−1)[O]+[L]=[O(P)]−[O], rank 0, determinant O(P) | inverse matches | none |
| §2.1 nonseparated control | affine line with doubled origin | div(t)=o₁+o₂; [o₂]=−[o₁]; Pic=ℤ, K₀=ℤ², versus A¹ K₀=ℤ | regular does not imply separated | none |
| §2.2 Euler characteristic | ℙ¹, O(n), n=−1,0,1 | χ=0,1,2 equals n+1; degrees −1,0,1 | degree is not χ | none |
| §2.2 exact constants | ℙ¹ over 𝔽₄ viewed over 𝔽₂ | χ(O)=2, g=0, degree O=0; false 1−g gives 1 | H⁰=F assumption matters | none |
| §2.2 point pushforward | quadratic closed point | χ(Oₓ)=2=[κ(x):F]; rank of Oₓ on curve 0 | pushforward differs from rank | none |
| §2.3 principal divisor/Picard | t on ℙ¹ and A¹ | div on ℙ¹=[0]−[∞], line class 0; O(0) has degree 1. On A¹ [0] is principal, class 0 | proper/affine distinction | none |
| §2.4 elliptic Picard splitting | O(P), O(O) | coordinates (1,P),(1,O); inverse (d,P) gives O(P+(d−1)O) | diagram fixes origin | none |
| §2.4 index obstruction | real conic x²+y²+z²=0 | no degree-one points; degree image 2ℤ; hyperplane degree 2 | cannot replace index by 1 | none |
| §2.5 descent of classes | real elliptic rational 2-torsion; real conic | rational point class is fixed and descends; conic O(1) on ℙ¹_ℂ is fixed but would have forbidden degree 1 | origin removes Brauer obstruction | none |
| §2.6 square-zero product | z=[O(P)]−[O] on curve | z²=[O(2P)]−2[O(P)]+[O]=0 by rank–det; componentwise degree product would be 1 | stated ring law necessary | none |
| §2.6 unit/rank-zero controls | (1,O), (0,L) | (1,O)(0,L)=(0,L); (0,L)(0,M)=(0,O) | unit and nilpotent ideal correct | none |
| §2.7 K₀ elliptic coordinates | E/𝔽₅ above | K₀=ℤ²⊕ℤ/4⊕ℤ/2; [O_P]=(0,1,P); [O_P]−[O_O]=(0,0,P) | concrete point coordinate correct | none |
| §3.1 curve localization | ℙ¹_ℚ and ∞ | supported point class (0,1) maps to generic rank 0; [O] maps to 1 | rank map, not degree map | none |
| §3.2 degree-two boundary | {t,t²+1}/ℚ(t) | residues at 0, quadratic point,∞ are 1,i,1; norm i=1. Swapped symbol gives −i at quadratic point | residue sign/norm correct | none |
| §3.3 divisor boundary | t²+1 on ℙ¹_ℚ | valuations +1 at degree-two point, −2 at ∞; degree 2−2=0 | integer valuation, not norm value | none |
| §3.4 restriction | ℙ¹→A¹→Gₘ | [0]−[∞] restricts to [0], then 0; removing no points gives identity | both endpoints correct | none |
| §3.5 finite pullback | t=s², {2,t} | residue 2 becomes 2²=4; e=2, residue extension degree 1 | ramification, not residue degree | none |
| §3.5 inseparable pullback | char 2, t=s², unit a | residue a becomes a², e=2 despite inseparability | separability unnecessary | none |
| §3.6 finite transfer | residue extension ℚ(i)/ℚ | N(i)=1, N(2)=4; identity extension N(2)=2 | norms, no extra e factor | none |
| §3.7 rational injectivity | ℙ¹_ℚ, ∞_*{−1,−1} | generic image 0; structure pushforward is order-two {−1,−1}≠0; tensor ℚ gives 0 | integral injection would fail | none |
| §3.7 both projective summands | K₂(ℙ¹_ℚ)=K₂(ℚ)² | both summands torsion, rational source=0 and rational image=0 | rational claim matches | none |
| §3.8 integral injection | ℙ¹_𝔽₂ | K₂(ℙ¹)=0²=0, residue kernel 0 | finite-field K₂ vanishing used | none |
| §3.8 all closed points | {t,t²+t+1} over 𝔽₂ | at quadratic point θ≠1, θ³=1; rational-point residues all 1; norm θ=1 | rational points alone miss class | none |
| §4.1 determinant/units | ℙ¹_𝔽₃ and A¹_𝔽₃ | K₁(ℙ¹)=C₂², units C₂, SK₁=C₂; K₁(A¹)=C₂, SK₁=0 | nonaffine SK₁ retained | none |
| §4.1 exact constants | proper curve with H⁰=F | generic determinant image is F×; on ℙ¹_𝔽₃ its size is 2, not 4 | determinant is not all K₁ | none |
| §4.2 point splitting | rational point P on ℙ¹ | P*P_*=1−1=0; π_*P_*=1; V(ℙ¹)=0 | self-intersection and section differ | none |
| §4.3 coniveau in degree zero | ℙ¹ | coker div=Pic=ℤ; generic-rank kernel term ℤ; K₀=ℤ² | exactly two columns | none |
| §4.3 coniveau in degree three | ℙ¹_ℚ versus A¹_ℚ | F¹K₃(ℙ¹)=ℤ/48, quotient ℤ/48; F¹K₃(A¹)=0 | filtration not discarded | none |
| §4.4 third K-group | rational point on elliptic E/ℚ | constants and point pushforward split off two copies of ℤ/48, with π_*P_*=id, P*P_*=0 | kernel-only formula insufficient | none |
| §4.5 rational weights/rank filtration | K₀(ℙ¹), z=1−[O(−1)] | ψ²1=1, ψ²z=2z, z²=0 | weights 0 and 1 | none |
| §4.5 integral weight warning | K₀(ℙ²), z=1−[O(−1)] | ψ²z=2z−z²; ψ²(z+z²/2)=2(z+z²/2); integral eigenlattice has index 2 | rational denominators essential | none |
| §4.5 regular integral tower | k=𝔽₂(t), X=A¹ over k(√t) | X regular; geometric base change has ε²=0; weight-zero rank is ℤ on both X and its polynomial stages | scope exceeds smooth perfect-field tower | none |
| §4.5 tower layers/degree range | field, weight 1; curve n=0 | H¹(F,ℤ(1))=F×; for a curve CHʲ(X,0)=0 if j>1 | indices agree with n+1 bound | none |
| §4.5 coefficient generalized weights | ℤ/25 extension, operator ×12 | on kernel and quotient C₅, eigenvalue 2; (12−2)=10≠0 mod25, but 10²=0 | generalized eigenspace needed | none |
| §4.5 differential weights | eigenvalues 2 and 4 | difference −2 invertible over ℚ, so rational cross-weight differential 0; mod2 difference 0 | torsion differential not excluded | none |
| §4.6 indecomposable K₃ | ℚ and ℚ(i) | rational dimensions 0=r₂(ℚ), 1=r₂(ℚ(i)); Gysin shifts field weight 2 to curve weight 3 | quotient and weight shift agree | none |
| §5.1 proper pushforward | ℙ¹ O(−1), elliptic O and O(O) | pushforwards 0,0,1 respectively; Euler characteristics same | matches | none |
| §5.1 finite-flat transfer | Spec ℚ(√2)→Spec ℚ | K₀:1↦2; K₁:2↦N(2)=4 | transfer not inclusion | none |
| §5.1 nonproper negative control | A¹→ℙ¹ | stalk at ∞ of j_*O allows all tⁿ, unbounded pole order; no finite O-module generators | coherent pushforward excluded | none |
| §5.2 isogeny projection formula | [3] in char 0 | f_*f*1=(9,0,O)=[f_*O] | matches degree here | none |
| §5.2 degree-two obstruction | separable degree-two f, char≠2 | f_*f*1=(2,0,P_f); 2·1=(2,0,O), P_f nonzero of order 2 | integral degree-only formula false | none |
| §5.3 determinant line | étale double isogeny | f_*O=O⊕L, L²=O and L≠O; h⁰(L)=0 versus h⁰(O)=1 | nontrivial line detected | none |
| §5.3 multiplication in coordinates | y=(r,e,P), f_*O=(d,0,P_f) | product=(dr,de,dP+rP_f); at y=1 gives (d,0,P_f) | rank-dependent term retained | none |
| §5.4 projective bundle basis | O(m), m=−1,0,1 | coefficients (m+1,−m)=(0,1),(1,0),(2,−1); rank=a+b=1, degree=−b=m | O(−1) convention fixed | none |
| §5.4 finite-field examples | ℙ¹_𝔽₂ | K₁=0, K₂=0, K₃=C₃² of order 9 | genus zero differs from elliptic case | none |
| §5.5 degree-one zero-cycle | closed degrees 2 and 3 | degree([x₃]−[x₂])=3−2=1; its pull/push composite ×1 | rational point not assumed | none |
| §5.5 single-point negative control | degree-two point only | transfer after restriction ×2, not ×1 | cannot silently split by one closed point | none |
| §5.5 affine SK₁ versus K₁ | 𝔽₃[t,t⁻¹] | units C₂⊕ℤ, SK₁=0, K₁=C₂⊕ℤ | SK₁ vanishing does not imply finite K₁ | none |
| §5.5 Steinberg finite generation | rank 1 over 𝔽₃[t], 𝔽₂[t,t⁻¹] | St₁=ℤ; Aut=C₂ gives H₀=ℤ,H₁=C₂; Aut=ℤ gives H₁=ℤ | finite generation, not finiteness | none |
| §5.5 tame cokernel | ℙ¹_𝔽₂ | final F₂×=1; residue θ at degree-two point has norm θ³=1; tame map onto all residue terms | reciprocity plus exactness needed | none |
| §5.6 Harder scope | ℙ¹_𝔽₄ viewed over 𝔽₂ | K₁=C₃², order 9; using base q=2 in geometrically connected formula would give 1 | full constants handled | none |
| §5.6 properness control | Gₘ/𝔽₃ | K₁=C₂⊕ℤ infinite, versus proper ℙ¹ K₁=C₂² finite | nonproper object excluded | none |
| §5.6 characteristic-primary argument | finitely generated uniquely p-divisible abelian A | free rank must be 0 since ×p on ℤ is not onto; p-primary torsion 0 since ×p injective | finite prime-to-p conclusion justified | none |
| §5.7 geometric groups | ℙ¹ over algebraic closure | J=0; K₂ᵢ=0, K₂ᵢ₋₁=D(i)²; K₂ with D-coefficients=D(1)² from K₁ torsion | one-degree Bockstein shift | none |
| §5.7 equivariant splitting | order-four element, Frobenius ×3 | F(x)=−x, not x; section followed by edge returns x | abstract splitting alone insufficient | none |
| §5.7 restriction/transfer | 𝔽₉/𝔽₃, unit −1 | restriction −1; norm (−1)⁴=1; composite on C₂ is ×2=0 | fixed convention agrees | none |
| §5.8 Frobenius on H¹ | y²=x³−x/𝔽₃ | a=0, det π=3; arithmetic H¹ determinant=1/3, geometric=3; twist j=2 gives 3⁴/3=27 | contragredient twist correct | none |
| §5.8 coefficient prime | algebraic closure in char 2 | μ₂ has 1 geometric point (trivial group), μ₃ has 3; ℤ/2 has 2 | invertibility cannot be dropped | none |
| §5.8 continuous coinvariants | trivial discrete ℤ versus compact ℤℓ | H¹(Ẑ,ℤ)=0 but coinvariants ℤ; H¹(Ẑ,ℤℓ)=ℤℓ equals coinvariants | topology and coefficient scope correct | none |
| §5.8 rational cohomology | Spec 𝔽q, j=0 versus j≥2 | H¹(Ẑ,ℚℓ)=ℚℓ; for nontrivial weight qʲ, qʲ−1 invertible and H¹=0 | source's unrestricted assertion avoided | none |
| §5.8 descent vanishing | j≥2, curve degrees 0,1,2 | Frobenius magnitudes qʲ,q^(j−1/2),q^(j−1), all >1; F−1 onto divisible torsion, H¹=0 | exact sequence has zero cokernel | none |
| §5.9 positive descent | q=2,3 and n=1 | K₁ orders 1 and 4 equal (q−1)²; n=0 has ℤ rank and is infinite | positive-degree restriction necessary | none |
| §5.10 subgroup zero/addition | points killed by prime-to-p m,n | 0 killed by 1; mn(P+Q)=0+0=0; qⁱπ(P+Q)=P+Q | actual subgroup laws | none |
| §5.10 torsion exclusion | rational order-two (0,1) on ordinary char-2 E | πP=P but every annihilator even; no coprime-to-2 annihilator | not in B₀ | none |
| §5.10 rational membership | (0,0) on y²=x³−x/𝔽₃, i=1 | 3P=P since 2P=0; (q−1)P=0 | in B₁ | none |
| §5.10 twist matters | E₊/𝔽₂ | #E₊(𝔽₂)=1, a=2; deg(1−2π)=1−4+8=5, while B₀ has size 1 | twist distinguished from ordinary points | none |
| §5.10 base change and p-torsion | field-map transport; mP=pP=0, gcd(m,p)=1 | π commutes with field map; Bézout combination gives P=0 | functoriality/exclusion agree | none |
| §5.11 even orders headline | E₋ and E₊, i=1,2 | traces −2,+2; 1−a·2+8 gives 13,5; 1−a·4+32 gives 41,25 | positive determinants and prime-to-2 | none |
| §5.11 lattice cokernel versus kernel | scalar 5 on ℤ₅⊂ℚ₅ | lattice kernel 0, cokernel C₅; kernel on ℚ₅/ℤ₅ is C₅, with class 1↦1/5 | snake-map direction correct | none |
| §5.11 odd orders | q=2,i=2; q=3,i=1 | (2²−1)²=9; (3−1)²=4 | matches two cyclic factors | none |
| §5.11 no characteristic factor | q=pʳ, i≥1 | 1−a qⁱ+q^(2i+1)≡1 mod p | p-primary part absent | none |
| §5.11 excluded i=0 | ordinary E/𝔽₂ with 4 rational points | degree(1−π)=4 but B₀ deletes all 2-primary points, cardinal 1 | theorem correctly requires i≥1 | none |
| §6.1 marked model definition | identity generic marking versus [−1] twist | on y²+y=x³−x, (0,0) maps to (0,−1) under [−1] | distinct markings not silently equal | none |
| §6.1 proper versus Néron | split nodal fibre | smooth locus is Gₘ, missing node; proper fibre contains node | Néron model is not proper model | none |
| §6.1 regular total space | 37a1 at 37, lifted point (5,18) | equation value 222=6·37, not 0 mod37² | nodal fibre can have regular total space | none |
| §6.1 nonregular equation control | 11a1 at (5,5) over 11 | equation value 0; both partials divisible by 11 | raw equation needs resolution | none |
| §6.2 excellent surface resolution | xy=z² at origin | embedding dimension 3 versus dimension 2; away from origin equality 2=2 | modification must change singular point only | none |
| §6.2 specified model comparison | already regular model; scaled y²=x³−81x | identity resolution for first; scaled discriminant gains 12 at 3 versus good original y²=x³−x | resolving equation not selecting good primes | none |
| §6.3 marked morphisms | identity; blowup of closed smooth point | identity map restricts to id; blowup exceptional fibre ℙ¹ has >1 point, so blowdown not iso | blowup model is nonminimal | none |
| §6.3 minimality predicate | smooth minimal elliptic model | no exceptional (−1)-curve; every outgoing regular-model contraction has empty exceptional set | outgoing-isomorphism convention coherent | none |
| §6.4 common resolution | blowup X′→X and X | common model X′, maps identity and blowdown; both generic restrictions id | marked directions correct | none |
| §6.5 contraction | exceptional ℙ¹ versus smooth fibre | normal degree −1 versus 0; first contracts to regular point, second fails exceptional criterion | criterion discriminates | none |
| §6.6 terminality headline | X=minimum M; X=BlₓM | Hom(M,M)={id}; Hom(X,M)={blowdown} | unique incoming morphism | none |
| §6.6 positive genus | ℙ¹ over DVR, marking diag(π,1) | determinant valuation 1 cannot be made 0 by scalar scaling (changes by even integer) | genus-zero marked uniqueness fails, excluded | none |
| §6.7 marked uniqueness headline | M=M; elliptic involution | unique marking-preserving iso is id; [−1] has different generic map | unmarked automorphisms excluded | none |
| §6.7 localization | S=S′; invert 37 for 37a1 | identity base change; remaining fibres smooth after deleting bad prime | terminal comparison preserved | none |
| §6.8 image independence | marked blowup π:X′→X | j*π_*=j′*; π*j* classes restrict identically; image inclusions in both directions | equality, not only one inclusion | none |
| §6.8 S-monotonicity/colimit | S⊂S′; finite representative | restriction sends each image class to itself; finite diagram uses finitely many denominators | increasing images exhaust K₂(E) | none |
| §6.9 good-prime condition | good fibres over 𝔽₂ and 𝔽₃ | K₁ sizes (2−1)²=1, (3−1)²=4; rationalized groups both 0 | integral surjection at q=2, rational generally | none |
| §6.10 full fibre/G-theory | nilpotent thickening of a component | dévissage identifies G₁ with reduced component's G₁; multiplicity does not multiply rational rank | no singular K=G shortcut | none |
| §6.10 split node | 2 vertices, 2 parallel oriented edges | ∂e₁=∂e₂=s−c; kernel span(e₁−e₂), dimension 1; Frobenius identity | split multiplicative rank 1 | none |
| §6.10 nonsplit node | Frobenius exchanges branches | F(e₁−e₂)=−(e₁−e₂); invariants solve 2x=0 over ℚ, hence 0 | nonsplit rank 0 | none |
| §6.10 additive fibres | type IV and type II | IV: b₁=3−4+1=0; pairwise triangle would give 1; II has one branch, b₁=0 | incidence graph correct | none |
| §6.10 vertical criterion | constant {−1,3}, component multiplicity m | residue (−1)ᵐ, order≤2; tensor ℚ gives 0 | torsion residue allowed rationally | none |
| §6.10 nonintegral control | u=1/3, component V=0 at 3 | ord(v)=1, ord(w)=0; residue 1/w̄ with nonzero divisor, infinite order | every nonzero multiple excluded | none |
| §7.1 unit-valued tame definition | f=t²u,g=t³v | ord(f³/g²)=6−6=0; tame u³/v² (sign (−1)⁶=1) | denominator is a unit | none |
| §7.1 Steinberg/sign | t,1−t at 0,1,∞ | tame values 1,1,1; at ∞ sign −1 cancels residue −1 | relation holds, sign essential | none |
| §7.1 symbol candidate | coefficient +1 and −1 on same pair | Finsupp sum 0; product of residues c·c⁻¹=1 | cancellation respected | none |
| §7.1 candidate versus K₂ | single formal pair (t,1−t) | formal coefficient vector nonzero; K₂ class zero by Steinberg | candidate not identified with quotient | none |
| §7.2 finite certificates | zero candidate and {2,t}/ℚ(t) | empty support certifies zero; residues of {2,t} at 0,∞ are 2,1/2 | false empty certificate rejected | none |
| §7.2 norm-one negative control | quadratic residue −1 over ℚ | norm (−1)²=1 but residue −1≠1 | norm check alone insufficient | none |
| §7.3 integral certificates | symbols of model units; u=1/3 | orders (0,0) give 1 on each divisor; bad component gives 1/w̄≠1 | vertical condition discriminates | none |
| §7.4 last rational place headline | all other values 1, degree-one P₀ | reciprocity leaves N(c)=c=1 | degree-one norm injectivity supplies conclusion | none |
| §7.4 inseparable residues | k=𝔽₂(s), {s,t²−s} | residue at degree-two point s, norm s²; infinity s⁻²; product 1. Unnormed product s⁻¹ | inseparable norm retained | none |
| §7.5 torsion functions | rational 2-torsion P=(0,0), y²=x³−x | div(x)=2(P)−2(O); C=1 would force P=O | prescribed divisor fixes annihilator | none |
| §7.5 rho and excluded characteristic | C=1; ordinary char2 C=2 | rho has zero divisor and is constant for C=1; char2 rational 2-torsion sum is nonzero | prime-to-characteristic hypothesis meaningful | none |
| §7.5 normalizations | 11a3 torsion function example | first norm equals −x⁵, not x⁵ | sign retained | none |
| §7.6 Bloch correction headline | local c=−1,C=5 | first tame c⁵=−1; correction c⁻⁵=−1; product 1 | matches | none |
| §7.6 correction sign control | local c=2,C=3 | correct 2³·2⁻³=1; reversed correction gives 2⁶=64 | excludes plus-sign error in exponent | none |
| §7.6 outside support and origin | point outside T; O | outside: all orders 0 so 1; all nonorigin residues 1 force O-residue 1 by reciprocity | no missing origin correction | none |
| §7.6 C=0 and trivial subgroup | every div f_P=0; T={O} | auxiliary functions constant, correction residues 1; empty sum=0 | retained Lean generality true | none |
| §7.7 integral obstruction | {1/y,x} on y²=x³−x | at (0,0),(1,0),(−1,0),O values −1,1,−1,1; doubled symbol has all 1 | unmultiplied formula would fail | none |
| §7.7 tensor obstruction | P=(1,0), rational half-point test | resulting quartic at candidates x=±1 has value 4, not 0; no rational half-point | cannot divide integrally by 2 | none |
| §7.7 divided versus integral Sₐ | C=3 | divided coefficients 1 and 1/3; integral coefficients 3 and 1 | rational normalization explicit | none |
| §7.7 normalization at points | repeated points versus distinct points | 1/x at O has value 0, so division undefined; distinct normalized values 1,−1,1 | distinctness prevents zero denominator | none |
| §7.7 constant/torsion quotient | div h=nD, ζⁿ=1 | n{h,ζ}={h,ζⁿ}={h,1}=0; constant tensors persist before quotient | torsion disappears only after ℚ | none |
| §7.8 constant-field transfer | ℚ(√2)/ℚ | N(x−√2)=x²−2; transferred symbol {x−√2,y} becomes {x²−2,y} | projection formula matches | none |
| §7.8 degree-two residue norm | x₀²+2x₀+4=0 | N(1/x₀)=1/4; scalar 2 has norm 4 | residue target not ℚ before norm | none |
| §7.9 restriction/corestriction | quadratic Galois extension | res Nβ=β+σβ; N res a=2a; at a={−1,−1}, 2a=0 | rational division by degree necessary | none |
| §7.9 quotient, not canonical lift | k=ℚ(s,t), constant {s,t} | t-residue=s≠1, so constant class nonzero; two lifts differing by it have same quotient | quotient target essential | none |
| §8.1 explicit symbols | u=4, (x,y)=(4,20) | v=1,w=0,h=5; opposite point v=−1,w has pole,h=0 | zeros/poles distinct and normalized | none |
| §8.1 eight residues | ordered support from README | both {v,w} and {−1,h} give (−1,1,−1,1,1,−1,1,−1); coordinatewise product all 1 | certificate matches source | none |
| §8.1 specializations | Q=(−16,0), u=4 | specialization {−1,5}; residue at 5 is −1≠1 | horizontal tame-zero need not mean zero K₂ class | none |
| §8.1 discriminant/general parameter | u=4; u=1/3 | Δ=16·4⁴·15²=921600; Δ(1/3)=1024/6561; u=0,±1 gives Δ=0 | corrected exponent 2 | none |
| §8.2 degree-two worked example | {y−3,x} on y²=x³+1 | values 1/2,1/x₀,−2,−4,1; normed product (1/2)(1/4)(−2)(−4)=1 | all factors checked | none |
| §8.2 raw-product warning | same example | unnormed product 4/x₀=−1−√−3, not 1 | field norms indispensable | none |
| §8.3 split fibre integrality | 11a3 symbol; u=4 | component function orders 0 give tame 1; for u=4, 4u=16 integral and 2α passes all vertical checks | no good-prime shortcut | none |
| §8.3 bad denominator | u=1/3 at 3 | 4vw=−3(v²−1)(w²−1), generic V=0 gives ord v=1, residue 1/w̄ | infinite order obstruction persists | none |

The table has 144 computed rows covering every numbered target, the headline signatures, the retained definitions and their principal API/convention tests. Inapplicable degeneracies were also checked at the carrier boundary: a field cannot have q=1 or be the zero ring; the elliptic carriers are nonempty because they contain O; the cardinality theorem uses ℤ arithmetic rather than truncated natural subtraction; residues are units rather than divisions at arbitrary zero values; and the model theorems retain the number-field/S-integer hypotheses explicitly. No tests of nonabelian groups are needed for these native additive point groups and K-groups: their abelian structure is part of the carrier, not an unsupported hypothesis on arbitrary groups.

**Shape.** The eight layers have examples and dependencies; the retained definitions carry API prose and at least three Checks. The finite certificates record mathematical finite support and residue equalities, not executable algorithms. The file imports suppliers and states compatibility targets rather than re-planning their abstract classification. I compared the house form with main-branch Completed/UniversalCovers, Completed/EffectiveBounds and the relevant AlgebraicCurves sections. The only blocking issue found by the complete pass is R01.

## Not verifiable

- **bloch**, ICM Helsinki construction, printed p.514, used in §§7.6–7.7: settled as waived. The legal-source/cache information supplied with the job contains no readable text. I did not re-request it or infer its wording from the previous review. The direct residue proof checks the statement here, but does not certify attribution or the integral/divided convention in the original.
- **young**, Lemma 3.1 p.37 and Theorem 3.3 p.41, used in §§6.9–6.10 and 7.3/7.6–7.7: settled as waived. The supplied source service/cache record provides no readable thesis. The displayed graph and correction computations were independently checked; their match to Young's printed text remains uncertified.
- **geisser-levine**, Theorems 1.1, 8.1 and 8.3, and **grayson**, pp.69–90: settled as uncertified. No new request was made. I checked the supplied contracts and the readable secondary statements in Weibel VI.4.7 and IV.6.9; that does not certify these original proofs.
- The phrase “published correction” for Weibel V.3.11 was not independently checked against an errata publication. The defect in the cached draft and the corrected hypothesis are directly verifiable at weibel line 23672.
- Ownership comparisons cover main, the board packages and the supplied/readable open heads. They do not certify unpublished work or open heads absent from the supplied checkout inventory. In particular, no unavailable implementation of a declared supplier gap was presumed.

These limitations are not new supplier-gap findings and do not request any of the settled texts again.

## Source issues

- **Error** in weibel at Example I.5.5.1, printed p.52 (weibel line 2962): the source says the projective twisting bundle O_X(d) has degree d on every smooth projective complex curve; it should be d times the embedding degree, for example 3d on a plane cubic; affects a stated result.
- **Error** in weibel at Example I.5.7(3), printed p.53 (weibel line 3011): the source says tensoring a rank-r degree-zero bundle by a degree-d line yields degree d; it should yield degree rd, for example degree two for rank two and a degree-one line; affects a stated result.
- **Error** in weibel at the paragraph before Proposition I.5.14, printed p.57 (weibel line 3258): the source says every discrete valuation of k(X) determines a prime divisor because X is separated; it should restrict to divisorial valuations centered in codimension one; infinity has no center on A¹; affects a stated result.
- **Misprint** in weibel at Example I.5.15.1, printed p.58 (weibel line 3303): the source says the ideal sheaf of a hyperplane is O(1); it should be O(−1), consistently with the grading convention at weibel line 2885; affects nothing.
- **Gap** in weibel at Proper Transfer V.3.11, printed p.395 (weibel line 23672): the source says the flasque model contains bounded complexes with only a stalk-cardinality bound; it should additionally require pseudocoherence before including that model in bounded pseudocoherent complexes; affects the proof.
- **Gap** in weibel at §VI.6 opening, printed p.502 (weibel line 30604): the source says Weil reciprocity alone identifies the tame cokernel with the constant-field units; it should also justify image equals norm-kernel, using affine SK₁ vanishing and coprime-degree closed points; affects the proof.
- **Misprint** in weibel at Theorem VI.6.4 proof, printed p.504 (weibel line 30724): the source says the splitting edge map starts from coefficient K-theory of X; it should start from coefficient K-theory of the geometric curve X̄; affects nothing.
- **Error** in weibel at the paragraph before Example VI.6.5, printed p.504 (weibel line 30733): the source says rational arithmetic cohomology always equals geometric invariants because higher Galois cohomology is torsion; it should retain continuous Galois cohomology unless weights exclude eigenvalue one; trivial ℚℓ has H¹(Ẑ,ℚℓ)=ℚℓ; affects a stated result.
- **Misprint** in weibel at Lemma VI.6.6 proof, printed p.505 (weibel line 30771): the source says arithmetic H¹ equals the entire twisted geometric Jacobian torsion before passing to invariants; it should put X̄ in that first H¹, then take Galois invariants; affects nothing.
- **Misprint** in stacks at Lemma 55.10.2, tag 0C9Z, proof, compiled p.4596 (stacks line 219792): the source says the existence argument produces X→Y, with X minimal; it should produce Y→X, as the statement and uniqueness argument already require; affects nothing.
- **Misprint** in dgjk at Proposition 2.2(1), proof, arXiv v1 p.8 (dgjk line 375): the source says the discriminant is 16u⁴(u²−1)⁴; it should be 16u⁴(u²−1)², the squared differences of roots 0,−1,−u² times 16; affects nothing.
