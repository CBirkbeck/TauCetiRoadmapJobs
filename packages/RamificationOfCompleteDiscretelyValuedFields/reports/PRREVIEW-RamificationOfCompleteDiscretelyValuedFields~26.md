# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 810f37f)

**Verdict:** needs changes

This is a full review of the folder. The folder has not changed since the previous review, which read the same head. That review's only finding concerned the pull-request description, and it is repaired. One new P3 finding remains, in the README; nothing blocks.

## Previous findings

- **R01 (description): repaired.** The description now reads as follows.
  - *Merge order*: "ClassFieldTheory's Layer 7, as revised by #1411 or #1215, defines the absolute upper filtration … whichever of the two merges first precedes this pull request, and ClassFieldTheory takes no input from this roadmap."
  - *Dependencies*: it no longer lists ProfiniteCohomology or §F.3a.
  - *Why*: it no longer mentions #1411 or #879.
  - *Roadmap-summary block*: "On a nonarchimedean local field its absolute upper filtration agrees with ClassFieldTheory Layer 7's."

  One cosmetic slip, outside the folder and not counted as a finding: the *Summary* sentence now begins "On a nonarchimedean local field On a nonarchimedean local field".

## R01 (P3) — The `Breve E` agreement omits the valuative-extension input that its cited criterion needs

**Location.** `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md`, §4a.3, **Agreement with `Breve E` on a local field**:
- the proof, lines 1262–1266: "With the local-field structure that the completed roadmap puts on a finite intermediate field (`TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`), Tau Ceti's `IntermediateField.le_maximalUnramifiedExtension_iff` says …";
- the *Needs* line, lines 1273–1275, which lists only `TauCeti.finiteIntermediateField_isNonarchimedeanLocalField` and `TauCeti.maximalUnramifiedExtension` from the completed roadmap.

**Claim.** The route applies `IntermediateField.le_maximalUnramifiedExtension_iff` to a finite subextension `E′` of `AlgebraicClosure E`. That theorem also takes `[ValuativeExtension E E′]`. The proof and the *Needs* line supply only the local-field structure, so the step does not apply as written.

**Witness.** Pinned `Unramified/Maximal.lean` lines 298–300 bind `[ValuativeExtension K E]`. A scratch file with the three local-field instances but not `finiteIntermediateField_valuativeExtension` fails: "failed to synthesize `ValuativeExtension K ↥M`". §4a.1 lists both (lines 1003–1004, 1028–1029).

**Repair.**
- In the proof parenthesis at line 1264, write "(`TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`, with `TauCeti.finiteIntermediateField_valuativeExtension` for the valuative extension over `E`)".
- Add `TauCeti.finiteIntermediateField_valuativeExtension` to the *Needs* line at line 1274.

**Tested.** On the same scratch file, adding `finiteIntermediateField_valuativeExtension K (AlgebraicClosure K) M` makes the call elaborate with no error. The file uses a finite `M ≤ AlgebraicClosure K` over a nonarchimedean local field `K`, for example `M = ℚ_p(ζ_(p²−1))` over `ℚ_p`.

## Verified sound

### Mechanical checks at this head

- **Gate, re-run.** All counters are 0 and the run ends "OK", exit 0: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0`.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check.** Output:

  ```text
  depcheck: 239 roadmaps, 2323 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
  - The roadmap is line 2 of the merge order, after JacobianChallenge.
  - Its suppliers are on main: the completed LocalFieldsRamification and ProfiniteProPGroups, ReductiveGroups Layer 3 (README line 234), SchemeAndStackFoundations §0.24 (line 1565), AdicSpacesPartII R0.19.9 (line 292) and ReductiveGroupsPartII §RG2.0.4 (line 852).
  - Its consumers come later in the order: PadicPeriodRings (21), ArithmeticGaloisRepresentations (58) and PadicExtensionFamilies (396).
- **Elaboration.** `lake env lean` on a copy of `Suggested.lean`, with `#check @` of all 13 declarations, exits 0. The only messages are nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
  - Each elaborated type carries every binder its README statement needs. For example, `[IsLocalRing (FixedPoints.subalgebra A B H)]` is present at lines 118 and 137, and `hO'` and `hLM` at lines 300–301.
  - The types match `signatures.md` binder for binder. No section variables are used, so none can drop.
