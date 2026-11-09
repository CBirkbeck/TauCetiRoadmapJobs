# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 7c9252d)

**Verdict:** needs changes

This is an incremental re-review of the 48 lines changed since e3fd9ae. All of them are in the README; `Suggested.lean` is unchanged.

One finding remains:
- **R01 (P2) carries over.** Its repair belongs in #1722 and #2026, and neither has made it. Both heads have moved since the last review.

The previous R02, R03 and R04 are repaired, and the change introduces no new defect.

README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md`. Line numbers in other roadmaps refer to the raw README at the head named.

## R01 (P2) — Eichler orders and Brandt matrices still have second owners in later roadmaps

Carried over from R01 of the previous review. No repair report marks it `not actionable in this package`. Since the last review, #1722 has moved from 797c405 to 5b4cda93 and #2026 from 82ce1e4 to 5fdb26da. Neither head makes the repair.

**Location.**
- README:9: “For quaternion orders they are Eichler orders, with their local form over every discrete valuation ring … together with the neighbour ideals and their Brandt matrices”.
- README:2365, §R18.5.16a item 1: the two maximal orders are the ends of the path of length e in the tree.
- README:2425, §R18.5.16c, the Brandt matrices `B(v)`.

**Claim.** This roadmap is at merge-order line 160 and owns two objects:
- the local form of Eichler orders, including the unique pair of maximal orders at distance e;
- the Brandt matrices at places prime to the level.

Two later open roadmaps state these objects without citing it.
- **QuaternionArithmetic (#1722).** It consumes this roadmap, so it comes after it.
  - At its new head, §1.11 hands the distance-one adapter to ArithmeticFuchsianGroups §1.2.
  - §1.11 then proves the distance-e statement itself.
  - Layer 7 owns Brandt matrices with no citation of §R18.5.16c.
- **ArithmeticFuchsianGroups (#2026, merge-order line 284).** §1.2 states that adjacent vertices give maximal orders meeting in an Eichler order of level v, and its *Needs:* line omits this roadmap.

**Witness.**
- **#1722 (5b4cda93).**
  - README:787–788: “Prove here the statement at distance `e`: two vertices at distance `e` have intersection an Eichler order of level `𝔭^e`”.
  - README:64 and 1615 own Brandt matrices.
  - Neither README:186 nor README:252–256 cites §§R18.5.16a or R18.5.16c.
- **#2026 (5fdb26da).**
  - README:575–577 state the adapter, including adjacency.
  - The §1.2 *Needs:* line (README:620–623) does not name this roadmap.

**Repair.** Nothing in this folder changes.
- **In #1722:**
  - §1.11 (README:779–790) consumes §R18.5.16a item 1 for the distance-e statement instead of proving it.
  - §§7.1–7.3 cite §R18.5.16c, with `T(𝔭)=B(v)ᵀ` at primes prime to the level.
  - The consumed list (README:186 and 252–256) adds §§R18.5.16a and R18.5.16c.
- **In #2026:** the §1.2 *Needs:* line adds HilbertModularVarietiesAndShimuraCurves §R18.5.16a, item 1 at e=1.

If either edit cannot be made there, the repair report records this finding as `not actionable in this package`, with that reason.

**Test of the repair.**
- **Distance e=2 over ℤ₂.**
  - The lattice `ℤ₂e₁⊕4ℤ₂e₂` has endomorphisms with `c∈4ℤ₂` and `4b∈ℤ₂`.
  - Intersecting with `M₂(ℤ₂)` gives `O₀(4)`, of additive index `4=2²` (item 4, Lattices).
  - Its two maximal orders are the ends of the path `[ℤ₂²]–[ℤ₂⊕2ℤ₂]–[ℤ₂⊕4ℤ₂]`. This is #1722's §1.11 statement at e=2.
- **Transposition.**
  - #1722 counts `T(𝔫)_{ij}` as subideals of `I_j` in class i (README:154).
  - §R18.5.16c counts `B(v)_{ij}` as v-neighbours of `I_i` in class j.
  - So `T(𝔭_v)=B(v)ᵀ`. Its column sums equal the row sums of `B(v)`, which are `q_v+1`.
- **#2026, v=2 over ℚ.** `[GL₂(ℤ₂):K₀(2)]=3`, which agrees with #2026's Check (README:616): `Γ₀(2)` has index `3`.

## Previous findings

- **R01 — not repaired.** #1722 (5b4cda93) README:787–788 still reads “Prove here the statement at distance `e`”, and README:186 cites only R18.1, R18.3.1 and R18.5.17a. #2026 (5fdb26da) §1.2 *Needs:* (README:620–623) omits this roadmap. This is R01 above.
- **R02 — repaired.** The description's merge-order paragraph now reads “#1077 (IndexTheory) → #1652 (AlgebraicTopology) → #816”, so #1652 is ordered before this pull request. README:46, 3607 and 3615 keep “Layer 6”, as the repair asked.
- **R03 — repaired.**
  - README:1571 reads “earlier layers H0, H1, H2, H4, H5 … (R07.4.20–R07.4.24, R07.6) … ShimuraVarieties (§8.18)”.
  - README:1763 reads “(§§P.1–P.3, 4.1–4.2, 4.9, 8.1–8.7, 8.22)”.
  - README:3360 reads “(SR.0.1–SR.0.2, SR.0.4, SR.2, SR.3)” and adds `HeckeCoset` and `IsHeckeTriple`.
- **R04 — repaired.**
  - README:101 names the pinned `rayClassArtinEquiv`, `hilbertClassField`, `narrowHilbertClassField`, `narrowHilbertClassArtinEquiv`, `fieldRange_le_narrowHilbertClassField_iff` and `cyclicHasseNorm`, with their modules.
  - It leaves the principal splitting criterion to Layer 13.
  - README:1496 adds the narrow-class-field names for (C6).

## Verified sound

### Gate, build and form

- **Gate.** I reran the full gate on 7c9252d. Every rule is 0, it ends `OK`, and it exits 0. The worker's gate.md also reports `build=0`.
- **Dependency check.** Output, exactly: `depcheck: 240 roadmaps, 2356 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0 with no output.
  - The file is unchanged and declares nothing: `module`, `public import Mathlib`, and an empty namespace.
  - The `#check @` comparison and the one-tactic padding probe are therefore vacuous, and there is no padding.
