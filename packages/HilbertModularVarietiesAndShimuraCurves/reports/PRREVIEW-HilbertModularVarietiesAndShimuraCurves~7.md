# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 8a037af)

**Verdict:** needs changes

This is a full review of head 8a037af0d52be0d0f9e155fe27dc48b34b61584f. The folder changed by 302 lines since 9107b6b. It found 5 findings: 2 P2 and 3 P3. Two of them carry over from the previous review, which this head does not repair. In what follows, README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md` and Suggested.lean is the file beside it. Other roadmaps are cited by folder, with line numbers in the README or Suggested.lean at the head of their open pull request.

## R01 (P2) — The congruence levels `K₀`, `K₁` and their quotient have two owners

**Location.**
- README:9: “They also include the lower-left and last-row congruence levels `K₀(I)`, `K₁(I)` of `GL₂` over every commutative local ring, with their bottom-row reduction, quotient and indices”.
- README:133: “The levels `K₀(I)`, `K₁(I)` over local rings with their reduction and indices … are constructed here”.
- README:2361–2363: §R18.5.16a, item 4, *Quotient*.
- Suggested.lean:78 (`levelZero`), :84 (`levelOne`) and :134 (`exists_levelZero_hom_ker_eq_levelOne`).

**Claim.** This roadmap now defines `K₀`, `K₁` and the quotient `K₀/K₁≅(A/I)×` itself, and claims to own them. AutomorphicLFunctionsAndLocalFactors already owns all three. It comes earlier in the merge order (line 86, against line 157 here) and is an admissible supplier. GL2AutomorphicRepresentationsAndTransfer, which this roadmap cites for its Hecke operators, builds those operators on AutomorphicLFunctionsAndLocalFactors' groups. README:2363 cites GL2AutomorphicRepresentationsAndTransfer §R16.1.3 for the quotient, but nothing cites the owner of the subgroups.

**Witness.**
- AutomorphicLFunctionsAndLocalFactors at its open pull request:
  - README:1643 (AL.2.2.1): “define the integral subgroups once: `K₀(Pⁿ)` … `K₁(Pⁿ)` … `K₁` is normal in `K₀` and the lower-right entry identifies `K₀/K₁` with `(O/Pⁿ)×`”.
  - Suggested.lean:340: `def newformK1 … (I : Ideal R)`. This is `levelOne I` at rank two.
- GL2AutomorphicRepresentationsAndTransfer at its open pull request:
  - README:578: “AL.2.2 … owns the lower-left and last-row congruence subgroups”.
  - README:2078: §R17.3.8d uses “the subgroups of AutomorphicLFunctionsAndLocalFactors AL.2.2”.

**Repair.**
- Take the following from AutomorphicLFunctionsAndLocalFactors AL.2.2.1, and the quotient also from GL2AutomorphicRepresentationsAndTransfer §R16.1.3:
  - `K₀(𝔭_v^e)` and `K₁(𝔭_v^e)`;
  - the normality of `K₁` in `K₀`;
  - the isomorphism `K₀/K₁≅(O_v/𝔭_v^e)×`.
- Add AL.2.2.1 to §R18.5.16a's *Needs:*, the supplier table and the contracts.
- Keep here only what AL.2.2.1 does not state: the bottom-row description of the right cosets, the indices and the lattice count. Introduce them with one clause saying how they differ: they hold over every commutative local ring A and ideal I, and AL.2.2.1's groups are the case `A=O_v`, `I=𝔭_v^e`.
- Rewrite README:9 and README:133 to match.
- Delete `levelZero` and `levelOne` from Suggested.lean (see also R03).

**Test of the repair.** At `ℤ₃`, e=1:
- AL.2.2.1's `K₀(P)/K₁(P)≅𝔽₃×≅C₂` is item 4's quotient, so item 4 loses nothing.
- The indices 4 and 8 are not in AL.2.2.1, so they stay here.

## R02 (P2) — Eichler orders and Brandt matrices still have two owners

Re-raised: R01 of the previous review. It is not repaired, and no repair report marks it as not actionable.

**Location.**
- README:9: “For quaternion orders they are Eichler orders, … together with the neighbour ideals and their Brandt matrices … (§§R18.5.16a, R18.5.16c)”.
- §R18.5.16a is at README:2352 and §R18.5.16c at README:2419.

**Claim.** QuaternionArithmetic still defines both objects itself and consumes only R18.1, §R18.3.1 and §R18.5.17a from this roadmap. The double ownership the previous review found is therefore unchanged. QuaternionArithmetic consumes this roadmap, so this roadmap is the earlier one and stays the owner. QuaternionArithmetic has to cite it.

**Witness.** QuaternionArithmetic's head is 75c9080, the same as at the previous review. It defines:
- Eichler orders: §§1.9, 1.10 and 1.12 at README:660, 685 and 731;
- Brandt matrices: §§7.1–7.3 at README:1491, 1514 and 1528;
- `def IsEichler` at Suggested.lean:216.

Its README:169–170 lists only R18.1, R18.3.1 and R18.5.17a from this roadmap.

**Repair.** The edit is the one the previous review asked for, and it belongs in QuaternionArithmetic's pull request (author roed-math):
- §§1.9, 1.10 and 1.12 cite §R18.5.16a items 1, 2 and 4.
- §§7.1–7.3 cite §R18.5.16c for `T(𝔭)=B(v)ᵀ` at primes prime to the level.
- Each kept variant says in one clause how it differs.
- Its consumed list adds §§R18.5.16a and R18.5.16c.

This folder should not be accepted until that head carries the edit. The conventions already agree: at D=11, QuaternionArithmetic's `T(2)=[[1,3],[2,0]]` is the transpose of `B(2)=[[1,2],[3,0]]`, whose rows sum to 3.

## R03 (P3) — Suggested.lean states non-headline targets

**Location.**
- Suggested.lean:9–14: “It states … the targets whose carriers are pinned: the lower-left and last-row congruence levels … and the fibres of refinement maps”.
- The declarations at Suggested.lean:78–220.
- README:5, README:185 (“It states the local congruence levels of §R18.5.16a, item 4, and the class-set refinement fibres”), README:2361–2364 and README:2391–2394.

**Claim.** The module docstring itself says the headlines are not statable at the pins. It then states, because their carriers happen to be pinned, the following:
- two definitions, `levelZero` and `levelOne`;
- two proved theorems that restate those definitions, `mem_levelZero_iff` and `mem_levelOne_iff`;
- eight sorried supporting results: the coset reduction, the quotient, four index formulas and three refinement-fibre statements.

None of these is a headline theorem or a definition a headline needs. This is the API-catalogue use of Suggested.lean that the form rules exclude. The previous form, which declared nothing, was the correct one.

**Witness.**
- The README's headlines are §§R18.5.15, R18.4.32–R18.4.33, R18.3.8 and H6.2–H6.8 (README:3).
- Suggested.lean:16–20 says that none of them is statable.
- No headline mentions `levelZero` or `exists_equiv_refinementFiber`.

**Repair.**
- Delete every declaration in Suggested.lean, together with the two `TauCeti.*` imports, which only these declarations use.
- Keep the docstring that names each unstatable headline and its missing carrier, and say that the file states no theorem.
- In the README, remove the backticked Lean names from item 4 of §R18.5.16a and from §R18.5.16b.
- Remove the clauses at README:5 and README:185 that say the file states these targets.

Every statement stays in the README.

**Test of the repair.**
- The one-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `decide`) closes none of the ten sorried theorems. They are deleted because they are not headlines, not because they are trivial.
- `mem_levelZero_iff` and `mem_levelOne_iff` restate their definitions.

## R04 (P3) — `TauCeti.IntegralOrder.leftOrder` is not a pinned declaration

**Location.** README:93, 2354 (“the pinned … `TauCeti.IntegralOrder.leftOrder`”), 2368, 2387 and 2570.

**Claim.** The README presents this name as pinned Tau Ceti. No declaration of that name exists at the pin. The left order is `Submodule.leftOrder`.

**Witness.**
- `#check @TauCeti.IntegralOrder.leftOrder` at the pin fails with “Unknown identifier”.
- `TauCeti/RingTheory/IntegralOrder/LeftOrder.lean:61` declares `def leftOrder (M : Submodule R E) : Subalgebra R E` inside `namespace Submodule`.

