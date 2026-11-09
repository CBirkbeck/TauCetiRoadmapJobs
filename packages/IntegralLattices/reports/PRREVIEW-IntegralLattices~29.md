# Review of IntegralLattices (pull request #1411 at 26b1788)

**Verdict:** needs changes

Incremental re-review. `git diff 69323b7 26b1788 -- TauCetiRoadmap/IntegralLattices` is empty; the only commit since the previous review (`26b1788`) touches `TauCetiRoadmap/ClassFieldTheory/` alone. Pins unchanged: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. Every finding of the previous review except its R08 is therefore still present verbatim, and is written again below (R01–R07 keep their numbers; the previous R09 and R10 are R08 and R09 here). Paths under `TauCeti/` are in the pinned package.

## R01 (P2) — Seven headline theorems of `Suggested.lean` close in one term from the pin, and the rest of Layers 2, 4–7 and 9 restate pinned theorems

- **Location.** `TauCetiRoadmap/IntegralLattices/Suggested.lean`:111 `vanDerBlij`, 211 `nonempty_isometry_iff_gaussSign_eq`, 228 `milgram`, 357 `infinite_isometry_of_isIndefinite`, 570 `exists_isEven_isUnimodular_isPosDef_iff`, 577 `nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight`, 688 `natCard_isometry_typeE₈RootLattice`; then 271, 283, 342, 494, 514, 595, 639, 677, 700, 709, 724, 747–822, 846–860.
- **Claim.** The acceptance test states theorems that Tau Ceti proves at the pin: seven are padding by the one-tactic probe, the others the same statements by object on a Gram-matrix or coordinate carrier.
- **Witness.** Scratch copy importing `PosDef/EvenUnimodular` and `RootLattice/TypeE/WeylGroup`: line 570 closes by `TauCeti.IntegralLattice.exists_isEven_isUnimodular_isPosDef_iff n`, line 688 by `card_isometry_typeE₈RootLattice` (`WeylGroup.lean:272`); `lake env lean` exit 0, `sorry` warnings 31 → 29.
- **Repair.** Delete from `Suggested.lean` (the README keeps the statements, as native rows per R02):
  - the seven one-term closures: `vanDerBlij` (`LinearAlgebra/IntegralLattice/Characteristic/VanDerBlij.lean:141`), `milgram` (`Milgram.lean:313`, `gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg`), `nonempty_isometry_iff_gaussSign_eq` (`FiniteBilinearModule/Comparison.lean:175`), `infinite_isometry_of_isIndefinite` (`NumberTheory/IntegralLattice/IndefiniteIsometry.lean:171`), `exists_isEven_isUnimodular_isPosDef_iff` (`PosDef/EvenUnimodular.lean:163`), the `E₈` uniqueness (`PosDef/SmallRankUnimodular.lean:407`), `natCard_isometry_typeE₈RootLattice`;
  - the same statements by object: 2F line 271 (`IsPosDef.prod_successiveMinimum_mul_pi_pow_le`, `PosDef/Minkowski.lean:219`); 2G line 283 (`LinearMap.BilinForm.exists_finset_forall_exists_toMatrix_mem`, `BilinearForm/FiniteClasses.lean:242`); 4E line 342 (`finite_genusClasses_of_finrank_eq_two`, `Binary/ClassNumber.lean:93`); 5J lines 494, 514 (`TwoElementaryAdmissible`, `TwoElementaryLatticeWithInvariants`, `TwoElementary.lean:81, 285`); 6C line 595 (`nonempty_isometry_of_isUnimodular_of_finrank_le_nine`, `SmallRankUnimodular.lean:378`); 6D line 639 (`sameGenus_e8PowLattice_checkerboardPlusLattice`, `EvenUnimodularGenus.lean:72`); 6H line 677 (`Cancellation.lean:311, 344`); 7C lines 700–724 (`LocalDensity/Basic.lean:110, 508, 599, 711, 737`); 7E lines 747–822 (`Geometry/Euclidean/Volume/OrthogonalGroup.lean:475, 500`); 9B lines 846, 860 (`sum_inv_natCard_isometry_eq_mass_iff`, `Mass.lean:221`).
  - Keep what is not at the pin: 4B `exists_genusClasses_equiv_doubleCoset`, 5A, 5B (`padicDiscriminant`, the four conditions, both theorems), 5G, 5J's `exists_twoElementaryLattice_iff` restated on the native predicates, 6A (R09), 6E. Re-run `#check @name` on what remains.

