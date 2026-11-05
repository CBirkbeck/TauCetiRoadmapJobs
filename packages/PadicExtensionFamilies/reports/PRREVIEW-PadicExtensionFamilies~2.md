# Review of PadicExtensionFamilies (pull request #1713 at 8c30f7e)

**Verdict:** needs changes

## R01 (P1) — The ambiguity bound is false for the polynomial set defined here

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1539`, “the number of semicanonical polynomials representing a given `L` divides ambiguity/#Aut(L/K)”; the set is defined at lines 1497–1503.

**Claim:** The full-residue specialization set of §6.4 satisfies the reduced-polynomial ambiguity bound.

**Witness:** Take the unramified quadratic `K/ℚ₂`, `I=[1]`, and `L=K(i)`. Both `X²+2X+2` and `X²+2X+6` belong to the set and generate `L`: their discriminants have square ratio `5∈Kˣ²`. But ambiguity/Aut is `2/2=1`.

**Repair:** Distinguish the full-residue specialization set from the reduced set obtained using representatives modulo the images of residual additive polynomials. Keep the full-residue fibre count with the former; state Monge's ambiguity theorem for the latter. Here the full set has `3·4=12` polynomials, six classes, and two representatives per class. The residual map is `z↦z²+z` on `𝔽₄`, with image `{0,1}`: reducing the critical coefficient modulo that image identifies the displayed pair, giving one reduced representative of this Galois extension. Monge's Theorem 1 concerns reduced polynomials (`monge-family line 509`, preprint p.11); its Galois consequence is uniqueness (`monge-family line 521`). Pauli–Sinclair explicitly uses quotient representatives (`pauli-sinclair line 1401`). The asserted divisibility cannot be applied unchanged to all residue representatives.

## R02 (P1) — Take Frobenius orbits of classes, not orbits of families

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1461`, “the disjoint union over the `Gal(K_f/ℚ_p)`-orbits of the relative families over `K_f`”.

**Claim:** Passing from relative families to absolute families uses a disjoint union indexed by orbits of families.

**Witness:** For `K=ℚ₂,f=2,e=2`, the two relative families over `K₂` have `6` and `8` classes. Frobenius fixes each family setwise. Their union has `14` classes; §0.6 gives `10` absolute classes.

**Repair:** State that the absolute family's isomorphism classes are the Frobenius orbit set of the classes inside the corresponding relative family with invariant `(ε,1,slopes)`. Frobenius preserves the invariant, so it acts within that family; orbiting the family as a whole does not identify its conjugate classes. Use §0.6's transport action and bijection. Across these two families, six fixed classes and four exchanged pairs give `6+4=10`, whereas the disjoint-union formulation retains `6+8=14`. This also keeps the factor `f` in the subsequent relative-mass formula consistent.

## R03 (P1) — The boundary Check assigns top slope one to unramified extensions

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1893`, “A tamely ramified `L/K` has visibleSwanSlopes = [], topSlope = 1”.

**Claim:** Every tame extension has top slope one and a single residual segment.

**Witness:** `ℚ₂(√5)/ℚ₂` is unramified, hence tame, with `e=1`. Section 2.7 assigns top slope `0`; §1.5 gives a singleton polygon with no segment. The Check instead assigns `1` and one segment.

**Repair:** Say “tamely ramified with `e>1`” in this Check, and keep the unramified branch separately. The corrected tests give `(top slope, number of segments)=(1,1)` for `ℚ₅(∛5)` and `(0,0)` for `ℚ₂(√5)` and `K/K`. The pinned `IsUnramified.isTamelyRamified` in `TauCeti/NumberTheory/LocalField/Unramified/Basic.lean:202` confirms that “tame” does not exclude this witness.

## R04 (P1) — The cited class-field layers do not supply the correspondence used by Monge

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:283`, “Layers 6–7: local reciprocity, the classification of cyclic extensions by norm subgroups”; also the §6.7 Needs line at 1638.

**Claim:** ClassFieldTheory Layers 6–7 supply the classification needed to turn the norm-subgroup count into a count of extensions.

**Witness:** `TauCetiRoadmap/ClassFieldTheory/README.md:1433` starts Layer 8, which owns local existence and the correspondence. Lines 1453–1475 place `localAbelianExistence`, uniqueness, `localClassFieldCorrespondence`, and the degree formula there. Layer 7 constructs the Artin map and its normalizations.

**Repair:** Cite ClassFieldTheory Layer 8 explicitly for existence, uniqueness, the quotient isomorphism and the degree correspondence, retaining Layers 6–7 for reciprocity. This uses the same earlier supplier and adds no upward edge. Test the distinction on `ℚ₃`: its three index-two norm subgroups must correspond to three quadratic extensions, one unramified and two ramified. A reciprocity statement for an already given extension supplies no extension for an arbitrary subgroup; Layer 8 supplies that missing direction. This is a supplier-contract defect, not a counterexample to Monge's count.

## R05 (P2) — Complete the family construction in the generality it promises

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1404`, “`e_K := absoluteRamificationIndex K p`”; §6.4 begins at 1476 with “For a compatible `I` with `w ≥ 1`”. Equal characteristic is explicitly included at 1796.

**Claim:** Compatibility, generic polynomials and the family-mass partition apply to the stated local-field scope, including equal characteristic and tame families.

**Witness:** For `K=𝔽₂((t))`, `X²+tᵐX+t` has Swan ram `2m−1`, unbounded as `m` grows. The pinned absolute index requires `FinitePadicExtension`, hence characteristic zero. For `ℚ₅(∛5)`, `w=0`, so §6.4 supplies no generic polynomial.

**Repair:** Define the base valuation of `p` with value infinity in equal characteristic, as §4.1 already does, and specify compatibility there: no finite extremal arithmetic band and no finite upper bound. Extend the diagram/existence/mass construction to that case, naming the proof inputs. Add the `w=0` branch using tame uniformizer equations and residue-unit representatives, including `e=1`. Do not narrow away the promised cases. Retest `m=1,2,3`, obtaining rams `1,3,5`, family masses `1,2,4`, and normalized contributions `1/2,1/4,1/8`; the tame cubic has empty wild data and mass `1`. The relevant pinned restrictions are `FinitePadicExtension` at `TauCeti/NumberTheory/LocalField/AbsoluteRamificationIndex.lean:63`, its `charZero` theorem at 91, and `absoluteRamificationIndex` at 110. Merely importing the finite mixed-characteristic different bound cannot cover these inputs.

## R06 (P2) — State the mass-completeness headline in Suggested.lean

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1644`, “Prove that every separable totally ramified degree-n extension is K-isomorphic to a member of `S` if and only if …”; `Suggested.lean:14`–26 and Layer 6 at 318–384.

**Claim:** The acceptance file states the statable headline theorems and names any unavailable ones.

**Witness:** Section 6.8 is absent from both the declarations and the unavailable-headline list. A scratch signature using `Finset (IntermediateField K (SeparableClosure K))`, `HasExtensionInvariants`, the existing structure adapters, algebra equivalences and the finite mass sum elaborated successfully.