**Repair.** Replace the name at all five places by `Submodule.leftOrder`, from the module `TauCeti.RingTheory.IntegralOrder.LeftOrder`, applied to `I(x)` as an `O_F`-submodule of D. Where the left order of an order is meant, cite `Subalgebra.leftOrder_toSubmodule`.

**Test of the repair.** `TauCeti.IntegralOrder.IsOrder` and `TauCeti.IntegralOrder.IsMaximalOrder` do resolve at the pin, so only this one name changes.

## R05 (P3) — AlgebraicTopology Layer 6 exists only at #1652, which the description does not name

Re-raised: R02 of the previous review. It is not repaired.

**Location.** README:44, “AlgebraicTopology, Layer 6”, and the link at README:3609, `…#layer-6-cohomology-products-and-manifold-duality`.

**Claim.** This numbering exists only at the head of #1652 (author kim-em), which makes #1652 a dependency. The pull request's description names #1652 neither in its Depends-on list nor in its merge-order paragraph.

**Witness.**
- On main, AlgebraicTopology README:946 reads “## Stage 6: cohomology, products, and manifold duality”.
- At #1652, README:1578 reads “## Layer 6: …”, and its §6.1 supplies the cited dual-system cochains.
- “1652” occurs nowhere in the description.

**Repair.** Add “#1652 AlgebraicTopology (kim-em)” to the Depends-on list, and put it before this pull request in the merge-order paragraph. Leave the README as it is: repointing to “Stage 6” would break when #1652 merges.

