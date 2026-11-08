# Review of ClassicalArithmeticCompletion (pull request #1409 at d8a53de)

**Verdict:** accepted

🤖 Independent AI review: an incremental re-review of the 44 lines changed since c725fa7. The AI never approves or merges. "Accepted" means this roadmap folder is ready for a human's final approval.

- **Previous findings:** both are repaired (R01: the local-field contract; R02: the field/residue-field slips).
- **New problems:** none found in the changed passages.
- **Gate:** passes.
- **Elaboration:** `Suggested.lean` elaborates with only `sorry` warnings.
- **Dependency check:** no UPWARD or CYCLE line.

## Findings

None.

## Previous findings

- R01 — repaired: `README.md:176` now reads "for L/K finite, Galois and unramified, the residue correspondence `TauCeti.residueFieldAutEquiv` … whose instance arguments include `FiniteDimensional K L` and `IsGalois K L`". `:178` reads "Henselian local ring R with finite residue field". `:180` cites `TauCeti.isTamelyRamified_tower_iff`. §§1.43 and 7.38 cite `TauCeti.isUnramified_unramifiedExtension` (and in §7.38 also `finrank_unramifiedExtension`).
- R02 — repaired: §7.38 (`:14787`) is rewritten around "L′/K is Galois as the compositum of the Galois extensions L and `L′_0` of K". §7.52 (`:15135`) reads "L/K is a cyclic Kummer extension". A grep for `l′/K` or `l/K is` finds nothing.

## Verified sound

### Scope

I read head `d8a53de42a51af0b46a57943c85e6ba7f1365f58` and checked:

- every passage of the 44-line diff (`scratch/changes.md`);
- the two previous findings;
- all 20 pinned declarations that the diff cites or relies on;
- the gate, the elaboration, the dependency check and the overlap facts.

`git diff --stat origin/main...HEAD` outside the folder is empty. The pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

### Gate, build and dependency check

- **Gate (my run):** every check reported 0 and the run ended "OK" (`set_option=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0`). The worker's run on this head also has `build=0` (`scratch/gate.md`).
- **Elaboration:** `lake env lean TauCetiRoadmap/ClassicalArithmeticCompletion/Suggested.lean` exited 0 with 45 warnings, all `declaration uses 'sorry'`, and no errors. The only other output is the two `#check` lines that pin `pow_card_eq_one'` and `pow_ne_of_irreducible_X_pow_sub_C`.
- **Lean change:** the only change to `Suggested.lean` is the docstring of `IsTamelyRamified` (`:570–574`). No type changed, so the 73 elaborated signatures in `scratch/signatures.md` stand, with 0 lost binders. The docstring now names `TauCeti.isTamelyRamified_tower_iff`, which the README does consume (§7.2 *Needs*, §7.38).
- **Dependency check**, output verbatim:

  ```text
  depcheck: 245 roadmaps, 2498 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. This roadmap is not in `ORDER.txt`, so the check places it after its last supplier; that is not a finding.

### Pinned declarations, opened and elaborated

I put `#check @` for each of the 20 names below in one scratch file and elaborated it once (exit 0). Each elaborated type matches what the README now says it provides:

