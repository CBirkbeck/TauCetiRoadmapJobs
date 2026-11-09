# Review of ClassFieldTheory (pull request #617 at e2fb851)

**Verdict:** needs changes

Independent AI review (Claude Opus 5.5) of `TauCetiRoadmap/ClassFieldTheory/README.md` (1094 lines) and `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` (713 lines, 69 declarations), against the pins of `lake-manifest.json` (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`, unchanged since the previous review). This is a full review. There are five findings, all P3. The gate still fails on `outside-folder` (R01), so the folder cannot be accepted. The two Layer 5 targets, including the generalised comparison of valuations, survived the adversarial pass, and so did every Check the head changed.

## R01 (P3) — Gate `outside-folder`: five files under `Completed/`

Previous review R01, not repaired.

**Location:** `Completed/LocalFieldsRamification/COMPLETION.md`, `README.md`, `Suggested.lean`; `Completed/LocalGaloisGroups/README.md`, `Suggested.lean`.

**Claim:** The brief names three folders as this pull request's own: ClassFieldTheory, IntegralLattices and QuadraticFormInvariants. These five files lie outside them, so the scoped gate fails.

Two of the LocalGaloisGroups hunks are forced by this folder, so they cannot simply be dropped. `Completed/LocalGaloisGroups/Suggested.lean:324–326` and `:485` follow the signatures of `h2MuEquivZMod_mixed` (data, no longer `Nonempty`) and `h2FpEquivZMod_of_mu` (`(T) (e : muNRep p F ≅ T)`).

That file imports this module and is edited here, yet the targeted build (`ClassFieldTheory`, `GlobalQuadraticForms`) does not elaborate it.

**Witness:** The rerun gate gives `outside-folder=10 … FAIL`, every other count 0. Five paths are these `Completed/` files; five belong to the pull request's own folders. The open-pull-request index already lists LocalFieldsRamification and LocalGaloisGroups as #617's.

**Repair:** Either of the following, and in both cases add `Completed.LocalGaloisGroups.Suggested` to the targeted build:
- Register `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as folders of this pull request, each with its own review.
- Move the LocalFieldsRamification rewrite to a pull request of its own, and keep here only the two forced LocalGaloisGroups hunks, with that folder registered.

## R02 (P3) — Layer 13: both routes need a step that is not at the pin and is not named

**Location:**
- README:821–826: "Route: the local formula at each prime and the character dictionary between local and global conductors. *Needs:* …`finsum_artinConductorExponent_eq_discriminantExponent` …, `TauCeti.relDiscr`, …`abelianConductor`, …`characterConductorExp`, …`conductorExponent_localClassField_le_iff`."
- README:811–815: "translated to ideals through `hilbertClassArtinEquiv` for `K` and for `H`".

**Claim:** Both *Needs:* lines read as if the pinned declarations they list were enough. Each route, however, uses a step that is not a target here, not a supplier section and not a pinned declaration.

- **The conductor–discriminant formula.** Passing from local to global conductors needs this fact: for finite abelian `M/K`, a finite place `v` and a place `w` above it, the exponent of `v` in `(abelianConductor K M).finitePart` equals the conductor exponent of `M_w/K_v`. The pin has only `≥`.
  The line also omits two pinned inputs the route uses:
  - `TauCeti.multiplicity_relDiscr` (`TauCeti/RingTheory/DedekindDomain/Discriminant/Valuation.lean:52`), which localizes the discriminant;
  - `TauCeti.ClassFieldTheory.conductorExponent_fixedField_ker` (`…/Local/Conductor/UpperNumbering.lean:130`), the local dictionary between the Artin conductor and the conductor of class field theory.
- **The principal ideal theorem.** Getting from the class-formation form to ideals needs Artin's square: extending ideals, `Cl(K) → Cl(H)`, corresponds under the two Artin isomorphisms to the transfer `Gal(H'/K)^ab → Gal(H'/H)^ab`. milne-cft lines 7271–7302 (V §3, p. 162) state this square without proof and attribute it to Artin.

**Witness:** `IsAdmissibleModulus.conductorExponent_le_exponent` (`TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Ramification.lean:116`) bounds the local conductor by the exponent of any admissible modulus, in one direction only. No declaration under `TauCeti/NumberTheory/ClassFieldTheory/` relates `Ideal.map` to idele classes.

**Repair:**
- **Conductor–discriminant (README:821–826).** Add three declarations to *Needs:*: `TauCeti.multiplicity_relDiscr`, `TauCeti.ClassFieldTheory.conductorExponent_fixedField_ker` and `TauCeti.ClassFieldTheory.IsAdmissibleModulus.conductorExponent_le_exponent`.
  Then state the localization of the conductor as a step this target proves, with its route for the missing inequality:
  1. Take the modulus whose exponents are the local conductor exponents and which carries the ramified real places.
  2. A congruence idele for that modulus is a local norm at every place: by the local `conductorExponent_le_iff` at the places in its support, as a unit of an unramified extension (`conductorExponent_eq_zero_iff`) at the other finite places, and trivially at the infinite places.
  3. So it is an idele norm (`TauCeti.GlobalNumberFields.mem_range_ideleNormMap_iff`), and the modulus is admissible.
- **Principal ideal theorem (README:811–815).** State the square as a step of `isPrincipal_map_hilbertClassField`, citing milne-cft V §3, p. 162. Add three declarations to its *Needs:*: `TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundInclusion`, `TauCeti.ClassFieldTheory.globalArtinMap_ideal` and `TauCeti.ClassFieldTheory.hilbertClassArtinEquiv_mk`.

The added step checks on `ℚ(ζ₅)/ℚ`. At `5` the local conductor exponent of `ℚ₅(ζ₅)/ℚ₅` is `1` (tame, totally ramified), which is the exponent of `5` in the conductor `5·∞`, and the formula gives `125`.

## R03 (P3) — The Hilbert-class-field splitting criterion follows in ten lines; by §1's rule it is a Check

**Location:**
- README:39–40: "and the splitting criterion for the Hilbert class field `ncard_primesOver_hilbertClassField_eq_finrank_iff`";
- README:827–845 and 18–19;
- `Suggested.lean:44–46` and `:665–672`.

**Claim:** README:42–45 makes anything that follows in a few lines from Tau Ceti's theorems a Check rather than a target, and moved the ray-class criterion on that ground. The Hilbert criterion is that same criterion at the modulus `1`, followed by a four-step generator dictionary. Its proof is ten lines, so by the roadmap's own rule it is not an open target.

**Witness:** The scratch proof below elaborates at the pins with no error and no warning. It uses three pinned ray-class declarations, `idealClass_eq_one_iff` and `isCongrOne_one`, plus Mathlib's `IsFractionRing.coeSubmodule_isPrincipal` and `FractionalIdeal.isPrincipal_iff`.

**Repair:**
1. Delete the theorem from `Suggested.lean`, from §1 item 2, from the Summary (README:18–19) and from the module docstring (`Suggested.lean:44–46`).
2. Restate it as a Layer 13 Check next to the ray-class criterion (README:856–870). Name the declarations above, and keep the `ℚ(√-5)` values:
   - `𝔭₂` and `𝔭₃` each have one prime above them in `ℚ(√-5, i)`;
   - `(3 + 2√-5)` has two.

Layer 13 then has two open targets. The proof was checked on the statement exactly as `Suggested.lean:668–672` writes it:

```lean
example (K : Type) [Field K] [NumberField K] (v : HeightOneSpectrum (𝓞 K)) :
    (v.asIdeal.primesOver (𝓞 (TauCeti.ClassFieldTheory.hilbertClassField K))).ncard =
        Module.finrank K (TauCeti.ClassFieldTheory.hilbertClassField K) ↔
      v.asIdeal.IsPrincipal := by
  have hI : v.asIdeal ∈ integralIdealsPrimeTo (Modulus.one K) := by
    simp [v.ne_bot]
  have : ((⟨v.asIdeal, hI⟩ : integralIdealsPrimeTo (Modulus.one K)) : Ideal (𝓞 K)).IsMaximal :=
    v.isMaximal
  rw [ncard_primesOver_eq_finrank_iff_rayClassArtinMap_idealClass_eq_one
      (isAdmissibleModulus_rayClassField _) ⟨v.asIdeal, hI⟩, ← rayClassArtinEquiv_apply,
    MulEquiv.map_eq_one_iff, idealClass_eq_one_iff]
  simp only [isCongrOne_one, true_and]
  rw [← IsFractionRing.coeSubmodule_isPrincipal (𝓞 K) K,
    ← FractionalIdeal.coe_coeIdeal (S := nonZeroDivisors (𝓞 K)), FractionalIdeal.isPrincipal_iff]
  refine ⟨fun ⟨x, hx⟩ ↦ ⟨x, hx⟩, fun ⟨x, hx⟩ ↦ ⟨Units.mk0 x ?_, hx⟩⟩
  rintro rfl
  simp [v.ne_bot] at hx
```

The proof runs with `open NumberField IsDedekindDomain TauCeti.GlobalNumberFields TauCeti.ClassFieldTheory` and the two imports `…ClassFields.RayClassField` and `…Global.AdmissibleModulus.Reciprocity`.

## R04 (P3) — The consumer list names QuadraticFormInvariants, which no longer imports this file; the re-export catalogue remains

Previous review R02, partly repaired: §6 now describes the file honestly, and QuadraticFormInvariants moved to Tau Ceti names.

**Location:**
- README:94–95: "`LocalGaloisGroups`, `QuadraticFormInvariants` and `GlobalQuadraticForms` import `Suggested.lean` and cite the following names as this roadmap's."
- `Suggested.lean:56–61`, which makes the same claim;
- README:1017–1022.

**Claim:**
- **The consumer list is false.** At this head, `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` imports only Mathlib and Tau Ceti and uses `TauCeti.ClassFieldTheory.localSymbol` directly (line 171). Its README §3 (lines 316–326) cites Tau Ceti names only.
- **The catalogue remains.** 61 of the 69 declarations are re-exports: 25 `abbrev`, 8 `def`, 3 `instance`, and 25 theorems each closed by one Tau Ceti theorem (after unfolding a local definition, where there is one). That is the API catalogue the planning principles exclude from `Suggested.lean`.
- **Four names now have no consumer.** `muNRepCoeffDictionary`, `muNRepCoeffDictionary_continuous`, `muNRepCoeffDictionary_equivariant` and `kummerClass_eq_kummerCocycleClass` were used only by QuadraticFormInvariants. No roadmap at this head uses them; the only remaining uses are in other open pull requests' older copies of QuadraticFormInvariants (#1187, #1411).

**Witness:** QuadraticFormInvariants' `Suggested.lean` lines 1–17 import `Mathlib` and sixteen `TauCeti.*` modules. Of the files in this worktree, only `Completed/LocalGaloisGroups/Suggested.lean:11` and `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:4` import `TauCetiRoadmap.ClassFieldTheory.Suggested`.

**Repair:**
- **Preferred.** Delete the re-exports and move the uses in `Completed/LocalGaloisGroups/Suggested.lean`, which this pull request already edits, to the Tau Ceti names given in each docstring. GlobalQuadraticForms needs no change if #1200 merges first: its head `40494aa` imports no roadmap module. State that order. §1's table then lists Tau Ceti names.
- **At least.**
  - Drop `QuadraticFormInvariants` from README:94 and `Suggested.lean:56–57`.
  - Delete the four names that have no consumer, and their entries in the §1 table.

The repair is safe on the refuting instance: QuadraticFormInvariants already builds without the import, since GlobalQuadraticForms imports it and the targeted build passed.

## R05 (P3) — No stated order with #1215 and #1411, which revise this roadmap differently

Previous review R05, not repaired.

**Location:** The description's merge-order paragraph, which names only #1410.

**Claim:** Two other open pull requests revise this roadmap. Their heads conflict with this one in `TauCetiRoadmap/ClassFieldTheory/README.md` and `Suggested.lean`, and they state the same targets under other names and scopes. Whichever merges second has to be rebased and reconciled.

None of the three heads says in which order. Nor does this README say why it leaves out unit-filtration reciprocity, which both of the other heads own as Layer 7 targets. The pin has only the conductor form, `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` (`…/Local/Conductor/UpperNumbering.lean:64`).

**Witness:**
- #1411 (head `303ce50`): `Suggested.lean:512` has `algebraMap_vle_algebraMap_iff_of_finite_padic`, the comparison over `ℚ_p` only; `:701` and `:750` have the unit-filtration targets.
- #1215 (head `bac57fe`): `Suggested.lean:95` has `normResidue_map_unitFiltration`, and `:151` has `count_relDiscr_eq_finsum_abelianConductor_exponent`.

**Repair:**
1. State in the description which of #617, #1215 and #1411 rebases on which.
2. In that order, keep one name and one scope for the comparison: this head's `valuativeExtension_of_finite` is the general one.
3. Keep one form of the conductor–discriminant formula.
4. Either adopt the unit-filtration targets, or list them under *Explicitly outside this roadmap*, with the owner named.

## Verified sound

**Previous review (`81e13ac`), finding by finding.**

| Finding | Status at `e2fb851` |
|---|---|
| R01, outside-folder | not repaired (R01 here) |
| R02, catalogue | partly repaired: §6 no longer contradicts the file (README:1017–1022), and QuadraticFormInvariants uses Tau Ceti names; the catalogue and a false consumer claim remain (R04 here) |
| R03, ray-class criterion | repaired: moved to the Layer 13 Examples (README:856–870), removed from `Suggested.lean` and §1 |
| R04, Layer 5 locators | repaired: Jahnke–Koenigsmann Thm 2.1, p. 3 at README:505–507 and in §8; Engler–Prestel recorded as uncertified; "has not been verified" and "qualified in §8" gone; Milne VII §§4–5 and VIII Thm 4.2 attached to their claims (README:708–709, 1066–1069); "The open targets are" in both files |
| R05, merge order | not repaired (R05 here) |
| R06, ℤ/2 values | repaired: README:901–906 give `0, 1, 0, 1` with Brauer invariants `0, 1/2, 0, 1/2` |
| R07, discreteness route | repaired, and the statement generalized to every pair of nonarchimedean local fields (README:521–554, `Suggested.lean:385`) |

No repair report marks any finding as not actionable.

**Gate and dependency check.** The rerun gate reproduces the worker's result: every count is 0 except `outside-folder` (R01). The dependency check (`--movable`) prints `depcheck: 238 roadmaps, 2319 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The suppliers are Mathlib, Tau Ceti and `GlobalNumberFields`; the last is Completed and on main.

**Elaboration, binders and padding.**
- `lake env lean` on `Suggested.lean` exits 0 in 7 s. The only warnings are five `sorry` warnings, at lines 368, 385, 661, 668 and 679.
- The imports are `import Mathlib` plus 25 `TauCeti.*` modules. There is no `set_option`, no sorry'd data and no roadmap import.
- `#check @` on all 68 public declarations, in one scratch file, gives 0 errors. Each elaborated type matches its README statement:
  - `valuativeExtension_of_finite` carries `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` for both `K` and `F`, together with `[Algebra K F] [Module.Finite K F]`;
  - `isEquiv_of_henselian` has `K : Type*` and both `[HenselianLocalRing vᵢ.valuationSubring]`;
  - Layer 13 has `NumberField K`, and the conductor–discriminant formula `[IsAbelianGalois K L]`.

  No binder is lost, and nothing changed.
- The one-tactic probe (`first | infer_instance | rfl | decide | simp | aesop | exact?`) closes none of the five targets. A ten-line proof closes one of them (R03).

**Adversarial table** (the open targets, the three theorems closed from the comparison, and every Check this head changed):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `isEquiv_of_henselian` | `ℚ` with `v₂`, `v₃` | `X²−X+2 ≡ X(X+1) mod 2`, disc `−7` not a square; `X²−7 ≡ (X−1)(X+1) mod 3`, `√7 ∉ ℚ` | neither ring is henselian, so the hypothesis is needed; Check correct |
| same | `ℚ̄` with extensions of `v₂`, `v₃` | henselian, value group `ℚ`, residue characteristics `2 ≠ 3` | `¬IsSepClosed` needed; Check correct |
| same | `𝔽_q` | only the trivial valuation, so `RankOne` is uninhabited | vacuously true |
| `valuativeExtension_of_finite`, unit step | `ℚ₂`, `u = −3`, `ℓ = 3`; `ℚ₃`, `u = 2`, `ℓ = 2` | `q−1 = 1`, `−3 ∈ 1+4ℤ₂` is a cube for every `3^k`; `2² = 4 ≡ 1 mod 3`, derivative `2^k` a unit | `w(u) = 0` as the route says |
| same, `ℓ = p` | `ℚ₂`, `u = 3`, `ℓ = 2` | `3 ≢ 1 mod 8`, so `X²−3` has no root in `ℤ₂` | `ℓ ≠ p` needed; Check correct |
| same, ramified | `ℚ₂(i)/ℚ₂`; `ℚ₃(√3)/ℚ₃` | `w(2) = 2`, `v(2) = 1`; `w(3) = 2` | `2 <ᵥ 1`, `3 <ᵥ 1` on both sides: a relation, not a normalization |
| same, inseparable | `t ↦ t^p` on `𝔽_p((t))` | degree `p`, `w(t^p) = p > 0` | separability not needed; Check correct |
| same, trivial relation on `F` | `1 ≤ᵥ ϖ` | holds in `F`, fails in `K` | excluded by `ValuativeRel.IsNontrivial`, part of `IsNonarchimedeanLocalField` (Mathlib `NumberTheory/LocalField/Basic.lean:46–50`) |
| same, minimal-polynomial step | `w ≡ 0` on `Kˣ`, `α ∈ Fˣ` | `w(α)<0`: `n·w(α) < i·w(α)` for `i < n`; `w(α)>0`: `w(c₀) = 0`, the rest `> 0` | contradiction either way, so `w(ϖ) > 0` |
| `eulerCharacteristic_mixed` | `ℚ_p`, `ℤ/p`, `p` odd; `ℚ₂`, `ℤ/2`; `ℚ_p`, `ℤ/ℓ`, `ℓ ∤ p(p−1)` | `p² = p·1·p`; `8 = 2·2·2`; `ℓ = ℓ·1·1` | true |
| `eulerCharacteristic_finrank_fp` | `ℚ₂`, `𝔽₂`; `ℚ₂(i)`, `𝔽₂`; `ℚ₃`, `𝔽₃` | `3 = 1+1+1`; `4 = 1+1+2` (`#F×/F×² = 16`); `2 = 1+0+1` (`#ℚ₃×/ℚ₃×³ = 9`) | true |
| `cyclotomicCharacter_artinMap` | `ℚ₂`, `u = −3`, on `μ₁₆`; `ℚ₂(i)`, `u = i`; `u = 1+i` | `13⁻¹ ≡ 5 mod 16` (`13` without the inverse); `N(i) = 1`; `|1+i| = 2^{−1/2}` | the inverse is required; non-units are excluded by `hu` |
| `isPrincipal_map_hilbertClassField` | `ℚ(√−5)`, `I = 𝔭₂`; `I = ⊥`; `K = ℚ` | `(1+i)² = 2i`, `𝔭₂² = (2)`, so `𝔭₂𝒪_H = (1+i)`; `⊥ ↦ ⊥`; `H = ℚ` | true |
| `ncard_primesOver_hilbertClassField_eq_finrank_iff` | `ℚ(√−5)`: `𝔭₂`, `𝔭₃`, `(3+2√−5)` | `3 ≠ a²+5b²`, so `𝔭₃` is not principal and has ncard `1 ≠ 2`; `29 = 3²+5·2²`, `(−5/29) = 1`, ncard `2` | the iff holds both ways; closes in ten lines (R03) |
| `relDiscr_eq_finprod_abelianConductor` | `ℚ(ζ₅)`; `ℚ(ζ₈)`; `ℚ(√−3)`; the cubic subfield of `ℚ(ζ₇)`; `L = K` | `1·5·5² = 125`; `1·4·8·8 = 256` (`V₄` excluded); `1·3`; `7^{φ(3)} = 49`; `⊤ = ⊤` (`relDiscr_self`, `abelianConductor_self`) | true |
| `kummerClass` Check (new) | `κ(−7)` over `ℚ₂` | `−7 ≡ 1 mod 8`, a square in `ℚ₂`, not in `ℚ` | correct and discriminating |
| `kummerCupPairing` Check (new) | `ℚ₇`, `n = 3` | `7 ≡ 1 mod 3`; `(ζ²)² = ζ⁴ = ζ`, so `log_{ζ²}ζ = 2` and `(ζ,ζ) ↦ ζ²` | correct: the root is data |
| ray-class Check (moved) | `4·∞`; `4` over `ℚ` | `(ℤ/4)ˣ`, `5 = (2+i)(2−i)`, `(3)` nontrivial; at `4`, `−3 ≡ 1`, trivial group, field `ℚ` | correct |
| Layer 14 (changed) | `(3,7)`, `(−1,−1)` | `(3,7)₂ = −1`, `(7/3) = 1`, `(3/7) = −1`, `∞`: `+`, giving `1,0,1,0`; `(−1,−1)`: `1` at `2` and `∞` | correct |

The Layer 0–12 examples and the §5 Checks are unchanged since the previous review's table. I recomputed the ones that touch the targets:
- `ℚ₂(ζ₅)`: `Frob³(ζ) = ζ⁸ = ζ³`.
- The `ℚ(√13, √17)` decomposition groups: `17 ≡ 2² mod 13`, `(13/17) = 1`, `2` inert in `ℚ(√13)`.
- The orders: `h(ℤ[√−3]) = 2·(3/2)/3 = 1` and `h(ℤ[2i]) = 2/2 = 1`.
- The transfer `C₄ → ⟨g²⟩`, `g ↦ g²`.

**Sources: the seeded sample and every locator a finding touches.**
- **Comparison of valuations.** jahnke-koenigsmann line 113 (Theorem 2.1, printed p. 3, after the page marker at line 96) states the theorem as the README reads it; line 115 proves it by citing Engler–Prestel 4.4.1. The discreteness route of `valuativeExtension_of_finite` is checked step by step above. Every input it uses is pinned:
  - `TauCeti.normalizedValuation` (`TauCeti/NumberTheory/LocalField/NormalizedValuation.lean:114`);
  - `TauCeti.henselianLocalRing_integer` (`…/LocalField/Henselian.lean:41`);
  - the instance `Finite 𝓀[K]` (Mathlib `NumberTheory/LocalField/Basic.lean:142`).
- **Cyclotomic normalization.** milne-cft lines 10059–10075 (VII Example 8.2, p. 221) give `φ_ℓ(uℓ^s) = [u⁻¹]` on `ℚ(ζ_{ℓ^r})`, and the product check is at lines 10085–10109 (p. 222). `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit` (`…/Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311`) assumes `[ValuativeExtension ℚ_[p] F]`, as the README says.
- **Layer 13 open targets**, in milne-cft (printed page = PDF page − 9):
  - V Theorem 3.17, p. 161 (line 7252);
  - the transfer square, pp. 162–163 (lines 7271–7322);
  - V Theorem 3.27 and Remark 3.28, p. 165 (lines 7423, 7436), where the product is over `f₀`;
  - V §1, p. 154 (line 6865): splitting completely ⇔ trivial Frobenius;
  - V Theorem 3.6, p. 158 (line 7051);
  - V Example 3.9, p. 159 (line 7092).
- **Other locators checked:**
  - II Theorem 3.11, p. 84 (line 3911), and Remark 3.12, p. 85 (line 3988);
  - VII §4, p. 210 (line 9566), and §5, p. 212 (line 9664);
  - VII Theorem 8.1, p. 221 (line 10042);
  - VII Lemma 9.1 and Theorem 9.5, pp. 223–226 (lines 10189, 10287);
  - VIII Theorem 4.2, p. 241 (line 10937).

**Library declarations opened at the pin.**
- **Mathlib:**
  - `RingTheory/Valuation/ValuativeRel/Basic.lean:1252` (`ValuativeExtension`, the field `vle_iff_vle`);
  - `NumberTheory/LocalField/Basic.lean:46` (`IsNonarchimedeanLocalField` extends `IsValuativeTopology`, `LocallyCompactSpace` and `ValuativeRel.IsNontrivial`);
  - `NumberTheory/Padics/LocalField.lean:28`;
  - `RingTheory/Valuation/RankOne.lean:56` (`RankOne` extends `IsNontrivial`);
  - `Analysis/AbsoluteValue/Equivalence.lean:413` (needs nontrivial, pairwise inequivalent absolute values);
  - `Analysis/Normed/Field/Krasner.lean:117`;
  - `RingTheory/Henselian.lean:95, 154`;
  - `RingTheory/Localization/Submodule.lean:196`;
  - `RingTheory/FractionalIdeal/Operations.lean:630`.
- **Tau Ceti** (under `TauCeti/`):
  - `NumberTheory/LocalField/AbsoluteRamificationIndex.lean:64` (`FinitePadicExtension` bundles `ValuativeExtension ℚ_[p] K`);
  - `NumberTheory/LocalField/AlgebraicExtension/Basic.lean:130, 254, 314`: `algebraicExtensionValuation_isEquiv` and `AlgHom.valuativeExtension` both assume compatibility over `K`, so the comparison is genuinely open;
  - `NumberTheory/LocalField/FiniteExtension/Basic.lean:54`;
  - `NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean:98, 110`;
  - `NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123, 157, 218, 241, 262, 277, 362`;
  - `NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean:257`;
  - `NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Basic.lean:193`;
  - `NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Ramification.lean:116`;
  - `NumberTheory/NumberField/Global/RayClass/Basic.lean:200`, `…/Modulus.lean:462, 544`;
  - `NumberTheory/ClassFieldTheory/Formation/PrincipalIdeal.lean:67`;
  - `NumberTheory/ClassFieldTheory/Local/Conductor/UpperNumbering.lean:64, 130`;
  - `NumberTheory/LocalField/Discriminant/Conductor.lean:58`;
  - `RingTheory/DedekindDomain/Discriminant/Basic.lean:33`, `…/Valuation.lean:52`;
  - `NumberTheory/NumberField/Discriminant/FixedField.lean:109`.

**Citations, ownership and overlaps.**
- `roadmaps resolve` finds no unresolved citation or Lean name in the README.
- The `GlobalNumberFields` Layers 2, 6, 8 and 11 match the contracts (`Completed/GlobalNumberFields/README.md:279, 439, 476, 571`).
- Searching main and the 468 open heads by object (F. K. Schmidt's henselian theorem, the automatic `ValuativeExtension`) finds no other owner, apart from the competing revisions (R05).
- LocalFieldsRamification at this head sends local reciprocity and existence to this roadmap's Layers 6–8, which matches. Its *Downstream consumers* says this roadmap's Layer 7 consumes Hasse–Arf, but Layer 7 takes its conductors from Tau Ceti at the pin. That sentence is LocalFieldsRamification's to correct.
- The overlap report lists no dropped ids, and I confirmed none.
- All names that `Completed/LocalGaloisGroups/Suggested.lean` and `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` use are declared here, with matching argument order. That includes the two forced call sites of R01.

## Not verifiable

- **Engler–Prestel, *Valued Fields*, Theorem 4.4.1.** Uncertified (paywalled). It is corroborated only by the citation at jahnke-koenigsmann line 115.
- **NSW (7.1.8), (7.2.5); Serre, *Local Fields*; Neukirch, *Algebraic Number Theory*; Artin–Tate.** The first three are uncertified and Artin–Tate is waived. Each is cited by locator only, for material Tau Ceti proves at the pin.
- **Works the README cites that are not in the manifest, and were not read:**
  - Cox, *Primes of the Form x² + ny²*;
  - Tate (1952) and Nakayama (1957);
  - Brown, *Cohomology of Groups*;
  - Rim (1959);
  - Lang, *Algebra*;
  - Weil (1951);
  - Tate, Corvallis;
  - Serre, *Galois Cohomology*.

  All of them support only material Tau Ceti proves at the pin. Recording them in the manifest, as uncertified where they are paywalled, would settle them.
- **Kopp–Lagarias, published version.** I could not compare its numbering with arXiv v3; the README's numbers are v3's, which the manifest records.
- **Elaborating `Completed/LocalGaloisGroups/Suggested.lean` against this head.** It needs object files for `Completed.ProfiniteProPGroups.Suggested`, `Completed.LocalFieldsRamification.Suggested` and `TauCetiRoadmap.ProfiniteCohomology.Suggested`, none of which is built, and building roadmap modules is outside this review's permitted commands. I checked its uses by name and signature instead.
- **Ownership against open pull requests.** I checked it with `roadmaps grep` over all 468 open heads. Packages on the board that are in no pull request were not searched.

## Source issues

- none
