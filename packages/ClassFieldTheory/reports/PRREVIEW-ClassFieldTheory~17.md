# Review of ClassFieldTheory (pull request #617 at 81e13ac)

**Verdict:** needs changes

:robot: Independent AI review (Claude Opus 5.5) of `TauCetiRoadmap/ClassFieldTheory/README.md` (1047 lines) and `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` (717 lines, 71 declarations), at Tau Ceti `2fd255d` and Mathlib `1b1ccf4`, the pins of `lake-manifest.json`. All seven findings are P3. The gate fails on `outside-folder` (R01), so the folder cannot be accepted yet. The mathematics of the six open targets survived the adversarial pass.

## R01 (P3) — Gate `outside-folder`: five files under `Completed/`

**Location:** `Completed/LocalFieldsRamification/COMPLETION.md`, `README.md`, `Suggested.lean`; `Completed/LocalGaloisGroups/README.md`, `Suggested.lean`.

**Claim:** The pull request's own folders are ClassFieldTheory, IntegralLattices and QuadraticFormInvariants. These five files are outside them, so the scoped gate fails. Two of the LocalGaloisGroups edits are forced by this folder, so they cannot just be dropped. `Completed/LocalGaloisGroups/Suggested.lean:324–326` and `:485` follow this head's new signatures for `h2MuEquivZMod_mixed` (now data rather than `Nonempty`) and `h2FpEquivZMod_of_mu` (now `(T) (e : muNRep p F ≅ T)`).

**Witness:** Gate: `outside-folder=5 … FAIL`, with every other check at 0. The diff with the three folders excluded lists exactly these five paths (958 insertions, 3167 deletions).