| README claim (changed text) | Pinned declaration, file:line | Agrees |
|---|---|---|
| every subextension of an unramified extension is unramified | `IsUnramified.tower_bot`, `Unramified/Basic.lean:226` (M/L/K, `IsUnramified K M → IsUnramified K L`) | yes |
| unramified L/K is the unramified extension of degree f inside L | `IsUnramified.unramifiedExtension_inertiaDegree_eq_top`, `Unramified/Factorization.lean:179` (`= ⊤`) | yes |
| `residueFieldAutEquiv` needs `FiniteDimensional` and `IsGalois` | `ResidueCorrespondence.lean:150`; `#check` shows `[FiniteDimensional K L] → [IsGalois K L] → [IsUnramified K L]` | yes |
| "no pinned instance derives `IsGalois K L` from `IsUnramified K L`" | grep of `TauCeti/` for `instance.*IsGalois` in `LocalField/`: only `unramifiedExtension`, `maximalUnramifiedExtension`, a private level and a worked example; no theorem `IsUnramified.isGalois` | yes |
| for f ≥ 1, `unramifiedExtension K Ω f` = K adjoined the `(q^f−1)`-st roots of unity, for any Ω | `unramifiedExtension_eq_adjoin_setOf_pow_eq_one`, `Existence.lean:162` (`hf : f ≠ 0`, no `IsSepClosed`) | yes |
| Galois over K for every Ω and f | `isGalois_unramifiedExtension`, `Existence.lean:210` | yes |
| for Ω separably closed and f ≥ 1, unramified of degree f | `isUnramified_unramifiedExtension` `:367`, `finrank_unramifiedExtension` `:378` (`[IsSepClosed Ω]`, `f ≠ 0`) | yes |
| every unramified intermediate field E is `unramifiedExtension K Ω [E : K]`, for any Ω | `IntermediateField.eq_unramifiedExtension_finrank`, `Existence.lean:329` | yes |
| uniqueness for Ω separably closed, f ≥ 1 | `existsUnique_isUnramified_finrank_eq`, `Existence.lean:386` | yes |
| maximal unramified subextension: unramified, contains every unramified E, [L : L₀] = e, e(L/L₀) = e, L/L₀ totally ramified | `Factorization.lean:84, :97, :124, :151, :142` | yes |
| Teichmüller section, with instance arguments `HenselianLocalRing R`, `Finite (ResidueField R)` | `RingTheory/Henselian/Teichmuller.lean:66` (variables), `:94`, `:119` | yes |
| `𝒪[K]` qualifies | `henselianLocalRing_integer`, `LocalField/Henselian.lean:41`. A scratch `#synth` also finds Mathlib's `Finite 𝓀[K]` instance (`Mathlib/NumberTheory/LocalField/Basic.lean:142`), and `TauCeti.teichmuller 𝒪[K]` elaborates | yes |
| a tower is tame exactly when both steps are | `isTamelyRamified_tower_iff`, `RamificationIndex.lean:587` | yes |
| an unramified extension is tame | `IsUnramified.isTamelyRamified`, `Unramified/Basic.lean:204` | yes |

### Layer dependency lists

I compared each layer's *Needs* lines with its `### Dependencies` list using a scratch script.

- **Layer 1:** it gained `IsUnramified.tower_bot`, `isUnramified_unramifiedExtension` and `unramifiedExtension_eq_adjoin_setOf_pow_eq_one`, exactly the names §1.43 added.
- **Layer 7:** it gained the seven names that §§7.2, 7.19 and 7.38 added. It dropped `IsTamelyRamified.tower_bot`, which no Layer 7 *Needs* line now cites (grep of the README and `Suggested.lean`: 0 hits).
- **Every new name:** each Tau Ceti name in a Layer 1 or Layer 7 *Needs* line appears in that layer's list.

### Changed proof steps

- **§1.43 (`:1455`):** "f ≥ 1 the order of q modulo m" is well defined because m is prime to p and hence to q = N𝔭. Then m ∣ q^f − 1, so `K_v(μ_m) ⊆ K_v(μ_{q^f−1}) = unramifiedExtension K_v Ω f`, and `tower_bot` applies to the subextension `K_v(ⁿ√w)`.
- **Units paragraph (`:178`):** the order of ⁿ√ω divides n·ord(ω), so it is prime to p, and some f ≥ 1 with that order dividing q^f − 1 exists. Separability of `K(ⁿ√u)` (n prime to the characteristic) puts it inside a separable closure Ω.
- **§7.19:** the two added equalities are exactly `finrank_…_eq_ramificationIndex` and `ramificationIndex_unramifiedExtension_inertiaDegree`.
- **§7.38:** the new argument is sound.
  - L′ is unramified of degree e over L, and `𝓀[L]` has q^f elements.
  - So L′ = L(roots of `X^(q^(ef)) − X`) by `eq_unramifiedExtension_finrank` over L.
  - `L·L′_0` is the same field by definition of `L′_0`.
  - The uniqueness clause identifies `L′_0` with the maximal unramified subextension of L′/K, whose degree is f(L′/K) = ef.
  - Tameness of L′/K follows from L/K tame, L′/L unramified, `IsUnramified.isTamelyRamified` and `isTamelyRamified_tower_iff`.
- **§7.2:** the added sentence matches the shape of `GaloisModules.isTamelyRamified_trans_iff` (`Suggested.lean:579–587`) with the library's local-field form. The equivalence of the two predicates on integer rings was verified in the previous report.

