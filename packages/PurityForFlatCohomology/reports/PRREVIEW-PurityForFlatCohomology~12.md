# Review of PurityForFlatCohomology (pull request #1840 at fb0e7fb)

**Verdict:** needs changes

There are three findings, all P3: two Checks that do not separate the right object from a plausible wrong one, and one locator. Nothing is P1 or P2. The gate passes, the dependency check reports 0 problems and `Suggested.lean` elaborates with `sorry` as the only warning. Both findings of the previous review are repaired.

## R01 (P3) — No Check shows that the Brauer clause of `IsOfDimLEOne` is needed

**Location.** `TauCetiRoadmap/PurityForFlatCohomology/README.md`, §8.2 Checks, lines 3110–3112: "nor does `𝔽_p((t))`, whose Brauer group `H²(𝔽_p((t)), 𝔾_m)` is `ℚ/ℤ`, so that the Brauer clause fails already for `K = k`." The Lean definition is `IsOfDimLEOne` (`Suggested.lean` lines 406–414). It has two clauses:
- `H^i` vanishes for `i ≥ 2` and every commutative finite étale group;
- in positive characteristic, `H²(K, 𝔾_m)` vanishes for every finite separable `K/k`.

**Claim.**
- Every non-example among the §8.2 Checks already fails the first clause:
  - `ℝ` has `H²(ℝ, ℤ/2) = ℤ/2`;
  - `ℚ_p` has `H²(ℚ_p, μ_ℓ) ≅ ℤ/ℓ`;
  - `𝔽_p((t))` fails it as well: for a prime `ℓ ≠ p`, `μ_ℓ` is commutative finite étale and `H²(𝔽_p((t)), μ_ℓ) ≅ Br(𝔽_p((t)))[ℓ] ≅ ℤ/ℓ ≠ 0`.
- So the most plausible wrong model, "cohomological dimension `≤ 1`" with the Brauer clause dropped, passes every Check. In characteristic `p` the two notions differ.

**Witness.** [C19] line 570 (Definition A.1, p. 15) states the Brauer clause separately. Take `K = 𝔽_p((t))` and let `k` be the fixed field in `K^sep` of a pro-`p` Sylow subgroup of `Gal(K^sep/K)`. Then:
- `k` satisfies the first clause;
- `Br(k)[p^∞] ≠ 0`.

**Repair.**
- In the `𝔽_p((t))` Check, say that both clauses fail there.
- Add this Check:
  "The Brauer clause is needed in characteristic `p`. Let `K = 𝔽_p((t))` and let `k` be the fixed field in `K^sep` of a pro-`p` Sylow subgroup of `Gal(K^sep/K)`. Since `Gal(K^sep/k)` is pro-`p`, `cd_ℓ(k) = 0` for `ℓ ≠ p`, and `cd_p(k) ≤ 1` in characteristic `p`. So `H^i(k, G) = 0` for `i ≥ 2` and every commutative finite étale `G`. But `Br(k)(p)` is the colimit of the groups `Br(K′)(p) ≅ ℚ_p/ℤ_p` over the finite subextensions `K′/K` of `k`, whose degrees are prime to `p`. Restriction multiplies local invariants by these degrees, so it is injective on `ℚ_p/ℤ_p`, and `H²(k, 𝔾_m) = Br(k) ≠ 0`. So `k` is not of dimension `≤ 1`, and a definition without the Brauer clause would accept it."

**Tested.**
- In `k`, the first clause holds:
  - `H²(k, ℤ/ℓ) = 0` for `ℓ ≠ p` (pro-`p` group);
  - `H²(k, ℤ/p) = 0` (`cd_p ≤ 1` in characteristic `p`).
- `k` fails the second clause at `K = k`: `Br(k)(p) = colim ℚ_p/ℤ_p` with injective transition maps, which is nonzero.
- Both clauses fail for `𝔽_p((t))` (`ℤ/ℓ` and `ℚ/ℤ`).