**Repair:** Have the intake register `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as folders of this pull request, each with its own review, then rerun the scoped gate. Alternatively, move the LocalFieldsRamification rewrite to its own pull request and keep only the two forced LocalGaloisGroups hunks here, with that folder registered. In both cases, add `Completed.LocalGaloisGroups.Suggested` to the targeted build. It imports this module and is edited here, but the worker's targeted build (`ClassFieldTheory`, `GlobalQuadraticForms`, `QuadraticFormInvariants`) does not elaborate it. This was R10 of the previous review of this pull request and has not been repaired.

## R02 (P3) — `Suggested.lean` is a re-export catalogue, and §6 says it is not

**Location:** README:979–980: "no restatement of a theorem Tau Ceti proves under the same hypotheses"; `Suggested.lean:496–497`.

**Claim:** 62 of the 71 declarations are aliases or wrappers of pinned declarations: 25 `abbrev`, 8 `def` (one private), 3 `instance`, and 26 theorems whose proof names one Tau Ceti or Mathlib declaration. Only the six open targets, plus the three theorems closed from `valuativeExtension_padic`, test the roadmap.

Fifteen of the theorems restate a Tau Ceti theorem under the same hypotheses, which §6 forbids: `TateCohomology.projective_ker_of_isZero_res`, `TateCohomology.primaryComponent_tateCohomology_eq_bot`, `ClassFormation.artinMap_conj`, `muNRepCoeffDictionary_continuous`, `muNRepCoeffDictionary_equivariant`, `muNRep_ρ_eq_self`, `bijective_muNRepToTateDual`, `denseRange_artinMap`, `unramifiedCoordinate_artinMap`, `artinMap_restrict`, `artinMap_norm`, `cyclotomicCharacter_artinMap_padic_uniformizer`, `cyclotomicCharacter_artinMap_padic`, `card_ideleClassNormQuotient`, `hilbertProductFormula`.

§6 also has two smaller inaccuracies:
- README:982–983 says each local-field declaration binds `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` "in its own signature". The nine declarations of `section Local` (lines 478–548) take them from `variable`. Their elaborated types do keep the binders, so this is a wording error, not a lost hypothesis.
- Two of the "three Checks" in the §1 definitions table are junk values that hold by definition, and so discriminate nothing: `kummerClass` in characteristic 2, and `kummerCupPairing` at `n = 0`.

**Witness:** `theorem denseRange_artinMap : DenseRange (artinMap K) := TauCeti.ClassFieldTheory.denseRange_artinMap K` (lines 496–497) is Tau Ceti's theorem under the same binders. IntegralLattices already consumes Tau Ceti's ring class field directly (README:96–98).

**Repair:**
- **Suggested.lean.** Delete the 62 aliases, including `zeroTopPairing` and the §1 "Definitions made here" table. Keep the nine theorems, and write their statements with the Tau Ceti names: `TauCeti.ClassFieldTheory.GalRep`, `continuousCohomology` and `TauCeti.ClassFieldTheory.artinMap`.
- **Consumers in this pull request.** In the same change, move each alias use to the Tau Ceti name given in the alias's docstring. `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` uses 13 names, all aliases, so it can then drop its import of this module. `Completed/LocalGaloisGroups/Suggested.lean` uses 21 names: 19 are aliases, and it keeps `cyclotomicCharacter_artinMap` and `eulerCharacteristic_finrank_fp`, which are retained.
- **GlobalQuadraticForms.** It needs no change if #1200 merges first: its head `15f0a4c` imports no roadmap module and uses no `ClassFieldTheory.` name. State that order.
- **README.** §1's consumer table then lists Tau Ceti names, and §6 loses its second bullet.

The repair is safe on the refuting instance: `TauCeti.ClassFieldTheory.denseRange_artinMap K` has exactly the alias's type, as the alias's one-term proof shows. This was R05 of the previous review of this pull request and has not been repaired.

## R03 (P3) — The ray-class splitting criterion is a one-line consequence of the pin, not an open target

**Location:** README:40–41 (§1, item 2), 805–819; `Suggested.lean:668–676`.

**Claim:** §1 lists `ncard_primesOver_rayClassField_eq_finrank_iff` among the open targets. By §1's own rule (lines 43–45), what follows in a few lines from Tau Ceti's theorems is a Check, not a target, and this criterion closes with a single `rw`.

**Witness:** In a scratch copy, replacing line 676's `sorry` with `rw [ncard_primesOver_eq_finrank_iff_rayClassArtinMap_idealClass_eq_one (isAdmissibleModulus_rayClassField 𝔪) I, ← rayClassArtinEquiv_apply, MulEquiv.map_eq_one_iff]` elaborates. The file then has five `sorry` warnings and no errors.

**Repair:** Delete the theorem from `Suggested.lean`, from §1 item 2, from the module docstring and from the Layer 13 open targets. Keep the statement as a Layer 13 Check that names the three pinned lemmas, with a computed case: the modulus `4∞` over ℚ, whose ray class field is ℚ(i). There `5 ≡ 1 mod 4` has two primes above it, and `3` has one. The Hilbert-class-field criterion is different: it needs the modulus-one/principal-ideal dictionary, so it stays a target.

## R04 (P3) — Layer 5's locators: two unread, flagged in process language, and the certified one is missing

**Location:** README:504: "(Engler–Prestel, *Valued Fields*, Theorem 4.4.1, a locator qualified in §8)"; README:1043–1047: "Cited without a theorem locator, which has not been verified against the article."

**Claim:** The theorem behind `isEquiv_of_henselian` is cited only to Engler–Prestel 4.4.1 and Schmidt 1933. Neither text was read, and neither is in `sources.toml`. The phrases "has not been verified" and "qualified in §8" are process narrative.

The manifest records `jahnke-koenigsmann` as certified and cited for Layer 5. It states the theorem and gives the Engler–Prestel number, but the README never cites it.

Two smaller locator problems:
- README:1020–1021 attaches "VII §§4–5" to "(the cyclotomic local symbols)", but those sections are the two inequalities.
- "VIII §4" supports no claim in the README.

**Witness:**
- jahnke-koenigsmann line 113 (Theorem 2.1, p. 3): two independent nontrivial henselian valuations force separable closure. Line 115 proves it by citing Engler–Prestel, Theorem 4.4.1.
- milne-cft lines 81–82: VII §4 and §5 are the first and second inequalities.

**Repair:**
- **Line 504.** Cite "Jahnke–Koenigsmann, *Definable henselian valuations*, arXiv:1210.7615v4, Theorem 2.1, p. 3, where the proof cites Engler–Prestel, Theorem 4.4.1", and add the reference to §8.
- **Engler–Prestel and Schmidt.** Record Engler–Prestel 4.4.1 and Schmidt 1933 in `sources.toml` as uncertified. Delete the two "has not been verified" sentences and "a locator qualified in §8".
- **Lines 1020–1021.** Rewrite as "VII §§4–5 (the first and second inequalities), Example 8.2, pp. 221–222 (the cyclotomic local symbols)". Either attach "VIII §4, p. 239 (the fundamental exact sequence)" to Layer 10 or drop it.
- **Wording.** Replace README:14 "What remains are" and `Suggested.lean:38` "still open at the pins" with "The open targets are".

## R05 (P3) — No order with #1215 and #1411, which conflict and state the same targets differently

**Location:** the description's merge-order paragraph, which names only #1410.

**Claim:** Two other open pull requests revise this roadmap. Their heads do not merge with this one, and they state the same mathematics under other names and statuses. Whichever merges second has to be rebased and reconciled, and the description must say which.

**Witness:** `git merge-tree` of `81e13ac` with `2ed7ba0` (#1215) and with `cded4a2` (#1411) gives content conflicts in both ClassFieldTheory files. #1411 `Suggested.lean:588` states `valuativeExtension_padic` as `algebraMap_vle_algebraMap_iff_of_finite_padic`. #1215 `Suggested.lean:78` leaves `cyclotomicCharacter_artinMap` as a `sorry`.

**Repair:** State in the description which of #617, #1215 and #1411 rebases on which. In that order:
- Keep one name for the valuation comparison.
- For #1411's Layer 7 unit-filtration targets (`map_unitFiltration_normResidue`, `closure_map_artinMap_unitFiltration`, its `Suggested.lean:777, 826`), either adopt them or say in §1 why this roadmap leaves them out. The pin has only the conductor form, `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` (`TauCeti/NumberTheory/ClassFieldTheory/Local/Conductor/UpperNumbering.lean:64`).

This was R11 of the previous review of this pull request and has not been repaired.

## R06 (P3) — Layer 14's examples give ℚ/ℤ values for ℤ/2-valued invariants

**Location:** README:862: "the invariants are `0` at `∞`, `1/2` at `2`, `0` at `3` and `1/2` at `7`"; README:864.

**Claim:** Layer 14 makes the Hilbert invariants `ℤ/2`-valued (line 851; `finiteHilbertInvariantAt … : ZMod 2`, `Suggested.lean:694–695`). In `ℤ/2` the value is `1`, not `1/2`; `1/2` is the Brauer invariant of the quaternion algebra.

**Witness:** `(3,7)₂ = (−1)^{ε(3)ε(7)} = −1` (since `ε(3) = ε(7) = 1`), `(3,7)₇ = (3/7) = −1`, `(3,7)₃ = (7/3) = 1` and `(3,7)_∞ = 1`. So the `ℤ/2` values at 2, 7, 3 and ∞ are `1, 1, 0, 0`.

**Repair:** Write "the `ℤ/2`-valued invariants are `0` at `∞`, `1` at `2`, `0` at `3` and `1` at `7` (Brauer invariants `0, 1/2, 0, 1/2`), summing to `0`". Similarly, `(−1, −1)` has value `1` at `2` and at `∞`.

## R07 (P3) — `valuativeExtension_padic` waits on F. K. Schmidt, though a short proof needs only discreteness

**Location:** README:522–531, *Needs:* `isEquiv_of_henselian`; the dependent theorems at 538–543 and 614–625.

**Claim:** The stated route makes the comparison wait on the hardest open target, which needs weak approximation plus continuity of roots over henselian (not complete) fields. Three theorems wait with it: `eulerCharacteristic_mixed`, `eulerCharacteristic_finrank_fp` and `cyclotomicCharacter_artinMap`, the last two consumed by LocalGaloisGroups. A direct proof exists.

**Witness:** For `u ∈ ℤ_pˣ`, `u = ζ·(1+px)` with `1+px` an `ℓ^k`-th power (`ℓ ≠ p`, every `k`), so the `ℤ`-valued normalized valuation `w` of `F` kills `u`. `w(p) ≤ max(w(p+1), w(1)) = 1`, and `w(p) = 1` would make `w` trivial on `F`.

**Repair:** Give this argument as the route of `valuativeExtension_padic`, with *Needs:* `TauCeti.normalizedValuation` (`TauCeti/NumberTheory/LocalField/NormalizedValuation.lean:114`) and Mathlib `hensels_lemma` (`Mathlib/NumberTheory/Padics/Hensel.lean:460`). Keep `isEquiv_of_henselian` as a separate target with its Checks.

The new route agrees with the existing Layer 5 Check on ℚ₂(i). Cubing is bijective on `ℤ₂ˣ`, so `w(−3)` is divisible by every `3^k` and is therefore `0`, while `2 <ᵥ 1`.

## Verified sound

**Gate and dependency check.** Rerunning the gate reproduces the worker's result: every check is 0 except `outside-folder` (R01). My run also lists the IntegralLattices and QuadraticFormInvariants files, which the brief names as this pull request's own. The dependency check prints `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The suppliers (Mathlib, Tau Ceti, Completed GlobalNumberFields) are all on main.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` exits 0 in 10 s. The only warnings are six `sorry` warnings, at lines 367, 380, 655, 662, 671 and 683.

I compared the elaborated types of all 70 declarations (from the worker's signature check) with their README statements:
- No binder is lost.
- The nine local declarations keep `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`.
- The open targets match the README's generality: `K : Type*` only in `isEquiv_of_henselian`, `NumberField K` throughout Layer 13, and `[IsAbelianGalois K L]` on the conductor–discriminant formula.

There is one import line `import Mathlib`, followed by 25 `TauCeti.*` modules, all of which exist at the pin. There is no `set_option`, no sorry'd data and no roadmap import.

**One-tactic probe.** On a scratch copy, `first | infer_instance | rfl | simp | decide | aesop` closes none of the six targets. Notably, `infer_instance` does not find `ValuativeExtension ℚ_[p] F`. A targeted `rw` closes the ray-class criterion (R03).

I also checked the README's claim (Layer 13 Examples, line 842) that one `simp` call proves that the ring class field of the maximal order is the Hilbert class field. It elaborates with no error.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `isEquiv_of_henselian` | ℚ with `v₂, v₃` | `X²−X+2 ≡ X(X−1) mod 2` (simple roots), disc `−7`, no rational root ⇒ `ℤ₍₂₎` not henselian; `X²−7 ≡ (X−1)(X+1) mod 3`, `√7 ∉ ℚ` | hypothesis needed, Check correct |
| same | ℚ̄ with extensions of `v₂, v₃` | henselian (algebraically closed), value group ℚ (rank one), residue characteristics 2 ≠ 3 | `¬IsSepClosed` needed, Check correct |
| same | rank one, dependent | the overrings of a rank-one ring `O` are `O` and `K`, so `O₁O₂ ≠ K` ⇒ `O₁ = O₂` | dependent ⇒ equivalent, as README line 505 says |
| same | `𝔽_q` | no nontrivial valuation, so `RankOne` is uninhabited | vacuous, true |
| `valuativeExtension_padic` | ℚ₂(i) | `v_F(2) = 2`, `v₂(2) = 1`; both relations give `2 <ᵥ 1` | relation, not normalization, as stated |
| same | trivial relation on ℚ_p | `1 ≤ᵥ p` holds there but fails in ℚ_p | excluded by `IsNonarchimedeanLocalField`, Check correct |
| same | `F/ℚ_q`, `q ≠ p`, with an abstract finite ℚ_p-structure | would be henselian for two inequivalent rank-one valuations ⇒ no such `F` | no counterexample |
| `isPrincipal_map_hilbertClassField` | ℚ; `I = ⊥`; ℚ(√−5) | `H = ℚ`; `⊥ ↦ ⊥`; `(1+i)² = 2i`, `𝔭₂² = (2)` ⇒ `𝔭₂O_H = (1+i)`, `N(1+i) = 4 = 2^{[H:K]}` | true |
| `ncard_…hilbertClassField…` | ℚ(√−5): `𝔭₂`, `𝔭₃ = (3, 1+√−5)`, `(3+2√−5)` | `𝔭₂, 𝔭₃` non-principal ⇒ `f = 2`, ncard `1 ≠ 2`; `29 = 3²+5·2²` principal ⇒ ncard `2` | iff holds both ways |
| `ncard_…rayClassField…` | `𝔪 = 4∞` over ℚ | `Cl_𝔪 = (ℤ/4)ˣ`, field ℚ(i); `5 ≡ 1`: ncard 2; `3`: ncard 1 | true; one-line proof (R03) |
| `relDiscr_eq_finprod_abelianConductor` | ℚ(ζ₅)/ℚ | cyclic `M`: ℚ (φ(1)=1, 𝔣=1), ℚ(√5) (φ(2)=1, 5), ℚ(ζ₅) (φ(4)=2, 5): `1·5·25 = 125 = 5³` | true |
| same | ℚ(ζ₈)/ℚ | ℚ, ℚ(i) 4, ℚ(√2) 8, ℚ(√−2) 8; ℚ(ζ₈) has group V₄ (not cyclic): `256 = 2⁸` | true |
| same, wrong models | drop `IsCyclic`; drop φ | ℚ(ζ₈) would add a factor `8^k ≠ 1`; ℚ(ζ₅) without φ gives `25 ≠ 125` | both restrictions needed |
| same | `L = K`; ℚ(√−3) | only `M = K`: `⊤ = ⊤`; `1·3 = 3 = |d|` | true |
| `eulerCharacteristic_mixed` | ℚ_p with ℤ/p (p odd); ℚ₂ with ℤ/2; ℚ_p with ℤ/ℓ, `ℓ ∤ p(p−1)`; ℚ₂ with μ₃ | `p² = p·1·p`; `8 = 2·2·2`; `ℓ = ℓ·1·1`; `3 = 1·3·1` | true |
| same, char p | 𝔽₂((t)) with 𝔽₂ | `H¹ = F/℘(F)` infinite (`t⁻¹, t⁻³, …`) | excluded (no ℚ_p-algebra structure) |
| `eulerCharacteristic_finrank_fp` | ℚ₂ with 𝔽₂; ℚ₂(i) with 𝔽₂ | `3 = 1+1+1`; `4 = 1+1+2`, matching `#F×/F×² = 16` | true |
| `cyclotomicCharacter_artinMap` | ℚ₂, `u = −3` on μ₁₆; ℚ₂(i), `u = i` | `13⁻¹ ≡ 5 mod 16` (13 without the inverse); `N(i) = 1` | the inverse is required |
| arithmetic Frobenius | ℚ₂(ζ₅) | `ord₅2 = 4`; `Art(2): ζ ↦ ζ²`; geometric `ζ³` (`2·3 ≡ 1`); `Art(8) = Frob³: ζ ↦ ζ³` | Checks discriminate |
| `kummerClass`, `kummerEquiv_mixed`, `h2MuEquivZMod_mixed`, `localSymbol` | ℚ₂, ℚ₃ | `κ(4) = 0`; `κ(−1) ≠ 0`, cocycle `g(i)/i = −1`; `#ℚ₂×/ℚ₂×² = 8`, `#ℚ₃×/ℚ₃×² = 4`; `#Br[n] = n`; `(−1,−1)₂ = −1`, `(5,−1)₂ = 1` | true |
| §2.3 indices | `[U:V]=4, [U:U']=2, [V:V']=3` | res `2·¼ = ½ = 1/[U':V]`; cor keeps `½ = 2·¼`; inf `¼ = 3·(1/12)` | true |
| Layer 0 | `C₂` on ℂˣ; trivial ℤ/2 | `H² = ℝˣ/ℝ>0`, order 2; `Ĥ⁻¹(C₂,ℤ) = 0 ≠ ℤ/2 = Ĥ¹(C₂,ℤ/2)` | true |
| Layer 8 | `(ℚ₂ˣ)²` | index 8, class field ℚ₂(i, √2, √5) of degree 8 | true |
| Layer 10 | ℚ(√13, √17) | `17 ≡ 2² mod 13`, `(13/17) = 1`; 2 inert in ℚ(√13), split in ℚ(√17): every decomposition group has order ≤ 2 | true |
| Layer 12 | `D₄ ×_{V₄} D₄` | order 16, commutator subgroup `{(1,1),(z,z)}` ⇒ abelianization of order 8 > 4 | true |
| Layer 12 | ℚ(∛2, ζ₃) | ramified at 2; maximal abelian subextension ℚ(√−3) has conductor `3·∞` | true |
| Layer 13 | 25 in ℚ(√13, √17) | at 5: `(13/5) = (17/5) = −1`, unramified, `v = 2`; at 2: unit, unramified | locally a norm everywhere, true |
| Layer 13 orders | ℤ[√−3]; ℤ[2i] | `h = 2·(1+½)/3 = 1`; `h = 2·1/2 = 1` | true |
| §5.6 transfer | C₄ → ⟨g²⟩; V₄ → H | `g ↦ g·g = g²`; `g ↦ 1`, `h ↦ h² = 1` | true |
| §5.7 | ℚ(√3) | `N(2+√3) = 1` ⇒ `h⁺ = 2`; the narrow field is ℚ(√−1, √−3) = ℚ(√3, i) | true |
| Layer 14 | `(3,7)`, `(−1,−1)` | ℤ/2 values `1, 1, 0, 0`; `1` at 2 and at ∞ | correct, but the README writes 1/2 (R06) |

