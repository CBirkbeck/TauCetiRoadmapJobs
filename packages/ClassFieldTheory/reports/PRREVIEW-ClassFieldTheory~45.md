# Review of ClassFieldTheory (pull request #1215 at d587e53)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ClassFieldTheory/`: the folder changed by 169 lines since 7498694. The previous review's two folder findings are repaired. Its R01 was the principal ideal theorem's unowned idele–ideal square, and its R04 was four missing locators. Both of its findings about the description are carried unrepaired. There are two new P3 findings. Nothing is blocking. Every finding is P3, and each repair is one sentence, one table or one paragraph of the description.

## R01 (P3) — Scope says every open target is stated in `Suggested.lean`, but the new idele–ideal comparison is an open target that it does not state

**Location.**
- `TauCetiRoadmap/ClassFieldTheory/README.md`, lines 72–73: "The **open targets** close the items that have them; they are the theorems stated in `Suggested.lean`."
- Lines 117–120 (item 9) list among the **Open targets** "the comparison of extension of idele classes and extension of ideal classes along every finite extension of number fields that its route reads".

**Claim.**
- The repair of the previous R01 added the comparison (13.1, "Extension of ideals, read on ideles", lines 1949–1978) and named it an open target in Scope.
- `Suggested.lean` does not state it. That is correct, because it is a supporting step of the principal ideal theorem and not a headline.
- But lines 72–73 then say something false. A later reader could also take the sentence as a promise that a statable open target is missing from the acceptance test.

**Witness.**
- `Suggested.lean` declares six theorems and one definition (lines 81, 97, 112, 130, 145, 156, 170). The Headline acceptance signatures table (lines 694–700) lists the same seven.
- No declaration mentions `ideleClassExtension` or `ClassGroup.extendedHom`.

**Repair.** Replace the sentence at lines 72–73 with: "The **open targets** close the items that have them; the open headline theorems among them are the theorems stated in `Suggested.lean`, and the comparison of extension of ideles with extension of ideals (Layer 13) is a supporting target of this README only."
- Tested on the instance that refuted it: the comparison is still an open target of item 9, it is not in `Suggested.lean`, and the repaired sentence no longer says it is.

## R02 (P3) — The renumbering of §2.5 and §2.6 is not in a form the overlap check reads

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md`, lines 252–255: "**§2.1–§2.7**, the conventions, are Conventions C.1–C.7: **§2.4** is C.4 … and **§2.6** is C.6".

**Claim.**
- On main the conventions are numbered §2.1–§2.7 (main README lines 259–479). This head renames them C.1–C.7.
- Open roadmaps cite the old ids:
  - AnticyclotomicLocalUnits README line 26: "ClassFieldTheory §2.6" and "§§2.5–2.6";
  - EllipticCurveModularityWild3Adic README lines 44, 77 and 240: "ClassFieldTheory §2.6".
- The prose sentence gives the mapping to a human reader. The overlap check does not read it: `scratch/overlaps.md` still lists §2.5 and §2.6 as ids this pull request drops that other roadmaps cite. So every review of this pull request and of the two citing roadmaps keeps raising them.

**Witness.**
- #1411's head, which revises this same folder, maps the same ids with a table headed "| Former label | Where it is now |", with rows §2.4, §2.5, §2.6 and §4.
- That pull request's review at 5bfdf39 records that after the change the overlap check lists no dropped cited id.

**Repair.** Replace the four bullets at lines 254–260 with a table whose header names the former numbering, one row per id:

| Former section | Where it is now |
|---|---|
| §2.1 … §2.7 | C.1 … C.7, one row each (§2.4 is C.4, Tate's theorem; §2.5 is C.5, the direction of reciprocity; §2.6 is C.6, the Frobenius convention) |
| §4, §4 Layer k | Layers 0–14; Layer k |
| Layer 0, item 4 | the Layer 0 bullets *The operations* to *Primary components* |
| §5.1 … §5.8 | W.1 … W.8, one row each |

Check after the push that `roadmaps overlaps ClassFieldTheory` no longer reports §2.5 or §2.6.

## R03 (P3) — The merge order against #617 and #1411 is still not stated

Carried from the previous R02, and not repaired: the description in `scratch/pull-request.md` is unchanged and names neither pull request.

**Location.** The pull-request description, "ClassFieldTheory: correct hypotheses, conductors and lifting".

**Claim.**
- Two open pull requests change this roadmap, and both conflict with this head in `TauCetiRoadmap/ClassFieldTheory/README.md` and `Suggested.lean`.
- #1411's `Suggested.lean` declares `localAbsoluteUpperRamificationGroup` (line 525) and `cyclotomicCharacter_artinMap` (line 583) in this folder's namespace. These are the same fully qualified names as this head's lines 112 and 81.
- #1411 states the Layer 7 reciprocity theorems under other names: `map_unitFiltration_normResidue` (line 504) and `map_artinMap_unitFiltration` (line 541).

**Witness.** `roadmaps overlaps ClassFieldTheory` (index of 2026-11-09T19:43Z) shows the conflicts:
- "#1215 and #1411 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`";
- the same files for #617 (head adfe4b1).

