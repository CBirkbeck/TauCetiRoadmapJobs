# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at ec03322)

**Verdict:** needs changes

This is a full review of head ec033220b5fa8fd6642de80e1783ba64a3ade97e; the folder changed by 221 lines since 8a037af. There are three findings: one P2 and two P3.
- The P2 (R01) and one P3 (R03) carry over from the previous review. Their repairs lie outside this folder: one in QuaternionArithmetic's pull request, the other in this pull request's description.
- The other P3 (R02) is new: two lines of the README predate the previous reviews.

The other three findings of the previous review are repaired. In what follows, README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md` and Suggested.lean is the file beside it. Other roadmaps are cited by folder, with line numbers in their README at the head of their open pull request.

## R01 (P2) — Eichler orders and Brandt matrices still have two owners

Carried over: R02 of the previous review and R01 of the one before. Neither repair report marks it as not actionable.

**Location.** README:9, “For quaternion orders they are Eichler orders, with their local form over every discrete valuation ring … together with the neighbour ideals and their Brandt matrices at places prime to the level (§§R18.5.16a, R18.5.16c)”.

**Claim.** QuaternionArithmetic (#1722, roed-math) still defines both objects itself, including the unit index of item 4. From this roadmap it consumes only R18.1, §R18.3.1 and §R18.5.17a. QuaternionArithmetic consumes this roadmap, so this roadmap is the earlier owner, and QuaternionArithmetic has to cite it.

**Witness.** The head of #1722 is still 75c9080. Its README has:
- §1.9 “Eichler orders” (line 660);
- §1.10 with `[GL₂(R_𝔭):O_0(𝔭^e)^×]=N𝔭^{e-1}(N𝔭+1)` (line 685);
- §§7.1–7.3 on Brandt matrices (lines 1491–1528);
- the consumed list at lines 169–170.

Its Suggested.lean declares `def IsEichler` at line 216.

**Repair.** The edit belongs in #1722:
- §§1.9, 1.10 and 1.12 cite §R18.5.16a, items 1–4;
- §§7.1–7.3 cite §R18.5.16c for `T(𝔭)=B(v)ᵀ` at primes prime to the level;
- each kept variant says in one clause how it differs;
- the consumed list adds §§R18.5.16a and R18.5.16c.

Nothing in this folder changes. If the author cannot get that edit into #1722, the repair report should record this finding as not actionable in this package, giving that reason, so that the board hands it to a human instead of starting another round.

**Test of the repair.** At D=11, QuaternionArithmetic's `T(2)=[[1,3],[2,0]]`, whose column sums are 3, is the transpose of §R18.5.16c's `B(2)=[[1,2],[3,0]]`, whose row sums are 3. The citation therefore loses nothing.

## R02 (P3) — Two earlier roadmaps are listed as downstream consumers

**Location.**
- README:4429: “**SmallRamificationAndAbelianVarietyBaseCases** uses the interfaces of R18.6.”
- README:4434: “**NeronModelsAndSemistableAbelianVarieties**, **CompletedCohomologyAndLocalGlobalCompatibility** and **PerfectoidShimuraVarieties** use the arithmetic Drinfeld quotient and its graphs.”

**Claim.** Both roadmaps come earlier in the merge order, and neither consumes this one. NeronModelsAndSemistableAbelianVarieties is a supplier here (Layer 4, §§3.14, 4.2, 4.14; README:31, 116). Listing it as a consumer states a supply edge in the wrong direction, which is a two-way edge.

**Witness.**
- Merge order: Neron is at line 51, SmallRamification at line 116, this roadmap at line 157.
- Neron (#852), README:2908–2911, calls §§R18.5.17–R18.5.18 producers instantiating its targets; “Drinfeld” never occurs there.
- SmallRamification (#970) never names this roadmap; it builds its Shimura-curve Jacobian itself (README:1946–1959).

**Repair.**
- Delete the SmallRamificationAndAbelianVarietyBaseCases sentence from README:4429.
- Delete NeronModelsAndSemistableAbelianVarieties from README:4434.

README:116 already records the actual relation: §§R18.5.17a–R18.5.18 realize Neron's interfaces.

**Test of the repair.** After the deletion, every named consumer comes later in the merge order:

| Consumer | Merge-order line |
| --- | --- |
| SerreWeightAndLevelOptimisation | 160 |
| AutomorphicGaloisRepresentations | 162 |
| PadicFamilies | 168 |
| OrdinaryAutomorphicFormsAndModularityLifting | 169 |
| GL2ModularityLifting | 170 |
| PotentialModularityAndCompatibleSystems | 171 |
| HodgeTateAndCanonicalSubgroups | 179 |
| PerfectoidShimuraVarieties | 180 |
| OverconvergentAutomorphicForms | 252 |
| CompletedCohomologyAndLocalGlobalCompatibility | 253 |
| GrossZagierAndArithmeticHeights | 339 |
| HeegnerPointEulerSystems | 372 |

QuaternionArithmetic is not in the merge order yet and consumes this roadmap.

## R03 (P3) — AlgebraicTopology Layer 6 exists only at #1652, which the description does not name

Carried over: R05 of the previous review. It is not repaired.

**Location.**
- README:45: “AlgebraicTopology, Layer 6”.
- README:100: the contract.
- README:3611: the link `…#layer-6-cohomology-products-and-manifold-duality`.