- **Folder and scope.** The folder holds README.md, Suggested.lean and metadata.toml. Nothing outside the folder changed.

### Pinned declarations named by the change

- **Elaboration.** All 36 names elaborate with `#check @`, with no error, in one scratch file importing Mathlib and eight Tau Ceti modules at 2fd255d:
  - 14 `TauCeti.ClassFieldTheory` names;
  - 9 Tau Ceti double-coset and Borel names (`TauCeti.GL2Borel.diag`, `DoubleCoset.quotientMapOfLERight_surjective`, `…_trans`, `DoubleCoset.doubleCoset_inv`, `TauCeti.preimage_orbit_eq_doubleCoset`, `TauCeti.card_fiber_orbitRel_map_of_stabilizer_le_normalCore`, and the others);
  - 13 Mathlib names (`DoubleCoset.mk`, `IsDedekindDomain.FiniteAdeleRing`, `Matrix.GeneralLinearGroup.map`, `MulAut.conj`, `QuotientGroup.rightRel`, `Subgroup.relIndex`, `Subgroup.subgroupOf`, `HeckeCoset`, `IsHeckeTriple`, `NumberField.Units.instZLattice_unitLattice`, `Rep.resCoindAdjunction`, `Representation.coind`, `IsCoprime`).
- **Declarations opened and read at the pin.**
  - ClassFields/RayClassField.lean: 123 `rayClassField`, 209 `rayClassArtinEquiv`, 218 `rayClassArtinEquiv_apply` (proved by `rfl`), 241 `hilbertClassField`, 246 `narrowHilbertClassField`, 262 `hilbertClassArtinEquiv`, 277 `hilbertClassArtinEquiv_mk`, 306 `narrowHilbertClassArtinEquiv`, 362 `fieldRange_le_hilbertClassField_iff`, 380 `fieldRange_le_narrowHilbertClassField_iff`.
  - Global/AdmissibleModulus/Reciprocity.lean: 128 `rayClassArtinMap`, 257 `ncard_primesOver_eq_finrank_iff_rayClassArtinMap_idealClass_eq_one`.
  - Global/HasseNorm/Basic.lean: 154 `cyclicHasseNorm` and 170 `isGlobalNorm_iff_isLocalNormEverywhere`, both under `[IsCyclic (L ≃ₐ[K] L)]`.
  - DoubleCoset/Map.lean: 108, 116. DoubleCoset/Inv.lean: 40 (namespace `DoubleCoset`). DoubleCoset/Orbits.lean: 119. DoubleCoset/Fiber.lean: 97, 168. Borel.lean: 190 `diag`.