**Sampled sources** (the seeded sample and every locator touching an open target):
- Layer 5 comparison: jahnke-koenigsmann line 113–115 (Theorem 2.1, p. 3) supports the statement as written: two independent ⇒ separably closed, and in rank one dependent ⇒ equivalent. Engler–Prestel and Schmidt are under Not verifiable.
- Cyclotomic normalization: milne-cft line 10073–10075 (VII Example 8.2, printed p. 221) gives `φ_ℓ(uℓ^s) = [u⁻¹]` on `ℚ(ζ_{ℓ^r})`, and the product check is on p. 222 (line 10085–10109). The README's reading is correct, including that this fixes the ℚ_p normalization only.
- Layer 13 open targets, all in milne-cft:
  - V Theorem 3.17, p. 161 (line 7252): every ideal becomes principal in the Hilbert class field.
  - V Theorem 3.27, p. 165 (line 7423), disc = `∏_χ f₀(χ)`, and Remark 3.28 (line 7436), `f(χ) = f(L^{ker χ}/K)`. The grouping by cyclic `M` with exponent φ follows from these.
  - V §1, p. 154 (line 6865): split completely ⇔ trivial Frobenius.
  - V Theorem 3.6, p. 158 (line 7051).
  - V Example 3.9, p. 159 (line 7092): the Hilbert class field is the ray class field of modulus 1, as in Tau Ceti's `hilbertClassField`.