## R02 (P3) — The "non-constant coefficients" Check of §6.3 computes only zero groups

**Location.** README §6.3 Checks, lines 2097–2101: "for `R = ℝ⟦x, y⟧` … and `G = μ_3` … `H^1(Spec R, μ_3) = R^×/R^{×3}`, which injects into `H^1(U_R, μ_3)` through `Γ(U_R, 𝒪)^×/3 = R^×/R^{×3}`, as claimed for `i = 1`."

**Claim.**
- `R^× = ℝ^× · (1 + 𝔪)`. Every real number has a real cube root, and `1 + 𝔪` is 3-divisible (Hensel; `3` is a unit). So `R^×/R^{×3} = 0`, and `μ_3(R) = 1`.
- So in degrees `0` and `1` both sides are the trivial group. The Check holds equally for the zero sheaf, which is the constant sheaf on `μ_3(R) = 1`, and it tests nothing about `etaleDepth_ge_virtualDimension` for a non-constant `G`.

**Witness.** For `a ∈ ℝ^×` and `m ∈ 𝔪`, `a^{1/3}(1 + m)^{1/3}` is a cube root in `R`, by the binomial series, which converges `𝔪`-adically.

**Repair.** Replace `ℝ⟦x, y⟧` by `ℚ⟦x, y⟧`, which is regular with `vdim = 2`. `μ_3` is finite étale over it and not constant, since `ζ_3 ∉ ℚ`. Write the Check as:

"`H^0` is `μ_3(R) = 1 → μ_3(Γ(U_R, 𝒪)) = 1`. `H^1(Spec R, μ_3) = R^×/R^{×3} ≅ ℚ^×/ℚ^{×3}`, since `1 + 𝔪` is 3-divisible, and it contains the nonzero class of `2`. It injects into `H^1(U_R, μ_3)` through `Γ(U_R, 𝒪)^×/3 = R^×/R^{×3}` (depth `2`), as claimed for `i = 1`. The zero sheaf would give `0` there."

**Tested.**
- `2` is not a cube in `ℚ`.
- Kummer on `Spec R` with `Pic R = 0` gives `H^1(R, μ_3) = R^×/3`.
- Kummer on `U_R` with `Γ(U_R, 𝒪) = R` (Tau Ceti `TauCeti.AlgebraicGeometry.Spec.presheaf_map_leTop_bijective_of_flat`) gives `R^×/3 ↪ H^1(U_R, μ_3)`.
- The composite is the identity of `R^×/3`.

## R03 (P3) — "same file" points to the wrong Mathlib file for `CategoryTheory.Hom.commGroup`

**Location.** README, Exact supplier contracts, From Mathlib, lines 358–362: "`CategoryTheory.GrothendieckTopology.subcanonical_over` (`Mathlib/CategoryTheory/Sites/SubcanonicalOver.lean`) … For a commutative group object `G` (`IsCommMonObj`), `CategoryTheory.Hom.commGroup` (scoped in `CategoryTheory.MonObj`, same file)".

**Claim.** The last file named before "same file" is `SubcanonicalOver.lean`, which does not contain `Hom.commGroup`.

**Witness.** At Mathlib `1b1ccf4`:
- `Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean` line 310 declares `abbrev Hom.commGroup [IsCommMonObj G] : CommGroup (X ⟶ G)` in namespace `CategoryTheory`, and line 312 makes it a scoped instance of `CategoryTheory.MonObj`;
- `SubcanonicalOver.lean` declares only `subcanonical_over` (line 25).

**Repair.** Replace "same file" by "`Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean`".

## Previous findings (PRREVIEW~11, head ebfcd46)

### R01 (P2): CS24 Theorem 6.2.4 for every finite étale `G`, and C19 Theorem 6.1 for tori — repaired

