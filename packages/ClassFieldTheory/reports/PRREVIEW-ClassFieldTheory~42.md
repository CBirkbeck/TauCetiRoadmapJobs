# Review of ClassFieldTheory (pull request #1215 at 7498694)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ClassFieldTheory/` at the same head that the previous review read. There is one new blocking finding: the principal ideal theorem's route rests on a comparison of idele classes with ideal classes across an extension, and no supplier states that comparison. The two findings about the pull-request description are carried unrepaired. There is also one new locator finding.

## R01 (P2) — The principal ideal theorem's route rests on an unowned base-change square

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md`, lines 1933–1947.
- Line 1939 says the route applies the class-formation theorem "and compar[es] idele classes with ideal classes through `hilbertClassArtinEquiv`".
- The *Needs:* line (1947) ends with "the ideal/idele-class comparison of GlobalNumberFields Layer 7".

**Claim.**
- The class-formation theorem gives only this: the image of an idele class of `K` under the ground inclusion into `C_E` is a norm from `C_{H_E}`. Here `E = H_K`.
- Reading that on ideals needs a square that nothing cited states. Under the idele-class-to-class-group quotients, the inclusion `C_K → C_E` must be the extension of ideal classes `Cl_K → Cl_E`, `[𝔞] ↦ [𝔞𝒪_E]`.
- GlobalNumberFields Layer 7 compares ideles and ideals over one field only.
- No supplier and no pinned declaration states the square across `E/K`. No layer of this roadmap states it either.
- The route also uses, without naming any input for it, the hypothesis of the class-formation theorem: that `Gal(H_E/E)` is the commutator subgroup of `Gal(H_E/K)`.

**Witness.**
- In `Completed/GlobalNumberFields/README.md`, `classMap` (line 301) runs "from a larger modulus to a smaller one" over one field. Layer 7 (line 472) proves `rayClassQuotient` compatible only with `classMap`.
- At the Tau Ceti pin, `Ideles/Extension.lean:189` defines `ideleClassExtension`. The library relates it only to norms, never to `Ideal.map` or a class group.
- `Formation/PrincipalIdeal.lean:67` takes `hT : T.galHom.range = commutator big.Gal` as an explicit argument.

**Repair.**
- State the square in 13.1 as a named step before the principal ideal theorem. For a finite extension `E/K` of number fields, `rayClassQuotient` at `Modulus.one` carries `ideleClassExtension K E` to `[𝔞] ↦ [𝔞𝒪_E]`. Under `ideleClassLevelEquiv` and `globalGroundEquiv`, the ground inclusion of the idele-class formation is `ideleClassExtension`.
  - *Needs:* Tau Ceti `ideleClassExtension`, `ideleFiniteCoord_ideleExtension`, `ideleClassLevelEquiv` and `globalGroundEquiv`; GlobalNumberFields Layer 7 `rayClassQuotient`; the factorization `𝔭𝒪_E = ∏ 𝔓^{e(𝔓/𝔭)}`.
- Add to the target's *Needs:* the inputs for the hypothesis `hT`:
  - `H_E/K` is Galois, by the canonicity of the Hilbert class field;
  - its maximal abelian subextension is `H_K`, by `isUnramifiedAt_hilbertClassField` and `fieldRange_le_hilbertClassField_iff`.
- Tested on the README's own Check:
  - `K = ℚ(√−5)`, `E = K(i)`, `𝔭 = (2, 1+√−5)`.
  - `𝔭` is not principal, so its Frobenius in `E/K` is nontrivial and `𝔭` is inert.
  - The idele with a uniformizer at `𝔭` goes to the idele with `w`-valuation `1` at `𝔓 = 𝔭𝒪_E`.
  - `2𝒪_E = 𝔓² = ((1+i)²)`, so `𝔓 = (1+i)`. The square gives the README's value.

## R02 (P3) — The merge order against #617 and #1411 is still not stated

**Location.** The pull-request description, "ClassFieldTheory: correct hypotheses, conductors and lifting". It says nothing about #617 or #1411.

**Claim.**
- Two open pull requests change this roadmap, and both conflict with this head.
- #1411 states this head's three Layer 7 objects under other names.
- One of them, `localAbsoluteUpperRamificationGroup`, has the same fully qualified name as this head's definition.

**Witness.**
- `roadmaps overlaps ClassFieldTheory` (index of 2026-11-09T18:08Z) reports conflicts in `TauCetiRoadmap/ClassFieldTheory/README.md` and `Suggested.lean` with #617 (head 911db42) and with #1411 (head 8878bc5, draft).
- In #1411's `Suggested.lean`:
  - line 504 is `map_unitFiltration_normResidue`;
  - line 525 is `localAbsoluteUpperRamificationGroup`;
  - line 541 is `map_artinMap_unitFiltration`.

**Repair.**
- State in the description that this pull request merges first, and that #617 and #1411 then rebase on it, keeping only the ClassFieldTheory edits this head lacks.
- Nothing in the folder changes. README line 280 already maps `map_unitFiltration_normResidue`.
- Test: the description names both pull requests and the order.

## R03 (P3) — The pull request edits `Completed/LocalGaloisGroups` without declaring it

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`.
- It has 62 insertions and 50 deletions against main.
- Line 12 is `import TauCetiRoadmap.ClassFieldTheory.Suggested`.
- Line 345 applies `ClassFieldTheory.cyclotomicCharacter_artinMap`.

