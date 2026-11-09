# Review of ClassFieldTheory (pull request #1215 at 7498694)

**Verdict:** needs changes

This is an incremental re-review of the 2 lines changed in this folder since f62eba2. The single change, which qualifies a Tau Ceti name in the Layer 7 route, is correct and resolves the remark of the previous review. The two previous findings are both about the pull-request description, which has not changed, so both are carried. Both are P3. Nothing inside the folder needs to change.

## R01 (P3) — The merge order against #617 and #1411 is still not stated

**Location.** The pull-request description, titled "ClassFieldTheory: correct hypotheses, conductors and lifting". It has no sentence about #617 or #1411.

**Claim.**
- Two other open pull requests change this roadmap's `README.md` and `Suggested.lean`, and both conflict with this head.
- #1411 states this head's absolute Layer 7 target under another name, and in the closure form that this head dropped.

**Witness.**
- `roadmaps overlaps ClassFieldTheory` (index of 2026-11-09) reports that #617 (head 066ccf5) and #1215 conflict in `TauCetiRoadmap/ClassFieldTheory/README.md` and `Suggested.lean`. It reports the same for #1411 (head 6819093, draft).
- At #1411's head, line 537 of `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` declares `theorem closure_map_artinMap_unitFiltration`.

**Repair.**
- State in the description that this pull request merges first.
- State that #617 and #1411 then rebase on it, keeping only the ClassFieldTheory edits that this head lacks.
- Nothing in the folder needs to change. README line 281 already maps #1411's `closure_map_artinMap_unitFiltration` to `map_artinMap_unitFiltration_eq_upper`, with the closure-free form.
- Test: the description names both pull requests and the order.

## R02 (P3) — The pull request edits `Completed/LocalGaloisGroups` without declaring it

**Location.** `Completed/LocalGaloisGroups/Suggested.lean` (62 insertions and 50 deletions against main, unchanged since f62eba2). For example, line 12 reads `import TauCetiRoadmap.ClassFieldTheory.Suggested`.

**Claim.**
- The pull request edits a Completed roadmap.
- The brief names only GlobalQuadraticForms and QuadraticFormInvariants as its other folders.
- The edit is needed, because the file imports this roadmap's `Suggested.lean`. It should be declared, not undone.

**Witness.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassFieldTheory' ':!TauCetiRoadmap/GlobalQuadraticForms' ':!TauCetiRoadmap/QuadraticFormInvariants'` still prints `Completed/LocalGaloisGroups/Suggested.lean | 112`.

**Repair.**
- Declare `Completed/LocalGaloisGroups` in the description as a folder of this pull request.
- Add one sentence saying what the edit does. It re-points that file from this roadmap's former declarations to Tau Ceti's names and to the open target `cyclotomicCharacter_artinMap`.
- Test: with that folder excluded as well, the command above prints nothing.

## Previous findings

- R01 — not repaired: the description is unchanged ("Correct the conductor minimum and the idele-layer lifting criterion …") and still states no order against #617 or #1411, both still open and conflicting. Carried as R01 above.
- R02 — not repaired: the description still does not declare `Completed/LocalGaloisGroups`, and the diff command above still lists it. Carried as R02 above.

## Verified sound

**The changed line (README line 1248, §7.1, route of `normResidue_map_unitFiltration`).**
- The line now reads "(`ClassFormation.artinMap_quotient` and the kernel of reciprocity)".
- At the Tau Ceti pin, `NumberTheory/ClassFieldTheory/Formation/ArtinMap.lean:475` declares `theorem artinMap_quotient {old new : NormalLayer G} (T : LayerRefinement old new) (a : F.level old.ground) : cf.artinMap old a = T.quotientHom (cf.artinMap new (T.groundEquiv F a))`. It sits in `namespace TauCeti.ClassFieldTheory.ClassFormation` (lines 115–491).
- The qualified form now agrees with the same bullet's *Needs:* line (1252) and with the supplier row (line 614).
- It resolves the remark of the previous review about the unqualified name at line 1248.
- The two other unqualified mentions (lines 131 and 980) sit inside Layer 4's list of `Formation/ArtinMap.lean` names, where the namespace is fixed by context.
- The other route inputs exist at the pin:
  - `Local/Reciprocity.lean:173` `normResidue_mk` and `:181` `normResidue_mk_eq_one_iff`;
  - `Local/Conductor/UpperNumbering.lean:64` `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot`;
  - `LocalField/Herbrand/UpperQuotient.lean:98` `map_restrictNormalHom_upperRamificationGroup`.