What the head adds to `Suggested.lean`:
- `homPresheaf` (lines 203–221) and `smallEtaleSheaf` (lines 223–231), as the repair asked.
- `etaleDepth_ge_virtualDimension` (lines 241–250) for every `G : Over (Spec R)` with `[GrpObj G] [IsCommMonObj G] [IsFinite G.hom] [Etale G.hom]`. The constant case is now a Check of §6.3 (README lines 2088–2091).
- `IsTorus` (lines 353–357), written with `TauCeti.SplitTorus.groupScheme (A i) (ULift (Fin r))`, the same object as the suggested form: `Scheme.lean` line 67 makes `groupScheme` an `abbrev` for `DiagonalizableGroup.groupScheme R (characterGroup σ)`.
- `etaleCohomology_torus_purity` (lines 436–443).
- Beyond what was asked: `IsOfDimLEOne` (lines 406–414) and `etaleCohomology_torus_puncturedSpectrum_subsingleton` (lines 421–428), which state C19 Theorem 1.4.

What the head changes in the module docstring:
- The item on non-constant `G` is deleted.
- The multiplicative-type item (lines 97–105) gives the `μ_p` over `𝔽_p⟦x⟧` reason.

README §§6.3, 7.12c, 8.2(d), 8.3, 8.6 and the headline paragraph (lines 46–72) name every new declaration, and the gate reports `readme-ids-missing=0`.

### R02 (P2): ReductiveGroups as a second owner of multiplicative type over a base — repaired in this folder

The two edits asked for are in place:
- Scope, lines 214–217: "ReductiveGroups owns diagonalizable groups, groups of multiplicative type and tori over a field (its Layer 4); their theory over an arbitrary base scheme is owned here".
- Downstream consumers, lines 3442–3447.

Main's ReductiveGroups bears out the split:
- Layer 4 (main `README.md` lines 432–441) is over a field;
- its 9B (lines 1611–1612) has split reductive group schemes with the torus as data, and no relative theory of multiplicative type.

The residual is outside this folder. ReductiveGroups at #1676, head 948dbef, line 3886, still reads "The multiplicative-type theory over `S` is owned here". That revision of a main roadmap cannot cite an unmerged roadmap, and the previous repair already asked it to narrow to the field case. No edit in this folder can do more.

## Verified sound

### Gate, dependency check, build, diff

- **Gate rerun at fb0e7fb.** Every counter is 0 and the gate prints `OK` (including `dropped=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`). The worker's `gate.md` also shows `build=0`.
- **Dependency check.** `gate --depcheck … --movable` prints exactly `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In `ORDER.txt`, PerfectoidQuotientsPartII is at line 219 and this roadmap at line 220; SchemeAndStackFoundationsPartII (line 256) and EtaleDualityAndPerverseSheavesPartII (line 388) are later, as the README's "to be imported by later roadmaps" paragraph says.
- **Build.** `lake env lean TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` exits 0 in 17 s, with exactly 15 `declaration uses 'sorry'` warnings, at lines 161, 172, 185, 241, 258, 268, 275, 288, 320, 336, 378, 394, 421, 436 and 450.
- **Diff and pins.** The diff outside the folder is empty. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, as README lines 284 and 382 say.

### Signatures and padding

- **Signatures.** A scratch copy of `Suggested.lean` ends in `#check @…` for all 25 declarations, and all elaborate.
  - There is no `variable`, `include` or `omit`, so no binder is lost.
  - The new types match the README:
    - `homPresheaf : {S} → (G : Over S) → [GrpObj G] → [IsCommMonObj G] → (Over S)ᵒᵖ ⥤ AddCommGrpCat`;
    - `smallEtaleSheaf … : Sheaf S.smallEtaleTopology AddCommGrpCat`;
    - `IsTorus : Grp (Over X) → Prop`;
    - `IsOfDimLEOne : (k : Type u) → [Field k] → Prop`;
    - the theorems of §§6.3, 8.3 and 8.6 carry exactly the hypotheses of README lines 2034–2041, 3120–3124 and 3176–3180.