**Repair:** Add the full §6.8 equivalence for arbitrary nonarchimedean local `K`, positive `n`, valid members and pairwise nonisomorphic representatives. A simple height wrapper on finite intermediate fields suffices; no new polygon, Herbrand or family carrier is needed. Retain the finite-set and pairwise hypotheses explicitly. The six quadratic extensions of `ℚ₂` give mass `1`; deleting a height-one member gives `3/4`, and deleting a height-two member gives `7/8`. In the wild equal-characteristic test, the finite partial sums are `1−2⁻ᴹ<1`, so both completeness and mass equality are false. The successful probe retained this generality and produced only the expected `sorry` warning.

## R07 (P3) — Record the cited sources in the source manifest

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1927`, “References”; the folder contains no `sources.toml`.

**Claim:** The cited editions, legal copies, verification statuses and stable source keys are recorded as required.

**Witness:** The folder contains `README.md` and `Suggested.lean` only. Neither the ten readable primary texts nor the readable/unreadable knowls have a manifest entry. This is the previous review's R24, still unrepaired.

**Repair:** Add the required source manifest with one stable key per work, retaining preprint-version notes, service provenance and honest statuses. In particular, distinguish a successful PDF/text fetch from a CAPTCHA HTML response: the latter does not verify a knowl. The source audit below supplies the verified locators and the unresolved texts. No source text belongs in the repository.

## R08 (P3) — Replace the remaining broad source references with exact locators

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1503`, “Pauli–Sinclair, the enumeration theorem”; at 1509–1510, “the characterization …; Monge, §3”; at 1535, “loc. cit.”.

**Claim:** These citations locate the existence, coverage and fibre-count claims precisely.

**Witness:** Pauli–Sinclair Theorem 6.3, preprint p.21 (`pauli-sinclair line 1444`), covers a specified reduced set with fixed residual data; its uniqueness clauses have extra hypotheses. Monge Theorem 1, p.11, counts reduced representatives, exposing R01's distinction.

**Repair:** Cite the exact version, theorem and page for each separate claim, and identify any new argument transferring it to the diagram's full-residue set. Use Pauli–Sinclair Proposition 3.11 for polygon realization and Theorem 6.3 for its reduced-set coverage; do not reuse a broad enumeration reference as a fibre-count theorem. The `𝔽₄` example in R01 must be covered by the correctly selected statement, with full-set count two and reduced-set count one. Also give §0.5's tame Galois criterion its precise source or pinned theorem locator rather than only a module name.

