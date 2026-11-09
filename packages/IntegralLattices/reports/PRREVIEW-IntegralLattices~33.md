# Review of IntegralLattices (pull request #1411 at 8878bc5)

**Verdict:** needs changes

Full review. The folder changed by 2342 lines since `26b1788`. Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. Paths under `TauCeti/` are in the pinned Tau Ceti package; `README.md` and `Suggested.lean` mean the files in `TauCetiRoadmap/IntegralLattices/`.

## R01 (P2) — B5: the indefinite target uses the wrong reduced forms and leaves out the cycle–class theorem

- **Location.** `README.md:1478–1484`: "Lagrange reduced forms `lagrangeReducedForms` for nonsquare `Δ` … The target of this milestone is the `Δ > 0` structure: the reduced forms fall into finitely many cycles under the continued-fraction step (Cohen, §5.6)". The *Needs* line says "the native Lagrange reduction".
- **Claim.**
  - For `Δ > 0` the only reduced forms this README defines are the Lagrange-reduced ones (`|b| ≤ |a| ≤ |c|`). The reduction step does not permute them; the cycles are cycles of Gauss-reduced forms (`0 < b < √Δ`, `|√Δ − 2|a|| < b`), which the README never defines.
  - Any permutation of a finite set has finitely many cycles. So the target as written does not give the "explicit finite list of classes" that 4E and B7 read off it. That needs the theorem that two reduced forms are properly equivalent exactly when they lie in one cycle, and that theorem is not stated.
- **Witness.** At `Δ = 12` the primitive Lagrange-reduced forms are `(±1, 0, ∓3)`. The Gauss-reduced forms are `(1,2,−2), (−2,2,1)` and `(−1,2,2), (2,2,−1)`: two cycles, matching `#NarrowPic 𝒪₁₂ = 2`. The two sets are disjoint.
- **Repair.**
  - Define Gauss-reduced indefinite forms and the reduction step `ρ` in B5.
  - State the target as follows. `ρ` permutes the primitive Gauss-reduced forms of discriminant `Δ`; every proper class contains one of them; and two of them are properly equivalent exactly when they lie in one `ρ`-cycle. Through B2, the cycles are therefore in bijection with `NarrowPic 𝒪_Δ`.
  - In *Needs*, keep `exists_finset_forall_exists_smul_mem` for finiteness only, and add this reduction.
  - Add two Checks: `Δ = 12` (two cycles, as above) and `Δ = 8` (one cycle `(1,2,−1), (−1,2,1)`, since `1 + √2` has norm `−1`).

## R02 (P3) — B3: the principal-genus route relies on a count that reciprocity only bounds, has no locator, and omits the native field case

- **Location.** `README.md:1341–1344`: "The kernel is exactly `C²` because the number of genera, the size of the image, which quadratic reciprocity computes, equals `[C : C²] = #C[2]`, the number of ambiguous classes, which are counted through the ambiguous forms of B4."
- **Claim.**
  1. Reciprocity only puts the image inside the subspace cut out by the character relation, so it gives an upper bound. Equality needs every allowed character tuple to be realized, and no input for that is named.
  2. B4 gives the ambiguity criterion for a single class, not the count `#C[2] = 2^{μ−1}`.
  3. Gauss's theorem has no locator.
  4. The case of a fundamental discriminant is native and is not cited.
- **Witness.** At `Δ = −20` the reduced forms `(1,0,5)` and `(2,2,3)` represent `{1,4}` and `{2,3}` mod 5. Reciprocity alone allows at most 2 genera; exhibiting the second needs `(2,2,3)` or a prime `≡ 2, 3 (mod 5)`. The native result is `isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one` (`TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/PrincipalGenus.lean:150`).
- **Repair.**
  - Write the route in three steps:
    1. Reciprocity bounds the number of genera.
    2. Every allowed tuple is realized, by Mathlib's `Nat.forall_exists_prime_gt_and_eq_mod` (`Mathlib/NumberTheory/LSeries/PrimesInAP.lean:443`).
    3. `#C[2] = 2^{μ−1}` is Gauss's count of ambiguous classes, proved as a step of this milestone.
  - Name all three in *Needs* and in the B3 row.
  - Add a locator: Cox, §3.B, Theorem 3.15 (uncertified).
  - Add a §*From Tau Ceti* row for the native field case: `isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one`, `exists_genusCharFunElementaryTwoQuotientFamilyLinearMap_eq` (`…/GenusCharacter/Independence.lean:97`) and `natCard_narrowClassGroup_sq_eq_one_eq_two_pow` (`…/Quadratic/AmbiguousClassNumber.lean:133`). Say in one clause that B3 extends them to non-maximal orders and to the lattice genus.
  - The copy of this folder at #617's head already carries this repair (its README around lines 1367–1375, 1684 and 3288). Take it from there rather than restating it (R11).

## R03 (P3) — 3D and 3E do not use Tau Ceti's native 2-adic moves

