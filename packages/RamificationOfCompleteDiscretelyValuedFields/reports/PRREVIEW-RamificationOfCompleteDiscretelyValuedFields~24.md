# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at e81ddb8)

**Verdict:** needs changes

Two P3 findings, none blocking. `Suggested.lean` needs no change.

- **R01** is a description-only finding. It carries the previous review's R01 and R02, neither of which the description repairs. #1411's head now states the order this README states, so R01 only asks the description to say the same.
- **R02** is new and comes from the repair of the previous R04. §3a.1 now derives by hand that the fixed field of `G_0` is the maximal unramified subextension. Tau Ceti's Hilbert-theory files prove this on the same carrier, and the paragraph says its contents are "proved in the pinned Mathlib and Tau Ceti … cited here".

**Previous findings (review of 1dc3055).** No repair report marks any of them as not actionable.

- **R01 — not repaired.** The description's *Merge order* still reads "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411", and it still does not name #1215. Carried as R01.
- **R02 — not repaired.** The description's *Dependencies* still lists "ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)", and *Why* still names #879. Merged into R01.
- **R03 — repaired.** The LocalFieldsRamification contract (README lines 273–285) now names `upperJump_herbrand_iff`, `lowerJump_inverseHerbrand_iff`, `herbrand_tower`, `inverseHerbrand_tower` and `comap_restrictScalarsHom_upperRamificationGroup`, with the hypothesis "for `M/L/K` with `L/K` and `M/K` Galois". This matches `Herbrand/Tower.lean` line 116 and `UpperQuotient.lean` lines 85–89. The same names appear in:
  - §3a.2's agreement bullet and *Needs* (lines 558–567 and 596–603);
  - §4a.2's first two bullets and *Needs* (lines 1042–1044, 1050–1053 and 1102–1104);
  - the scope (lines 130–135).
- **R04 — repaired.**
  - §3a.1 (lines 400–408) cites `Ideal.card_inertia_eq_ramificationIdxIn`, `Ideal.Quotient.stabilizerHom_surjective` and `Ideal.Quotient.stabilizerQuotientInertiaEquiv`.
  - The three Tau Ceti Eisenstein theorems are in the contract (lines 218–223) and are cited where they are used: lines 682–687, 791–793 and 1163–1165.
  - The *Needs* of §§3a.1, 3a.3, 4a.1 and 4a.3 are updated.
  - The hypotheses stated for these theorems match the pin (rows 44–46).
  - The hand derivation added next to these citations is R02.

## R01 (P3) — The description still reverses the ClassFieldTheory order and lists suppliers and a consumer the README does not have

**Location.** The pull-request description:
- *Merge order*: "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411";
- *Why*: "the ClassFieldTheory amendment #1411 consumes the absolute upper filtration" and "(#879)";
- *Dependencies*: "ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)";
- **Summary**: "every object restricts to the completed roadmap's".

**Claim.**
- README lines 117–122 attribute the local-field absolute upper filtration to ClassFieldTheory Layer 7, which "precedes this roadmap … takes no input from this roadmap". On main, ClassFieldTheory has no such filtration: only the open revisions #1215 and #1411 define it. So that revision has to precede this pull request, and the description has to name it in that direction.
- README line 103 says the roadmap "consumes nothing from that section" (§F.3a), and the README never names ProfiniteCohomology.
- #879 does not cite this roadmap.
- README lines 16–21 name local-field objects that are not the completed roadmap's.

**Witness.**
- `ClassFieldTheory/README.md` at #1411 (0333060), lines 143 and 2311: "`RamificationOfCompleteDiscretelyValuedFields` §4a.1 consumes Layer 7's absolute upper ramification groups". `gate --depcheck` on that README: 0 problems.
- `grep -c ProfiniteCohomology README.md` returns 0.