- Other locators checked:
  - milne-cft II Theorem 3.11, p. 84 (line 3911) and Remark 3.12, p. 85 (line 3988); III Lemmas 2.3–2.6 (lines 4716–4751); VII Lemmas 9.1–9.4 and Theorem 9.5 (lines 10189–10287).
  - milne-adt I Corollary 2.3, p. 28 (line 1138) and Theorem 2.8, p. 31 (line 1227), where `χ = (R : mR)⁻¹ = p^{−[F:ℚ_p]v_p(m)}` matches README line 486.
  - kopp-lagarias Theorems 1.1–1.3, pp. 3–4 (lines 128–181); line 162–163 confirms that the ring class field is the modulus-`O`, no-real-place case.

**Library declarations opened at the pin.** Tau Ceti (paths under `TauCeti/`):
- `NumberTheory/ClassFieldTheory/Formation/`: `ClassFormation.lean:94–113` (the seven fields match §2.2), `ArtinMap.lean:139` (`artinEquiv = (nakayamaNegTwo L).symm`), `PrincipalIdeal.lean:67`.
- `NumberTheory/ClassFieldTheory/Local/`: `GeometricArtinMap.lean:68`, `Cyclotomic.lean:205`, `ExplicitCyclotomicSymbol/ArtinMap.lean:311` (requires `ValuativeExtension ℚ_[p] F`), `EulerCharacteristic/Theorem.lean:98, 110`, `Conductor/UpperNumbering.lean:64, 121, 130`.
- `NumberTheory/ClassFieldTheory/ClassFields/`: `RayClassField.lean:123, 157, 167, 209, 218, 241, 262, 299, 362`; `RingClass/Field.lean:98, 111`; `RingClass/Quotient.lean:144`.
- `NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/`: `Reciprocity.lean:257`; `Basic.lean:193` (`abelianConductor` needs no abelian hypothesis).
- Elsewhere: `RingTheory/DedekindDomain/Discriminant/Basic.lean:33` (`relDiscr` is the relative norm of the different); `NumberTheory/LocalField/Discriminant/Conductor.lean:58`; `NumberTheory/LocalField/AbsoluteRamificationIndex.lean:71, 85`; `NumberTheory/LocalField/FiniteExtension/Basic.lean:54`.
- `NumberTheory/LocalField/AlgebraicExtension/Basic.lean:130, 254, 277`. `algebraicExtensionValuation_isEquiv` assumes both restrictions are already compatible, so it does not prove `valuativeExtension_padic`. The target is genuinely open.