## R09 (P3) — The packet Checks do not test separation within a family

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1582`–1587, “A field is in its own packet” and “the packet relation is internal to one family”.

**Claim:** The three Checks distinguish the packet relation from plausible wrong relations.

**Witness:** The relation “all members of the same family are equivalent” passes all three Checks: reflexivity, the quadratic pair, and exclusion of a different family. It discards every residual, group and hidden-slope comparison.

**Repair:** Replace the tautological/out-of-carrier Checks with a negative pair inside one family. For example, `X⁴−2` and `X⁴−4X²+2` over `ℚ₂` both have rams `(2,4)`, Swan `[2,3]` and discriminant exponent `11`. The first has closure group `D₄` and hidden Artin slope `[2]`; the second is the cyclic quartic subfield of `ℚ₂(ζ₁₆)`, with group `C₄` and no hidden slope. They must lie in different packets; the universal relation incorrectly joins them. Keep the existing positive quadratic pair and add a third discriminating test for one of the remaining comparisons.

## Verified sound

The review covered both files in full, the 15 seeded source targets, all 41 numbered subsections, 92 computed adversarial rows, all 37 elaborated declarations, and all 12 admitted theorems. No additional locator was explicitly marked unverified in the README. Findings above distinguish mathematical defects, supplier drift, missing acceptance coverage and optional P3 repairs. The gate is green; that does not establish mathematical truth.

### Previous findings, checked before the full review

Locations below are in `TauCetiRoadmap/PadicExtensionFamilies/README.md` unless marked Lean. Quotes are from this head, not instructions from the previous review.

| Previous finding | Status and passage at this head | Retest |
|---|---|---|
| R01 non-Galois supplier | Repaired: §2.0, line 727, “define `ψ_{L/K} := φ_{M/L} ∘ ψ_{M/K}`”. The construction is now owned here. | Closure jumps `3,7` become `2,4`. |
| R02 monicity | Repaired: Lean 137, “`(hmonic : φ.Monic)`”; the old monicity API theorem is deleted. | `3X+6` has leading coefficient `3`, so fails the new hypothesis. |
| R03 general root differences | Repaired: Lean 90, “`(h : IsTotallyRamified K L)`”; §1.5 transports through the unramified part. | Unramified quadratic: transported list is empty for both uniformizers. |
| R04 splitting ambient | Repaired: Lean 99, “`[Module.Finite K M] [IsGalois K M]`”. | Tame cubic has two zero-valued nonidentity differences in its splitting field. |
| R05 right limit | Repaired: line 811, “the union over positive offsets”. | Cyclotomic quartic orders `4→2→1` give multiplicities `1,1`. |
| R06 residual transport | Repaired: §1.4 orders segments from tame to wild and runs the normalization forward in that order. | The shared endpoint coefficient stays shared after scaling; the old reversed recurrence need not. |
| R07 Miki determination | Repaired: Lean 238, “`(p : ℤ) ^ (r - i.1) * … < …`”; lines 1202–1204 require the highest root. | Weighted levels `4,14,5` are excluded; `4,5` remain allowed. Miki Lemma 17 was read. |
| R08 overlapping boxes | Repaired: §5.2, “empty unless `IsOreAdmissible K n j`”. | Dyadic quartic `j=2,4`: box and count both zero. |
| R09 infinite total | Repaired: §5.4 uses a cardinal sum and the supplied finiteness dichotomy. | Equal-characteristic quadratic strata have counts `2,4,8,…`, hence infinite union. |
| R10 arithmetic Kummer unit | Repaired: line 1435, “equality case of the coefficient/different bound”. | `√2` has ram `2`; unit `5` gives an unramified extension instead. |
| R11 tower wild exponent | Repaired: §0.1 gives addition in towers. | Two ramified quadratic steps give `w=1+1=2`, not `1·1=1`. |
| R12 strict global bound | Repaired: §7.3 states the non-strict inequality and the nonempty-support strict case. | Empty product for `ℚ`: `1=1`; ramified quadratic: exponent `1/2<1`. |
| R13 Artin/Swan mismatch | Repaired: line 1423, “`[1, 2]` … height `5` and discriminant exponent `8`”. | Means `1/2,5/4`; `3+4·5/4=8`. |
| R14 warning/build | Repaired: Lean 1, “`module`”. | Direct elaboration exits zero, with 12 `sorry` warnings only. |
| R15 actual counting headlines | Repaired for the cited three counts: Lean 285, 310 and 376 now count actual fields/classes. | Ore, Krasner and Monge tests below; §6.8 is the separate omission R06. |
| R16 arbitrary p-adic base | Repaired: line 1591, “For finite `K/ℚ_p`”. | Quadratics: `6` over `ℚ₂`, `14` over its unramified quadratic extension. |
| R17 completeness generality | Repaired in prose: line 1644, “any nonarchimedean local field”. | Equal-characteristic partial masses are strictly below one. |
| R18 duplicate suppliers | Repaired: scope imports the canonical tower, and §5.4 consumes MassFormula's dichotomy. | Tower has degrees `f,e`; no second construction is retained. |
| R19 padding | Repaired: the former small-value, boundary and API theorem blocks are deleted. | None of the 12 remaining admissions closed in the one-tactic probes. |
| R20 unused definitions | Repaired: the former standalone `SlopeContent`, `labelPrefix`, splitting-model and compatibility encodings are deleted. | Remaining definitions feed the retained theorem statements. |
| R21 locators | Partly repaired: Miki Lemma 17, Pagano Theorems 1.4–1.5, and Pauli–Roblot Proposition 3.1/Theorem 6.1 now match the versions read. | Remaining broad family references are R08. |
| R22 shape and Checks | Partly repaired: Summary, contracts, layer Examples/Dependencies and the square-class/residual suites are present; existence follows the diagram. | Packet Checks still admit the universal relation: R09. |
| R23 names/docstring | Repaired for the removed phantom names and the listed missing carriers: Lean 20–26 names polygon, jump-set and family limitations. | All 37 own declarations occur in the README. Separate missing headline: R06. |
| R24 manifest | Not repaired: “References” still has no accompanying manifest. | R07. |

No supplied repair disposition marked any of these findings “not actionable in this package”.

### Adversarial values

In the tables, `H=c/f−e+1`, `m=H/e`, and all breaks labelled Swan use upper parameter zero at tame inertia. “Pass” means the stated instance agrees, not that examples prove the theorem. The table records distinct assertions separately where a subsection contains different constructions. Degenerate inputs outside the field/local-field/separable hypotheses are identified explicitly rather than silently admitted.

| Statement or convention | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Local-field scope and denominators | `K=ℚ₂`, `𝔽₂((t))`; zero ring; `q=1` | Residue cardinality is `2`; `e,f,n≥1`. Zero ring is not a field and a one-element residue field is impossible. | Pass; no denominator-zero input in the invariant theorems. |
| Normalized valuation and `addValInt` | Uniformizer, unit, zero | Values `1,0,0`; the last `0` is the declared total-function fallback, not infinity. | Pass; nonzero differences are secured by generation and separability. |
| Artin versus Swan, right limit | `ℚ₂(i)`, `ℚ₂(ζ₈)` | Swan `1` becomes Artin `2`; orders at/after Artin `2` are `4,2`, logarithmic ratio `1`. Intersection of all later groups would give ratio `4/1`, hence `2`. | Pass. |
| Polygon orientation | `X⁴−2` | Heights `(1,8),(2,4),(4,0)` give Newton slopes `−4,−2,−2`; reflected positive rams are `2,4`. | Pass; reflection is explicit. |
| §0.1 tame/wild decomposition | Tame cubic; two quadratic steps | `3=3·5⁰`; `4=1·2²`, and `v₂(4)=1+1=2`. | Pass. |
| §0.3 height and mean | Identity; `ℚ₂(i)`; `ℚ₂(√2)` | `(H,m)=(0,0),(1,1/2),(2,1)`; reconstruct `c=0,2,3`. | Pass. |
| §0.3 residue-degree normalization | Unramified cubic base followed by a ramified quadratic of Swan `1` | `f=3,e=2,c=6`; `H=6/3−2+1=1`, and `3(1+2·1/2)=6`. | Pass; using `c−e+1` would give `5`. |
| §0.4 discriminant class/root field | Basis `(1,√2)` and `(1,2√2)`; cyclic cubic | Discriminants `8,32`, ratio `4=2²`, same square class `2`, root-field degree `2`; cyclic cubic has square class and root-field degree `1`. | Pass. |
| §0.5 automorphisms/subfields | Tame non-Galois cubic; cyclic cubic; biquadratic; identity | Automorphism orders `1,3,4,1`; proper-subfield counts `0,0,3,0`. `1∣3`, but `1≠3`. | Pass. |
| §0.6 unramified orbit classification | Quadratic and quartic extensions of `ℚ₂` | `6+1=7`; over the unramified quadratic base, `6+8=14` ramified classes give `6+8/2=10` Frobenius orbits, hence `48+10+1=59`. | Pass for §0.6's orbit-of-classes formulation. |
| §0.6 automorphism stabilizer | `ℚ₂(ζ₁₂)`; moved quartic class | Orders `4=2·2` and `2=2·1`; orbit sizes `2/2=1` and `2/1=2`. | Pass. |
| §1.1 polynomial formula and monicity | `X²−2`; nonmonic `3X+6`; zero polynomial | Ramification polynomials `X²+2X`, `3X`, `0`; leading coefficients `1,3,0`. | Pass under monicity; wrong inputs excluded. |
| §1.1 root and coefficient conditions | `X⁴−2` | `ρ=X⁴+4X³+6X²+4X`; coefficient valuations `8,4,8,0`, constant term `0`. | Pass. |
| §1.2 uniformizer invariance | `ℚ₂(i)`, uniformizers `1+i` and `−1−i` | The sole nonidentity normalized difference has valuation `1` for both. | Pass. |
| §1.2 missing-total-ramification control | Unramified `ℚ₂(ζ₃)`, uniformizers `2,2ζ₃` | Raw K-embedding lists are `[-1]` and `[0]`; the transported invariant over the unramified part is `[]` for both. | Pass with repaired hypotheses. |
| §1.2 zero slopes and splitting ambient | `ℚ₅(∛5)` inside its splitting field; inside itself | Splitting ambient gives two zero differences, `3−5⁰=2`; nonsplitting ambient gives zero. | Pass: latter fails finite-Galois hypothesis. |
| §1.2 denominator and multiplicity | `X⁴+2X+2` | Single face has slope `−1/3`, length `3`, ram multiplicity `2`; `3∣2²−1=3`. | Pass. |
| §1.3 residual polynomial/additivity | Dyadic quadratic; tame cubic over `ℚ₅` | Wild `A=z+1`, `zA=z²+z` is additive in characteristic `2`; tame `A=z²+3z+3`, `zA=z³+3z²+3z` is not additive in characteristic `5`. | Pass; positive slope is essential. |
| §1.3 totalized residual arguments | `m=0`, nonintegral coefficient | Division fallback is total; nonintegral residues become `0`. Genuine segment hypothesis requires `m>0` and integrality follows from the supporting line. | Pass; no theorem claims these junk inputs are residual invariants. |
| §1.4 normalization transport | `X²⁵−5` over `ℚ₅`, tame-to-wild faces, `δ=2` in `𝔽₅` | Residuals `z⁵+1,z+1`, slope numerators `5,25`; forward factors `2⁻²⁵=3`, `3·2⁻²⁵=4`; shared endpoint `3=4·2²⁵`. Reversing gives endpoint values `4≠1`. | Pass with current order. |
| §1.4 associated inertia | Tame cubic over `ℚ₅`; wild dyadic faces | Tame residual discriminant is `−3≡2`, nonsquare mod `5`, giving inertia `2∣2`; `z+1` and `(z+1)²` give `1∣1`. | Pass. |
| §1.5 general-extension transport | Unramified quadratic; residue degree `3` with ramified quadratic top | Top degrees `1,2`; polygons have `0,1` wild segments, heights `0,1`. | Pass. |
| §2.0 non-Galois Herbrand definition | `ℚ₂(∜2)` and its `D₄` closure | `φ_(M/L)(3)=2`, `φ_(M/L)(7)=4`; direct closure lower parameters `3,7` differ. | Pass; exact Deligne locator remains unreadable. |
| §2.0 inverse/tower and derivative | Identity, unramified quadratic, tame cubic at `u=1` | `ψ(1)=1,1,3`; orbit counts/f are `1/1,2/2,3/1`. Identity compositions return the same values. | Pass. |
| §2.1 orbit-count function | `S₃`, reflection `H=C₂`; identity extension | Tame inertia `C₃` gives `[S₃:C₃H]=1`; trivial wild group gives `[S₃:H]=3`. For `H=G`, index stays `1`. | Pass without assuming H normal. |
| §2.2 positive breaks | Cyclotomic quartic; non-Galois quartic; tame cubic | Swan lists `[1,2]`, `[2,3]`, `[]`, cardinalities `2,2,0=w`. | Pass. |
| §2.2 multiplicity/Hasse–Arf | `S₄` quartic; abelian cyclotomic quartic | Orbit ratio `4` gives multiplicity `2` at `1/3`; abelian slopes `1,2` are integers. | Pass; no abelian conclusion asserted for S₄. |
| §2.3 discriminant integral | Identity, unramified quadratic, tame cubic, `∜2` | Integrals `0,0,2·1=2,3·3+2·1=11`, matching discriminant exponents. | Pass. |
| §2.4 slope polygon vertices | `∜2`, unramified quadratic, tame cubic | `(1,0),(2,3),(4,11)` give slopes `3,4`; `(1,0),(2,0)` gives `0`; `(1,0),(3,2)` gives `1`. | Pass. |
| §2.4 multiplicity from degree ratio | S₄ quartic | `(1,0)→(4,4)` has slope `4/3`; `log₂(4/1)=2`, agreeing with two visible slopes. | Pass. |
| §2.5 root-count/lower-break identity | `∜2` at rams `2,4`; tame cubic at positive parameter | Root counts including the identity are `4,2`, matching `2²,2¹`; tame case gives `1=5⁰`. | Pass. |
| §2.5 polygon-to-break transport | Cyclotomic quartic versus non-Galois quartic | Identity transport preserves `1,3`; subgroup transport takes `3,7` to `2,4`. | Pass; avoids equating two lower numberings. |
| §2.6 four dictionary identities | `ζ₈`, index `k=2` | `s₂=2·5/4−1/2=2`; `r₂=4(5/4−1/2)=3`; `m₂=1/2+3/4=5/4`. | Pass. |
| §2.6 differences/small/tiny rams | `ζ₈`, index `2` | `s₂−s₁=1=(3−1)/2`; small ram `3/4=5/4−1/2`; tiny ram `3/4=2−5/4`. | Pass. |
| §2.6 denominator theorem | S₄ quartic and a degree-two vertex step | `(2²−1)(1/3)=1=H`; quadratic upper step of `∜2` gives `(2−1)4=4`. | Pass. |
| §2.6 height/discriminant identity | Quartics `∜2`, `X⁴+2X²+2`, `X⁴+2X+2`; octic radical | `3+4·2=11`, `3+4·3/2=9`, `3+4·1/4=4`, `7+8·3=31`. | Pass. |
| §2.7 top slope | Identity, unramified quadratic, tame cubic, `∜2` | Top slopes `0,0,1,4`, matching the case split. | Pass here; boundary Check needs R03. |
| §3.1 slope content/degree | `D₄`, `S₄`, `S₃`, unramified `C₂` | Degrees `1·1·2³=8`, `3·2·2²=24`, `2·1·3=6`, `1·2·1=2`. | Pass; tame and unramified degrees are distinct. |
| §3.2 hidden multiset | `∜2`, `X⁴+2X²+2`, `∛3`, `ζ₈` | `[2,3,4]−[3,4]=[2]`; `[2,3,7/2]−[2,7/2]=[3]`; the latter two have empty differences. | Pass; non-Galois need not mean hidden slopes. |
| §3.3 weighted Galois mean | `D₄` examples | `7/8+(1+4+12)/8=3=24/8`; `7/8+(1+4+10)/8=11/4=22/8`. | Pass. |
| §3.3 tame/unramified equivalences | Tame cubic; unramified quadratic; wild quadratic | Means `2/3=1−1/3`, `0=1−1/1`, `1>0`. | Pass in both directions on these cases. |
| §3.3 S₃/S₄ normalization | `∛3`; S₄ quartic | `5/6+(2/3)(3/2)=11/6`; `11/12+(1/3)(1/4+1/2)=7/6`. | Pass; unramified degree cancels. |
| §3.4 automorphism normalizer | `S₃,H=C₂`; `C₂²,H=1` | Normalizer quotient orders `2/2=1`, `4/1=4`; closure degrees `6,4`. | Pass. |
| §3.5 splitting models | `X²−2` at 2; `X³−5` at 5; `X³−7` at 7 | Local/global splitting-group orders `(2,2),(6,6),(3,6)`; criterion true,true,false. | Pass; knowl wording unavailable. |
| §3.6 label prefix | Unramified quadratic, tame cubic, radical quartic | `(2,2,1,0)`, `(5,1,3,2)`, `(2,1,4,11)`; upper bound in the last case `3+4·2=11`. | Pass. |
| §4.1 auxiliary versus invariant indices | `X⁴−2`, `X²−2`, tame cubic | Auxiliary `[∞,∞,0]` regularizes to `[8,4,0]`; `[∞,0]` to `[2,0]`; tame list `[0]`. | Pass. |
| §4.1 equal characteristic/separability | `X²+tᵐX+t`, `X²+t` over `𝔽₂((t))` | Indices `[2m−1,0]` versus `[∞,0]`; derivative valuations `2m` versus infinity. | Pass; second polynomial excluded from finite separable assertions. |
| §4.1 index/polygon relation | `X⁴+2X+2` | Indices `[1,1,0]`; envelope height at `2` is `2/3<1`. Last index is `0`; out-of-range total index is infinity. | Pass; indices need not be vertices. |
| §4.2 Miki product/order | `ℚ₂(√2)`, unit `−1` | `(1+√2)²(−3+2√2)=−1`; levels `1,3`, weighted levels `2<3`. | Pass. |
| §4.2 cancellation negative control | Quartic unit example in README | Both products equal `−1`; weighted levels are `4<5` versus `4,14,5`. | Pass: second tuple fails ordering. |
| §4.2 highest root/non-power condition | `ℚ₂(i)` | Highest root `i` has level `1`, depth `0`; `−1=i²`, so its non-square hypothesis is false. | Pass. |
| §4.2 jump-set conversion | `p=2,e=2`, sets `{1,2}` and `{1,3}` | `ρ(1)=2,ρ(2)=4,ρ(3)=5`; pair data `({1},2)` and `({1,3},(2,1))`; `ρ²(1)=4<5=ρ(3)`. | Pass. |
| §4.2 absence of jump set | `ℚ₃(∛3)` | Degree `3` cannot contain the degree-two cyclotomic extension; number of primitive cube roots is `0`. | Pass; filtered classification is used in the nontrivial μp case. |
| §5.1 Ore realizability | `ℚ₂,n=4`; `n=1`; `n=0` | Admissible `j={1,3,5,6,7,8}`; for `n=1` only `j=0`; `n=0` violates the theorem hypothesis. | Pass. |
| §5.1 equal-characteristic Ore | `𝔽₂((t)),n=2` | `v_K(2)=∞`; `j=2m−1` is admissible for each `m≥1`, whereas positive even j fails the b=0 condition. | Pass. |
| §5.2 box and derivative | Dyadic quadratics `j=1,2` | At `j=1`, linear coefficient depth is `1` with exact valuation; at `j=2`, depth is `2`. Nonadmissible quartic `j=2` has empty box. | Pass. |
| §5.3 refined count | `ℚ₂,n=2`; `ℚ₃,n=3` | Counts `(2,4)` at `(1,2)` and `(6,6,9)` at `(1,2,3)`; totals `6,21`; embedded masses `2,3`. | Pass. |
| §5.3 quartic/octic/nonic counts | `(p,n)=(2,4),(2,8),(3,9)` | Counts sum to `92,5880,5085`; weighted embedded sums are `4,8,9`. | Pass; exact rational arithmetic recomputed. |
| §5.3 base dependence | `ℚ₂(√2)`, unramified quadratic `ℚ₂`-extension | First: `(j,count)=(1,2),(3,4),(4,8)`; second: `(1,6),(2,8)`; both totals `14`. | Pass; discriminant strata differ. |
| §5.4 finite versus infinite total | `ℚ₂,n=2`; `𝔽₂((t)),n=2`; `𝔽₃((t)),n=2` | Totals `6,∞,2`; equal-characteristic wild partial totals `2+4+8=14` keep growing. | Pass. |
| §6.1 invariant round trips | `ζ₈`; tame cubic | Swan `[1,2]` → rams `[1,3]` → means `[1/2,5/4]` → Swan `[1,2]`; empty lists reconstruct tame discriminant `2`. | Pass algebraically. |
| §6.2 compatibility | `ℚ₂` quadratic rams `1,2,3`; ramified quadratic base | At base index `1`, `1<2`, `2=2`, `3>2`: accept,accept,reject; at index `2`, ram `3<4` is accepted. | Pass in mixed characteristic; extend as R05. |
| §6.3 family membership | Dyadic quadratic families | `[1]` has `2` classes, `[2]` has `4`; discriminants `2` and `3` separate the families. | Pass. |
| §6.3 relative-to-absolute families | `e=f=2` over `ℚ₂` | Relative families have `6+8=14` classes and two fixed family-orbits; class-orbits number `6+8/2=10`. | R02: orbit the classes within each family. |
| §6.4 diagram/count | `ℚ₂`, Swan `[1]` and `[2]` | `(α,β,γ,δ)=(1,0,1,0),(0,1,1,0)`; full polynomial counts `2,4`; mass values `1,2`. | Pass for these cases. |
| §6.4 scope of generic construction | `w=0`; `𝔽₂((t))` | Tame cubic needs `X³−5`; identity needs degree-one polynomial. Neither satisfies `w≥1`; finite `e_K` is unavailable in characteristic two. | R05. |
| §6.5 full versus reduced fibres | `q=4`, Swan `[1]` | Full polynomial count `12`, class count `6`, full fibre `2`; ambiguity/Aut `2/2=1`; reduced fibre `1`. | R01. |
| §6.5 relative/absolute masses | `ℚ₂`, `e=2,f=2` | Over unramified quadratic base, `14/2=7`; over base, `6/4+4/2=7/2`; multiplying by `f=2` gives `7`. | Pass. |
| §6.5 Serre comparison | Dyadic quadratic families | `1·2⁻¹+2·2⁻²=1`; using discriminant instead of height would give `1/2`. | Pass in stated mixed-characteristic examples. |
| §6.6 packet definition | Dyadic quadratic pair; quartics of R09 | Quadratic pair has equal residual class, group `C₂`, `(e,f)=(2,1)`, hidden list `[]`; quartic groups `D₄≠C₄`, gms `3≠11/4`. | Definition separates quartics; add R09 Check. |
| §6.7 sigma/delta arithmetic | `p=2,N=1,s=0`; `p=2,N=2,s=1` | Sigma `1` and `1+2(2−1)=3`; delta at `(s,i)=(0,0),(1,0),(1,1),(0,1)` is `1,1,2,0` for `N=1`. | Pass; impossible i>s contributes zero. |
| §6.7 class-count headline | Quadratics over `ℚ₂` and its unramified quadratic extension | Summands `1+3+2=6` and `3+7+4=14`. | Pass; actual cyclotomic invariants are used. |
| §6.7 other Monge values | `(p,e,f)=(2,4,1),(2,8,1),(3,9,1),(2,2,2),(7,7,1)` | Counts `48,1544,753,10,49`; degree-seven total is `49+1=50`. | Pass. |
| §6.7 representative predicate | `e=f=1`; empty set; conjugate duplicates | Base representative count `1`; empty coverage false; two equivalent embedded fields give `2` witnesses rather than `∃!`. | Pass. |
| §6.8 completeness iff mass one | Six dyadic quadratics; one omitted | Complete sum `2/4+4/8=1`; omissions give `3/4` or `7/8`. | Sound mathematics, missing acceptance theorem R06. |
| §6.8 equal-characteristic completeness | First M quadratic height strata over `𝔽₂((t))` | Mass `Σₘ₌₁ᴹ2⁻ᵐ=1−2⁻ᴹ`; for M=1,2,3: `1/2,3/4,7/8`; coverage false each time. | Pass in both directions. |
| §7.1 normal closure and GRD | `ℚ`, `ℚ(√5)`, `ℚ(∜2)` | Closure `(degree,abs discr)=(1,1),(2,5),(8,2²⁴)`; GRD `1,√5,8`; last ordinary RD `2^(11/4)<8`. | Pass. |
| §7.2 local exponents and support | `ℚ(√5)` at `5,2`; `ℚ` at junk index `1` | Exponents `1/2,0`; at `1`, valuation returns `0` although `1∣disc ℚ`. | Pass with prime binder in support theorem. |
| §7.2 local/global cancellation | Cubic discriminant `−23`; cyclotomic degree four | At `23`, global `3/6=1/2` equals local `1−1/2`; at `5`, `3/4=1−1/4`. | Pass. |
| §7.3 product formula/bound | `ℚ`, `ℚ(∜2)`, `ℚ(ζ₅)` | Empty product `1`; `2³=8`; `5^(3/4)=125^(1/4)`; bound factors `1`, `2⁴`, `5¹` dominate. | Pass; strictness needs nonempty support. |
| Boundary Eisenstein tests | `X²+4X+2`, `X²+2X+4`, `X²+X+2` | Constant valuations `1,2,1`; linear valuations `2,1,0`; verdicts true,false,false. | Pass. |
| Boundary tame top slope | Unramified quadratic and tame cubic | Actual slopes `0,1`; blanket Check predicts `1,1`. | R03. |

The ten worked-example rows were also recomputed through the coefficient/dictionary formulas. The numerical record is:

| Polynomial/field | H; means | Rams; visible Artin | Indices | Closure mean when specified |
|---|---|---|---|---|
| `X²+2X+2` | `1; [1/2]` | `[1]; [2]` | `[1,0]` | `2/2=1` |
| `X²−2` | `2; [1]` | `[2]; [3]` | `[2,0]` | `3/2` |
| `(X+1)⁴+1` | `5; [1/2,5/4]` | `[1,3]; [2,3]` | `[5,2,0]` | `8/4=2` |
| `X⁴−2` | `8; [1,2]` | `[2,4]; [3,4]` | `[8,4,0]` | `24/8=3` |
| `X⁴+2X²+2` | `6; [1/2,3/2]` | `[1,4]; [2,7/2]` | `[6,2,0]` | `22/8=11/4` |
| `X⁴+2X+2` | `1; [1/6,1/4]` | `[1/3,1/3]; [4/3,4/3]` | `[1,1,0]` | `28/24=7/6` |
| `X³−3` | `3; [1]` | `[3/2]; [5/2]` | `[3,0]` | `11/6` |
| `X³+3X+3` | `1; [1/3]` | `[1/2]; [3/2]` | `[1,0]` | `7/6` |
| `X³−5` over `ℚ₅` | `0; []` | `[]; []` | `[0]` | `4/6=2/3` |
| `X⁸−2` | `24; [1,2,3]` | `[2,4,8]; [3,4,5]` | `[24,16,8,0]` | No closure mean is asserted in the row. |

### Source sample, versions and locators

Ten primary works and nine knowls were legally readable through the source service. The 15 sampled targets were all attempted; the table deliberately distinguishes source verification from independent computation. No source text was copied into the roadmap or this report.

| Sampled target | Text opened and exact locator | Finding from comparison |
|---|---|---|
| §0.3 height and mean | `lf-heights` could not be read. Pinned `discriminantExponent_eq_inertiaDegree_mul_differentExponent` and the tame lower bound were opened. | Formula and divisions agree with the pin; knowl attribution is not certified. |
| §1.4 residual classes/inertia | Pauli–Sinclair arXiv:1504.06671v1, Lemma 4.7/Theorem 4.8, p.14 (`pauli-sinclair line 1078`, line 1086); Greve–Pauli author preprint Proposition 4.3, pp.5–6 (`greve-pauli line 227`), and Theorem 7.4, pp.13–14 (`greve-pauli line 658`); `lf-residual_polynomials line 116`, `lf-associated_inertia line 90`. | The recurrence must be reversed when the face ordering is reversed. Current forward recurrence is consistent. Associated inertia is read in the splitting residue field; the tame cubic gives `2`. |
| §2.0 non-Galois Herbrand | Deligne Appendix A.6 not available; finite Galois definitions and tower/subgroup declarations at the pin were opened. | Source locator unverified. Construction has an independent common-overfield route; no unsupported supplier Layer 4a remains. |
| §2.2 upper/lower breaks | `lf-slopes line 90`, line 108; `lf-slope_content line 95`; Deligne unavailable. | Knowls support the conventions and refer non-Galois theory to Deligne; they do not replace checking his exact propositions. |
| §2.6 dictionary | `lf-herbrand_invariant`, `lf-rams`, `lf-means` unavailable. | Arithmetic identities and examples recomputed above; exact knowl text not certified. |
| §2.7 top slope | `lf-top_slope` unavailable. | Case split independently checked; contradiction in boundary Check is R03. |
| §3.1 slope content | `lf-slope_content line 95`–109; Jones–Roberts arXiv:math/0309309v1 §3.5, pp.7–8 (`jones-roberts-database line 291`). | Right-limit union, multiplicities, tame quotient and unramified quotient match the knowl. |
| §3.2 hidden slopes | `lf-hidden_slopes line 90`–98; `lf-visible_slopes line 94`; Jones–Roberts §3.6, p.8 (`jones-roberts-database line 352`). | Multiset subtraction matches. The older paper's stronger no-hidden-slopes equivalence is false; it was not copied into this theorem. |
| §3.5 splitting models | `lf-galois_splitting_model` unavailable. | Local/global group comparison checked on the three polynomial examples and the decomposition-group supplier; the precise knowl is unverified. |
| §5.3 Krasner count | Pauli–Roblot author preprint Theorem 6.1, p.7 (`pauli-roblot line 335`), with Proposition 3.1, p.3 (`pauli-roblot line 113`). | Matches the mixed-characteristic formula. Equal-characteristic coverage is the roadmap's box/root-integral argument, not a claim that the p-adic source states that generalization. Krasner's original text remains unavailable. |
| §6.4 diagram/generic polynomial | Monge arXiv:1109.4617v2 Theorem 1, p.11 (`monge-family line 509`); Pauli–Sinclair Theorem 6.3, p.21 (`pauli-sinclair line 1444`). Diagram knowl unavailable. | Coverage of reduced sets verified; full-residue and reduced sets must be separated, R01. Broader diagram attribution needs R08. |
| §6.7 Monge count | Monge arXiv:1011.0357v3 Theorem 1, p.4 (`monge-count line 208`); equations (6), (7), pp.3–4 (`monge-count line 158`, line 193). | Full base degree, residue degree and cyclotomic e/f dependence match. Numerical specializations agree. Supplier correction R04 remains. |
| §6.8 mass completeness | Main MassFormula Layer 4, Theorem 2 at README line 371 and finiteness dichotomy at 356; original Serre note not obtained. | Positivity argument applies in both characteristics. Pinned carriers permit the omitted acceptance signature, R06. |
| §7.1 Galois root discriminant | Jones–Roberts author text, §2, pp.3–4 (`jones-roberts-grd line 116`, line 120); knowl unavailable. | Definition and tower monotonicity agree. |
| §7.2 local mean slopes | Same §2 (`jones-roberts-grd line 124`–172), and `lf-galois_mean_slope line 90`. | Local product factors, wild weights and tame exponent agree; for several primes of F, the compositum in §7.2 is necessary. |

Additional primary checks: Heiermann's MPIM preprint Definition 3.13, Lemma 3.16, Proposition 3.17, pp.12–13, and Theorem 7.1, p.37 (`heiermann line 423`, `heiermann line 449`, `heiermann line 460`, `heiermann line 1261`); Miki Lemma 17, pp.111–112, with its reference to Lemma 5, p.101 (`miki-1981 line 137`, `miki-1981 line 524`), and highest-root invariant on p.112 (`miki-1981 line 572`); Pagano arXiv:1810.09975v1 §1.2, pp.3–4 and Theorems 1.4–1.5, p.6 (`pagano line 108`, `pagano line 219`, `pagano line 245`). Miki's order and non-power hypothesis and Pagano's nontrivial p-th roots of unity hypothesis were checked, not inferred from theorem names.

### Pinned APIs, ownership and supplier order

Opened definitions and theorem signatures include the following. Paths are library-relative at the manifest pins. These are the declarations that matter to the generality, normalization, source and duplication decisions; the automatic name scan was also used as a lead, never as proof of a missing declaration.

| Pin and locator | What was verified |
|---|---|
| `Mathlib/RingTheory/Polynomial/Eisenstein/Basic.lean:56`, `:231` | `IsEisensteinAt` requires a leading coefficient outside the ideal, not monicity. The irreducibility theorem has primality/primitivity hypotheses. |
| `Mathlib/NumberTheory/LocalField/Basic.lean:45` | `IsNonarchimedeanLocalField` carries valuative topology, local compactness and nontrivial valuation; it is not a bare arbitrary-topology field. |
| `Mathlib/FieldTheory/Minpoly/Field.lean:250`; `Mathlib/FieldTheory/Galois/Basic.lean:208`, `:227` | Finite algebra-hom enumeration, fixed field and fixing subgroup support actual field embeddings and subgroup data. |
| `Mathlib/FieldTheory/Normal/Closure.lean:155`, `:173` | Normal closure uses the given algebra tower; finiteness follows with finite dimension. |
| `Mathlib/Analysis/Normed/Field/Krasner.lean:56`, `:73` | Krasner's predicate and complete-normal extension theorem, rather than a theorem counting fields. |
| `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:77`, `:80`, `:83` | Root discriminant uses absolute discriminant and reciprocal degree; the rational field value is one. |
| `Mathlib/Data/Multiset/Count.lean:195`; `Mathlib/GroupTheory/Index.lean:55`, `:293` | Multiset comparison is multiplicitywise; subgroup index is a natural cardinal and the finite card/index product gives the orbit calculations. |
| `Mathlib/MeasureTheory/Measure/Haar/Basic.lean:579` | `addHaar` is generated by `to_additive` from `haar`; absence from a literal declaration grep is not missing API. |
| `TauCeti/NumberTheory/LocalField/NormalizedValuation.lean:114`, `:123`; `NatCastValuation.lean:96` | Uniformizer-positive additive normalization; natural-cast valuation explicitly needs a nonzero cast. |
| `TauCeti/NumberTheory/LocalField/AbsoluteRamificationIndex.lean:63`, `:91`, `:110` | The base index is a finite-p-adic-extension construction, which causes R05. |
| `TauCeti/NumberTheory/LocalField/InertiaDegree.lean:71`, `:84`, `:101`; `RamificationIndex.lean:150`, `:176` | Actual residue dimension, residue cardinality, `ef=n` and tame criterion. |
| `TauCeti/NumberTheory/LocalField/FiniteExtension/IntermediateField.lean:71`, `:77`, `:99`, `:128` | Canonical finite-intermediate-field valuation/topology/local-field adapters; compatible ambient restriction is an instance. No topology on the whole separable closure is needed for the finite-carrier count. |
| `TauCeti/NumberTheory/LocalField/Unramified/Factorization.lean:82`, `:124`, `:144`, `:187` | Canonical unramified/totally ramified factorization and its uniqueness/transport are supplied, not new work here. |
| `TauCeti/NumberTheory/LocalField/Eisenstein/TotallyRamified.lean:116`, `:160`; `Eisenstein/PowerBasis.lean:123`, `:148` | Eisenstein uniformizers and coefficient valuation separation are available on the compatible local-field tower. |
| `TauCeti/NumberTheory/LocalField/Discriminant/Basic.lean:137`, `:157`, `:180`, `:198`, `:215`, `:251` | Discriminant exponent, `c=f·d`, lower bound, tame/unramified equality criteria, isomorphism invariance. |
| `TauCeti/NumberTheory/LocalField/Different/Wild.lean:61`, `:90`; `Different/Tower.lean:46`; `Different/Hilbert.lean:91` | Wild upper bound needs nonzero ramification-index cast; tower and Hilbert formulas supply §2.3. |
| `TauCeti/NumberTheory/LocalField/Herbrand/Basic.lean:247`, `:254`, `:258`, `:417`; `Herbrand/Tower.lean:199`, `:216` | Native inverse Herbrand functions and upper groups require the finite Galois setting; no native non-Galois function is silently imported. |
| `TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.lean:98`, `:129`, `:155`, `:234`; `LowerIndex.lean:140` | Quotient/subgroup compatibility and jump transport exist. The normal lower-index sum does not itself assert the non-normal extension in §2.5. |
| `TauCeti/NumberTheory/LocalField/Herbrand/HasseArf.lean:48`, `:137` | The cited pinned theorems are prime-degree statements; the full abelian target is explicitly supplied by the completed roadmap. |

Object searches covered main roadmaps, the supplied open-head index through `roadmaps grep`, the board's package READMEs/plans, and the pinned local-field/number-theory sources. They found no competing owner for the non-Galois construction, field families, refined count or Monge class count. There is no other declaration under this roadmap's namespace in the available roadmap Lean files. The important related owners were resolved as follows:

| Supplier/related work | Resolved location and boundary |
|---|---|
| LocalFieldsRamification on main | `Completed/LocalFieldsRamification/README.md:72`, `:281`, `:576`, `:724`, `:1022`, `:1154`: finite local fields, principal units, unramified extensions, finite Galois ramification, abelian Hasse–Arf, tame absolute quotient. The non-Galois extension is now §2.0 here, not a claimed main Layer 4a. |
| NewtonPolygons on main | `TauCetiRoadmap/NewtonPolygons/README.md:211`, `:320`, `:512`, `:667`, `:870`, `:892`: envelopes, finite slope data, coefficient polygons, nonzero-root slopes, denominator divisibility and ramification consequences. Orientation agrees after the explicitly stated reflection. These are roadmap contracts, not currently pinned Lean declarations. |
| MassFormula on main | `TauCetiRoadmap/MassFormula/README.md:84`, `:226`, `:356`, `:367`, `:371`: representative sets, root integral, finiteness dichotomy, orbit count and Theorem 2. Its scope leaves discriminant-refined counts to separate work. |
| NumberFieldArithmetic on main | `Completed/NumberFieldArithmetic/README.md:1123`, `:1302`, `:1336`, `:1393`, `:1493`, `:1714`, `:1798`, `:1873`: discriminant tower, completions, semilocal structure, decomposition groups and discriminant exponents. The global assembly here adds the Galois-closure invariant, not those foundational constructions. |
| ClassFieldTheory on main | Layers 6–7 at lines 1220 and 1312 supply reciprocity. Classification/existence is Layer 8 at 1433: R04. An open revision of this existing roadmap was not substituted for main. |
| ComputationalNumberTheory at supplied open head | `TauCetiRoadmap/ComputationalNumberTheory/README.md`, §§2.19–2.19a: generic φ-side residual data and product/factorization theory. Here the residue formula is specialized to the ramification polynomial and its root uniformizer; the new assertions are wild additivity and uniformizer-change orbits, including equal characteristic. No generic φ-expansion or Ore–Montes algorithm is planned again. |
| ClassicalArithmeticCompletion / LocalGaloisGroups | Referenced only as ownership exclusions: polynomial infrastructure / absolute pro-p structure. No theorem here consumes a later revision of either. |

The prescribed mechanical check returned exactly:

```text
depcheck: 204 roadmaps, 1545 edges, 0 problem(s)
```

There was no `UPWARD`, `CYCLE` or `moved:` line. Every Needs line and supplier paragraph was read; the semantic class-field gap R04 is not something that this roadmap-level graph check can detect. No declared gaps were supplied in a plan, and none were invented for this review.

### Lean acceptance, headline coverage and gate

The worker's push gate passed every listed scanner, dependency check and targeted build. A separate direct elaboration of `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean` succeeded with exactly 12 `sorry` warnings and no other diagnostic. A scratch file checked `#check @name` for all 37 declarations and elaborated successfully. No PR file was edited; the diff outside this roadmap is empty.