- **README:101 describes each of these correctly**, including their hypotheses:
  - the admissible modulus;
  - the maximal ideal prime to 𝔪;
  - unramified at every finite prime and every infinite place for the Hilbert class field, and at finite primes only for the narrow one.
- **The principal splitting criterion is absent.** `hilbertClassField` occurs only in RayClassField.lean, so the pin does not state that a prime splits completely in the Hilbert class field exactly when it is principal. This is as README:101 says, and ClassFieldTheory Layer 13 (main README:1835) lists the “splitting criteria”.
- **A false lead from the resolve tool.** citations.md lists `TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField` (README:101). It is a module name, and the file exists at the pin.

### The changed passages

- **Dependencies lines.** I compared every layer's Dependencies line with all its *Needs:* lines, by roadmap name, mechanically against the merge order and the roadmap lists of main.
  - The 14 layers have 197 *Needs:* lines: H0 7, H1 11, H2 12, H3 8, H4 19, H5 5, H6 9, R18.1 10, R18.5 part 1 18, R18.2 part 1 8, R18.5 part 2 11, R18.2 part 2 11, R18.3 part 1 28 and R18.4 40.
  - No roadmap is cited in a *Needs:* line and missing from its Dependencies line.
  - I also checked by hand the section ids added in H0, H1, H2, H5, H6, R18.1, R18.5 parts 1 and 2, R18.2 part 2, R18.3 part 1 and R18.4 against their *Needs:* lines; each is cited there.
  - The previous review's remarks on H3, R18.2 part 2 and R18.4 are also addressed.