**Claim.**
- The edit is needed: that file imports this roadmap's `Suggested.lean`, and this head deletes the declarations that main's version of the file used.
- But it lies outside the folders the pull request declares. The brief names only GlobalQuadraticForms and QuadraticFormInvariants.

**Witness.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassFieldTheory' ':!TauCetiRoadmap/GlobalQuadraticForms' ':!TauCetiRoadmap/QuadraticFormInvariants'` prints `Completed/LocalGaloisGroups/Suggested.lean | 112`.

**Repair.**
- Declare `Completed/LocalGaloisGroups` in the description as a folder of this pull request.
- Add one sentence saying what the edit does: it re-points that file to Tau Ceti's names and to the open target `cyclotomicCharacter_artinMap`.
- Test: with that folder also excluded, the command prints nothing.

## R04 (P3) — Four layers state their main theorem with no locator

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md`:
- line 1473 (8.1, local existence);
- lines 1656–1666 (10.1, the exact sequence `0 → Br(K) → ⨁_v Br(K_v) → ℚ/ℤ → 0`);
- lines 1762–1780 (11.1, global reciprocity, the reciprocity law at line 1774);
- line 2038 (14.1, "Hilbert reciprocity is `hilbertProductFormula`").

**Claim.**
- These four sections are in the seeded sample. None of them carries a source locator at its main claim.
- The convention locators do not reach these claims. C.2 cites Artin–Tate's abstract existence axioms (XIV §6). C.7's "Milne V §§1–3" covers the ideal-theoretic reciprocity law, not the idelic law of 11.1, the Brauer sequence, local existence or Hilbert reciprocity.
- The References already list Milne VIII Theorem 4.2 but no section cites it.

**Witness.**
- milne-cft line 5186 is III Theorem 5.1 (Existence) on p. 115. Line 5188 says Milne proves it only in characteristic zero, matching the `[CharZero K]` of 8.1.
- milne-cft line 9977 is VII Theorem 7.1 on p. 219, the injectivity of the Brauer localization.
- milne-cft line 10937 is VIII Theorem 4.2 on p. 241, the full exact sequence.
- milne-cft lines 8123–8133 are V Theorem 5.3 on pp. 178–179, the idelic reciprocity law.
- milne-cft lines 8142–8151 are V Example 5.4 on p. 179, the product formula for the Hilbert symbol.

**Repair.** Add these locators at the claims:
- 8.1: "(Milne, *Class Field Theory*, III Theorem 5.1, p. 115, proved there in characteristic zero)";
- 10.1: "(Milne, *Class Field Theory*, VII Theorem 7.1, p. 219; VIII Theorem 4.2, p. 241)";
- 11.1: "(Milne, *Class Field Theory*, V Theorem 5.3, pp. 178–179; VII Theorem 8.1(a), p. 221)";
- 14.1: "(Milne, *Class Field Theory*, VIII Theorem 4.2, p. 241, applied to the quaternion class; V Example 5.4, p. 179, for the multiplicative form)".

## Previous findings

- Previous R01 (merge order against #617 and #1411) is not repaired. The description is unchanged ("Correct the conductor minimum and the idele-layer lifting criterion …"), and both pull requests are still open and conflicting. It is carried as R02, with the witness updated to #1411's head 8878bc5.
- Previous R02 (the undeclared edit of `Completed/LocalGaloisGroups`) is not repaired. The diff command above still lists the file. It is carried as R03.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate on this head passes every check, including `build=0` (`gate.md`).
- My rerun of the brief's gate command gives 0 for every check inside the folder. It reports `outside-folder=5`, and all five hits are in GlobalQuadraticForms and QuadraticFormInvariants, which the brief names as this pull request's own.
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives exactly six `declaration uses 'sorry'` warnings, at lines 81, 97, 130, 145, 156 and 170, and nothing else.

**Signatures.**
- I elaborated `#check @` on all seven declarations in one scratch copy. The types are identical to `signatures.md`.
- The file has no `variable` block, so no binder can be lost.
- The README generality matches the Lean signatures:
  - `cyclotomicCharacter_artinMap`: any `Algebra ℚ_[p] F` with `Module.Finite`;
  - `normResidue_map_unitFiltration`: `IsGalois` plus `IsMulCommutative`, in either characteristic;
  - `map_artinMap_unitFiltration_eq_upper`: no `CharZero`;
  - the Layer 13 targets: `NumberField` and `IsAbelianGalois`.

