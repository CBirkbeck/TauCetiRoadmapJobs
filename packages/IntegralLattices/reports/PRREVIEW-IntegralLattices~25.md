# Review of IntegralLattices (pull request #617 at 39e8628)

**Verdict:** needs changes

Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. Paths of native declarations are relative to `TauCeti/` in the pinned package.

**Status of the previous review's findings** (review of `2796799`):

| Previous | Status at this head | Evidence |
| --- | --- | --- |
| R01 (P2) Layer 3 restated native Jordan theory | repaired | 3B and 3C are marked native (README.md:859–909). The From Tau Ceti rows (467–470) name `IsSymm.exists_isJordanSplitting`, `localIntegralForm_two_equivalent_iff`, `DyadicJordanProfile`, `nQ_eq_nM_add_densityExponent` and others. 3I keeps only its dictionary to 3E (1085–1087). Principal result 2 no longer lists Jordan data (32). |
| R02 (P2) B7 split quotient `ℤ̂ˣ/{±1}` | repaired | README.md:1544–1551 now gives "`𝔸^{×,1} = ℚˣ × ℤ̂ˣ` … So the quotient is `ℤ̂ˣ`, of volume 1". |
| R03 (P2) Layer 1 relations, 1H native; `Suggested.lean` mislabel | repaired | 1G names the relation files and `nonempty_isometry_pi_oddCyclic_iff` (630–640). 1H is "(native)" (683). `Suggested.lean`:56–58 lists `gaussSign_oddCyclic` as proved in Tau Ceti. |
| R04 (P2) 4G, N0, 7C, `E₈` mass native | repaired | 4G is "(native)" and the "decidable check" is deleted (1971–1987). N0 cites `localStabilizer_eq_integralOrthogonalSubgroup` (1662). 7C cites the `hasProd_inv_half_localDensity_…` family (2753–2757). `mass_typeE₈RootLattice` is cited (2649). |
| R05 (P3) gate `outside-folder` | **not repaired** | See R01 below. |
| R06 (P3) merge order with the conflicting open pull requests | **not repaired** | See R02 below. |
| R07 (P3) three false Checks | repaired | 3C (917–921) now separates by the scale-1 unit determinant. 4B (1820–1823) uses `p = 5`. 4G (1993–1995) reads `125 ≡ 0 (mod 25)`. |
| R08 (P3) B8 re-proved `m⁺ = 2m`; 7G against B7 | repaired | B8 cites `properMass_eq_two_mul_mass` (1595–1596). The 7G *Needs* line is "T `mass`, `properMass`, `properMass_eq_two_mul_mass`; L B8" (2877–2878). The B8 and 7G rows list T entries. |
| R09 (P3) native theorems cited as R | repaired for 3G, 6A and `finite_narrowPic` (1148, 2488, 1625) | A further instance of the same class remains in the B7 row: see R06 below. |
| R10 (P3) `SameGenus.exists_isometry` overstated | repaired | README.md:1802–1806. |
| R11 (P3) 6A on Gram matrices | repaired | `Suggested.lean`:440–458 is on `IntegralLattice` with `IsIndefinite` and `signature`. |
| R12 (P3) dangling labels, consumer list | repaired | Row 445 reads "0A, 1B, B2, 6A". The References have no 5C/5D/5E/5H. Line 3320 lists 5A and 6G. |
| R13 (P3) B3/B8 locators | **partly repaired** | B8 now cites Conway–Sloane (1), §6 (1594). The split branch says it is proved here (1343–1345). The nonsquare genus theorem still has no locator: see R03 below. |

## R01 (P3) — Gate `outside-folder`: files under `Completed/` change in this pull request

**Location.** `git diff --stat origin/main...HEAD` lists:
- `Completed/LocalFieldsRamification/COMPLETION.md`, `README.md` and `Suggested.lean`;
- `Completed/LocalGaloisGroups/README.md` and `Suggested.lean`.

**Claim.** This brief names only ClassFieldTheory and QuadraticFormInvariants as this pull request's own folders. The `Completed/` changes are outside the folder under review. This was R05 of the previous review, and nothing marks it settled.