## Previous findings

The ids below are those of the previous review, of 9107b6b.

- **R01 — not repaired.** #1722's head is unchanged at 75c9080. README:9 is unchanged on this point. This is R02 above.
- **R02 — not repaired.** The f46b229 commit rewords the supplier-table entry at README:44 to the #1652 Layer 6 content, but the description still does not name #1652. This is R05 above.

## Verified sound

**Validation.**
- **Head and pins.** Pins unchanged: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e, Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, Lean v4.36.0-rc2.
- **Files.** The diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.NT"`).
- **Gate.** The worker's gate is 0 on every rule, including `build=0`. My rerun is 0 on every text rule, `OK`, exit 0.
- **Dependency check.** Output, exactly: `depcheck: 244 roadmaps, 2492 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The new and repointed suppliers are both above this roadmap in the merge order: GL2AutomorphicRepresentationsAndTransfer at line 94, and AutomorphicLFunctionsAndLocalFactors at line 86, which is needed for R01's repair.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0, and the 10 `sorry` warnings are the only output.
- **Worktree.** It is clean afterwards.
- **Signatures.** I ran `#check @` on every cited new name and on the three refinement theorems, and compared them with signatures.md for all 15 declarations.
  - No section binder is lost. The DVR theorems carry `[Finite (IsLocalRing.ResidueField O)]`.
  - The README and the Lean statements have the same generality: item 4 is over a local ring, `rightRel_levelZero_iff` over every commutative ring, and §R18.5.16b over any group with no finiteness in item 2.
  - signatures.md's entry “`for` (lemma, line 17)” comes from the docstring word “lemma”, not from a declaration.
- **Library declarations opened at the pin.**
  - Tau Ceti `TauCeti.GL2Borel`, `.diag` and `.mem_iff` (`LinearAlgebra/Matrix/GeneralLinearGroup/Borel.lean`:152, 190, 158).
  - Tau Ceti `DoubleCoset.quotientMapOfLERight`, `_surjective` and `_trans` (`GroupTheory/DoubleCoset/Map.lean`:79, 116, 108).
  - Tau Ceti `DoubleCoset.doubleCoset_inv` (`Inv.lean`:40) and `TauCeti.preimage_orbit_eq_doubleCoset` (`Orbits.lean`:119).
  - Tau Ceti `TauCeti.stabilizerOrbitRelQuotientEquivOrbitRelMapFiber` and `TauCeti.card_fiber_orbitRel_map_of_stabilizer_le_normalCore` (`Fiber.lean`).
  - Mathlib `QuotientGroup.rightRel_apply` (`rightRel s x y ↔ y*x⁻¹∈s`), `Nat.card_prod` (unconditional), `DoubleCoset.mk`, `MulAction.orbitRel.Quotient`, `Subgroup.normalCore`, `Subgroup.relIndex` and `IsDedekindDomain.FiniteAdeleRing`.

**Changed passages, read in full.**
- README:5, 9, 30, 44, 82, 86, 133 and 172–185.
- §§R18.5.16a–R18.5.16c (README:2352–2442) and §R18.5.17a (README:2461–2483).
- Layer R18.5 part 2 Dependencies (README:2570), Layer R18.3 part 1 opening and §§R18.3.1–R18.3.3 (README:2786–2870), §R18.3.8 (README:2927–2950), README:3351 and README:3598.
- The whole of Suggested.lean.