- **One-tactic probe.** Replacing each of the 15 `sorry`s by `first | rfl | infer_instance | decide | trivial | exact inferInstance | simp | (intro; simp) | aesop` gives 15 errors and 0 closures. No theorem is padding.
- **Form.** There is:
  - no `lemma`, `set_option`, `#eval` or `True` placeholder;
  - one `import Mathlib` plus eight existing `TauCeti.*` modules, the new one being `TauCeti.Algebra.AlgebraicGroup.SplitTorus.Scheme`;
  - a docstring on every declaration;
  - Layer comments in README order.

### Headline theorems

Stated in Lean (15):
- Zariski–Nagata purity, both clauses (§1.8);
- Katz (§5.6);
- the étale-depth bound for every commutative finite étale `G` (§6.3);
- Auslander (§7.2);
- factoriality (§7.4);
- the local Picard group, two statements (§7.6);
- global complete intersections, two statements (§7.8);
- torsion `H²(𝔾_m)` purity (§7.14);
- C19 Theorems 1.3, 1.4, 6.1 and 1.1 (§§8.1, 8.3, 8.6, 8.7).

Named as not statable in the docstring, each with its missing carrier:
- §§6.2, 6.5 and 7.1: fppf restriction maps;
- §2.1: the crystalline Dieudonné module;
- §§3.2–3.6: animated rings;
- §§5.8–5.10: prismatic Dieudonné modules and the arc site;
- §7.3: restriction of torsors, and gerbes;
- §7.12: Azumaya Brauer groups;
- §§8.9–8.16: pullback of small-étale cohomology along `Spec 𝒪_{X,x} → X`;
- general §§7.14–7.15: non-smooth `T`.

The docstring's reasons hold at the pins:
- the only `HasSheafify` instances for scheme sites are `AffineEtale.lean` lines 105 and 112 (affine étale and `smallEtaleTopology`);
- `cohomologyPresheafFunctor` (`SheafCohomology/Basic.lean` lines 70–71) needs `Sheaf J AddCommGrpCat.{v}`.

No statable headline is missing.

### Library declarations opened at the pins

Mathlib `1b1ccf4`:
- `MonObj.comp_one`, `MonObj.comp_mul` (`Monoidal/Cartesian/Mon.lean` lines 436, 440);
- `Hom.commGroup` (`Cartesian/Grp.lean` line 310);
- `yonedaCommGrpGrpObj : (Grp C)ᵒᵖ ⥤ CommGrpCat` (`Cartesian/CommGrp_.lean` line 44), so the README is right that there is no `Cᵒᵖ`-valued presheaf of a commutative group object;
- `AlgebraicGeometry.Etale` (class, `Morphisms/Etale.lean` line 39), `Etale.forget` (line 165), `Etale.mk` (line 183);
- `IsFinite` (`Morphisms/Finite.lean` line 41);
- `smallEtaleTopology` (`Sites/Etale.lean` line 50);
- `isGrothendieckAbelian_sheaf_smallEtaleTopology` (`Sites/AffineEtale.lean`).

Tau Ceti `2fd255d`:
- `TauCeti.SplitTorus.groupScheme (R σ : Type u) [CommRing R] [Finite σ]` (`SplitTorus/Scheme.lean` line 67);
- `characterGroup σ = Multiplicative (σ →₀ ℤ)` (`SplitTorus/Basic.lean` line 74);
- `cohomologicalDimension` (`ContCohomology/CohomologicalDimension/Basic.lean` line 156), which is for profinite groups only: there is no field-dimension notion.

Duplication by object found nothing at either pin:
- no `Hom(−, G)` presheaf into `AddCommGrpCat`: the hits are `muPresheaf` and the Picard presheaves only;
- no use of `smallEtaleTopology`;
- no torus over a base;
- no field of dimension `≤ 1`.

`library-matches.md` lists no same-name hit for the five new declarations.

### Seeded sample of sources (all 15 targets)