**Witness.** My gate run at this head prints `outside-folder=9 … FAIL`, with every other scanner at 0. Five of the nine are the ClassFieldTheory and QuadraticFormInvariants files. The four `Completed/` files are not named.

**Repair.** Move the `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` changes to their own pull request, or have them named as this pull request's own. No acceptance is possible while the gate fails.

## R02 (P3) — Two open pull requests rewrite this folder differently, and no merge order is stated

**Location.** The pull request description. Its revision paragraph names only #1410 as merging first.

**Claim.** Two other open pull requests change `TauCetiRoadmap/IntegralLattices/README.md` and `Suggested.lean`, and their heads conflict with this one. Nothing says which is rebased onto which. This was R06 of the previous review.

**Witness.** `roadmaps overlaps IntegralLattices` lists #1411 and #1797 as conflicting with #617 in both IntegralLattices files.

**Repair.** State in the description which pull request rebases onto which before either merges. Do not restate in one what the other already changes.

## R03 (P3) — B3: the principal-genus target has no locator, and its route omits the existence input

**Location.** README.md:1325–1337: "This is Gauss's principal genus theorem for the order `𝒪_Δ`, proved here along the classical route … the number of genera, the size of the image, which quadratic reciprocity computes, equals `[C : C²] = #C[2]`".

**Claim.**
- The target has no source in parentheses; the previous review's R13 asked for one.
- The route also claims that reciprocity computes the number of genera. Reciprocity gives only the upper bound `2^{μ−1}`. The kernel is `C²` only once there are at least `[C : C²]` genera.
- That lower bound needs an existence input: Dirichlet's theorem on primes in progressions, or Gauss's ternary-form (Hasse–Minkowski) argument. Neither the route nor the *Needs* line names one.

**Witness.** At `Δ = −20`, `C ≅ ℤ/2` and `μ = 2`. Reciprocity bounds the genera by 2. Exhibiting two genera needs an actual form: `(2,2,3)` represents 3, and `(3|5) = −1`. Mathlib has the prime input: `Nat.forall_exists_prime_gt_and_eq_mod` (`NumberTheory/LSeries/PrimesInAP.lean:443`).

**Repair.**
- Add a locator at the claim, for example Cox, §3.B, Gauss's principal genus theorem for negative discriminants (uncertified), and a source for `Δ > 0`.
- Rewrite the route: reciprocity bounds the number of genera above by `2^{μ−1}`, and every allowed character tuple is realized.
- Add the realizing input to *Needs* and to the B3 row: Mathlib `Nat.forall_exists_prime_gt_and_eq_mod`, or the native `exists_of_realization` together with Global Quadratic Forms `hasseMinkowski_equivalent`.

## R04 (P3) — 4B's proper version rests on an unowned lemma: a determinant `−1` element in every `K_p(L)`

**Location.**
- README.md:1800–1801: "In positive rank every `K_p(L)` contains an element of determinant `−1` (a reflection in a vector of least valuation), so the `g_p` can be taken in `SO(V_p)`".
- The same step appears in the docstring at `Suggested.lean`:280–281, and 7C's index bullet at README.md:2682 reads it off.

**Claim.**
- The lemma is neither a target here, nor a cited supplier section, nor a pinned declaration. No Tau Ceti declaration states it.
- GeometryOfNumbersAndQuadraticArithmetic 2.4.6 states it (open head, README line 620), and OrthogonalTamagawaAndLatticeMass names that roadmap as its owner (its README line 9).
- But GeometryOfNumbersAndQuadraticArithmetic consumes this roadmap ("*Needs:* IntegralLattices §7E", its line 1147). A citation from here would make the two roadmaps cite each other.

**Witness.** The lemma holds and is needed. For `U` over `ℤ₂` there is no unit-norm basis vector, yet the reflection in `e − f` (norm `−2`) maps `e ↦ f` and preserves `L₂`, with determinant `−1`.

