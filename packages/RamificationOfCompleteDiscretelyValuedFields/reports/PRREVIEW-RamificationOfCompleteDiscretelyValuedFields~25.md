# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 810f37f)

**Verdict:** needs changes

This is an incremental re-review of the 121 lines that changed since e81ddb8. All of them are in `README.md`; `Suggested.lean` has not changed. The README repair is correct: previous finding R02 is repaired and the repair introduces no new problem. One P3 finding remains and nothing blocks. That finding is the previous R01, which concerns only the pull-request description, and the description has not changed.

## R01 (P3) — The description still reverses the ClassFieldTheory order and lists suppliers and a consumer the README does not have

**Location.** The pull-request description, which is unchanged since the previous review:
- *Merge order*: "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411";
- *Why*: "the ClassFieldTheory amendment #1411 consumes the absolute upper filtration" and "(#879)";
- *Dependencies*: "ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)";
- roadmap-summary block: "ClassFieldTheory needs the absolute upper filtration for reciprocity–filtration compatibilities";
- **Summary**: "every object restricts to the completed roadmap's".

**Claim.**
- README lines 122–127 attribute the local-field absolute upper filtration to ClassFieldTheory Layer 7, which "precedes this roadmap … takes no input from this roadmap". On main (41f2872), ClassFieldTheory Layer 7 (its README line 1312) is the absolute local Artin map and has no upper filtration. Only the open revisions #1215 and #1411 define one. So that revision precedes this pull request, and the description should name it in that direction.
- README line 108 says the roadmap "consumes nothing from that section" (§F.3a), and the README never names ProfiniteCohomology.
- #879 does not cite this roadmap.
- README lines 16–21 say that only some of the local-field objects are the completed roadmap's.

**Witness.**
- `ClassFieldTheory/README.md` at #1411 (0333060), lines 143 and 2311: "`RamificationOfCompleteDiscretelyValuedFields` §4a.1 consumes Layer 7's absolute upper ramification groups".
- At #1215 (024927f), line 187: "Layer 7 owns the absolute upper filtration on every nonarchimedean local field".
- `grep -c ProfiniteCohomology README.md` returns 0. #879 (9856719) mentions this roadmap only as "PadicPeriodRings §0.3", at its lines 183 and 8893.

**Repair** (description only; the README needs no change):
- **Merge order.** Replace the text with: "ClassFieldTheory's Layer 7, as revised by #1411 or #1215, defines the absolute upper filtration of a nonarchimedean local field that this README attributes to it. Whichever of the two merges first precedes this pull request, and ClassFieldTheory takes no input from this roadmap. #940, #856, #1713, #1795 and #1812 cite §§3a–4a and merge after it."
- **Why.** Delete the #1411 clause and "(#879)".
- **Roadmap-summary block.** Replace the ClassFieldTheory sentence with "On a nonarchimedean local field its absolute upper filtration agrees with ClassFieldTheory Layer 7's."
- **Dependencies.** Delete "ProfiniteCohomology" and the §F.3a clause.
- **Summary.** Replace the sentence with README lines 16–21.

**Tested.**
- With the repaired text, four sources give the same order: the description, this README, #1411's README lines 143–144 ("Layer 7 takes nothing from it") and #1215's README line 187.
- `roadmaps grep` at this index finds this roadmap cited by #940, #856, #1713, #1795 (README line 137) and #1812 (README lines 70 and 158). It is not cited by #879.
- On `ℚ_2(ζ_8)` at `u = 3/2`, §4a.1's fourth bullet and #1411's Layer 7 definition both give `{1, 5}` (row 52).

## Previous findings

- R01 — not repaired: the description is unchanged. *Merge order* still says "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411", and *Dependencies* still lists ProfiniteCohomology and §F.3a. It is carried above as R01.
- R02 — repaired: README lines 437–448 now cite `TauCeti.IsInertiaField.ramificationIdx_eq`, `…ramificationIdx_under_eq_one`, `…inertiaDeg_eq_one`, `Ideal.ramificationIdx_under_eq_one_iff_inertia_le` and `TauCeti.RamificationInertia.isUnramifiedAt_under_iff_inertia_le`, in place of the hand derivation. The contract is at lines 231–250 and the *Needs* lines are updated.

## Verified sound

### The R02 repair, passage by passage

