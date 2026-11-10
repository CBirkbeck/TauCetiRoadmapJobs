# Review of AdelicImagesAndModularCurves (pull request #1727 at 4f0c5ff)

**Verdict:** needs changes

## R01 (P2) — Serre's open image theorem is statable at the pins but absent, and the docstring's reason is false

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/Suggested.lean:41–45`, “the open image theorems of Layer 4 owned here … need, besides `ρ_E`, the geometric endomorphism ring of an elliptic curve (the non-CM hypothesis `GeometricEnd E = ℤ` of the elliptic-curves roadmap)”. The README targets affected are 4.3, 4.4 and 3.5.

Claim: the headline theorems of Layer 4 (surjectivity onto `GL₂(ℤ_ℓ)` for almost all `ℓ`, adelic openness) and Serre's index-two obstruction (3.5) have no carrier at the pin.

Witness:
- Tau Ceti at the pin has `WeierstrassCurve.GeometricEnd`, `WeierstrassCurve.HasGeometricCM` and `TauCeti.CMAction` (`AlgebraicGeometry/EllipticCurve/Isogeny/Hom/ComplexMultiplication.lean:94, 100, 143`), and `tateModuleGaloisRepresentation` (`…/TateModule/Galois.lean:80`).
- The three statements below elaborate on a scratch file, with only `sorry` warnings.
- NoncommutativeAndEquivariantIwasawa §4.0 and EllipticCurveModularityImaginaryQuadratic §5.1 state their inputs in Lean in the same way.

Repair:
- State the following in `Suggested.lean` (Layer 4, plus a Layer 3 entry for 3.5). Import `TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Galois` and `TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.ComplexMultiplication`, and add `open scoped WeierstrassCurve`. These are the tested shapes:

```lean
instance (ℓ : Nat.Primes) : Fact (ℓ : ℕ).Prime := ⟨ℓ.2⟩

theorem exists_surjective_tateModuleGaloisRepresentation (F : Type) [Field F] [NumberField F]
    [DecidableEq (AlgebraicClosure F)] (W : WeierstrassCurve F) [W.IsElliptic]
    (hW : ¬ W.HasGeometricCM) :
    ∃ N : ℕ, ∀ ℓ : Nat.Primes, N < (ℓ : ℕ) →
      Function.Surjective
        (W.tateModuleGaloisRepresentation (K := AlgebraicClosure F) (ℓ : ℕ)).asGroupHom := sorry

theorem finiteIndex_range_adelicGaloisRepresentation (F : Type) [Field F] [NumberField F]
    [DecidableEq (AlgebraicClosure F)] (W : WeierstrassCurve F) [W.IsElliptic]
    (hW : ¬ W.HasGeometricCM) :
    (MonoidHom.pi fun ℓ : Nat.Primes =>
      (W.tateModuleGaloisRepresentation (K := AlgebraicClosure F) (ℓ : ℕ)).asGroupHom).range.FiniteIndex :=
  sorry

theorem not_surjective_adelicGaloisRepresentation_rat [DecidableEq (AlgebraicClosure ℚ)]
    (W : WeierstrassCurve ℚ) [W.IsElliptic] :
    ¬ Function.Surjective (MonoidHom.pi fun ℓ : Nat.Primes =>
      (W.tateModuleGaloisRepresentation (K := AlgebraicClosure ℚ) (ℓ : ℕ)).asGroupHom) := sorry