| Target | Checked against | Result |
|---|---|---|
| 1.2 | CS24 lines 1332–1345: (3.2.1.3) on p. 32 and the sentence on p. 33 (additivity of dimension, EGA IV₂ 6.1.2) | matches; Avr77 3.6 is uncertified and is the declared gap `ci-defect-additivity` |
| 1.5 | CS24 lines 1356–1366: Lemma 3.2.3, p. 33 (bijective for `i < dim R − 1`, injective at `dim R − 1`); (3.2.3.1)–(3.2.3.2) | matches, route included |
| 5.9 | CS24 lines 3430–3456: Thm 6.1.1, (6.1.1.1), p. 82, proof by products of valuation rings and Lemma 2.2.3 (line 764, p. 19); (1.1.6) at line 141 (p. 4), extended to perfectoids on p. 5 (lines 148–156) | matches |
| 6.1 | CS24 lines 3480–3490: Lemma 6.2.2, p. 83 | matches word for word in content |
| 6.2 | CS24 lines 3491–3538: Thm 6.2.3, pp. 83–84; Thm 1.1.1 at line 66 (p. 3); footnote 25 at line 3542 (p. 84, the André variant through Cor. 5.5.3 and Thm 5.4.4 that the README follows) | matches |
| 6.3 | CS24 line 3540: Thm 6.2.4 (p. 84; proof at lines 3549–3554, p. 85); Thm 1.3.1 at line 288 (p. 8); "commutative, finite, étale" | matches the Lean hypotheses |
| 6.4 | CS24 lines 3562–3564: Remark 6.2.6, p. 85 | matches |
| 7.2 | CS24 lines 3684–3686 (proof of Thm 7.1.3, p. 88) | matches; Aus62 1.3 is uncertified (Not verifiable) |
| 7.5 | EGA44 line 13005: Déf. 21.13.7, printed p. 316 (Prop. 21.13.8 (i)–(ii) at lines 13007–13015); SGA2 lines 3604–3611: XI Déf. 3.1–3.2, printed p. 101 | matches; the equivalent "(i) and (ii)" form is 21.13.8 |
| 7.12b | EGA44 line 2493: Thm 17.5.1 (smooth ⟺ flat with smooth fibre); SGA3 VIII 2.1, 3.1, 3.2 | 17.5.1 matches; SGA3 is uncertified, mathematics in rows 13–14 |
| 7.12e | SGA3 VIII §3, IX §2, X §5 | uncertified; mathematics in row 15 |
| 8.3 | C19 lines 87–89: Thm 1.4, p. 3; proof §5.4 at lines 484–489, p. 13; Def. A.1 at lines 568–570, p. 15 | matches the Lean hypotheses (henselian, regular, `dim ≥ 2`, residue field of dimension `≤ 1`, `H¹ = H² = 0`) |
| 8.5 | C19 lines 497–518 (proof of Thm 6.1, p. 13) | matches the route (local-to-global, étale-local splitting through SGA3 X 4.5, coniveau, `Pic`, Thm 5.3) |
| 8.9 | C19 lines 520–535: Thm 6.2 with (6.2.1), pp. 13–14; (6.2.2) on p. 14 | matches |
| 8.18 | C19 lines 27–28 (p. 1, citing DF84 Rem. 3) | matches; DF84 is uncertified |

The README flags no locator as unverified.

### Cross-roadmap citations resolved

New or changed citations, checked against main `3090489`:
- SchemeAndStackFoundations §2.10 `smoothGroup_fppf_etale_comparison` (main line 3642);
- §2.22 `SchemeBrauerGroup.toCohomologicalBrauer` (line 4479), `azumaya_equivalent_conditions` (line 4442), `brauer_regular_injectivity` (line 4486), `brauer_henselian_local` (line 4491);
- ReductiveGroups Layer 4 (line 432).

The `resolve` leads are all false positives:
- `Prismatic.FlatCohomology.perfectDieudonneComparison`, `pContinuity` and `excision` are at PrismaticCohomologyPartIII #1070, lines 107 and 124;
- `DerivedDeRham.cohenFactorization`, `absoluteCompleteIntersection` and `ordinaryFlatnessFromCompleteFlatness` are at DerivedDeRhamCohomology #868, lines 366, 423 and 548;
- PerfectoidQuotientsPartII §§Q5.2, Q5.4, Q6.3–Q6.7, Q7.1, Q7.3 and Q10.1 are in the board package, lines 382–1395.