**Repair.** Move the notion down into this roadmap:
- Make it an explicit N0 target. For a nondegenerate `L` of positive rank and every prime `p`, `p = 2` included, the reflection in a `v ∈ L_p` whose norm `β(v,v)` generates `𝔫(L_p)` lies in `K_p(L)` and has determinant `−1`. It is integral because `2β(x,v) ∈ 2𝔰 ⊆ 𝔫`.
- Have 4B, 7C and the docstring of `exists_genusProperClasses_equiv_doubleCoset` cite N0 for it. Add it to the N0 dependency row.
- GeometryOfNumbersAndQuadraticArithmetic 2.4.6 can then cite it for the case `ℤ`.

## R05 (P3) — Two Checks on genus symbols do not test what they claim

**Location.**
1. README.md:971: "Oddity fusion: `⟨1⟩ ⊕ ⟨3⟩ ≅ ⟨5⟩ ⊕ ⟨7⟩` (3B) has the single symbol `1_4^{−2}`".
2. README.md:1014–1015: "`1_1^{−1} 3^{+1}` fails the oddity formula, so both clauses are needed".

**Claim.**
1. Oddity fusion concerns a compartment, a run of consecutive type I constituents. Only the compartment's total oddity is invariant. A single constituent never exercises it, so this Check also passes for a calculus without fusion.
2. `1_1^{−1}` is not a valid rank-one constituent. With sign `−`, the oddity must be `±3 (mod 8)`. So the symbol is rejected before the oddity formula is read, and the Check does not show that the formula is needed.

**Witness.**
1. `allcock-gal-mark2016` lines 114–134 define oddity fusion on compartments.
2. Line 711 gives the rank-one terms as `q^{+1}_{±1}` and `q^{−1}_{±3}`.

**Repair.**
1. Replace the first Check with a two-term compartment. Over `ℤ₂`, `⟨7⟩ ⊕ ⟨2⟩ ≅ ⟨1⟩ ⊕ ⟨14⟩`: `v = e₁ + e₂` has norm 9, its complement `(2, −7)` has norm `126 = 2·63`, and the change of basis has determinant `−9`. The symbols `1_7^{+1} 2_1^{+1}` and `1_1^{+1} 2_7^{+1}` differ termwise and share total oddity `8 ≡ 0`.
2. Replace `1_1^{−1} 3^{+1}` by `1_5^{−1} 3^{+1}`. Its term is valid (`5 ≡ −3`), its sign matches `(2|3) = −1`, and it fails only the oddity formula, since `1 + 2 = 3 ≢ 5`.

## R06 (P3) — B7: native declarations labelled R, and no *Needs* line

**Location.** README.md:1627: "R Restricted Products `RestrictedProductGroup`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal`". B7 (1509–1582) has no *Needs:* line.

**Claim.** These five declarations are Tau Ceti's. The From Tau Ceti row at line 477 says so, and so does the supplier row at 535 ("are native"). The kind must be T, as in the previous review's R09 repair for the other rows. B7 is a target, but its prose lists no prerequisites.

**Witness.** At the pin:
- `Topology/Algebra/RestrictedProduct/Basic.lean`: lines 59 (`RestrictedProductGroup`), 94 (`integralSubgroup`), 244 (`isCompact_integralSubgroup`) and 260 (`CompactOpenSubgroups`);
- `Diagonal.lean:62` (`rationalDiagonal`).

**Repair.** In the B7 row, write "T `RestrictedProductGroup`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal`". Keep "R Restricted Products" only for the change-of-family and away-`S` statements, if B7 uses them. Add a *Needs:* line to B7 listing B4, B5, B6, these T declarations and Mathlib `MeasureTheory.Measure.haar`.

## R07 (P3) — Three `Suggested.lean` declarations are not named in the README

**Location.**
- `Suggested.lean`:168 `NikulinGenerator.prime`;
- `Suggested.lean`:502 `Archimedean.SO`;
- `Suggested.lean`:505 `Archimedean.O`.

**Claim.** The README and the Lean file must agree: every Lean name appears in the README. These three names occur nowhere in it.

