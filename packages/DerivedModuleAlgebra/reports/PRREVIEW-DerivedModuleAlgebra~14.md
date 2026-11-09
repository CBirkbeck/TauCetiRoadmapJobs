# Review of DerivedModuleAlgebra (pull request #1701 at c608df8)

**Verdict:** needs changes

This is an incremental re-review of the 16 lines that changed since `b25f679`: 11 lines of `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and 5 lines of `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`, all of them in its module docstring. Nothing outside the folder changed. Below, "README" and "Lean" mean these two files at this head.

There are two findings:

- **R01 (P2)** is new. It is introduced by the repair of the previous R01. The new text says that perfection under derived base change cannot be stated at the pins. It can, in the same model form the file already uses for its residue-field criterion.
- **R02 (P3)** is the previous R02, carried over unrepaired: the pull-request description.

The new Stacks locator is correct, and so is the new Check. The gate passes, the dependency check is clean, and the Lean file elaborates with only `sorry` warnings.

## R01 (P2) — `isPerfect_baseChange` can be stated at the pins, but the docstring and README:75 say it cannot

**Location.**
- Lean:49–53, in the list of headlines that cannot be stated: “the preservation of perfection by derived scalar extension along a map of commutative rings (§1.E.0): no derived tensor bifunctor or derived extension of scalars on `DerivedCategory (ModuleCat R)` exists at the pin”.
- README:75: “The second name is plain text because `Suggested.lean` declares no theorem of that name: no derived extension of scalars on Mathlib's `DerivedCategory` of modules exists at the pins”.

**Claim.** Without a derived extension-of-scalars functor, the headline “`K ⊗^L_A B` is perfect for perfect `K`” (README:2305–2306) cannot be stated.

**Witness.** `pseudoCoherent_residueCriterion` (Lean:406–419) already states a `⊗^L` claim this way: `complexBaseChange` applied to an `IsFiniteFreeModel`, which “computes `P ⊗^L_R k` because `P` is termwise free” (Lean:403). Stacks Lemma 15.76.9 in that form elaborates at the pins (Repair, step 1).

**Why it matters.**
- ArithmeticLocallySymmetricSpaces consumes DerivedModuleAlgebra §1.E.0's `isPerfect_baseChange` as a Lean name. It cites it at README:666 and README:674 of its open head (#871), next to `isPerfect_shift`, `isPerfect_triangle` and `isPerfect_retract`. Lean declares those three, but not `isPerfect_baseChange`.
- Main's `Suggested.lean`:720 declared `isPerfect_baseChange` through the sorry'd functor `derivedBaseChange`. This head correctly deletes that functor. The model form restores the name without sorry'd data.
- The new rationale at README:75 is not the convention the table follows. `derivedLimit_surjective` (README:65) and `ringCompletionUnit` (README:71) are backticked although Lean declares neither.

**Repair.**

1. In Lean, insert this after `isPerfect_isPseudoCoherent` (Lean:380–382):

   ```lean
   /-- **Derived scalar extension preserves perfection** (README 1.E.0; Stacks, Lemma 15.76.9,
   Tag 066W), stated on a bounded-above finite-free model `P`, whose termwise scalar extension
   computes `P ⊗^L_R S` because `P` is termwise free. -/
   theorem isPerfect_baseChange {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S)
       (P : CochainComplex (ModuleCat.{u} R) ℤ) (b : ℤ) (hP : IsFiniteFreeModel R P b)
       (hK : IsPerfect R ((DerivedCategory.Q (C := ModuleCat R)).obj P)) :
       IsPerfect S ((DerivedCategory.Q (C := ModuleCat S)).obj ((complexBaseChange f).obj P)) := by
     sorry
   ```

2. In the docstring bullet (Lean:49–53), delete “and the preservation of perfection by derived scalar extension along a map of commutative rings”. The bullet then lists only the derived tensor (§0.2) and the scalar extension and restriction functors with their adjunction (§1.E.0).

3. At README:75, write `` `isPerfect_baseChange` `` in backticks. Make the right column: “§1.E.0: `DerivedDeRham.IsPerfect`, and perfection under derived extension of scalars, stated on a bounded-above finite-free model”. Delete the “plain text because” sentence.

4. In the *Lean:* paragraph of §1.E.0 (README:2319–2323), add: “`isPerfect_baseChange`, stated on a bounded-above finite-free model `P` of `K`, whose termwise scalar extension `complexBaseChange f` computes `K ⊗^L_A B`”. This is the wording README:2423–2425 already uses for the residue criterion.

The model form covers every perfect `K`, for two reasons:
- every perfect `K` has a bounded-above finite-free model (`isPerfect_isPseudoCoherent`);
- the finite-free base-change comparison (README:2308–2310) identifies termwise and derived base change.

**Test.** I ran this on a scratch copy of Lean with the theorem inserted.

- **Elaboration.** The theorem elaborates. `#check @isPerfect_baseChange` gives `∀ {R S} [CommRing R] [CommRing S] (f : R →+* S) (P) (b : ℤ), IsFiniteFreeModel R P b → IsPerfect R (Q.obj P) → IsPerfect S (Q.obj ((complexBaseChange f).obj P))`.
- **Not padding.** In a second copy without the sorried theorem, `first | rfl | (simp; done) | infer_instance | exact?` fails with “`exact?` could not close the goal”.
- **Instances:**
  - `P = [ℤ --2→ ℤ]` along `ℤ → F₂` gives `[F₂ --0→ F₂]`, which is perfect.
  - The finite-free resolution of `ℤ/2` over `ℤ/4`, with `b = 0`, satisfies `hP` but not `hK`. Its base change to `F₂` has `H^(−i) = F₂` for every `i ≥ 0`, so `hK` is needed. This is the README's new Check.
  - Along `R → 0` the output is the zero complex, which is perfect.
