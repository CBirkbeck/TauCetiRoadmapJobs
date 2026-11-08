# Review of AbelianVarietiesOverFiniteFields (pull request #1720 at 34fabf0)

**Verdict:** needs changes

This is a full review: 404 lines of the folder changed since `3ef7d74`. All five findings of the previous review are repaired; see `## Previous findings`. The whole `README.md` (2479 lines) and `Suggested.lean` (153 lines) were read, changed or not. The checks behind this are listed under `## Verified sound`: the gate, the dependency check, elaboration, the padding probe, the seeded source sample, the cross-roadmap citations and the adversarial table. There is one blocking finding (R01) and seven P3 findings.

## R01 (P1) — 5.6: the twist-degree API bullet is false

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:1049` ("The least twist degree divides any degree realizing an isogeny.")

**Claim:** if `A_{𝔽_{q^r}} ~ B_{𝔽_{q^r}}`, then `twistDegree A B ∣ r`. Both classes in the witness exist: Waterhouse case (4) with `p = 3`, `r = 1`, `a = ±3`.

**Witness:** `1.3.ad` (`T² − 3T + 3`) and `1.3.d` (`T² + 3T + 3`) have equal Weil powers at `r = 2` (`T² − 3T + 9`) and at `r = 3` (`T² + 27`), but not at `r = 1`. So the twist degree is 2, and `2 ∤ 3` (CurvesOverFiniteFields 1.10, line 892).

**Repair:** replace the bullet with: "The degrees realizing an isogeny are closed under multiplication by positive integers. The least of them divides the lcm of the orders of the root-of-unity ratios `α_i/β_j`, but need not divide every such degree." Then add the pair as a negative-control Check.

**Test on the witness:** the realizing degrees are `{r : 2 ∣ r or r ≡ 3 mod 6}` (computed for `r ≤ 6`: 2, 3, 4, 6 yes; 1, 5 no). This set is closed under multiplication. The least degree 2 divides the lcm 6 of the ratio orders (`−1` has order 2, `−e^{iπ/3}` has order 3). Every matching contributes the multiples of its own lcm, so the least degree is the lcm of a sub-collection and divides the full lcm in general.

## R02 (P3) — Frobenius angles: the normalisation and the count disagree with the supplier

**Location:** `README.md:191` (Conventions: "`dim_ℚ (span_ℚ {arg α_i / (2π)} ∪ {1}) − 1`"); `:1229` ("`g` angles `θ_i ∈ [0, 1]`"); `:1248` (Check: "roots 1±i have rational normalized arguments ±1/8").

**Claim:** the angles are `arg/(2π)`, and there are `g` of them.

**Witness:** CurvesOverFiniteFields convention 10 uses `θ = arg/π`, with `2·card = 2g + m`. Its 1.7 Check (line 712) names `arg/(2π)` → `1/8` as the wrong model. The LMFDB stores `[0.25]` for `1.2.ac` and `[0.0, 0.0]` for `1.4.ae`, where `g = 1`.

**Repair:**
- Conventions: define the angles as in CurvesOverFiniteFields convention 10 (`arg/π`, one per upper-half-plane root, real roots at full multiplicity), and keep the angle-rank formula with these `θ_i`.
- 6.5: replace "`g` angles" by "`g + m/2` angles when `P_A` has `m` real roots (`card_frobeniusAngles`)".
- Check: "the roots `1 ± i` give the angle `1/4`; angle rank 0".

**Test:** `1.4.ae` (`m = 2`) gives `1 + 1 = 2` angles, `[0, 0]`. `1.2.ac` gives `[1/4]`. The angle ranks are unchanged (0 and 0).

## R03 (P3) — 10.4: the "class" `T⁴ − 6T² + 16` over `𝔽_4` is not a class of abelian surfaces

**Location:** `README.md:2059` ("at `q = 4` that class, `T⁴ − 6T² + 16`, has slopes `{1/4, 1/4, 3/4, 3/4}` and is not supersingular either").

**Claim:** some abelian surface over `𝔽_4` has this Weil polynomial.

**Witness:** All roots have modulus 2. The 2-adic coefficient valuations `(0,4), (2,1), (4,0)` give slopes 1/4 and 3/4, each of multiplicity 2. Dieudonné–Manin (6.3 here) needs multiplicity divisible by 4. Equivalently, `inv_v = (1/4)·2 = 1/2`: Honda exponent 2, dimension 4.

**Repair:** "at `q = 4`, `T⁴ − 6T² + 16` is not the characteristic polynomial of any abelian surface: its slopes 1/4 and 3/4 would need multiplicity divisible by 4 (6.3), and Part II F3.2 gives its roots Honda exponent 2". The remark's conclusion, that (iii) is vacuous at `p = 2`, is unchanged.

**Test:** the polygon recomputed from `(0,4), (2,1), (4,0)` has segments of slopes 3/2 and 1/2, which become 3/4 and 1/4 after dividing by `ord_2 4 = 2`. Each segment has length 2, so the multiplicity 2 is not divisible by 4.

## R04 (P3) — 8.1: the non-product example argues about `ℤ[T]/(P)`, not the Frobenius order

**Location:** `README.md:1433–1435` ("for `P = (T² − T + 2)(T² + T + 2)` over `𝔽_2` … `ℤ[T]/(P)` does not contain the idempotent `(1, 0)`, so it is not a product of orders").

**Claim:** the Frobenius order of this class is `ℤ[T]/(P)`.

**Witness:** `P = T⁴ + 3T² + 4` gives `V = −(π³ + 3π)/2 ∉ ℤ[π]`. Computed: `disc ℤ[π] = 3136` and `disc ℤ[π, V] = 784`, so `[ℤ[π, V] : ℤ[π]] = 2`. That `ℤ[π]` lacks `(1, 0)` says nothing about `ℤ[π, V]`.

**Repair:** write "`ℤ[π, V] = {(a, b) ∈ ℤ[α]² : a ≡ b mod 2}` with `α = (1 + √−7)/2` (index 4 in `𝓞_E`, of discriminant 49) does not contain `(1, 0)`".

**Test:** `e = 1/2 − π/4 − π³/4` satisfies `e² = e`, and its coordinates in a basis of `ℤ[π, V]` are not all integers. So the conclusion holds for the right ring.

## R05 (P3) — 5.7 and 8.3: clauses about real factors that their own hypotheses rule out

**Location:**
- `README.md:1087–1090` (5.7, under "`P_A` irreducible": "or `ℚ(√p)`, or `ℚ` in the real cases").
- Checks at `:1103–1104` (`T² − 2`, `T − 2`).
- `:1512–1513` (8.3, under `Squarefree P_A`: "the identity on the real factors `ℚ`, `ℚ(√p)` of 3.3").
- `:1517` ("when `P_A` has no real root").

**Claim:** real factors can occur under these hypotheses.

**Witness:** By 3.3 the real classes have `e = 2`, so `P_A = (T ∓ √q)²` or `(T² − q)²`, which is neither irreducible nor squarefree. The worked example `2.2.a_ae` itself says that "Layers 8–9 do not apply". Neither `T² − 2` nor `T − 2` is any `P_A`.

**Repair:**
- 5.7: delete "or `ℚ(√p)`, or `ℚ` in the real cases".
- 8.3: state that `E_A` is a product of CM fields with `[E_A : E_A^+] = 2`.
- Replace the two Checks by one on an irreducible `P_A`: for `2.2.ad_f`, `F = ℚ(√5, √−3)` with Galois group `C₂ × C₂`.

## R06 (P3) — Defined terms used with different meanings

**Location:**
- `README.md:196` (Conventions: "Deligne module" is the general object).
- `:1712–1713` (9.1: "Call this general object a **Weil lattice**; reserve **ordinary Deligne module** for its ordinary subcategory").
- `:1723–1731`, `:1741–1743`, `:1758` (the general object is again called a "Deligne module").
- `:1773` ("ordinary Deligne modules in `DeligneModule q`").
- `:843` (3.4 Check: "an ordinary elliptic E with quadratic endomorphism field F").

**Claim:** "Deligne module" and "endomorphism field" each have one meaning.

**Witness:** The dictionary Check (`:1751`) calls the module `ℤ[i]` of the supersingular `1.2.ac` a Deligne module, a name 9.1 reserves for ordinary objects. `Suggested.lean` declares no `DeligneModule`. Line 189 defines "endomorphism field" as `𝔽_{q^d}`, not `ℚ(π)`.

**Repair:**
- Choose one name for the general object: "Weil lattice", or "Deligne module" as in Conventions. Use it in Conventions, 9.1–9.3 and the Checks.
- Write "the ordinary subcategory" in place of `DeligneModule q`.
- 3.4 Check: "with `End⁰(E) = F` imaginary quadratic".

## R07 (P3) — Supplier and source locators

**Location and witness:**
- (a) `README.md:1155–1156` (6.2) cites R07.2.16 for "slopes over a finite field are the `q`-normalized valuations of the eigenvalues of the linear Frobenius". R07.2.16 (its line 3569) defines slopes only over an algebraically closed `k`. CrystallineCohomology §CR.4.7 (line 6628; merge-order line 24) states the eigenvalue fact.
- (b) `:1128` (6.1): "A3.x duality" is not a section. The Cartier-dual kernels are AbelianSchemesAndArithmeticModuli A3.5 ("Dual isogenies, Cartier-dual kernels and Weil pairings").
- (c) `:1756–1757` (9.1 boundary Check): "`T² − 2` is not the polynomial of an abelian variety over `𝔽₂` (9.3 excludes `√p`)". 9.3's exclusion is a hypothesis of Centeleghe–Stix. The reason is `e(T² − 2) = 2` (3.3).
- (d) `:2140` (10.5): the resultant-one statement for every `g` carries only "(Serre's obstruction; HNR §2)". HNR §2 states Theorem 2.1 for `g = 2`. The Serre result is quoted in HNR §5, p. 7 (`hnr2009` line 516), with its sources.

**Repair:**
- (a) cite CrystallineCohomology §CR.4.7 for the eigenvalue statement, keeping R07.2.15–R07.2.16 for the slope decomposition. Add it to the `*Needs:*` line and the supplier contracts.
- (b) write "A3.5".
- (c) write "(3.3: `e(T² − 2) = 2`)".
- (d) cite HNR Theorem 2.1 (p. 5) for `g = 2`, and either cite the general result where HNR's p. 7 points (after reading it), or mark the general statement as proved here by the idempotent argument given.

**Test:** (a) at `q = 4` the instance `T² + 4` has eigenvalues `±2i`, with `v_2 = 1`, giving slopes 1/2, 1/2. This matches §CR.4.7's rule (divide by `r = 2`).

## R08 (P3) — Wrong internal cross-references and broken prose

**Location and witness:**
- `README.md:177`: "invariance under the choice of `L` is a theorem (1.3)". The invariance is 1.2; 1.3 is the `L`-polynomial.
- `:2247` (11.2): "the classification is excluded below". The exclusion is above, at `:154`.
- `:1317` (7.3): "iff `(T_ℓ π_B − 1)(T_ℓ B) ⊆ ℓ T_ℓ B + …`" is an elided formula. "A cyclic-or-not `ℓ`-group of order `ℓ^1` is cyclic" (`:1314`) should read "a group of order `ℓ` is cyclic".
- `:999–1000` (5.4): "an inclusion of free `ℤ`-modules of the same rank iff it is saturated" is not the intended statement. Since the image is saturated (A6.2), the inclusion is an equality iff the ranks agree.

**Repair:**
- Change "(1.3)" to "(1.2)" and "below" to "above (*Additional boundaries*)".
- Delete the "i.e. iff … + …" clause, since the next sentence gives the exact criterion.
- Rewrite the 5.4 sentence as stated in the witness.

## Previous findings

- **R01** (import §1.0 from CurvesOverFiniteFields Layer 1): **repaired.** §1.0 is gone ("§1.0" no longer occurs). Lines 320–346 add a `From CurvesOverFiniteFields` contract by section (1.1–1.11, 2.3, 3.4), and lines 99–105 move the polynomial layer to *Not owned here*. Lines 2259–2266 now read "CurvesOverFiniteFields is a supplier … not a consumer". Every name the contract cites resolves at that roadmap's head (see below). It states "Nothing from that roadmap is an input here" (its line 89).
- **R02** (cite `isGorenstein_of_finrank_eq_two`): **repaired** at lines 274–275, 1557–1560 and 1570.
- **R03** (`finite_weilPolynomials`): **repaired.** Lines 376–379 cite R28.5.1 by its heading only, and the name no longer occurs.
- **R04** (wrong reason at `p = 2`): **repaired.** Line 2059 now gives "`p ∣ b = 2 − 2q` makes the class non-ordinary". The added clause about `q = 4` is R03 above.
- **R05** (Provenance): **repaired** at lines 2415–2427. They now say "the file imposes no integrality over `ℤ`" and describe the self-dual trace-datum relation. The new counterexample `(3 + 4i)√2/5` has every conjugate of modulus `√2`, and `α² = (−14 + 48i)/25` has non-integral trace −28/25, so it is not an algebraic integer.

## Verified sound

**Gate and dependency check.** My gate run on the worktree reported every counter 0 and `OK`; the worker's gate adds `build=0 OK`. `git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds `README.md`, `Suggested.lean` and `metadata.toml`. The required dependency check:

```text
depcheck: 239 roadmaps, 2428 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or `moved:` line. In the merge order, DeligneWeightsAndPurity is at 84, ArithmeticStatisticsPartI at 104, AbelianSchemesAndArithmeticModuliPartII at 151, FunctionFieldArithmetic at 348, CurvesOverFiniteFields at 349, HyperellipticCurves at 386 and this roadmap at 387. `lake-manifest.json` is identical to main's (Mathlib `2fd255d9`, Tau Ceti as pinned there).

**Elaboration and signatures.** A scratch copy with `#check @name` for all 15 declarations, plus the cited library names, elaborated with `lake env lean`. The only diagnostics on the roadmap's declarations were the four `sorry` warnings (lines 38, 89, 115, 148). The elaborated types equal `scratch/signatures.md` and the README statements:
- `waterhouse` carries `[Field K] [Finite K] (hp : p.Prime) [CharP K p] (hr : 0 < r) (hq : Nat.card K = p ^ r)`.
- The three Layer 8 theorems carry `[Module.Finite ℚ E] [IsReduced E]` and `IsOrder E Λ`.
- The four leads with "dropped `[Algebra ℚ E]`" (`colon`, `multiplierRing`, `IsInvertible`, `WeakEquiv`) are definitions whose bodies use no `ℚ`-structure, so nothing is lost.
- `Suggested.lean` is unchanged since the previous head.