## R02 (P2) — The README states as targets milestones that are native at the pin, and attributes native results to other roadmaps

- **Location.** `TauCetiRoadmap/IntegralLattices/README.md` 1392: "this is the rank-2 case of 7A, proved here from Layer B so that this layer does not wait for Layer 7"; 2463–2464: "every statement about the convergence of the product over `p` and its value is the successor's". Likewise 574–586 (1G), 620–625 (1H), 695–723 (2F, 2G), 778–885 (3B–3D, 3F), 970–1010 (3I), 1109–1297 (B2–B5), 1456–1463 (N0), 1672–1681 (4E), 1735–1750 (4G), 2003 (5J), 2053–2220 (6B–6D, 6G, 6H), 2388–2578 (7A, 7C, 7E, 7G), 2667–2680 (9B).
- **Claim.** These are written as targets ("Prove", "proved here", "is the successor's") for statements `TauCeti` proves at the pin, and §*From Tau Ceti* has no row for them, so `*Needs:*` lines route an implementer into reproving the library.
- **Witness.** `properMass_eq_two_mul_mass` (`NumberTheory/IntegralLattice/Mass.lean:154`, every positive rank); `hasProd_inv_half_localDensity_of_card_eq_two_mul_add_one` and `…_two_mul_add_two` (`LocalDensity/EulerProduct.lean:109, 161`) prove the good-prime products.
- **Repair.** Add to §*From Tau Ceti*, with files, the declarations listed in R01 and: 1G's relation isometries (`FiniteBilinearModule/OddCyclic/Relations.lean`, `Dyadic/Relations.lean`, `Dyadic/SmallRelations.lean`, `Dyadic/UnequalExponents.lean`) and `nonempty_isometry_pi_oddCyclic_iff` (`OddCyclic/PiClassification.lean:267`); 1H `gaussSign_oddCyclic` (`OddCyclic/GaussSum.lean:255`); 2F/2G `IsMinkowskiReduced`, `IsPosSemidef.exists_isMinkowskiReduced` (`PosDef/Reduction.lean:80, 147`), `IsPosDef.finite_genusClasses` (`NumberTheory/IntegralLattice/ClassNumber.lean:173`); 3B `IsSymm.exists_isJordanSplitting`, `IsJordanSplitting.finrank_eq_of_equivalent` (`BilinearForm/JordanSplitting/Basic.lean:380, 490`), `exists_isJordanSplitting_localIntegralForm` (`NumberTheory/IntegralLattice/JordanSplitting.lean:68`); 3C `localIntegralForm_equivalent_iff_forall_equivalent_restrict` (`JordanSplitting.lean:92`); 3D `localIntegralForm_two_equivalent_iff` (`Dyadic/Unimodular.lean:102`); 3F `sameGenus_iff_localIntegralForm_equivalent_primeFactors` (`Genus.lean:216`); 3I `DyadicJordanProfile`, `nQ_eq_nM_add_densityExponent` (`Dyadic/DensityExponent/Basic.lean:43, 253`); B1–B5 `QuadraticOrder.numberFieldOrder`, `binaryNormForm`, `binaryDiscriminant`, `binaryOrder`, `posDefProperClassEquivPic`, `properClassEquivNarrowPic`, `posDefProperClassEquivGal`, `specialOrthogonalGroupEquivNormOneUnits`, `card_specialOrthogonalGroup_of_binaryDiscriminant_neg`, `index_specialOrthogonalGroup_eq_two_iff_reflected`, `exists_finset_forall_exists_binaryNormForm_mem`; B8 `properMass_eq_two_mul_mass`; N0 `localStabilizer_eq_integralOrthogonalSubgroup` (`Localization/Stabilizer.lean:119`); 4G `IsNeighbor`, `IsNeighbor.sameGenus`, `neighbor`, `isNeighbor_neighbor`; 7G `mass_eq_one_of_finrank_eq_zero`, `mass_eq_inv_two_of_finrank_eq_one` (`Mass.lean:252–270`); the `E₈` mass `mass_typeE₈RootLattice` (`E8Genus.lean:65`). Rewrite each milestone above as "native (…)", keeping as targets only 1G's dyadic bilinear classification and the decomposition record; 3E, 3G; 3I's dictionary to the symbol; B6, B7; 4A's class sets, 4B, 4C, N1's images at the bad primes; 5A, 5B, 5F, 5G, 5I, 5J's sufficiency; 6A, 6E, 6F; 7C's `[K_p : K_p⁺]` and the Conway–Sloane §12 dictionary. Relabel those Dependencies rows R → T and drop "the successor's" from 7C and from the `E₈` mass (README 2843, 3053).