- **Location.** `README.md:957–959`: "The theorem is that two symbols describe isometric lattices exactly when sign walking and oddity fusion relate them". §*From Tau Ceti* (rows 442–505) has no row from `TauCeti/NumberTheory/Padics/BilinearForm/`, and `README.md` never mentions that directory.
- **Claim.** The pin already proves the elementary moves that the 3E calculus is built from, and also the 3D and 3E Checks themselves. Neither milestone cites them, so an implementer is sent to prove them again.
- **Witness.** The native moves are:
  - `equivalent_toBilin'_diagonal_two_pow_mul_iff` (`Padics/BilinearForm/BinaryDiagonal.lean:92`): fusion at gap 1, which gives `⟨1⟩⊕⟨14⟩ ≅ ⟨7⟩⊕⟨2⟩`;
  - `equivalent_toBilin'_diagonal_four_mul_five_mul` (`BinaryDiagonal.lean:139`): `⟨a,4b⟩ ≅ ⟨5a,20b⟩`, which is the 3D Check at `a = b = 1`;
  - `…_iff_of_three_le` (`BinaryDiagonal.lean:160`);
  - mixed-type walking: `MixedSignWalking/Basic.lean:164, 175` and `MixedSignWalking/EvenLower.lean:90, 101`.
- **Repair.**
  - Add a §*From Tau Ceti* row for these moves, together with `not_exists_orthogonal_basis_hyperbolic_padicInt_two` (`Padics/BilinearForm/Basic.lean:40`) and `IsSymm.equivalent_iff_two_dvd_iff_and_isSquare_det_mul_det_and_eight_dvd` (`Padics/BilinearForm/Unimodular.lean:69`).
  - Name the moves in the *Needs* lines of 3D and 3E.
  - State 3E's target as two results that consume the moves:
    - the converse: isometric lattices have symbols related by these moves (Allcock–Gal–Mark, Theorem 6.2, "only if");
    - the canonical form (Allcock–Gal–Mark, Corollary 6.4).

## R04 (P3) — 6F is native apart from a one-line coset identity

- **Location.** `README.md:2435–2438`: "the native `typeE₈IsometryD8Plus` is that isometry for the spinor coset of `D₈`, and the milestone identifies the coordinate model above with `D₈⁺`". The Dependencies row reads "6F | L 0G, 2B".
- **Claim.** The pin has both the isometry from the Cartan model to `D₈⁺` and the description `D₈⁺ = D₈ ∪ (h + D₈)`. The only thing left is the coset identity `h + D₈ = {x ∈ (ℤ+½)⁸ : ∑x ∈ 2ℤ}`, which is not a milestone.
- **Witness.**
  - `typeE₈IsometryD8Plus : Isometry typeE₈RootLattice (checkerboardPlusLattice 8 _)` (`TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.lean:292`).
  - `mem_checkerboardPlusCarrier_iff` (`RootLattice/TypeD/Plus.lean:72`): `x ∈ D_n⁺ ↔ x ∈ D_n ∨ x − h ∈ D_n`.
  - `∑h = 4`, so the coset identity holds.
- **Repair.** Mark 6F native and cite both declarations in §*From Tau Ceti* and in the 6F row (setting it to "native"). Keep `∑(h + d) = 4 + ∑d` as a Check.

## R05 (P3) — 7C's stabilizer-index target is a tautology, and the lemma 4B needs is not a target

- **Location.**
  - `README.md:2693`: "`[K_p(L) : K_p⁺(L)] = 2` exactly when `K_p(L)` contains an element of determinant `−1`."
  - `README.md:1807–1808`: "In positive rank every `K_p(L)` contains an element of determinant `−1` (a reflection in a vector of least valuation)".
- **Claim.**
  - The 7C statement holds for every subgroup of `O(V_p)`: the determinant maps a subgroup onto `{±1}` exactly when the subgroup has such an element.
  - The substantive fact is used by the proper bijection of 4B and by the docstring of `exists_genusProperClasses_equiv_doubleCoset`. It appears only in a parenthesis, and "least valuation" does not say what the valuation is of.
- **Witness.** Take `U` over `ℤ₂`. The vector `v = e + f` has `β(v,v) = 2`, which generates `𝔫(U)`, and `s_v(e) = −f`: the reflection is integral of determinant `−1`. The primitive vector `e` has norm 0 and gives no reflection.
- **Repair.**
  - Replace the 7C bullet by a target in N0. For `L_p` of positive rank, every `v` with `β(v,v)ℤ_p = 𝔫(L_p)` gives `s_v ∈ K_p(L)` of determinant `−1`, because `2β(x,v) ∈ 2𝔰 ⊆ 𝔫`. Hence `[K_p(L) : K_p⁺(L)] = 2` at every `p`, `p = 2` included; in rank 0 the index is 1.
  - Add `U` over `ℤ₂` as a Check, and cite the new target from 4B. #617's copy has this as an N0 target.