```

- The second statement is Serre's Théorème 3′ (serre1972 line 1624). Finite index is equivalent to openness for the compact image (Mathlib `Subgroup.isOpen_of_isClosed_of_finiteIndex`).
- Correct the docstring. Then either state the adelic CM openness of 4.5 with Tau Ceti's `CMAction`, or name exactly which carrier it lacks.
- Name the new declarations at 3.5, 4.3 and 4.4.

## R02 (P2) — The push-forward of isolated points along a finite map has no owner

Location: `README.md:2050–2052`, “`CanonicalModelsAndGonality` Layer 7 supplies … `IsSporadic x` …, and their functoriality under finite maps”; `2075–2077`, “maps to an isolated `f(x)` (the sibling's functoriality theorem instantiated at modular covers)”.

Claim: CanonicalModelsAndGonality Layer 7 supplies the functoriality that the level-reduction bullet and the route of Bourdon–Ejder–Liu–Odumodu–Viray Theorem 1.1 use.

Witness: CanonicalModelsAndGonality §§7.1–7.6 (its README lines 1540–1701) state no such theorem, and its §1.6 functoriality concerns gonality only. Its lines 1684–1685 assign “the behaviour of isolation under the `j`-map” to this roadmap. The statement is belov2019 line 497 (Theorem 4.3).

Repair:
- Own it in 5.4 as a target, with this statement. Let `f : C → D` be a finite map of curves over a number field, and `x` a closed point with `deg x = deg f · deg f(x)`. If `x` is ℙ¹-isolated, so is `f(x)`; if `x` is AV-isolated, so is `f(x)`; if `x` is sporadic, so is `f(x)`. Locator: Bourdon–Ejder–Liu–Odumodu–Viray, Theorem 4.3, p. 12 (belov2019 lines 497–501).
- Build it on CanonicalModelsAndGonality §§7.1–7.3 and the divisor norm of its §1.6.
- Correct the first sentence of 5.4, and route the level-reduction bullet and Theorem 1.1 through the new target.
- Negative control: the rational cusp `∞` of `X₀(11)` is isolated (5.4's own Check), but its image in `X(1) ≅ ℙ¹` is not. There `deg x = 1 ≠ 12 = deg j · deg j(x)`, so the degree hypothesis is needed.

## R03 (P3) — Padding in `Suggested.lean`: `congruenceSubgroup_gamma0`

Location: `Suggested.lean:213–215`, `congruenceSubgroup (Gamma0Zhat N) = CongruenceSubgroup.Gamma0 N`.

Claim: this is an acceptance statement.

Witness: on a scratch copy, `ext γ; simp [congruenceSubgroup, Gamma0Zhat, CongruenceSubgroup.Gamma0_mem]` closes it. It is also README 0.4's “Bridge” Check (line 761).

Repair: delete it from `Suggested.lean`; README 0.4 keeps the statement. Also delete the backticked name at README line 752; otherwise the gate's `readme-ids-missing` check fails.

## R04 (P3) — Four unused Tau Ceti imports

Location: `Suggested.lean:6, 9, 11, 12`: `…ZHat.Component`, `…EllipticCurve.TateModule.Basic`, `…ModularForms.CongruenceSubgroups.Basic`, `…Matrix.SpecialLinearGroup.Basic`.

Claim: every `TauCeti.*` import is used.

Witness: with these four lines removed, `lake env lean` on a scratch copy reports only the 22 `sorry` warnings. Their declarations (`zHat.component`, `finrank_tateModule`, `Gamma_le_Gamma_of_dvd`, `map_intCast_zmod_surjective`) occur only in docstrings.

Repair: delete the four imports. If you add R01's statements, add the two modules they need.

## R05 (P3) — Locators, a link and an attribution

Each bullet gives the location, then the witness, then the repair.
- README 338–339 and 916 cite “MF Layer 10B” for `g = 1 + d/12 − ε₂/4 − ε₃/3 − ε∞/2`. The ModularForms README on main derives that formula in §10A (lines 1159–1161); its §10B (line 1173) is Čech cohomology of compact Riemann surfaces. Cite MF 10A for the formula, also in the table row at line 430.
- README 340, 2244 and 2264 cite “MF Layer 8G”. ModularForms has no such heading; its own table (line 345) maps “Layer 8G” to §8.2. Cite MF §8.2.
- README line 39 links `../ProfiniteArithmetic/README.md`, which does not exist on main. Use `../../Completed/ProfiniteArithmetic/README.md`, as line 318 already does.
- README lines 218–219, 353–354, 437 and 1732 attribute `CMAction`, `HasGeometricCM` and `GeometricEnd` to “EC Layers 1–2”. They are Tau Ceti declarations at the pin (see R01). List them under “From Tau Ceti” with their module; EllipticCurves may stay as the specification.

## R06 (P3) — Three proof-route steps cite the wrong fact or ask too much of a supplier

Location: `README.md:1787`, “(`SL₂(ℤ_ℓ)` is perfect for `ℓ ≥ 5`, 2.4)”, and line 1801, “`B`, which is perfect”; line 1849, “the open subgroup `(𝒪 ⊗ ẑ)ˣ ∩ ker ψ_f` of the unit ideles of `KF`”; lines 2421–2424, “the sextic (or quintic) model … class groups and units are determined by Minkowski's bound”.

Claim: these steps follow from the cited inputs.

Witness:
- 2.4 proves `[GL₂(ℤ_ℓ), GL₂(ℤ_ℓ)] = SL₂(ℤ_ℓ)`, not perfectness. At `ℓ = 3` the former holds while `SL₂(𝔽₃)^ab ≅ C₃`.
- `(𝒪 ⊗ ẑ)ˣ` lies in the ideles of `F`, not of `KF` (serre1972 lines 1717–1726).
- EffectiveDiophantineMethods §3.23 requires `deg f = 6` (its line 3871).

Repair:
- Step 1 of 4.4: cite 2.4's equality.
- Step 3 of 4.4: drop “which is perfect” and cite 2.2. Let `N` be open normal in `SL₂(ℤ_ℓ)`, `ℓ ≥ 5`, with simple quotient. Either `N` surjects mod `ℓ`, and then `N = SL₂(ℤ_ℓ)` by the lemma, or `N ⊇ Γ(ℓ)`. Either way the quotient is `PSL₂(𝔽_ℓ)`.
- 4.5: write “the open subgroup of unit ideles of `KF` on which the Grössencharacter is trivial (Serre's `U_m`)”.
- 6.4: pass to a sextic model by `x ↦ 1/(x − a)` with `a` rational and `f(a) ≠ 0`. Say how the unit groups are certified (for example, a regulator lower bound); Minkowski's bound settles only the class groups.

## R07 (P3) — Two statements claim more than their inputs give

Location: `README.md:2215–2216`, “`m_f := dim_ℂ S₂(Γ_{±H})[f] / [K_f : ℚ]` where `S₂(Γ_{±H})[f]` is the `f`-isotypic component”; line 1646, “whence the knowl's list `2, 3, …, 20, 21` of degrees `< 24` with primitive growth”.

Claim: the formula gives the multiplicity, and the list follows from the two cited theorems.

Witness:
- For `X₀(23)`, `J₀(23)` is simple with `K_f = ℚ(√5)` and `m_f = 1`, but the `f`-eigenspace has dimension `1`, so the formula gives `1/2`.
- González-Jiménez–Najman Theorem 7.2 (arXiv v6, p. 16) only excludes degrees whose least prime factor is `≥ 11`, and it shows no degree has growth.

Repair:
- Define `S₂(Γ_{±H})[f]` as the sum of the `f^σ`-eigenspaces over the Galois orbit, or drop the division.
- Say “the degrees `< 24` not excluded by these two results”. Whether primitive growth occurs in each of them is the knowl's data, not a target.

## R08 (P3) — 5.9's derived invariants have no discriminating Checks

Location: `README.md:2222–2225` (`IsSimple`, `IsSquarefree`, `newformLevel`, `conductor`); Checks at lines 2248–2253.

Claim: every definition has three discriminating Checks.

Witness: the three Checks test the cover kernel, the `dims` and analytic rank of `X₀(11)`, and Chen's isogeny. None separates `IsSquarefree`, `newformLevel` or `conductor` from a multiplicity-blind definition.

Repair: add two Checks.
- `X₀(22)` (`pslIndex 36`, `ν₂ = ν₃ = 0`, 4 cusps, genus 2) has `J ∼ (11.a2)²`, so `m_f = 2`. It is not squarefree and not simple, has `newformLevel = 11`, and has conductor `11² = 121`; a multiplicity-blind formula gives `11`.
- `X₀(23)` is simple with `newformLevel = 23` and conductor `23² = 529`; omitting `[K_f : ℚ]` gives `23`.

## R09 (P3) — The pull-request description omits the two supplier gaps

Location: the description, “Builds on the sibling drafts #1726 (CanonicalModelsAndGonality), #1708 (FiniteGroupInvariants), #1707 (HyperellipticCurves), #1725 (SatoTateGroups).”

Claim: the description lists what the roadmap rests on.

Witness: README 461–474 declare `gap:abelian-surface-open-image` (ArithmeticGaloisRepresentations Layer 7) and `gap:nebentypus-rank-zero` (EllipticCurveModularityPartII §6.0e). No `design/plan.json` exists for this roadmap, so nothing announces them, and `mazur_torsion`'s route rests on the second.

Repair: add a paragraph to the description naming both slugs, their suppliers and sections, and the two `needs` sentences. The worker can then carry them to the board's gap list, so that both suppliers are told.

## Verified sound

**The previous review's findings: 13 of 16 repaired, 3 partly.**

| Previous | Status | Passage at this head |
|---|---|---|
| R01 Mitchell list | repaired | 7.3 l.2696–2718, classes 1–6 with `GL₂(𝔽_ℓ).2`, `GU₂(𝔽_ℓ).2` “the invariant quadric, of the two kinds”; proof ingredients l.2722–2728 |
| R02 Layer 4 re-planned | repaired | l.140–145 consume NEI §4.0 and ECMIQ §5.1; 4.2 l.1725 “Consumed”; 4.3 step 1 l.1750 |
| R03 adelic Tate module | repaired | l.78–79 “ArithmeticGaloisRepresentations §6.1's for `A = E` (consumed)”; 3.3 l.1488 |
| R04 coset invariants | repaired | 1.1 l.785 “Consumed (NoncongruenceModularForms §§2.1–2.2, 2.5)”; 1.2 l.846–855; the two false sentences are gone |
| R05 `mazur_torsion` conditional | partly | gap l.469–474; docstring l.79–80; EI l.376; `X₀(27)` via `fermatLastTheoremThree` l.2432; gap not announced (R09) |
| R06 compound `needs` | partly | single sentence l.463–466; description still silent (R09) |
| R07 lifting route | repaired | 2.2 l.1052–1058, `x^ℓ = 1 + ℓ(1 + c·y₂₁)N` |
| R08 Serre-curve claim | repaired | false sentence deleted; converse l.1594–1596 |
| R09 tex | repaired | gate `tex=0` |
| R10 padding | repaired | the five declarations are gone; new padding is R03 |
| R11 names | repaired | all 40 declaration names occur backticked in the README |
| R12 citations | partly | FF `finite_ellipticIsogenyClass` R28.6.5, MC2 §16.3, §5.14, GQF §5.5 and links 318/321/394 fixed; line 39 not (R05) |
| R13 locators | repaired | l.1746 “§4.2, Théorème 2, p. 294”; l.2391 Mazur (8) p. 35 with Kubert; l.2022–2023 |
| R14 slips | repaired | l.617 `lcm`; l.667 `N ≥ 3`; l.2236 `w_{p²}`; l.2365–2368 |
| R15 Goursat step | repaired | 4.4 step 3, l.1797–1805 |
| R16 shape | repaired | l.511, l.2799 headings; Checks in 1.1, 1.2, 5.5, 6.2; census deleted; Mitchell named in docstring l.55–58 |

**Gate and dependency check.** I reran the gate at this head and it prints “OK”, every count `0`. The dependency command printed:

```text
depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder is empty. Downstream, ECMIQ (its README lines 44–52, 2376–2380) and NEI (line 4478) name this roadmap only as a consumer, so there is no cycle.