## R03 (P2) — The module docstring says B2 and B3 are not statable at the pin; both are proved there

- **Location.** `Suggested.lean:75–79`: "it carries no `NumberField` instance and the order `ℤ[(Δ+√Δ)/2]` is not a `NumberFieldOrder` of it …, and no ring class field exists at the pin."
- **Claim.** A false statement about the library, used to omit a statable headline; it also contradicts README 128, 453 and 1054–1056, which cite `TauCeti.ClassFieldTheory.ringClassField`.
- **Witness.** `QuadraticOrder.numberFieldOrder D hD : NumberFieldOrder (QuadraticAlgebra ℚ D 0)` (`NumberTheory/QuadraticOrder/Field.lean:39`); `posDefProperClassEquivGal` (`BinaryQuadraticForm/Ideal/RingClassField.lean:83`): proper classes of discriminant `−n` ≃ `Gal` of the ring class field.
- **Repair.** Delete the bullet; name `posDefProperClassEquivPic`, `properClassEquivNarrowPic` and `posDefProperClassEquivGal` in the docstring's list of what Tau Ceti proves.

## R04 (P3) — Three native theorems are cited as supplies of other roadmaps

- **Location.** README 477, 480, 905, 1038: "R Class Field Theory `hilbertProductFormula`; R Quadratic Form Invariants `hilbertSymbol_productFormula`"; README 479 and 1424: "R Global Number Fields … `finite_narrowPic`".
- **Witness.** `TauCeti.ClassFieldTheory.hilbertProductFormula` (`NumberTheory/ClassFieldTheory/Global/Hilbert/Reciprocity.lean:65`), `TauCeti.hilbertSymbol_productFormula` (`QuadraticForm/Global/ProductFormula.lean:67`), `finite_narrowPic` (`NumberField/Global/Orders/NarrowPic/RayClass.lean:297`). Class Field Theory's own contract (its README 524) lists the Hilbert invariants as implemented in Tau Ceti.
- **Repair.** Move the three to §*From Tau Ceti* with these files and relabel the rows T; `picEquivUnitsIdealClassMonoid` stays an R row.

## R05 (P3) — The 3E locator names the unimodular theorem for the canonical-symbol statement

- **Location.** README 860–861: "the canonical form is the corrected one of Allcock–Gal–Mark (Theorem 5.1 there, which proves the canonical symbol a complete invariant)".
- **Witness.** `allcock-gal-mark2016` line 686: Theorem 5.1 (p. 16) is about unimodular lattices; line 849 Theorem 6.2 and line 864 Theorem 6.3 (p. 20) give equivalence of 2-adic symbols; line 917 Corollary 6.4 (p. 21) is the canonical form.
- **Repair.** Write "(Theorems 6.2 and 6.3, p. 20, and Corollary 6.4, p. 21, there; Theorem 5.1, p. 16, is the unimodular case)".

## R06 (P3) — 4G: the construction's hypothesis is too strong for an odd lattice, the Check's arithmetic is false, and one item is an algorithm