## R06 (P3) — N1 Check: the "wrong model" agrees with the right one in rank 2

- **Location.** `README.md:1723–1724`: "`p` odd, `L_p` unimodular of rank `≥ 2`: `H_p(L) = ℤ_pˣ(ℚ_pˣ)²`, of order 2, the native value; a definition through the full group `SO(V_p)` would give all of `ℚ_pˣ/(ℚ_pˣ)²`, of order 4".
- **Claim.** For a binary space, `θ(SO(V_p))` is the norm group of `ℚ_p(√−det)`. When `−det` is a nonsquare unit, that group is exactly the unit square classes, so the Check does not separate the two definitions. The README says as much itself in 4C (`README.md:1870–1872`).
- **Witness.** Take `L = ⟨1⟩ ⊕ ⟨1⟩` at `p = 3`. `SO(V₃)` is the norm-one torus of the unramified `ℚ₃(i)`, so its spinor norms have even valuation: they form `{1, 2}·(ℚ₃ˣ)²`, of order 2, which is `H₃(L)`.
- **Repair.** State the Check for rank `≥ 3` or for isotropic `V_p`, where `θ(SO(V_p))` has order 4: for example `⟨1⟩³` at `p = 3`, or `⟨1⟩ ⊕ ⟨−1⟩` at any odd `p`. Add `⟨1⟩ ⊕ ⟨1⟩` at `p = 3` as the case in which the two definitions agree.

## R07 (P3) — Layer B: an undefined term, a wrong witness, and Checks that miss B2's target

- **Location.**
  - `README.md:1435`: "A nonsquare class satisfying this is called ambiguous".
  - `README.md:3152`: "`⟨1, −2⟩`: content 1, `Δ = 8`, `ℤ[√2]`, infinite `O(L)` from the unit `1 + √2`."
  - B2's Checks, `README.md:1315–1320`.
- **Claim.**
  - (a) "Nonsquare class" is defined nowhere. Line 1464 also calls the split class of `U` ambiguous, which the wording excludes.
  - (b) `1 + √2` has norm `−1`, so it is not in `SO(L) ≅ {u : N(u) = 1}`; multiplying by it negates the form.
  - (c) B2's only target is the sign transport `L ↦ L(−1)`, `f ↦ −f`, and none of its three Checks exercises it.
- **Witness.**
  - (b) `N(1+√2) = 1 − 2 = −1`, and `SO(⟨1,−2⟩) = {±(3+2√2)^k}`.
  - (c) The Checks at `Δ = −3`, `12` and `1` all start from positive definite or indefinite forms.
- **Repair.**
  - (a) Write: "a class with `[𝔞]² = 1`, or the split class of B2 when `Δ` is a square, is ambiguous".
  - (b) Write: "from the norm-one unit `(1+√2)² = 3 + 2√2`".
  - (c) Add a Check: at `Δ = −4`, `−x² − y² ↦ x² + y²`, one negative and one positive proper class; without the twist, `−x² − y²` lies outside `PosDefProperClass`.

## R08 (P3) — 7E's suppliers are missing from §*Exact supplier contracts*

- **Location.** `README.md:2847–2849`: "*Needs:* … T `inducedRiemannianMetric`, `riemannianVolume`; R RepresentationTheory/LieGroups finite-dimensional matrix Lie groups; R DifferentialGeometry 12.1 and 12.4".
- **Claim.**
  - `Suggested.lean` builds 7E on these two Tau Ceti declarations (lines 534, 539, 562, 567), but §*From Tau Ceti* has no row for them.
  - Neither roadmap has a row in §*From other roadmaps*.
  - LieGroups is cited without a section.
- **Witness.**
  - `TauCeti/Geometry/Manifold/Riemannian/Induced.lean:62` (`inducedRiemannianMetric`) and `…/Riemannian/VolumeDensity/Volume.lean:82` (`riemannianVolume`).
  - DifferentialGeometry on main has 12.1 at README 915 and 12.4 at README 923.
  - The supplier rows (`README.md:533–536`) list neither roadmap.
- **Repair.**
  - Add a T row with both files.
  - Add an R row for DifferentialGeometry 12.1 and 12.4.
  - For LieGroups, either add an R row naming the layer actually consumed, or drop it: the theorem assumes a `C¹` charted structure in which the coordinate map is an immersion, so the statement itself does not need it.

## R09 (P3) — Dependency rows contradict the supplier contracts

- **Location.**
  - `README.md:536`: the "6C, 6G | Root Systems | Layer 3 §3.1 …" row.
  - `README.md:1634`: "B7 | … R Restricted Products `RestrictedProductGroup`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal`".
  - `README.md:2276`: "5B | L 1G, 1H, 3C, 3D, 5A".