**Lean.**
- `lake env lean Suggested.lean` takes 4.4 s and gives 22 `sorry` warnings and nothing else.
- I put `#check @name` for all 40 declarations in one scratch file and compared each type with its README statement. `adelicTateModule` omits `[CharZero F] [IsSepClosed K]`; the carrier does not need them, and `finrank_adelicTateModule` carries both, so I changed nothing.
- `isogenyClassSize` uses Tau Ceti's `Isogeny` (`Isogeny/Basic.lean:139`), whose `mapsInfinity` field excludes constant maps, so the count is of nonzero isogenies.
- One-tactic probes:
  - `congruenceSubgroup_gamma0` closed (R03).
  - `isFullDet_Gamma0Zhat` (`simp`) did not close.
  - `isCongruenceSubgroup_congruenceSubgroup`, `red_ext` and `level_conj` (`exact?`) did not close.
  - `genus_eq_of_isTwist` (`simp`) did not close.
- The R01 probe statements elaborate.

**Headline theorems.**
- Stated:
  - the inverse-limit property (`red_ext`, `exists_red_eq`);
  - strong approximation and density;
  - Serre's lifting lemma in both forms;
  - the commutator subgroup;
  - twist and Gassmann invariance;
  - the rank of `T̂E`;
  - `mazur_torsion` with realisation;
  - Kenku's class sizes.
