# Review of BelyiMaps (pull request #1791 at fcad6f1)

**Verdict:** needs changes

**What this head is.** `TauCetiRoadmap/BelyiMaps/` is an existing roadmap on main. This pull request changes 13 lines of its README (the "Eight roadmaps" count, a new "Maps on surfaces" paragraph in §Boundaries citing SurfaceTopology, and the Layer 2 bullet under "What this roadmap supplies") and nothing in `Suggested.lean`. The folder at this head is byte-identical to the folder the previous review read (pull request #271 at 9bd6e07), so none of the previous findings is repaired; they are carried below as R04–R38 with the line numbers of this head, each re-verified. R01–R03 are on the lines this pull request adds. Three of the carried findings are on lines this pull request touches or that its new paragraph contradicts (R07, R23, R36); the other thirty-two are inherited from main's text, and whether a cross-reference pull request must repair them or leave them to the open rewrite of the same folder (#767 by kim-em, which restates Layers 0–7 on Tau Ceti's declarations) is a human's decision. The verdict is forced regardless: the gate fails, and R01 is on the new lines.

**Gate** (worker, this head): `set_option=2 tex=1 prnum=4 sorry-data=10 residue=5 outside-folder=1 build=1 FAIL`. Every nonzero category has a finding (R15, R19, R33–R37).

**Dependency check** (required command, `--movable`):

```text
depcheck: 204 roadmaps, 1653 edges, 0 problem(s)
```

No UPWARD or CYCLE line. A scratch copy with `*Needs:* SurfaceTopology Layer 2, SurfaceTopology Layer 3` appended to the new paragraph also prints 0 problems (SurfaceTopology is neither on main nor in the merge order, so the tool has no position for it); a second copy naming ModularForms, AlgebraicCurves, CharacterTheory, AlgebraicTopology, PeripheralActions, ProfiniteArithmetic and FuchsianOrbifolds in a Needs line prints 0 problems (all on main). The roadmap-level cycle of R05 is between two on-main roadmaps and is invisible to the tool.

## R01 (P2) — The new paragraph gives the analytic comparison's compact-surface carrier a second owner

Location: `TauCetiRoadmap/BelyiMaps/README.md:181`: "The compact-surface carriers that the analytic comparison waits for are SurfaceTopology's realization."

Claim: Layers 8–9 wait for SurfaceTopology's `GMap2.realization`.

Witness: The next paragraph (:184–:189) and the supply table (:554) say the carrier is ModularForms Layer 10B's compact Riemann surface; Layer 8.1 (:2585–:2596) pins it as the unbundled `IsManifold 𝓘(ℂ) ω X` stack. SurfaceTopology at #271 (its Layer 3) realizes a generalized map as a `ChartedSpace (EuclideanHalfSpace 2)`: a topological surface with no complex structure, which the analytic comparison (8.5–8.6, 9.2–9.8) needs. Conversely SurfaceTopology's downstream table promises BelyiMaps "realization, classification by genus, Euler's formula and Riemann–Hurwitz, rotation systems" from its layers 2, 3, 5, 8, and no BelyiMaps layer consumes any of them: 7.2 builds `FilledCover` itself, 8.6 takes Riemann–Hurwitz from ModularForms 10B(v), 8.7 owns the rotations. The two contracts name each other and match on nothing.

Repair: Delete the sentence. State what is actually consumed: SurfaceTopology layer 2's conversions `PermutationTriple ↔ CombinatorialMap` and the agreement of Euler characteristic and connectedness (already in the paragraph), consumed nowhere in Layers 5–14 or by a named layer if one uses them; and record in Scope that the comparison of 7.2's `FilledCover` with the realization of the triple's generalized map is SurfaceTopology's target, not this roadmap's. Keep ModularForms 10B as the single owner of the Riemann-surface carrier. The author of #271 should drop the four unconsumed items from SurfaceTopology's downstream row or point them at an actual Belyi layer.

## R02 (P3) — The supplier count on the edited line is wrong

Location: `TauCetiRoadmap/BelyiMaps/README.md:109`: "Eight roadmaps supply material to this one."

Claim: Eight suppliers.

Witness: The section names CharacterTheory, UniversalCovers, AlgebraicTopology, ConformalMapping, SurfaceTopology, ModularForms, AlgebraicCurves, PolynomialGaloisGroups, ProfiniteProPGroups, ProfiniteArithmetic and PeripheralActions (13.3): eleven. The previous "Seven" was already short by three.

Repair: Replace the number by the list, or drop the count.

## R03 (P3) — Dead link and merge-order condition on the new citation

Location: `TauCetiRoadmap/BelyiMaps/README.md:172`, :235: `[SurfaceTopology](../SurfaceTopology/README.md)`.

Claim: The link resolves.

Witness: `TauCetiRoadmap/SurfaceTopology/` does not exist on main (929496d); it is added by #271. The pull request description says to merge after #271; nothing in the README records that condition.

Repair: Cite "SurfaceTopology, Layer 2" by name as the house style asks (a roadmap still in a pull request is cited by name and section), and keep the relative link only once #271 is on main.

## R04 (P1) — The declared owners of Layers 7–14 do not exist

Location: `README.md:74`–:76: "successor roadmap **`BelyiAnalyticCovers`**", `BelyiAlgebraicAndDescent`, `BelyiArithmeticActions`.

Claim: Three successor roadmaps own the excluded end theorems.

Witness: `roadmaps grep 'BelyiAnalyticCovers|BelyiAlgebraicAndDescent|BelyiArithmeticActions'` over main and 440 open pull requests finds no folder; the only hits are NoncongruenceModularForms (#1709) citing them as suppliers. No supplier gap is declared (no `design/plan.json`).

Repair: Own the targets here (the README already states them as Layers 7–14) or give each a real "BelyiMaps, Part II" owner with one-way contracts; delete the "activated once" conditions.

## R05 (P1) — PeripheralActions and BelyiMaps supply each other

Location: `README.md:118`–:122: "`PeripheralActions` consumes from here only the conjugation-transfer lemma … so there is no cycle"; :4361, :4385 consume `PeripheralActions` Layer 2.

Witness: `Completed/PeripheralActions/README.md:103`–:104 and :170–:174 ("From `TauCetiRoadmap.BelyiMaps`: `conjugation_transfer`, `opposite_third_peripheral`"). Different layers do not break a roadmap-level cycle; the depcheck does not see it because both are on main.

Repair: Move the two word identities to a generic on-main owner (a shared `TauCeti/GroupTheory/` module, as :488 already proposes) and cite it from both; the only remaining edge is PeripheralActions → BelyiMaps.

## R06 (P1) — Disjoint-union monodromy is not the product

Location: `README.md:712`–:713: "monodromy the product acting componentwise".

Witness (computed): two copies of `((0 1), 1, (0 1))` give generators `(0 1)(2 3)` and `1`; the group generated has order 2, the product `C₂ × C₂` has order 4.

Repair: The monodromy of a disjoint sum is the image of the common free group in the product, generated by the paired generators, with surjective projections; keep the additivity of `χ` and the cycle-data concatenation.

## R07 (P1) — The spherical classification omits valid parameter triples

Location: `README.md:1427`–:1428: "the parameter triples are exactly `(1, m, m)`, `(2, 2, m)`, `(2, 3, 3)`, `(2, 3, 4)`, `(2, 3, 5)`".

Witness (computed): `(1, 2, 3)` has `χᵒʳᵇ = 5/6 > 0`; the relator `x¹` kills `x`, then `y = z⁻¹` with `y² = y³ = 1`, so the group is trivial, not of order `2/χᵒʳᵇ = 12/5`. Every `(1, b, c)` with `b ≠ c` is missing (ten of them with `c ≤ 11`). Tau Ceti's `IsSphericalParameterSignature` (`GroupTheory/TriangleGroup/Signatures.lean:206`) already separates parameter signatures from exact ones.

Repair: List all `(1, b, c)` with group `C_{gcd(b,c)}`, and state `|Γ| = 2/χᵒʳᵇ` only for exact-order signatures; cite the pinned declarations.

## R08 (P1) — The elliptic criterion in the hyperbolic argument is false, and `(0,0,0)` divides by zero

Location: `README.md:1528`: "an element of `SL(2,ℝ)` with trace `2cos θ` and `|θ| < π` is conjugate to a rotation by `2θ`".

Witness (computed): `[[1,1],[0,1]]` has determinant 1 and trace `2 = 2cos 0` and is not conjugate to the identity; its cube is `[[1,3],[0,1]]`. At `(a,b,c) = (0,0,0)` the formulas use `sin(π/0)`.

Repair: Use distinct eigenvalues `e^{±iθ}` with `0 < θ < π` (then `A` is conjugate to the rotation and `A^a = ±1` in `SL₂`, `1` in `PSL₂`); treat zero parameters by the presentation (free products). Tau Ceti's `infinite_of_inv_add_inv_add_inv_lt_one` (`Hyperbolic.lean:175`) carries `a b c ≠ 0`.

## R09 (P1) — Raw `MeromorphicOn` does not characterise holomorphic sphere-valued maps

Location: `README.md:2611`–:2614: "is holomorphic iff … the composite … is `MeromorphicOn`".

Witness: `MeromorphicAt` (`Mathlib/Analysis/Meromorphic/Basic.lean:36`) is a punctured-neighbourhood notion: `f = 0` except `f 0 = 1` has `z · f z = 0` analytic, so is meromorphic at 0, yet the sphere-valued map is discontinuous at 0.

Repair: Use normalised germs (`MeromorphicNFAt`) with the prescribed value at poles, or add continuity. Tau Ceti's `RiemannSurface.meromorphicOrderAt` (`Meromorphic.lean:86`, `WithTop ℤ`) is the pinned vocabulary.

## R10 (P1) — The meromorphic-field API contradicts its own noncompact and zero cases

Location: `README.md:2978`: "`poles … -- finite, by 8.3`" (no compactness in scope); :3001: "`ord_x f ∈ ℤ` … `ord_x(fg) = ord_x f + ord_x g`".

Witness: `1/sin` on `ℂ` has poles at every `kπ` (the README's own :3018). With `f = 0`, `g = z` an integer order forces `ord(0) = ord(0) + 1`.

Repair: Poles are discrete and closed; finite only under compactness, carried on those statements. Orders in `WithTop ℤ` (as the pin has them) or stated for nonzero `f, g`; `0⁻¹ = 0` spelled out.

## R11 (P1) — The local comparison uses the wrong scalar field and a non-injective "embedding"

Location: `README.md:3203`–:3205: "the resulting `ℂ((s))`-embedding `A → ℂ((z))` … kills all but one factor".

Witness: For `y² = t` near `t = 1/2`, `m = y² − (1/2 + s)` splits over `K = Frac(𝒪(D))`, so `A ≅ K × K`; each branch map has kernel `0 × K`, so it is not an embedding, and `A` is a `K`-algebra, not a `ℂ((s))`-algebra.

Repair: Take the `K`-algebra map `A → ℂ((z))`, pass to the factor field it does not kill, and base-change scalars afterwards; own (or declare as a gap) the normalisation-at-a-place statement and the fundamental identity it uses.

## R12 (P1) — The degree-reduction measure does not decrease

Location: `README.md:3337`–:3338: "the measure is `#S` … the step replaces `S` by `m(S) ∪ Crit(m)`".

Witness (computed): `S = {√2, −√2, ∞}`, `m = x² − 2`: `m(S) ∪ Crit(m) = {0, ∞} ∪ {−2}` has 3 elements, as does `S`.

Repair: Follow kock2004 line 429–436: the polynomial vanishing on the whole conjugation-stable affine set sends it to `{0}` and contributes at most `n − 1` critical values; recurse on that set (here `{−2}`, size 1), with the `∞` handled separately (R34's second source issue).

## R13 (P1) — The raw scalar tensor is not the function field

Location: `README.md:3546`: "`F = ℂ ⊗_k (k(t)[Z]/(minpoly))`".

Witness: for the degree-one pair over `k = ℚ`, `ℂ ⊗_ℚ ℚ(t)` is the localisation of `ℂ[t]` at the nonzero rational polynomials; `t − π` is not invertible there but is in `ℂ(t)`. AlgebraicCurves on main (`README.md:1514`–:1515) says the same: "The raw tensor `K ⊗ F` need not itself be that field."

Repair: `F = Frac(ℂ ⊗_k F_k)`, or `ℂ(t) ⊗_{k(t)} F_k` with the field property from geometric integrality (AlgebraicCurves §12B.0).

## R14 (P1) — Connected covers do not form a Galois category

Location: `README.md:3989`: "The category of finite covers of `U` (Layer 6.1's unnumbered carrier)".

Witness: `ConnectedCover` excludes the empty cover (initial object) and the disjoint union of two identity covers (fibre `{0,1}`, trivial monodromy); `PreGaloisCategory` (`Mathlib/CategoryTheory/Galois/Basic.lean:66`) requires finite coproducts.

Repair: Use all finite covers with coproducts; recover connected covers as the connected objects.

## R15 (P1) — Ten data declarations are admitted with `sorry`

Location: `Suggested.lean:984` `PermutationTriple.toDessin`; :997 `ConjClasses.inv`; :1033 `toPerm`; :1057 `γ0`; :1066 `γ1`; :1104 `freeGroupEquiv`; :1117 the `PathConnectedSpace` instance; :1130 `mob01`; :1142 `mob1Inf`; :1757 `ConnectedCover.pullback`.

Witness: gate `sorry-data=10`; the loops and homeomorphisms admit their proof fields, `freeGroupEquiv`, `toPerm`, `toDessin` and `ConjClasses.inv` admit their bodies.

Repair: Delete them and every statement that mentions them; consume the native objects where they exist (`TauCeti.ThricePuncturedSphere.basePt`, the native loops and branch-point action at `AlgebraicTopology/ThricePuncturedSphere/`), and leave the rest as README targets.

## R16 (P1) — The label supplier stops at degree 5; the constant-extension citation drifts

Location: `README.md:892`: "For `n ≤ 11`"; :3493 and :3909: "AlgebraicCurves Layer 8 makes the base change fully faithful".

Witness: `Completed/PolynomialGaloisGroups/README.md:35`, :202–:207 (classification for `n ≤ 5` only; `numTransitiveGroups` is 0 beyond, pinned at `GroupTheory/Perm/TransitiveGroupLabel/Basic.lean:66`). `AlgebraicCurves/README.md:1520`–:1522: "the fixed-t finite-Hom restriction/extension proof belongs to that consumer and is not full faithfulness for arbitrary maps".

Repair: State 1.6 for `n ≤ 5` and give degrees 6–11 a real owner or a declared gap; prove the fixed-`t` Hom comparison in 9.1 and cite AlgebraicCurves §12B.0a–d for base change.

## R17 (P1) — The affine-normalisation coefficients are reversed, and the characteristic-`p` explanation is wrong

Location: `README.md:4442`: "`c = α_m/β_m`, `d = α_0 − α_m β_0/β_m`"; :4452–:4453.

Witness (computed): `H₁ = x`, `H₂ = 2x`, `G₁ = 2x`, `G₂ = x` have equal composites; `H₂ = cH₁ + d` needs `c = 2`, the formula gives `1/2`. Frobenius `G₁ = x^p` is injective on `k[x]`; the real failure is `H₁ = x^p`, `H₂ = x^p − x`, `G₁ = x^p − x`, `G₂ = x^p`, both composites `x^{p²} − x^p`.

Repair: `c = β_m/α_m`, `d = β_0 − β_m α_0/α_m`; replace the Frobenius sentence by that witness.

## R18 (P1) — Convention controls contradict their own examples

Location: `README.md:358`–:360 ("the wrong partition at `∞`"); :1679 ("Only `mob01` fixes the basepoint"); :1689–:1693 ("would leave the same intersection"); :2800–:2804; :4217–:4219.

Witness (computed): `(ba)⁻¹` and `(ab)⁻¹` are conjugate, so their partitions agree ((1 2) versus (0 2) in `S₃`); `id` fixes `1/2` too (orbit `{1/2, 2, −1}`); the open half-planes `re < 1/2`, `re > 1/2` have empty intersection; for the torus `Σ(e − 1) = 8` while `2g − 2 = 0`, so "both sides are `Σ(e − 1)`" is false as written (:2754 has the correct `2g − 2 = −2n + Σ(e − 1)`); `σ = 1` lifts to the identity, which does send `P` to `P¹`.

Repair: Compare third permutations, not partitions; "`id` and `mob01`"; overlapping cuts; write the reconciliation as `2 − 2g = Σ c(σ_i) − n`; replace "no `σ`" by "no canonical simultaneous lift".

## R19 (P1) — The targeted build emits a non-sorry warning

Location: `Suggested.lean:1`: `import Mathlib`.

Witness: gate `build=1`: "imports `Mathlib` from package `mathlib`, which is designed for use with the module system". Direct `lake env lean` of the file is clean apart from 42 sorry warnings.

Repair: make the file module-system compatible as the gate's rule asks (no `set_option`), then rerun the targeted build.

## R20 (P1) — Raw passport specifications are not relabeling-invariant

Location: `README.md:771`–:772: "the equality of passports proved"; :829 "isomorphic triples have equal passports"; :879 `passportOf` with the literal monodromy group.

Witness (computed): `r = (0 1 2 3)`, `τ = (0 1)`: `⟨r⟩` and `τ⟨r⟩τ⁻¹` have order 4 and intersect in `{1}`, so the `G` fields of `passportOf t` and `passportOf (τ • t)` differ. Tau Ceti's `HasPassport` (`Combinatorics/PermutationTriple/Passport/Basic.lean:119`) uses conjugacy.

Repair: State equality of memberships / class sets, or pass to subgroup-conjugacy classes; same for `OrderedPassport` in 2.6.

## R21 (P1) — The CharacterTheory contract names a declaration that does not exist

Location: `README.md:129`: `centralCharacter_coordinate`; :542–:544.

Witness: no such name on main (`RepresentationTheory/CharacterTheory/README.md` cites `TauCeti.Representation.centralCharacter_classSumCenter_mul_character_one`, pinned at `RepresentationTheory/CharacterTable/CentralCharacter.lean:165`). Also :130–:131 "The Frobenius product-one counting formula is on no roadmap; this roadmap owns it" is false at the pin: `card_productOneTriples_eq_sum_characterTable` (`CharacterTable/ProductOne.lean:194`).

Repair: cite the native names with their hypotheses (finite group, algebraically closed characteristic-zero field, `χ(1) ≠ 0` for the quotient form) and delete 3.2 as a target.

## R22 (P2) — Layers 0–6 and the profinite ring are already at the pin; the README says the pin has none of it

Location: `README.md:525`–:528: "Notable absences at the pin … Seifert–van Kampen in any topological form, `ẑ`, … Riemann surfaces, Riemann–Roch, Riemann–Hurwitz, … any ribbon-graph or triangle-group object"; :1601–:1602 "The pin has no Seifert–van Kampen theorem in any form"; `Suggested.lean:92` starts a new `PermutationTriple`.

Witness (pin 358314d4, same on the branch and on main): `Combinatorics/PermutationTriple/Basic.lean:75` (relation `σinf * σ1 * σ0 = 1` at :83) with 20 sibling files (passports, enumeration, block quotients, examples); `Combinatorics/RibbonGraph/Basic.lean:49` and `Classification.lean:117`; `GroupTheory/TriangleGroup/{Basic,Signatures,Hyperbolic,Polyhedral,…}.lean`; `AlgebraicTopology/ThricePuncturedSphere/{Basic:134 basePt, Classification:174 triple_bijective, BranchPointAction, Deck, Regular}.lean`; `AlgebraicTopology/FundamentalGroup/VanKampen/Basic.lean:375` `vanKampenLift`, :420, :444 (the four declarations :546 says AlgebraicTopology must "publish"); `Topology/Algebra/Group/Profinite/ZHat/Ring.lean:69` `CommRing (Additive zHat)`, `ZMod.lean:103`, `Pow.lean`, `Units.lean`; `Analysis/Complex/RiemannSurface/Degree.lean:133`, `Meromorphic.lean:86`. Not at the pin (newer than it, per main's STATUS.md): `FilledCover`, `AnalyticBelyiPair`, algebraic Belyi pairs, Belyi polynomials.

Repair: delete the duplicate carriers and targets of Layers 0–6 and 12.1–12.3 from the README and `Suggested.lean`, cite the pinned names in the supplier contracts, and keep only the comparisons and end theorems the pin lacks.

## R23 (P2) — The compact-surface supplier rows conflict

Location: `README.md:554`: "ModularForms Layer 10B / compact-surface owner"; :2798; and R01's new sentence.

Witness: `ModularForms/README.md:1070`–:1072: "The Fuchsian-orbifolds roadmap supplies the compact surface and the generic degree, divisor-pullback, degree-one, and Riemann–Hurwitz APIs, but not cohomology or Riemann–Roch"; `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean:133` already defines `FiniteHolomorphicMap`.

Repair: point the carrier/degree/Riemann–Hurwitz rows at FuchsianOrbifolds and the pinned degree module, Riemann–Roch at ModularForms 10B, and delete 8.2–8.3's duplicate degree API.

## R24 (P2) — Pretransitivity is not connectedness at `n = 0`

Location: `README.md:1373`–:1374: "`t` is connected iff the induced action … is pretransitive".

Witness: at `n = 0` the unique triple is pretransitive and not connected (0.4 requires `n ≠ 0`).

Repair: `IsConnected ↔ n ≠ 0 ∧ IsPretransitive`.

## R25 (P2) — The branched-cover carrier restricts to the branch set

Location: `README.md:2542`: `IsCoveringMap (marked.restrictPreimage π)`.

Witness: `Set.restrictPreimage t f : f ⁻¹' t → t` (`Mathlib/Data/Set/Operations.lean:306`) restricts over `t = marked`, so for the identity sphere map the field asserts a covering of the three-point set.

Repair: `markedᶜ.restrictPreimage π`.

## R26 (P2) — The separator argument evaluates functions at their poles

Location: `README.md:3054`–:3061.

Witness: on `ℙ¹` the separators `1/(z − x₁)`, `1/(z − x₂)` take the value `∞` at `x₁, x₂`; a generic combination is not a linear functional on the fibre.

Repair: use Riemann–Roch on a divisor supported away from the fibre to make evaluation onto `ℂⁿ` surjective, then avoid the equality hyperplanes.

## R27 (P2) — Descent continuity is not automatic; vector-space descent is not finite-dimensional

Location: `README.md:3647`–:3648: "automatic here because the pair is defined over a number field"; :3653–:3655.

Witness: twisting a rational model of `z ↦ z²` by a discontinuous character of the multiquadratic Galois quotient gives a discontinuous `C₂`-valued cocycle. kock2004 line 199–201 (Lemma (1.10)) has no finite-dimension hypothesis.

Repair: require continuity (locally constant in `σ`), descend at finite level; drop the finite-dimensional restriction and :3674's invariant-field warning (a fixed `x ≠ 0` has a fixed inverse).

## R28 (P2) — The profinite residue levels include `n = 0`

Location: `README.md:3820`: "`ẑ →+* ZMod n` for every `n`".

Witness: `ZMod 0 = ℤ`; a continuous unital map from a compact ring to discrete `ℤ` has finite image. Tau Ceti's `zHat.toZMod` (`ZHat/ZMod.lean:103`) takes `n ≠ 0`.

Repair: index by `ℕ+` or require `n ≠ 0`.

## R29 (P2) — Class-by-class conjugacy does not determine the embedded monodromy group

Location: `README.md:4284`: "Passport invariance follows from the class-by-class form alone."

Witness (computed): in `S₅`, `(r, r, r³)` with `r = (0 1 2 3 4)` generates `C₅`; `((0 1 2 3 4), (0 1 3 4 2), (0 1 4 2 3))` satisfies the relation, has three 5-cycles, and generates a group of order 60. Same three classes, groups of order 5 and 60.

Repair: prove invariance of the monodromy group from the precomposition by the profinite automorphism and one global fibre identification; use the class powers only for cycle types.

## R30 (P2) — The arithmetic exact sequence cites an impossible linear disjointness

Location: `README.md:4088`: "`ℚ̄` and `ℚ̄(t)` are linearly disjoint over `ℚ(t)`".

Witness: `ℚ(t)` does not embed in `ℚ̄` over `ℚ` (the image of `t` would be algebraic).

Repair: `ℚ̄` and `ℚ(t)` are linearly disjoint over `ℚ`; extend constant automorphisms fixing `t`.

## R31 (P2) — Statable end theorems are absent from the acceptance test

Location: `Suggested.lean:19`: "in preference to end theorems".

Witness: the polynomial decomposition lemma (13.5, corrected per R17) is statable on `Polynomial k` with `CharZero k`; polynomial Belyification (10.3) on `Polynomial ℚ`, `IsAlgebraic`, `Finset`, `Polynomial.derivative`; the classification of compactified covers on 7.7's `TopBranchedCover` (a real structure). None is in the file; the docstring instead defers everything after Layer 6 as a block.

Repair: state them; name individually in the docstring each headline that is genuinely not statable and the carrier it lacks; delete the API catalogue.

## R32 (P2) — Executable enumeration is outside the roadmap contract

Location: `README.md:1133`–:1188 ("Executable enumeration", `#eval`, `n!·n!` enumeration); :4602–:4642 (parsers, certification levels).

Repair: keep the counts `1, 3, 7, 26` and the degree-5 passport as Checks; delete the executable procedures and record parsing.

## R33 (P2) — The acceptance test overrides Lean options

Location: `Suggested.lean:80` `set_option autoImplicit false`; :525 `set_option maxRecDepth 8000 in`.

Repair: delete both and the powered-triple `example` that needs the override (it mirrors a README Check).

## R34 (P2) — A source statement is copied

Location: `README.md:3570`–:3572.

Witness: kock2004 line 277–279 reads the same two sentences (finite extension of `M(X,t)`; `M(X,t)` itself when Galois) with the same clause order.

Repair: paraphrase, keep the locator.

## R35 (P3) — Padding in the acceptance test

Location: `Suggested.lean:1166` `mob01_γ0`.

Witness: one-tactic probe on a scratch copy (all 32 sorried theorems replaced by `first | rfl | (simp; done) | infer_instance | decide`): `mob01_γ0` closes by `rfl` (`γ1` is `1 − γ0` pointwise); the other 31 do not close. The forgetful identities :1695/:1701, the setoid instances and the branch-operation examples mirror README API and Checks.

Repair: delete them from `Suggested.lean`.

## R36 (P3) — Text-gate failures and process residue

Location: `README.md:85` ("stand-in"), :114 and :221 ("proposed in #490/#489"), :545, :554, :561, :570 (pull-request numbers), :1279 (`C_{S_n}(G)` inside a text fence), :2516 ("so far"); the "This PR" voice throughout (:56, :98, :2049, :2366, …).

Witness: gate `tex=1 prnum=4 residue=5`. The :1279 hit is inside a fenced block, a scanner limitation; spelling it `C_Sₙ(G)` removes it anyway.

Repair: remove the pull-request numbers and process voice; the required Summary / Scope / Conventions / contracts / per-layer Examples and Dependencies shape is absent.

## R37 (P3) — Supplier status and pin drift

Location: `README.md:221` and :561 (`ProfiniteArithmetic` "proposed in #489", "not yet merged"); :114 (`PeripheralActions` "proposed in #490"); :66, :270 ("until #243 lands"); :509 (Mathlib "`9caeba1000`"); :4547, :4759 ("private provenance ledger").

Witness: `Completed/ProfiniteArithmetic`, `Completed/PeripheralActions`, `Completed/PolynomialGaloisGroups`, `Completed/ProfiniteProPGroups` are on main; the branch and main both pin Mathlib `f6090c70` and Tau Ceti `358314d4`. The frozen LMFDB snapshot has no public locator.

Repair: cite the completed roadmaps by section; delete the hash; give public record locators or drop the frozen-data claims.

## R38 (P3) — The pull request edits a folder outside its declared scope

Location: `Completed/ConformalMapping/README.md:163`–:169 (seven added lines).

Witness: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/BelyiMaps' ':!TauCetiRoadmap/GeometricTopology'` lists exactly this file; the brief names only GeometricTopology as the pull request's other folder.

Repair: revert here or get the folder into the declared scope.

**Previous findings, finding by finding** (the folder is unchanged since 9bd6e07, so every passage is at the same line):

| Previous | Passage at this head | Disposition |
|---|---|---|
| R01–R11 | :74, :118, :712, :1427, :1528, :2611, :2978, :3203, :3337, :3546, :3989 | not repaired → R04–R14 |
| R12 | `Suggested.lean:984` and nine more | not repaired → R15 |
| R13 | :892, :558 | not repaired → R16 |
| R14, R15 | :4442, :355/:1679/:1691/:2800/:4218 | not repaired → R17, R18 |
| R16, R17, R18 | `Suggested.lean:1`, :772, :129 | not repaired → R19, R20, R21 |
| R19–R27 | :153, :554, :1373, :2542, :3054, :3648, :3820, :4284, :4088 | not repaired → R22–R30 |
| R28–R31 | `Suggested.lean:19`, :1133, `Suggested.lean:80`, :3570 | not repaired → R31–R34 |
| R32–R35 | `Suggested.lean:1166`, :85 etc., :4547, `Completed/ConformalMapping` | not repaired → R35–R38 |

## Verified sound

Both files were read in full (README 4826 lines, `Suggested.lean` 2223 lines, active code distinguished from the two commented drafts). HEAD is fcad6f1; main is 929496d; the pins are Tau Ceti 358314d4 and Mathlib f6090c70 on the branch and on main alike. SurfaceTopology and PlanarTopology were read at the #271 head (421e114); PR #767's BelyiMaps head was read for ownership. `lake env lean` on `Suggested.lean` exits 0 with 42 sorry warnings and nothing else. The worker's `#check` inventory (248 names, including the commented drafts) was compared with the README; its five binder leads are the `omit` lines of the UniversalCoversSupply section, which drop `PathConnectedSpace`/`LocallyPathConnectedSpace`/`SemilocallySimplyConnectedSpace` exactly where the supplier theorems do not need them, so no hypothesis is lost. No file of the pull request was changed; the sources manifest the fetch created in the board package was removed.

**New paragraph against SurfaceTopology (#271).** Layer 1 (generalized maps with boundary and non-orientability), Layer 2 (`CombinatorialMap D` on arbitrary finite darts; `PermutationTriple.toWalshMap`, `toGMap2`, `eulerChar_toGMap2`, `isConnected_toGMap2`, `toBipartiteRibbonGraph` under white degree two), Layer 3 (realization), Layer 8 (classification) support the paragraph's first two sentences and the "targets of SurfaceTopology layer 2" clause. Euler characteristic's topological invariance there comes from PlanarTopology (its "Invariance" section), a small attribution slip. The last sentence is R01.

**Pinned declarations opened** (paths relative to the library root):

| Library | File:line | Content checked |
|---|---|---|
| Tau Ceti | `Combinatorics/PermutationTriple/Basic.lean:75`, :83 | triple structure, relation `σinf * σ1 * σ0 = 1` |
| Tau Ceti | `Combinatorics/PermutationTriple/Passport/Basic.lean:119` | membership by conjugacy of the reference subgroup |
| Tau Ceti | `Combinatorics/RibbonGraph/Basic.lean:49`, :81, :83, :127; `Classification.lean:117` | carrier with `IsCycleOn` fibres, face permutation, iso ↔ equivalent triples |
| Tau Ceti | `GroupTheory/TriangleGroup/Hyperbolic.lean:175`; `Signatures.lean:122`, :176, :206 | infiniteness with `a b c ≠ 0`; `orbifoldEulerChar`; exact versus parameter spherical signatures |
| Tau Ceti | `AlgebraicTopology/ThricePuncturedSphere/Basic.lean:134`; `Classification.lean:174`, :182 | `basePt`; `triple_bijective`, `tripleEquiv` |
| Tau Ceti | `AlgebraicTopology/FundamentalGroup/VanKampen/Basic.lean:375`, :420, :444 | `vanKampenLift`, `vanKampenLift_bijective`, `vanKampenEquiv` |
| Tau Ceti | `AlgebraicTopology/UniversalCover/Classification/ActionCover.lean:178` | `monodromy_actionCoverFiberEquiv g a` gives `g • a` |
| Tau Ceti | `Topology/Homotopy/Monodromy/Basic.lean:237` | `pathConnectedSpace_iff` over a `PathConnectedSpace` base |
| Tau Ceti | `GroupTheory/Perm/TransitiveGroupLabel/Basic.lean:66`, :147; `Perm/Partition.lean:96` | `numTransitiveGroups`, `TransitiveGroupLabel`, `fullCycleType` |
| Tau Ceti | `RepresentationTheory/CharacterTable/ProductOne.lean:194`; `CentralCharacter.lean:165` | Frobenius product-one count; class-sum conversion |
| Tau Ceti | `Topology/Algebra/Group/Profinite/ZHat/Ring.lean:69`; `ZMod.lean:103` | `CommRing (Additive zHat)`; `toZMod` with `n ≠ 0` |
| Tau Ceti | `Analysis/Complex/RiemannSurface/Degree.lean:133`; `Meromorphic.lean:86`; `Conformal/LocalDegree.lean:197` | `FiniteHolomorphicMap`; order in `WithTop ℤ`; `exists_localDegree` |
| Mathlib | `Analysis/Meromorphic/Basic.lean:36`; `Data/Set/Operations.lean:306` | punctured-neighbourhood meromorphy; `restrictPreimage` lands in `t` |
| Mathlib | `Analysis/Complex/CoveringMap.lean:31`; `Topology/Homotopy/Lifting.lean:443`, :499, :687 | `isAddQuotientCoveringMap_exp`, `monodromyPerm`, lifting criterion, `fundamentalGroupEquiv` |
| Mathlib | `NumberTheory/Cyclotomic/CyclotomicCharacter.lean:212`, :307; `CategoryTheory/Galois/Basic.lean:66` | both cyclotomic characters; `PreGaloisCategory` |

**Supplier and ownership audit.** CharacterTheory (main, :195, :746), AlgebraicCurves (main, :32, :104, :1513–:1522, :1576–:1580, :1799), ModularForms (main, :1068–:1106), AlgebraicTopology (main, Stage 1 is groupoid van Kampen; no `vanKampen*` identifier), Completed UniversalCovers / PeripheralActions (:103, :170) / ProfiniteArithmetic (:8, :28) / ProfiniteProPGroups / PolynomialGaloisGroups (:35, :202–:207) / ConformalMapping were resolved. The three successor folders exist nowhere. PR #767 restates this same folder on Tau Ceti's declarations and is the one open revision that would resolve R22; this pull request adds no object another roadmap could own. Ownership against open pull requests whose files the brief does not give was not checked.

**Seeded source sample (15 targets):**

| Target | Checked; result |
|---|---|
| Character theory (:123) | main CharacterTheory :195/:746, pin `CentralCharacter.lean:165`, `ProductOne.lean:194`: stale name, formula already native → R21 |
| Algebraic curves (:180) | AlgebraicCurves :32/:104/:1799 name BelyiMaps as consumer ✓; :1520–:1522 fixed-`t` Hom is Belyi's, not full faithfulness → R16 |
| Polynomial Galois groups (:190) | Completed, `n ≤ 5` (:35, :202), pin :66 ✓ contract; 1.6's `n ≤ 11` → R16 |
| Dessins (:396) | pin `RibbonGraph/Basic.lean:49` matches the carrier; duplicate → R22 |
| Passports (:401) | pin `Passport/Basic.lean:119` conjugacy ✓; README's raw equality → R20 |
| The route is pinned … AlgebraicTopology (:1601) | `VanKampen/Basic.lean:375` exists at the pin; "no form" false → R22; `isAddQuotientCoveringMap_exp` ✓ |
| New object `U` (:1635) | orbit of `1/2` computed `{1/2, −1, 2}` ✓; `id` also fixes it → R18; pin `basePt` :134 duplicate → R22 |
| Not a milestone of this roadmap (:1845) | hatcher-at line 1956–1961 Thm 1.20: path-connected opens, pairwise and triple intersections ✓ |
| The action, pinned (:2074) | `ActionCover.lean:178` ✓; `assocCoverNumbering_permCongr_monodromyHom` elaborates against it ✓ |
| The finite corollary, owned here (:2126) | `Monodromy/Basic.lean:237` ✓ |
| Embeddings, and the map they give (:3746) | `G/H ↠ G/S`, fibres of size `[S:H]`, `H ≤ S` ✓ |
| New object `^ᶻ` (:3850) | `ZHat/Pow.lean`, `Ring.lean:69` at the pin; ProfiniteArithmetic Completed → R37 |
| The outer action of an extension (:4073) | `E ⧸ N → ContinuousOut N` well defined for closed normal `N` ✓ |
| Corollary 4.7.3 (:4097) | Szamuely not readable → Not verifiable |
| Change of convention (:4378) | `conjugation_transfer` at `q = P`, `x = C`; `(PT)⁻¹ = P(TP)⁻¹P⁻¹` ✓, both proved by `group` in the file |

Other locators: kock2004 (1.4)–(1.6) line 115/139/146 (statements match 10.5's three) ✓, (1.9) line 185, (1.10) line 199 (no finite dimension), (2.1) line 257, (2.2) line 277 (R34), (3.1) line 355, (3.2) line 385, (3.3) line 398, (3.5) line 425, (3.6) line 437 ✓; mssv2019 line 113–114 relation `σ∞σ1σ0 = 1`, Lemma 2.1.2 line 120, Algorithm 2.3.1 line 188 ✓; sijsling-voight2014 line 75, 166 `σ0σ1σ∞ = 1` (opposite convention, as :616 says) ✓; couveignes1994 (Numdam) Théorème 3 line 704 on printed p. 22 ✓, §8.3 line 1058, Théorème 8 line 1078 (odd-order cyclic, model over the moduli field; even order measured by a Hilbert symbol, line 1086) ✓; stix (arXiv 0809.0017) §7.1 line 489–506: cusp orientations equivariant for `γ(·)γ⁻¹` against `χ_cycl(γ)`, non-inverted ✓ (Definition numbering only in print, not checked).

**Adversarial table** (values computed by scratch scripts over all 618 triples of degree ≤ 4 and by hand; `T = ((012),(01),(12))`, `Cₙ = (r,1,r⁻¹)`, products right-to-left):

| Statement | Instance | Values on the two sides | Result |
|---|---|---|---|
| §Pinned relation, `ofTwo` | `T` | `cba = id`; `abc = (021)` | ✓ |
| opposite-convention involution | `T` | `a⁻¹b⁻¹c⁻¹ = id` | ✓ |
| partition warning :358 | `T` | `(ba)⁻¹ = (12)`, `(ab)⁻¹ = (02)`, both type `[2,1]` | R18 |
| 0.4 connectedness | `n = 0`, `C₁` | pretransitive true/true; connected false/true | ✓; 4.2 iff fails → R24 |
| 0.6 counts | `n = 0..4` | triples `1,1,4,36,576`; connected `0,1,3,26,426`; classes `0,1,3,7,26` | ✓ matches :1301, :2248–:2250 |
| 0.6 disjoint sum | `C₂ ⊔ C₂` | group order 2 vs product 4; `χ = 4` | R06; `χ` ✓ |
| 0.6 genus | torus triple | `χ = 0`, types `[4],[4],[2,2]`, `g = 1` | ✓ |
| 1.1 raw passport equality | `C₄`, `τ = (01)` | `|⟨r⟩| = |τ⟨r⟩τ⁻¹| = 4`, intersection 1 | R20 |
| 2.6 all identities (`s² = 1`, `t² = a•`, `rot³ = 1`, `rotInv∘rot = b•`, three composites, relation preserved) | all 618 triples | 0 counterexamples each; naive swap breaks the relation on 348 | ✓ |
| 2.6 basepoint-fixing operations | six Möbius maps at `1/2` | `1/2, 1/2, −1, 2, 2, −1` | R18 (`id` too) |
| 3.2 Frobenius | `S₃`, `(3-cycles, transp., transp.)`; all transpositions | count 6 = `(2·3·3/6)(1+1+0)`; 0 | ✓ |
| 3.5 degree-5 passport | `C₅`, `([5],[5],[5])` | 3 classes with `G = C₅` | ✓ |
| 3.5 counts | `n ≤ 4` | ordered passports (cycle data) `1,3,7,26`, every fibre size 1 | ✓ |
| 4.4 spherical list | `(1,2,3)`; `(2,3,5)` | `χᵒʳᵇ = 5/6`, order 1 ≠ 12/5; `χᵒʳᵇ = 1/30`, 60 = `|A₅|` | R07; ✓ |
| 4.4 Euclidean | `a = b = 3` | translation part `(η−1)(1−ω) ≠ 0` | ✓ |
| 4.5 trig lemma | `α = β = γ = π/3` | LHS 0, RHS 0 | ✓ |
| 4.5 matrices | `(2,3,7)` | `κ = 1.04035`, `μ + μ⁻¹ = 2κ`, `det = 1`, `tr(YX) = −1.80194 = −2cos(π/7)` | ✓ |
| 4.5 Fricke / commutator | same | `tr[X,Y] = 2.24698` both ways; `tr(XY⁻¹) = 1.80194 < 2` | ✓ |
| 4.5 elliptic criterion | `[[1,1],[0,1]]` | trace 2, cube `[[1,3],[0,1]] ≠ ±1` | R08 |
| 5.1 cuts | `re < 1/2`, `re > 1/2` | intersection ∅ | R18 |
| 5.5 van Kampen hypothesis | `S¹` as two arcs | `π₁ = ℤ ≠ 1 ∗ 1` | ✓ (hypothesis needed) |
| 6.3 pointed counts | `n = 1..5` | Hall numbers `1,3,13,71,461`; marked classes `1,3,13,71` | ✓ |
| 7.7 restriction field | identity map | restricted base has 3 points | R25 |
| 8.1 meromorphy | `f = 0`, `f(0) = 1` | `z·f` analytic; `f` discontinuous | R09 |
| 8.5 torus pair | `y⁴ = t(t−1)` | `[4],[4],[2,2]`; `2g−2 = −8+8 = 0` | ✓ (:2754); :2801 wording R18 |
| 9.2 | `1/sin` on `ℂ`; `f=0, g=z` | infinitely many poles; `ord(0) = ord(0)+1` | R10 |
| 9.3 separators | `1/(z−x₁)`, `1/(z−x₂)` | value `∞` at both | R26 |
| 9.6 | `y² = t` near `1/2` | `A = K×K`, kernels `0×K` | R11 |
| 10.2 measure | `{±√2, ∞}`, `x²−2` | 3 → 3 | R12 |
| 10.3 | `B₁,₁ = 4x(1−x)` | `B(1/2) = 1`, one critical point | ✓ |
| 10.7 tensor | identity pair over `ℚ` | `(t−π)⁻¹ ∉ ℂ⊗ℚ(t)` | R13 |
| 11.4 descent | discontinuous `C₂` twist; `⊕ℕ L` | cocycle, not locally constant; invariants descend without finite dimension | R27 |
| 12.1 levels | `n = 0` | `ZMod 0 = ℤ` | R28 |
| 12.6 Galois category | `id ⊔ id`, `∅` | excluded by `ConnectedCover` | R14 |
| 12.8 | `ℚ(t) ↪ ℚ̄`? | `t` would be algebraic | R30 |
| 12.10 | conjugation, `n = 3` | `ζ₃ ↦ ζ₃²`, `χ₃ = 2` | ✓ |
| 12.12 powers | `T`, `u = 5` | product of fifth powers `(012) ≠ 1`; types unchanged | ✓ |
| 12.12 group from classes | `(r,r,r³)` vs `((01234),(01342),(01423))` | orders 5 vs 60, same three classes | R29 |
| 13.5 coefficients | `H₁ = x, H₂ = 2x` | need `c = 2`, formula `1/2` | R17 |
| 13.5 nonconstancy | `G₁ = G₂ = 0` | any `H₁ ≠ H₂` | ✓ (hypothesis needed) |
| §Pinned transfer | `(PT)⁻¹` vs `P(TP)⁻¹P⁻¹` | equal by `group` | ✓ |
| Lean padding probe | 32 sorried theorems | 1 closes (`mob01_γ0`, `rfl`) | R35 |

**Headline theorems** (from the README): 2.4 dessin/triple equivalence; 3.2–3.4 counting; 4.4–4.5 trichotomy; 5.6 `π₁(U) ≅ F₂`; 6.3 three classifications; 7.4/7.7 compactification; 8.6 analytic Riemann existence; 9.8 comparison; 10.3–10.7 Belyi's theorem; 11.6 moduli/definition; 12.6, 12.11 profinite comparison and branch cycles; 13.3 peripheral powers; 13.5 faithfulness. At the pin, 2.4, 3.2, 4.4–4.5, 5.6 and 6.3 are native theorems (R22); 10.3 and 13.5's lemma are statable on Mathlib polynomials and absent (R31); 7.7/8.6 are statable on the README's own `TopBranchedCover` and absent; 9–13 are not statable and the docstring names none of them individually.

## Not verifiable

- `ggd2012` (Girondo–González-Diez), `szamuely2009`: Cambridge landing pages only; the GGD theorem numbers (2.28–2.34, 2.61–2.72, 1.74–1.95, 4.48–4.50) and Szamuely 4.6.10–4.7.5 (including the sampled Corollary 4.7.3) are uncertified.
- `fried1977` (DOI returns 404), `deligne1989` (MSRI mirror timed out; the SLMath path is 404), `weil1956`, `lando-zvonkin2004`, `forster1981`, `dixon-mortimer1996`, `serre2008`, `cori-machi1992`: no legal text reached; locators not guessed.
- Stix: the arXiv preprint (0809.0017) was read; the printed "Definition 37" numbering was not checked (the Project Euclid open-access item returned only a landing page).
- The frozen LMFDB snapshot and "private provenance ledger" are not public; nothing in Layer 14 or :4547 is verifiable.

## Source issues

- **Misprint** in kock2004 at Lemma (3.5), arXiv v2 p. 11: the source says the product of the minimal polynomials of the elements of `S` has degree `n`; it should be the product of the distinct minimal polynomials; affects the proof.
- **Gap** in kock2004 at Lemma (3.6), arXiv v2 p. 11: the source states its hypothesis as `T ⊂ ℚ` while the proof of (3.3) feeds it a set containing `∞`, and the step applying (3.5)'s induction does not record that the cardinality has dropped; it should allow `T ⊂ ℙ¹(ℚ)` and state the drop; affects the proof.