**Headlines and padding.**
- The README's open headlines (Headline acceptance signatures, lines 685–691) are exactly the six theorems and one definition of `Suggested.lean`.
- The Tau Ceti-proved headlines are named in the module docstring. I located each at the pin: `tateIso`, `globalAbelianExistence`, `globalClassFieldCorrespondence`, `globalArtinMap_local`, `globalArtinMap_ideal`, `globalArtinMap_isArithFrobAt`, `kroneckerWeber`, `exists_br_of_sum_eq_zero`, `localClassFieldCorrespondencePrimeToResidueCharacteristic`, `cyclicHasseNorm`, `hilbertProductFormula`, `ringClassArtinEquiv`, `localWeilArtinEquiv_compat`, `eulerCharacteristic_mixed` and `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two`.
- No `sorry` occurs under Tau Ceti's `NumberTheory/ClassFieldTheory`, `NumberTheory/LocalField` or `RepresentationTheory/Homological`.
- One-tactic probe on scratch copies: `simp`, `rfl`, `infer_instance`, `trivial`, and `first | simp_all | aesop` each fail on all six theorems.
- Applying Tau Ceti's `localCyclotomicCharacter_artinMap_unit` to `cyclotomicCharacter_artinMap` fails to synthesize `ValuativeExtension ℚ_[p] F`, which is exactly the open content the docstring claims. No declaration is padding.
- Tau Ceti has only the class-formation principal ideal theorem (`Formation/PrincipalIdeal.lean:67`) and the local conductor statements. Neither open Layer 13 headline is proved at the pin.

**Library declarations opened at the pin.**