**Repair.**
- Add a merge-order paragraph to the description: this pull request merges first, and #617 and #1411 rebase on it, keeping only the ClassFieldTheory edits this head lacks.
- Under that order, #1411's `map_unitFiltration_normResidue` and `map_artinMap_unitFiltration` are dropped in favour of `normResidue_map_unitFiltration` and `map_artinMap_unitFiltration_eq_upper`.
- README line 282 already maps `map_unitFiltration_normResidue`, the only one of these names another roadmap cites (PadicPeriodRings README lines 33 and 119, LocalAnabelianGeometry line 145). `roadmaps grep` finds no citation of `map_artinMap_unitFiltration` outside #1215 and #1411.
- Nothing in the folder changes.

## R04 (P3) — The edit to `Completed/LocalGaloisGroups/Suggested.lean` is outside the folders this pull request declares

Carried from the previous R03, and not repaired.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`, 62 insertions and 50 deletions against main.
- Line 12 is `import TauCetiRoadmap.ClassFieldTheory.Suggested`.
- Line 345 applies `ClassFieldTheory.cyclotomicCharacter_artinMap p F u hu σ hσ`.

**Claim.**
- The edit is needed: that file imports this roadmap's `Suggested.lean`, and this head changed the declarations it uses.
- The only folders the brief records for the pull request are GlobalQuadraticForms and QuadraticFormInvariants.

**Witness.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassFieldTheory' ':!TauCetiRoadmap/GlobalQuadraticForms' ':!TauCetiRoadmap/QuadraticFormInvariants'` prints `Completed/LocalGaloisGroups/Suggested.lean | 112`.

**Repair.**
- Name `Completed/LocalGaloisGroups` in the description as a folder of this pull request.
- Add one sentence saying that the edit re-points that file to Tau Ceti's names and to the open target `cyclotomicCharacter_artinMap`.

## Previous findings