**Repair** (description only):
- **Merge order.** Replace with: "ClassFieldTheory's Layer 7, as revised by #1411 or #1215, defines the absolute upper filtration of a nonarchimedean local field that this README attributes to it; whichever of the two merges first precedes this pull request, and ClassFieldTheory takes no input from this roadmap. #940, #856, #1713, #1795 and #1812 cite §§3a–4a and merge after it."
- **Why.** Delete the #1411 clause and "(#879)".
- **Roadmap-summary block.** Replace "ClassFieldTheory needs the absolute upper filtration for reciprocity–filtration compatibilities" with "On a nonarchimedean local field its absolute upper filtration agrees with ClassFieldTheory Layer 7's."
- **Dependencies.** Delete "ProfiniteCohomology" and the §F.3a clause.
- **Summary.** Replace the sentence with README lines 16–21.

**Tested.**
- With the repaired text, the description, this README, #1411's head and #1215's head (its README line 187: "Layer 7 owns the absolute upper filtration on every nonarchimedean local field") all give the same order.
- On `ℚ_2(ζ_8)` at `u = 3/2`, §4a.1's fourth bullet and #1411's Layer 7 definition both give `{1, 5}` (row 52).

## R02 (P3) — §3a.1 re-derives the inertia-field facts that Tau Ceti's Hilbert-theory files already prove

**Location.** README lines 397–413.
- Lines 397–399: "the following are proved in the pinned Mathlib and Tau Ceti, without completeness or residue finiteness, and are cited here, not restated."
- Lines 408–413 then derive `e(L/K_0) = e(L/K)`, `e(K_0/K) = 1` and "So `K_0` is the maximal unramified subextension" from `card_inertia_eq_ramificationIdxIn` and `subgroupOf_ramificationGroup`.

§§3a.3, 4a.1 and 4a.3 rely on this derivation (lines 780–782, 932–934 and 1158).

**Claim.** The pinned Tau Ceti proves exactly these statements for a finite Galois extension of a Dedekind domain. That setting includes the complete discrete valuation ring `A` and its integral closure `B`. The README names none of these theorems, and the opening sentence of the paragraph presents the derivation as a citation.

**Witness.** In `TauCeti/NumberTheory/RamificationInertia/HilbertTheory/`:
- `Basic.lean`, lines 171, 206 and 232: `TauCeti.IsInertiaField.ramificationIdx_eq`, `ramificationIdx_under_eq_one` and `inertiaDeg_eq_one`.
- `IntermediateRing.lean`, line 100: `Ideal.ramificationIdx_under_eq_one_iff_inertia_le`, stated as `(P.under C).ramificationIdx A = 1 ↔ P.inertia G ≤ H`.
- `Unramified.lean`, line 50: `TauCeti.RamificationInertia.isUnramifiedAt_under_iff_inertia_le`.