- **Padding probe.** Every `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | (exact?)`. All nine failed: seven with "`exact?` could not close the goal", and `herbrandFun_tower` and `topologicalClosure_iSup_absoluteUpperRamificationGroup` with heartbeat timeouts. No declaration restates a definition, mirrors a Check or computes a value.
- **Library names.** The resolver on this host did not check Mathlib or Tau Ceti names, so I did. I ran `#check @` on all 106 backticked library names of the README against the pinned Mathlib and the Tau Ceti modules that declare them, and all elaborate. `TauCeti.LocalFieldsRamification.hasseArf` is in `Herbrand/HasseArf/Abelian.lean`, line 50.
- **Headline theorems.** The README's headlines are:
  - Hilbert's formula;
  - the Herbrand functions and the upper numbering;
  - Herbrand's quotient theorem and tower transitivity;
  - Hasse–Arf;
  - the absolute upper filtration with its terms at `0` and `0+` and its finite projections;
  - the finite-level and open-subgroup identities;
  - completed unramified base change.

  All but the last are stated in `Suggested.lean`. Base change (§4a.3) and the proalgebraic prerequisites are named in the docstring as not statable, with what is missing (lines 37–44). The pins have only a local-field `TauCeti.maximalUnramifiedExtension` (`Unramified/Maximal.lean` line 97). The general Hilbert formula and the local-ring Herbrand functions are absent from the pins: only the local-field versions exist, at `Different/Hilbert.lean` line 93 and `Herbrand/Basic.lean` lines 251–421. So this roadmap owns them.
- **Policy.** The README has no hits for process words, pull-request numbers, LaTeX delimiters or `lemma`. Every layer ends with `### Examples` and `### Dependencies`. Every definition has at least three Checks:

  | Section | Checks |
  |---|---|
  | §3a.1 | 5 |
  | §3a.2 | 8 |
  | §3a.3 | 6 |
  | residue enlargement | 3 |
  | proalgebraic units | 3 |
  | graded norms | 3 |
  | §4a.1 | 10 |
  | §4a.2 | 5 |
  | §4a.3 | 3 |
  | `Breve E` | 3 |
  | package | 3 |

### Seeded sample, read at its locators

- **The perfect-residue Herbrand package.**
  - Serre 1961 n° 3.1 starts at serre1961 line 856, printed p. 126. Its formula (5) and properties a–d′ are at lines 903–926, printed pp. 127–128. Property d′ (integrality of `ψ(n)`) is proved there by the Lagrange argument.
  - n° 3.4–3.5 are at lines 1091–1246, printed pp. 132–136.
  - Brinon–Conrad Exercise 1.4.4(3) is at brinon-conrad line 382, printed p. 10.
  - All three Checks were recomputed: rows 44–46.
- **Residue enlargement and preservation of ramification.** EGA III, Chapitre 0, (10.3.1) is at ega3 lines 636–732, printed pp. 20–23. It constructs a flat local `B` with `𝔪_A B = 𝔪_B` and prescribed residue field.
  - (10.3.1.5), `gr(A) ⊗ K ≅ gr(B)`, is at line 734.
  - The completion remark is at lines 735–737.
  - So `B` is regular of dimension 1, a DVR with the same uniformizer, as the target says.
- **Proalgebraic units and norm-kernel components.** Serre 1961 is the main source.
  - §1, n° 1.1–1.6 is at lines 81–330, printed pp. 106–113.
  - n° 2.1 is at line 557 and fixes a coefficient field in residue characteristic zero, as the target does.
  - Proposition 2 and its corollary are at lines 607–621, printed p. 119.
  - Proposition 3, `V⁰ = I·U_L`, and its corollary `π₀(V) ≅ g/g′` are at lines 630–638, printed p. 120.

  Serre 1960 supplies the group theory. Printed page = pdf page + 1:
  - n° 1.2 Definition 2 is at line 162, p. 8;
  - n° 1.4 Proposition 10 is at line 313, p. 11;
  - n° 2.4 Propositions 6–7 are at lines 546 and 575, pp. 17–18;
  - n° 2.5 Proposition 10 with Corollaries 1–2 is at lines 625–634, p. 19;
  - n° 5.1 Propositions 1–2 are at lines 1246–1261, p. 35, including right exactness of `π₀` and its commutation with limits.
- **Graded norms and filtered norm-kernel components.** All in Serre 1961:
  - Proposition 6(a)–(b) and sequence (20) are at lines 1092–1099, printed p. 132;
  - Proposition 7, sequence (23), with Corollaries 1–3, is at lines 1152–1184, printed pp. 134–135;
  - Proposition 8(i)–(iii) is at lines 1187–1192, printed p. 135. Its proof of (i) uses the proalgebraic target, `π₀(V) ≅ g` for abelian `g`, as the README orders them.