**Claim.** That numbering exists only at the head of #1652 (kim-em), so citing it makes #1652 a dependency. The description names #1652 neither in its Depends-on list nor in its merge-order paragraph.

**Witness.**
- On main, AlgebraicTopology README:946 is “## Stage 6: …”.
- At #1652 (head 4e825d6), README:1578 is “## Layer 6: …”.
- #1663 (head 8029fe9) keeps “Stage 6” at README:1086.
- The string “1652” occurs nowhere in the description.

**Repair.**
- Add “#1652 AlgebraicTopology (kim-em)” to the Depends-on list.
- Put #1652 before this pull request in the merge-order paragraph.
- Leave the README as it is.

**Test of the repair.** After the edit, the overlaps report's only “defined only by an open revision” items are the two AlgebraicTopology Layer 6 citations, and both are covered by the named dependency. The other 33 anchored links resolve at main or at their supplier's head.

## Previous findings

These are the findings of the previous review, of 8a037af.

- **R01 (K₀, K₁ and their quotient had two owners): repaired.**
  - README:9 now reads “these groups are those of AutomorphicLFunctionsAndLocalFactors AL.2.2.1, … and the statements here differ from it only in that generality”.
  - The supplier table (README:33) and a contract (README:134) were added.
  - §R18.5.16a's *Needs:* names AL.2.2.1.
  - Item 4 keeps only the bottom-row reduction, the indices and the lattice count over a local ring.
  - I checked the supplier text: AL.2.2.1 at #924 (head 4ea5784) states the subgroups, the normality and `K₀/K₁≅(O/Pⁿ)×`, and GL2 §R16.1.3 at #931 (head ce17c6f) states the quotient.
- **R02 (Eichler orders and Brandt matrices): not repaired.** #1722 is unchanged at 75c9080. This is R01 above.
- **R03 (Suggested.lean stated non-headline targets): repaired.** Suggested.lean declares nothing, and its docstring names each headline with its missing carrier. README:5 and README:188 now say that the file states no theorem. §§R18.5.16a–R18.5.16b carry no backticked names of this roadmap's own.
- **R04 (`TauCeti.IntegralOrder.leftOrder`): repaired.** The name occurs nowhere in the README. README:94, 2357, 2370, 2389 and 2572 use `Submodule.leftOrder`, which `#check` confirms at the pin.
- **R05 (AlgebraicTopology Layer 6): not repaired.** This is R03 above.

## Verified sound

**Validation.**
- **Head and pins.** Head ec033220b5fa8fd6642de80e1783ba64a3ade97e. Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e, Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5.
- **Files.** The diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.NT"`).
- **Gate.** The worker's gate is 0 on every rule, including `build=0`. My rerun is 0 on every text rule, `OK`, exit 0.
- **Dependency check.** Output, exactly: `depcheck: 245 roadmaps, 2499 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0 with no output; the file declares nothing, so there is no `sorry` warning either.
- **Form of Suggested.lean.**
  - One `public import Mathlib`, which 8 Suggested.lean files on main also use, and no `TauCeti.*` import.
  - No `set_option`.
  - Title “…: target signatures”, then `namespace TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves`.
  - The docstring names all four headline groups (§R18.5.15, §§R18.4.32–R18.4.33, §R18.3.8, §§H6.2–H6.8), their deep inputs and the carrier each one lacks.
- **Signatures and padding.** There are no declarations, so the `#check @` comparison and the one-tactic probe are both vacuous.