**Unchanged passages, read for the sample and the headlines.**
- Conventions and supplier contracts (README:48–158).
- §§H1.1, H6.1–H6.5 (locators), R18.1.1a, R18.4.24a, R18.4.32–R18.4.34, R18.5.15 and R18.5.16.
- Scope of the comparison theorems, Downstream consumers and References.

**Supplier repointing from QuaternionicModularForms to GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–R17.3.8d, at its head bf2abc9.**
- **§R17.3.8a (README:1777).**
  - Coefficient modules `L_{n,s}` over every commutative ring, with basis and base change.
  - The `TauCeti.symPowerRep` comparison.
  - The scalar `ν_alg(ϖ_v)^e`.
  - `Σ₀(ϖ_v^t)`, `Σ₁(ϖ_v^t)` and the nebentypus twist.
- **§R17.3.8b (README:1894).**
  - `M_D(U,A)` on §7.4's carrier, with the right action `Δ^op→End_R(A)`.
  - `Cl(U)` finite for every open U.
  - Evaluation with `Γ_i=U∩x_i⁻¹D×x_i`, representatives, levels, colimits, the ψ-submodule at level `U𝔸_{F,f}×`, and norms.
- **§R17.3.8c (README:1970).** Dimension, coefficient extension, splittings and averaging projectors.
- **§R17.3.8d (README:2070).**
  - `T_v`, `T_{v²}`, `S_v`, `U_{ϖ_v}` and the diamond operators.
  - Right cosets at `GL₂(O_v)`, `K₀` and `K₁`.
  - The opposite-ring law, the good-place relation, the inversion `[Uη_v⁻¹U]=S_v⁻¹T_v`, and commutation.
- Every contract item at README:133 is present.
- The README no longer cites QuaternionicModularForms anywhere, as the excluded-supplier list requires.

**Cross-roadmap anchors.**
- 33 of the 34 distinct anchored links resolve at main or at the supplier's head; the exception is R05.
- This includes the new GL2AutomorphicRepresentationsAndTransfer anchors `#r1738a-…`, `#r1738b-…` and `#r1738d-…`, and AutomorphicFormsOnReductiveGroups `#74-…` and `#76-…`.

**Ownership, checked by object.** I ran `roadmaps grep` over main and the 476 open heads for the levels `K₀`/`K₁`, the refinement fibres, Eichler orders and Brandt matrices.
- **`K₀`, `K₁` and the quotient.** These belong to AutomorphicLFunctionsAndLocalFactors (R01).
- **Eichler orders and Brandt matrices.** QuaternionArithmetic owns them too (R02).
- **QuaternionicModularForms (open, author WilliamCoram).**
  - It states the same levels with indices (§0.2, README:308) and the same refinement-fibre theorem (§0.3, README:346–360).
  - It is on the excluded-supplier list, so this roadmap cannot cite it. The only admissible settlement on this side is to own the material, as the head does. Its README:1427 lists this roadmap as a consumer, and that has to change on its side.
  - This roadmap is the owner of the indices and of the double-coset fibre theorem. Tau Ceti has only the orbit form, `TauCeti.stabilizerOrbitRelQuotientEquivOrbitRelMapFiber`, which §R18.5.16b cites, and no earlier admissible roadmap states either result. GL2AutomorphicRepresentationsAndTransfer §R17.3.8b states only that the refinement map is surjective.
- **Fully qualified names.** No Suggested.lean name collides with a readable roadmap's name.

**Seeded sample.** The worker's 15 generic labels are mapped to targets with readable sources. Voi21 is read in the cached author edition v1.0.5; see Not verifiable for its printed pages.