- **Agreement with `Breve E` on a local field.**
  - Brinon–Conrad Exercise 1.4.4(2)–(3) is at lines 378–386, printed p. 10. It is stated for `p`-adic fields, hence mixed characteristic, as the README says.
  - ReductiveGroupsPartII §RG2.0.4 on main (line 852) defines `Breve E` as the uniform completion of `TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)`.
  - `IntermediateField.le_maximalUnramifiedExtension_iff` is at `Unramified/Maximal.lean` line 298, with `IsUnramified` at `Unramified/Basic.lean` line 115: `e = 1` and a separable residue extension.
  - The *Needs* gap is R01.
- **Also read.** Brinon–Conrad Lemma 13.1.6 is at line 8585, printed p. 201; its proof replaces `K` by `K̂^un`, as §4a.3 cites.

### Adversarial table

Notation:
- `Z8 = ℚ_2(ζ_8)/ℚ_2`, with `G_0 = G_1 = G`, `G_2 = G_3 = {1, 5}`, `G_4 = 1`;
- `Z9 = ℚ_3(ζ_9)/ℚ_3`, with `#G_0 = 6`, `G_1 = G_2 = {1, 4, 7}`, `G_3 = 1`;
- `Z24 = ℚ_2(ζ_24)/ℚ_2`, with `G ≅ (ℤ/8)ˣ × C_2`, `f = 2`, and `G_i` for `i ≥ 0` those of `Z8`;
- `S3 = ℚ_3(ζ_3, ∛3)/ℚ_3`, with `G_0 = S_3`, `G_1 = G_2 = G_3 = C_3`, `G_4 = 1`;
- `T = ℚ_2(ζ_3, ∛2)/ℚ_2`, with `G = S_3`, `G_0 = C_3`, `G_1 = 1`, `e = 3`, `f = 2`;
- `BQ = ℚ_p(ζ_(p²−1), √p)/ℚ_p`, with `p` odd;
- `INS`: `z^p − t^(p−1)z = s` over `F_p(s)((t))`;
- `CPP`: the `C_p × C_p` field of the §3a.1 monogenicity Check;
- `I2`: the `F_2(s)((t))` field of the §3a.2 Check;
- `AS`: `y^p − y = t⁻¹`;
- `W = Frac W(F̄_p)`.

Every row was computed in this round.

| # | Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `Σ = 5 + 2 + 2 = 9`; `v_3(disc ℚ(ζ_9)) = 9` with `f = 1` | agrees | none |
| 2 | Hilbert | `T` | `Σ = 3 − 1 = 2`; tame, so `d = e − 1 = 2`; `[L:K] = 6 = 3·2` | agrees | none |
| 3 | Hilbert | `Z24` | `Σ = 3 + 3 + 1 + 1 = 8`; unramified base change of `Z8` keeps `d = 8` | agrees | none |
| 4 | Hilbert, `G = 1` | `B = A` | `differentIdeal = ⊤ = 𝔪^0`; `Σ = 0` | no junk | none |
| 5 | Hilbert, separability dropped | `CPP` | `G_0 = G`, `G_1 = 1`, so `Σ = p² − 1`; `d = d(L/L₁) + d(L₁/K) = (p − 1) + (p − 1)`; at `p = 2`, `3 ≠ 2` | hypothesis needed | none |
| 6 | Hilbert, inseparable but monogenic | `INS` | `B = A[z]`, `f′(z) = −t^(p−1)`, `d = p − 1 = #G_0 − 1` | holds here; row 5 separates | none |
| 7 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 8/4 = 2`, `φ(5) = 10/4`, `φ(7) = 12/4 = 3` | matches Serre 1961 (5) | none |
| 8 | `herbrandFun` below `−1` | unramified quadratic | integrand `2` on `(−2, −1]`: `φ(−2) = −3`, `ψ(−2) = −3/2` | Check correct | none |
| 9 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1`; integrand `≥ 1/#G_0 > 0`, so `sInf` is `φ⁻¹(v)` | agrees | none |
| 10 | `ψ(n) ∈ ℕ` (README 576) | `S3` | `ψ = 2v` on `[0, 3/2]` and `6v − 6` after: `ψ(1) = 2`, `ψ(2) = 6` | integers, as d′ | none |
| 11 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1`, but lower `G_3 = {1, 5}` | wrong model excluded | none |
| 12 | Herbrand (Lean 111) | `Z24`, `H` the unramified `C_2`, `v = 3/2` | `ψ(3/2) = 2`: image of `G_2` is `{1, 5}` = `(G/H)^(3/2)` of `Z8` | agrees | none |
| 13 | Herbrand | `Z24`, `H = G_0`, `v = 0` | image of `G_0` is `1`; `(G/H)^0 = (G/H)_0 = 1`, since the quotient is unramified | agrees | none |
| 14 | Herbrand | `S3`, `H = C_3`, `v = 1` | `G^1 = G_2 = C_3 ↦ 1`; `(G/H)^1 = (G/H)_1 = 1` (tame quadratic) | agrees | none |
| 15 | Herbrand, separability dropped | `I2`, `v = 1/2` | `(G/H)^(1/2) = 1`, but `G^(1/2)H/H = G/H` | hypothesis needed | none |
| 16 | tower (Lean 130) | `S3`, `H = C_3`, `u = 5` | `φ_G(5) = 11/6`; `φ_H(5) = 11/3`; `φ_(G/H)(11/3) = 11/6` | agrees | none |
| 17 | tower | `Z24`, `H` unramified, `u = 5` | `φ_G(5) = 10/4`; `φ_H = id` on `[−1, ∞)`; `φ_(G/H)(5) = 10/4` | agrees | none |
| 18 | tower, separability dropped | `I2`, `u = 1` | `φ_M(1) = 1`, but `φ_(L₁)(φ_(M/L₁)(1)) = 1/2` | hypothesis needed | none |
| 19 | Hasse–Arf (Lean 151) | `Z24` | `j = 1`: `4 ∣ 4`; `j = 3`: `4 ∣ 8` | agrees | none |
| 20 | Hasse–Arf | `Z9` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 6` | agrees | none |
| 21 | Hasse–Arf, infinite residue field | `AS` over `F̄_p((t))` | `j = 1`: `p ∣ p` | agrees | none |
| 22 | Hasse–Arf, commutativity dropped | `S3` | `j = 3`: `6 ∤ 9` | hypothesis needed | none |
| 23 | Hasse–Arf, negative Check | abstract `C_9` filtration | `9 ∤ 9 + 4·3 = 21`; the subgroup and the quotient have breaks `5` and `1` | Check consistent | none |
| 24 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 3/2, 3` | `ψ = 1, 2, 7`: `G`, `{1, 5}`, `1` | agrees | none |
| 25 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | every `O ∩ M = M`, `G_0 = 1`, LHS `1`; inertia of `O` is the kernel of `σ ↦ σ` on `K̄`, which is `1` | agrees | none |
| 26 | `_zero` | `K = ℚ`, `O` over `ℤ_(5)`, `M = ℚ(i)` | `D_M = 1`; both sides restrict trivially to `ℚ(i)` | agrees | none |
| 27 | `_zero` | `ℚ_p` Frobenius lift; `W` | the lift acts by `x ↦ x^p` on `F̄_p`, so it is in neither side; for `W`, `G_K^0 = G_K = I_K` | agrees | none |
| 28 | projections (Lean 215) | `AS` over `F̄_p((t))`, `u = 1, 3/2` | `ψ(1) = 1`: `C_p`; `ψ(3/2) = 1 + p/2`, so `G_⌈ψ⌉ = 1` | agrees | none |
| 29 | projections, `u ∈ [−1, 0)` | `Z24`, `u = −1/2` | `⌈−1/2⌉ = 0`: `G_0` of order `4`, the image of `I_K` | agrees | none |
| 30 | projections, perfectness dropped | `I2`, `u = 1/2` | image of order `≤ 2`, but `Gal(M/K)^(1/2) = G_1` has order `4` | hypothesis needed | none |
| 31 | `0+` (Lean 239) | `W`, `K(ζ_p)` | `P_K ↦ G_1 = 1`; `I_K ↦ C_(p−1)` | strict inclusion | none |
| 32 | `0+` | `ℚ_3`, `Z9` | `P_K ↦ {1, 4, 7}`; `I_K ↦ (ℤ/9)ˣ`, of order `6` | separates | none |
| 33 | subgroup identity (Lean 263) | `T`, `H = ⟨(12)⟩`, `u = −1, 0, 1/2` | `H = H^(−1)`; `C_3 ∩ H = 1 = H^0`; `ψ_G(1/2) = 3/2` gives `G_2 ∩ H = 1 = H^(3/2)` | agrees | none |
| 34 | subgroup identity | `S3`, `H = ⟨(12)⟩`, `u = 1` | `G_2 ∩ H = 1`; `φ_H(2) = 1`, `H^1 = H_2 = 1` | agrees | none |
| 35 | subgroup identity, trivial action | `G` acting trivially on a field | every `G_i = G`, `φ = id`: `G ∩ H = H = H^u` | no junk | none |
| 36 | open subgroups (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ_(M/K)(1) = 2`: `H = H^2`; `ψ_(M/K)(3/2) = 5`: `1 = H_5 = H^3` | agrees | none |
| 37 | open subgroups | `T`, `L = ℚ_2(∛2)`, `u = 1/2` | `ψ_(L/K) = 3u` gives `3/2`; `G^(1/2) ∩ H = 1 = H^(3/2)` (`H_0 = 1`) | agrees | none |
| 38 | open subgroups, `hO'` dropped | `W`, `O′ = AlgebraicClosure L`, `u = 0` | LHS `G_L`; RHS `G_L^0 = 1` | hypothesis needed | none |
| 39 | integral formula (README 1113) | `S3` with `L = ℚ_3(∛3)`; `BQ` with `ℚ_p(√p)`; unramified quadratic | slopes `1` then `3`; `[G:H] = 2`, `f = 1`, so `2u`; `(1/2)·2 = 1`, so `ψ = u` | agrees | none |
| 40 | integral-formula derivation (README 1140–1142) | `S3`, `t ∈ (0, 3/2)` | `[G^0 : G^t]·#H^ψ/#H^0 = 2·1/2 = 1 = [G : C_3H]/f` | agrees | none |
| 41 | §3a.1 Check | `BQ` | `#G_0 = 2 = e`; `e(L/K_0) = 2`, `e(K_0/ℚ_p) = 1`, `f(L/K_0) = 1`; for `⟨σ⟩`, `e = 2` and `G_0 ⊄ H` | agrees | none |
| 42 | §3a.1 Check | `INS` | `#G_0 = p ≠ e = 1`; `G/G_0 = 1`, of order `≠ f = p` | agrees | none |
| 43 | §3a.2 Check, order of composition | `Z8 ⊃ ℚ_2(√2)`, `u = 3` | `ψ_(L/K)(3) = 4`, `ψ_(M/L)(4) = 7 = ψ_(M/K)(3)`; reversed order gives `8` | agrees | none |
| 44 | sample: package | `AS` | `d = 2(p − 1)`, break `1` | agrees | none |
| 45 | sample: package | `W(ζ_p)` | `d = p − 2`, break `0` | agrees | none |
| 46 | sample: package | `Z8` | lower `1, 3` and upper `φ(1) = 1`, `φ(3) = 2` | agrees | none |
| 47 | sample: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_p((t))(t^(1/e))` with `e ∣ p − 1`; `F_(p²)((t))` | `t` stays a uniformizer; `G_0 = C_e`, `G_1 = 1` kept; the quadratic splits | agrees | none |
| 48 | sample: proalgebraic units | `E = F`; `AS`; `κ((t))` | `V = 1`; `π₀(V) ≅ C_p = H/[H, H]`; graded pieces `κˣ` and `(κ, +)` are connected | agrees with serre1961 lines 630–638 | none |
| 49 | sample: graded norms | `AS` | `N(1 + λy⁻¹) = 1 + (λ^p − λ)t`; kernel `F_p ∋ −1`, the graded character of the generator | agrees | none |
| 50 | sample: graded norms | tame `C_e`; `F_3` | depth-0 kernel `μ_e`; on `F_3`, `λ³ − 2λ = −λ`, kernel `{0, ±√2}` in `F̄_3` | agrees | none |
| 51 | sample: `Breve E` | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; `F̄_q((t)) ≠ ⋃ F_(q^n)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |
| 52 | `Breve E` route | scratch Lean, finite `M ≤ AlgebraicClosure K` | `le_maximalUnramifiedExtension_iff` with the local-field structure only: "failed to synthesize `ValuativeExtension K ↥M`"; with `finiteIntermediateField_valuativeExtension` added, it elaborates | input missing | R01 |
| 53 | Conventions, imperfect residue field (README 166) | `F_p(s)((t))` | `s^(1/p)` and `(s + t)^(1/p)` each have `e = 1`, `f = p`; their difference `t^(1/p)` has `e = p` | agrees | none |
| 54 | ProfiniteProPGroups contract (README 344) | `p = 0` | `g^(0^1) = g^0 = 1`, so `IsPGroup 0` always holds; `P_K = 1` is stated separately | agrees | none |