### Seeded sample

None of the fifteen seeded targets falls in the diff, and none cites a changed passage. A scratch script searched each section for the changed anchors (`#143-`, `#72-`, `#719-`, `#738-`, `#752-`) and the changed `TauCeti.` names, with 0 hits. The targets are §§1.58, 2.2, 2.37, 2.38, 2.53, 2.62, 2.77, 3.10, 3.43, 3.50, 4.23, 5.12, 6.10, 7.78 and 7.98. Following the incremental instruction, they were not re-verified. The README flags no locator as unverified (grep "unverified": 0).

### Overlaps and ownership

- `scratch/overlaps.md` lists:
  - no other open pull request changing this roadmap;
  - no dropped id that it cites;
  - no id that only an open revision defines;
  - no dropped id of its own that others cite.
- The diff adds no object of its own; it only repoints and extends citations of pinned declarations. Ownership against the closest roadmaps (#1408, #1046, #1335, #1126, #1712) is therefore unchanged from the previous reports.
- Ownership against open pull requests without a supplied checkout was not checked beyond the roadmaps tool.
- `scratch/citations.md` lists no unresolved cross-roadmap citation. Its Lean names are this roadmap's own `Suggested.lean` declarations; none of them is a name the diff added.

### Adversarial computations for the changed claims

| Claim | Instances and computed values on both sides | Result |
|---|---|---|
| `IsUnramified.tower_bot` | ℚ₃ ⊂ ℚ₉ ⊂ ℚ₈₁: e = 1·1, lower step e = 1. Control ℚ₃ ⊂ ℚ₃(√3) ⊂ ℚ₃(√3, i): e(M/K) = 2, so the hypothesis fails, and the lower step has e = 2. The lemma correctly says nothing. | holds |
| unramified ⇒ Galois via `…_eq_top` | ℚ₃(i)/ℚ₃: i⁹ = i, so i is a root of X⁹ − X. So ℚ₃(i) = `unramifiedExtension ℚ₃ ℚ₃(i) 2` = ⊤, which is Galois. | holds |
| roots-of-unity form, f ≥ 1 | ℚ₂, f = 2: roots of X⁴ − X are 0 and μ₃, and {x : x³ = 1} gives ℚ₂(ζ₃) of degree 2 both ways. f = 0: `unramifiedExtension K Ω 0 = ⊥` (elaborated), but {x : x⁰ = 1} = Ω. So "f ≥ 1" is needed, and the README states it. | holds |
| unramified of degree f; uniqueness | ℚ₂, f = 2: ℚ₂(ζ₃) = ℚ₂(√−3) = ℚ₂(√5), since −15 ≡ 1 (mod 8) is a 2-adic square. One field, degree 2, e = 1. ℚ₂(√3) has e = 2, so it is excluded. | holds |
| maximal unramified subextension | L = ℚ₃(i, √3), e = f = 2: L₀ = ℚ₃(i), [L : L₀] = 2 = e, e(L/L₀) = 2. The other quadratic subfields ℚ₃(√3) and ℚ₃(√−3) have e = 2, so L₀ is the only unramified one. | holds |
| Teichmüller with finite residue field | ℤ₅: the lift of 2 is the 4th root of unity ≡ 2 (mod 5). Check: 2² ≡ −1 and 2⁴ ≡ 1 (mod 5). With an infinite residue field, `Nat.card − 1` = 0 − 1 = 0 in ℕ, so the construction degenerates; this is why the finite hypothesis is stated. | holds |
| `isTamelyRamified_tower_iff` | ℚ₅ ⊂ ℚ₅(√5) ⊂ ℚ₅(√5, √2), where 2 is a non-square mod 5: e = 2·1, 5 ∤ 2, so tame ↔ tame ∧ tame. Wild control ℚ₂ ⊂ ℚ₂(ζ₃) ⊂ ℚ₂(ζ₃, √2): top step e = 2 with 2 ∣ 2, so false ↔ (true ∧ false). | holds |
| `IsUnramified.isTamelyRamified` | e = 1, and no prime divides 1. At p = 2, ℚ₂(ζ₃)/ℚ₂ is tame. | holds |
| §1.43, f = order of q mod m | K = ℚ, n = 2, v = 5, w = 2: ω has order 4, √ω has order 8, so m = 8; 5² ≡ 1 (mod 8) gives f = 2, and ℚ₅(μ₂₄) = ℚ₂₅ ∋ √2. K = ℚ(ζ₃), 𝔭 ∣ 7, n = 3, w = 2: 2 is not a cube mod 7, so ∛ω has order 9, f = ord₉(7) = 3, and 9 ∣ 342 = 7³ − 1. For w = 1: m = 1, f = 1. | holds |
| units paragraph, any admissible f | v = 5, ⁿ√ω of order 8: f = 1 fails (8 ∤ 4) and f = 2 works (8 ∣ 24). The paragraph quantifies over admissible f, so it covers this. | holds |
| §7.19 additions | ℚ₇(7^{1/3}): L₀ = ℚ₇, [L : L₀] = 3 = e. ℚ₃(i, √3): [L : ℚ₉] = 2 = e, and 2 ∣ 3² − 1 = 8. | holds |
| §7.38, `L′ = L·L′_0`, Galois and tame | ℚ₇(7^{1/3}), e = 3, f = 1: `L′_0` = ℚ₃₄₃ (degree 3 = ef), L′ = L·ℚ₃₄₃, which matches the section's Check. e(L′/ℚ₇) = 3 and f = 3; 7 ∤ 3, so tame; 3·6 = 18 ∣ 342. ℚ₃(i, √3), e = f = 2: `L′_0` = ℚ₈₁ (degree 4), L ∩ ℚ₈₁ = ℚ₉, [L·ℚ₈₁ : L] = 2 = e, and 2·8 = 16 ∣ 80. | holds |
| §7.52, "L/K cyclic Kummer" | ℚ₇(7^{1/3})/ℚ₇: ζ₃ ∈ ℚ₇ since 7 ≡ 1 (mod 3), and σ(π_L) = ζ₃π_L. | holds |
| §7.2, the library's tower form | ℤ₃ ⊂ ℤ₃[√3] ⊂ ℤ₃[3^{1/4}]: e = 2·2 = 4, 3 ∤ 4, tame on both sides. Control ℤ₂ ⊂ ℤ₂[√2]: e = 2, 2 ∣ 2, wild on both sides. | holds |

### Carried adversarial evidence for untouched statements

The diff changes no README target statement and no Lean type. The rows for every other statement therefore carry unchanged from the previous report (`packages/ClassicalArithmeticCompletion/reports/PRREVIEW-ClassicalArithmeticCompletion~5.md`) and the reports it carries:

- the c725fa7 increment: `exists_pow_eq_iff_pow_eq_one`, `card_nonzero_pow_roots`, `christol`, the `IsTamelyRamified` agreement, `unitFiltration_le_range_powMonoidHom`, `map_normUnits_unitFiltration`, `normalizedValuation_norm`, `basisOfResidueBasis`, the tame character, and the §4.0 binary-form Checks;
- the 121997a increment: §§1.7, 1.51, 1.18a, 2.21, 2.43, 2.57, 3.61, 6.34 and 7.44;
- the carried rows from compatible CRT through the Fröhlich–Taylor endpoint.

Two examples:

- F₇, n = 2: exponent 6/gcd(6, 2) = 3, and 2³ = 1 with 2 = 3².
- CRT with m = 6, n = 9, a = 1, b = 4 gives x = 13 mod 18.

The headline list and the padding probe are unchanged, since no declaration was added or retyped.

### Remarks on untouched text

These do not block acceptance.

- **`K_v` as a local field.** §1.43 (and §1.24 through §1.14) uses `IsNonarchimedeanLocalField (v.adicCompletion K)`, which neither pin has. NumberFieldArithmetic §5.1 owns it, and the contract at `:190` cites that layer, but §1.43's *Needs* and the Layer 1 list do not.
- **Layer 1 list.** It lacks `TauCeti.Multiquadratic.isPrimitive_fundamentalDiscriminantChar`, which §1.7's *Needs* (`:1715`) cites.

## Not verifiable

None: no source was needed for this increment. The changed passages repoint or extend citations of pinned declarations, and no seeded target falls in the diff. The source limits recorded in earlier reports carry over and are not reopened.

## Source issues

- none