| Label | Target | Source (`<id> line N`) | Result |
| --- | --- | --- | --- |
| Definition | §R18.5.16a, Eichler orders | Voi21 lines 15523–15542 (Def 23.4.1, Prop 23.4.3), 15277 (“local” means a complete DVR), 15547–15558 (proof uses Cor 10.5.5 and Smith form, PID only), 15711 (discrd `𝔭^e`), 17955–17974 (26.4.3, `#ℙ¹(R/𝔭^e)=q^e+q^{e−1}`) | Supported. Extension of item 1 to every DVR justified by the proof as read. |
| Construction | §R18.5.17a, class-set graph | Zha14 lines 594 (§3.4, p.207), 629 ((3.14), p.208), 643–650 ((3.16)–(3.17), p.209) | Supported; pp.208–209 correct |
| Definition | §R18.5.16c, Brandt matrices | Voi21 lines 31603–31606 ((41.2.3): column = counted ideal), 31710 (column sums), 31841–31848 (Ex 41.3.16), 31878–31882 (Prop 41.4.3) | Supported. README `B(v)=Tᵀ` and its weighted symmetry follow from (41.4.5). |
| Theorem | §R18.3.8, definite Ihara (headline) | MS19 lines 1718–1729 (§6.2, Thm 6.8, pp.34–35), 1736–1754 (proof) | Supported, including the `ω⁻¹` correction |
| Construction | §R18.4.29, weak patching | MS19 lines 920 (Def 4.1, p.19), 960 (Prop 4.2, p.20), 1004 (Lemma 4.7, p.21) | Supported |
| Comparison | §R18.4.24a, semistable comparison | Sai09 lines 1373 (§7, p.32), 1452–1461 (§8, p.34: semistable model and Tsuji), 1643 (§9 begins, p.38) | Supported. pp.32–36 covers what is used; §8 continues to p.38. |
| Theorem | §R18.4.32, residual Ihara (headline) | MS19 lines 1700–1717 (Thm 6.5, Remarks 6.6–6.7, p.34), 1931 (proof, p.38) | Supported; the large-image and `l=5` conditions match |
| Comparison | §R18.5.18, torsion realization | Zha14 lines 1243–1245 (§6.3 begins, p.228) | Locator correct |
| Definition | §H1.1, ordered polarization module | Tay02 lines 321–332 (§1, internal p.10) | Supported |
| Theorem | §R18.4.33, integral saturation (headline) | MS19 lines 472 (§2.10, p.10), 1686 (Lemma 6.4, p.34), 1700 (Thm 6.5) | Supported; saturation derived as stated |
| Comparison | §R18.1.1a, central twist | BZ22 lines 2562–2575 ((6.45) and its descent `id×|Π⁻¹×τ_c`, p.49), 2860 (Prop 8.4, p.55), 2892 ((8.11), p.55), 2898 (Cor 8.5, p.56) | Supported; pp.55–56 correct |
| Theorem | §R18.4.20, Taylor–Wiles datum | MS19 lines 1074 (§4.2, p.22), 1146 (Lemma 4.10, p.24) | Supported |
| Construction | §H6.2, twisted torsion moduli | Tay02 lines 425–435 (fine smooth moduli of quintuples, internal p.13) | Supported |
| Theorem | §R18.5.15, Čerednik–Drinfeld (headline) | BZ22 lines 2559–2564 (Thm 6.7), 2578–2580 (Cor 6.8), both p.49; 2423 ((6.31)) | Supported. The README's central twist is the stated adapter. |
| Theorem | §H6.4, real points (headline group) | Tay02 lines 416–421 (Lemma 1.4, internal p.13) | Supported |

No README locator is flagged as unverified.