- **Alternative repair.** One could instead declare that this lemma is not a headline and drop it from the docstring. That would leave ArithmeticLocallySymmetricSpaces' Lean-name citation with no declaration.

## R02 (P3) — The pull-request description does not match the change

This is the previous review's R02, not repaired. The repair is an edit of the description on GitHub, not of the folder.

**Location.** The description (data) still says:
- “README only; `Suggested.lean` is unchanged”;
- “Polynomial laws with Roby representability (`PD.robyRepresentability`)”;
- “Thirteen roadmaps consume it”.

**Witness.**
- `git diff --numstat origin/main...HEAD` gives `344 1227` for `Suggested.lean`.
- `robyRepresentability` occurs nowhere in the folder.
- README:2613–2618 lists eighteen consumers.

**Repair.**
- State that the head replaces main's `Suggested.lean` with its headline theorems and the definitions they need.
- Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv` (README:114, 267).
- Replace “Thirteen” with “Eighteen”.

**Test.** Re-read the description against `git diff --stat origin/main...HEAD` and README:2611–2620.

## Previous findings

- R01 — partly repaired: README:75 now reads “isPerfect_baseChange | … The second name is plain text because `Suggested.lean` declares no theorem of that name: no derived extension of scalars … exists at the pins”. The explanation's premise fails, since the model form can be stated. Now R01 (P2).
- R02 — not repaired: the description still says “README only; `Suggested.lean` is unchanged”, still cites `PD.robyRepresentability`, and still says “Thirteen roadmaps consume it”. Now R02.

## Verified sound

### Gate, dependency check, worktree

- **Worktree.** At `c608df8d`, clean.
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty.
  - `git diff --stat b25f679 HEAD` touches only the two files, 10 insertions and 6 deletions.
- **Gate (my run).** Every counter is 0, then `OK`, exit 0. The worker's record for this head also has `build=0`.
- **Dependency check.** Output:

```text
depcheck: 239 roadmaps, 2368 edges, 0 problem(s)
```

- **Suppliers.** The diff adds no `*Needs:*` edge and no roadmap supplier. The new sentence cites only §0.2 of this roadmap and StacksMA. No gaps are declared and none are needed.

### Elaboration and signatures

- **Elaboration.** `lake env lean` on Lean, run from the worktree, gives exactly 22 “declaration uses `sorry`” warnings and nothing else. They are at lines 106, 121, 144, 161, 184, 202, 224, 255, 264, 271, 277, 286, 305, 324, 361, 367, 373, 380, 393, 406, 430 and 443. Each is one line below its position at `b25f679`, because the docstring grew by one line.
- **Lean diff.** `git diff b25f679 HEAD -- …/Suggested.lean` changes only lines of the docstring's “not statable” bullet. No declaration changed.
- **Signatures.** I elaborated the 32 `#check @name` lines of the worker's signature file once. All 32 elaborate, with no error and no dropped binder. They agree with `signatures.md`, which matches the r13 pass because no statement changed.

### The changed passages, read against the source and the pins