The six reported binder-loss leads are harmless for the raw definitions as explicitly scoped in README lines 236–245: `wildExponent`, `ramificationPolynomial`, `conjugateBreaks`, `residualPolynomial`, `embeddingSubgroup`, and `indexOfInseparability`. The stronger invariant theorems retain the compatible valuation, generation and splitting assumptions they need. For example, the embedding subgroup is algebraic and needs no topology; the invariance theorem for conjugate breaks explicitly retains total ramification and a finite Galois ambient field. No hypothesis repair was needed in these signatures.

| Headline from the README | Acceptance coverage |
|---|---|
| Uniformizer-independent ramification/root data (§1.2) | `conjugateBreaks_eq_of_irreducible` and the splitting-field root-count theorem are stated. |
| Wild residual additivity (§1.3) | `residualPolynomial_additive` on genuine supporting segments is stated. |
| Non-Galois/polygon-to-break/slope-polygon comparison (§§2.0, 2.4–2.6) | Polygon-dependent comparisons are named in the module docstring as lacking the native polygon/slope carriers. The purely field/group integral is stated. |
| Discriminant integral (§2.3) | `discriminantExponent_eq_integral` is stated on the actual tower. |
| Galois slope-content/weighted mean (§§3.1–3.3) | Named as unavailable through the intrinsic slope carrier. |
| Inseparability-index invariance (§4.1) | `indexOfInseparability_eq_of_eisenstein` is stated. |
| Ordered decomposition and jump-set classification (§4.2) | Miki theorem stated; filtered presentation/classification limitation named in docstring. |
| Ore realization and refined Krasner count (§§5.1, 5.3) | Both count actual finite subextensions in either characteristic. |
| Generic-family existence and family mass (§§6.4–6.5) | Named as unavailable through the intrinsic Herbrand invariant and diagram. |
| General-base Monge class count (§6.7) | `monge_class_count` states existence and the cardinality of every representative set. |
| Mass completeness (§6.8) | Missing despite successful full-generality signature probe: R06. |
| Galois root-discriminant comparison, support and product (§§7.1–7.3) | All three are stated on number fields and actual normal closures. |