**Adversarial pass, computed this round.**

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| `rightRel_levelZero_iff` (any commutative ring) | A=ℤ, I=0; γ=1 with `γ′=diag(1,−1)` and with `γ′=(0 1;1 0)`; I=A | `diag(1,−1)`: lower-left 0∈I, and `(0,−1)=(−1)(0,1)`; both sides true. `(0 1;1 0)`: lower-left 1∉0, and no unit has `(1,0)=u(0,1)`; both sides false. I=A: `(A/I)×={1}`; both sides true. | Correct |
| `exists_equiv_levelOne_rightCosets` | `ℤ₂`, I=(4); I=A | 12 unimodular rows of `(ℤ/4)²`, against `q^{2e−2}(q²−1)=12` cosets. I=A: one coset, and the zero ring has one coprime pair (1=0). | Correct |
| `exists_levelZero_hom_ker_eq_levelOne` | `ℤ₃`, I=(3); `ℤ₂`, I=(2); I=A | `𝔽₃×≅C₂`, with `diag(1,2)↦2` and kernel `K₁`. At `𝔽₂`, `K₀=K₁`, which GL2 §R16.1.3's Check also records. I=A: trivial quotient. | Correct; duplicated (R01) |
| `card_residueField_mul_index_levelZero` | `ℤ₂`, I=(4); `A=𝔽₂[x,y]/(x,y)²` (local, not a domain) with I=0 and I=𝔪; I=A | `2·6=12=4·3`. I=0: #A=8, 48 unimodular rows, `#A×=4`, `#ℙ¹(A)=12`, and `2·12=24=8·3`. I=𝔪: `2·3=2·3`. I=A: `2·1≠1·3`, so `hI` is needed. | Correct; the local-ring generality holds |
| `card_residueField_sq_mul_index_levelOne` | the same A, I=0 | `4·48=192=64·3` | Correct |
| `index_levelZero_maximalIdeal_pow` | `ℤ₃` with e=1, 2; `ℤ₂`, e=2; `ℤ_(2)`; e=0 | 4; 12; 6; the same as `ℤ₂`. At e=0 the index is 1 but the formula gives q+1 (since e−1=0 in ℕ), so `he` is needed. | Correct |
| `index_levelOne_maximalIdeal_pow` | `ℤ₃`, e=1; `ℤ₂`, e=2; finiteness | 8; 12. With an infinite residue field, Nat.card would be 0; the finiteness binder is in the elaborated type. | Correct |
| `exists_equiv_refinementFiber` | `S₃` with `Γ=U′=⟨t⟩`, `U=S₃`, x=1 | `Γ_1=⟨t⟩` fixes `U′` and swaps `(13)U′`, `(23)U′`: 2 orbits. The double cosets are {1,t} and {(13),(23),(123),(132)}: 2 of them. Well defined, since `Γxγ′uU′=Γ(xγ′x⁻¹)xuU′`. | Correct |
| `card_doubleCoset_eq_sum_card_orbits` | the same; Hurwitz U with U′ the level-3 Eichler units | 2=2. At the Hurwitz level: one class at U, and the 24 units are transitive on `ℙ¹(𝔽₃)`, so 1=1. | Correct |
| `card_doubleCoset_eq_relIndex_mul` | `Γ=U′=A₃`; `Γ=U′=⟨t⟩`; G=ℤ, Γ=1, U=ℤ, U′=0 | `2=2·1`. For `⟨t⟩`: `2≠3·1`, and `⟨t⟩` does not lie in the core {1}, so the hypothesis is needed. For ℤ: `0=0·1` with Nat.card zero. | Correct without finiteness |
| §R18.5.16a item 1, Checks | `ℤ_(2)` with `O₀(4)`; `ℤ_p+pM₂(ℤ_p)` | Overorders `End(A⊕𝔭^c)` for c=0,1,2; c∈{1,2} meet in `(A 𝔭⁻¹;𝔭² A)≅O₀(2)`. `[M₂:ℤ_p+pM₂]=#M₂(𝔽_p)/𝔽_p=p³`, and the only idempotents are 0 and 1. | Correct |
| §R18.5.16a items 3 and 5 | level `𝔭^e`; `n=(0 1;ϖ 0)` | `[R̂⁺×:U₁]=q^{e−1}(q+1)·q^{e−1}(q−1)=q^{2e−2}(q²−1)`. `n(a b;c d)n⁻¹=(d cϖ⁻¹;ϖb a)`, `nM₂(O)n⁻¹∩M₂(O)=O₀(𝔭)`, and `n²=ϖ`. | Correct |
| §R18.5.16a Checks | `ℙ¹(ℤ/4)`; splitting dependence; bottom row | 6 points and 12 rows, with `(ℤ/4)×` of order 2. Conjugation gives `(d cϖ^{−e};ϖ^eb a)`. `wk=(0 −1;1 1)` has bottom row (1,1). | Correct |
| §R18.5.16b API and Checks | `Γ_{γxu}`; `D=M₂(ℚ)` at a prime ℓ | `U∩u⁻¹x⁻¹Γxu=u⁻¹Γ_xu`. ℓ+1 cosets; `SL₂(ℤ)→SL₂(𝔽_ℓ)` is onto, so the action is transitive and `#Cl(U′)=1`. | Correct |
| §R18.5.16c item 4 against Voi21 (41.4.5) | general `s_v` | `(TᵗW)_{ij}=T_{ji}w_j` and `(WP(𝔫⁻¹)T)_{ij}=w_iT_{s(i),j}`. With `B=Tᵀ` this gives `w_jB_{ij}=w_iB_{j,s(i)}`. | Equals item 4 |
| §R18.5.16c, `ℚ(√10)` and p=23 Checks | Voight's `T(𝔭₂)`; p=23 | The transpose of Voight's matrix equals the README's `B(𝔭₂)`. The weights solve to (12,2,3,4), with mass 7/6. `ζ_F(−1)=(18+26+24+2)/60=7/6`. For p=23: `1/4+1/2+1/6=11/12=22/24`, and `B(2)diag(2,1,3)` is symmetric. | Correct |
| §§R18.3.2–R18.3.3 repointed | GL2 §R17.3.8a at s=−n; z∈U∩Z | `Sym^n⊗det^{−n−s}=Sym^n`, so the right action is `τ(g)⁻¹`. `v|z=τ(z)⁻¹v=ψ(z)v`. | Consistent |
| §R18.3.8 (headline) | F=ℚ, D ramified at {2,∞}, H maximal, w=3 | `#Y_H=1`; the kernel is the constant pairs `(f,−f)`; `T₃=4=q+1` on constants, which is Eisenstein | Correct |
| §§R18.4.32–R18.4.33 (headlines) | l=5 with `√5∉F`; `O→O²`, `x↦(x,0)` | The exceptional condition is automatic (MS19 Thm 6.5(2)). The cokernel `O/λⁿ` is free over `O/λⁿ` but has λ-torsion. | Correct |
| §R18.5.15 (headline), §R18.1.1a | disc 6 at v=2; `M₂(ℚ)`; mod 7 | `inv₂=½` and `inv_∞=0`; `M₂(ℚ)` is excluded. `sΠ⁻¹=π_vΠ⁻²` has reduced norm 1. `c₂=4`, `4·2≡1`, `c₂²≡2`, `2·2=4`, and `2³≡4³≡1`. | Correct |
| §H6.5 and (C6) (headline input) | `M=ℚ(√3)`, `N=ℚ(ζ₁₂)` | `h(N)=1` and `h⁺(M)=2`, since `2+√3` has norm +1. So `Cl(N)→Cl⁺(M)` is not onto. | (C6) is needed; source gap below |
| §H1.1 Checks | O=ℤ; −1 | The cone is the positive integers; −1 sends it to the negatives | Correct |