**Repair.**
1. **Replace the derivation.** Replace the text from "Applied to `L` over the fixed field `K_0`" through "maximal unramified subextension." with:

   > For the fixed field `K_0` of `G_0` (Mathlib's `IsInertiaField`), Tau Ceti's `TauCeti.IsInertiaField.ramificationIdx_eq`, `TauCeti.IsInertiaField.ramificationIdx_under_eq_one` and, for separable residue extension, `TauCeti.IsInertiaField.inertiaDeg_eq_one` give `e(L/K_0) = e(L/K)`, `e(K_0/K) = 1` and `f(L/K_0) = 1`, so `L/K_0` is totally ramified. Tau Ceti's `Ideal.ramificationIdx_under_eq_one_iff_inertia_le` says that the fixed field of a subgroup `H` has `e = 1` over `K` exactly when `G_0 ≤ H`, so `K_0` is the maximal unramified subextension. `TauCeti.RamificationInertia.isUnramifiedAt_under_iff_inertia_le` gives the unramified form without separability.
2. **Contract and *Needs*.**
   - Add the five names, with their files, to the Tau Ceti contract (lines 198–225) and to §3a.1's *Needs*.
   - In the *Needs* of §§3a.3 and 4a.1 (lines 800–801 and 970–971), and in §4a.1's proof (lines 932–934), name these theorems for the maximal unramified subextension, in place of the two Mathlib theorems.
   - In the *Needs* of §4a.3 (line 1171), add these theorems for "`K_0 = L ∩ K^ur`, the fixed field of `G_0`".
3. **Opening sentence.** Limit the sentence at lines 397–399 to the pinned facts. Say that the graded embeddings, their consequences for `G_0` and `G_1`, and Hilbert's formula are this section's own targets, as lines 41–45 and 439 already state.

**Tested.**
- On `L = ℚ_p(ζ_(p²−1), √p)` over `ℚ_p`, the new §3a.1 Check:
  - `IsInertiaField` for `E = ℚ_p(ζ_(p²−1))` gives `e(L/E) = 2 = e(L/ℚ_p)`, `e(E/ℚ_p) = 1` and `f(L/E) = 1`.
  - For `H = Gal(L/ℚ_p(√p))`, `G_0 ≰ H`, and indeed `e(ℚ_p(√p)/ℚ_p) = 2`.
- On the inseparable Check `y^p − y = s·t^(−p)` over `F_p(s)((t))`, with `H = 1`: `e(L/K) = 1` while `G_0 = G ≰ 1`. So the separability instance of the cited iff is needed, exactly as the README's Check says.
- The five `#check @…` commands elaborate at the pin (rows 49–51).

## Verified sound

### Mechanical checks at this head

- **Gate**, re-run: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0, in agreement with the worker's gate.
- **Changes outside the folder**: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields'` lists nothing.
- **Dependency check**, output:

  ```text
  depcheck: 239 roadmaps, 2325 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The roadmap is line 2 of the merge order, after JacobianChallenge. Its consumers come later: PadicPeriodRings (21), ArithmeticGaloisRepresentations (58) and PadicExtensionFamilies (396). FilteredLocalGaloisGroups and FieldOfNorms are not yet in the order.
- **Elaboration**: `lake env lean` on `Suggested.lean` exits 0 in 5.8 s. The only messages are nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Signatures**: `#check @…` for all 13 declarations, elaborated once in a scratch copy. After whitespace normalisation the output is identical to `signatures.md` (9409 = 9409 characters), and no binder was lost.
- **Comparison with the README.** Each elaborated type matches its README generality:
  - Hilbert, Herbrand, tower and Hasse–Arf: discrete valuation rings with `Algebra.IsInvariant`, `FaithfulSMul G B` and separable residue extension, without completeness. The README states this at lines 443–447, 540–544, 547–550 and 654–657.
  - §4a.1 and §4a.2: lines 870–880 and 1045–1060.
- **One-tactic probe**: each of the 9 `sorry`s was replaced by `first | rfl | simp | infer_instance | (ext; simp) | aesop | trivial | decide`, and all 9 fail. There is no padding.
- **Lean form.**
  - `module` with `public import Mathlib` and `public import TauCeti.RingTheory.LocalRing.RamificationGroup`.
  - No `set_option`; four `def`s with real bodies and no sorry'd data.
  - `theorem` only, a docstring on every declaration, and layer section comments in README order.
- **Headline theorems.** All are stated:
  - Hilbert's formula (Lean 62);
  - Herbrand's theorem (111) and tower transitivity (130);
  - Hasse–Arf (151);
  - `G_K^0` as inertia (197), the finite projections (215) and `G_K^(0+)` (239);
  - the finite-level identity (263) and the open-subgroup identity (289).

  §4a.3 is named in the module docstring as not statable: the pins have a maximal unramified extension only for local fields. The proalgebraic targets of §3a.3 are named there as prerequisites that lack perfect quasialgebraic groups at the pins.
- **Declared gaps**: none (there is no `design/plan.json`).

### Seeded sample, read at the locators

Printed pages were read from the running heads of each extraction.

**The perfect-residue Herbrand package** (README line 370). serre1961 n° 3.1 starts at line 856 (printed p. 126) and is limited to totally ramified `L/K` with arbitrary residue field (lines 860–863). It contains:
- Proposition 1 with Corollaries 1–2 (lines 875–886, p. 126);
- Proposition 2 (line 889, p. 127);
- formula (5) and properties a–d′ (lines 897–926, pp. 127–128);
- formula (8) (line 929, p. 128);
- Proposition 3, the infinite-extension paragraph, Proposition 4 and Kawada's Remarque (lines 931–950, p. 128).

Also checked:
- n° 3.4–3.5 run from line 1091 to line 1246, pp. 132–136.
- brinon-conrad Exercise 1.4.4(3) is at lines 382–386, p. 10.

All these locators are correct, including the Lean docstrings' citations of formula (5), formula (8) and Propositions 3–4.

**Residue enlargement** (line 674). ega3 Chapitre 0:
- Proposition (10.3.1) is at line 637, printed p. 20. It gives a local, flat, Noetherian `A → B` with `B/𝔪_A B ≅ K`.
- (10.3.1.5), the completion remark and Corollary (10.3.2) are at lines 733–740, p. 23.

The target's discrete valuation ring with `𝔪_(R′) = 𝔪_R R′` follows from this, with `gr(B) = gr(A) ⊗ K` a domain. The locators are correct.

**Proalgebraic units** (line 700).
- serre1961:
  - §1 starts at line 74 (p. 106), and n° 1.6 ends before line 366 (p. 113).
  - n° 2.1 is at line 557 (p. 118). It fixes the coefficient lift in characteristic 0, which matches the target's coefficient-field section.
  - The Corollary to Proposition 1 (the norm maps `U_L` onto `U_K`) and Proposition 2 with its Corollary and Remarque (`σ(T)/T`) are at lines 598–621 (p. 119).
  - Proposition 3 (`V⁰ = I·U_L`) and its Corollary (`π₀(V) ≅ g/g′`) are at lines 630–639 (p. 120).
- serre1960:
  - Definition 2 (n° 1.2), line 162, p. 8;
  - Proposition 10 (n° 1.4), line 313, p. 11;
  - Propositions 6–7 (n° 2.4), lines 546 and 575, pp. 17–18;
  - Proposition 10 with Corollaries 1–2 (n° 2.5), lines 625–636, p. 19;
  - Propositions 1–2 (n° 5.1), lines 1246 and 1260, p. 35.

The locators are correct.

**Graded norms** (line 743). In serre1961:
- Proposition 6(a)–(b) (lines 1092–1099, p. 132) gives both norm images and sequence (20), for Galois `L/K` that need not be abelian.
- `V_n = V_L ∩ U_L^(ψ(n))` is (22), and Proposition 7 is sequence (23) (lines 1150–1157, p. 134). The proof identifies `V_n/V_(n+1)` with the kernel of the graded norm, which is the target's lifting by `U^(ψ(n+1))`.
- Corollaries 1–3 are at lines 1158–1184 (pp. 134–135): the component group, "divides", and the surjection `δ_n`.
- Proposition 8(i)–(iii) is at lines 1187–1192 (p. 135), and Corollary 1 at line 1224 (p. 136).

Every clause of the target matches, and the locators are correct.

**Agreement with `Breve E`** (line 1188). brinon-conrad:
- Definition 1.3.1 (line 259) restricts to characteristic 0.
- Exercise 1.4.4(2)–(3) is at lines 378–386, printed p. 10: the unique extension of the valuation; `K^un` is not complete unless `k` is algebraically closed; the completion has residue field `k̄`.
- The proof of Lemma 13.1.6, lines 8587–8589 (p. 201), passes to the completion.

The README states the mixed-characteristic scope, and the locators are correct.

### Adversarial table

Notation:
- `Z8 = ℚ_2(ζ_8)/ℚ_2`: `#G_0..#G_4 = 4, 4, 2, 2, 1`, since `σ_5` moves `ζ` by valuation `4` and `σ_3`, `σ_7` move it by valuation `2`.
- `Z9 = ℚ_3(ζ_9)/ℚ_3`: `#G_0..#G_3 = 6, 3, 3, 1`, since `σ_4` moves `ζ` by `ζ(ζ_3 − 1)`, of valuation `3`.
- `S3 = ℚ_3(ζ_3, ∛3)/ℚ_3`: `#G_0..#G_4 = 6, 3, 3, 3, 1`.
- `BQ = ℚ_p(ζ_(p²−1), √p)/ℚ_p`, with `p` odd: `G = {1, σ, τ, στ}`, where `τ(√p) = −√p` and `σ` is the Frobenius lift fixing `√p`; `G_0 = {1, τ}` and `G_1 = 1`.
- `INS`: `y^p − y = s·t^(−p)` over `F_p(s)((t))`.
- `AS`: `y^p − y = t⁻¹` over `k((t))`.
- `I2`: `M = K(y, w)` over `F_2(s)((t))`.
- `W = Frac W(F̄_p)`.

All values were computed this round.

| # | Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `Σ = 5 + 2 + 2 = 9`; `v_3(disc ℚ(ζ_9)) = 3·(6 − 2 − 1) = 9`, `f = 1` | agrees | none |
| 2 | Hilbert | `Z8` | `3 + 3 + 1 + 1 = 8`; `disc ℚ(ζ_8) = 2^(4·(6−3−1)) = 2^8` | agrees | none |
| 3 | Hilbert | `BQ` | `Σ = 2 − 1 = 1`; `d(L/K_0) + e(L/K_0)·d(K_0/K) = 1 + 2·0 = 1` | agrees | none |
| 4 | Hilbert, `G = 1` | `A = B` | `differentIdeal = ⊤ = 𝔪^0`; `Σ = 0` | agrees | none |
| 5 | Hilbert, junk values | `∑ᶠ` over `ℕ` | `#G_i ≥ 1`, so no truncated subtraction; support finite by eventual triviality under `FaithfulSMul` | no junk | none |
| 6 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 1 + 2·(2/4) = 2`, `φ(7) = 2 + 4/4 = 3` | matches Serre (5) | none |
| 7 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees | none |
| 8 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1`, while the lower `G_3 = {1, 5}` | wrong model excluded | none |
| 9 | below `−1` | unramified quadratic | integrand `2` on `(−2, −1]`: `φ(−2) = −3`, `ψ(−2) = −3/2` | Check correct | none |
| 10 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 0, 1` | `v = 0`: `S_3 ↦ C_2 = (G/H)_0`; `v = 1`: `G^1 = C_3 ↦ 1 = (G/H)_(ψ(1)) = (G/H)_2` | agrees | none |
| 11 | Herbrand | `BQ`, `H = G_0` | `v = 0`: `G_0H/H = 1 = (G/H)_0` (quotient unramified); `v = −1`: both `G/H` | agrees | none |
| 12 | Herbrand, separability dropped | `I2`, `v = 1/2` | `(G/H)^(1/2) = (G/H)_1 = 1` vs `G^(1/2)H/H = G/H` | hypothesis needed | none |
| 13 | tower (Lean 130) | `S3`, `H = C_3`, `u = 5` | `φ_G(5) = 3/2 + 2/6 = 11/6`; `φ_H(5) = 3 + 2/3 = 11/3`; `φ_(G/H)(11/3) = 11/6` | agrees | none |
| 14 | tower | `BQ`, `H = G_0`, `u = 4` | `φ_G(4) = 4/2 = 2`; `φ_H(4) = 2`; `φ_(G/H) = id` gives `2` | agrees | none |
| 15 | tower, separability dropped | `I2`, `u = 1` | `φ_(M/K)(1) = 1` vs `φ_(L₁/K)(φ_(M/L₁)(1)) = 1/2` | hypothesis needed | none |
| 16 | Hasse–Arf (Lean 151) | `Z9` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 3 + 3` | agrees | none |
| 17 | Hasse–Arf | `Z8` | `j = 1`: `4 ∣ 4`; `j = 3`: `4 ∣ 8`; at the non-jump `j = 2`, `4 ∤ 6` is not asserted | agrees | none |
| 18 | Hasse–Arf, commutativity dropped | `S3` | `j = 3`: `6 ∤ 3 + 3 + 3` | hypothesis needed | none |
| 19 | Hasse–Arf, infinite residue field | `AS` over `F̄_p((t))` | `j = 1`: `p ∣ p` | agrees | none |
| 20 | Hasse–Arf, negative control | abstract `C_9` filtration | `φ(5) = 1 + 4/3 = 7/3`; `9 ∤ 9 + 3·4 = 21`; the subgroup has jump `5`, the quotient jump `1` | Check consistent | none |
| 21 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `ψ = 1, 3, 7`: `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees | none |
| 22 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | each `O ∩ M = M` is a field acted on faithfully, so `G_0 = 1`; the inertia of `O` is `1` | agrees | none |
| 23 | `_zero` | `ℚ_p`, Frobenius lift | acts as `x ↦ x^p` on `F̄_p`, outside both sides | agrees | none |
| 24 | `_zero` | `W` | `ψ(0) = 0`: `G_K^0 = G_K =` inertia | agrees | none |
| 25 | projections (Lean 215) | `ℚ_2`, `Z8`, `u = 3/2` | `ψ(3/2) = 1 + (1/2)/(1/2) = 2`: `{1, 5}` on both sides | agrees | none |
| 26 | projections, perfectness dropped | `I2`, `u = 1/2` | image of order `≤ 2` vs `Gal(M/K)^(1/2) = G_1` of order `4` | hypothesis needed | none |
| 27 | `0+` (Lean 239) | `W`, `K(ζ_p)` | `P_K ↦ G_1 = 1`; `I_K ↦ C_(p−1)` | strict inclusion | none |
| 28 | `0+` | `ℚ_3`, `Z9` | `P_K ↦ {1, 4, 7}`, of order `3`; `I_K ↦ (ℤ/9)ˣ`, of order `6` | separates | none |
| 29 | subgroup identity (Lean 263) | `S3`, `H = ⟨(12)⟩`, `u = 1` | `ψ_G(1) = 2`, `G_2 ∩ H = 1`; `φ_H(2) = 1`, `H^1 = H_2 = 1` | agrees | none |
| 30 | subgroup identity | `BQ`, `H = {1, σ}`, `u = −1, 0, 1/2` | `H = H^(−1)`; `G_0 ∩ H = 1 = H^0`; `ψ_G(1/2) = 1`, `G_1 ∩ H = 1 = H^1` (`φ_H = id`) | agrees | none |
| 31 | subgroup identity, trivial action | `S` a field, trivial `G` | every `G_i = G`, `φ_G = φ_H = id`; `G ∩ H = H = H^u` | no junk | none |
| 32 | open subgroups (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ_(M/K)(1) = 2`: `H = H_2 = H^2`; `ψ_(M/K)(3/2) = 2 + 6·(1/2) = 5`: `1 = H_5 = H^3` | agrees | none |
| 33 | `ψ_(L/K)` for non-Galois `L` | `L = ℚ_3(∛3)` in `S3` | `φ_H(ψ_G(u)) = u` on `[0, 3/2]`, `3u − 3` after; `ψ(2) = 3`; slopes `[G : G^tH]/f = 1, 3` | agrees | none |
| 34 | open subgroups, `hO'` dropped | `W`, trivial `O'` | `G_L^0 = 1` vs the preimage `G_L` | hypothesis needed | none |
| 35 | integral formula | `ℚ_3(ζ_3)` in `Z9` | `[G : G^tH] = 2`, `f = 1`, so `ψ = 2u` | agrees | none |
| 36 | §4a.3 base change | `Z9` | `e = 6`, `d = 9`, `d/e = 3/2`, upper jumps `0, 1` | agrees | none |
| 37 | sample: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; lower jumps `1, 3`, upper jumps `1, 2` | agrees | none |
| 38 | sample: residue enlargement | `κ[[t]] → κ̄[[t]]`; `X^e − t`; unramified quadratic | `t` stays a uniformizer; `#G_0 = e`, `G_1 = 1`; the quadratic splits | agrees | none |
| 39 | sample: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ C_p = H/[H, H]` | agrees | none |
| 40 | sample: graded norms | `AS`; tame `C_e` | `N(1 + λy⁻¹) = 1 + (λ^p − λ)t`, kernel `F_p ∋ −1`; onto for `F̄_p`, zero on `F_p`; depth-0 kernel `μ_e` | agrees | none |
| 41 | sample: `Breve E` | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; `F̄_q((t)) ≠ ⋃ F_(q^n)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |
| 42 | new §3a.1 Check | `BQ` | `#G_0 = 2 = e`; `G/G_0 ≅ Gal(F_(p²)/F_p)`, of order `2 = f`; `K_0 = ℚ_p(ζ)`; `τ` moves `√p` by valuation `1` | agrees | none |
| 43 | new §3a.1 Check | `INS` | `G = G_0 = C_p`; `G/G_0 = 1 = Aut(F_p(s^(1/p))/F_p(s))`, `f = p`; `K_0 = K` but the largest `e = 1` subextension is `L` | separability needed | none |
| 44 | Mathlib `card_inertia_eq_ramificationIdxIn` | `Z9`; unramified quadratic | `#G_0 = 6 = e`; `1 = 1`; needs `IsGaloisGroup`, finite and flat, `HasSeparableResidueFieldsAt` (Galois.lean 277, 315) | matches line 174 | none |
| 45 | `adjoin_eq_top_of_span_eval_eq_maximalIdeal` with `g = X` | `Z8` over `K_0 = ℚ_2`; unramified quadratic | `adjoin {0} = ⊥ = ⊤` over trivial residue extension, so `ℤ_2[ζ_8] = ℤ_2[1 − ζ_8]`; for `π = p` over `F_(p²)/F_p`, `hres` fails | used only over `K_0` | none |
| 46 | Eisenstein trio | `X^e − t` over `κ[[t]]` | `R′[x]` is a DVR, `x` a uniformizer, ramification index `e` | agrees | none |
| 47 | scope and §4a.2: `inverseHerbrand_tower` | `Z8 ⊃ ℚ_2(√2)`, `u = 3` | `ψ_(L/K)(3) = 2 + 2·1 = 4`, `ψ_(M/L)(4) = 1 + 2·3 = 7 = ψ_(M/K)(3)`; pinned `[IsGalois K L] [IsGalois K M]` | agrees | none |
| 48 | scope and §4a.2: `comap_restrictScalarsHom_upperRamificationGroup` | `Z8`, `H = {1, 7}`, `v = 3/2` | `G_2 ∩ H = {1, 5} ∩ H = 1`; `ψ_(L/K)(3/2) = 3/2`, `H^(3/2) = H_2 = 1` | agrees | none |
| 49 | §3a.1 maximality vs `Ideal.ramificationIdx_under_eq_one_iff_inertia_le` | `BQ`, `H = G_0`, `H = {1, σ}` | `H = G_0`: `e = 1`, `G_0 ≤ H`; `H = {1, σ}`: `e(ℚ_p(√p)/ℚ_p) = 2`, `G_0 ≰ H` | pinned, not cited | R02 |
| 50 | §3a.1 total ramification vs `IsInertiaField.*` | `BQ`, `E = ℚ_p(ζ)` | `e(L/E) = 2 = e(L/ℚ_p)`; `e(E/ℚ_p) = 1`; `f(L/E) = 1` | pinned, not cited | R02 |
| 51 | negative control for R02 | `INS`, `H = 1` | `e(L/K) = 1` but `G_0 = G ≰ 1`: the separable instance is needed; the `IsUnramifiedAt` form says `L/K` is not unramified | consistent | R02 |
| 52 | README 117–122 vs ClassFieldTheory | main; #1215; #1411 (0333060) | main: no upper filtration in ClassFieldTheory; #1215 README 1190, `Suggested.lean` 109; #1411 README 1369–1385, 143, 2311; `ℚ_2`, `Z8`, `u = 3/2`: `{1, 5}` on both sides | only open revisions define it | R01 |
| 53 | description *Dependencies*, *Why* | grep; `roadmaps show` #879 (9856719) | `ProfiniteCohomology`: 0; README 103 consumes nothing from §F.3a; #879 names this roadmap 0 times | false | R01 |

### Library declarations opened at the pins

- **All cited names resolve.** A scratch file with `#check @…` for all 96 library names backticked in the README, importing 29 Tau Ceti modules, elaborates without error. R02's five names were checked in a second file, after `lake build` of `HilbertTheory.IntermediateRing` and `HilbertTheory.Unramified`; it also elaborates without error.
- **Mathlib, read:**
  - `RingTheory/Invariant/Basic.lean`:
    - lines 186–193: section hypotheses `[Finite G]`, `[SMulCommClass G A B]`, `[Q.IsPrime]`, `[Q.LiesOver P]`, `Algebra.IsInvariant`, and no separability;
    - line 365: `Ideal.Quotient.stabilizerHom_surjective`;
    - line 391: `Ideal.Quotient.stabilizerQuotientInertiaEquiv`.
  - `NumberTheory/RamificationInertia/Galois.lean`, lines 277–278 and 315.
- **Tau Ceti, read:**
  - `RingTheory/LocalRing/RamificationGroup.lean` 173 and `RingTheory/LocalRing/Monogenic.lean` 89 and 142 (`IsLocalHom`, `Module.Finite`).
  - `RingTheory/DiscreteValuationRing/Eisenstein.lean` 57, 144, 162 and 174 (no completeness).
  - `NumberTheory/RamificationInertia/Galois.lean` 169.
  - `NumberTheory/LocalField/RamificationGroup.lean` 150 (`[IsGalois K L]`).
  - `ResidueCorrespondence.lean` 46–49, 57 and 124 (`IsNonarchimedeanLocalField`).
  - `UnitFiltration/RamificationGroup.lean` 114, 620, 650 and 704 (finite residue field), which confirms README line 438.
  - `Herbrand/`:
    - `Jump.lean` 63 and 83;
    - `Tower.lean` 116, 199 and 216;
    - `UpperQuotient.lean` 85–89, 98 and 129;
    - `HasseArf/Abelian.lean` 46 and 50;
    - `Different/Hilbert.lean` 93.
  - `NumberTheory/LocalField/Eisenstein/TotallyRamified.lean` 119 (local fields only, so Serre, *Local Fields*, I §6, Proposition 18 is the right citation over a general base).
  - `HilbertTheory/Basic.lean` 171, 206, 232; `IntermediateRing.lean` 76, 100; `Unramified.lean` 36–50.
- **No general theorem at the pins** says that the integral closure of a complete discrete valuation ring in a finite separable extension is a discrete valuation ring. The only related result is the Kummer-specific `Kummer.lean` 187. So §3a.1 rightly owns that statement.

### Cross-roadmap citations resolved

- **Main (39d3d60).** Since the previous review, only the `PROGRESS.md` and `STATUS.md` files of four roadmaps changed. Each section cited here resolves on main:
  - ReductiveGroupsPartII §RG2.0.4, line 852. It provides `Breve E` as the completion of `TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)`, with `breveIsDiscrete`, `residueField_isAlgClosed`, `isUniformizer_algebraMap` and `fixedPoints_frobenius`, as the contract at lines 329–335 says.
  - ReductiveGroups Layer 3, line 234;
  - SchemeAndStackFoundations §0.24, line 1565;
  - AdicSpacesPartII §R0.19.9, line 7793;
  - EtaleCohomologyFoundations §F.3a, line 776;
  - LocalFieldsRamification, LocalGaloisGroups and ProfiniteProPGroups, under `Completed/`.
- **Ownership against open pull requests.** I searched by object (`hasse.arf`, `absolute upper|G_K^u`, and `def` of Herbrand or upper-filtration names in every `Suggested.lean`).
  - #1215 (024927f), README line 187, and #1411 (0333060), README lines 137–144, both give the local-field filtration to ClassFieldTheory Layer 7 and the general one to §4a.1. This is the split README lines 117–125 make, so the filtration has a single owner. `gate --depcheck` on #1411's README: 0 problems.
  - #940 line 76: "consumes, and does not construct".
  - #1713, #1795 and #1812 cite §4a.2 and §§4a.1–4a.2.
  - #1795's `GroupFiltration.herbrandPsi` belongs to an abstract filtered group, which is a different object.
  - #879 line 183 says PadicPeriodRings §0.3 "owns" this package, but #940 disclaims that. The wording is #879's to fix, and no second owner exists.
  - No fully qualified name in `Suggested.lean` is declared elsewhere.
- **Tools.** `roadmaps overlaps` finds no pull request changing this folder and no dropped id. `roadmaps resolve` finds nothing unresolved.

## Not verifiable

- **`serre-local-fields`** is settled as uncertified, so its locators are cited without the text: I §6 Proposition 18; II §2 Proposition 3; III §6 Proposition 12; IV §1 Propositions 1, 2 and 4; IV §3 Propositions 14–15 and Exercise 3; V §7 Theorem 1.
- **Open pull requests without a checkout.** #1411, #856, #879, #940, #1713, #1795, #1812 and #617 have no checkout in this brief. I read them at their indexed heads through `roadmaps show` and `roadmaps grep`.

## Source issues

- none