- **Claim.**
  - The Dependencies table marks 6C and 6G "native; no prerequisites here" (lines 2503, 2507), yet the Root Systems row names them as consumers and line 3310 says 6C "needs Root Systems".
  - B7's R names are Tau Ceti declarations (row 477), and B7 has no *Needs:* line.
  - The 5B construction (`README.md:2039–2052`) uses N0's reconstruction, the realization theorem of Global Quadratic Forms and `hilbertSymbol_productFormula`, none of which is in its row. The Global Quadratic Forms supplier row does not name the realization theorem.
- **Witness.**
  - `TauCeti/Topology/Algebra/RestrictedProduct/Basic.lean:59` (`RestrictedProductGroup`), `:260` (`CompactOpenSubgroups`), and `Diagonal.lean:62` (`rationalDiagonal`).
  - The realization theorem is `exists_globalForm_of_isAdmissible`, Global Quadratic Forms `Suggested.lean:516` on main.
- **Repair.**
  - Delete the Root Systems row and the clause at line 3310, or name a target that consumes Root Systems.
  - Relabel B7's names T and add a *Needs:* line to B7.
  - Add L N0, R Global Quadratic Forms `exists_globalForm_of_isAdmissible` and T `hilbertSymbol_productFormula` to the 5B row, and add the theorem to the Global Quadratic Forms supplier row.

## R10 (P3) — Three `Suggested.lean` declarations are not named in the README

- **Location.** `Suggested.lean:168` (`NikulinGenerator.prime`), `504` (`abbrev SO`) and `507` (`abbrev O`), the last two in namespace `Archimedean`.
- **Witness.** `grep -c` on `README.md` returns 0 for `NikulinGenerator.prime`, `Archimedean.SO` and `Archimedean.O`.
- **Repair.**
  - In 5B's `padicDiscriminant` paragraph, name `NikulinGenerator.prime`: the prime at which a generator is primary, used to pick out the `p`-primary generators.
  - In 7E's target paragraph, name `Archimedean.SO` and `Archimedean.O` as the abbreviations of `Matrix.specialOrthogonalGroup (Fin n) ℝ` and `Matrix.orthogonalGroup (Fin n) ℝ`.

## R11 (P3) — The branch conflicts with main in both files, and the description names no order with #617 and #1797 (previous R08)

- **Location.** The merge-order paragraph of the pull request description, and `git merge-tree --write-tree origin/main HEAD`.
- **Claim.**
  - Since this branch's merge base `eaf17b1`, main (`1bea835`) has taken `47fc6a3` (#1239) into this folder.
  - Two other open pull requests also carry this folder:
    - #617 has a divergent revision: about 240 diff lines against this head, including the repairs asked for in R02 and R05;
    - #1797 carries main's text.
  - The description, which is about ClassFieldTheory, names neither in connection with this folder.
- **Witness.**
  - `git merge-tree` reports "CONFLICT (content): Merge conflict in TauCetiRoadmap/IntegralLattices/README.md" and the same for `…/Suggested.lean`.
  - `roadmaps overlaps IntegralLattices` reports "#617 and #1411 conflict in … IntegralLattices/README.md" and "#1411 and #1797 conflict in …".
- **Repair.**
  - Rebase onto main, resolving toward this head.
  - State in the description which of #617 and this pull request carries the folder, and that the other rebases onto it. Take #617's B3 and N0 text rather than restating it.
  - Name #1797, which carries main's text, as rebasing onto whichever pull request carries the folder.

## Previous findings (review of `26b1788`)

- **R01 — repaired.** `Suggested.lean` now states only 4B (two theorems), 5A, 5B (three), 5G (two), 5J's sufficiency half, 6A (two), 6E (two) and 7E (two). The docstring (lines 52–98) lists the seven one-term closures as native. My one-tactic probe fails on all 15.
- **R02 — repaired.** `README.md:509–515` now reads "The milestones 1H, 1I, 1L, 2F, 2G, 3A, 3B, 3C, 3F, 4A, 4E, 4F, 4G, 6B, 6C, 6D, 6G, 6H, 7A, 7G in ranks 0 and 1 and 9B are likewise native". Rows 485–503 name the declarations. The sentences "proved here from Layer B" and "is the successor's" for native results are gone. Two native items remain uncited; they are R03 and R04 here.
- **R03 — repaired.** `Suggested.lean:123–130`: "proved in Tau Ceti at the pin … `posDefProperClassEquivPic`, `properClassEquivNarrowPic` … `posDefProperClassEquivGal`".
- **R04 — repaired.** The 3G row (1155) reads "T `hilbertSymbol`, `hilbertSymbol_productFormula`, `TauCeti.ClassFieldTheory.hilbertProductFormula`". Row 504 covers both product formulas, and `NumberFieldOrder.finite_narrowPic` is in row 478.
- **R05 — repaired.** `README.md:960–962`: "(Theorems 6.2 and 6.3, p. 20, and Corollary 6.4, p. 21, there, … with Theorem 5.1, p. 16, for the unimodular constituents". Checked at `allcock-gal-mark2016` lines 686, 849, 864 and 917.
- **R06 — repaired.**
  - `README.md:1984–1985`: "adjust it to `β(v, v) ≡ 0 (mod p²)` … and to `β(v, v) ≡ 0 (mod 2p²)` when `L` is even".
  - Lines 2000–2002: "`125 ≡ 0 (mod 25)` … indeed `125 ≡ 25 (mod 50)`".
  - The decidable-check item is gone.