**Witness.** `grep -F` on README.md finds no occurrence of `NikulinGenerator.prime`, `Archimedean.SO` or `Archimedean.O`. The README writes `SO(n)` and `O(n)` only as mathematics.

**Repair.**
- In 5B's paragraph on `padicDiscriminant`, name `NikulinGenerator.prime` (the prime at which a generator is primary).
- In 7E's target paragraph, name `Archimedean.SO` and `Archimedean.O` as the abbreviations of `Matrix.specialOrthogonalGroup (Fin n) ℝ` and `Matrix.orthogonalGroup (Fin n) ℝ`.

## R08 (P3) — B4 defines "ambiguous" through a "nonsquare class"

**Location.** README.md:1428: "A nonsquare class satisfying this is called ambiguous".

**Claim.** An ambiguous class is any class with `[𝔞_f]² = 1`, squares included. Read literally, the sentence excludes the principal class, which is a square. But the README itself treats the principal class as ambiguous.

**Witness.** The principal class of `Δ = −23`, the lattice `!![2,1;1,12]`, is `1 = 1²`, yet it has `|O| = 4 = 2w` (README.md:1608). For `A₂`, "the principal class ambiguous" (1605).

**Repair.** Write "In the nonsquare-discriminant branch, a class satisfying this is called ambiguous".

## Verified sound

**Gate, dependencies and build.**
- My gate run gives `outside-folder=9` and `FAIL`, with every other scanner 0; R01 covers it.
- The dependency check prints `depcheck: 237 roadmaps, 2307 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line.
- `lake env lean …/Suggested.lean` exits 0 with 15 `sorry` warnings and no other diagnostic.

**`Suggested.lean` checks.**
- One-tactic probe on a scratch copy, `first | rfl | infer_instance | simp | trivial | decide | aesop`: all 15 theorems fail, so none is padding by that test.
- `#check @` of all 36 declarations, in one scratch file: no binder is lost. The elaborated types match their README statements, for example `exists_genusProperClasses_equiv_doubleCoset` carries `[FiniteDimensional ℚ V]` and `[L.IsNondegenerate]`, and the 7E measures carry `ChartedSpace`, `IsManifold … 1`, `LindelofSpace`, `hf` and `hinj`. Nothing changed.
- No sorry'd data, no `set_option`, a single `import Mathlib` plus existing `TauCeti.*` modules.

**Headline theorems.** Principal results 1–3 are covered:
- 6A is stated twice;
- 4B is stated twice;
- 5A, 5B with its corollary, 5G twice and 5J are stated;
- the genus symbols (3E, 3G) and the spinor-genus group (4C) are named in the docstring as not statable, with what each lacks.

6E and 7E are stated as well. The docstring's native list was checked against From Tau Ceti.

**Library names.**
- 789 backticked tokens scanned. Every identifier resolves at the pins except the supplier names `hasseMinkowski_equivalent` and `equivalent_of_locallyEquivalent` (Global Quadratic Forms `Suggested.lean`:439, on main; Hasse–Minkowski is not native) and `orthogonalBaseChangeReal` and `spinorNorm_reflection` (`Completed/OrthogonalSpinGroups/Suggested.lean`:1025, 420).
- 51 fully qualified `TauCeti.*` names resolve, among them `IsNondegenerate.gaussSum_eq` (`FiniteBilinearModule/GaussSum.lean:536`) and `IntegralLattice.restrict` (`Restriction.lean:71`).
- Opened at the pin:
  - `dyadicCyclic` (`Dyadic/Cyclic.lean:64`, `q(1) = θ/2^{k+1}`) and `oddCyclic` (`OddCyclic/Basic.lean:65`, `q(1) = θ(m+1)/(2m)`), which agree with `realizationDet`;
  - `inducedRiemannianMetric` (`Riemannian/Induced.lean:62`, `C^{n+1}`, so `n := 0` is `C¹`), and `riemannianVolume` with `chartRiemannianVolume` (Haar for `finBasis` weighted by `√det Gram`, basis-independent);
  - `card_specialOrthogonalGroup_of_binaryDiscriminant_neg`, `card_specialOrthogonalGroup_of_isSquare_binaryDiscriminant` (`h₀ : Δ ≠ 0`), `infinite_isometry_of_binaryDiscriminant_pos_of_not_isSquare`, `splitProperClassEquivUnits`, `card_isometry_hyperbolicPlane`, `properMass_eq_two_mul_mass` (finite genus, `0 < finrank`) and `properClassNumber_add_card_eq_two_mul_classNumber`.