- **Scope (lines 94–99).** The added sentence says that Tau Ceti proves:
  - `e(L/K_0) = e(L/K)` and `e(K_0/K) = 1`;
  - `f(L/K_0) = 1` for separable residue extension;
  - the unramified criterion `G_0 ≤ H`.

  This is the scope section, the one place where library facts are stated, and every clause matches the pin.
- **Mathlib contract (lines 186–188).** `IsInertiaField` is at `Mathlib/NumberTheory/RamificationInertia/HilbertTheory.lean` line 216. It is a class extending `IsGaloisGroup (inertia Gal(L/K) P) E L`, which is the README's "fixed field of the inertia group of a prime of `B` in `Gal(L/K)`".
- **Tau Ceti contract (lines 231–250).** `#check @` of the five names elaborates at the pin (scratch file, exit 0), and each stated hypothesis matches the pinned code:
  - `HilbertTheory/Basic.lean`:
    - `ramificationIdx_eq` (line 171) and `ramificationIdx_under_eq_one` (line 206) have the variables of lines 84–124: `[IsGalois K L] [IsDedekindDomain A] [IsDomain B] [Module.Finite A B] [IsDedekindDomain 𝓞E] [FiniteDimensional K L] [P.IsMaximal]` and `IsFractionRing 𝓞E E`. They assume no separability.
    - `inertiaDeg_eq_one` (line 232) adds `[Algebra.IsSeparable (A ⧸ P.under A) (B ⧸ P)]` (line 227).
  - `IntermediateRing.lean` line 100: `[IsGaloisGroup G A B] [Module.Finite A B] [Module.Flat A B] [IsGaloisGroup H C B] [Module.Flat C B] [Algebra.IsSeparable (A ⧸ P.under A) (B ⧸ P)]`, concluding `(P.under C).ramificationIdx A = 1 ↔ P.inertia G ≤ H`.
  - `Unramified.lean` line 50: the same variables plus `[Module.Finite A C]` (line 46), with no separability, concluding `Algebra.IsUnramifiedAt A (P.under C) ↔ P.inertia G ≤ H`. The proof reads this as `e = 1` with separable residue extension, as the README says.
- **§3a.1.**
  - **Opening sentence (lines 424–428).** It now limits the citation to the pinned facts and names the graded embeddings and Hilbert's formula as this section's targets.
  - **Hypotheses in this setting (row 61).** All are met:
    - `C = B^H` is a discrete valuation ring;
    - `B` is free over `C`, hence flat;
    - `C` is finite over the Noetherian `A`;
    - `𝓞E = B^(G_0)` is Dedekind.
  - **Maximality (line 448).** The claim that `K_0` is the maximal unramified subextension holds with or without separability, through the unramified criterion. The INS Check confirms that "maximal `e = 1`" would be false there.
- **§3a.3 (lines 830–832 and 849–852), §4a.1 (lines 981–987 and 1021) and §4a.3 (lines 1208–1212 and 1224–1227).** Each sentence cites the theorem that gives it.
  - §4a.1 has `k` perfect, so the separable form of the iff applies.
  - In §4a.3, `K_0 = L ∩ K^ur` follows from the cited theorems. Apply the iff at a finite Galois `M ⊇ L`: composita of subfields of `M` with `e = 1` lie in `M^(G_0(M))`, which has `e = 1` by `ramificationIdx_under_eq_one`. Then apply the iff at `L` (row 64).
- **Style of the added lines.** They contain no process words, no LaTeX and no new backticked names of this roadmap's own.

### Mechanical checks at this head

- **Gate**, re-run: `set_option=0 blob=0 latex=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`, exit 0. This agrees with the worker's gate.
- **Changes outside the folder**: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields'` lists nothing.
- **Dependency check**, output:

  ```text
  depcheck: 239 roadmaps, 2324 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The roadmap is line 2 of the merge order, after JacobianChallenge. Its consumers come later: PadicPeriodRings (21), ArithmeticGaloisRepresentations (58) and PadicExtensionFamilies (396).
- **Elaboration**: `lake env lean` on `Suggested.lean` exits 0. The only messages are nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Signatures.**
  - `git diff e81ddb8 HEAD -- Suggested.lean` is empty.
  - `#check @…` was run for all 13 declarations in a scratch copy. After whitespace normalisation the output is identical to `signatures.md` (9409 = 9409 characters), and no binder was lost.
  - Padding probe and headline list: carried from the previous report, since the file is unchanged. All 9 one-tactic probes failed; all headlines are stated, and §4a.3 and the proalgebraic targets are named in the docstring as not statable.