Each of the 12 admitted theorems was tried on a copy with `rfl`, `simp` and `infer_instance` as one-tactic alternatives. None closed. Reading the pinned inputs found no single library lemma that proves one of these complete conclusions: they assemble new root/field/count/closure statements. No padding finding is made against this head. The file has a real body for every definition, no admitted data, no `set_option`, one `import Mathlib`, and only the individual Tau Ceti imports used by its signatures.

## Not verifiable

These are source-access limitations, not assertions that the mathematical claims are false. The full review was completed without parking it. The existing missing-source requests were preserved except for texts subsequently obtained legally.

- **Deligne, Appendix A.6, Propositions A.6.1–A.6.2:** the sources-service bibliographic search did not obtain a legal readable copy. Exact numbering, page and proof-level non-Galois hypotheses remain unverified. The finite-Galois inputs and the displayed non-Galois construction were reviewed independently.
- **Krasner 1966, pp.143–169:** original text not obtained through the legal lookup. Pauli–Roblot's explicit theorem was read and checked instead; this does not certify a precise locator in Krasner.
- **Serre 1978 mass note, pp.1031–1036:** original text not obtained. Main MassFormula's exact supplier contract was read, including its equal-characteristic scope and convergent sum.
- **Fried 1974, pp.225–258:** the service located the publisher/DOI page but did not obtain readable article text. The historical attribution was not certified; the numerical inseparability definitions were checked against Heiermann and the readable knowl.
- **Fifteen LMFDB knowls:** the service returned CAPTCHA pages, without mathematical text, for `lf.eisenstein_diagram`, `lf.family_ambiguity`, `lf.family_invariants`, `lf.family_mass`, `lf.family_polynomial`, `lf.galois_splitting_model`, `lf.heights`, `lf.herbrand_invariant`, `lf.jump_set`, `lf.means`, `lf.packet`, `lf.rams`, `lf.subfamily`, `lf.top_slope`, and `nf.galois_root_discriminant`. Each was requested at its official `knowledge/show` locator. They are individually recorded in the missing-source list. The other nine knowls were readable and are not included in this limitation.
- **Serre, Local Fields, and Ore 1928:** legal lookup supplied paywalled/uncertified locators rather than full text. No paywall was bypassed and no new missing-source request was created for these settled locator-only citations. In particular, the detailed non-normal adaptation attributed to Serre in §2.5 was not checked against his proof text.

## Source issues

- **Misprint** in pauli-sinclair at §1, arXiv:1504.06671v1, printed p.2: the source says the zeroth residue digits of the intermediate Eisenstein coefficients are positive; it should be zero; affects a stated result.
- **Misprint** in greve-pauli at Lemma 4.4, author preprint, printed p.6: the source says the compositum N is TK; it should be TL; affects a stated result.
- **Error** in jones-roberts-database at §3.6, equation (2), arXiv:math/0309309v1, printed p.8: the source says the tame term uses the order of G/I; it should be the order of I/Iw; affects a stated result.
- **Error** in jones-roberts-database at §3.6, paragraph after equation (2), arXiv:math/0309309v1, printed p.8: the source says absence of hidden slopes characterizes equality of field and Galois root discriminants; it should be unramifiedness of the closure over the field; affects a stated result.