**Library declarations checked at the pins.**
- A scratch file with `#check @` of 63 cited names elaborates without error, among them:
  - Tau Ceti: `Submodule.leftOrder`, `Submodule.leftOrder_isOrder`, `Subalgebra.leftOrder_toSubmodule`, `TauCeti.IntegralOrder.IsOrder`/`IsMaximalOrder`, `TauCeti.GL2Borel`/`.diag`/`.mem_iff`, `DoubleCoset.quotientMapOfLERight`(`_surjective`, `_trans`), `DoubleCoset.doubleCoset_inv`, `TauCeti.preimage_orbit_eq_doubleCoset`, `TauCeti.stabilizerOrbitRelQuotientEquivOrbitRelMapFiber`, `TauCeti.card_fiber_orbitRel_map_of_stabilizer_le_normalCore`, the `TauCeti.LocalCoefficientSystem` API with `twistedCochainComplex`/`twistedCohomology`/`twistedCochainComplexCoefficientMap`, and `TauCeti.exists_trace_mul_algebraMap_eq`;
  - Mathlib: `HeckeCoset`, `IsHeckeTriple`, `Representation.coind`, `Rep.resCoindAdjunction`, `groupCohomology.H1ofAutOnUnitsUnique`, `groupCohomology.exists_div_of_norm_eq_one`, `Module.free_of_finite_type_torsion_free'` and `IsDedekindDomain.FiniteAdeleRing`.
- Eleven names whose object files are not built were read at the source:
  - `TauCeti.SU2.finrank_symPower` (`RepresentationTheory/SU2/SymmetricPower.lean`:114), `isIrreducible_symPower` (`Irreducible.lean`:164) and `existsUnique_nonempty_equiv_symPower` (`Exhaustion.lean`:298);
  - `TauCeti.symPowerRep` (`ClassicalGroups/SymmetricPower.lean`:57);
  - `HeckeRing.GL2.degree_diagCoset_prime_pow` and `deg_heckeT` (`NumberTheory/HeckeRing/GL2/Degree.lean`:54, 146);
  - `NumberField.units_sq_index_eq` and `card_elementaryTwoQuotient_units` (`Units/ElementaryTwoQuotient.lean`:84, 62);
  - `NumberField.NarrowClassGroup.instFinite` (`NarrowClassGroup/Finite.lean`:38) and `exists_mk0_eq_and_isCoprime_absNorm` (`CoprimeRepresentative.lean`:162);
  - the module `TauCeti.RingTheory.IntegralOrder.LeftOrder`.
- **Borel convention.** `TauCeti.GL2Borel.mem_iff` is entry (1,0)=0, and `diag` has entry (1,1) as its second component. So item 4's pullbacks are exactly AL.2.2.1's conditions `g₂₁∈Pⁿ` and `g₂₂−1∈Pⁿ`.

**Citations.**
- The five leads of citations.md resolve:
  - `LocallySymmetric.SheafDerived.isoSingular` and `LocallySymmetric.FrankeInput`: ArithmeticLocallySymmetricSpaces at #871, README:833 and 529;
  - `CanonicalModel.minimal_defined_over_reflex`: ShimuraVarieties at #933, §8.18, README:2753–2755;
  - `OrderIdeles.completion` and `OrderIdeles.unit_change`: ClassicalArithmeticCompletion on main, README:16154–16155;
  - `TauCeti.RingTheory.IntegralOrder.LeftOrder` is a module name that exists at the pin.
- 33 of the 34 anchored cross-roadmap links resolve at main or at their supplier's head; the exception is R03. These include the new GL2 §R16.1.3 citation (#931, README:593) and ClassicalArithmeticCompletion §§7.4, 7.20, 7.21, 7.54, 7.55, 7.72 and 7.78 on main.
- The 70 ids of this roadmap that other roadmaps cite, at main and at the 478 open heads, all exist as headings here, so this pull request drops no cited id.