**Cross-roadmap citations, resolved.**
- OrthogonalTamagawaAndLatticeMass at its head: §§0.3, 1.1, 1.2, 1.3, 1.4, 2.1, 2.2, 2.3, 3.1, 4.1 and 4.2 exist. Its IntegralLattices citations (§§2C, 2G, 3C, 3F, 3I, 4A–4C, N0–N1, 6C–6G, 7A, 7C, 7E, 7G, B7, B8, 9B) all name labels present here.
- Root Systems §3.1 is "Classification independent of a base", on main.
- DifferentialGeometry 12.1 and 12.4 exist on main (its lines 915, 923). So do Rank-24 lattice constructions Layers 3 and 6, and RepresentationTheory/LieGroups.
- Main and this head carry the same 51 milestone labels, so no cited id is dropped. Labels cited by K3Surfaces, EnriquesSurfacesAndIntegralNonexistence, LatticePackingsAndPerfectForms and GeometryOfNumbersAndQuadraticArithmeticPartII exist here. PeriodsAndSpecialValues cites a "5H" that exists neither here nor on main; that is not caused by this pull request.

**Ownership.**
- No `Suggested.lean` declaration has the fully qualified name of another roadmap's declaration (namespace `TauCetiRoadmap.IntegralLattices`).
- Searches for Nikulin existence, primitive embeddings, indefinite unimodular classification and the genus double coset across the open heads find this folder's own revisions (#1411, #1797, #1187) and consumers only.
- The one shared object found is R04's lemma.

**Sources read at their locators** (certified cache).
- `voight2023`: line 230 (Definition 3.10), line 245 (Lemma 3.12), lines 251–262 (Proposition 3.13(iii), `p² ∣ Q(v)`, `Λ(p, v)`).
- `allcock-gal-mark2016`: line 686 (Theorem 5.1, page 16), lines 849 and 864 (Theorems 6.2 and 6.3, page 20), line 917 (Corollary 6.4, page 21), lines 109–134 (oddity fusion), line 711 (rank-one terms).
- `boya-sudarshan-tilma2003`: lines 643–669 ((6.1)–(6.5), pages 16–17, with `−Tr[λ²] = 2` at (6.3)), line 684 ((6.9), page 17).

**Sample B1–B8.** The theorem numbers, pages, hypotheses and support each locator gives, and where it was checked:
- **B1, B4.** Native. Their declarations were opened above.
- **B2.** Cox Theorem 7.7, page 137, and Cohen §5.2 cover the native dictionary. The target, the sign transport `L ↦ L(−1)`, `f ↦ −f`, is elementary and is checked in the table.
- **B3.** Its split statements are proved here (1343–1345). The nonsquare genus target lacks a locator (R03).
- **B4.** Cox Theorem 3.9, page 50, supports the form side.
- **B5.** Cox Theorems 2.8 and 2.13 (pages 27 and 29) and Cohen §5.6.
- **B6.** Cassels, Chapter 13.
- **B7.** Its inputs are B4 and B5. It is proved here.
- **B8.** Conway–Sloane, equation (1) and §6, with the native counts.

Cox, Cohen, Cassels and Conway–Sloane are not in the cache: see Not verifiable.

