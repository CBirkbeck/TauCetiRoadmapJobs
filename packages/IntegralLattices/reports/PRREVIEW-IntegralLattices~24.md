# Review of IntegralLattices (pull request #617 at 2796799)

**Verdict:** needs changes

Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. Every native declaration named below was opened at that Tau Ceti pin; paths are relative to `TauCeti/` in the pinned package.

## R01 (P2) — Layer 3 restates as targets the Jordan theory and the whole of 3I, which Tau Ceti proves at the pin

**Location.** `TauCetiRoadmap/IntegralLattices/README.md`: 3B (lines 836–844, "every `𝒪`-lattice is an orthogonal sum … the ranks `n_i` and scales … agree"), 3C (859–869), 3D (884–889), 3I (1016–1052, "This milestone asks for: the definitions above … the identity, which is Cho's Lemma 5.1 … the behaviour under orthogonal sums … worked values"). It is also principal result 2 at lines 26–27.

**Claim.** The README presents these as targets, and §*From Tau Ceti* cites none of the native declarations:
- 3B: existence of Jordan splittings and invariance of the constituent ranks;
- 3C: the odd-prime isometry criterion by Jordan constituents;
- 3D: the dyadic unimodular classification;
- 3I: every item, namely parity types, bound and free constituents, `N_M`, `N_Q`, `N`, Cho's Lemma 5.1, invariance under change of splitting, orthogonal sums, scaling, and the worked values.

**Witness.** Jordan splittings exist over every DVR (`LinearAlgebra/BilinearForm/JordanSplitting/Basic.lean:380`), and their ranks are invariant (`:490`). The other declarations are:
- `NumberTheory/IntegralLattice/JordanSplitting.lean:68,92`;
- `Dyadic/Unimodular.lean:102` (`localIntegralForm_two_equivalent_iff`);
- `Dyadic/DensityExponent/Basic.lean:253` (`nQ_eq_nM_add_densityExponent`);
- `Dyadic/DensityExponent/JordanSplitting.lean:140` (profile invariant, any local domain);
- `Dyadic/DensityExponent/Sum.lean:292`.