**Padding probe.** Each admitted theorem was replaced by `first | rfl | simp [the nine definitions] | infer_instance | decide | aesop` in a scratch copy. All four leave unsolved goals, so there is no padding. There is no `example`, no `set_option` and no sorry'd data.

**Headline inventory.**
- Stated: Waterhouse (4.6), the weak-equivalence colon criterion (8.6), the Gorenstein ideal criterion (8.4), and Picard finiteness (8.2).
- Not statable, and named in the docstring: everything that needs `π_A`/`End.charpoly` (Layers 1–7, 11), the simple-class carrier, canonical lifts (9.2), the Centeleghe–Stix representing objects (9.3), duals and polarizations (10.1–10.3), and the curve-to-Jacobian functor (10.4, 10.6).
- The pinned `TauCeti/AlgebraicGeometry/AbelianVariety/` has no Frobenius, characteristic polynomial or dual.
- Point counts over arbitrary extensions are statable (DeligneWeightsAndPurity's `finiteFieldPointCount`), but the count statements this roadmap owns are stated through `P_A`. Point-count invariance under isogeny is consumed (Part II F0.5).
- The pull-request description says `Suggested.lean` pins "the isogeny relation … the Frobenius order and Deligne modules". It pins none of these; the description should be updated (no change to the folder).

**Pinned declarations opened** (by `#check` or file, at the pins):
- Mathlib: `FiniteField.algEquivExtension` (an `l ≃ₐ[k] Extension k p n` from `finrank k l = n`), `PerfectField.ofFinite`, `Algebra.IsAlgebraic.isSeparable_of_perfectField`, `separableClosure.eq_top_iff`, `IntermediateField.topEquiv`, `littleWedderburn`, `Polynomial.resultant`, `Polynomial.finite_mahlerMeasure_le`, `IsArtinianRing.equivPi`, `IsArtinianRing.isField_of_isReduced_of_isLocalRing`, `AddCommGroup.equiv_directSum_zmod_of_finite`, `Scheme.fpqcTopology`, `Algebra.Etale`, `NumberField.IsCMField` (`NumberTheory/NumberField/CMField.lean`).
- Tau Ceti: `WeierstrassCurve.frobeniusTrace`, `WeierstrassCurve.pointCount`, `TateModule.map`/`map_id`/`map_comp`/`mapLinearMap` (`Algebra/Module/Torsion/TateModule.lean:218, 235, 241, 295`), `AbelianVariety.End.baseChange` (`End/BaseChange.lean:74`), `NumberFieldOrder.isGorenstein_of_finrank_eq_two` (`Orders/Gorenstein.lean:453`), `isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two` (`Orders/Quadratic/Basic.lean:143`), and `TauCeti.IsHyperellipticFunctionField` (`FieldTheory/FunctionField/Hyperelliptic/Basic.lean:87`).

**Cross-roadmap citations resolved:**

| Citation | Resolved at |
|---|---|
| CurvesOverFiniteFields (rev/1729, `ab3bbe02`) 1.1–1.11, conventions 7–12, 2.3, 3.4: `IsWeilPolynomial`, `IsWeilSymmetric`, `realWeilPolynomial`, intrinsic prefix, `pRank`, `IsOrdinary`, `isOrdinary_iff_not_dvd_coeff`, `IsSupersingular`, elevation formulas, `frobeniusAngles`, `angleRank`, `angleRank_eq_zero_iff`, `weilNumberField`, `isCMField_weilNumberField`, `weilPower`, `aroots_weilPower`, `weilPowerSum`, `weilRoots`, `weilRoots_finite`, `virtualCurveCount`, `virtualAbvarCount`, `eq_of_virtualCurveCount_eq`, `eq_of_virtualAbvarCount_eq`, Jacobian compatibility | lines 222–266, 424–998, 1048–1056, 1143–1155; its line 89 and Downstream table confirm one-way supply |
| DeligneWeightsAndPurity (#929) DWP.1 §§1.1–1.7, 1.9 | lines 911–1033: the adapter, deg `q^g`, `π_{A_{𝔽_{q^m}}} = π_A^m`; Milne II.1.3 (Rosati acts as complex conjugation); counts `∏(1 − a_i^m)`; curve count via `J`; `H¹ ≅ (V_ℓJ)^∨` with geometric Frobenius `P_{π_J}` |
| AbelianSchemesAndArithmeticModuli (#849) A0.2, A2.4, A2.5, A3.1, A3.3–A3.6, A3.9, A3.13, A4.1, A4.5, A4.9, A4.10, A5.1, A6.1–A6.5, A6.7, A6.8, A6.10–A6.15, A6.17–A6.19, A6.21, A6.30–A6.34, and the names `End.degRat`, `End.charpoly_eval`, `End.charpoly_coeff_zero`, `Polarization.rosati`, `frobeniusSemisimple`, `rationalNSAmpleCone`, `OverField.tateModule`, `QuadraticAbelianTwist` | headings at lines 676–3756; every name occurs |
| AbelianSchemesAndArithmeticModuliPartII (#1405) F0.1–F0.5, F0.8, F1.3, F1.5 (`C(π_A) = F^a`, `L = W(𝔽_{p^a})[1/p]`), F1.11, F3.1a–F3.1d, F3.2, F3.8, F3.10 | lines 2321–2917 |
| ArithmeticStatisticsPartI (#1171) Supporting constructions: "Tate's theorem over a finite field", "Finiteness of an isogeny class and of unpolarized classes" (marked lattices, `End⁰(A₀)^×`-orbits, inverse contravariant action at `p`) | its Supporting-constructions items 27 and 33 (headed at line 2518; item 33 read in full at line 2550) |
| FunctionFieldArithmetic (#1474) §§5.3–5.6 | lines 1808–1889 |
| SchemeAndStackFoundations (main) §0.29 `qPowerFrobenius`, §2.9 `muEtale`, §2.11 `hilbert90`/`fppf_kummer_sequence`, §3.6 `picardComponent_zero`/`jacobian_dim`/`picardSheafPoints`, §4.14 `hilbert_quot_schemes` (Noetherian `S`) | lines 1825, 3599, 3658–3664, 4905–4913, 5706–5718 |
| EtaleCohomologyFoundations (main) §F.0.3; JacobianChallenge (main) Layers A, D, E | ECF line 231; JC lines 111, 218, 332 |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) R07.2.15–R07.2.16; InverseGaloisAndArithmeticFundamentalGroups (#850) §IG.0.T1; ComplexMultiplicationAndExplicitReciprocity (#1254) 5.2; PELModuli (#966) M0.1–M0.2; FaltingsFinitenessAndIsogenyTheorems (#1004) R28.5.1; HyperellipticCurves (#1707) | FFG 3538, 3569 (R07); IG 345; CMER 779; PEL 431, 494 |

**Ownership.**
- CurvesOverFiniteFields and this roadmap now split the objects cleanly: polynomials there, geometric comparisons here, as CurvesOverFiniteFields' placement table (its lines 127–144) says.
- 10.6's tricanonical finiteness argument uses SchemeAndStackFoundations §4.14 and does not restate §4.15's `Mbar.algebraicFiniteTypeDM`.
- No fully qualified name in `Suggested.lean` clashes with a sibling's.
- Open pull requests not listed in the brief were read through `roadmaps show` where cited.

**Seeded source sample.**

| Target | Source, locator | Found |
|---|---|---|
| 1.1 | DWP.1 §1.1 (Milne AV II §1, pp. 75–76); A6.21; A3.9; SchemeAndStackFoundations §0.29 | as cited |
| 1.3 | DWP.1 §§1.3–1.4 (Milne II.1.3: Rosati is complex conjugation on `ℚ[α] ⊗ ℝ`); Part II F0.2; CurvesOverFiniteFields 1.1, 1.4 | ✓ |
| 1.4 | DWP.1 §1.9; A6.11; CurvesOverFiniteFields 1.10 (`aroots_weilPower`), 1.11 (`eq_of_virtualAbvarCount_eq` at `q ≥ 2`, subset-product argument) | ✓ |
| 1.5 | FunctionFieldArithmetic §§5.3–5.4; DWP.1 §§1.6–1.7; SchemeAndStackFoundations §§2.9, 2.11, 3.6; EtaleCohomologyFoundations §F.0.3; JacobianChallenge D–E | ✓ |
| 5.1 | Part II F0.2, F3.2; A6.4, A6.5; CurvesOverFiniteFields 1.9 | ✓ |
| 5.2 | `milne-av` II §2 (line 3233 ff., Theorem 2.1 at 3269); Part II F3.2; CurvesOverFiniteFields 1.10 | ✓ |
| 6.2 | Part II F1.3, F1.5; A4.5; R07.2.15 | ✓ |
| 6.2 | R07.2.16, for slopes as eigenvalue valuations | R07 (a) |
| 6.4 | CurvesOverFiniteFields 1.6, 1.10 | ✓ |
| 6.5 | CurvesOverFiniteFields 1.7; knowl `av.fq.frobenius_angles` (angles are `Arg(α_i)`, normalisation fixed by the stored data) | R02 |
| 8.7 | knowls `av.fq.is_zconductor_sum` (`R = ℤ + 𝔣_R`), `av.fq.is_zfvconductor_sum` (`R = ℤ[F,V] + 𝔣_R`), `av.fq.conjugate_stable` (`R = R̄`); AS lattices item | ✓ |
| 9.6 | `waterhouse1969` Theorem 4.1 (lines 619–626, printed 536); Theorem 4.2 (716–726: maximal orders / all orders containing `π` / orders containing `π` maximal at `p`); Theorem 4.5 (806–814: `Pic`-torsor; class number in the quaternion case) | ✓ |
| 10.3 | `hnr2009` Theorem 1.3 (line 89, p. 3: Weil's trichotomy over any field, mutually exclusive); Weil 1957 not readable | trichotomy ✓ |
| 10.5 | `hnr2009` §2 Theorem 2.1 (lines 197–199, p. 5); Serre result at line 516, p. 7 | R07 (d) |
| 10.6 | AlgebraicCurves Layers 4–5, 12; SchemeAndStackFoundations §4.14 (Noetherian base); Tau Ceti `IsHyperellipticFunctionField` | ✓ |
| 11.2 | knowls named per row; LMFDB API records of `1.2.ac` (`angles [0.25]`, `twist_count 3`, `max_twist_degree 8`, `p_rank_deficit 1`, `newton_elevation 1`), `2.2.ad_f` (`twist_count 4`, `geometric_extension_degree 6`, `size 1`, `has_jacobian 1`, `angle_rank 1`), `1.4.ae` (`twist_count 5`, `size 1`) | rows ✓; R08 for "below" |

**Adversarial pass.** Exact rational arithmetic: Weil powers by Newton's identities, discriminants by trace forms, maximal orders by `p`-saturation, groups by Smith forms, curve counts by enumerating `𝔽_{p^k}`. The rest was done by hand.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `waterhouse` | `q = 2`; `q = 49`; `q = 3` | `a ∈ {−2,…,2}`: ±1 since `2 ∤ a`, 0 since `r` is odd, ±2 since `a² = 2^{r+1}`; 7: `7 ≡ 1 mod 3`, excluded; ±14: `196 = 4·49`; `q = 3`: ±3 since `9 = 3^{1+1}`, 0 since `r` is odd | matches Waterhouse 4.1 |
| `weakEquiv_iff_one_mem` | `Λ = ℤ[i]`, `I = Λ`, `J = 2Λ`; `E = 0`; non-full diagonal `ℤ` | `½Λ·2Λ = Λ ∋ 1`; no maximal ideal and `1 = 0`; `(I:J)(J:I) = 2ℤ² ∌ 1` while the modules are isomorphic | holds; fullness is the separating hypothesis |
| `isGorenstein_iff_forall_invertible` | `ℤ[i]`; `ℤ[ε]` | dual `½ℤ[i]`, `2ℤ[i]·½ℤ[i] = ℤ[i]`; dual `½ℤ + ℚε`, colon product `ℤε` | reducedness is the separating hypothesis |
| `finite_pic` | `ℤ[2i]` | `1·2/(1·2) = 1` | ✓ |
| 1.1 | `π = 1 + 2i` | `π̄π = 5`; `π² = −3 + 4i`, trace −6 | ✓ |
| 1.3 | `T² − 2T + 5` | `j = 0`: 5 = 5; `j = 2`: 25 = 25; reversed formula gives 1 = 25 | ✓ |
| 1.4 | `T² − 2T + 5`, `T² − 2T + 2` | `P_2 = T² + 6T + 25`, count 32; `P_4 = (T + 4)²`, count 25 | ✓ |
| 1.5 Checks | trace-2 curve over `𝔽₅`, `ℓ = 3`; pointless genus-2 curve over `𝔽₂` | traces 2 vs `2·(−1) ≡ 1`; inverse transpose `2·5⁻¹ ≡ 1`; curve counts `0, 6, 9` over `𝔽_2, 𝔽_4, 𝔽_8` | ✓ |
| 5.1 | `P_E²`; `(T² − 2)²`; `P = 1` | multiplicity 2/1; 2/2 = 1; empty | ✓ |
| 5.2 | `T² − 2T + 2` at 4; `(T² − 2)²` at 2 | `(T + 4)²`, 2/2 = 1; `(T − 2)⁴`, 4/2 = 2 | ✓ |
| 5.6 milestones | `1.4.ae`; `2.2.ad_f`; `1.2.ac` | twists `a ∈ {±4, ±2, 0}`, count 5 (LMFDB 5); search of all Weil quartics over `𝔽_2` gives `(a₁,a₂) ∈ {(−3,5), (0,−1), (0,1), (3,5)}`, count 4 (LMFDB 4); degree 8 (LMFDB 8) | ✓ |
| 5.6 API bullet | `1.3.ad`/`1.3.d` | powers equal at `r = 2, 3, 4, 6`, unequal at 1, 5 | R01 |
| 6.2 | `T² + 4`, `q = 4` | `v_2 = 1`, normalized 1/2 | ✓ |
| 6.3 elevation | `T² + 2`; `(T² − 2)²`; `g = 3` | 1; 2 = `g(g+2)/4`; `1+1+2 = 4 = (g+1)²/4` | ✓ |
| 6.4 | `T² − 2T + 2` at 4 | `v_2(−4)/4 = 1/2` | ✓ |
| 6.5 | `1.2.ac`; `1.4.ae`; `2.2.ad_f` | angle 1/4 (not 1/8); 2 angles for `g = 1`; `θ₂ − θ₁ = 1/3`, rank 1 | R02 |
| 7.2 | `2i` on `ℤ[2i]`, on `ℤ[i]`; `−4` on `ℤ_2²` | `ℤ/4`; `(ℤ/2)²`; `(ℤ/4)²` | ✓ |
| 7.3, 9.5 | `y² = x³ + x + 2` and `y² = x³ + x` over `𝔽₅` | 4 points with one, resp. three, rational 2-torsion points: `ℤ/4` and `(ℤ/2)²`; `j = 1`, `j = 3` | ✓ |
| 7.5 | `y² + y = x⁵` over `𝔽₂` | counts 3, 5; `L = 1 + 4T⁴`, `h = 5` | ✓ |
| 8.1 example | `(T² − T + 2)(T² + T + 2)` | `[ℤ[π,V] : ℤ[π]] = 2`; discriminants 3136 / 784 / 49 | R04 |
| 8.3 | `π = 1 + 2i`; `2.2.ad_f`; `2.3.b_ac` | `−16 = 2²·(−4)`, `N(4i) = 16`; `N(π − V) = 9`, disc 225, `[R : ℤ[π]] = 2`, `R = 𝓞_F`; `N = 4`, `disc R = 4356`, `[R : ℤ[π]] = 3`, `[𝓞 : R] = 2`, `disc 𝓞 = 1089` | ✓ |
| 8.7 | `2.3.b_ac` conductor | `[𝓞 : 𝔣] = 4`, `ℤ + 𝔣 = R` | ✓ |
| 9.1 | `q = 5`; `(ℤ, 2)` at `q = 4`; `(ℤ[√2], √2)` | 5 = 5, −10 = −10, 25 = 25; rank 1; constant −2 | ✓ (R07 (c) for the reason) |
| 9.4/9.5 | `2.3.b_ac` | `R/(π − 1) ≅ ℤ/12`, `𝓞/(π − 1) ≅ ℤ/2 × ℤ/6` | ✓ |
| 9.6 | `y² = x³ − x` over `𝔽₉` | `π = −3`, `E[4] ≅ (ℤ/4)²`, 16 | ✓ |
| 10.3 | Weil's trichotomy | HNR Thm 1.3 (a)–(c), mutually exclusive | ✓ |
| 10.4 | `q = 2`: `(s,t) = (2,1), (1,1)`; `(a,b) = (0,−4), (−3,5)`; `q = 9`: `s = t = 6`; `q = 5`: `s = t = 0` | `|s − t| = 1`; `t² − 4q = −7`; `b = −2q`; no row; `s² = 4q`; no row | ✓ |
| 10.4 `p = 2` remark | `T⁴ − 6T² + 16` | valuations `(0,4),(2,1),(4,0)`, slopes 1/4, 3/4, `inv = 1/2` | R03 |
| 10.5 | `(x − 2)(x − 1)`; `(x − 2)·x` | Res 1; Res 2 | ✓ (proof route checked: `u h₁ + v h₂ = 1` gives Rosati-fixed idempotents) |
| 10.6 | `g = 2, 3` | degree 6 in ℙ⁴, `6n − 1`; degree 12 in ℙ⁹, `12n − 2` | ✓ |
| 11.1/11.2 | `(2,2,[−3,5])` | `q·a₁ = −6`, `q² = 4` | ✓ |
| Worked examples | `1.2.ac`, `1.5.ac`, `2.2.ad_f`, `2.3.b_ac`, `2.2.a_ae`, `1.4.ae` | abelian counts `1,5,13,25`; `4,32,148,640`; `1,19,76,171`; `12,48,1296,7104`; `1,1,49,81`; `(2^r − 1)²` for `r ≤ 10`. Curve counts `0,6,9,10`; `5,5,44,89`; `3,−3,9,1`. `P_{2.2.ad_f,6} = (T² + 11T + 64)²`; `P_{2.3.b_ac,3} = (T² + 8T + 27)²`. `y² = 2x⁵ + 2x⁴ + x³ + x` counts `5, 5, 44`; `1.4.ae` curve has 1 point | every value as stated |

## Not verifiable

- Weil 1957 (Göttingen Nachrichten): no legal copy found. The trichotomy was checked against `hnr2009` Theorem 1.3 instead.
- The source HNR names for Serre's obstruction (Lauter 2000 Lem. 1; Howe–Lauter 2003 Thm 1(a)): not in the manifest and not fetched. 10.5's proof route was checked directly.
- Tate 1966, Waterhouse–Milne 1971, Mumford §16, Neukirch I §12, Reiner §26: locator only. The statements attributed to them are standard and are consumed from suppliers.
- The LMFDB record for `2.3.b_ac`, and knowls not listed above: the site switched to a browser check partway through this round.

## Source issues

- none