- **Seeded sample.** No sampled target falls in the changed passages: they are at README lines 397, 722, 748, 791 and 1243, and the diff touches none of them. I re-read three locators in the cached texts and they still match:
  - serre1961 n° 3.1, line 856, which limits itself to totally ramified `L/K`;
  - serre1961 Proposition 7 and its Corollary 1, lines 1150–1158;
  - brinon-conrad Exercise 1.4.4(2)–(3), lines 378–386.
- **Overlaps and citations.** `roadmaps overlaps` and `roadmaps resolve`: no pull request changes this folder, no id is dropped, and nothing is unresolved. #1411 (0333060) and #1215 (024927f) have the same heads as in the previous review.
- **Declared gaps**: none (there is no `design/plan.json`).

### Adversarial table

Notation, carried from the previous report:
- `Z8 = ℚ_2(ζ_8)/ℚ_2`; `Z9 = ℚ_3(ζ_9)/ℚ_3`;
- `S3 = ℚ_3(ζ_3, ∛3)/ℚ_3`;
- `BQ = ℚ_p(ζ_(p²−1), √p)/ℚ_p`, with `p` odd, `G = {1, σ, τ, στ}` and `G_0 = {1, τ}`;
- `INS`: `y^p − y = s·t^(−p)` over `F_p(s)((t))`;
- `AS`: `y^p − y = t⁻¹`;
- `I2`: the `F_2(s)((t))` example;
- `W = Frac W(F̄_p)`.

New in this report:
- `U = ℚ_p(ζ_(p²−1))/ℚ_p`;
- `T = ℚ_2(ζ_3, ∛2)/ℚ_2`, with `G = S_3`, `e = 3`, `f = 2`, `G_0 = C_3` and `G_1 = 1`. Here `X³ − 2` is Eisenstein, and `X² + X + 1` is irreducible over `F_2`.

Rows 1–41 and 44–48 are carried from the previous report, because their statements are untouched. Rows 42–43 and 49–53 are recomputed, and rows 54–65 are new. All of these were computed this round.

| # | Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `Σ = 5 + 2 + 2 = 9`; `v_3(disc ℚ(ζ_9)) = 3·(6 − 2 − 1) = 9`, `f = 1` | agrees | carried (r24 row 1) |
| 2 | Hilbert | `Z8` | `3 + 3 + 1 + 1 = 8`; `disc ℚ(ζ_8) = 2^(4·(6−3−1)) = 2^8` | agrees | carried (r24 row 2) |
| 3 | Hilbert | `BQ` | `Σ = 2 − 1 = 1`; `d(L/K_0) + e(L/K_0)·d(K_0/K) = 1 + 2·0 = 1` | agrees | carried (r24 row 3) |
| 4 | Hilbert, `G = 1` | `A = B` | `differentIdeal = ⊤ = 𝔪^0`; `Σ = 0` | agrees | carried (r24 row 4) |
| 5 | Hilbert, junk values | `∑ᶠ` over `ℕ` | `#G_i ≥ 1`, so no truncated subtraction; support finite by eventual triviality under `FaithfulSMul` | no junk | carried (r24 row 5) |
| 6 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 1 + 2·(2/4) = 2`, `φ(7) = 2 + 4/4 = 3` | matches Serre (5) | carried (r24 row 6) |
| 7 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees | carried (r24 row 7) |
| 8 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1`, while the lower `G_3 = {1, 5}` | wrong model excluded | carried (r24 row 8) |
| 9 | below `−1` | unramified quadratic | integrand `2` on `(−2, −1]`: `φ(−2) = −3`, `ψ(−2) = −3/2` | Check correct | carried (r24 row 9) |
| 10 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 0, 1` | `v = 0`: `S_3 ↦ C_2 = (G/H)_0`; `v = 1`: `G^1 = C_3 ↦ 1 = (G/H)_(ψ(1)) = (G/H)_2` | agrees | carried (r24 row 10) |
| 11 | Herbrand | `BQ`, `H = G_0` | `v = 0`: `G_0H/H = 1 = (G/H)_0` (quotient unramified); `v = −1`: both `G/H` | agrees | carried (r24 row 11) |
| 12 | Herbrand, separability dropped | `I2`, `v = 1/2` | `(G/H)^(1/2) = (G/H)_1 = 1` vs `G^(1/2)H/H = G/H` | hypothesis needed | carried (r24 row 12) |
| 13 | tower (Lean 130) | `S3`, `H = C_3`, `u = 5` | `φ_G(5) = 3/2 + 2/6 = 11/6`; `φ_H(5) = 3 + 2/3 = 11/3`; `φ_(G/H)(11/3) = 11/6` | agrees | carried (r24 row 13) |
| 14 | tower | `BQ`, `H = G_0`, `u = 4` | `φ_G(4) = 4/2 = 2`; `φ_H(4) = 2`; `φ_(G/H) = id` gives `2` | agrees | carried (r24 row 14) |
| 15 | tower, separability dropped | `I2`, `u = 1` | `φ_(M/K)(1) = 1` vs `φ_(L₁/K)(φ_(M/L₁)(1)) = 1/2` | hypothesis needed | carried (r24 row 15) |
| 16 | Hasse–Arf (Lean 151) | `Z9` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 3 + 3` | agrees | carried (r24 row 16) |
| 17 | Hasse–Arf | `Z8` | `j = 1`: `4 ∣ 4`; `j = 3`: `4 ∣ 8`; at the non-jump `j = 2`, `4 ∤ 6` is not asserted | agrees | carried (r24 row 17) |
| 18 | Hasse–Arf, commutativity dropped | `S3` | `j = 3`: `6 ∤ 3 + 3 + 3` | hypothesis needed | carried (r24 row 18) |
| 19 | Hasse–Arf, infinite residue field | `AS` over `F̄_p((t))` | `j = 1`: `p ∣ p` | agrees | carried (r24 row 19) |
| 20 | Hasse–Arf, negative control | abstract `C_9` filtration | `φ(5) = 1 + 4/3 = 7/3`; `9 ∤ 9 + 3·4 = 21`; the subgroup has jump `5`, the quotient jump `1` | Check consistent | carried (r24 row 20) |
| 21 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `ψ = 1, 3, 7`: `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees | carried (r24 row 21) |
| 22 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | each `O ∩ M = M` is a field acted on faithfully, so `G_0 = 1`; the inertia of `O` is `1` | agrees | carried (r24 row 22) |
| 23 | `_zero` | `ℚ_p`, Frobenius lift | acts as `x ↦ x^p` on `F̄_p`, outside both sides | agrees | carried (r24 row 23) |
| 24 | `_zero` | `W` | `ψ(0) = 0`: `G_K^0 = G_K =` inertia | agrees | carried (r24 row 24) |
| 25 | projections (Lean 215) | `ℚ_2`, `Z8`, `u = 3/2` | `ψ(3/2) = 1 + (1/2)/(1/2) = 2`: `{1, 5}` on both sides | agrees | carried (r24 row 25) |
| 26 | projections, perfectness dropped | `I2`, `u = 1/2` | image of order `≤ 2` vs `Gal(M/K)^(1/2) = G_1` of order `4` | hypothesis needed | carried (r24 row 26) |
| 27 | `0+` (Lean 239) | `W`, `K(ζ_p)` | `P_K ↦ G_1 = 1`; `I_K ↦ C_(p−1)` | strict inclusion | carried (r24 row 27) |
| 28 | `0+` | `ℚ_3`, `Z9` | `P_K ↦ {1, 4, 7}`, of order `3`; `I_K ↦ (ℤ/9)ˣ`, of order `6` | separates | carried (r24 row 28) |
| 29 | subgroup identity (Lean 263) | `S3`, `H = ⟨(12)⟩`, `u = 1` | `ψ_G(1) = 2`, `G_2 ∩ H = 1`; `φ_H(2) = 1`, `H^1 = H_2 = 1` | agrees | carried (r24 row 29) |
| 30 | subgroup identity | `BQ`, `H = {1, σ}`, `u = −1, 0, 1/2` | `H = H^(−1)`; `G_0 ∩ H = 1 = H^0`; `ψ_G(1/2) = 1`, `G_1 ∩ H = 1 = H^1` (`φ_H = id`) | agrees | carried (r24 row 30) |
| 31 | subgroup identity, trivial action | `S` a field, trivial `G` | every `G_i = G`, `φ_G = φ_H = id`; `G ∩ H = H = H^u` | no junk | carried (r24 row 31) |
| 32 | open subgroups (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ_(M/K)(1) = 2`: `H = H_2 = H^2`; `ψ_(M/K)(3/2) = 2 + 6·(1/2) = 5`: `1 = H_5 = H^3` | agrees | carried (r24 row 32) |
| 33 | `ψ_(L/K)` for non-Galois `L` | `L = ℚ_3(∛3)` in `S3` | `φ_H(ψ_G(u)) = u` on `[0, 3/2]`, `3u − 3` after; `ψ(2) = 3`; slopes `[G : G^tH]/f = 1, 3` | agrees | carried (r24 row 33) |
| 34 | open subgroups, `hO'` dropped | `W`, trivial `O'` | `G_L^0 = 1` vs the preimage `G_L` | hypothesis needed | carried (r24 row 34) |
| 35 | integral formula | `ℚ_3(ζ_3)` in `Z9` | `[G : G^tH] = 2`, `f = 1`, so `ψ = 2u` | agrees | carried (r24 row 35) |
| 36 | §4a.3 base change | `Z9` | `e = 6`, `d = 9`, `d/e = 3/2`, upper jumps `0, 1` | agrees | carried (r24 row 36) |
| 37 | sample: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; lower jumps `1, 3`, upper jumps `1, 2` | agrees | carried (r24 row 37) |
| 38 | sample: residue enlargement | `κ[[t]] → κ̄[[t]]`; `X^e − t`; unramified quadratic | `t` stays a uniformizer; `#G_0 = e`, `G_1 = 1`; the quadratic splits | agrees | carried (r24 row 38) |
| 39 | sample: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ C_p = H/[H, H]` | agrees | carried (r24 row 39) |
| 40 | sample: graded norms | `AS`; tame `C_e` | `N(1 + λy⁻¹) = 1 + (λ^p − λ)t`, kernel `F_p ∋ −1`; onto for `F̄_p`, zero on `F_p`; depth-0 kernel `μ_e` | agrees | carried (r24 row 40) |
| 41 | sample: `Breve E` | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; `F̄_q((t)) ≠ ⋃ F_(q^n)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | carried (r24 row 41) |
| 42 | §3a.1 Check, `BQ` (text changed) | `K_0`; `H = ⟨σ⟩`, `G_0`, `⟨στ⟩` | `#G_0 = 2 = e`; `K_0 = ℚ_p(ζ)`: `e(L/K_0) = 2 = e(L/ℚ_p)`, `e(K_0/ℚ_p) = 1`, `f(L/K_0) = 1`; `⟨σ⟩`: fixed field `ℚ_p(√p)`, `e = 2`, `G_0 ≰ H`; `G_0`: `e = 1`, `G_0 ≤ H`; `⟨στ⟩`: fixed field `ℚ_p(√(up))` (`u` a non-square unit), `e = 2`, `G_0 ≰ H` | agrees | recomputed |
| 43 | §3a.1 Check, `INS` (text changed) | `H = 1`, `H = G`; over `K_0` | `G = G_0 = C_p`, `K_0 = K`. `H = 1`: `e(L/K) = 1` (true) vs `G_0 ≤ 1` (false), so the `e`-iff fails; unramified iff: inseparable residue (false) vs false, so it holds. `H = G`: both true. `f(L/K_0) = p` = inseparable degree (`inertiaDeg_eq_finInsepDegree`, Basic.lean 185); pinned index formula (IntermediateRing.lean 154): `1 · p = [G_0 : 1] = p` | agrees | recomputed |
| 44 | Mathlib `card_inertia_eq_ramificationIdxIn` | `Z9`; unramified quadratic | `#G_0 = 6 = e`; `1 = 1`; needs `IsGaloisGroup`, finite and flat, `HasSeparableResidueFieldsAt` (Galois.lean 277, 315) | matches line 174 | carried (r24 row 44) |
| 45 | `adjoin_eq_top_of_span_eval_eq_maximalIdeal` with `g = X` | `Z8` over `K_0 = ℚ_2`; unramified quadratic | `adjoin {0} = ⊥ = ⊤` over trivial residue extension, so `ℤ_2[ζ_8] = ℤ_2[1 − ζ_8]`; for `π = p` over `F_(p²)/F_p`, `hres` fails | used only over `K_0` | carried (r24 row 45) |
| 46 | Eisenstein trio | `X^e − t` over `κ[[t]]` | `R′[x]` is a DVR, `x` a uniformizer, ramification index `e` | agrees | carried (r24 row 46) |
| 47 | scope and §4a.2: `inverseHerbrand_tower` | `Z8 ⊃ ℚ_2(√2)`, `u = 3` | `ψ_(L/K)(3) = 2 + 2·1 = 4`, `ψ_(M/L)(4) = 1 + 2·3 = 7 = ψ_(M/K)(3)`; pinned `[IsGalois K L] [IsGalois K M]` | agrees | carried (r24 row 47) |
| 48 | scope and §4a.2: `comap_restrictScalarsHom_upperRamificationGroup` | `Z8`, `H = {1, 7}`, `v = 3/2` | `G_2 ∩ H = {1, 5} ∩ H = 1`; `ψ_(L/K)(3/2) = 3/2`, `H^(3/2) = H_2 = 1` | agrees | carried (r24 row 48) |
| 49 | §3a.1 maximality by `Ideal.ramificationIdx_under_eq_one_iff_inertia_le` | `BQ`, `H = G_0`, `⟨σ⟩` | `G_0`: `e = 1`, `G_0 ≤ H`; `⟨σ⟩`: `e = 2`, `G_0 ≰ H`; cited at README 446–448 | cited | R02 repaired |
| 50 | §3a.1 total ramification by `IsInertiaField.*` | `BQ`, `E = ℚ_p(ζ)` | `e(L/E) = 2 = e(L/ℚ_p)`; `e(E/ℚ_p) = 1`; `f(L/E) = 1`; cited at README 439–442 | cited | R02 repaired |
| 51 | negative control for the separability split | `INS`, `H = 1` | as row 43: the `e`-iff needs separability; the unramified iff does not | consistent with README 444–448 | R02 repaired |
| 52 | README 122–127 vs ClassFieldTheory | main (41f2872); #1215 (024927f); #1411 (0333060); `ℚ_2`, `Z8`, `u = 3/2` | main: Layer 7 (line 1312) is the absolute Artin map, with no upper filtration; #1215 line 187 and #1411 lines 143 and 2311 own it; `ψ(3/2) = 2`, `G_2 = {1, 5}` on both sides | only open revisions define it, and the description reverses the order | R01 |
| 53 | description *Dependencies*, *Why* | `grep`; #879 (9856719) | `ProfiniteCohomology`: 0 hits in README; README 108: consumes nothing from §F.3a; #879 cites "PadicPeriodRings §0.3" (lines 183, 8893), not this roadmap | false | R01 |
| 54 | scope 94–99 and §3a.1 437–442, `IsInertiaField.*` | `Z9` | `G_0 = G`, `K_0 = ℚ_3`: `e(L/K_0) = 6 = e(L/K)`; `e(K_0/K) = 1`; `f(L/K_0) = 1` | agrees | none |
| 55 | same | `U` | `G_0 = 1`, `K_0 = L`: `e(L/K_0) = 1 = e(L/K)`; `e(K_0/K) = 1`; `f(L/K_0) = 1`; iff at `H = 1`: `1 ≤ 1` and `e = 1` | agrees | none |
| 56 | same, both `e` and `f` above 1, non-abelian | `T` | `K_0 = ℚ_2(ζ_3)`: `e(L/K_0) = 3 = e(L/K)`; `e(K_0/K) = 1`; `f(L/K_0) = 1`; `[L : K_0] = 3 = 3·1`; Hilbert `d = 2 = e − 1` | agrees | none |
| 57 | iff (IntermediateRing 100), all subgroups | `T` | `H = 1`: `e = 3`, `C_3 ≰ 1`; the three `⟨(ij)⟩`: `F = ℚ_2(ω^i∛2)`, `e = 3`, `C_3 ≰ H`; `C_3`: `F = ℚ_2(ζ_3)`, `e = 1`, `C_3 ≤ H`; `S_3`: `e = 1` | 6 of 6 agree | none |
| 58 | iff, non-normal `H`, totally ramified | `S3` | `G_0 = S_3`; `⟨(12)⟩`: `e(ℚ_3(∛3)/ℚ_3) = 3`; `C_3`: `e(ℚ_3(ζ_3)/ℚ_3) = 2`; only `H = S_3` gives `e = 1`, so `K_0 = ℚ_3` | agrees | none |
| 59 | unramified iff (Unramified 50) | `INS`, `H = 1` and `H = G` | `H = 1`: false and false; `H = G`: `K/K` unramified and `G_0 ≤ G`, true and true | agrees without separability | none |
| 60 | degenerate `L = K` | `G = 1` | `K_0 = K`; `e = f = 1` on every side; iff at `H = 1`: `1 ≤ 1`, `e = 1` | no junk | none |
| 61 | instantiation in the 3a.1 setting | `C = B^H`; `H = 1`, `H = G` | `C` is the integral closure of `A` in `F`, a DVR; `B` is torsion-free and finite over the PID `C`, so free and `Module.Flat C B`; `Module.Finite A C` from Noetherian `A` and `C ⊆ B`; `IsGaloisGroup H C B` from faithfulness and invariance; `H = 1` gives `C = B`, `H = G` gives `C = A` | hypotheses met | none |
| 62 | §3a.3 proof: `L/K_0` totally ramified via `inertiaDeg_eq_one` | `T`; `Z8` | `T`: `π_L = ∛2`, `X³ − 2` Eisenstein over `ℤ_2[ζ_3]`, `[L : K_0] = 3 = e`; `Z8`: `K_0 = ℚ_2`, `f = 1`, `e = 4 = [L : K_0]` | agrees | none |
| 63 | §4a.1: fixed field of `Gal(M/K)^0` is the largest `e = 1` subfield | `T`; `W` | `T`: `G_0 = C_3`, fixed field `ℚ_2(ζ_3)`, and the subfields with `e = 1` are `ℚ_2` and `ℚ_2(ζ_3)`; `W`: every finite `M` is totally ramified, so `G_0 = G`, fixed field `K`, and `G_K^0 = G_K = I_K` | agrees | none |
| 64 | §4a.3: `K_0 = L ∩ K^ur`, `e(K′/K_0) = 1` | `T` | `L ∩ ℚ_2^ur = ℚ_2(ζ_3) = K_0`; `L′ = K′(∛2)`: `[L′ : K′] = 3 = #G_0`, `e = 3` and `d = 2` on both sides; `f` goes from `2` to `1` (lost, as stated) | agrees; route checked as above | none |
| 65 | contract 231–250 vs pin | `#check @` of the 5 names and `IsInertiaField` | Basic.lean 106–124 and 227; IntermediateRing.lean 100; Unramified.lean 46–50; Mathlib HilbertTheory.lean 216: hypotheses as listed above | matches the README | none |