**Repair.**
- Add §*From Tau Ceti* rows for these declarations: `LinearMap.BilinForm.IsSymm.exists_isJordanSplitting`, `IsJordanSplitting.finrank_eq_of_equivalent`, `exists_isJordanSplitting_localIntegralForm`, `localIntegralForm_equivalent_iff_forall_equivalent_restrict`, `localIntegralForm_two_equivalent_iff`, `DyadicJordanProfile`, `nM`, `nQ`, `densityExponent`, `nQ_eq_nM_add_densityExponent`, `IsJordanSplitting.dyadicJordanProfile_eq_of_equivalent`, `SameGenus.dyadicJordanProfile_eq`, `densityExponent_add`, the `Scaling.lean` shift, `IsEven.densityExponent_dyadicJordanProfile` and `densityExponent_dyadicJordanProfile_rankOne_two_pow_mul`.
- Mark 3B and 3I native. 3I keeps only its dictionary to the 3E symbol, and 3D keeps the general dyadic classification (O'Meara 93:28). 3C keeps only what the native odd-prime results do not give.
- Drop "dyadic Jordan data" from principal result 2. Its Checks stay as Checks.

## R02 (P2) — B7, split branch: the modulus-one quotient is `ℤ̂ˣ`, not `ℤ̂ˣ/{±1}` (sampled)

**Location.** README.md:1468–1470, "every idele of modulus one is a rational number times a unit idele by unique factorization in `ℤ`, so `𝔸^{×,1} = ℚˣ · ℤ̂ˣ` and the quotient is `ℤ̂ˣ/{±1}`".

**Claim.** This identification is false with `ℤ̂ˣ = ∏_p ℤ_pˣ`, which is the meaning used everywhere else in the README (B3, and B7's own Check). It halves the volume that B7 says the successor's rank-2 normalization must reproduce.

**Witness.** Every idele factors uniquely as `𝔸_ℚˣ = ℚˣ × ℤ̂ˣ × ℝ_{>0}`. So `𝔸^{×,1} = ℚˣ × ℤ̂ˣ`, because `−1 ∈ ℚˣ` is `−1` at `∞` and so is not in `ℤ̂ˣ`. Hence `ℚˣ\𝔸^{×,1} ≅ ℤ̂ˣ`. B7's Check at line 1489 says "`≅ ℤ̂ˣ` has volume 1". With the text's `ℤ̂ˣ/{±1}` the volume would be `1/2`.

**Repair.** Write "`𝔸^{×,1} = ℚˣ × ℤ̂ˣ`, so the quotient is `ℤ̂ˣ`; with the real sign included it is `(ℤ̂ˣ × {±1})/{±1} ≅ ℤ̂ˣ`". This gives volume 1 under counting measure on the two signs, matching the `U` Check.

## R03 (P2) — Layer 1: Nikulin 1.8.2, the odd-prime classification and the 1H value are native; `Suggested.lean` mislabels 1H

**Location.**
- README.md:612–615 (1G): "Prove Nikulin's relations among the generators … the eleven identities … each an isometry to be constructed".
- README.md:660–664 (1H): "The target of this milestone is the odd-prime value `sign q_θ^{(p)}(p^k) ≡ k²(1 − p) + 4kη`".
- `Suggested.lean`:99–100, which lists it as not a headline, "a README target".

**Claim.** Both are presented as targets, and so is the odd-prime classification of 1G.

**Witness.** `LinearAlgebra/FiniteBilinearModule/OddCyclic/GaussSum.lean:255` (`gaussSign_oddCyclic`) gives `k²(1−p) + 2k(1 − (θ|p))`, which equals `4kη`. Relations (a)–(k) are in `Dyadic/Relations.lean`, `SmallRelations.lean`, `UnequalExponents.lean` and `OddCyclic/Relations.lean`. `OddCyclic/PiClassification.lean:267` gives the odd-prime classification.

**Repair.**
- Cite `gaussSign_oddCyclic`, `nonempty_isometry_pi_oddCyclic_iff` and the four relation files in §*From Tau Ceti*, and mark 1H native.
- 1G keeps `l(A_q) = max_p l(A_{q_p})`, the dyadic bilinear classification (Kawauchi–Kojima) and the decomposition record.
- In `Suggested.lean`, move the 1H bullet from "not statable" to the "proved in Tau Ceti" paragraph.

## R04 (P2) — 4G, the N0 comparison, part of 7C and the `E₈` mass are native but presented as targets or attributed to the successor

**Location.**
- README.md:1868–1876 (4G): "This milestone asks for: the definition and its symmetry; equality of determinants …; equality of genus when `p ∤ 2 det L`; the construction …; a decidable check for one edge."
- 1576–1579: N0 "owns two comparisons".
- 2636–2639: the 7C targets.
- 3023–3025 and 3144: "Its mass `1/696729600` is the successor's 7H".

**Witness.**
- `LinearAlgebra/IntegralLattice/Neighbor/Basic.lean:54` defines `IsNeighbor`, with `.symm` and `.determinant_eq`. `NumberTheory/IntegralLattice/Neighbor.lean` proves `IsNeighbor.sameGenus`, and `Neighbor/Isotropic.lean:367,417` give the construction.
- `Localization/Stabilizer.lean:119` (`localStabilizer_eq_integralOrthogonalSubgroup`).
- `LocalDensity/EulerProduct.lean:109,161`; `LocalDensity/FromBlocks.lean:134`.
- `E8Genus.lean:65` (`mass_typeE₈RootLattice`).

**Repair.**
- Make 4G native. Delete "a decidable check for one edge", which is an algorithm.
- N0 cites `localStabilizer_eq_integralOrthogonalSubgroup` and keeps only the adelic reconstruction.
- 7C cites the `hasProd_inv_half_localDensity_*` family and `localDensity_fromBlocks`. It keeps as targets the rank-2 conditional product, the stabilizer index and the Conway–Sloane §12 dictionary.
- Cite `mass_typeE₈RootLattice` (from 6C and 6G) in place of "the successor's 7H".

## R05 (P3) — Gate `outside-folder`: files under `Completed/` change in this pull request

**Location.** `git diff --stat origin/main...HEAD` lists:
- `Completed/LocalFieldsRamification/COMPLETION.md`, `README.md` and `Suggested.lean`;
- `Completed/LocalGaloisGroups/README.md` and `Suggested.lean`.

**Witness.** My gate run gives `outside-folder=9`, every other scanner 0, and `FAIL`. Five of the nine are the ClassFieldTheory and QuadraticFormInvariants files, which this brief names as the pull request's own. The four `Completed/` files are not named (the diff also shows `Completed/LocalGaloisGroups/Suggested.lean`).

**Repair.** Move the `Completed/` changes to their own pull request, or have them named as this pull request's own. No acceptance is possible while the gate fails.

## R06 (P3) — Two open pull requests rewrite this folder differently, and no merge order is stated

**Location.** The pull request description (it names only #1410 as merging first).

**Witness.** `roadmaps overlaps` reports that #1411 and #1797 conflict with this head in `TauCetiRoadmap/IntegralLattices/README.md` and/or `Suggested.lean`. At their heads, IntegralLattices' `Suggested.lean` has 1374 and 826 lines, against 569 here.

**Repair.** State in the description which pull request rebases onto which before either merges, and do not restate what the other already changes.

## R07 (P3) — Three Checks are false as written

**Location.**
1. README.md:877–878, 3C `A₂`: "a splitting `⟨1⟩ ⊕ ⟨3⟩` would have determinant class `3 ≠ 3·4 = 12`".
2. README.md:1720–1721, 4B: "`⟨1⟩ ⊕ ⟨1⟩` … although `K_2⁺(L) ≠ SO(V_2)`".
3. README.md:1891, 4G: "`v = (11, 2)` has `β(v, v) = 125 ≡ 0 (mod 50)`".

**Witness.**
1. `12/3 = 4 = 2²`, so the two determinants lie in one square class. The separating invariant is the unit constituent: `2` against `1`, with `(2|3) = −1`.
2. `a² + b² = 1` forces `a, b ∈ ℤ₂`: if `v(a) = −k < 0` then `a'² + b'² = 4^k` with `a'² + b'² ≡ 2 (mod 8)`, which is impossible. So `K₂⁺ = SO(V₂)`.
3. `125 mod 50 = 25`.

**Repair.**
1. Separate the two lattices by the scale-1 constituent's unit determinant.
2. Use a prime `p ≡ 1 (mod 4)` (for example `p = 5`, where `SO(V_5) ≅ ℚ_5ˣ` is not compact), or drop the clause.
3. State the construction with `p² ∣ β(v, v)`, which gives integrality, and `2p² ∣ β(v, v)` only for evenness. These are Tau Ceti's `neighbor` and `isEven_neighbor`. Then write "`125 ≡ 0 (mod 25)`", noting that `M` is odd.

## R08 (P3) — B8 re-proves the native `m⁺ = 2m`, and 7G contradicts B7 on how B8 is proved (sampled)

**Location.**
- README.md:1509–1513: "this is the rank-2 case of 7A, proved here from Layer B so that this layer does not wait for Layer 7".
- README.md:2749–2750 (7G): "through the norm-one torus of B6 and its measures in B7", with *Needs* "B6, B7".
- README.md:1493 (B7): "The rank-2 mass of B8 is proved from B2 to B5 without any measure".

**Witness.** 7A is native (`properMass_eq_two_mul_mass`, `NumberTheory/IntegralLattice/Mass.lean`), and `|SO(M)| = #𝒪ˣ` is `card_specialOrthogonalGroup_of_binaryDiscriminant_neg`. There is nothing to wait for.

**Repair.**
- B8 cites both native declarations and keeps as its target only `m⁺ = h⁺/w`, with `w` constant on the genus.
- 7G drops B6 and B7 from its rank-2 route and from *Needs*.
- Relabel the native 2C, 4A and 7A as T in the B8 and 7G rows.

## R09 (P3) — Native theorems are cited as other roadmaps' supplies

**Location.**
- 3G *Needs* and its row (README.md:954–955, 1084): "R Class Field Theory `hilbertProductFormula`; R Quadratic Form Invariants `hilbertSymbol_productFormula`". The 6A odd row (2381) cites the latter too.
- README.md:514 and 1542: "R Global Number Fields `finite_narrowPic`".

**Witness.** All three are proved at the pin:
- `TauCeti.ClassFieldTheory.hilbertProductFormula` (`NumberTheory/ClassFieldTheory/Global/Hilbert/Reciprocity.lean:65`);
- `TauCeti.hilbertSymbol_productFormula` (`NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`);
- `TauCeti.GlobalNumberFields.NumberFieldOrder.finite_narrowPic` (`…/Orders/NarrowPic/RayClass.lean:297`, a file the README's own row lists).

**Repair.** Move all three to §*From Tau Ceti* with these names and files, and drop them from the R rows. QFI's and CFT's re-export names need not be consumed.

## R10 (P3) — 4B overstates `SameGenus.exists_isometry`

**Location.** README.md:1705–1707: "That every lattice in the genus of `L` in any ambient space is isometric to one on `V` is 3H with Hasse–Minkowski, and is native as `SameGenus.exists_isometry`."

**Witness.** `NumberTheory/IntegralLattice/ClassNumber.lean:133` transports `M` along an arbitrary `W ≃ₗ[ℚ] V`, which gives a lattice on `V` carrying a new form. `Genus.lean:42–43` says that combining local isometries into a rational isometry "is the Hasse–Minkowski theorem and is not done here".

**Repair.** Say that the native lemma gives a lattice on `V` with a transported form. The representative on `(V, B_L)` that the double-coset route needs is 3H together with Global Quadratic Forms `hasseMinkowski_equivalent`.

## R11 (P3) — The 6A headlines are stated on Gram matrices rather than on the native carrier

**Location.** `Suggested.lean`:411–439 (`equivalent_of_isEven_unimodular_indefinite`, `equivalent_of_odd_unimodular_indefinite`). They take `G : Matrix (Fin n) (Fin n) ℤ` with `∀ i, 2 ∣ G i i`, `G.det = 1 ∨ G.det = -1`, and `sigPos`/`sigNeg` of a real quadratic form.

**Witness.** README.md:224–247 makes `TauCeti.IntegralLattice` "the canonical object" and treats abstract forms as "an input view, not a second carrier". `IsEven`, `IsUnimodular`, `IsIndefinite`, `signature` and `Isometry` all exist at the pin.

**Repair.** Restate both on `L : IntegralLattice V` and `M : IntegralLattice W`, with the native predicates, equal `signature`, and conclusion `Nonempty (L.Isometry M)`. Keep the Gram form as a README remark.

## R12 (P3) — Cross-references to labels this roadmap does not have, and an incomplete consumer list

**Location.**
- README.md:436: `scale` is "Consumed by 0A, 1B, 5D".
- README.md:3227–3230: References cite Nikulin results for "(5C)", "(5D)", "(5E)", "(5H)", and "Theorems 3.6.2 and 3.6.3 (5J)".
- README.md:3190: the list of what OTM consumes.

**Witness.**
- No 5C, 5D, 5E or 5H exists. Theorem 3.6.3 is `IntegralLatticesPartII`'s (README.md:127).
- OTM's contract consumes §5A and §6G (`OrthogonalTamagawaAndLatticeMass/README.md:50` at its head), but README.md:3190 lists neither.

**Repair.** Re-point line 436, delete the out-of-scope Nikulin locators (or attribute them to `IntegralLatticesPartII`), and add 5A and 6G to the OTM consumer line.

## R13 (P3) — The B3 genus statements and the B8 mass formulas carry no locator (sampled)

**Location.**
- README.md:1259–1262: "prove that the bijection carries the genus of `L` … to a coset of the subgroup of squares".
- README.md:1276–1282: the split-branch genus and torus statements.
- README.md:1501–1528: B8.

**Witness.** None of these paragraphs has a source in parentheses. Only the "Hard theorems" table gives one for B8 (Conway–Sloane equation (1), README.md:3070).

**Repair.** Add locators at the claims. For `Δ < 0`, cite Gauss's genus theory, for example the relevant theorem of Cox §3 (uncertified). For the split branch, give a source or say it is proved here. For B8, give Conway–Sloane equation (1) together with the native declarations of R08.

## Verified sound

**Gate, dependencies and build.**
- My gate run gives `outside-folder=9` and `FAIL`, with every other scanner 0 (see R05).
- Dependency check output: `depcheck: 238 roadmaps, 2335 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line.
- `lake env lean …/Suggested.lean` exits 0 with 14 `sorry` warnings and no other diagnostic.

**`Suggested.lean` checks.**
- One-tactic probe (`rfl | infer_instance | simp | decide | trivial`) on a scratch copy: all 14 theorems fail, so nothing is padding by this test.
- I put `#check @name` for all 37 declarations in one file. The elaborated types match their README statements, no binder is lost, and nothing changed.
- No sorry'd data and no `set_option`.

**Library names.**
- 366 backticked Tau Ceti and Mathlib names in §*From Tau Ceti* and the layers resolve at the pins. The leftover names are files and formulas.
- Opened at the pin: `IntegralLattice` (Basic.lean:63, fields as the README displays them), `TwoElementaryAdmissible` (TwoElementary.lean:81), `TwoElementaryLatticeWithInvariants` (:285), `dyadicCyclic` and `oddCyclic`, and `specialOrthogonalGroupEquivNormOneUnits` (`hL : L.form ≠ 0`, as B4 says).
- Also opened: `span_vectorsOfNorm_two_lattice_of_ne` (Niemeier.lean:200, excluding exactly the four rows 6E names), `SameGenus.exists_isometry` and the product-formula files above.

**Cross-roadmap citations, resolved.**
- OTM at its head: §§0.3, 1.1–1.4, 2.1–2.3, 3.1, 4.1, 4.2 all exist, and its IntegralLattices contract (line 50) matches apart from R12.
- Global Quadratic Forms 6.3: `hasseMinkowski_equivalent` and `equivalent_of_locallyEquivalent`.
- Global Number Fields: `picEquivUnitsIdealClassMonoid`. Orthogonal and Spin Groups: `spinorNorm_reflection`, `transvectionLiftHom`, `orthogonalBaseChangeReal`.
- DifferentialGeometry 12.1 and 12.4, Root Systems 3.1, and Rank-24 lattice constructions Layers 3 and 6.

**Ownership.**
- LatticePackingsAndPerfectForms and GeometryOfNumbersAndQuadraticArithmeticPartII cite IntegralLattices labels that still exist.
- No object has two owners. The overlap tool reports no dropped ids.

**Sources read at their locators.**
- `voight2023`: line 230 (Definition 3.10), line 245 (Lemma 3.12) and lines 251–262 (Proposition 3.13(iii), `p² | Q(v)`).
- `allcock-gal-mark2016`: line 686 (Theorem 5.1, p. 16), lines 849 and 864 (Theorems 6.2 and 6.3, p. 20), line 917 (Corollary 6.4, p. 21).
- `boya-sudarshan-tilma2003`: lines 638–684, which give (6.1)–(6.5) and (6.9) on pp. 16–17 and the convention `−Tr[λ²] = 2` of (6.3).

**Adversarial table.**

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| B1 norm form, `disc N_L = −4 det L` | `A₂` | `N = 2x²−2xy+2y²`, disc `4−16 = −12 = −4·3`; content 2, `Δ = −3` | holds | none |
| B1 content under sublattices | `⟨2e₁,e₂⟩`, `⟨e₁+e₂,e₁−e₂⟩ ≤ ℤ²` | index 2 and 2; forms `4x²+y²` and `2x²+2y²`; contents 1 and 2 | holds | none |
| B2 oriented map, `Δ = 12` | `x²−3y²`, `−x²+3y²`, `3x²−y²` | unoriented ideals equal `𝒪₁₂`; oriented gives `√12·𝒪 ~ √3·𝒪`, `N(√3) = −3 < 0`; `x²−3y² = −1` impossible mod 3 | holds | none |
| B2, `Δ < 0` restricted to positive definite | `x²+y²`, `−x²−y²` | 2 proper classes against `|Pic ℤ[i]| = 1` | holds | none |
| B3 split genera | `Δ = 25` and `Δ = 64` | 4 classes, 2 genera, torus quotient `|(ℤ/5)ˣ/{±1}| = 2`; 4 classes, 4 genera, torus quotient 1 | holds | none |
| B3 ring class field | `Δ = −23` | degree 3 = `h(−23)` (reduced forms `(1,1,6)`, `(2,±1,3)`) | holds | none |
| B4 `[O:SO]` | `!![4,1;1,6]` | norm-4 vectors are only `±e₁`; `e₂ ↦ ae₁+be₂` gives `92a² = 46a`, so `a ∈ {0,½}` and `|O| = 2 ≠ 2w = 4` | holds | none |
| B4 split branch | `U` | `SO = {±1}`, `|O(U)| = 4` | holds | none |
| B4 Pell branch | `⟨1,−2⟩` | unit `1+√2` has norm `−1`; `(1+√2)² = 3+2√2` has norm 1 and infinite order | holds | none |
| B5 class count | `Δ = −23`; `Δ = 25` | 3 reduced forms; `φ(5) = 4` | holds | none |
| B6 `T_L(ℤ)` | `Δ = −4`, `Δ = 12`, `U` | `{±1,±i}` (order 4); `±(2+√3)^ℤ`; `{±1}` | holds | none |
| B7 volumes | `Δ = −4`, `Δ = 12` | `2π/4 = π/2`; `log(2+√3) ≈ 1.317` | holds | none |
| B7 split branch | `U` | `ℚˣ\𝔸^{×,1} ≅ ℤ̂ˣ` (volume 1, the Check) against `ℤ̂ˣ/{±1}` (volume ½, the text) | false | R02 |
| B8 masses | `A₂`; genus of `!![4,1;1,6]` | `1/12 = h⁺/2w`, `|O(A₂)| = 12`; `1/4+1/2 = 3/4 = 3/(2·2)`, against `h/2w = 1/2` | holds | R08 (route) |
| 1H (native) | `p=3, k=1, θ=1,2`; `p=5`, `(θ|5) = −1` | sums `−i√3` and `i√3`, so sign 6 and 2; formula `−2` and `−2+4`; sign 0 with order 5 (not metabolic) | holds | R03 |
| 5A `sameGenus_iff_of_isEven` | `E₈²`/`D₁₆⁺`; `U(2)`/`⟨2⟩⊕⟨−2⟩`; rank 0 | `(16,0,0)` and `A = 0` on both sides, true/true; `q` values `{0,0,½}` against `{¼,¾,0}`, and types II/I, false/false; true/true | holds | none |
| 5B `exists_evenLattice_iff` | `(1,0,q₁⁽²⁾(2))`, `(1,0,q₁⁽³⁾(3))`, `(0,2,q₁⁽³⁾(3))`, `(8,0,0)`, `(4,0,0)`, `(0,0,0)` | conditions hold/fail/hold/hold/fail(`4≢0`)/hold; lattices `⟨2⟩`/none/`A₂(−1)`/`E₈`/none/`0` | agrees | none |
| 5B corollary | `(2,0)` with `q(1) = 1/3`; `(8,0,0)` | sign `2 = 2`, `1 < 2`, gives `A₂`; gives `E₈` | holds | none |
| `padicDiscriminant_eq_squareClass_gramDet` | `⟨6⟩` at `p = 3`, with `θ = 2` and with `θ′ = 5`; `⟨2⟩`/`⟨10⟩` at 2 | `6` and `15`, ratio `5/2 ≡ 1 (mod 3)`, a square, matches `gramDet = 6`; the dyadic case is excluded by `hp` | holds | none |
| 5G Thm 1.12.2 | `S = ⟨2⟩` with `(1,1)`, `(1,0)`; `S = 0` with `(8,0)` | `⟨2⟩ ↪ U` and `⟨−2⟩` realizes `−q`: true/true; no lattice either side: false/false; `E₈`: true/true | holds | none |
| 5G Thm 1.12.4 as an iff | `(1,0,1,1)`, `(1,0,2,0)`; necessity from `S = ⟨2⟩^{t₊}⊕⟨−2⟩^{t₋}` | true/true; false/false; `rank K ≥ l(A_S) = t₊+t₋` gives `2(t₊+t₋) ≤ l₊+l₋` | holds | none (locator: see Not verifiable) |
| 5J sufficiency | `(1;1,0,1)`, `(0;2,0,2)`, `(1;2,0,2)` | admissible, `⟨2⟩`; inadmissible (`2 ≢ 0 mod 4`), no lattice; admissible, `⟨2⟩²` | agrees | none |
| 6A even | `U⊕E₈⊕E₈(−1)` vs `U⁹`; `E₈²` vs `D₁₆⁺` | `(9,9)` on both sides, equivalent; definite, so `hindef` fails as needed | holds | R11 (carrier) |
| 6A odd | `U` vs `⟨1⟩⊕⟨−1⟩` | `h₁o` fails for `U`, so parity is needed | holds | R11 |
| 6E | `D₁₆E₈` vs `E₈³`; Leech | 720 roots each, multisets differ; `vectorsOfNorm 2 = ∅` against `R_r ⊆ N_r` | holds | none |
| 7E | `n = 0, 1, 2, 3`; `O(1)` | `1, 1, 2π, 8π²` (BST (6.4)–(6.5)); `2 = 2·1` | holds | none |
| 4B double cosets | `⟨1⟩`; genus of `!![4,1;1,6]` | 1 point = 1 class; 2/3 points = `h`/`h⁺` | holds | R10 (prose) |
| 3C Check (`A₂` at 3) | `⟨2⟩⊕⟨6⟩` vs `⟨1⟩⊕⟨3⟩` | `12/3 = 4` is a square; `(2|3) = −1` | false reason | R07 |
| 4B Check (`⟨1⟩⊕⟨1⟩` at 2) | `a²+b² = 1` in `ℚ₂` | `a'²+b'² ≡ 2 (mod 8) ≠ 4^k`, so `K₂⁺ = SO(V₂)` | false | R07 |
| 4G Check | `v = (11,2)`, `p = 5` | `125 mod 50 = 25`; `M` contains an orthonormal basis | arithmetic false | R07 |
| 3I exponents (native) | `U`, `⟨1⟩`, `⟨2⟩`, `⟨1⟩⊕⟨2⟩` | `N = 2, 1, 2, 2`; direct count `α₂(U) = 2^{−r}·2^{r+2} = 4`; `α₂(⟨2⟩) = 8` | holds | R01 |
| 7C | `U` at 3; `⟨1⟩⊕⟨1⟩` | `2(1−3⁻¹) = 4/3` (`8/3` with the wrong `ε`); `∏(1−χ₋₄(p)/p) = 4/π` | holds | R04 |
| 4C | `⟨1⟩`; `x²+y²`; `5xy+y²` | `J_L = J²`, quotient infinite; `|J/ℚˣJ_L| = 2` against `[C_L:C_L²] = 1`; `G = ℤ/4`, `G[2]G² = {±1}`, 2 = 2 | holds | none |
| 2F Checks | `A₂`, `E₈`, `2ℤ⁵+ℤ𝟙` | `39.5 ≤ 48`; `2.43·10⁶ ≤ 3.77·10⁷`; `168 ≤ 512` (unsquared form) | holds | none |

## Not verifiable

- **Cox, *Primes of the form x²+ny²*.** Theorems 2.8 (p. 27), 2.13 (p. 29), 3.9 (p. 50) and 7.7 (p. 137) are cited for B2, B4, B5 and B7. The book is paywalled and not in the cache. Secondary citations found by web search (arXiv 1502.05895, 2308.11250) confirm that Theorem 7.7(ii) is the form–ideal isomorphism for orders in imaginary quadratic fields. The page numbers are unchecked.
- **Cohen, GTM 138, §§5.2 and 5.6.** Uncertified in the manifest; not read.
- **Cassels, *Rational Quadratic Forms*, Chapter 13** (B4, B6). No table of contents was found. Bookseller subject lists put "automorphs" just before "binary composition" at the end of the book, so the chapter number for the binary theory is unconfirmed.
- **Nikulin (Izv. 1979; translation 1980).** Not in the cache. In particular I could not confirm whether Theorem 1.12.4 is stated as an "iff" or only as a sufficient condition. The iff in `Suggested.lean` is true (necessity shown in the table above), but its attribution is unverified.
- **Other texts not in the cache.** Kawauchi–Kojima is uncertified, and the Conway–Sloane mass paper is waived. O'Meara, Serre, Milnor–Husemoller, Cho, Gan–Yu, Wall, van der Blij and SPLAG were not read.

## Source issues

- none