- **R07 — repaired.** `README.md:1827–1831` moves the Check to `p = 5` ("`SO(V_5) ≅ ℚ_5ˣ` is not compact while `K_5⁺(L) ≅ ℤ_5ˣ`") and proves the equality at 2.
- **R08 — not repaired.** It is R11 above, and the conflict now includes `Suggested.lean`.
- **R09 — repaired.** `Suggested.lean:442–460` states both 6A theorems on `L : IntegralLattice V`, `M : IntegralLattice W` with `IsUnimodular`, `IsEven`, `IsIndefinite` and `signature`.

## Verified sound

**Gate, dependency check, build, signatures and probe.**
- **Worker's gate.** Every scanner is 0, including `build=0` and `depcheck=0`.
- **My run of the gate (`--base origin/main`).** `outside-folder=5`; all five files are in `TauCetiRoadmap/ClassFieldTheory/` and `TauCetiRoadmap/QuadraticFormInvariants/`, which are this pull request's own folders, each reviewed separately. Every other scanner is 0.
- **The one other changed file.** `Completed/LocalGaloisGroups/Suggested.lean` (4 lines) is in the configuration's `outside_folder_allow`, and it is ClassFieldTheory's consumer adaptation.
- **Dependency check.** Output: `depcheck: 236 roadmaps, 2287 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Build.** `lake env lean TauCetiRoadmap/IntegralLattices/Suggested.lean` exits 0 with 15 warnings, all "declaration uses `sorry`".
- **Signatures.** I elaborated all 36 `#check @name` (0 errors) on a copy identical to this head and compared each type with its README statement. Generality matches, and no binder is lost: 6A is "in any two ambient spaces", 5G carries `S.sigPos ≤ lp`, and both 4B theorems carry `[L.IsNondegenerate]`. The classes version of 4B omits `[FiniteDimensional ℚ V]`, which `isLattice` implies, so no change is needed.
- **Padding probe.** I replaced each `sorry` by `first | rfl | simp | infer_instance | decide | omega | aesop`; all 15 fail. No statement restates a definition or mirrors a Check.

**Names and citations.**
- **Backticked names.** I checked 729 backticked identifier-like tokens. Every Lean name among them resolves: in Mathlib or Tau Ceti at the pins, in `Suggested.lean`, or in Global Quadratic Forms `Suggested.lean` (`hasseMinkowski_equivalent` at 439, `equivalent_of_locallyEquivalent` at 544) and Orthogonal and Spin Groups `Suggested.lean` (`spinorNorm_reflection` at 420, `orthogonalBaseChangeReal` at 1025) on main. The remaining tokens are notation (`A_L`, `T_L`, …) or roadmap names. The 13 "found nowhere" leads of `roadmaps resolve` on this README are all `Suggested.lean` declarations. Hasse–Minkowski is not native at the pin, so that R row is correct.
- **Sections resolved on main.**
  - Global Quadratic Forms 6.3 (its README 723); Orthogonal and Spin Groups 0C, 2C and 2F (368, 684, 717).
  - Root Systems Layer 3 §3.1 (687); Restricted Products Layers 0–3 (248, 268, 305, 361); Global Number Fields Layer 11 (571).
  - DifferentialGeometry 12.1 and 12.4 (915, 923).
  - Theta Series: it consumes 6D (980); its Layers 1, 2 and 8 are at 423, 484 and 942.
  - Rank-24 lattice constructions Layers 3 and 6 (223, 312).