### Library declarations opened at the pins

- **Tau Ceti `NumberTheory/RamificationInertia/HilbertTheory/`, read in full this round:**
  - `Basic.lean`: lines 84–124, 171, 178, 185, 206, 227 and 232;
  - `IntermediateRing.lean`: lines 56, 71–100 and 154;
  - `Unramified.lean`: lines 39–50.
- **Mathlib:** `NumberTheory/RamificationInertia/HilbertTheory.lean`, lines 187–230 (`IsInertiaField` at line 216).
- **Carried from the previous report:** the other 96 library names backticked in the README. Their lines are unchanged except for re-flowed text.

### Cross-roadmap citations resolved

- **ClassFieldTheory.**
  - Main (41f2872): README line 1312.
  - #1215 (024927f): README line 187.
  - #1411 (0333060): README lines 143 and 2311.
- **Consumers, by `roadmaps grep`:**
  - #940, #856 and #1713;
  - #1795 (README line 137) and #1812 (README lines 70 and 158);
  - not #879.
- **Ownership against open pull requests.** The changed passages cite library theorems and claim no new object, so the ownership audit of the previous report stands.

## Not verifiable

- **`serre-local-fields`** is settled as uncertified, so its locators are cited without the text (I §6 Proposition 18, used again in the changed §3a.3 and §4a.3 proofs).
- **Pull requests without a checkout.** #1411, #856, #879, #940, #1713, #1795 and #1812 have no checkout in this brief. I read them at their indexed heads through `roadmaps show` and `roadmaps grep`.

## Source issues

- none