Tau Ceti, `NumberTheory/ClassFieldTheory/`:
- `Local/Conductor/UpperNumbering.lean:64` (`unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot`), `:121` and `conductorExponent_fixedField_ker`;
- `Local/Unramified.lean:475` (`map_artinMap_unitFiltration_zero`);
- `Local/ExplicitCyclotomicSymbol/ArtinMap.lean:294` and `:311` (the latter assumes `[ValuativeExtension ℚ_[p] F]`);
- `Local/Reciprocity.lean:162` (`normResidue`) and `:173`;
- `Global/AdmissibleModulus/Basic.lean:193` (`abelianConductor` via `ideleClassConductor`);
- `Global/AdmissibleModulus/Ramification.lean:116`;
- `ClassFields/RayClassField.lean:241` (`hilbertClassField`), `:262`, `:348` and `:362`;
- `Global/IdeleClass/Level.lean:154` and `:216`;
- `FiniteCohomology/DegreeTwo.lean:97` (`finite_H`: `(n : F) ≠ 0` and explicit smoothness, as the README says);
- `Local/Duality/Perfect.lean:280`;
- `Local/EulerCharacteristic/Theorem.lean:98`, whose formula matches the README's exactly;
- `Local/CohomologicalDimension/AbsoluteGaloisGroup.lean:104`;
- `h2EquivZModOfMuNRepIso`, which assumes `IsUnit (n : F)` and an iso, as the correspondence table says;
- `sumLocalInv_brLocalization_eq_zero` at its `:142`;
- `ClassFields/RingClass/Field.lean:178`.

Tau Ceti, elsewhere:
- `NumberTheory/LocalField/Herbrand/Basic.lean:421` (`upperRamificationGroup = G_{ψ(v)}`);
- `NumberTheory/LocalField/RamificationGroup.lean:89`;
- `RingTheory/DedekindDomain/Discriminant/Basic.lean:33` (`relDiscr = relNorm` of the different);
- `NumberTheory/NumberField/Global/Ideles/Extension.lean:189`;
- `RepresentationTheory/Homological/TateCohomology/Projective/Basic.lean:123`, `:232` and `:251`, and `NakayamaRim.lean:75–76` and `:117`. The hypotheses on `k` are as Layer 0 states, with `IsPrincipalIdealRing` only for the kernel form.

Mathlib:
- `RingTheory/Valuation/Algebraic.lean:28`;
- `RingTheory/Valuation/ValuativeRel/Basic.lean:1252`;
- `NumberTheory/Padics/ValuativeRel.lean:34`.

**Name and path resolution.**
- 604 backticked identifiers in the README resolve as declarations at the pins, except two groups. The seven names of this roadmap are declared in `Suggested.lean`. `cup_add_left` is ProfiniteCohomology's, at Layer 12 of its README on main (lines 228 and 2121).
- 31 cited file paths exist.
- 22 declaration-in-file attributions were checked and are correct, for example `FiniteGaloisIntermediateField` in `Galois/GaloisClosure.lean` and `finsum_artinConductorExponent_eq_discriminantExponent` in `Discriminant/Conductor.lean`.

**Suppliers.** Every named supplier is on main:
- ProfiniteCohomology, Layers 0–12;
- ProfiniteProPGroups (Completed), Layer 0, whose closed-subgroup bullet uses `ProfiniteGrp.closedSubgroup_eq_sInf_open`;
- LocalFieldsRamification (Completed);
- GlobalNumberFields (Completed), Layers 0–11;
- NumberFieldArithmetic (Completed): §2.5 `artinHomAway`, §4.1–4.2 `relDiscr`, and §5.9–5.10 (the different localizes, and `v_𝔭(relDiscr) = Σ f·v_P(𝔇)`).