- Direction check: `old` is the smaller top field `F = L^H` and `new` is `L`. So `Art_{F/K}(a)` is the image of `Art_{L/K}(a)` under `Gal(L/K) → Gal(L/K)/H = Gal(F/K)`. Hence `Art_{L/K}(a) ∈ H` exactly when `Art_{F/K}(a) = 1`, which by the kernel of reciprocity happens exactly when `a ∈ N_{F/K}(Fˣ)`. This is the step the route claims. Normality of `H` comes from the abelian hypothesis on `L/K`.

**Gate, dependency check and elaboration.**
- I reran the gate with the brief's command. Every check inside the folder is 0. `outside-folder=5`, and all five hits are in GlobalQuadraticForms and QuadraticFormInvariants, which the brief names as this pull request's own. The worker's gate on this head, run with those folders declared, passes every check, including `build=0`.
- Dependency check (`--movable`): `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives six `declaration uses 'sorry'` warnings (lines 81, 97, 130, 145, 156, 170) and nothing else. `Suggested.lean` is unchanged since f62eba2.
- I ran `#check @` on all seven declarations (`cyclotomicCharacter_artinMap`, `normResidue_map_unitFiltration`, `localAbsoluteUpperRamificationGroup`, `map_artinMap_unitFiltration_eq_upper`, `isPrincipal_map_hilbertClassField`, `count_relDiscr_eq_finsum_abelianConductor_exponent`, `abelianConductor_eq_lcm`). The elaborated types are identical to those the previous review compared with the README. No binder is lost.

**Headline theorems.** The six sorried theorems and the one definition are unchanged. The previous reviews' one-tactic probes and padding verdicts carry over: none is padding. The Tau Ceti-proved headlines are named in the module docstring.

**Source sample.**
- Only 7.1 falls in the changed passage. The changed line adds no locator.
- I re-read serre1961 line 924 (printed p. 128) and lines 931–938 (Proposition 3 and the paragraph on passing to the limit). They support the inverse-limit construction cited at README line 1306.
- Neukirch V Theorem 6.2 and Serre, *Local Fields*, XV §2, cited by the bullet, are uncertified (see below). The statement is checked mathematically in the table.

**Cross-roadmap effects.**
- `roadmaps grep --fixed artinMap_quotient` finds no citation of this roadmap's line 1248 outside the folder. The hits at #1411's head (its README line 895 and `Suggested.lean` lines 101 and 222) are #1411's own text.
- The overlap facts are unchanged:
  - §2.5 and §2.6, cited by AnticyclotomicLocalUnits (README line 26 at its head) and EllipticCurveModularityWild3Adic (lines 44 and 77), are mapped at README lines 252–253 to C.5 (line 458) and C.6 (line 507).
  - No id this README cites is dropped by an open pull request.
- The out-of-folder `Completed/LocalGaloisGroups/Suggested.lean` is unchanged since f62eba2. It uses only `cyclotomicCharacter_artinMap`, whose elaborated type is unchanged.