**Rows carried from earlier reports** for statements this head leaves untouched. The values were computed there and the statements are unchanged.
- **§§R18.3.2, R18.3.3, R18.3 Examples.** Rank 9 and Gram determinant 4; `C₈/{0,4}≅C₄`.
- **§§R18.3.15, R18.4.9, R18.4.14.** Over `𝔽₇`, qS=6; `m*=m` exactly when `s=s⁻¹`; `GJ=((q+1)²−S⁻¹T²)·id`.
- **§§R18.5.1, R18.5.4, R18.5.6.** `z∈K₂∖K` lies in Ω; group height 8 and `[π]` height 4f; shifts 2 and 0.
- **§§H1.5, H2.1.** `T²−2=N(T−√2)`; `W^⊥=W`.
- **§§H3.4, H4.18, H4.19.** `ε³≡2 (mod 5)` and `Δ(5)≅ℤ/6`; `[U:U₅]=12`; `η=17+12√2`.
- **§R18.4.30.** For `k[[X,Y]]/(X²Y)` with `L=XY·A` and `N=A/(XY)`: `XL=0` and `XYN=0`.

## Not verifiable

- **Voi21's printed pages.** The sources cache holds the author's edition v1.0.5, whose pagination differs from print by 10–14 pages, unevenly. Definition 23.4.1 is on p.372 there, against the README's p.382; Definition 41.2.4 is on p.754, against p.767. Theorem numbers and contents were verified; the printed page numbers in §§R18.5.16a–R18.5.16c were not.
- **Sources not reread this round.** KW09, CDN23, BHW23, BC91, DP94, YZ18 and Car86 are not reread. Their passages are unchanged since earlier reviews, apart from supplier repointing.
- **Tay02 and BZ22.** They were read from the sources service's cache. Tay02's text is OCR. This review edits no manifest, so neither was recorded.

## Source issues

- **Misprint** in MS19 at the proof of Theorem 6.8, p.35: the source writes the kernel relation as f(x)=−g(xω); with its own π₂=ρ_{ω⁻¹} (§2.11, p.10) it should be f(x)=−g(xω⁻¹); affects the proof.
- **Gap** in Tay02 at the proof of Lemma 1.2, internal p.11: the source makes the polarization module principal using surjectivity of the norm onto the wide class group of M; it should use the narrow class group, which can fail (M=ℚ(√3), N=ℚ(ζ₁₂)); affects the proof.