**Cross-roadmap citations.**
- §2.5 and §2.6 are cited by AnticyclotomicLocalUnits (its README line 26) and by EllipticCurveModularityWild3Adic (lines 44 and 240). They are the "direction of reciprocity" and "Frobenius convention" of main's README (lines 416 and 460). This head's lines 252–253 map them to C.5 (line 458) and C.6 (line 507), which have the same content.
- `map_unitFiltration_normResidue`, cited by PadicPeriodRings (#940), is mapped at line 280.
- `roadmaps grep` finds no other `Suggested.lean` declaring in `TauCetiRoadmap.ClassFieldTheory`.

**Ownership against open pull requests** (checked with `roadmaps grep`, `roadmaps overlaps` and the sibling checkouts):
- RamificationOfCompleteDiscretelyValuedFields (#1410) gives the local-field absolute upper filtration to ClassFieldTheory Layer 7 and owns only the perfect-residue-field generalization, with an agreement theorem.
- FunctionFieldArithmetic (#1474) re-derives finite unit-filtration reciprocity as "not a target here". It owns nothing of Layer 7.
- ArithmeticGaloisRepresentations (#856) and NeronModelsAndSemistableAbelianVarieties (#852) own different conductor–discriminant formulas: the Artin-representation one and Saito's.

**Source sample.**

Each seeded target is listed with its locator, where it is, and what the text supports.

- **0.1–4.1.** The locators are in C.1–C.5.
  - milne-cft line 3911: II Theorem 3.11 on p. 84 has hypotheses (a) and (b) on every subgroup. Its proof notes that `Res(γ)` generates because `Cor∘Res = (G:H)`. Line 3992, Remark 3.13 on p. 85, identifies the map with cup product. This is equivalent to the three hypotheses of C.4.
  - milne-cft line 4641: III Proposition 1.9, p. 102.
  - milne-cft lines 4822–4842: III Theorem 3.1, p. 107, the inverse map defined as the local Artin map. Line 4835 gives the scaled inflation `Inf(x∪u_{E/K}) = [L:E]·Inf(x)∪u_{L/K}`, as C.3 says.
  - milne-cft line 4844: III Lemma 3.2, p. 107. Its proof is absent (Source issues).
- **5.1.** milne-adt line 1073: I Theorem 2.1, p. 26. Line 1138: Corollary 2.3, p. 28, cup-product duality and `H¹` finite for torsion prime to the characteristic. Line 1227: Theorem 2.8, p. 31, `χ(G,M) = (R:mR)⁻¹`. Lines 1266 and 1350: Lemmas 2.10 and 2.12.
- **6.1.** NSW is uncertified (see below).
- **7.1.**
  - serre1961 line 856: n° 3.1 restricts to totally ramified extensions. Lines 924–938, p. 128: Proposition 3 and the limit definition.
  - milne-cft lines 7423–7447: V Theorem 3.27, Remark 3.28 and Examples 3.29–3.30, p. 165. They support both the product and the lcm halves and `f(χ) = f(L^{ker χ}/K)`.
- **8.1.** milne-adt lines 1078–1083: footnote 6, p. 26, `1+𝔪 ≅ ∏ℤ_p` and non-closed finite-index subgroups. Local existence has no locator (R04).
- **9.1.** The locator is C.7's Artin–Tate XV, which is waived.
- **10.1.** milne-cft lines 9603–9668: VII Theorem 4.3 and Theorem 5.1(a)–(c). Lines 9996–10180: Proposition 7.2, Lemma 7.3, Theorem 8.1(b), Example 8.2 and Lemmas 8.4–8.6, all as cited. Line 11011: VIII Theorem 4.7. The exact sequence has no locator (R04).
- **11.1.** No locator (R04).
- **12.1.** milne-cft lines 10189–10290: VII Lemmas 9.1, 9.3, 9.4 and Theorem 9.5, pp. 223–226. Milne's `S` includes the infinite places, and lines 10261–10268 compute `p^{2s}` over them, which is exactly the `p^{|S|+r}` restatement.
- **13.1.**
  - milne-cft line 10629: VIII Theorem 3.1, p. 234. Line 10643: Remark 3.2, "5²".
  - milne-cft line 7252: V Theorem 3.17, p. 161.
  - milne-cft line 7423: V Theorem 3.27.
  - kopp-lagarias lines 128, 160 and 174: Theorems 1.1–1.3, pp. 3–4, for an arbitrary order and level datum.
- **14.1.** No locator (R04).

**Adversarial pass.** "Arithmetic" means `χ(Art u) = u⁻¹` and uniformizer ↦ arithmetic Frobenius. Every row was computed in this review.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `cyclotomicCharacter_artinMap` | `ℚ₃`, `u=4`, `μ₉`; `ℚ₂`, `u=−3`, `μ₁₆`; `u=−1`; `μ₈` | `4⁻¹≡7 mod 9` against geometric `4`. `(−3)⁻¹≡5 mod 16` (`13·5=65`) against `13`. `−1↦−1` in both. `3,5,7` are self-inverse mod 8, so `μ₈` does not separate the conventions. Automatic hypothesis: `‖(1−a)‖≤p⁻¹<1=‖ℓ^k‖²`, so `1+pℤ_p` is `ℓ^k`-divisible and `v(ℤ_pˣ)=1`. `v(p)≥1` would give `v(1−p)≠1`, a contradiction. | holds | none |
| `normResidue_map_unitFiltration` | `ℚ₂(i)`, `n=0,1,2`; `ℚ₃(ζ₉)`, `n=0,1,2`; unramified; `L=K`; `𝔽₂((t))`, `y²−y=t⁻¹` | `ℚ₂(i)`: `U⁰=U¹→G` (`x²+y²=−1` has no solution in `ℚ₂`), `i_G(σ)=v_L(−2i)=2`, so `G⁰=G¹=G`. `U²=1+4ℤ₂⊆N`, so `→1=G²`. `ℚ₃(ζ₉)`: image orders `6,3,1`; upper `6,3,1` (`φ(2)=(3+3)/6=1`); lower `6,3,3`. Unramified: `1=G⁰=1`. `L=K`: `1=1`. `𝔽₂((t))`: `U¹→C₂=G¹`, `U²→1=G²`. | holds | none |
| `localAbsoluteUpperRamificationGroup` | depth `−1`; `ℚ₂(ζ₈)`; splitting field of `X³−5` over `ℚ₅`; constant-inertia model | `−1`: all of `G_K`. `ℚ₂(ζ₈)` at depths `0..3`: `{1,3,5,7},{1,3,5,7},{1,5},{1}`. `X³−5`: `μ₃⊄ℚ₅` (`3∤4`), `e=3`, `f=2`, giving `S₃`, `C₃`, `1`; `C₃↦1` in `S₃^ab`, so an abelian-only definition differs. A constant-inertia model gives `{1,3,5,7}≠{1,5}` at depth 2. | determines the object | none |
| `map_artinMap_unitFiltration_eq_upper` | `n=0`; `ℚ₂(i)` quotient; `ℚ₉/ℚ₃` quotient; closedness | `n=0` is `Unramified.lean:475`, once the API fact `G_K^0=I_K` is used. On `ℚ₂(i)`: `n=1→G`, `n=2→1`. On `ℚ₉/ℚ₃`: both `1`, while `Art(3)` is Frobenius of order 2. Replacing `U⁰` by `Kˣ` gives the whole group. `U(K,n)` is compact and `Art(Kˣ)` is dense but not surjective, so the left side is closed without a closure. | holds | none |
| `isPrincipal_map_hilbertClassField` and its route | `ℚ`; `ℚ(√−5)`; `I=⊥,⊤` | `h(ℚ)=1`. For `ℚ(√−5)`: `H=K(i)`, `𝔭²=(2)`, `𝔭` inert in `H/K`, `2𝒪_H=𝔓²=((1+i)²)`, so `𝔭𝒪_H=(1+i)`. `⊥↦⊥` and `⊤↦⊤`. The step `C_K→C_E` vs `Cl_K→Cl_E` has no owner. | holds; route input unowned | R01 |
| `count_relDiscr_eq_finsum_abelianConductor_exponent` | `ℚ(i)`, `ℚ(ζ₈)`, `ℚ(ζ₅)`, `ℚ(ζ₉)`, `ℚ(√13,√17)` at 13, `L=K` | `2=0+2`; `8=0+2+3+3`; `3=0+1+1+1`; `9=0+1+2·4` (`3·(6−2−1)=9`); `2=0+1+0+1` (`disc=13²17²`); `0=0` (`abelianConductor_self`) | holds | none |
| `abelianConductor_eq_lcm` | `ℚ(ζ₈)`; `ℚ(√2)`; `ℚ(√13,√17)`; product/lcm swap | max `3` and `∞` (from `ℚ(i)`) give `(8)·∞`. `ℚ(√2)`: `(8)`, no `∞`. `ℚ(√13,√17)`: `(221)`, no `∞`. Swapping gives `8` against `3`. | holds | none |
| 0.1 Nakayama–Rim, freeness | `ℤ[C₂]`, trivial `ℤ`; `⊕2ℤeᵢ` | invariants `=` norms `=ℤ(1+g)`, so `Ĥ⁰=0`. Trivial `ℤ`: `Ĥ⁰=ℤ/2`, so it is not projective. `{2eᵢ}` is a basis of infinite rank. | holds | none |
| 1.1 maximal abelian sublayer | `S₃`, `V=1`; `V=G` | `⁅G,G⁆=A₃`, `G^ab=C₂`, the layer is fixed by `A₃`. `V=G`: degree `1`, norm quotient `0`. | holds | none |
| 2.1 and C.3 res/cor/inf | cyclic degree 4 → 2 → 8 | `inv u=1/4`, `inv res u=1/2`, `inv cor res u=1/2=inv(2u)`, `inf u=2u₈` with `2/8=1/4`. `inv u(U′,V)=1/[U′:V]=[U:U′]/[U:V]`. | holds | none |
| 3.1 Tate, Nakayama map | unramified cubic | `Frob↦[π]` (III 1.9); `Frob²↦[π²]`, valuation `2 mod 3` | holds | none |
| 4.1 abstract quadratic Check | degree 2; `V₄`; trivial layer | unique `σ≠0`; three non-norm cosets with three symbols; degree `1`, so `artinMap_trivialLayer` gives zero | holds | none |
| 5.1 Euler characteristic and Checks | `ℚ₂`, `𝔽₂`/`𝔽₃`/`0`; `ℚ₇`, `μ₃`; unramified `ℤ/3`; `𝔽₂((t))` | `8=2·2·2¹` (`χ=1/2=(ℤ₂:2ℤ₂)⁻¹`); `3=3·1·2⁰` (`3∤2−1`); `1=1·1·1`. `inv(7∪δχ)=1/3` against `2/3`. `H⁰=1` against dual `H⁰=3`. `℘(x)` has even pole order `2m`, so `t^{−odd}` are independent. | holds | none |
| 6.1 cd and unramified | `ℚ₂`, `ℓ=2,3`; `𝔽₂((t))`; `ℚ₉/ℚ₃`; `ℚ₂(ζ₅)` | `cd=scd=2`; `cd₂=1`; `4↦1` and `3↦Frob`; `ord₅2=4`, `ζ₅↦ζ₅²` against `ζ₅³` (`2·3≡1`) | holds | none |
| 7.1 conductor Checks | `ℚ₂(√2)`, `ℚ₂(ζ₁₂)`, `ℚ_p(μ_p)`, `ℚ₃(ζ₉)`, `𝔽₂((t))` | `±1 mod 8` gives `f=3=δ`. `0+0+2+2=4=f·d=2·2`. Sum `p−2` against max `1`. `Φ₉′(ζ)=9ζ⁸/(ζ³−1)`, so `v_L=12−3=9`. Artin–Schreier `δ=(2−1)(1+1)=2`. | holds | none |
| 8.1 conductor exception, openness | `ℚ₂`, `n=1`; `n≥2`; `𝔽_p((t))` | `𝔽₂ˣ=1`, so `U¹⟨2⟩=ℚ₂ˣ` with conductor `0`. `U^{n−1}/Uⁿ≅k≠0`, so the conductor is exactly `n`. An index-`p` subgroup containing `⊕ℤ_p` is not open. | holds; no existence locator | R04 |
| 9.1 Weil transfer | `𝔽₂((s))/𝔽₂((t))`, `t=s²`; unramified quadratic; `ℚ₂(i)` | index `1≠2` with no `K`-embedding; `deg_K=2deg_L` and index 2; `deg_K=deg_L` and index 2 | holds | none |
| 10.1 lifting obstruction, Brauer sequence | `ℚ(√13,√17)`; `(−1,−1)/ℚ` | `17≡2²` mod 13 and `13≡8²` mod 17; totally real; `D_v` of order `≤2`. `H²(G,I_L)` is killed by 2, `H²(G,C_L)≅ℤ/4`, the image has order `lcm=2` (VIII Cor 4.3). `½+½=0`. | holds; no sequence locator | R04 |
| 11.1 global reciprocity | `ℚ(ζ₅)`, `(2),(3)` | exponents `2,3`; `6≡1 mod 5` | holds; no locator | R04 |
| 12.1 Kummer case, `D₄` meet | `ℚ(ζ₃)`, `p=3`; two `D₄` over one `V₄`; `ℚ(i)` mod `(4)` | `#U(S)/U(S)³=9=3^{1+1}`; `81·1/9=9=p^{2s}/p^{s}`. The fibre product is `≅D₄×C₂` (the commutator form on `V₄` is unique), so `ab` has order `8>4`. `(ℤ/4)ˣ/±1=1`. | holds | none |
| 13.1 Checks | `25` in `ℚ(√13,√17)`; `x²+y²=−1` over `ℚ(√2)`; `ℤ+2ℤ[i]`; `ℚ(ζ₇+ζ₇⁻¹)` | `25=5²` (VIII Rem 3.2). `(−1,N(−1))_{ℚ₂}=(−1,1)=1`; ramified at both real places. `h=1·2/(1·2)=1`, `disc −16`. `(6/27)·7=14/9<2`. | holds | none |
| 14.1 Hilbert/quadratic | `(−1,−1)/ℚ`; `p=3`, `q=7` | `½+½=0`; `(7/3)=1`, `(3/7)=−1` (squares mod 7 are `1,2,4`); `−1=(−1)^{1·3}` | holds; no locator | R04 |

## Not verifiable

These citations are recorded in the manifest as uncertified or waived and are cited by locator only, so I did not open them. Every statement they support was checked mathematically in the table.
- serre-local-fields (uncertified): IV §1; IV §3, Proposition 14; V §§3 and 6; VI §2; IX §8; XI–XIV; XIV §3; XV §2, Theorem 2 and Corollary 3 to Theorem 1.
- neukirch-ant (uncertified): V Theorem 6.2; VI §7.
- nsw (uncertified): (7.1.8)(i), (7.2.5), (7.2.6), (7.3.1)–(7.3.4).
- artin-tate (waived): XI §5, XII, XIII, XIV §§1–6 including p. 163, XV, and V–VIII.

Also not verified:
- kopp-lagarias is read as arXiv v3. I did not check that its numbering matches the published version in *Ess. Number Th.* 4.
- The elaboration of `Completed/LocalGaloisGroups/Suggested.lean`. It is outside this folder and outside the brief's Lean commands.

## Source issues

- **Gap** in milne-cft at III Lemma 3.2, p. 107: the source states the norm and transfer compatibility diagrams of the local Artin map and leaves the proof "to be added"; it should give a proof or a reference such as Serre's *Local Fields*, XI §3; affects nothing.
- **Gap** in milne-cft at V Theorem 3.27, p. 165: the source omits the proof that the discriminant is the product of the finite character conductors, saying only that it is local; it should prove it or cite the local conductor–discriminant formula; affects the proof.
- **Gap** in milne-cft at III Theorem 5.1, p. 115: the existence theorem is stated for every local field, but the text proves it only in characteristic zero; it should restrict the statement or supply the characteristic-`p` case; affects the proof.