Mathlib (paths under `Mathlib/`):
- `RingTheory/Valuation/RankOne.lean:56`: `RankOne` extends `IsNontrivial`, as the README says.
- `RingTheory/Valuation/ValuativeRel/Basic.lean:1252` (`vle_iff_vle`).
- `NumberTheory/Padics/ValuativeRel.lean:34`.
- `Analysis/AbsoluteValue/Equivalence.lean:413`: needs nontrivial, pairwise inequivalent absolute values.
- `Analysis/Normed/Field/Krasner.lean:117`, `RingTheory/Henselian.lean:154`, `NumberTheory/Padics/Hensel.lean:460`.

There is no F. K. Schmidt theorem in either pinned library.

A script found that all 376 backticked names in the README resolve at the pins, except four, which are structure fields I confirmed at `ClassFormation.lean:95–113`.

**Cross-roadmap citations and ownership.**
- `GlobalNumberFields` Layers 2, 6, 8 and 11 match the contracts (`Completed/GlobalNumberFields/README.md:279, 439, 476, 571`).
- The 39 distinct `ClassFieldTheory.*` names used by QuadraticFormInvariants, GlobalQuadraticForms (main) and LocalGaloisGroups are all declared here.
- Eight other roadmaps link Layer 5, 6, 7, 10, 11, 12, 13 or 14 anchors, and all of those headings are kept. None of the eleven headings dropped since main is cited anywhere.
- No other roadmap owns F. K. Schmidt's theorem or the ℚ_p comparison, apart from the competing revisions (R05).
- AnalyticNumberTheoryPartI §2.2a owns the Artin-representation conductor–discriminant formula and consumes ClassFieldTheory Layer 13 for the abelian one, so supply runs in one direction. Main's ClassFieldTheory already planned the abelian formula.
- I checked LocalAnabelianGeometry's scope: it consumes this roadmap's names and owns none of its targets.
- The overlap report lists no dropped ids, and I confirmed none.