- Statable but absent: 4.3, 4.4 and 3.5 (R01).
- Correctly named as not statable: everything on `X_H` (the coarse curve), Mitchell's theorem, and the abelian-surface images (the genus-two Jacobian).

**Adversarial pass.** “C” marks a value I computed by enumeration on finite matrix groups (scripts in scratch).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.1 `card_GL2_zmod` | N = 1, 3, 5, 9, 74 | `N⁴∏(1−p⁻¹)(1−p⁻²)` against `φN(N/∏p)²∏(p²−1)`: 1, 48, 480, 3888, 10933056 = 36·74·1·3·1368 | holds |
| 0.2 `±H` lowers level | `{g ∈ Γ(2): g₁₁ ≡ 1 mod 4}` | `Γ(2)/Γ(4) ≅ M₂(𝔽₂)`; `−I ↦ A₁₁ = 1` odd; levels 4, 2 | holds |
| 0.2 `level(H⊓H')` | `Γ₀(4)⊓Γ₀(6)` | `Γ₀(12)`, 12 = lcm ≠ 24 | holds |
| 0.2 fine/coarse | `Γ₁(3)` | images 6, 12; index 8, 4 | holds |
| 0.3 Cartans | N = 15; 13; 2 | 64, 192; 336, 26208/336 = 78; 3 | holds |
| 0.3 exceptional | `G_{A₄}(5)`; `G_{S₄}(13)` | 48, index 10, det {1,4}, PSL-index 5; 13 ≡ −3 mod 8, 2184/24 = 91 | holds |
| 0.4 `pslIndex_eq_index_pm` | `Γ(3)`; `Γ₀(9)` | 12 ≠ 24 (no full det); 12 = 12 | hypothesis needed |
| 1.1 coset model (C) | `Γ₀(11)`, `Γ₀(9)`, `Γ₀(16)` | widths {1,11}; {1,1,1,9}; {1,1,1,1,4,16}; ν₂ = ν₃ = 0 | holds |
| 1.1 `Γ₀(N)` ν₂ at p = 2 | `Γ₀(2)`, `Γ₀(26)` | need `(−1/2) := 0`: 1, 2 (Kronecker `+1` gives 2, 4) | holds (NC's convention) |
| 1.2 genus | `Γ₀(13)`, `Γ₀(26)`, `Γ₁(11)` | 0; 1 + 3.5 − 0.5 − 2 = 2; 1, against 6 with the raw index | holds |
| 1.3 Galois action (C) | `Γ₁(11)`, `Γ₁(13)`, `X_arith(5)` | 5 rational of width 11 + orbit of 5 of width 1; 6 + 6; {1,1,2,4,4} | holds |
| 1.3 no full det (C) | `Γ(5)` | 12 `T`-orbits, 48 = 12·4 double cosets | holds |
| 1.5 covering degree | `Γ₁(11) ≤ Γ₀(11)`; `Γ(3) ≤ ⊤` | 10 → 5 = 60/12; 24 against 12 | holds |
| 2.1 `N(C_s(2^k))` (C) | k = 1, 2, 3 | 6, 32, 128 against 2, 8, 32 | holds |
| 2.2 lifting route (C) | ℓ = 3, 5, 7, 11, every lift | 0 mismatches in 27, 125, 343, 1331 lifts; c = 1, 10, 35, 165; `[[1,1],[−3,−2]]³ = I` mod 9 | holds |
| 2.2 `ℓ = 2` (C) | `SL₂(ℤ/8)`, `SL₂(ℤ/4)`, `GL₂(ℤ/8)` | 64/64 lift pairs generate 384; order-12 subgroup onto `SL₂(𝔽₂)`; 7 − 3 = 4 | holds |
| 2.3 entanglement | `S_{−3}`, `S_{−4}`, `Γ₀(2)×_{ℤ/2}Γ₀(3)` | 2; 1; level 6, index 24 ≠ ψ(6) = 12 | holds |
| 2.4 commutator | `[s,t]`, `[diag(3,1),T]` | `[[1,−1],[1,0]]` of order 3 mod 2; `[[1,2],[0,1]]`; ε(T) = −1 | holds |
| 2.4 `S_1` | invariants | pslIndex 2, ν₂ 0, ν₃ 2, one cusp of width 2, g = 0 | holds |
| 2.5 agreeable | `S_8`, `S_{37}`, `Γ₁(11)`, `Γ(3)` | yes; {37} vs ∅; closure `Γ₀(11)`, quotient order 10; ∩ Borels = {±I}, det 1 (zywina lines 130–132) | holds |
| 2.6 twists | `⊤`, `det⁻¹(ker mod 3)` | pslIndex 1, 1; genus 0, 0; det index 1, 2 | holds |
| 2.7 field degrees | `GL₂` at 5; `Γ₀(5)` | 6, 24, 480; 1, 4 | holds |
| 2.8 Gassmann | `Γ₁(3)` vs `±[[1,b],[0,1]]` | level 3, index 8 both; `−I` fixes 0 and 8 cosets | holds |
| 3.1 rank | char 0; `y² = x³+1` over `𝔽̄₅` | 2 per factor (`finrank_tateModule` needs `(ℓ : K) ≠ 0`); `T₅ = 0` | hypothesis needed |
| 3.4 criterion | K ⊇ quintic subfield of `ℚ(ζ₂₅)` | `χ₅(G_K) ⊆ μ₄(1+25ℤ₅)`, index 5 | holds |
| 3.5 obstruction | `37.a1` | serre1972 lines 2042–2067: Prop. 22; Δ = 37; image equal to `H` for 5.5.6 | holds; statable (R01) |
| 4.1 generation | ℓ = 5, b = c = 5 | `diag(1/26, 26)`, 26 ≡ 1 mod 25 | holds |
| 4.3 Théorème 2 | `K = ℚ(ζ₇)` | `χ̄₇` trivial ⇒ image ⊆ `SL₂(𝔽₇)` | determinant step needed; statable (R01) |
| 4.4 step 3 | ℓ' < ℓ₀ ≤ ℓ, ℓ ≥ 5 | ℓ ∤ ℓ'^a(ℓ'² − 1) since ℓ' + 1 < ℓ | holds |
| 4.4 “perfect” | ℓ = 3 | `[GL₂,GL₂] = SL₂(ℤ₃)` but `SL₂(𝔽₃)^ab = C₃` | citation (R06) |
| 4.5 CM | `y²=x³−x` over `ℚ(i,E[5])`; `121.b2` | image 1 against 16; `(−11/ℓ)` = +1, +1, −1, −1 at 3, 5, 7, 13 | holds |
| 5.1 degree | `X(5)` | 4·60 = 240 = 480/2 | holds |
| 5.3 `C_ns⁺(13)` | 13 discriminants | `(D/13) = −1` for exactly −7, −8, −11, −19, −28, −67, −163 | holds |
| 5.3 j-table | lmfdb_ec_cm lines 98–99 | 13 pairs equal to worked example 8 | holds |
| level 13 (C) | `C_s⁺(13)`, `C_ns⁺(13)` | (91, 7, 1, 7 cusps, {1,6}, g = 3); (78, 6, 0, 6, {6}, g = 3) | holds |
| 5.4 CM isolated | `2d ≤ 4(ℓ−1)` against `7(ℓ²−1)/1600` | holds iff ℓ ≥ 914 | holds for large ℓ |
| 5.4 level reduction | `X₀(11) → X(1)`, cusp `∞` | isolated → not isolated; 1 ≠ 12·1 | unowned (R02) |
| 5.8 bound | `X₀(11)` | 4g² = 4; {∞, 2, 3, 11} | holds |
| 5.9 `m_f` | `X₀(23)` | eigenspace 1, `[K_f:ℚ]` = 2 → 1/2 ≠ 1 | R07 |
| 6.4 chain | minimal excluded orders; genera (C) | {14,15,16,18,20,21,24,25,27,35,49}; `X_{±1,±7}(25)` (150,10,0,14) → 4, squares (60,0,0,12) → 0 | holds |
| 6.4 `X₀(27)` | `(3,4)` | 16 + 4 = 27 − 7; 36² = 1728 − 432; `u³ + v³ = (432 + Y²)/X³ = 1` | holds |
| 6.4 `mazur_torsion` | `ℤ/16`, `(ℤ/2)³` | orders 16 and 8 occur in the list, but neither group is one of the fifteen | Lean correct |
| 6.5 class sizes | tree products | {1,2,3,4,6,8}; 20, 22, 24, 26, 28, 30, 33, 35, 36, 45, 48 ∉ Kenku; 10-vertex tree ⇒ scalar mod 4, det 1 | holds |
| 6.6 `N ∣ adelicLevel` | ℓ^k, j < k | `ℓ^j(ℤ/ℓ^k)² ≅ (ℤ/ℓ^{k−j})²` not cyclic | holds |
| 7.1 `card_GSp4_zmod` | ℓ = 2, 3; `diag(1,1,u,u)` | 720, 103680; `gJgᵀ = uJ` | holds |
| 7.3 Mitchell | dieulefait lines 74–85; ℓ = 5 | eight types; 28800, 31200, 960, 1440; indices 325, 300, 9750, 6500 | holds |

**Source sample.** Each row gives the statement, the hypotheses and the locator.

| Target | Opened | Result |
|---|---|---|
| 0.2 | MC2 §3.8 (its README l.1111–1146); Mathlib `adjoinNegOne`, `relIndex_adjoinNegOne_eq_two` | agrees; MC2's profinite “level” is prose, and its interface is finite-level |
| 1.2 | NC §2.3 (main l.638–672); Tau Ceti `PermutationTriple.genus`, `eulerChar_le_two`, `two_sub_two_mul_genus`, `genus_blockQuotient_le` | agrees |
| 1.4 | MF 10A (main l.1150–1171), FO Layers 3–5, NC `cuspCount_eq_card_cuspOrbits` | agrees; 10B misattributed (R05) |
| 1.5 | no external source; computed above | holds |
| 2.1 | AGR §4.2 (its l.3171–3206): `[N(C):C] = 2` except split q = 2 | agrees |
| 2.3 | no external source; computed above | holds |
| 2.4 | serre1972 §5.5, Prop. 22, pp. 310–311 (lines 2042–2063) | agrees for the obstruction; Zywina 2010 not readable |
| 3.6 | González-Jiménez–Najman Thm 7.2, arXiv:1609.02515v6 p. 16 | supports the necessary condition only (R07) |
| 4.2 | NEI §4.0 (its l.1917–1924); serre1972 Théorème 3, p. 299 (lines 1612–1622) | agrees |
| 4.4 | serre1972 §4.4, Théorème 3, p. 299 (line 1618), citing MG p. IV-19 (line 1622) | agrees |
| 4.5 | serre1972 §4.5, Théorème 5 and corollary, p. 302 (lines 1709–1727); lozano2018 Thms 1.2(4), 1.4 (lines 113–167); SV §5.10 | agrees; wording R06 |
| 5.3 | lmfdb_ec_cm lines 94–99; IQ H3 | agrees |
| 5.4 | belov2019 Thm 1.1 (lines 51–55), Thm 4.3 (line 497); CMG §§7.3–7.6, 8.6 | Thm 1.1 agrees; Thm 4.3 unowned (R02) |
| 5.7 | MC2 §5.12 (l.1872), §5.14 (l.1937, `N ≥ 3`) | agrees |
| 6.6 | EM2 §6.0f (its l.143, 815): `B(d,H) = 10⁷d²(max{H,985}+4 log d)²` | agrees |
| also | zywina2022 §1.4; rszb2022 Remark 2.3.2 (lines 345–350); dokchitser2012 lines 14–27; elkies2006 abstract; mazur1977 Theorem (8) (lines 112–116); serre1986 Théorème 3, p. 97 (lines 61–65); dieulefait2002 §3.5, p. 11 (line 330) | agree |

**Pinned declarations opened.**
- Mathlib (20):
  - `Matrix.card_GL_field` and `card_SL_field` (`LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:122, 129`)
  - `Units.isClosedEmbedding_embedProduct` (`Topology/Algebra/Group/Units.lean:116`)
  - `Subgroup.adjoinNegOne` and `relIndex_adjoinNegOne_eq_two` (`NumberTheory/ModularForms/ArithmeticSubgroups.lean:220, 250`)
  - `IsCongruenceSubgroup`, `Gamma0_mem` and `instFiniteIndexGamma` (`NumberTheory/ModularForms/CongruenceSubgroups.lean:164, 91, 75`)
  - `IsCusp`, `CuspOrbits` and `widthInfty` (`Cusps.lean:58, 167, 329`)
  - `symplecticGroup` (`LinearAlgebra/SymplecticGroup.lean:102`)
  - `rank_two_simple'` (`LinearAlgebra/Projectivization/PSL/PSL2.lean:124`)
  - `SL2.commutator_eq_top` (`LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`)
  - `fermatLastTheoremThree` (`NumberTheory/FLT/Three.lean:752`)
  - `isOpen_of_isClosed_of_finiteIndex` (`Topology/Algebra/Group/ClosedSubgroup.lean:108`)
  - `quotient_finite_of_isOpen` (`Topology/Algebra/OpenSubgroup.lean:312`)
  - `ZMod.unitsMap` (`Data/ZMod/Units.lean:29`)
  - `ZMod.chineseRemainder` (`Data/ZMod/Basic.lean:889`)
  - `card_orbit_mul_card_stabilizer_eq_card_group` (`GroupTheory/GroupAction/Quotient.lean:184`)
- Tau Ceti (24):
  - `natCard_GL_fin_two` (`LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:45`), over fields only, so `card_GL2_zmod` is not a duplicate
  - `Isogeny` (`…/Isogeny/Basic.lean:139`) and `Isogeny.Hom` (`…/Isogeny/Hom/Basic.lean:106`)
  - `GeometricEnd`, `HasGeometricCM` and `CMAction` (`…/Isogeny/Hom/ComplexMultiplication.lean:94, 100, 143`)
  - `tateModuleGaloisRepresentation` (`…/TateModule/Galois.lean:80`)
  - `nonempty_linearEquiv_tateModule` and `finrank_tateModule` (`…/TateModule/Basic.lean:73, 94`)
  - `det_tateModuleGaloisRepresentation` (`…/TateModule/Determinant.lean:52`)
  - `torsionGaloisAction` (`…/Affine/Point/Galois.lean:77`)
  - `PermutationTriple.genus`, `IsConnected.eulerChar_le_two` and `IsConnected.two_sub_two_mul_genus` (`Combinatorics/PermutationTriple/EulerCharacteristic.lean:169, 149, 208`)
  - `genus_blockQuotient_le` (`BlockQuotient.lean:570`)
  - `Gamma_le_Gamma_of_dvd`, `neg_one_mem_Gamma0`, `withCenter_le_Gamma0`, `Gamma0_prime_index` and `Gamma0_prime_power_index` (`NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean:177, 540, 549, 669, 763`)
  - `map_intCast_zmod_surjective` (`LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean:532`)
  - `Subgroup.AlmostConjugate` and its fixed-point criterion (`GroupTheory/AlmostConjugate.lean:92, 231`)
  - all `zHat.*` names of the supplier contract (`…/ZHat/ZMod.lean`, `Units.lean`, `Decomposition.lean`)
  - `ClosedSubgroupConjClasses` (`Topology/Algebra/Group/ContinuousAut/ClosedSubgroup.lean`)
  - `profiniteIndex` (`Profinite/Index/Basic.lean`)

**Cross-roadmap citations resolved.** These were read on main, or at the open head of each supplier's pull request.
- NC §§2.1–2.3 and 2.5 (main l.562, 608, 638, 690); its l.129–135 and 1860 make it the supplier and this roadmap the consumer.
- MF 10A, 10B, 10C, Layer 4, Layer 7 and §8.2.
- FO Layers 3–5; MC Convention 5, 8D (l.2793), Layer 9.
- EC CM vocabulary (l.508–514, 655); GQF Layer 5, §§5.1, 5.5 (l.544–665); SSF §5.11 (l.7273); IQ H3; CFT Layer 11 (l.1683).
- AGR §§4.2–4.5, 6.1 (adelic action, l.4051), 6.4 (l.4333), 7.3 (l.4614), 7.5, 7.9–7.11, and `GL2Subgroup.dickson_projectiveImage` (l.3289).
- MC2 §§3.8, 3.9, 3.12, 5.8–5.17, 6.1, 6.3, 8.3, 9.5–9.8, 13.1, 16.2, 16.3, 16.6, with all 20 names of the contract.
- NEI §4.0; ECMIQ §5.1; FF R28.6.1, R28.6.5, R28.6.6.
- EI §8.8 (l.1303); EM2 §§5.0a, 5.0b (`cyclic_isogeny_degrees`, l.621), 6.0b, 6.0d, 6.0e, 6.0f.
- ED §§3.10, 3.11, 3.20, 3.23; SV §5.10; CMG §2.5, Layers 7–8, §9.3; FiniteGroupInvariants 7.1, 7.3.
- Consumers: ModularIwasawaMainConjectures §3.6 (l.1286) and KatoEulerSystems 4.7 (l.1918).

**Ownership against open pull requests.** I searched the heads of all 458 open roadmap pull requests and main by object, with these terms:
- `GL₂(Ẑ)` carriers (`zHat`, `GL2Zhat`);
- Mazur's fifteen groups, Kenku's class sizes, Serre curves;
- agreeable closures, entanglement index, isogeny matrix and graph;
- Mitchell's classification;
- the abelian-surface large-image theorem and nebentypus rank zero.

The only second owner found is R02's handover between this roadmap and CanonicalModelsAndGonality. Both gaps ask for results no earlier roadmap provides (AGR §7.11 assumes big images; KatoEulerSystems is later in the order). No declaration shares a fully qualified name with another roadmap.

## Not verifiable

- Serre, *Abelian ℓ-adic representations* (IV-19, IV-23 Lemma 3): a book, not reachable legally. The lemma is corroborated by dokchitser2012 lines 14–16 and elkies2006 abstract.
- Mitchell 1914 and Bray–Holt–Roney-Dougal 2013 (the latter paywalled); Kenku 1982; Mazur 1978; Lang–Trotter 1976; Zywina 2010; Chen 1998; de Smit–Edixhoven; Baran 2014; BDMTV 2019; Banwait–Cremona; Clark–Cook–Stankewicz; Abramovich 1996; Prasad–Rajan; Khare–Wintenberger; Serre 1987; Sutherland 2016 and 2021; Jones 2010; the Experiment. Math. Lemma 2.11. None was fetched; I edited no manifest. `kubert1976` is waived.
- The LMFDB curve labels and torsion data of worked examples 5–9, and the column `cm_ramp` (3.4): not checked against the database.

## Source issues

- **Misprint** in serre1986 at §2.3, Théorème 3, printed p. 97 (line 62): the source says hypothesis (i) is that the ring of K-endomorphisms is ℤ, with no standing convention that endomorphisms are defined over K (lines 13–25); it should say geometric endomorphisms, since real multiplication defined over a quadratic extension keeps the image of infinite index in GSp; affects a stated result.