Other citations still resolve:
- LocalPurity names (main lines 40–42, 222);
- ModularCurves `ringKrullDim_adicCompletion` (line 1911);
- DeformationAndDerivedPatchingAlgebra `localCI_parafactorial` (#1034 line 1346).

### Declared gaps

- `plan.json` has the slugs `prismatic-dieudonne-perfectoid`, `ci-defect-additivity` and `regular-tower-tilt`, stated at README lines 734, 640 and 715.
- Each is still minimal; nothing changed in the cited suppliers.

### Ownership against open work

- **GroupSchemesOverABase (#1522, head 2e1e5e7).** Its Scope (README lines 41–48) owns the same objects as §§7.12a–7.12e, and its Downstream consumers (README line 1438) tell this roadmap to cite them. That name is on the project's dropped-names list: PRREVIEW~8 R01 made citing it P1, and the gate's `dropped` check refuses any mention. So owning §§7.12a–7.12e here is the project's policy, and the folder names it nowhere (`dropped=0`).
- **ReductiveGroups.** See previous R02.
- **Other new objects.** `roadmaps grep` found no other owner of `homPresheaf`, `smallEtaleSheaf`, `IsOfDimLEOne` or the statements of C19 Theorems 1.4 and 6.1.
- **Overlaps.** `overlaps.md` lists no open pull request that changes this roadmap and no dropped id.

### Adversarial table

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `etaleDepth_ge_virtualDimension` (§6.3), restriction form | LES both directions; `k⟦x,y⟧/(xy)`, `(ℤ/n)_R`, `i = 0`; field | `H^j_𝔪 = 0 (j < v)` ⟺ injective `i < v`, bijective `i+1 < v`; diagonal `ℤ/n → (ℤ/n)²` injective, not onto; `vdim = 0`, nothing claimed | correct | none |
| 2 | same, non-constant `G` | `μ_3` over `ℝ⟦x,y⟧`; `μ_3` over `ℚ⟦x,y⟧`; `μ_p` over `𝔽_p⟦x⟧` | `R^×/3 = 0`, `μ_3(R) = 1` (vacuous); `ℚ^×/ℚ^{×3} ∋ [2] ≠ 0 ↪ H¹(U_R)`; not étale, excluded (`H¹_ét = 0 ≠ H¹_fppf ∋ [1+x]`) | theorem correct, Check vacuous | R02 |
| 3 | `homPresheaf`, `smallEtaleSheaf` | trivial `G`; `(ℤ/n)_S`; `μ_3/ℝ` | zero sheaf; locally constant `V → ℤ/n`; sections `1` over `ℝ`, `ℤ/3` over `ℂ` (constant models give `1, 1` or `ℤ/3, ℤ/3`) | determines the sheaf | none |
| 4 | `IsTorus` | `𝔾_m` by affine opens; circle over `ℝ` via `Spec ℂ`; `μ_2/ℚ`; empty family; `Spec(k×k)` | `r = 1`; split over `ℂ`, not Zariski; degree 2 ≠ 1, not finite for `r ≥ 1`; excluded by surjectivity; `r = 1, 0` | discriminates | none |
| 5 | `IsOfDimLEOne` | `𝔽_q`; `k^sep`; `ℝ`; `ℚ_p`; `𝔽_p((t))`; pro-`p` Sylow field `k` of `𝔽_p((t))` | holds; holds; `H²(ℤ/2) = ℤ/2`; `H²(μ_ℓ) = ℤ/ℓ`; both clauses fail (`ℤ/ℓ`, `ℚ/ℤ`); first clause holds, `Br(k)(p) ≠ 0` | definition correct, Brauer clause unchecked | R01 |
| 6 | `…torus_puncturedSpectrum_subsingleton` (§8.3) | `ℤ_p⟦x⟧`, `𝔾_m`; `ℝ⟦x,y⟧`, norm-one `T`; `ℤ_p` (`dim 1`); `q = 0` | `Pic(U_R) = 0`, `Br(U_R) = Br(𝔽_p) = 0`; `H¹ = H¹(ℝ,T) = ℤ/2`, excluded by `IsOfDimLEOne ℝ` false; `H²(ℚ_p, 𝔾_m) = ℚ/ℤ`, excluded; `R^× ≠ 0`, not claimed | matches C19 1.4 | none |
| 7 | `etaleCohomology_torus_purity` (§8.6) | `U = ⊤`; `k⟦x,y⟧`, `U_R`, `𝔾_m`; `𝔸²_ℂ` minus axes; non-qc `U_R` of `k[x₁,x₂,…]_{(x)}` | identities; `R^× = Γ(U_R)^×`, `0 = Pic(U_R)`, `Br k = Br k`; axes' generic points have local dimension 1, excluded; `[QuasiCompact U.ι]` excludes | matches C19 6.1 | none |
| 8 | `etaleCohomology_gm_purity_regular` (§8.7) | `U = ⊤`; `𝔸²_ℂ` minus axes | identities; excluded (DF84) | matches C19 1.1 | none |
| 9 | `etaleCohomology_two_gm_puncturedSpectrum_subsingleton` (§8.1) | `k⟦x,y⟧`, `k = k^sep`; `k⟦t⟧`, `k` imperfect | `0`; `dim 1` excluded, `Br(k((t)))[p] ≠ 0` | matches C19 1.3 | none |
| 10 | §1.2 | `k⟦x⟧ → k⟦x,y⟧/(y²)`; `R → R^{sh}` | `1 = 1 + 0` (fibre `k[y]/y²`, vdim `1 − 1`); separable fibre, vdim `0` | matches (3.2.1.3) | none |
| 11 | §1.5 | DVR, `f = π`; `f = 0`; `k⟦x,y⟧`, `f = x`, `i = 2` | `0 → ℤ/ℓ` injective, not onto; identity; `0 → ℤ/ℓ(−1)` not onto | range sharp | none |
| 12 | §6.1 | `ℤ_p[x]`, `a = p`, `x`; `ℚ_p/ℤ_p` | `ℤ_p⟨x⟩/(x) = ℤ_p`; classical completion `0`, derived `ℤ_p[1]`, `ℤ_p → 0 → 0` not exact | bounded torsion needed | none |
| 13 | §7.12b | `ℤ × ℤ/4`; `μ_p/𝔽_p`; `ℤ → ℤ/2`; `2ℤ ⊂ ℤ` | smooth over `ℤ[1/2]`, `𝔽_3`, étale nowhere; `(t−1)^p`; closed immersion `μ_2 → 𝔾_m`, not flat, kernel trivial; squaring, kernel `μ_2`, étale over `S[1/2]` | consistent with EGA44 17.5.1 | none |
| 14 | §7.12a | `D_ℤ(ℤ/3)` fibres; `ℤ/4 ↠ ℤ/2`; `Spec(k×k)`, `t ↦ t^{±1}` | `ℚ × ℚ(ζ_3)`, `𝔽_2 × 𝔽_4`, `𝔽_3[t]/(t−1)³`; closed immersion `μ_2 → μ_4`; locally constant `±1`, not `D(φ)` | consistent | none |
| 15 | §7.12e | `𝔾_m × μ_3`; subgroups of `𝔾_m`; `V(2(t−1)) ⊂ μ_2` over `ℤ` | `G^tor = 𝔾_m`, `G[3] = μ_3²`; `μ_n` ↔ `ℤ/n`, `𝔾_m` ↔ `ℤ/0`; `Δ(2(t−1)) = 2((t−1)⊗t + 1⊗(t−1))`, `ε = 0`, `S` fixes it; fibre trivial over `ℚ`, all of `μ_2` over `𝔽_2` | (b) needs multiplicative type | none |
| 16 | §6.2 | regular `dim 2`, `μ_p`; `W(k)⟦x,y⟧/(p−xy)`; `α_p/𝔽_p⟦x,y⟧` | `H⁰_𝔪 = H¹_𝔪 = 0`; dimension 2 (`p − xy ∉ 𝔪²`, regular), `i < 2`; agrees with §4.1 | consistent | none |
| 17 | §6.4 | `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)` | `x·xy = y·xy = 0`, `z·xy = y²t = 0`, `t·xy = x²z = 0`, `xy ≠ 0` (monomials); `vdim = 4 − 3 = 1` | matches Remark 6.2.6 | none |
| 18 | §7.2 | `Rⁿ`; syzygy `N` over `k⟦x,y,z⟧`; `A_1`, `(x,y)` | `r = n`; reflexive rank 2, not free (`pd k = 3`); not regular | consistent with CS24 line 3686 | none |
| 19 | §7.5 | `k⟦x,y⟧`; DVR; `A_1`; node `xy − zw` | parafactorial; `Γ(U_R) = K ≠ R`; `Cl = ℤ/2`; `Pic(U_R) ≅ ℤ` | matches EGA44 21.13.8 | none |
| 20 | §8.5 | strictly henselian regular `dim 2`; `Z = V(x) ⊂ 𝔸²` | ⟺ `Pic(U_R) = 0 = H²(U_R, 𝔾_m)`; `H¹_Z = ℤ` | codimension 2 needed | none |
| 21 | §8.9 | Dedekind `X`; norm-one `T` on `ℙ¹_ℝ`; `X = Spec K` | unramified classes; generically trivial nonzero class (C19 (6.3.3)); no height-1 points, all of `H²(K, T)` | injectivity hypothesis needed | none |
| 22 | §8.18 | `uⁿ = x`, `vⁿ = y`, `uv = ζvu`; swap `u, v`; `n = 1` | `u v u⁻¹ = ζv`, crossed product `(L/K, σ, x)`, residue `χ(σ) = 1/n`, Kummer class of `y` ≠ 0; class inverted; `ℂ[x^{±1}, y^{±1}]`, trivial | sign pinned by Convention 8 | none |
| 23 | `virtualDimension`, `IsCompleteIntersection` | `k⟦x,y⟧/(y)`; `(x,y)²`; twisted cubic cone; valuation ring with `𝔪 = 𝔪²` | `2−1 = 1`; `2−3 = −1`; `4−3 = 1 < 2`; junk `0`, every theorem Noetherian | presentation-independent | none |
| 24 | `localPicard_torsion_eq_one`, `localPicard_subsingleton` | node; `A_1`; cubic cone | `Pic(U_R) = ℤ`, torsion-free; dimension 2 and not regular, excluded; dimension 2, excluded | matches CS24 7.2.1 | none |

## Not verifiable

- **SGA3 VIII–X** (uncertified; never request) back §§7.12a–7.12e, including the sampled 7.12b and 7.12e. I checked the mathematics in rows 13–15. The étale-local splitting behind `IsTorus` is also cited by C19 line 504 (SGA3 X 4.5).
- **Aus62 Theorem 1.3** (uncertified) backs `free_of_endomorphisms_iso_pi` (§7.2). I read it only through its use at CS24 lines 3684–3686, which apply it to every regular `X`. Its exact hypotheses could not be checked.
- **DF84 Remark 3** (§8.18) and **Avr77 Proposition 3.6** (§1.2; the declared gap `ci-defect-additivity`) are uncertified. I read them only through C19 lines 27–28 and CS24 lines 1332–1335.

## Source issues

- **Misprint** in CS24 at the proof of Theorem 6.2.7, p. 85: the source writes the second case of the presentation as `f` lying in the square of `(p, x_1, …, x_n)`; it should be `(p, x_1, …, x_d)`, the variables of the presentation; affects nothing.