- **Location.** README 1745: "choose `v ∈ L` primitive with `β(v, v) ≡ 0 (mod 2p²)`"; 1757: "`v = (11, 2)` has `β(v, v) = 125 ≡ 0 (mod 50)`"; 1741: "a decidable check for one edge".
- **Witness.** `11² + 2² = 125`, `125 mod 50 = 25`. `voight2023` line 261 (Proposition 3.13(iii)) asks `p² ∣ Q(v)`; the native `neighbor` takes `(p : ℤ) ^ 2 ∣ L.integralNorm v` (`Neighbor/Isotropic.lean:232`), `isEven_neighbor` (:282) adds the factor 2.
- **Repair.** State the construction with `p² ∣ β(v, v)`, and `2p² ∣ β(v, v)` for evenness only; write "`125 ≡ 0 (mod 25)`, and `M` is odd like `L`"; delete the decidable-check item.

## R07 (P3) — 4B Check: `K₂⁺(⟨1⟩ ⊕ ⟨1⟩) = SO(V₂)`, so "although `K_2⁺(L) ≠ SO(V_2)`" is false

- **Location.** README 1590–1591: "one class and one proper class, so both double coset spaces are points although `K_2⁺(L) ≠ SO(V_2)` (N1)".
- **Witness.** `SO(V₂) = {(a, b) : a² + b² = 1}` over `ℚ₂`. If `v(a) = −k < 0` then `v(b) = −k` and `a'² + b'² = 4^k` with `a', b'` odd; odd squares sum to `2 (mod 8)`. So every element is `ℤ₂`-integral.
- **Repair.** Drop the clause, or move the Check to a prime `p ≡ 1 (mod 4)`, where `SO(V_p) ≅ ℚ_pˣ` is not compact and `K_p⁺ ≠ SO(V_p)`.

## R08 (P3) — Merge state: the branch conflicts with main in this folder, and the description names no order with #1797 (previous R09)