**Adversarial table.**

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| B1 `disc N_L = −4 det L`, content, `Δ` | `A₂`; `U`; `!![3,1;1,4]` | `4−16 = −12 = −4·3`, `c = 2`, `Δ = −3`; `N = 2xy`, `4 = −4·(−1)`, `c = 2`, `Δ = 1`; `4−48 = −44`, `c = 1`, `Δ = −44` | holds | none |
| B1 content under sublattices | `⟨2e₁,e₂⟩`, `⟨e₁+e₂,e₁−e₂⟩ ≤ ℤ²` | index 2 and 2; `4x²+y²` (content 1) and `2x²+2y²` (content 2) | holds | none |
| B2 oriented sign clause | `Δ = 12`: `x²−3y²`, `−x²+3y²`, `3x²−y²` | same unoriented ideal `𝒪₁₂`; `x² ≡ 2 (mod 3)` impossible; `(3, √3) = √3·𝒪`, `N(√3) = −3` | holds | none |
| B2 sign transport | `x²+y²`, `−x²−y²` | `disc(−f) = disc f = −4`; `det(−G) = det G` in rank 2; 2 proper classes against `|Pic ℤ[i]| = 1` | holds | none |
| B3 split genus and torus | `Δ = 25`; `Δ = 64` | genera `{1,4}`, `{2,3}`; `(ℤ/5)ˣ/{t² = 1}` of order 2; `(ℤ/8)ˣ² = {1}`: 4 genera, quotient 1 (2 with `{±1}`, wrong) | holds | none |
| B3 principal genus route | `Δ = −20`: `(1,0,5)`, `(2,2,3)` | reciprocity bound `2^{μ−1} = 2`; `[C : C²] = 2`; the lower bound needs `(2,2,3)` representing 3, `(3|5) = −1` against `(1|5) = 1` | statement holds; route incomplete | R03 |
| B3 ring class field | `Δ = −23` | reduced forms `(1,1,6)`, `(2,±1,3)`: `3 = [H : K]` | holds | none |
| B4 `[O : SO]` | `!![4,1;1,6]` | norm-4 vectors `±e₁`; `92a² = 46a`, so `a ∈ {0, ½}`; `|O| = 2` against `2·#𝒪ˣ = 4` | holds | none |
| B4 "ambiguous" | principal class of `Δ = −23` | class `1 = 1²`, `|O(!![2,1;1,12])| = 4 = 2w` | wording false | R08 |
| B4 split and Pell branches | `U`; `⟨1,−2⟩` | `SO = {±1}`, `|O(U)| = 4`; `N(1+√2) = −1`, `N(3+2√2) = 1`, infinite order | holds | none |
| B5 class counts | `Δ = −23`, `−44`, `25` | 3 reduced; `(1,0,11)`, `(3,±2,4)`: 3; `φ(5) = 4` | holds | none |
| B6 points | `Δ = −4`, `12`, `U` | `{±1,±i}`; `±(2+√3)^ℤ` with `N(2+√3) = 1`; `{±1}` | holds | none |
| B7 base of the fibration | `Δ < 0`, norm-one torus | `t = s/s̄ ↦ [𝔞][𝔞̄]⁻¹ = [𝔞]²`; kernel `N(α) = ±1 > 0`, so `α ∈ T(ℚ)`: base `≅ Pic²` | holds | none |
| B7 volumes | `Δ = −4`; `Δ = 12`; `U` | `2π/4 = π/2`; `log(2+√3) ≈ 1.317`; `ℚˣ\𝔸^{×,1} ≅ ℤ̂ˣ`, volume 1 (not `½`) | holds | none |
| B8 masses | `A₂`; genus of `!![4,1;1,6]` | `m⁺ = 1/6`, `m = 1/12 = 1/|O(A₂)|`; `m⁺ = 3/2`, `m = 1/4 + 1/2 = 3/4`, against `h/(2w) = 1/2` | holds | none |
| 4B double cosets (Lean) | `⟨1⟩`; genus of `!![4,1;1,6]`; `V = 0` | 1 point = 1 class; 2 points = `h`, 3 = `h⁺`; singletons on both sides | holds | R04 (route) |
| 4B determinant `−1` | `U` at 2; `⟨1⟩` | reflection in `e − f` (norm `−2`): `e ↦ f`, integral; `−1` | holds | R04 |
| 5A (Lean) | `E₈²`/`D₁₆⁺`; `⟨2⟩⊕⟨−2⟩`/`U(2)`; rank 0 | `(16,0,0)` on both sides: true/true; `q` values `{¼,¾,0}` against `{0,0,½}`: false/false; true/true | holds | none |
| 5B `padicDiscriminant_eq_squareClass_gramDet` | `⟨6⟩` at 3 with `θ = 2`, `5`; `U(2)` at 2; `⟨4⟩` at 2; `⟨6⟩` at 2 | 6/6; `15/6 = 5/2 ≡ 1 (mod 3)`; `−4 = −4`; `4 = 4·1` (`⟨4u⟩` needs `u ≡ 1 (mod 8)`); `q₂ = q_3^{(2)}(2)`, excluded by `hp` | holds | none |
| 5B conditions (Lean) | `⟨6⟩` `(1,0)`, `⟨−6⟩` `(0,1)` at 3; `(8,0,0)`; `(4,0,0)`; `(1,0,q_1^{(2)}(4))` | `6 ≡ 6`; `−6/3 = −2 ≡ 1 (mod 3)` (without `(−1)^{t₋}`: 2, a nonsquare); `E₈`; `4 ≢ 0`; Gauss sum `2e(1/8)`, sign 1, `|A| = 4 = ±4` | holds | none |
| 5B Corollary 1.10.2 (Lean) | `(1,1,0)`; `(2,1,q_1^{(2)}(2))` | `U`; `⟨2⟩ ⊕ U` | holds | none |
| 5G 1.12.2 (Lean) | `S = 0`; `⟨2⟩ ⊂ U` | right side holds iff `8 ∣ l₊ − l₋`; complement `⟨−2⟩` realizes `−q` | holds | none |
| 5G 1.12.4 (Lean) | `(1,0,1,1)`; `(2,0,2,2)`; `S = ⟨2⟩^{t₊}⊕⟨−2⟩^{t₋}` | `⟨2⟩ ↪ U`; `eᵢ + fᵢ` in `U²`; `l − t ≥ l(A_S) = t` gives `2t ≤ l` | holds | none (attribution under Not verifiable) |
| 5G sign of condition 3 | 5B(3) with `−q`, `K(−q) = K(q)(−1)` | `(−1)^{l₋−t₋}|A| ≡ (−1)^{l−t} discr K` ⇔ `(−1)^{l₊−t₊}|A| ≡ discr K` | holds | none |
| 5J (Lean) | `(1;1,0,1)`; `(0;1,1,0)`; `(0;2,0,2)` | `⟨2⟩`; `U`; inadmissible (`2 ≢ 0 (mod 4)`), and no definite even rank-2 det-4 lattice with `δ = 0` | agrees | none |
| 6A (Lean) | `U`/`⟨1⟩⊕⟨−1⟩`; `U⊕E₈⊕E₈(−1)`/`U⁹`; `E₈²`/`D₁₆⁺` | parity separates; `(9,9)` on both sides; definite, so `hind` fails | holds | none |
| 6E (Lean) | Coxeter numbers at equal rank; root counts | `n = 6`: 7, 10, 12; `n = 7`: 8, 12, 18; `n = 8`: 9, 14, 30; `A₃ = D₃` only; `D₁₆E₈`/`E₈³` 720/720; `A₁₇E₇`/`D₁₀E₇²` 432/432 | holds | none |
| 7E (Lean) | `n = 0, 1, 2, 3`; `O(1)`; Frobenius control | 1, 1, `2π`, `2π·4π = 8π²` (BST (6.4)–(6.5)); 2; `E₁₂−E₂₁` has norm `√(½+½) = 1` against `√2`, so `SO(2)` has length `2π` against `2π√2` | holds | none |
| 3E sign walking | `⟨1⟩⊕⟨4⟩ ≅ ⟨5⟩⊕⟨20⟩` | basis `e₁+e₂`, `−4e₁+e₂` (det 5, a unit), norms 5, 20; total oddity 2 and `10 ≡ 2` | holds | none |
| 3E oddity-fusion Check | `⟨1⟩⊕⟨3⟩`; `⟨7⟩⊕⟨2⟩ ≅ ⟨1⟩⊕⟨14⟩` | single term `1_4^{−2}`; `1_7^{+1}2_1^{+1}` against `1_1^{+1}2_7^{+1}`, compartment oddity `8 ≡ 0` on both sides | Check mislabelled | R05 |
| 3G oddity-formula Check | `1_1^{−1}3^{+1}`; `1_5^{−1}3^{+1}` | sign `−` forces `t ≡ ±3`; `5 ≡ −3`, `(2|3) = −1`, `1 + 2 = 3 ≢ 5` | not discriminating | R05 |
| 3C, 4B, 4G Checks | `A₂` at 3; `⟨1⟩⊕⟨1⟩` at 5 and 2; `v = (11,2)` | `12/3 = 4`, units 2 against 1; `K₅⁺ ≅ ℤ₅ˣ ⊊ ℚ₅ˣ`, `a'²+b'² ≡ 2 (mod 8)`; `125 ≡ 0 (mod 25)`, `(3/5,−4/5) = (5,0) − 2v/5` | holds | none |
| 4C | `x²+y²`; `5xy+y²` | `ℤ₂ˣ/⟨5⟩(ℤ₂ˣ)²` of order 2 against `[C : C²] = 1`; `G = ℤ/4`, `G[2]G² = {±1}`: 2 and 2 | holds | none |
| 3I exponents | `U`, `⟨1⟩`, `⟨2⟩`, `⟨1⟩⊕⟨2⟩` | `N = 2, 1, 2, 2`; `U`: `2·2^{r+1}` solutions, `2^{−r}·2^{r+2} = 4`; `⟨2⟩`: `x² ≡ 1 (mod 2^{r−1})`, 8 | holds | none |
| 7C | `U` at 3; `⟨1⟩⊕⟨1⟩` | `ε = ((−1)(−1)|3) = 1`, `2(1−⅓) = 4/3`; `∏(1 − χ₋₄(p)/p) = 4/π` | holds | none |
| 6D basis Check | `D₁₅ + h`; `A₁₅ + h` | `4(4 − 15/4) = 1`, minors `4, 8, …, 60, 1`; `16(4 − 15/16) = 49` | holds | none |
| 1G, 1H Checks | `u`, `v` at `2`; `oddCyclic 3 θ` | values `{0,0,½}`, `{½,½,½}`, Gauss sums 2 and −2, signs 0 and 4; `q(1) = 2/3`, `1/3`, sums `−i√3`, `i√3`, signs 6 and 2 | holds | none |
| 1G odd refinement | `q(x) = ((n+1)/2)·b(x,x)` | polar `(n+1)b = b`; `n·q = 0` | holds | none |

## Not verifiable

- **Cox, *Primes of the form x² + ny²*.** Theorems 2.8, 2.13, 3.9 and 7.7 (pages 27, 29, 50 and 137) are cited for B2, B4, B5 and B7. The book is paywalled and not in the manifest. A web search found no legal copy and no table of contents that confirms the numbering, so the pages are unchecked.
- **Cohen, GTM 138, §§5.2 and 5.6.** Uncertified in the manifest; not read.
- **Cassels, *Rational Quadratic Forms*, Chapter 13** (B4, B6), and **Cassels, *Geometry of Numbers*, Chapter VIII** (2F). Not read.
- **Conway–Sloane, mass formula paper.** Waived in the manifest; not read.
- **Kawauchi–Kojima.** Uncertified; not read.
- **Nikulin (1979/1980).** Not in the cache. Whether Theorem 1.12.4 is an "iff" or only a sufficient condition is unconfirmed. The iff stated in `Suggested.lean` is true, with necessity shown in the table above.
- **Other texts.** O'Meara, Serre, Milnor–Husemoller, Cho, Gan–Yu, Wall, van der Blij and SPLAG were not read.

## Source issues

- none