**Ownership, checked by object.**
- `K₀`, `K₁` and their quotient now have a single owner, AutomorphicLFunctionsAndLocalFactors (merge order 86 < 157).
- Eichler orders and Brandt matrices: R01.
- QuaternionicModularForms (#934, head e40ec42) §§0.2–0.3 also states the levels with their indices and the refinement fibres.
  - It is on the excluded-supplier list, so on this side the only admissible settlement is to own them, as this head does.
  - HilbertModularForms (#1724) §10.3 defines nothing new; it takes Brandt matrices from QuaternionicModularForms.
- HilbertModularSurfaces (#1730), the Part II roadmap (#1745), CompletedCohomologyAndLocalGlobalCompatibility (#1270), AutomorphicGaloisRepresentations (#1007), PotentialModularityAndCompatibleSystems (#1075) and SerreWeightAndLevelOptimisation (#1013) cite this roadmap. AutomorphyLiftingBeyondTaylorWiles (#1824) has “Ihara avoidance”, which is a different object.
- The pinned Tau Ceti has no Eichler orders, Brandt matrices or Drinfeld half-plane.
  - Its `CongruenceSubgroup` files are principal congruence subgroups of Hopf algebras.
  - `DoubleCoset/Fiber.lean` has only the orbit form, which §R18.5.16b turns into the double-coset form.
- Suggested.lean has no names, so no fully qualified name collides with another roadmap's.

**Headlines and statability.**
- **Čerednik–Drinfeld (§R18.5.15), the curve Ihara lemma and saturation (§§R18.4.32–R18.4.33), and H6.** These need formal and rigid Drinfeld quotients, étale cohomology of Shimura curves with Galois-attached ideals, and Hilbert moduli. None is at the pins.
- **The definite Ihara lemma (§R18.3.8).** It is the closest to statable. It would still need four things together:
  - a topology on `(D⊗𝔸_{F,f})×` that the pins do not provide as an instance;
  - local embeddings at split places;
  - Hecke operators on the class-set functions;
  - KW's abelian-splitting Eisenstein condition.

  Together these would be a long ad hoc encoding, and the level forms are GL2 §R17.3.8b's target. So the empty file is correct.

**Seeded sample.** The 15 labels are mapped to targets with readable texts. Tay02, BZ22, KW09 and DP94 were fetched through the sources service into a scratch manifest.

| Label | Target | Source (`<id> line N`) | Result |
| --- | --- | --- | --- |
| Definition | §R18.5.16a, Eichler orders | Voi21 lines 15521–15587 (Def 23.4.1, Prop 23.4.3 and proof) | Supported. The proof uses only Smith normal form over a PID (line 15551), so item 1 holds over every DVR. |
| Definition | §R18.5.16c, Brandt matrices | Voi21 lines 31603–31612 ((41.2.3): the column is the counted ideal), 31865–31890 (Prop 41.4.3, (41.4.5)–(41.4.6)) | Supported: `B(v)=T(𝔭_v)ᵀ`. Voight assumes 𝔫 narrowly trivial for self-adjointness; the README's “principal” is sharper and correct. |
| Definition | §H2.1, Hilbert local model | DP94 lines 349–352 (§3.2, p.68), 436–468 (§§4.1–4.2, pp.70–71) | Supported. §4.2's `i+j=N` gives the README's `(Te₁,Te₂)` example. |
| Construction | §R18.5.17a, class-set graph | Zha14 lines 594 (§3.4, p.207), 629–650 ((3.14)–(3.17), pp.208–209) | Supported |
| Construction | §R18.4.29, weak patching | MS19 lines 920 (Def 4.1, p.19), 960–988 (Props 4.2–4.5, p.20), 1004 (Lemma 4.7, p.21), 1279–1486 (Props 4.14–4.21, pp.26–30) | Supported |
| Construction | §H6.2, twisted torsion moduli | Tay02 lines 422–435 (fine smooth moduli of quintuples, internal p.13) | Supported |
| Construction | §R18.3.2, integral weights | KW09 lines 2690–2699 (`W_k`, ψ=N^{2−k}, k=2 at p=2, p.58), 2722 (display (5), p.59) | Supported |
| Comparison | §R18.4.24a, semistable comparison | Sai09 lines 1373 (§7, p.32), 1452–1466 (§8, Tsuji, p.34) | Supported |
| Comparison | §R18.1.1a, central twist | BZ22 lines 2559–2575 (Thm 6.7, p.49), 2681 and 2706 ((7.1)–(7.2), p.52), 2860–2909 (Prop 8.4, (8.11), Cor 8.5, pp.55–56) | Supported |
| Comparison | §R18.5.18, torsion realization | Zha14 lines 1245–1267 (§6.3, p.228: inertia invariants as an extension of Φ[p] by `A⁰[p]`) | Supported |
| Theorem | §R18.3.8, definite Ihara (headline) | MS19 lines 1718–1754 (§6.2, Thm 6.8 and proof, pp.34–35) | Supported, including the README's `ω⁻¹` correction |
| Theorem | §R18.4.32, residual Ihara (headline) | MS19 lines 1700–1717 (Thm 6.5, Remarks 6.6–6.7, p.34), 1931–1958 (proof, p.38) | Supported |
| Theorem | §R18.4.30, Steinberg flatness | MS19 lines 1568–1640 (Lemmas 5.1–5.3, pp.31–33), 1875–1930 (Props 6.10–6.12, pp.37–38) | Supported. The README's ring-swap correction is right (Source issues). |
| Theorem | §R18.5.15, Čerednik–Drinfeld (headline) | BZ22 lines 2412–2423 ((6.29)–(6.31)), 2559–2580 (Thm 6.7, Cor 6.8, p.49) | Supported |
| Theorem | §H6.4, real points (headline group) | Tay02 lines 416–421 (Lemma 1.4, internal p.13), 436 | Supported. Taylor uses `E⊗O_M`; the README's ordered trace lattice is an equivalent route. |

The page conventions behind these locators:
- Tay02: internal page = PDF page − 1; the page-2 footer reads 1.
- DP94: printed page = PDF page + 58.
- KW09, MS19 and Zha14: the PDF pages match the cited pages directly (Zha14 printed page = PDF page + 190).

No README locator is flagged as unverified.

**Adversarial pass, computed this round.**

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| §R18.5.16a item 4, indices (local ring) | Brute force over `ℤ/8` with I=(4) and I=0; `𝔽₂[x,y]/𝔪²` (not a domain) with I=0 and I=𝔪; `ℤ/9` with I=(3); `ℤ/4` with I=(2) (residue field 𝔽₂); I=A | `[GL₂:K₀]`,`[GL₂:K₁]` = 6,12; 12,48; 12,48; 3,3; 4,8; 3,3. Each satisfies `q·i₀=#(A/I)(q+1)` and `q²·i₁=#(A/I)²(q²−1)`. At I=A the indices are 1,1 against 3/2, so `I≠A` is needed. | Correct |
| §R18.5.16a items 1, 3, 5 | Voi21 route; `n=(0 1;ϖ 0)`; `ℙ¹(ℤ/4)`; `ℤ₂` at e=2 | `n(a b;c d)n⁻¹=(d cϖ⁻¹;ϖb a)`, `nM₂n⁻¹∩M₂=O₀(ϖ)`, `n²=ϖ`. 12 rows / 2 units = 6 points. `[K₀(4):K₁(4)]=12/6=2=#(ℤ/4)×`. | Correct; consistent with AL.2.2.1 |
| §R18.5.16b | `S₃`, `Γ=U′=⟨t⟩`, `U=S₃`; `U′=A₃` | 2 orbits = 2 double cosets (sizes 2 and 4); `⟨t⟩A₃=S₃` gives 1; `Γ=U′=A₃` gives `2=2·1` | Correct |
| §R18.5.16c item 4 | D ramified at {23,∞}; `ℚ(√10)`, `(−1,−1)` | (2,1,3): `w₂B₁₂=2=w₁B₂₁`, `w₃B₂₃=3=w₂B₃₂`. ζ_F(−1)=(18+26+24+2)/60=7/6; `Σ1/w=1/12+1/2+1/3+1/4=7/6`; `w₄B₁₄=12=w₁B₄₁`, `w₃B₂₃=6=w₂B₃₂`, `w₄B₂₄=4=w₂B₄₂` | Correct |
| §R18.3.8 (headline) | MS's Eisenstein (`ρ̄_m` reducible) against KW's (p.59); F=ℚ, D_{2,∞}, H maximal; kernel relation | Reducible ⇒ T_v≡2, S_v≡1 at v split in the field cutting out χ₁,χ₂,ζ_l. Conversely, trace 2 on `G_L` ⇒ `ρ̄(G_L)` unipotent normal ⇒ reducible: the same ideals. #Y_H=1; kernel `(c,−c)`; T₃=4 on constants. `f(xω⁻¹hω)=−g(xω⁻¹h)=f(x)`; with MS's `g(xω)`, `ω⁻¹(1 1;0 1)ω=(1 ϖ⁻¹;0 1)∉H`. | Correct |
| §R18.4.32 (headline) | MS Thm 6.5 conditions; l=2; `√5∉F` | (1) and (2) match; l>2 is MS's standing hypothesis (MS19 line 633); condition (2) is automatic if `√5∉F` | Correct |
| §§R18.4.17, R18.4.33 (headline) | `O→O²`, `x↦(x,0)`; `×λ` on O | The cokernel mod λⁿ is `O/λⁿ`: free over `O/λⁿ` but with λ-torsion. `×λ` is injective with zero residual map. | Correct |
| §§R18.4.14–R18.4.16 | G and J entries; (q,T,S)=(2,3,2) and (2,3,1) | Diagonal of GJ is `(q+1)²−S⁻¹T²`; off-diagonal is `(q+1)(−S⁻¹T)+S⁻¹T(q+1)=0`. G(0,1)=(3/2,3); Δ=0 and G(1,−1)=0 | Correct |
| §R18.4.30 | A=k[[t]] with R=A[[x]], M=R; and R=A, M=k | 2=1+1, flat; dim k=0≠1, not MCM and not flat. Lemma 5.2 needs the X²Y ring, since `M(σ_ps)` is not killed by XY. | Correct |
| §§R18.5.15, R18.1.1a (headline) | disc 6, v=2, level `1+7M₂(ℤ₇)`; `M₂(ℚ)` | inv₂=½, B̌ ramified at {3,∞}. c₂=2⁻¹ mod 7=4; Π⁻¹ gives 2; the central 2-idele gives 16≡2; 2·2=4. Both 4 and 2 have order 3. inv₂(M₂)=0, so it is excluded. | Correct |
| §H6.5 (headline input) | x³−3x+1, l=7, p=19; (C6) at `ℚ(√3)`, `ℚ(ζ₁₂)` | disc 81. Values mod 7 are 1,6,3,5,4,6,3. Roots 3,7,9 mod 19. `π₇²−π₇+7=0` and `π₇³=−10−9√−3`, of norm 343, reducing to 7 and 11 (7·11≡1). 343≡1 mod 19. `N(β−β^c)=972=2²3⁵`. h(N)=1 while h⁺(M)=2. | Correct; (C6) is needed |
| §H6.4 (headline) | real elliptic curve; `+I₂`, ℓ odd | Eigenvalues +1,−1, det −1. With `+I₂`, `e(x,y)=−e(x,y)` forces e=0. | Correct |
| §H2.1 | `k[T]/T²`; O=ℤ | `⟨ae₁+be₂,Te₁⟩=−bT` gives `W^⊥=(T)⊕(T)=W`, of k-dimension 2, not free of rank one; for O=ℤ the model is ℙ¹ | Correct |
| §§H0.3–H0.5 | trace dual of `O⊕c⁻¹𝔡⁻¹`; row stabilizer; `ℚ(√2)` | `y₂∈𝔡⁻¹`, `y₁∈c` gives `c⊕𝔡⁻¹=cL_c`. Entries `[[O,(c𝔡)⁻¹],[c𝔡,O]]`. 𝔡=(2√2) has norm 8. | Correct |
| §§H3.2–H3.3 | `ℚ(√2)`, M=12; `ℚ(√3)`, N=7 | ε⁴≡5, −ε⁴≡7, ε⁸≡1 mod 12, so ε⁸∉S₁₂. S²=3I, `f†f=97+56S`, f≡4iS, f²=−48≡1, trace 0, η≡−1, ±u∉U₇ | Correct |
| §H4.19 | `ℚ(√2)`, p=2, N=5, n=2..6 (computed) | ord(ε mod 5)=12, `U_{2ⁿ}=⟨ε^{2ⁿ}⟩` and `U_{5·2ⁿ}=⟨ε^{3·2ⁿ}⟩`, with no −ε^k in either. Δ_n(5)≅ℤ/6 with ×2 transitions; the limit is ℤ/3. | Correct |
| §R18.5.18 | Tate curve with v(q)=ℓ | `T^I=E[ℓ]` (dim 2), toric part μ_ℓ (dim 1), Φ[ℓ]=ℤ/ℓ. The toric Frobenius is `q·f(F⁻¹x)`. | Correct |
| §§R18.3.2, R18.3.7 | d=2, k=4; `Sym²(ℤ₂²)`; `ℚ(√3)` | Rank 9. Gram `[[0,0,2],[0,−1,0],[2,0,0]]`, det ±4. Minkowski bound √12/2≈1.73<2 gives h=1; `x²≡2 mod 3` is impossible, so h⁺=2. | Correct |

**Changed passages, read in full.** README:5, 9, 33, 94, 134, 136 and 188; §§R18.5.16a–R18.5.16c (README:2355–2445); README:2570–2572; the whole of Suggested.lean.

## Not verifiable

- **Voi21's printed pages.** The sources service treats the Springer open-access PDF (DOI 10.1007/978-3-030-56694-4) as a paywalled host and does not fetch it. The cached author edition v1.0.5 is paginated differently: §23.4 is on p.373 there, against the README's pp.382–383, and (41.2.3) on pp.753–754, against pp.767–768. Theorem numbers and contents were verified; the printed pages in §§R18.5.16a–R18.5.16c were not.
- **Sources not in this round's sample.** BHW23, BC91, Car86, Car86a, YZ18, KL05, ACC+23, Rap78, CDN20, CDN23, EGS15, Kis08, Tay06, Tay89, Dim05, Dia21, AIP, KRZ20, Kur79, PRR23, NT16, Mil, Del80, JL70, BR10 and Conrad were not reread. Their locators are untouched since earlier reviews.
- **The package manifest.** It records only Voi21, Zha14, MS19 and Sai09. This review edits no manifest; Tay02 (OCR), BZ22, KW09 and DP94 were read from the service's cache through a scratch manifest.

## Source issues

- **Misprint** in MS19 at the proof of Theorem 6.8, p.35: the source writes the kernel relation as f(x)=−g(xω); with its own π₂=ρ_{ω⁻¹} (§2.11, p.10) it should be f(x)=−g(xω⁻¹); affects the proof.
- **Misprint** in MS19 at the proof of Theorem 6.8, p.35: the source gives the target of the reduced norm as F^×\A^×_{F,f}/ν(H); it should be the totally positive F^{×,+}, as in its Proposition 2.3, p.9, since the norms of a totally definite algebra are totally positive; affects the proof.
- **Misprint** in MS19 at the opening of §6, p.33, and at Theorem 1.4, p.4: the source calls D ramified at exactly one infinite place; it should be split at exactly one infinite place, the indefinite case of its §2.2, p.7; affects nothing.
- **Misprint** in MS19 at the proofs of Propositions 6.11 and 6.12, p.38: the source swaps the ambient rings; Lemma 5.2 needs the X²Y ring R^ps_∞ in 6.11, and Lemma 5.3 needs the XY ring R^unip_∞ in 6.12; affects the proof.
- **Gap** in Tay02 at the proof of Lemma 1.2, internal p.11: the source makes the polarization module principal using surjectivity of the norm onto the wide class group of M; it needs the narrow class group, which can fail (M=ℚ(√3), N=ℚ(ζ₁₂)); affects the proof.