- **New supplier ids resolve.**
  - PELModuli M0.12 at #966:948; AbelianSchemesAndArithmeticModuli A6.25 at #849:3438.
  - ShimuraVarieties §8.21 at #933:2846; NeronModelsAndSemistableAbelianVarieties §5.0a at #852:2947.
  - ALS.F.5 at #871:956; ModularCurvesPartII §14.4a at #913:3599; FiniteFlatGroups R07.4.13 at #879:6020.
  - AutomorphicSpectralTheory §§5.10, 5.12, 5.14 at #925:2797, 2819, 2841; WeightsInEtaleCohomology R34.6 = Layer 6 at #1001:690.
  - AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2 = §§6.1–6.2, by its identifier key (#928 README:17).
  - AlgebraicModuliForArithmeticGeometry Layer 2 at #853:1070.
  - On main: StableReduction Layers 0, 1, 4, 5, 6 (README:343, 372, 529, 552, 576), QuadraticFormInvariants Layer 2 (1145) and JacobianChallenge Layer A (111).
- **SchemeAndStackFoundations §§1.19–1.23 (README:41 and 103).**
  - On main (60284c4) these are at 2817, 2843, 2951, 2989 and 3021: stacks and DM stacks, inertia, quotient stacks, quasi-coherent modules with descent data and cocycle condition, and coarse moduli with Keel–Mori.
  - At #1276 (b06bd131) they are at 2821, 2847, 2953, 2990 and 3022, so no id is dropped.
  - They are cited at §H3.6 (README:883) and §R18.2.14 (README:2705).
  - The roadmap is on main, so it is a legal supplier.
- **Build order (README:167, 181, 184).** The early group §§R18.3.1–R18.3.3, R18.3.6 and R18.3.15 is closed under *Needs:*.
  - Its internal edges are 3→1, 3→2, 6→3, 15→6 and 15→3.
  - All its other edges go to suppliers: GL2 §§R16.2.13, R16.4.5, R16.6.3 and R17.3.8a–d; AdelicAlgebraicGroups §§3.4 and 5.3; AutomorphicFormsOnReductiveGroups §§0.6, 5.8a–5.8b, 7.3a and 7.6; Mathlib.
  - Before README:2793, only §R18.5.17a (README:2475, 2488) and §R18.5.18 (README:2508, 2530) cite R18.3, and they cite only §§R18.3.6 and R18.3.15.
  - The new table row sits between R18.2 part 1 and R18.5 part 2.
- **Overlaps.**
  - overlaps.md lists no other pull request changing this roadmap and no dropped id.
  - The only revision-only ids are AlgebraicTopology “Layer 6” (README:46, 3607, 3615), which #1652 defines and the merge-order paragraph now orders first.
- **Ownership.** The change adds no owned object: SchemeAndStackFoundations is a supplier citation, and the ClassFieldTheory text names pinned declarations. The vocabulary neighbours (#1007, #1270, #1075, #1824, #1013) were checked in the earlier full review.
- **Seeded sample.** It was verified in full at r12 (15 targets). No changed line carries a source locator or a theorem statement, so none of the sample falls in the change.
- **Headline theorems.** §R18.5.15, §§R18.4.32–R18.4.33, §R18.3.8 and §§H6.2–H6.8 are unchanged. Suggested.lean names each as not statable, with the carrier it lacks; this was verified at r12.

### Adversarial pass

Rows for the changed statements, with values:

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| README:101, principal splitting as the trivial-modulus case of `ncard_primesOver_eq_finrank_iff_…` | K=ℚ(√−5), H=K(i); primes over 29, 3, 7 | `disc K=−20=(−4)(5)`, so H is the genus field and `[H:K]=2=h`. `29=3²+5·2²` and 29≡1 mod 4: 𝔭₂₉ is principal and has 2=[H:K] primes above it. 3 and 7 split in K (−5≡1 mod 3; −5≡2≡3² mod 7), are not of the form `x²+5y²`, and are inert in ℚ(i): non-principal, with 1 prime above. | Both directions hold; the pin lacks only the class-group translation, as stated |
| README:101, `fieldRange_le_hilbertClassField_iff` against `…narrowHilbertClassField_iff` | M=ℚ(√3), N=ℚ(√3,i) | e(2)=e(3)=2 in both ℚ(√3) and N, so N/M is unramified at every finite prime. Both real places of M become complex. `N(2+√3)=+1` gives h=1 and h⁺=2. Narrow side: N≤H⁺, and [N:M]=2=h⁺, so N=H⁺. Wide side: it fails at infinity, consistent with H=M. | The two iffs are separated exactly as described |
| README:101, Hilbert and narrow fields as ray class fields | RayClassField.lean:241, 246 | `rayClassField (Modulus.one K)` and `rayClassField (narrowModulus K)`; the narrow modulus is trivial at finite places and carries every real place | Matches “trivial modulus” and “modulus of all real places” |
| README:2078 and 2153, `cyclicHasseNorm` and its placewise form | ℚ(i)/ℚ with a=3 and a=5; ℚ(√13,√17)/ℚ with 25; quadratic CM E/F | 3 is inert with v₃=1, so it is neither a local nor a global norm; `5=1²+2²`. 25 is a local norm everywhere but not a global norm, so the `[IsCyclic …]` binder (Basic.lean:154, 170) is needed. `#Gal(E/F)=2`, so E/F is cyclic. | Applies to §R18.5.12b as cited |
| README:167, 181, 184, build order | *Needs:* closure of the early group | The closure is {R18.3.1, 2, 3, 6, 15} plus suppliers. R18.5.17a needs R18.3.6 and R18.5.18 needs R18.3.15. No other pre-R18.3 section cites R18.3. | Consistent |
| README:41 and 103, SchemeAndStackFoundations §§1.19–1.23 | main; #1276 | Headings at main 2817–3021 and #1276 2821–3022. §1.22 has the cocycle condition and descent data (`QCoh.presentationEquiv`). | Matches “quotient stacks, quasi-coherent modules … coarse moduli” |
| All changed Dependencies lines | 197 *Needs:* lines | 0 roadmaps are in a *Needs:* line but missing from its Dependencies line, in each of 14 layers. R18.3 part 1 has 28 lines, with SR.0.1–0.2 and 0.4, AFRG §§0.6, 5.8a–b, 7.3a, GL2 R16.4.5 and R17.1.1–R17.3.9, and `HeckeCoset`/`IsHeckeTriple` all present. | Complete |
| README:2932, 3534: Layer 12 at the pin | `rayClassArtinEquiv` at the narrow modulus of ℚ(√3) | `Cl⁺(ℚ(√3))≅ℤ/2≅Gal(ℚ(√3,i)/ℚ(√3))`; the nontrivial character is the quadratic character of N/M | The pinned isomorphism supplies the Galois reading of ray-class characters used in §§R18.3.7 and R18.4.8 |

Rows carried forward from the previous review (r13 at e3fd9ae, and r12 at 8a9e596), for statements this change leaves untouched:

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §H6.5 (C6) via Layer 13 (r13) | M=ℚ(√19), N=M(i); M=ℚ(√3), N=M(√−7) | `170²−19·39²=1`, so h⁺=2h=2; N is the genus field, so N=H⁺_M and (C6) fails. 7 ramifies in N, so the norm is onto. | Correct |
| §R18.4.8 Eisenstein (r13) | χ∘Nrd | `(X−χ)(X−qχ)`: sum `(1+q)χ`, product `qχ²` | Correct |
| ModularCurves 3B–3D and 8 (r13) | p=2, 3 | the p+1=3, 4 cyclic subgroups equal `[GL₂(ℤ_p):K₀(p)]` | Correct |
| GlobalQuadraticForms §§5.5 and 6.1 (r13) | (−1,−1)_ℚ | 7=4+1+1+1; −1 not represented | Correct |
| §R18.5.16a item 4 (r12) | ℤ/4; ℤ/8; `𝔽₂[x,y]/𝔪²`; I=A | `2·6=12=4·3`; `2·12=24=8·3`; #ℙ¹=12; I=A gives `2≠3` | Correct |
| §R18.5.16a item 1 (r12) | `O₀(4)` over ℤ_(2); `ℤ_p+pM₂` | c=0, 1, 2; index `p³` | Correct |
| §R18.5.16a Hurwitz (r12) | `B_{2,∞}`, level 3 | w=12 and 3; the mass ratio is 4=3+1 | Correct |
| §R18.5.16c, D=23 (r12) | weights (2,1,3) | row sums 3; `Σ1/w=11/6` | Correct |
| §R18.5.16c, ℚ(√10) (r12) | `B(𝔭₂)` | `x²−10y²=±2` is impossible mod 5 | Correct |
| §R18.5.17a (r12) | dart (x,y) | `a_*U=q·b_*`; `b_*U=T[y]−[x]` | Correct |
| §R18.3.8 (headline, r12) | MS `ρ_g` | `ω⁻¹kω∉GL₂(O)` | Correct |
| §R18.3.7, ℚ(√3) (r12) | narrow class group | `N(2+√3)=1`; h=1, h⁺=2 | Correct |
| §R18.4.14 (r12) | (2,3,2) and (2,3,1) | `G(0,1)=(3/2,3)`; Δ=0 | Correct |
| §R18.4.30 (r12) | `A[[x]]`; M=k | 2=1+1; depth 0<1 | Correct |
| §§R18.4.32–R18.4.33 (headlines, r12) | l=5, l=2; `x↦(x,0)` | condition (2) automatic; `Tor₁(C,k)=0` | Correct |
| §§R18.5.15, R18.1.1a (headline, r12) | disc 6, level `1+7M₂(ℤ₇)` | `c₂=4`, `c₂⁻¹=2`, order 3 | Correct |
| §H6.5 worked Check (r12) | `x³−3x+1`, l=7, p=19 | disc 81; roots 3, 7, 9 mod 19 | Correct |
| §H6.4 (headline, r12) | `+I₂` | `det=1≠−1` | Correct |
| §H2.1, §R18.3.10, §R18.3.2, §R18.2.2 (r12) | `k[T]/T²`; ℚ(√17); d=2, k=4; g≥2 | `W^⊥=W`; four ramified places; rank 9, det 4; free action | Correct |

### Remarks on untouched text

These need no change for acceptance.

- The R18.3 part 2 Dependencies line (README:4402) lists FiniteFlatGroupsAndIntegralPadicHodgeTheory, which none of its three *Needs:* lines cites. It comes through §R18.4.27, which the same line names, so it is an extra entry, not a gap.
- The pull request description is not folder text, but two things in it are off:
  - its Depends-on checklist omits #1652, which the merge-order paragraph now orders first;
  - its sentence “Every pull request in this chain is ours” does not hold for #1652 (kim-em).

## Not verifiable

- **Voi21, printed pages.** The DOI resolves only to a paywalled page, and the cached author edition is paginated differently. Theorem numbers were verified at r12; the printed pages in §§R18.5.16a and R18.5.16c were not. This is unchanged, and no changed line touches them.
- **Tay02, internal pages.** The scan's text layer does not carry internal page numbers, so the pages of §H6.5's locator cannot be checked. This is unchanged, and the change does not touch that locator.
- **Ownership against open pull requests.** It was checked for the changed passages only. No new object is introduced, and the R01 heads were reread at 5b4cda93 and 5fdb26da.

## Source issues

- none