### Library declarations opened at the pins

- **Mathlib.**
  - `FieldTheory/AbsoluteGaloisGroup.lean` line 59: `mapOfAlgebra`, restriction along `Algebra (AlgebraicClosure K) (AlgebraicClosure L)` with only `IsScalarTower K`.
  - `RingTheory/Valuation/RamificationGroup.lean`: line 28 (`decompositionSubgroup`, a stabilizer), line 39 (the action) and line 49 (`inertiaSubgroup`, the kernel on the residue field).
  - `RingTheory/DedekindDomain/Different.lean` line 481.
  - `RingTheory/RamificationInertia/Basic.lean` line 82.
  - `RingTheory/Invariant/Basic.lean` lines 365 and 391.
- **Tau Ceti.**
  - `RingTheory/LocalRing/RamificationGroup.lean`: line 118 (`G_i` is `Ideal.inertia` of `𝔪^((i+1).toNat)`, which is `⊤` for `i ≤ −1`), line 722 (`ramificationGroupReal = G_⌈u⌉`) and line 750.
  - `RingTheory/DiscreteValuationRing/Monogenic.lean` line 70, which assumes separable residue extension.
  - `NumberTheory/LocalField/RamificationGroup.lean` line 86.
  - `Unramified/Maximal.lean` lines 97 and 298.
  - `Unramified/Basic.lean` line 115.
  - `FiniteExtension/IntermediateField.lean` lines 81 and 97.
  - `Herbrand/HasseArf/Abelian.lean` line 50.
  - `Different/Hilbert.lean` line 93.
  - `Eisenstein/TotallyRamified.lean` lines 65 and 119. These are local-field only, so the README's Serre I §6 citation for the Eisenstein minimal polynomial over a general complete DVR is right.
  - `Topology/Algebra/Group/Profinite/ProP/Basic.lean` line 68.