**Previous review of this pull request (b254b25), finding by finding.**

| Finding | Status at this head |
|---|---|
| R01, duality example | fixed (README:550–556) |
| R02, valuation comparison | fixed: now named and owned |
| R03, trivial layer | fixed (README:441–444) |
| R04, finiteness | fixed: `(n : F) ≠ 0` and the 𝔽₂((t)) example |
| R05, catalogue | quadratic tests and maximal-order comparison removed; catalogue remains (R02) |
| R06, roadmap import | fixed |
| R07, locators | Milne locators added; Schmidt remains (R04) |
| R08, hygiene | fixed |
| R09, residue | fixed |
| R10, outside-folder | remains (R01) |
| R11, merge order | remains (R05) |
| R12, anchors | fixed |

No repair report marks any finding as not actionable.

## Not verifiable

- **Engler–Prestel, *Valued Fields*, Theorem 4.4.1.** Paywalled; the sources service found no legal copy. It is corroborated only by the citation at jahnke-koenigsmann line 115.
- **F. K. Schmidt, *Mehrfach perfekte Körper*, Math. Ann. 108 (1933).** The sources service found no legal copy. OCR is unavailable on this worker.
- **Settled citations used only for material Tau Ceti already proves.** NSW (7.1.8), (7.2.5) and Serre's *Local Fields* are uncertified; Artin–Tate XIV is waived. They are cited by locator only.
- **Kopp–Lagarias, published version.** Its numbering could not be compared with arXiv v3; the README's numbers are v3's.
- **`Completed/LocalGaloisGroups/Suggested.lean` against this head.** Elaborating it needs the `Completed.ProfiniteProPGroups.Suggested` object file, which is not built, and building it is outside this review's permitted commands. Instead I checked by name that its 21 uses resolve and that the two forced call sites match the new signatures.

## Source issues

- none