- **README:2305–2306, new locator.** StacksMA line 8830 is the page marker for p.192. Lines 8844–8848 are Lemma 76.9, Tag 066W: for a ring map `A → B` and perfect `K` over `A`, `K ⊗^L_A B` is perfect over `B`. Stacks rings are commutative, as the README says. The References entry (README:2662, link README:2686) covers the chapter, and p.192 is the chapter-local page that the References preamble prescribes.
- **README:2307, finite Tor interval.** Covered by Lemma 15.76.2, Tag 0658, direction (1)⇒(2) (StacksMA lines 8800–8805), which is cited at README:2312.
- **“of §0.2”.** README:793–796 defines derived extension of scalars along `R → R′` as `− ⊗^L_R R′`. The section's *Needs:* line (README:2315) lists §0.2.
- **New Check, README:2333–2336.** Computed in the table below. It is correct, and it is the negative control for the perfection hypothesis.
- **The pins (the factual half of the new docstring sentence).**
  - In Mathlib, no file under `Algebra/Category/ModuleCat` that mentions `DerivedCategory` builds a tensor or a scalar extension; the only matches are the `Ext/` files. No occurrence of `extendScalars` comes with `HomotopyCategory`, `leftDerived` or a derived functor.
  - In Tau Ceti, the only derived tensor functors are the zigzag-specific ones in `TauCeti/RepresentationTheory/Quiver/Zigzag/Braid/Module/Derived/Relations.lean`:17, for graded zigzag modules.
  - Tau Ceti's K-flat files give resolutions, not a functor on `D(R)`: `TauCeti/Algebra/Homology/ModuleCat/KFlat.lean`:39, `exists_quasiIso_isKFlat_moduleCat`, and `TauCeti/Algebra/Homology/Monoidal/KFlat/Basic.lean`.
  - So “no derived extension of scalars exists at the pins” is true. Only the inference “so it cannot be stated” fails (R01).

### Cross-roadmap citations, ownership and overlaps

- **Diff.** It adds no cross-roadmap citation.
- **`overlaps.md`.**
  - No other open pull request changes this roadmap.
  - No id this README cites is dropped.
  - No cited id is defined only by an open revision.
  - The dropped §1.T.1 ids are still mapped at README:34–36, which the diff does not touch.