- **The other names.** The remaining backticked names were checked by `#check @`, as above.

### Cross-roadmap citations and ownership

- **ClassFieldTheory.**
  - On main, `ClassFieldTheory/README.md` has no absolute upper filtration, so the attribution of the local-field filtration to Layer 7 rests on #1215 and #1411.
  - At #1215 (`2ed7ba0`, checkout), lines 190–194 say that Layer 7 owns it on local fields, that §4a.1 owns the valuation-subring filtration, and that "No result from that generalization is an input here".
  - At #1411 (`cded4a2`), README lines 137–144 and 2314–2317 say the same.
  - This agrees with README lines 122–130. The description's merge-order paragraph names both revisions.
  - ReductiveGroupsPartII (its README line 377) and SchemeAndStackFoundations (its README line 128) consume ClassFieldTheory on main, as README line 125 says.
- **LocalFieldsRamification at #617 (`81e13ac`).** Its line 39 assigns Hasse–Arf over complete discretely valued fields to §3a.3. There is no second owner.
- **Consumers at their heads.** All of them cite §§3a–4a without restating them:
  - PadicPeriodRings (#940);
  - ArithmeticGaloisRepresentations (#856);
  - PadicExtensionFamilies (#1713, checkout), whose README line 296 cites `subgroupOf_upperRamificationGroup`;
  - FilteredLocalGaloisGroups (#1795), README lines 51–53 and 137;
  - FieldOfNorms (#1812), README lines 69–71 and 158.

  The last two name this roadmap in words, so `roadmaps grep` on the CamelCase name misses them.
- **Overlaps and citations.** `roadmaps overlaps` reports no pull request changing this folder, no dropped id and no id defined only by a revision. `roadmaps resolve` reports nothing unresolved.
- **Declared gaps.** There are none: the folder has no `design/plan.json`.

## Not verifiable

- **`serre-local-fields`** is settled as uncertified. Its locators are cited without the text: I §6 Proposition 18; II §2 Proposition 3; III §6 Proposition 12; IV §1 Propositions 1, 2 and 4; IV §3 Propositions 14–15 and Exercise 3; V §7 Theorem 1.
- **Pull requests without a checkout.** #1411, #856, #940, #1795, #1812 and #617 were read at their indexed heads through `roadmaps show` and `roadmaps grep`. #1215 and #1713 were read from their checkouts.

## Source issues

- none