- **Previous R01 (P2, unowned idele–ideal square): repaired.**
  - 13.1 now states the square as its own target (lines 1949–1978): "Hence the square `C_K → C_E` over `Cl_K → Cl_E` commutes".
  - The principal ideal theorem's route (lines 2004–2037) supplies `hT` in step 2: "`H'/K` is Galois … The fixed field of the commutator subgroup of `Gal(H'/K)` is the maximal abelian subextension".
  - I opened every declaration named at the pins (listed under Verified sound), and the route is correct as written.
- **Previous R04 (P3, four missing locators): repaired.** I checked each new locator in milne-cft:
  - 8.1 "III Theorem 5.1, p. 115" is at line 5186, PDF page 124, which is printed p. 115. Line 5188 restricts the proof to characteristic zero.
  - 10.1 "VIII Theorem 4.2, p. 241" is at line 10937, and "VII Theorem 7.1, p. 219" at line 9977.
  - 11.1 "V Theorem 5.3(a)/(b)" begins at line 8123 on printed p. 178, and its parts (a) and (b) are on p. 179 (lines 8128–8133). "VII Theorem 8.1(a), p. 221" is at line 10042.
  - 12.1 "V Theorem 5.5, p. 179" is at line 8152, and "VII Theorem 9.5, p. 226" at line 10287.
  - 14.1 "V Example 5.4, p. 179" is at lines 8142–8150.
- **Previous R02 and R03 (description): not repaired.** They are carried as R03 and R04.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate passes every check (`gate.md`), with `build=0`.
- My rerun of the brief's gate command gives 0 for every check in the folder. It reports `outside-folder=5`, all five in `TauCetiRoadmap/GlobalQuadraticForms/` and `TauCetiRoadmap/QuadraticFormInvariants/`, which the brief names as this pull request's own.
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives exactly six warnings, all `declaration uses 'sorry'`, at lines 81, 97, 130, 145, 156 and 170, and nothing else.

**Signatures.**
- I ran `#check @` on all seven declarations in a scratch copy. The elaborated types are identical to `signatures.md`.
- The file has no `variable` block, so no binder can be lost.
- The README's generality matches the Lean signatures:
  - `cyclotomicCharacter_artinMap`: any `Algebra ℚ_[p] F` with `Module.Finite`, no `ValuativeExtension`;
  - `normResidue_map_unitFiltration`: `ValuativeExtension`, `IsGalois` and `IsMulCommutative`, with no characteristic hypothesis;
  - `map_artinMap_unitFiltration_eq_upper`: no `CharZero`;
  - the Layer 13 theorems: `NumberField` and `IsAbelianGalois`.
- Tau Ceti's `localCyclotomicCharacter` is Mathlib's `cyclotomicCharacter (AlgebraicClosure K) p` composed with `toRingAut` (`FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean:33`). So the Layer 7 target differs from `localCyclotomicCharacter_artinMap_unit` (`Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311`) only by the dropped `[ValuativeExtension ℚ_[p] F]`, as the docstring says.

**Headlines and padding.**
- The headline table (lines 694–700) and the module docstring agree with the seven declarations. The Tau Ceti-proved headlines are named in the module docstring.
- One-tactic probe, on a scratch copy with the original theorems removed so that `exact?` cannot find them: `simp`, `rfl`, `infer_instance`, `trivial`, `first | simp_all | aesop` and `exact?` fail on all six theorems, 36 errors out of 36 attempts. No declaration is padding.

**New 13.1 text: every declaration opened at the pin.**

Tau Ceti:
- `ideleExtension` and `ideleClassExtension` (`NumberField/Global/Ideles/Extension.lean:41`, `:189`).
- `ideleFiniteCoord_ideleExtension` (`:100`): the coordinate at `w` is the image of the coordinate at `w.under` under `adicCompletionExtension`.
- `valued_adicCompletionExtension` (`RingTheory/DedekindDomain/AdicCompletionExtension.lean:376`): the valuation raised to `ramificationIdx'`, which is the factor `e(w|v)` the README uses.
- `toFractionalIdeal` and `count_coe_toFractionalIdeal` (`FiniteAdeleRing/ClassGroup.lean:176`, `:191`).
- `ideleCongrOneSubgroup_one = ⊤` (`Ideles/Congruence.lean:160`).
- `rayClassQuotient_mk_of_mem`, `rayClassQuotient_surjective` and `ker_rayClassQuotient = raySubgroup` (`Ideles/Ray/ClassQuotient.lean:223`, `:240`, `:316`).
- `oneEquivClassGroup` and `oneEquivClassGroup_rayClassMk` (`RayClass/Basic.lean:319`, `:327`).
- `ideleClassLevelEquiv_mk` and `globalGroundEquiv_mk` (`Global/IdeleClass/Level.lean:162`, `:227`).
- `ideleCoeffOfIntermediateField_ideleExtension` (`Global/Coefficients.lean:556`).
- `NormalLayer.ideleClassLevelEquiv_mem_normSubgroup_iff` (`Global/IdeleClass/Norm.lean:335`).
- `range_ideleClassNormMap_eq_of_algEquiv` (`Ideles/Norm/Relative.lean:286`).
- `isAbelianGalois_rayClassField`, `range_ideleClassNormMap_rayClassField`, `isUnramifiedAt_hilbertClassField`, `isUnramifiedAtInfinitePlaces_hilbertClassField` and `fieldRange_le_hilbertClassField_iff` (`ClassFields/RayClassField.lean:143`, `:148`, `:348`, `:354`, `:362`). The last assumes `IsAbelianGalois K L`, which step 2 supplies.
- `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator` (`Formation/PrincipalIdeal.lean:67`), with `hT : T.galHom.range = commutator big.Gal`.

Mathlib:
- `ClassGroup.extendedHom`, `extendedHom_mk` and `extendedHom_mk0` (`RingTheory/ClassGroup/ExtendedHom.lean:134`, `:144`, `:179`).
- `ClassGroup.mk0_eq_one_iff` (`ClassGroup/Basic.lean:400`).
- `Ideal.map_algebraMap_eq_finsetProd_pow` (`DedekindDomain/Factorization.lean:829`), with no Galois hypothesis.
- `IsSepClosed.lift` (`FieldTheory/IsSepClosed.lean:293`).
- `Algebra.IsUnramifiedAt.comp` (`RingTheory/Unramified/Locus.lean:55`) and `Algebra.IsUnramifiedAt.of_liesOver` (`NumberTheory/RamificationInertia/Unramified.lean:85`).
- `IsUnramifiedAtInfinitePlaces.trans` and `.bot` (`NumberField/InfinitePlace/Ramification.lean:538`, `:548`).

Ownership of the comparison:
- No pinned declaration relates `ideleExtension` to `toFractionalIdeal`, `Ideal.map` or a class group. I grepped every Tau Ceti file that mentions `ideleExtension`.
- GlobalNumberFields on main covers only one field each: Layer 7 (lines 459–474) is the ray-class dictionary over one field, and Layer 8 (lines 476–507) is extension of adeles and ideles with norms.
- `roadmaps grep 'ideleClassExtension|ClassGroup\.extendedHom|extension of ideal classes|capitulation'` finds no other owner. CyclotomicClassGroupsAndStickelberger uses `extendedHom` only on ideal classes.
- So this roadmap is the owner.

**Unchanged library facts, rechecked at the pin.** `map_artinMap_unitFiltration_zero`, `conductorExponent_fixedField_ker`, `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot`, `hilbertClassField` (an `abbrev` for `rayClassField (Modulus.one K)`, `RayClassField.lean:241`) and `hilbertClassArtinEquiv` (`:262`).

**Suppliers.**
- Every named supplier is on main: ProfiniteCohomology, ProfiniteProPGroups, LocalFieldsRamification, GlobalNumberFields and NumberFieldArithmetic.
- `roadmaps resolve` (`citations.md`) finds no unresolved citation or Lean name.

**Source sample, every seeded target.** Pages are printed pages; the milne-cft PDF offset is 9 and the milne-adt offset is 8.
- **0.1–4.1.**
  - milne-cft line 3911: II Theorem 3.11, p. 84, with the three per-subgroup hypotheses of C.4.
  - Line 4641: III Proposition 1.9, p. 102.
  - Line 4822: III Theorem 3.1, p. 107; line 4835 is the scaled inflation formula of C.3.
  - Line 4844: III Lemma 3.2, p. 107.
  - Line 4901: III Theorem 3.5, norm limitation.
- **5.1.** milne-adt:
  - line 1073: I Theorem 2.1, p. 26;
  - line 1138: Corollary 2.3, p. 28;
  - line 1227: Theorem 2.8, p. 31, finite `M` of order prime to `char K`;
  - lines 1266 and 1350: Lemmas 2.10 and 2.12.
- **6.1.** NSW is uncertified (see Not verifiable).
- **7.1.**
  - serre1961 line 856: n° 3.1.
  - serre1961 lines 924–938: Proposition 3, p. 128.
  - milne-cft lines 7423–7447: V Theorem 3.27, Remark 3.28 and Examples 3.29–3.30, p. 165.
- **8.1.**
  - milne-cft line 5186: III Theorem 5.1, p. 115.
  - milne-adt line 1078: footnote 6, p. 26.
- **9.1.** Artin–Tate XV is waived.
- **10.1.**
  - milne-cft line 9977: VII Theorem 7.1, p. 219.
  - Line 9996: Proposition 7.2.
  - Line 10007: Lemma 7.3.
  - Line 10042: Theorem 8.1(a)/(b), p. 221.
  - Line 10937: VIII Theorem 4.2, p. 241.
  - Line 11011: Theorem 4.7.
- **11.1.** milne-cft lines 8123–8133: V Theorem 5.3, pp. 178–179.
- **12.1.**
  - milne-cft line 10189: Lemma 9.1, p. 223.
  - Line 10218: Lemma 9.3, p. 224.
  - Line 10279: Lemma 9.4, p. 225.
  - Line 10287: Theorem 9.5, p. 226.
  - Line 8152: V Theorem 5.5, p. 179.
- **13.1.**
  - milne-cft line 7252: V Theorem 3.17, p. 161.
  - milne-cft line 10629: VIII Theorem 3.1, p. 234; line 10643 is Remark 3.2, where the number is 5².
  - milne-cft line 7004: V Example 3.2, p. 157.
  - milne-cft line 7041: V Theorem 3.5, p. 158.
  - kopp-lagarias lines 128, 160 and 174: Theorems 1.1–1.3, pp. 3–4.
- **14.1.**
  - milne-cft line 8142: V Example 5.4, p. 179. It assumes a primitive `n`-th root of 1, which is automatic at `n = 2`.
  - VIII Theorem 4.2, as above.

**Adversarial pass.** Every value in the table was computed in this review. "Arithmetic" means `χ(Art u) = u⁻¹` and uniformizer ↦ arithmetic Frobenius.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `cyclotomicCharacter_artinMap` | `ℚ₃`, `u=4`, `μ₉`; `ℚ₂`, `u=−3`, `μ₁₆`; `μ₈` | `4·7=28≡1 mod 9`, so `χ=7` against geometric `4`. `13·5=65≡1 mod 16`, so `χ=5` against `13`. `3²≡5²≡7²≡1 mod 8`, so `μ₈` does not separate the conventions. `localCyclotomicCharacter` is `cyclotomicCharacter (AlgebraicClosure F) p` after `toRingAut`, the same object. | holds | none |
| same, hypothesis automatic | `a∈1+pℤ_p`, `X^{ℓ^k}−a` at `1` | `‖f(1)‖ ≤ p⁻¹ < 1 = ‖f′(1)‖² = ‖ℓ^k‖²`, so `a` is `ℓ^k`-divisible for all `k`, and the discrete valuation of `F` vanishes on `1+pℤ_p`. `v(p)<0` would give `v(1−p)=v(p)≠0`, a contradiction. | holds | none |
| `normResidue_map_unitFiltration` | `ℚ₂(i)`, `n=0,1,2`; `ℚ₃(ζ₉)`, `n=0,1,2`; `𝔽₂((t))` with `y²−y=t⁻¹`; unramified `L` | `ℚ₂(i)`: `σ(1+i)−(1+i)=−2i`, so `i_G(σ)=2`, `G₀=G₁=G`, `G₂=1`, `φ(1)=1`. Units: `−1` is not a norm, so `U¹→G`; `1+4ℤ₂⊆N`, so `U²→1`. `ℚ₃(ζ₉)`: `v_L(ζ^a−ζ)=v_L(ζ³−1)=3` for `a=4,7`, lower orders `6,3,3,1`, `φ(2)=(3+3)/6=1`, upper orders `6,3,1`; unit images `6,3,1`. `𝔽₂((t))`: break `1`, so `U¹→C₂`, `U²→1`. Unramified: `G⁰=1` and `U⁰⊆N`. | holds | none |
| `localAbsoluteUpperRamificationGroup` | depth `−1`; `ℚ₂(ζ₈)`; `X³−5` over `ℚ₅`; `ℚ₅(ζ₅)` | Depth `−1`: all of `G_K`. `ℚ₂(ζ₈)`, depths `0..3`: `{1,3,5,7},{1,3,5,7},{1,5},{1}`, from `G^v=Gal(L/ℚ₂(ζ_{2^m}))` for `m−1<v≤m`. `X³−5`: Eisenstein, `3∤4` so `ζ₃∉ℚ₅`, group `S₃`, `G⁰=C₃`, `G^{>0}=1`, and `C₃↦1` in `S₃^ab`, so an abelian-only definition differs. `ℚ₅(ζ₅)`: `4` at depth `0`, `1` at depth `>0`. | determines the object | none |
| `map_artinMap_unitFiltration_eq_upper` | `n=0`; unramified quadratic quotient of `G_{ℚ₃}^ab`; `ℚ₂(ζ₈)` quotient; `Kˣ` in place of `U⁰` | `n=0`: both sides are the image of inertia. Quadratic quotient: both sides `1`, `Art(3)` = Frobenius of order 2. `ℚ₂(ζ₈)`: `U¹,U²,U³ ↦ {1,3,5,7},{1,5},{1}`, the same as the upper side. `Art(Kˣ)` is dense, so its image is the whole quotient. | holds | none |
| extension of ideals read on ideles (new) | `ℚ→ℚ(i)`, `x=2` at 2; `x=3` at 3; `ℚ(√−5)→K(i)`, `x` a uniformizer at `𝔭`; `ℚ→ℚ(∛2)`, `x=5` at 5; `E=K` | `e=2`, so order `2` at `(1+i)` and ideal `(1+i)²=(2i)=(2)`; without `e` it gives `(1+i)`, norm `2≠4`. `3` is inert, `e=1`, ideal `(3)`; the degree model gives `(9)`. `5≡5 mod 8`, so 2 is inert in `ℚ(√5)` and `e(𝔓|2)=f=2`, `e(𝔓|𝔭)=1`, `𝔓²=((1+i)²)`, `𝔓=(1+i)`, and both paths give the trivial class. `x³−2≡(x−3)(x²+3x+4) mod 5` (disc `3`, a nonsquare mod 5), so `5=𝔭₁𝔭₂`, `e=1`, ideal `5𝒪_E`; the degree model gives `(125)`. `E=K`: both maps are the identity. | holds | none |
| `isPrincipal_map_hilbertClassField` | `ℚ`; `ℚ(√−5)`; `I=⊥,⊤` | `h(ℚ)=1`, so `H=ℚ`. `ℚ(√−5)`: `x²+5y²=2` has no solution, so `𝔭` is not principal. `𝔭²=(4,2+2√−5,−4+2√−5)=(2)`. `K(i)=K(√5)` is unramified at 2 and 5 (`e` equal to `e(K/ℚ)`), so it is `H`, and `𝔭𝒪_H=(1+i)`. `⊥↦⊥` and `⊤↦⊤`. | holds | none |
| the route's `hT` (new) | `ℚ(√−5)`; `hT` dropped | Kuroda's formula for `ℚ(i,√5)` gives `h=Q·1·1·2/2=Q`. `H(ℚ(√−5))` has class number 1, so `H'=H`, `Gal(H'/K)=C₂`, and the commutator `1=Gal(H'/H)`, consistent. Dropping `hT` (no restriction) would put `C_K` in `N_{H/K}C_H`, that is `Cl_K=1`, against `[𝔭]≠1`. | holds | none |
| `count_relDiscr_eq_finsum_abelianConductor_exponent` | `ℚ(i)`, `ℚ(ζ₈)`, `ℚ(ζ₅)`, `ℚ(ζ₉)`, `ℚ(√13,√17)` at 13 | `2=0+2`; `8=0+2+3+3` (`disc=2⁸`); `3=0+1+1+1`; `9=0+1+2·4` (`3·(6−2−1)=9`); `2=0+1+0+1` (`disc=13²17²`) | holds | none |
| `abelianConductor_eq_lcm` | `ℚ(ζ₈)`; `ℚ(√2)`; product and lcm swapped | max `3`, and `∞` from `ℚ(i)`, give `(8)∞`. `ℚ(√2)`: `(8)`, no `∞`. Swapping: `2⁸` against `2³`. | holds | none |
| 0.1 Nakayama–Rim | `ℤ[C₂]`; trivial `ℤ` | invariants `a+bg` with `a=b` are `ℤ(1+g)`, and the norms `(a+b)(1+g)` are all of them, so `Ĥ⁰=0`. Trivial `ℤ`: `N=2`, `Ĥ⁰=ℤ/2`. | holds | none |
| 2.1 res/cor/inf | cyclic degree `4→2→8` | `inv u=1/4`; `inv res u=2·1/4=1/2`; `inv cor res u=inv(2u)=1/2`; `inf u=2u₈`, `2/8=1/4` | holds | none |
| 3.1 Nakayama map | unramified cubic | `Frob↦[π]`; `Frob²↦[π²]`, `v=2 mod 3` | holds | none |
| 4.1 quadratic test | degree 2; `V₄`; trivial layer | one nonzero value; three non-norm cosets; degree 1 gives the zero map | holds | none |
| 5.1 Euler characteristic | `ℚ₂`: `𝔽₂`, `𝔽₃`, `0`; `ℚ₇`, `μ₃` | `#H¹=8=2·2·2¹`. `ℚ₂ˣ/ℚ₂ˣ³=ℤ/3`, `μ₃(ℚ₂)=1`, `3=3·1·2⁰`. `1=1·1·1`. `inv(7∪δχ)=1·1/3` against geometric `2/3`. | holds | none |
| 6.1 local reciprocity | `ℚ₉/ℚ₃`; `ℚ₂(ζ₅)` | `4` a unit, hence a norm, `↦1`; `3↦Frob`. `ord₅2=4`, `ζ₅↦ζ₅²` against `ζ₅³` (`2·3≡1`). | holds | none |
| 7.1 conductor Checks | `ℚ₂(√2)`, `ℚ₂(ζ₁₂)`, `ℚ_p(μ_p)` | `a²−2b²∈{1,−1,7,…}`, units `±1 mod 8`, `f=3=v₂(8)`. `0+0+2+2=4=f·d=2·2`. Sum `p−2` against max `1`; equal at `p=3`, different from `p=5`. | holds | none |
| 8.1 conductor exception | `ℚ₂`, `n=0,1,2` | `U⁰⟨π⟩=Kˣ` gives conductor `0`. `q=2`: `U¹⟨2⟩=ℚ₂ˣ` gives `0≠1`. `n=2`: `U¹/U²≅𝔽₂≠0`, so the conductor is exactly `2`. | holds | none |
| 9.1 Weil transfer | `𝔽₂((s))/𝔽₂((t))`, `t=s²` | purely inseparable, so `G_L=G_K`: index `1≠2` | holds | none |
| 10.1 lifting obstruction | `ℚ(√13,√17)` | `17≡2² mod 13`, `13≡8² mod 17`, `2` inert in `ℚ(√13)` (`13≡5 mod 8`) and split in `ℚ(√17)`. Totally real, so `lcm=2<4=#H²(G,C_L)`. | holds | none |
| 11.1 global reciprocity | `ℚ(ζ₅)`, `(2),(3)` | `ζ↦ζ²`, `ζ↦ζ³`; the product `ζ↦ζ⁶=ζ` matches `(6)`, `6≡1 mod 5` | holds | none |
| 12.1 Kummer index | `ℚ(ζ₃)`, `p=3`, `S={(1−ζ₃)}` | `U(S)=μ₆×⟨1−ζ₃⟩`, `#U(S)/U(S)³=3·3=9=3^{1+1}`. Local indices `9/3⁻²=81` and `9/9=1`; `81/9=9`. | holds | none |
| 13.1 Checks | `25`; `(−1,−1)/ℚ(√2)`; `ℤ+2ℤ[i]`; `ℚ(ζ₇+ζ₇⁻¹)` | `25=5²` (VIII Remark 3.2). `(−1,N(−1))_{ℚ₂}=(−1,1)=1`, with two real ramified places. `h=1·2·(1−0)/2=1`, `disc=−16`. `(6/27)·7=14/9<2`. | holds | none |
| 14.1 Hilbert and quadratic reciprocity | `(−1,−1)/ℚ`; `p=3`, `q=7` | `½+½=0`. `(7/3)=(1/3)=1`; the squares mod 7 are `{1,2,4}`, so `(3/7)=−1`; `(−1)^{1·3}=−1`. | holds | none |

## Not verifiable

These are uncertified or waived in the manifest and are cited by locator only. Every statement they support was checked mathematically in the table.
- serre-local-fields (uncertified): IV §§1–3 with Proposition 14, V §§3 and 6, VI §2, IX §8, XI–XIV, XIV §3, and XV §2 with Theorem 2 and Corollary 3 to Theorem 1.
- neukirch-ant (uncertified): V Theorem 6.2 and VI §7.
- nsw (uncertified): (7.1.8)(i), (7.2.5), (7.2.6) and (7.3.1)–(7.3.4).
- artin-tate (waived): XI §5, XII, XIII, XIV §§1–6 including p. 163, XV, and V–VIII.

Also not verified:
- kopp-lagarias was read as arXiv v3. I did not compare its numbering with the version published in *Ess. Number Th.* 4.
- The elaboration of `Completed/LocalGaloisGroups/Suggested.lean`. It is outside this folder and the brief's Lean commands.
- Ownership against open pull requests that the brief lists without files. I checked #1411 and #617 with `roadmaps show` and `roadmaps overlaps`.

## Source issues

- **Gap** in milne-cft at III Lemma 3.2, p. 107: the source states the norm and transfer diagrams for the local Artin map and leaves the proof "to be added"; it should give a proof or cite one, e.g. Serre, Local Fields XI §3; affects nothing.
- **Gap** in milne-cft at V Theorem 3.27, p. 165: the source omits the proof of the product half (discriminant as product of character conductors), calling it local; it should prove it or cite the local conductor–discriminant formula; affects the proof.
- **Gap** in milne-cft at III Theorem 5.1, p. 115: the existence theorem is stated for every local field but proved only in characteristic zero; it should restrict the statement or supply the characteristic-`p` case; affects the proof.