- **Location.** The pull request description's merge-order paragraph; `git merge-tree --write-tree origin/main HEAD`.
- **Witness.** `git merge-tree` at `26b1788` against main `99e128e`: "CONFLICT (content): Merge conflict in TauCetiRoadmap/IntegralLattices/README.md" (merge base `eaf17b1`). `roadmaps overlaps`: "#1411 and #1797 conflict in … `IntegralLattices/README.md`". Description names #617, #1215, #1410, #1474, not #1797.
- **Repair.** Say in the description that the conflict with main on `README.md` resolves toward the branch (its text is main's plus 88 repair lines). State which of #617 and this pull request carries the folder and that the other rebases onto it. #617's head (`roadmaps show IntegralLattices --pr 617`) already has R01–R04's text. Name #1797 in the order: its copy of this folder is main's text (89 diff lines against this head, all this head's repairs), so it rebases onto whichever carries the folder.

## R09 (P3) — The 6A headlines are stated on Gram matrices rather than on the native carrier (previous R10)

- **Location.** `Suggested.lean:536–568`, `equivalent_of_isEven_unimodular_indefinite` and `equivalent_of_odd_unimodular_indefinite`: hypotheses `∀ i, 2 ∣ G₁ i i`, `G₁.det = 1 ∨ G₁.det = -1`, and `sigPos`/`sigNeg` of a real form.
- **Witness.** README 224–247 makes `TauCeti.IntegralLattice` the canonical object and the abstract form "an input view, not a second carrier"; `IsEven`, `IsUnimodular`, `IsIndefinite`, `signature`, `Isometry` exist at the pin (`LinearAlgebra/IntegralLattice/Even.lean`, `Unimodular.lean`, `Signature.lean`, `Isometry/Basic.lean`).
- **Repair.** State both on `L : IntegralLattice V`, `M : IntegralLattice W` with the native predicates and `L.signature = M.signature`, concluding `Nonempty (L.Isometry M)`; keep the Gram form as a README remark.

## Previous findings

- R01 — not repaired: `Suggested.lean:570` still reads "theorem exists_isEven_isUnimodular_isPosDef_iff (n : ℕ) : (∃ L : IntegralLattice (Fin n → ℚ), L.IsEven ∧ L.IsUnimodular ∧ L.IsPosDef) ↔ 8 ∣ n := sorry", which closes by the native theorem of the same name.
- R02 — not repaired: README 1392 still reads "this is the rank-2 case of 7A, proved here from Layer B so that this layer does not wait for Layer 7"; 2464 still "is the successor's".
- R03 — not repaired: `Suggested.lean:77–79` still reads "it carries no `NumberField` instance and the order `ℤ[(Δ+√Δ)/2]` is not a `NumberFieldOrder` of it … and no ring class field exists at the pin."
- R04 — not repaired: README 905 still reads "R Class Field Theory `hilbertProductFormula`; R Quadratic Form Invariants `hilbertSymbol_productFormula`"; README 479 still lists `finite_narrowPic` under Global Number Fields.
- R05 — not repaired: README 861 still reads "(Theorem 5.1 there, which proves the canonical symbol a complete invariant)".
- R06 — not repaired: README 1757 still reads "`v = (11, 2)` has `β(v, v) = 125 ≡ 0 (mod 50)`"; 1745 still "`β(v, v) ≡ 0 (mod 2p²)`"; 1741 still "a decidable check for one edge".
- R07 — not repaired: README 1590–1591 still reads "both double coset spaces are points although `K_2⁺(L) ≠ SO(V_2)` (N1)".
- R08 — repaired: the project configuration now has `outside_folder_allow = ["^Completed/LocalGaloisGroups/Suggested\\.lean$"]`; the worker's gate and mine no longer list that file under `outside-folder`.
- R09 — not repaired: `git merge-tree` still reports "CONFLICT (content): Merge conflict in TauCetiRoadmap/IntegralLattices/README.md"; the description still names #617, #1215, #1410, #1474 and not #1797 (R08 here).
- R10 — not repaired: `Suggested.lean:536–539` still reads "theorem equivalent_of_isEven_unimodular_indefinite {n : ℕ} (G₁ G₂ : Matrix (Fin n) (Fin n) ℤ) … (h₁e : ∀ i, 2 ∣ G₁ i i)" (R09 here).

## Verified sound

**Gate, dependency check, build.**
- Worker's gate (`scratch/gate.md`): every scanner 0, "Every check passed". My run of `gate … --base origin/main` lists `outside-folder=5`, all five being `TauCetiRoadmap/ClassFieldTheory/{README.md,Suggested.lean}` and `TauCetiRoadmap/QuadraticFormInvariants/{NativeCompletion.md,README.md,Suggested.lean}`, folders the brief names as this pull request's own (the worker's gate allows them per job); every other scanner 0.
- Dependency check: `depcheck: 236 roadmaps, 2284 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/IntegralLattices/Suggested.lean`: exit 0 in 17 s, 31 warnings, all `declaration uses 'sorry'`, no other diagnostic.
- Signatures: `Suggested.lean` is byte-identical to the file whose 66 `#check @name` types the previous review compared with the README, at the same pins; `scratch/signatures.md` reports 0 lost binders. No change, so no re-check was needed beyond that.
- Padding probe (R01): scratch copy with two native imports and two `sorry`s replaced by one term each: exit 0, warnings 31 → 29.
- The 17 "Lean names found nowhere" in `scratch/citations.md` (`soEuclideanMeasure`, `NikulinDecomposition`, `padicDiscriminant`, `RootfulNiemeierType.eq_of_nonempty_isometry_lattice`, …) are each declared once in this `Suggested.lean` (grep of `theorem|def|structure`), which is what the gate's `readme-ids-missing=0` also says.

**The change outside the folder, where this roadmap relies on it.** The `26b1788` commit rewrites Class Field Theory's consumer list: README 2441 now says "`IntegralLattices` consumes Layer 14's `hilbertProductFormula`; it takes the ring class field and its Artin isomorphism from Tau Ceti directly (`ringClassField`, `ringClassArtinMap`, `ringClassArtinEquiv`)". That agrees with this README 128, 453, 1054–1056 and 1420 (Tau Ceti ring class field) and with its rows 480, 905, 1038 (the frozen name `ClassFieldTheory.hilbertProductFormula` at Class Field Theory README 2363). The citation resolves; the change makes nothing in this folder wrong. Class Field Theory's contract row (its README 524) lists the Hilbert invariants among what Tau Ceti implements, which supports R04.

**Library declarations re-opened at the pin** (each name found within two lines of the cited line): `VanDerBlij.lean:141`, `Milgram.lean:313`, `Comparison.lean:175`, `IndefiniteIsometry.lean:171`, `EvenUnimodular.lean:163`, `SmallRankUnimodular.lean:378, 407`, `WeylGroup.lean:272`, `Minkowski.lean:219`, `Binary/ClassNumber.lean:93`, `TwoElementary.lean:81, 285`, `EvenUnimodularGenus.lean:72`, `Cancellation.lean:311`, `LocalDensity/Basic.lean:110`, `OrthogonalGroup.lean:500`, `Mass.lean:154, 221`, `EulerProduct.lean:109, 161`, `QuadraticOrder/Field.lean:39`, `Ideal/RingClassField.lean:83`, `Hilbert/Reciprocity.lean:65`, `ProductFormula.lean:67`, `NarrowPic/RayClass.lean:297`, `Neighbor/Isotropic.lean:232, 282` (24 declarations).

**Sources re-read.** `allcock-gal-mark2016` lines 686 (Theorem 5.1, unimodular), 849 (Theorem 6.2), 864 (Theorem 6.3), 917 (Corollary 6.4); `voight2023` line 261 (Proposition 3.13(iii), `p² ∣ Q(v)`).

**Seeded sample B1–B8.** No sampled passage changed; the previous review's checks carry forward, and B2, B4 and B8 were recomputed by brute force here (table below). Cox and Cohen are uncertified or paywalled, so their locators are unchecked (see below).

**Adversarial table.** No statement changed, so every row carries forward from the previous review (r26 at `69323b7`); rows marked "here" were recomputed in exact arithmetic on this head.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| B1 norm form | `A₂`; `⟨2e₁, e₂⟩ ≤ ℤ²` | `2x² − 2xy + 2y²`, content 2, `Δ = −3`, `disc N = −12`; `4x² + y²`, content 1 (r26) | pass | R02 (native) |
| B2 reduced forms (here) | `Δ = −3, −4, −23, −44` | `(1,1,1)`; `(1,0,1)`; `(1,1,6),(2,±1,3)`; primitive `(1,0,11),(3,±2,4)` and non-primitive `(2,2,6)` | pass, `h(−23) = h(−44) = 3` | R02 |
| B3 | split `m = 5`, `m = 8` | genera `{1,4},{2,3}`, quotient of order 2; four genera of one class (r26) | pass | R03 |
| B4 automorphisms (here) | `A₂`, `I₂`, `U`, `!![4,1;1,6]`, `!![2,1;1,12]` | `|O|, |SO|` = `12,6`; `8,4`; `4,2`; `2,2`; `4,2` | pass | R02 |
| B5 | `Δ = −44`, split `φ(5)` | `h = 3`; `4` (r26) | pass | R02 |
| B6 | `T_L(ℤ)` for `I₂`, `x² − 3y²`, `U` | `{±1, ±i}`; `±(2+√3)^k`; `{±1}` (r26) | pass | none |
| B7 | torus volumes | `π/2`, `log(2+√3) ≈ 1.317`, `ℤ̂ˣ` volume 1 (r26) | pass | none |
| B8 mass (here) | `Δ = −23` | classes `|O| = 4, 2`; `m = 1/4 + 1/2 = 3/4 = h⁺/(2w)` with `h⁺ = 3, w = 2` | pass | R02 |
| 1H, 1I, 1L | `oddCyclic 3 θ`; `⟨±2⟩`, `A₂`; `⟨1⟩`, `⟨2⟩`, `E₈` | signs `−2`, `−2+4`; `1`, `7`, `2`; `w² ≡ 1`, `2k²` even, `0 ≡ 8` (r26) | pass | R01 |
| 2F, 2G | `A₂`, `E₈`; rank 2 det 3 | `6.28 ≤ 6.93`, `64.9 ≤ 256`; two classes (r26) | pass | R01 |
| 3E fusion | `⟨1⟩⊕⟨14⟩ ≅ ⟨7⟩⊕⟨2⟩` | Gram `diag(15, 210)`, `det P = 15`, oddities `15 ≡ 7`, `105 ≡ 1` (r26) | pass | R05 (locator) |
| 4B | `⟨1⟩⊕⟨1⟩` at 2 (here) | odd `a', b'`: `a'² + b'² mod 8 ∈ {2}`, never `≡ 0 (mod 4)` | fails the clause | R07 |
| 4E, 4F | binary genus; `x²+y²−3z²` | finite; `3 ∣ x, y` (r26) | pass | R01 |
| 4G (here) | `v = (11, 2)`, `p = 5` | `β(v,v) = 125`, `125 mod 50 = 25`, `125 mod 25 = 0` | Check false | R06 |
| 5A, 5B, 5G, 5J | `E₈²/D₁₆⁺`; `(1,0,q₁⁽²⁾(2))`; K3 `ρ ≤ 11`; `(0,4,0,0)`… | `(16,0,0)` both; `1 = 1`; `2ρ ≤ 22`; each fails one clause (r26) | pass | R01 (5J carriers) |
| 6A | `U` vs `⟨1⟩⊕⟨−1⟩`; `E₈²` vs `D₁₆⁺` | parity; definiteness (r26) | pass | R09 |
| 6B, 6C | `n = 0, 4, 8`; `I₉` vs `E₈⊕I₁` | `0`, `D₄` det 4, `E₈`; 18 vs 2 norm-1 vectors (r26); probe closes 6B (here) | pass | R01 |
| 6D, 6E | `d16PlusGram`; `D₁₆E₈` vs `E₈³` | `det = 1`, minors positive; `720 = 3·240` (r26) | pass | R01 / none |
| 6G (here) | `240·126·23040` | `696729600`; probe closes it by `card_isometry_typeE₈RootLattice` | pass | R01 |
| 6H | ranks, dets, signatures | `18`, `−1`, `(17,1)` (r26) | pass | R01 |
| 7A, 7G | rank 0, 1; `Δ = −23` | `(1,1)`, `(1/2,1)`; `3/4`, `3/2` (r26) | pass | R02 |
| 7C | `U`, `I₂` at 3, 5 | `4/3 = 2(1 − 1/3)`; `8/3`; `8/5` (r26) | pass | R01 |
| 7E | `sphereArea 1..4`; `SO(3)` | `2, 2π, 4π, 2π²`; `8π²` (r26) | pass | R01 |
| 9B | `Δ = −23`; rank 0 | `3/4`; `1` (r26) | pass | R01 |

**Overlaps and ownership.** `scratch/overlaps.md` (main `d72684a`): no id this README cites is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no id others cite. #617 and #1797 still carry this folder (R08): #617's README is 3420 lines against this head's 3093; #1797's differs from this head by 89 lines, all this head's repairs. The closest roadmaps in vocabulary (Theta Series, LatticePackingsAndPerfectForms, OrthogonalTamagawaAndLatticeMass, OrthogonalSpinGroups, GeometryOfNumbersAndQuadraticArithmetic) were read for ownership in the previous review; this head adds no object to the folder, so that check carries forward.

- Remark (untouched text, no change asked): README 2956–2958's `!![3,1;1,4]` (determinant 11, `Δ = −44`) is the non-ambiguous class `(3,2,4)`, so `O = SO = {±I}` as the worked example says.

## Not verifiable

- Cox, *Primes of the form x² + ny²*, Theorems 2.8, 2.13, 3.9, 7.7 (B2, B4, B5): paywalled, not in the sources cache.
- Cohen, GTM 138, §§5.2, 5.6 (B2, B5, B7): recorded as uncertified in the manifest; cited by locator only.
- Cassels, *Rational Quadratic Forms* (Layers 3, 4, B) and *An Introduction to the Geometry of Numbers*, Chapter VIII (2F): not in the cache.
- Nikulin, Izv. 1979 (Layers 1, 5): not in the cache; numbering of Theorems 1.9.1, 1.10.1, 1.12.2, 1.12.4, 3.6.2 unchecked.
- O'Meara, Serre, Milnor–Husemoller, Kawauchi–Kojima (uncertified), Wall, van der Blij, Cho, Gan–Yu, Kitaoka, Kneser, Ebeling, SPLAG: not in the cache. Conway–Sloane 1988 is waived.

## Source issues

- none