- **OTM at its head (#1222).** §§0.3, 1.1–1.4, 2.1–2.3, 3.1, 4.1 and 4.2 all exist. Its scope (its README 9) assigns 2G, 6C–6E, 6G, 7A, 7G, B8 and 9B to this roadmap.
- **Library declarations opened** (each name checked at the stated line):
  - `Mass.lean:154, 221`; `ReducedGram.lean:88–91`; `TwoElementary.lean:81, 285, 303`; `Padics/BilinearForm/BinaryDiagonal.lean:92, 139, 160`; `MixedSignWalking/Basic.lean:164, 175`.
  - `D8Plus/Isometry.lean:292`; `TypeD/Plus.lean:72`; `ClassNumber.lean:81, 133`; `SmallRankUnimodular.lean:407`; `RepresentationNumber.lean:179`.
  - `Niemeier.lean:111, 200`; `RootSystems.lean:216`; `Leech/Minimum.lean:189`; `Stabilizer.lean:97, 168`; `IndefiniteIsometry.lean:124`; `Unit.lean:59`; `WeylGroup.lean:210, 272`; `E8Genus.lean:65`.
  - `EulerProduct.lean:145`; `Induced.lean:62`; `Volume.lean:82`; `PrincipalGenus.lean:150`; `Independence.lean:97`; `AmbiguousClassNumber.lean:133`.
  - The adelic spinor norm files (`AdelicSpinorNorm/Basic.lean:62–75`) and the generator definitions (`OddCyclic/Basic.lean:65`, `Dyadic/Cyclic.lean:64`, `Dyadic/RankTwo/Basic.lean:68, 154`). These confirm that `realizationDet` matches the generators: `⟨θpᵏ⟩` has `b = θ/pᵏ`, `⟨θ2ᵏ⟩` has `q = θ/2^{k+1}`, `2ᵏU` has `q = x₁x₂/2ᵏ`, and `2ᵏ·!![2,1;1,2]` realizes `v⁽²⁾(2ᵏ)`.
- **Ownership against open work.**
  - The consumers K3Surfaces (#1285, its README 190), FourManifolds (#936, 811 and 3089), EnriquesSurfaces (#1286, 246 and 259) and PeriodsAndSpecialValues (#1496, 1590) cite this roadmap's 5G, 5J and 6A.
  - LatticePackingsAndPerfectForms (#1723, 144–145) leaves the lattice arithmetic here.
  - I found no second owner of 4B, 5A–5J, 6A, 6E or 7E.
- **Overlaps.** No id cited here is dropped by an open pull request, and none is defined only by an open revision. The 51 milestone ids (1G … 9B, with N0 and N1) are the same on main and at this head.

**Seeded sample B1–B8 and sources.**
- B1, B4 and the Δ < 0 part of B5 are native, and their values are recomputed in the table.
- B2's narrow-class test is native (`narrowPicClass_discrimTwelvePositiveLeading_ne_negative`).
- B3's split branch, B6, B7 and B8 hold on every instance tried. The defects in B3, B5 and B7 are R02, R01 and R09 respectively.
- Sources read in the cache:
  - `allcock-gal-mark2016`: line 686 (Theorem 5.1, p. 16), 760 (Lemma 5.2, pp. 17–18), 849 (Theorem 6.2, p. 20), 864 (Theorem 6.3, p. 20), 917 (Corollary 6.4, p. 21);
  - `voight2023`: line 230 (Definition 3.10), 245 (Lemma 3.12), 251–262 (Proposition 3.13(iii), `p² ∣ Q(v)`);
  - `boya-sudarshan-tilma2003`: lines 638–684 (§6, (6.1)–(6.5) on pp. 16–17 with `−Tr[λ²] = 2` at (6.3), and (6.9)).

**Adversarial table.** Values were computed in exact arithmetic or by brute force in scratch scripts (local density counts mod `pʳ`, integral automorphisms of 2×2 Gram matrices, reduced forms, Gram determinants).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| B1 norm form, content, Δ (native) | `A₂`; `⟨2e₁,e₂⟩ ≤ ℤ²`; `⟨e₁+e₂,e₁−e₂⟩` | `2x²−2xy+2y²`, content 2, Δ = −3, `disc N = −12 = −4·3`; `4x²+y²` content 1; `2x²+2y²` content 2 | pass | none |
| B2 oriented narrow map; sign transport | Δ = 12 `(1,0,−3)`, `(−1,0,3)`; Δ = −4 | both `𝔞 = ℤ+√3ℤ`; the second sent to `√12·𝒪 = 2√3·𝒪`, `N(√3) = −3`, nontrivial in NarrowPic (`N(2+√3) = +1`); `−x²−y² ↦ x²+y²` | pass; no Check on the transport | R07 |
| B3 genus = coset of `C²` | Δ = −20; Δ = −23 | `(1,0,5)` → {1,4}, `(2,2,3)` → {2,3} mod 5: 2 genera = `[C:C²]` = 2; Δ = −23: `C = ℤ/3 = C²`, one genus of 3 proper classes | true; route gap | R02 |
| B3 split branch | m = 5, 8 | 4 classes; genera {1,4},{2,3}; `(ℤ/5)ˣ/{±1}` order 2; m = 8: 4 genera, torus trivial, `{±1}` would give 2 | pass | none |
| B4 `|O|`, `|SO|` (native) | `A₂`, `I₂`, `U`, `[[4,1],[1,6]]`, `[[2,1],[1,12]]`, `[[3,1],[1,4]]` | brute force: 12,6; 8,4; 4,2; 2,2; 4,2; 2,2 | pass | R07 (wording) |
| B5 reduced forms, Δ < 0 (native) | Δ = −3, −4, −23, −44 | `(1,1,1)`; `(1,0,1)`; `(1,1,6),(2,±1,3)`; primitive `(1,0,11),(3,±2,4)`, non-primitive `(2,2,6)` | pass | none |
| B5 indefinite target | Δ = 12, 8 | Lagrange `(±1,0,∓3)` vs Gauss `(1,2,−2),(−2,2,1)` and `(−1,2,2),(2,2,−1)`, 2 cycles; Δ = 8: one cycle `(1,2,−1),(−1,2,1)` | misstated | R01 |
| B6 `T_L(ℤ)` | `x²+y²`, `x²−3y²`, `U` | `{±1,±i}` (w = 4); `±(2+√3)^k`; `{±1}` | pass | none |
| B7 quotient volumes | Δ = −4, 12; `U` | `2π/4 = π/2`; `log(2+√3) ≈ 1.317`; `ℤ̂ˣ` volume 1, full quotient infinite | pass | R09 (row) |
| B8 `m⁺ = h⁺/w`, `m = h⁺/(2w)` | `A₂`; genus of `[[4,1],[1,6]]` | w = 6, h⁺ = 1: 1/6, 1/12 = 1/`|O(A₂)|`; w = 2, h⁺ = 3, h = 2: `1/4+1/2 = 3/4`, while `h/(2w) = 1/2` | pass | none |
| 4B classes ↔ double coset | `⟨1⟩`; genus of `[[4,1],[1,6]]`; `M = L`, `g = 1` | `K_p = O(V_p) = {±1}`: 1 point; 2 points = h; `LocallyCarries L L 1` holds, so the constraint `e(cls L) = [1]` is non-vacuous | pass | none |
| 4B proper version | same; `⟨1⟩⊕⟨1⟩` at 5 | 3 points = h⁺; `K₅⁺ ≅ ℤ₅ˣ ≠ SO(V₅) ≅ ℚ₅ˣ`, one point | pass | R05 (lemma) |
| 5A `sameGenus_iff_of_isEven` | `E₈²`/`D₁₆⁺`; `⟨2⟩`/`⟨10⟩` | `(16,0,0)` and `A = 0` for both, agreeing with native `sameGenus_e8PowLattice_checkerboardPlusLattice`; `|A|` = 2 vs 10, no isometry, determinants differ | pass | none |
| 5B `padicDiscriminant_eq_squareClass_gramDet` | `⟨6⟩` at 3 (θ = 2); `2·[[2,1],[1,2]]` at 2; `⟨2⟩`,`⟨10⟩` at 2 | `realizationDet` 6 = `gramDet` 6; `dyadicV 1`: 3·4 = 12 = `gramDet`; ratio 5 is a nonsquare, excluded by `HasCyclicTwoSummand` | pass | none |
| 5B `exists_evenLattice_iff` | `(1,0,q₁⁽²⁾(2))`; `(1,0,q₁⁽³⁾(3))`; `(0,2,q₁⁽³⁾(3))`; `(0,0,0)`; `⟨6⟩` | sign 1 = 1, condition 4 off; Gauss sum `−i√3` → sign 6 ≠ 1, and no `⟨2a⟩` has `|A| = 3`; `−2 ≡ 6`, realized by `A₂(−1)`; `0 ≡ 0`, conditions 3 and 4 live with `1 = 1`; `⟨6⟩`: `7 + 2 ≡ 1`, condition 3 `6 ≡ 6` | pass | none |
| 5B `exists_evenLattice_of_lt` | `(0,2,q₁⁽³⁾(3))` | `1 < 2`, `−2 ≡ 6`, realized by `A₂(−1)` | pass | none |
| 5G `exists_primitiveEmbedding_iff` | `S = ⟨2⟩`, `(l₊,l₋) = (1,1)` | `e+f ∈ U`; complement `⟨−2⟩` with `q = −1/4 = −q_S` | pass | none |
| 5G `forall_exists_primitiveEmbedding_iff` | `(0,0,l₊,l₋)`; `(1,0,1,1)`; `(5,0,8,0)` | iff `l₊ ≡ l₋ (8)` (`E₈^k`, `U^a⊕E₈(±1)^k`); `⟨2d⟩ ⊂ U`; `⟨2⟩⁵ ⊄ E₈`: complement rank 3 < `l = 5`, and 10 > 8 | pass | none |
| 5J sufficiency | `(0;4,0,0)`, `(1;3,0,1)`, `(1;4,0,2)`, `(0;4,0,4)`; `(1;1,0,1)`, `(0;1,1,2)`, `(0;8,0,0)` | fail exactly clauses 4, 5, 6, 7; realized by `⟨2⟩`, `U(2)`, `E₈` | pass | none |
| 6A even | `U⊕E₈⊕E₈(−1)` vs `U⁹`; `E₈²` vs `D₁₆⁺` | `(9,0,9)` both; the second pair is not indefinite, so excluded | pass | none |
| 6A odd | `U⊕⟨1⟩` vs `I_{2,1}`; `U` vs `⟨1⟩⊕⟨−1⟩` | both odd, `(2,0,1)`; parity hypotheses exclude the second pair | pass | none |
| 6E rows | `D₁₆E₈`/`E₈³`; `A₁₇E₇`/`D₁₀E₇²` | `480+240 = 720 = 3·240`; `306+126 = 180+252 = 432`; component multisets differ | pass | none |
| 6E Leech | any row | `vectorsOfNorm 2` empty for Leech, against ≥ 48 roots in `N_r` | pass | none |
| 7E `soEuclideanMeasure_univ` | n = 0, 1, 2, 3 | 1; 1; `2π` (`R(θ)` has unit speed after division by `√2`); `8π²` (BST (6.5)); the Frobenius metric would give `2π√2` | pass | none |
| 7E `oEuclideanMeasure_eq_orthogonalGroupMeasure` | n = 0, 1, 2 | `dirac 1`; counting measure 2; `4π = 2·2π` | pass | none |
| 3D/3E moves | `⟨1⟩⊕⟨4⟩`; `⟨1⟩⊕⟨14⟩` | basis `(1,1),(−4,1)`: `diag(5,20)`, det 5; basis `(1,1),(−14,1)`: `diag(15,210)`, det 15, `15 ≡ 7`, `105 ≡ 1 (mod 8)`; both native | pass | R03 |
| 6F | coordinate model vs `D₈⁺` | `∑h = 4`, so `h + D₈ = {x ∈ (ℤ+½)⁸ : ∑x ∈ 2ℤ}`; `112+128 = 240` | native | R04 |
| 7C index statement | any `H ≤ O(V_p)`; `U` over `ℤ₂` | tautology; `v = e+f`, `β = 2`, `s_v(e) = −f` | tautology | R05 |
| 7C densities (native) | `U` at 3 and 2; `I₂` at 3 and 5; `⟨1⟩`, `⟨2⟩` at 2 | counts: `4/3` (r = 1, 2), `4` (r = 2, 3), `8/3`, `8/5`, `4` (r = 3, 4), `8` (r = 4, 5) | pass | none |
| N1 Check | `⟨1⟩⊕⟨1⟩` at 3; `⟨1⟩³` at 3 | `θ(SO(V₃)) = {1,2}·(ℚ₃ˣ)²`, order 2 = `H₃`; rank 3: order 4 | false in rank 2 | R06 |
| 4C rank-2 count | `x²+y²`; `x²+5y²`; `5xy+y²` | order 2 = 2·1; `x²+5y²`: `W/(W∩J_L)` order 4, the image of `ℚˣ` order 2, so 2 = `2·[C_L:C_L²]`; `G = ℤ/4`, `G/(G[2]G²)` order 2 | pass | none |
| 4G neighbour | `v = (11,2)`, p = 5 | `125 ≡ 0 (25)`, `125 ≡ 25 (50)`; `(3/5,−4/5) = (5,0) − 2·(11/5,2/5)` | pass | none |
| 6D basis | `D₁₅ + h`; `A₁₅ + h` | det 1, leading minors `4,8,…,60,1`; det 49 | pass | none |
| 6G | `240·126·23040` | `696729600 = 2¹⁴·3⁵·5²·7`; half is `348364800` | pass | none |
| 2F (native) | `A₂`, `2ℤ⁵+ℤ𝟙`, `E₈` | `39.5 ≤ 48`; `168.4 ≤ 512`; `2.43·10⁶ ≤ 3.77·10⁷` | pass | none |
| B1 API Check | `⟨1,−2⟩`, unit `1+√2` | `N = −1`, not in `SO`; `SO = ±(3+2√2)^k` | wrong witness | R07 |
| 9B | `[[2,1],[1,12]]` in `(e₁, e₁+e₂)` | `[[2,3],[3,16]]`; three Gram matrices of one lattice sum to `3/4` but miss a class | pass | none |

## Not verifiable

- Cox, *Primes of the form x² + ny²* (B2, B4, B5, B7): Theorems 2.8 (p. 27), 2.13 (p. 29), 3.9 (p. 50), 7.7 (p. 137), and §3.B Theorem 3.15 (proposed in R02). This is a Wiley book; it is not in the sources cache and has no key in the manifest.
- Cohen, GTM 138, §§5.2 and 5.6: the manifest records it as uncertified.
- Cassels, *Rational Quadratic Forms* and *An Introduction to the Geometry of Numbers*: not in the cache.
- O'Meara: 66:4, 81:14, 91:9, 92:1–92:5, 93:16, 93:28–29, 101:8, 102:7, 103:4, 104:5 and 106:13. In particular I could not check whether 93:28–29 or 91:9 carries the invariance of the parity type cited at 3B.
- Not in the cache, so their numbering is unchecked: Nikulin, Izv. 1979 (Proposition 1.8.2, Theorem 1.9.1, Corollary 1.9.4, Theorems 1.10.1, 1.12.2 and 1.12.4, Proposition 1.15.1, Theorem 3.6.2); Serre V.1.4.3, V.2.2 and VII.6.6; Milnor–Husemoller; SPLAG; Cho; Gan–Yu; Wall; van der Blij; Ebeling; Kitaoka; Kneser.
- Kawauchi–Kojima is recorded as uncertified, and Conway–Sloane 1988 as waived.

## Source issues

- none