**Adversarial table.** "Arithmetic" is the normalization `χ(Art u) = u⁻¹`. Rows marked "r38" are carried from PRREVIEW-ClassFieldTheory~38, and rows marked "r33" were carried there from PRREVIEW-ClassFieldTheory~33. All of them are for statements the diff leaves untouched.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Route of `normResidue_map_unitFiltration` through `ClassFormation.artinMap_quotient` (changed line 1248) | `ℚ₂(i)/ℚ₂` with `H = 1`, `n = 1, 2`; `ℚ₃(ζ₉)/ℚ₃` with `H = {±1}`, `F = ℚ₃(ζ₉+ζ₉⁻¹)`, `n = 1, 2`; `H = G` | `ℚ₂(i)`, `n=1`: `−1 ∈ U¹` maps to `σ`, so `Art(U¹) = G ⊄ 1`. `−1` is not a norm (`x²+y² = −1` has no solution in `ℚ₂`). `i_G(σ) = 2`, so `G^1 = G ≠ 1`. All three conditions fail. `n=2`: `U² = 1+4ℤ₂` consists of norms (`(u,−1)₂ = 1` for `u ≡ 1 mod 4`), `Art(U²) = 1` and `G² = 1`. All three hold. `ℚ₃(ζ₉)`, `n=1`: `Art(U¹) = {1,7,4}` (inverses mod 9), which is not in `{1,8}`. `4 ∉ N_F = ⟨3⟩·±(1+9ℤ₃)`. `(G/H)^1 = C₃ ≠ 1`. All three fail. `n=2`: `Art(U²) = 1 ≤ H`, `U² ⊆ N_F`, `G² = Gal(L/ℚ₃(ζ₉)) = 1`. All three hold. Equality at `n=1`: `Art(U¹) = {1,4,7} = G^1`. `H = G`: all trivially hold. | holds | none |
| `map_artinMap_unitFiltration_eq_upper` (r38) | `n=0`; `ℚ₉/ℚ₃`; `ℚ₂(i)`, `n=1,2`; `ℚ₃(ζ₉)`, `n=2`; `𝔽₂((t))`, `y²−y=t⁻¹`; closedness | `n=0` reduces to Tau Ceti's `map_artinMap_unitFiltration_zero`. `1 = 1` with `Art(3)` the Frobenius of order 2. `U¹ → G = G¹`, `U² → 1 = G²`. `1 = G² = 1` with `#G₂ = 3`. `C₂ = C₂`, `1 = 1`. Compact `U(K,n)` against the dense, non-surjective `Art(Kˣ)`. | holds | none |
| Layer 7 contract, depth-zero bullet (r38) | definitions at the pin | `inertiaSubgroup = Fix(K^ur)`, which equals `⋂_M res⁻¹ I(M/K)` | holds | none |
| Layer 7 Check, `μ₁₆` sign witness (r38) | `ℚ₂`, `u = −3, −1`; `ℚ₃`, `u = 4` | `(−3)⁻¹ ≡ 5 mod 16`, against `13` for the geometric convention. Both give `5` on `μ₈`. `4⁻¹ ≡ 7 mod 9` against `4`. | holds | none |
| Layer 7 Check, `n = 0` (r38) | `ℚ₉/ℚ₃` | `Art(U⁰) → 1` and `I → 1`. `Art(3)` has order 2. | holds | none |
| W.3 and W.5 (r38) | `μ₁₆`, `μ₈`; `ℚ(ζ₈)`, `ℚ(ζ₅)` | `5` against `13`; `5` against `5`. `3², 5², 7² ≡ 1 mod 8`. `2⁻¹ ≡ 3 mod 5`, giving `ζ₅²` against `ζ₅³`. | holds | none |
| `cyclotomicCharacter_artinMap` (r33) | `ℚ₃`, `u=4`, `μ₉`; `ℚ₂`, `u=−3`, `μ₁₆` | `7` against `4`; `5` against `13`. `v(1−p) = 0`, so `v(p) > 0`. | holds | none |
| `normResidue_map_unitFiltration` (r33) | `ℚ₃(ζ₉)`, `n=0,1,2`; `ℚ₂(i)`; unramified; `L=K`; `𝔽₂((t))` | Image orders `6,3,1` equal `#G⁰, #G¹, #G²`, while lower numbering gives `6,3,3`. `U¹ → G`, `U² → 1`. `U⁰ → 1 = G⁰`. `C₂` then `1`. | holds | none |
| `localAbsoluteUpperRamificationGroup` (r33) | `ℚ₂(ζ₈)`; `X³−5/ℚ₅`; `ℚ₅(ζ₅)`; `v=−1` | Depths 0–3: `{1,3,5,7}`, `{1,3,5,7}`, `{1,5}`, `{1}`. `S₃`, `C₃`, `1`. Orders 4 then 1. All of `G_K` at `v = −1`. | determines the object | none |
| `isPrincipal_map_hilbertClassField` (r33) | `ℚ`; `ℚ(√−5)`, `H = K(i)`; `I = ⊥` | `h = 1`. `𝔭² = (2) = ((1+i)²)`, so `𝔭𝒪_H = (1+i)`. `⊥ ↦ ⊥`. | holds | none |
| `count_relDiscr_eq_finsum…` (r33) | `ℚ(i)`, `ℚ(ζ₈)`, `ℚ(ζ₅)`, `ℚ(ζ₉)`, `L=K` | `2 = 0+2`; `8 = 0+2+3+3`; `3 = 0+1+1+1`; `9 = 0+1+2·4`; `0 = 0` | holds | none |
| `abelianConductor_eq_lcm` (r33) | `ℚ(ζ₈)`, `ℚ(√2)`, product/lcm swap | Maximum 3, giving `(8)·∞`. `(8)` with no `∞`. The swap gives 8 against 3. | holds | none |
| 0.1, 2.1, 4.1 (r33) | `ℤ[C₂]`; cyclic degrees 4 and 8; `V₄` | `Ĥ⁰ = 0` against `ℤ/2`. Invariant `1/4`, restriction `1/2`, inflation `2/8`. Three symbols. | holds | none |
| 5.1, 6.1 (r33) | `ℚ₂` with `𝔽₂`, `𝔽₃`; `ℚ₇`, `μ₃`; `ℚ₂(ζ₅)`; `𝔽₂((t))` | `8 = 2·2·2`, `3 = 3·1·1`. `1/3` against `2/3`. `ζ₅²` against `ζ₅³`. `cd₂ = 1`. | holds | none |
| 7.1 conductors (r33) | `ℚ₂(√2)`, `ℚ₂(ζ₁₂)`, `ℚ_p(μ_p)`, `ℚ₃(ζ₉)` | `f = 3 = δ`. `0+0+2+2 = 4 = f·d`. Sum `p−2`, maximum 1. `12−3 = 9`. | holds | none |
| 8.1, 9.1 (r33) | `ℚ₂`, `n=1`; `ℚ₂(i)`; unramified quadratic | Conductor 0 for `U¹⟨2⟩`. Index 2. `deg_K = 2·deg_L`. | holds | none |
| 10.1, 12.1 (r33) | `ℚ(√13,√17)`; `(−1,−1)/ℚ`; `ℚ(ζ₃)`, `p=3` | lcm 2 against degree 4. `½+½ = 0`. `9 = 3^{1+1}`. | holds | none |
| 13.1, 14.1 (r33) | `ℤ+2ℤ[i]`; `p=3`, `q=7` | `h = 2/(1·2) = 1`. `1·(−1) = −1 = (−1)³`. | holds | none |

## Not verifiable

These sources are recorded as uncertified or waived in the manifest, so each is cited by locator only and I did not open it:
- serre-local-fields: XV §2, cited by the changed bullet; also IV §§1–3 and XIV §3.
- neukirch-ant: V Theorem 6.2, cited by the changed bullet.
- nsw.
- artin-tate.

Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps overlaps`. The changed line introduces no new owned object.

## Source issues

- none