- **Who cites `isPerfect_baseChange`.**
  - ArithmeticLocallySymmetricSpaces at its open head (#871): README:511, 666 and 674. Read with `roadmaps show`.
  - Main's DerivedModuleAlgebra: README:2083 and `Suggested.lean`:720, with the sorry'd `derivedBaseChange` at main's `Suggested.lean`:661–663.
- **Ownership.** Tag 066W occurs elsewhere only at ArithmeticLocallySymmetricSpaces README:658. There it is a locator for statements that roadmap consumes from DerivedModuleAlgebra §1.E.0, so there is no second owner. Ownership against the other open pull requests is unchanged by the diff.
- **Seeded sample.** None of the sampled targets (§§0.1, 0.2.1, 0.2.2, 0.3, 0.6, 0.7, 0.10–0.14, 0.17, 1.1.1, 1.2, 1.9) lies in the changed passages. Previous rounds read them against their sources. The one dependency of the changed text on unsampled text, §0.2's definition of derived scalar extension, is checked above. The README flags no locator as unverified.

### Adversarial table

The first six rows are for the statements the diff changes, plus the theorem the repair proposes, with values computed this round. The rest are carried from the previous review (PRREVIEW-DerivedModuleAlgebra~13, marked “r13”) for statements the diff leaves untouched. Their line numbers are given at this head.

| Statement | Instances | Values on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| §1.E.0 base change, new (README:2305–2306) | `[ℤ --2→ ℤ]` along `ℤ → F₂`; `f = id`; `B = 0`; `eA` along `k×k → k`, first factor | `[F₂ --0→ F₂]`: `H⁻¹ = H⁰ = F₂`, bounded free, so perfect. `K ⊗^L_A A ≅ K`. Output `0`, perfect. `eA` is projective, so `⊗^L = ⊗ = k`, perfect. Wrong model, base change of `H⁰` alone: `ℤ/2 ⊗ F₂ = F₂` loses `H⁻¹`, which the first Check excludes. Matches StacksMA lines 8844–8845 | True | none |
| New Check (README:2333–2336) | `ℤ/2` over `ℤ/4`, along `ℤ/4 → F₂` | Resolution `⋯ --2→ ℤ/4 --2→ ℤ/4`; after `⊗F₂` every differential is `0`, so `H^(−i) = Tor_i^(ℤ/4)(ℤ/2, F₂) = F₂` for all `i ≥ 0`. Perfect over a field would bound the cohomology, so the output is not perfect. Consistent with Lemma 76.9: `ℤ/2` is not perfect over `ℤ/4` | True | none |
| Finite Tor interval, reworded (README:2307) | `A[0]`, `A[1]`; bounded `[a,b]` finite projective; `k` over `k[ε]` | Amplitudes `[0,0]` and `[−1,−1]` (Check README:2327–2329). A termwise-flat bounded complex computes `⊗^L`, so its amplitude lies in `[a,b]`. `k` over `k[ε]` has `Tor_i = k` for all `i`, so no interval, matching the Check at README:2431–2434 and non-perfection | True | none |
| Docstring bullet (Lean:49–53) and README:75 | pin grep; model form | No derived extension of scalars on `D(ModuleCat R)` in Mathlib or Tau Ceti: true. “Not statable”: false, since the model form elaborates and `exact?` fails | Overclaim | R01 |
| Proposed `isPerfect_baseChange` (R01 repair) | `[ℤ --2→ ℤ]`, `ℤ → F₂`; resolution of `ℤ/2` over `ℤ/4`, `b = 0`; `S = 0`; `f = id` | Output perfect. `hP` holds but `hK` fails, and the output has `H^(−i) = F₂` for all `i`, so `hK` is needed. Zero complex, perfect. `P ⊗_R R ≅ P`, and `IsPerfect` is iso-invariant by its `Nonempty (… ≅ K)` clause | True | add (R01) |
| Lean statements (all 32) | `git diff b25f679 HEAD` | Docstring lines only; 22 `sorry` warnings, each one line below its old position | Unchanged | none |
| §0.4 functoriality law (README:1201–1206) | `ℤ → ℤ[x]` over `ℤ → ℤ`, `b(x) = 0`; `ℤ → ℤ/2`; flat square | Zero in `H⁰`; `ℤ/2[1] → 0`, map only; `d[x] ↦ d[x] ≠ 0` (r13) | True | none |
| §0.DP.1 homogeneity (README:160–168) | zero law; `f + g`; `g∘f`; `x + x²` | Degree `mn` for the composite; `x + x²` not homogeneous at `s = 2` (r13) | True | none |
| §0.DP.3 free-module facts (README:396–626) | `ℤ⟨x⟩`, `I = (2)`; `F₂⟨x⟩` | `IA⟨x⟩ ∩ A⟨x⟩₊ = IA⟨x⟩·A⟨x⟩₊`; `x^[2] ∉ (x)` (r13) | True | none |
| §0.K.1 Koszul (README:644–676) | `(2)`, `(0)` over `ℤ`; `K(2,2)` | `H₀ = ℤ/2`, `H₁ = 0`; `H₁ = ℤ`; sign `f₁e₂ − f₂e₁` (r13) | True | none |
| §1.E.1 effectivity (README:2445–2455) | `k[t]/t^(n+1)`, `M_n = A_n`; `M_n = k` | `Rlim = k[[t]]`; for `k` the derived hypothesis and the conclusion both fail (r13) | True | none |
| §0.1 resolution (README:744–784) | constant `A[t]` over `A[t]/(t²)` | `H₀ = A[t]` vs `B` (r13) | True | none |
| §0.2 K-flatness (README:788–848) | `ℤ/4`, `×2`; `F_p ⊗^L F_p` | `H = F₂` in every degree; `H⁰ = H⁻¹ = F_p` (r13) | True | none |
| `quasiIso_whiskering_of_projective` (Lean:161) | `Γ₀[ℤ --2→ ℤ] → ℤ/2`; `W**` | `Tor₁ = ℤ/2` vs `0`; `V → V**` not onto (r13) | True | none |
| §0.4 Checks (README:1212–1224) | `k[ε]/ε²`; `ℤ → ℤ/2` | `H⁻¹ = εB`; `H⁻¹ = ℤ/2` (r13) | True | none |
| §0.5 Baer sum (README:1286–1304) | `Exal_ℤ(F₂,F₂)` | `F₂`, the `ℤ/4` class of order 2 (r13) | True | none |
| §0.7 (README:1308–1325) | `k[x,y]/(x,y)²` | `H⁻² = k` (r13) | True | none |
| §0.6 (README:1329–1369) | `ℤ → ℤ/p`; `ℤ/9 → F₃` | `0`; `1 ↦ 3` gives `1`, `1 ↦ 6` gives `2` (r13) | True | none |
| §0.8 (README:1373–1407) | `ℤ → ℤ → ℤ/3` | nonzero on `H⁻¹` (r13) | True | none |
| §0.11 (README:1463–1476) | `ℤ[X] → ℤ[X^±]` | relative `L = 0` (r13) | True | none |
| décalage (Lean:184, 202) | `N = R`, `n = 0,1,2`; `N = ℤ/2` | `R` in degree 2; `F₂ ≠ ℤ/4` (r13) | True | none |
| §1.1.1 Check (README:1902) | `RHom(ℤ[1/p], ℤ)` | `H⁰ = 0`, `H¹ = ℤ_p/ℤ` (r13) | True | none |
| §1.2 laws (Lean:249–281) | `I = A`; `I = 0`; `ℤ[−1]` | all `Hᵏ = 0`; `n = −1` detects (r13) | True | none |
| §1.3 reflector (Lean:286) | `ℤ`, `ℤ[1/p]`, `ℤ/p^m` | `ℤ_p`, `0`, fixed (r13) | True | none |
| §1.4 Koszul tower (README:2015–2029) | `K(p^(n+1)) → K(p^n)` | `(×p, id)` (r13) | True | none |
| §1.5 Check (README:2056–2071) | `ℤ_p ⋉ ℚ_p/ℤ_p` | nonsplit in `D(A)` (r13) | True | none |
| §1.9 descent (README:2256–2272) | `ℤ_p → F_p` | `H⁻¹ = F_p ≠ 0` (r13) | True | none |
| `nonempty_bicomplexSecondPageIso` (Lean:106) | pages 2, 3 | `(−k−2p, p)` (r13) | True | none |
| `simplicialTensorComparison` (Lean:121) | `x, y ∈ X₁, Y₁` | the sign at `p = 1` (r13) | True | none |
| `bisimplicialDiagonalComparison` (Lean:144) | constant `P` | `P` in degree 0 (r13) | True | none |
| `derivedLimit_isTriangulated` (Lean:224) | `⊕_(m≥n) k` | `lim¹ = ∏k/⊕k` (r13) | True | none |
| `IsCompletelyFlatModule` (Lean:294) | `I = 0`; `I = A`; `F_p` | flatness; every `M`; `Tor₁ ≠ 0` (r13) | Discriminating | none |
| `isAdicComplete_of_isCompletelyFlatModule` (Lean:305) | `ℤ/4`; `ℚ` | iso; `M = 0` (r13) | True | none |
| `isCompletelyFlatModule_of_isAdicComplete` (Lean:324) | `ℤ/4`, `M = ℤ/2` | `Tor₁ = ℤ/2` (r13) | True | none |
| `IsPerfect` and closure (Lean:347–382) | `eA ⊂ k×k`; `[ℤ --2→ ℤ]` | Euler ranks `(1,0)`; `H⁻¹` kept (r13) | True | none |
| `ringTowerLimit_jacobson` (Lean:393) | `k[t]/(t^(n+1))`; `A₀ = 0` | inverse `Σ(−t)^m`; hypotheses needed (r13) | True | none |
| `pseudoCoherent_residueCriterion` (Lean:406) | `[k[[t]] --t→ k[[t]]]`; `k` over `k[ε]` | `[−1,0]`; no interval (r13) | True | none |
| `biduality_of_finite` / `_of_artinian` (Lean:430, 443) | `ℤ_p`; `ℤ_(p)` | `End(ℚ_p/ℤ_p) = ℤ_p ≠ ℤ_(p)` (r13) | True | none |
| §1.M.1 Check (README:2552) | `⊕_ℕ k` | `D(M) = ∏k`, not onto (r13) | True | none |
| §1.E.1 Checks (README:2475–2482) | `[A_n --t→ A_n]`; `k[x₁,…]/(x_i²)` | `H⁻¹ ↦ 0`; nil, not nilpotent (r13) | True | none |
| §1.1 Checks (README:1865–1871) | drop `r` levels; `h_n = x₀` | `Σ9^m = −1/8 ∉ ℤ` (r13) | True | none |
| §0.25 Checks (README:1705–1745) | `k[x]/(x³) → k[x]/(x²) → k` | connecting map onto `k` (r13) | True | none |
| Convention README:96 (`k` a field) | Checks README:1702, 2330, 2431 | `k = 0` collapses each (r13) | Consistent | none |

## Not verifiable

- Nothing in the changed passages. StacksMA Lemma 15.76.9 was read in the cached text.
- The r13 items lie in untouched text and stand as r13 recorded them:
  - the NSW page numbers at README:960–962;
  - IllusieCC, Chapter II, 1.2.6.2.

## Source issues

- none
