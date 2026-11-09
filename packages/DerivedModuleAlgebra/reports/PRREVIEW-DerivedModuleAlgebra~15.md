# Review of DerivedModuleAlgebra (pull request #1701 at f0f43c4)

**Verdict:** needs changes

This is an incremental re-review of the 126 lines changed since `c608df8`: 45 lines of `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and 81 lines of `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`. Nothing outside the folder changed. Below, "README" and "Lean" mean these two files at this head.

The previous R01 is repaired: `isPerfect_baseChange` is now declared exactly as proposed. The head also adds two new model-form headlines, `completeNakayama` and `cohomologicalAmplitude_of_completeTorAmplitude`. Both are true as stated, and their locators, Checks and negative controls are correct. Three findings remain:

- **R01 (P2), new.** The rewritten module docstring says that the §1.5 ordinary-quotient comparison cannot be stated because no pinned construction supplies its tower. A pinned Tau Ceti functor supplies it, and the statement elaborates.
- **R02 (P3), new.** The rewritten reason for §§1.E.0–1.E.1 says morphisms of `D(A_(n+1))` are not chain maps of models. README §1.E.0 says they are.
- **R03 (P3).** The previous R02, not repaired: the pull-request description.

The gate passes, the dependency check is clean, and Lean elaborates with only `sorry` warnings.

## R01 (P2) — The §1.5 comparison can be stated at the pins, but the docstring says no pinned construction supplies its tower

**Location.** Lean:73–77, in the list of headlines that cannot be stated: “each identifies the completion functor `Λ_I` of §1.3, a construction of which only the existence is stated below, with the derived limit of the tower … `n ↦ M ⊗^L_A A/Iⁿ`, an object … that no pinned construction supplies”.

**Claim.** The ordinary-quotient comparison of §1.5 (README:2044–2053) cannot be stated, for two reasons:
- (a) only the existence of `Λ_I` is stated;
- (b) no pinned construction supplies the tower `n ↦ M ⊗^L_A A/Iⁿ`.

**Witness.** Tau Ceti's `TauCeti.ModuleTower.reductionFunctor I` (`TauCeti/Algebra/Category/ModuleCat/Tower/Reduction.lean`:377), applied termwise to a K-flat model `P`, is the tower `n ↦ P/I^(n+1)P`. Combined with `TauCeti.ModuleTower.derivedLimit`, the statement below elaborates at the pins.

**Why both reasons fail.**
- **(b)** The head already states derived Nakayama on a K-flat model `P` of `M` (Lean:308). On such a `P`, `P/I^(n+1)P = P ⊗_A A/I^(n+1)` computes `M ⊗^L_A A/I^(n+1)`. Tau Ceti's `TauCeti.ModuleTower.derivedLimit` (`Tower/DerivedLimit.lean`:310) takes its derived limit in `D(A)`.
- **(a)** An object `X` is `Λ_I M` exactly when `X` is derived complete and some map `η : M → X` makes `g ↦ η ≫ g` bijective onto `Hom(M, N)` for every complete `N`. No functor is needed to say this.

**Why it matters.** `DerivedDeRham.ordinaryQuotientCompletion` is cited as a Lean name by:
- PerfectoidSpaces on main (README:10971);
- HabiroRings at its open head (#1425, README:61), “retaining its regular-sequence or bounded-torsion hypotheses”.

README:70 maps that name to §1.5, and Lean declares nothing for it.

**Repair.**

1. In Lean's imports, add `public import TauCeti.Algebra.Category.ModuleCat.Tower.Reduction`.

2. Insert this after `completeNakayama` (Lean:315):

   ```lean
   /-- **Ordinary quotient towers compute derived completion over a Noetherian ring** (README 1.5;
   Stacks, Proposition 15.96.2, Tag 0922). Let `A` be Noetherian, `I` an ideal and `P` a K-flat
   complex with image `M` in `D(A)`. The strict tower `n ↦ P/I^(n+1)P` computes
   `n ↦ M ⊗^L_A A/I^(n+1)`; its derived limit is derived `I`-complete, and a map from `M` exhibits
   it as the derived completion `Λ_I M`. -/
   theorem ordinaryQuotientCompletion (A : Type u) [CommRing A] [IsNoetherianRing A]
       (I : Ideal A) [HasDerivedCategory.{w} (TauCeti.ModuleTower.{u} A)]
       (P : CochainComplex (ModuleCat.{u} A) ℤ) [P.IsKFlat] :
       ∃ η : (DerivedCategory.Q (C := ModuleCat A)).obj P ⟶
           (TauCeti.ModuleTower.derivedLimit A).obj
             ((DerivedCategory.Q (C := TauCeti.ModuleTower.{u} A)).obj
               (((TauCeti.ModuleTower.reductionFunctor I).mapHomologicalComplex
                 (ComplexShape.up ℤ)).obj P)),
         derivedCompleteness A I ((TauCeti.ModuleTower.derivedLimit A).obj
             ((DerivedCategory.Q (C := TauCeti.ModuleTower.{u} A)).obj
               (((TauCeti.ModuleTower.reductionFunctor I).mapHomologicalComplex
                 (ComplexShape.up ℤ)).obj P))) ∧
         ∀ N : D A, derivedCompleteness A I N → Function.Bijective (fun g : _ ⟶ N ↦ η ≫ g) := by
     sorry
   ```

3. Add the principal case that HabiroRings uses: `ordinaryQuotientCompletion_of_boundedTorsion` (Stacks, Lemma 15.95.2, Tag 0923). Its statement is the one above with three changes:
   - `I := Ideal.span {f}`;
   - `[IsNoetherianRing A]` replaced by `(hA : ∃ c : ℕ, ∀ (a : A) (n : ℕ), f ^ n * a = 0 → f ^ c * a = 0)`;
   - the same conclusion.

4. Edit Lean:73–77:
   - Delete §1.5 and the clause “a construction of which only the existence is stated below”. The universal property states the identification.
   - Keep §1.4, with its real missing carrier: the tower of cochain Koszul complexes `n ↦ K(f₁ⁿ, …, f_rⁿ)`, with transitions `e_i ↦ f_i e_i`, is a construction of §1.4. Tau Ceti's `TauCeti.koszulComplex` is a single `ℕ`-indexed chain complex.
   - Add §1.5 to the list of headlines stated on K-flat models (Lean:53–56).

5. In the README:
   - After README:2052, add: “These are the headlines `DerivedDeRham.ordinaryQuotientCompletion` (Noetherian `A`) and `DerivedDeRham.ordinaryQuotientCompletion_of_boundedTorsion` (`I = (f)` with bounded `f`-power torsion). They are stated on a K-flat model `P` of `M`, whose termwise tower `n ↦ P/I^(n+1)P` (Tau Ceti `TauCeti.ModuleTower.reductionFunctor`) computes `n ↦ M ⊗^L_A A/I^(n+1)`, with `Λ_I M` characterised by its universal property.”
   - In the *Needs:* line (README:2058–2060), add Tau Ceti `TauCeti.ModuleTower.reductionFunctor`, `TauCeti.ModuleTower.derivedLimit` and `CochainComplex.IsKFlat`.
   - Add `TauCeti.ModuleTower.reductionFunctor` (`Tower.Reduction`) to the supplier row at README:112.
   - In README:70, make the right column “§1.5: `DerivedDeRham.ordinaryQuotientCompletion` and `DerivedDeRham.ordinaryQuotientCompletion_of_boundedTorsion`, stated on a K-flat model”.

**Test.**

- **Elaboration.** I inserted both statements, under probe names, with the import, into a scratch copy of Lean. `lake env lean` exits 0 with 27 `sorry` warnings (25 at this head plus the two probes) and no other message. `#check` prints the Noetherian statement as `∀ A [CommRing A] [IsNoetherianRing A] (I) [HasDerivedCategory (TauCeti.ModuleTower A)] (P) [P.IsKFlat], ∃ η, derivedCompleteness A I (…) ∧ ∀ N, …`.
- **Instances:**
  - `A = ℤ`, `I = (p)`, `P = ℤ[0]`: the tower is `ℤ/p^(n+1)` with surjective transitions. `Rlim = ℤ_p[0]`, which is complete, and `η : ℤ → ℤ_p` is the completion unit. This matches the Check at README:2064.
  - `I = 0`: the tower is constant, `Rlim = M` and `η = id`.
  - `I = A`: the tower is zero. `Rlim = 0`, the only complete object.
  - `A = ℤ_p ⋉ ℚ_p/ℤ_p`, `I = (p)`: this ring is neither Noetherian nor of bounded torsion. The ordinary tower gives `R[0]`, while `H^−1(Λ_I A) ≅ R` (README:2067–2072). So the hypotheses of both statements are needed.
- **Sources.** StacksMA lines 12739–12742 (p.276) give Tag 0922 for Noetherian `A` and every ideal. Lines 12520–12525 (p.271) give Tag 0923 for `I = (f)`: the naive completion is the derived completion exactly when the `f`-power torsion is bounded.

## R02 (P3) — The docstring's reason for §§1.E.0–1.E.1 contradicts README §1.E.0

**Location.** Lean:88–90: “these need the functor and adjunction above, since a finite-free model computes the derived scalar extension of an object, while a morphism of `D(A_(n+1))` is not a chain map of models.”

**Claim.** The model form fails for these statements because the derived-category transition maps cannot be represented on finite-free models.

**Witness.** README:2370–2372 says compatible models carry “isomorphisms of complexes `P_(n+1) ⊗_(A_(n+1)) A_n ≅ P_n` … Their adjoints are actual semilinear chain maps representing the original transitions.”

**Why the reason is false.** A bounded-above complex of finite free modules is K-projective. So every morphism of `D(A_(n+1))` out of such a model is the homotopy class of a chain map, and the model form extends to morphisms.

**Repair.** At Lean:84–90, replace the text from “besides objects” to the end of the bullet with: “their statements concern compatible finite-free models, the strict tower of `A`-complexes obtained by restricting them along `A → A_n`, its termwise limit, and the derived category of varying-ring diagrams `D(Mod(ℕ,(A_n)))` with its evaluation and restriction functors, all constructions of §1.E.0”. Stating effectivity on given compatible models instead is an equally valid repair.

**Test.** The replacement makes no claim about morphisms. Each object it names is introduced by a “Construct” sentence of README §1.E.0:
- compatible models, README:2368;
- the restricted strict tower, README:2393–2395;
- the termwise limit, README:2400;
- the varying-ring derived category and its functors, README:2408–2411.

## R03 (P3) — The pull-request description does not match the change

This is the previous review's R02, not repaired. The repair is an edit of the description on GitHub, not of the folder.

**Location.** The description (data) still says:
- “README only; `Suggested.lean` is unchanged”;
- “Polynomial laws with Roby representability (`PD.robyRepresentability`)”;
- “Thirteen roadmaps consume it”.

**Witness.**
- `git diff --numstat origin/main...HEAD` gives `400 1224` for `Suggested.lean`.
- `robyRepresentability` has 0 occurrences in the folder.
- README:2638–2643 lists eighteen consumers.

**Repair.**
- State that the head replaces main's `Suggested.lean` with its headline theorems and the definitions they need.
- Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv` (README:114).
- Replace “Thirteen” with “Eighteen”.

**Test.** Re-read the description against `git diff --stat origin/main...HEAD` and README:2636–2643.

## Previous findings

- R01 — repaired: Lean:437–441 declares `isPerfect_baseChange (f : R →+* S) (P) (b) (hP : IsFiniteFreeModel R P b) (hK : IsPerfect R (Q.obj P)) : IsPerfect S (Q.obj ((complexBaseChange f).obj P))`. README:75 backticks it. Lean:50–56 no longer lists it as unstatable.
- R02 — not repaired: the description still says “README only; `Suggested.lean` is unchanged”, still cites `PD.robyRepresentability`, and still says “Thirteen roadmaps consume it” (now R03).

## Verified sound

### Gate, dependency check, worktree

- **Worktree.** At `f0f43c4d`, clean.
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty.
  - The diff since `c608df8` touches only the two folder files: 105 insertions and 21 deletions.
- **Gate (my run).** Every counter is 0, then `OK`, exit 0. The worker's record for this head also has `build=0`.
- **Dependency check.** Output:

```text
depcheck: 239 roadmaps, 2367 edges, 0 problem(s)
```

- **New supplier edges.** The only new *Needs:* items are Tau Ceti `CochainComplex.IsKFlat` and `CochainComplex.exists_quasiIso_isKFlat_moduleCat` (README:1978–1979, 2255). I opened both at the pin:
  - `TauCeti/Algebra/Homology/Monoidal/KFlat/Basic.lean`:89: `class IsKFlat`. Tensoring with an acyclic complex on the left stays acyclic; the K-flat factor is the left one.
  - `TauCeti/Algebra/Homology/ModuleCat/KFlat.lean`:39: every complex of modules has a quasi-isomorphic K-flat model.
- **Suppliers and gaps.** No roadmap supplier was added. No gaps are declared and none are needed.

### Elaboration, signatures, padding

- **Elaboration.** `lake env lean` on Lean gives exactly 25 “declaration uses `sorry`” warnings and nothing else. They are at lines 117, 132, 155, 172, 195, 213, 235, 266, 275, 282, 288, 297, 308, 333, 352, 371, 408, 414, 420, 427, 437, 452, 465, 489 and 502. That is r14's 22, shifted, plus the new 308, 333 and 437.
- **New import.** `TauCeti.Algebra.Homology.Monoidal.KFlat.Basic` exists at the pinned Tau Ceti and is used, by `IsKFlat`.
- **Signatures.** I elaborated the worker's 35 `#check @name` lines once. All 35 elaborate with no error and no dropped binder.
  - `completeNakayama` keeps `hI : I.FG`, `[P.IsKFlat]`, `hc` and `h`.
  - `cohomologicalAmplitude_of_completeTorAmplitude` keeps `hp`, `hA`, `[P.IsKFlat]`, `hc` and `hamp`, with `a b : ℤ`.
  - `isPerfect_baseChange` keeps `hP` and `hK`.
  - Each has the generality of its README statement: commutative `A`, and a map of commutative rings for base change.
- **Padding probe.** On a scratch copy, the three new theorems were each given `first | rfl | (simp; done) | infer_instance | exact?` in place of `sorry`. All three fail with “`exact?` could not close the goal”, so none is padding.

### The changed passages, read against the sources

- **Derived Nakayama.** StacksMA lines 12342–12365 (p.268) are Lemma 15.93.20, Tag 0G1U: for a finitely generated `I` and a derived complete `K`, `K ⊗^L_A A/I = 0` implies `K = 0`. This matches README:1954–1955 and Lean:301–315.
  - The §1.3 summary locator (README:1971–1972) is also right: Tag 091V at p.264 (line 12163), Tag 0920 at p.267 (line 12293), Tags 0G1U and 0AAJ at p.268 (lines 12344, 12374).
- **Amplitude bound.** BMS19 lines 895–896 (p.221) are Lemma 4.6: for `A` with bounded p^∞-torsion and a derived p-complete `M` with p-complete Tor amplitude in `[a, b]`, `a, b ∈ ℤ`, `M ∈ D^[a,b]`. This matches README:2237–2238 and Lean:326–344.
  - Definition 4.1 (lines 850–853, p.220) and footnote 9 (lines 876–878) quantify over all `A/p`-modules `N`. Since `(M ⊗^L A/p) ⊗^L_(A/p) N ≅ M ⊗^L_A N`, this is Lean's `hamp` over `A`-modules killed by `p`.
  - The cohomological indexing agrees with the Check at README:2259.
- **BMS19 Lemma 4.4.** Lines 872–887 (pp.220–221): p-complete Tor amplitude and flatness pass to the derived completion. Its proof's isomorphism `M ⊗^L A/p ≅ M̂ ⊗^L A/p` is the fact cited at README:2263–2264.
- **K-flatness.** StacksMA lines 6741–6742 (p.145) are Lemma 15.60.7, Tag 064K: a bounded-above complex of flat modules is K-flat, as cited at Lean:434–435.
- **Model claims.** `tensorRight N` applied to `P` has terms `P^k ⊗ N`, with the K-flat factor on the left as `IsKFlat` requires. So the termwise tensor computes `⊗^L` (the `quasiIso_id_tensorHom` characterisation in the Basic.lean docstring). Every object has such a model (`exists_quasiIso_isKFlat_moduleCat`). Every perfect complex has a bounded-above finite-free model (`IsPseudoCoherent`, Lean:402–404, with `isPerfect_isPseudoCoherent`).

### Cross-roadmap citations, ownership, overlaps

- **The three new names.** `roadmaps grep` finds them declared only in this folder. Their citations now resolve:
  - `isPerfect_baseChange`: ArithmeticLocallySymmetricSpaces at #871, README:511, 666 and 674;
  - `DerivedDeRham.completeNakayama`: PerfectoidSpaces on main, README:10971, and HabiroRings at #1425, README:61.
- **Derived Nakayama elsewhere.** Other roadmaps use derived Nakayama as an input, for example AInfCohomology at #1044, README:364, “Section 1.3's derived Nakayama”. The law was already a §1.3 target on main (README:1991), so the diff does not change ownership.
- **`overlaps.md`.**
  - No other open pull request changes this roadmap.
  - No cited id is dropped, and none is defined only by an open revision.
  - The dropped §1.T.1 ids are still mapped at README:34–36.
- **Citation leads.** The `citations.md` leads for the three new names are resolved by `#check`.

### Seeded sample

- **§1.3.** It lies in the changed passages, and its locators are verified above.
- **§1.5 and §1.7.** The diff touches them only through Lean's docstring bullets.
  - For R01 I read Tags 0922 (p.276) and 0923 (p.271).
  - §1.5's own locator “Tags 0921, 0922, pp.275–276” is correct: line 12717 is on p.275 and line 12739 on p.276.
- **The other sampled targets** (§§0.2, 0.3, 0.5, 0.6, 0.8, 0.9, 0.11, 0.14, 0.16, 0.17, 1.1, 1.1.1) lie outside the changed passages. Previous rounds read them against their sources. The README flags no locator as unverified.

### Adversarial table

The rows down to the R01 probe are for the statements the diff adds or changes, with values computed this round. The rest are carried from the previous review (PRREVIEW-DerivedModuleAlgebra~14, which carried r13's values), at their line numbers at this head.

| Statement | Instances | Values on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| `completeNakayama` (Lean:308) | `I = A`; `I = 0`; `ℤ`, `(p)`: `P = ℤ[1/p][0]`, `ℤ_p[0]`; `O = O_ℂp`, `I = m` | **`I = A`:** only `0` is complete, so `hc` gives `M = 0` (and `h` is automatic, `A/A = 0`). **`I = 0`:** `P ⊗ A ≅ P`, so `h` is the conclusion. **`ℤ[1/p]`:** `ℤ[1/p]/p = 0`, so `h` holds; `hc` fails since `Hom(ℤ[1/p], ℤ[1/p]) ≠ 0`; the conclusion fails, so `hc` is needed. **`ℤ_p`:** `h` fails, `F_p ≠ 0`. **`m`:** `hc` holds (Ext⁰ = Ext¹ = 0 for each `f ≠ 0`, and `O_0 = 0`), `h` holds (`m/m² = 0`), yet `m ≠ 0`, so `hI` is needed | True | none |
| `cohomologicalAmplitude_of_completeTorAmplitude` (Lean:333) | `a > b`; `ℤ_p` in degree −1, `[−1,−1]`; `∏ℤ/p^n`, `[−1,0]`; `ℤ[1/p]` in degree 1 over `ℤ`; `C = (A[0])^∧`, `A = ℤ_p ⋉ ℚ_p/ℤ_p`; `ℤ/2` over `ℤ/4` | **`a > b`:** `P ⊗ A/p` is acyclic, so `M = 0` by Nakayama and the conclusion holds. **`ℤ_p[1]`:** `P ⊗ N = N` in degree −1, conclusion `H^i = 0` for `i ≠ −1`. **`∏ℤ/p^n`:** only `H⁰`. **`ℤ[1/p]`:** `hamp` holds for every `[a,b]` but `H¹ ≠ 0`, so `hc` is needed. **`C`:** `H⁰ = ℤ_p`, `H^−1 = T_p(ℚ_p/ℤ_p) = ℤ_p`, and `C ⊗^L A/p = A/p` gives `[0,0]`; `hA` fails, so `hA` is needed. **`ℤ/2` over `ℤ/4`:** `H^(−i)(ℤ/2 ⊗^L F₂) = F₂` for all `i ≥ 0`, so `hamp` fails for every finite `a` and the theorem does not apply | True | none |
| `isPerfect_baseChange` (Lean:437) | `[ℤ --2→ ℤ]`, `ℤ → F₂`; resolution of `ℤ/2` over `ℤ/4`, `b = 0`; `S = 0`; `f = id`; bi-infinite `ℤ/4` complex with `×2` | **`[ℤ --2→ ℤ]`:** gives `[F₂ --0→ F₂]`, perfect. **`ℤ/2` over `ℤ/4`:** `hK` fails and the output has `H^(−i) = F₂` for all `i`, so `hK` is needed. **`S = 0`:** the zero complex. **`f = id`:** `P ⊗_R R ≅ P`. **Bi-infinite complex:** `hP` fails (no bound) and `hK` holds (acyclic); the output is `F₂` in every degree, not perfect, so the bound is needed | True | none |
| New Check, §1.3 (README:2006–2010) | `ℤ[1/p]` over `ℤ`; `O_ℂp`, `m` | **`ℤ[1/p]`:** `ℤ[1/p] ⊗^L F_p = 0`, not complete. **`m`:** the value group is `ℚ`, so `m = m²`. For `v(f) > 0` the `f`-adic and `p`-adic topologies agree; `m` is closed in the complete `O`, separated and complete, and torsion-free, hence derived `f`-complete. `m` is flat, so `m ⊗^L O/m = m/m² = 0` | True | none |
| New Check, §1.8 (README:2260–2265) | as in the amplitude row | `ℤ[1/p][−1]`: every amplitude, `H¹ ≠ 0`, not complete. `C`: `H^−1 ≅ ℤ_p` from `R lim` of `(ℚ_p/ℤ_p)[p^n] ≅ ℤ/p^n` under `×p`; p-completely flat by BMS19 Lemma 4.4. The §1.5 Check (README:2067–2072) gives the same `H^−1` | True | none |
| New Check, §1.E.0 (README:2358–2361) | `⋯ --2→ ℤ/4 --2→ ⋯` along `ℤ/4 → F₂` | `ker(×2) = 2ℤ/4 = im(×2)`, so the complex is acyclic, zero, and perfect. After `⊗F₂` the differentials are 0, so `H^i = F₂` in every degree: not perfect. The same complex as README:845 | True | none |
| Docstring bullet, Lean:50–56 | the three model forms; pin grep (r14) | Each model form elaborates. No derived tensor and no derived scalar extension on `D(ModuleCat R)` at the pins (r14) | True | none |
| Docstring bullet, Lean:73–77 | §1.5 model form with `reductionFunctor`; §1.4 Koszul tower | §1.5: the probe elaborates (27 warnings, exit 0), so “no pinned construction supplies” is false. §1.4: the tower of cochain Koszul complexes with `e_i ↦ f_i e_i` transitions is not at the pins | Overclaim | R01 |
| Docstring bullet, Lean:80–83 | §1.9 descent; §1.7 completion laws | §1.9 needs `Tot` of the p-completed Čech nerve, which is not at the pins. The §1.7 laws are direct corollaries of BMS19 Lemmas 4.4–4.5(1) (lines 872–891) | Holds | none |
| Docstring bullet, Lean:84–90 | the `P_n` of README:2368–2372 | Bounded-above finite-free models are K-projective, so morphisms of `D` out of them are chain maps up to homotopy. README:2371–2372 says the same | False reason | R02 |
| R01 probe statements | `ℤ`, `(p)`, `ℤ[0]`; `I = 0`; `I = A`; `ℤ_p ⋉ ℚ_p/ℤ_p` | **`ℤ`:** `Rlim ℤ/p^(n+1) = ℤ_p`, the universal `η`. **`I = 0`:** `η = id`. **`I = A`:** `0`. **`ℤ_p ⋉ ℚ_p/ℤ_p`:** naive `R[0]` but `H^−1(Λ) = R`, excluded by both hypotheses | True | add (R01) |
| §0.4 functoriality (README:1201–1206) | `ℤ → ℤ[x]`, `b = 0`; `ℤ → ℤ/2`; a flat square | zero in `H⁰`; `ℤ/2[1] → 0`; `d[x] ↦ d[x] ≠ 0` (r14) | True | none |
| §0.DP.1 homogeneity (README:160–168) | zero law; `f + g`; `g∘f`; `x + x²` | the composite has degree `mn`; `x + x²` is not homogeneous at `s = 2` (r14) | True | none |
| §0.DP.3 (README:396–626) | `ℤ⟨x⟩`, `I = (2)`; `F₂⟨x⟩` | `IA⟨x⟩ ∩ A⟨x⟩₊ = IA⟨x⟩·A⟨x⟩₊`; `x^[2] ∉ (x)` (r14) | True | none |
| §0.K.1 Koszul (README:644–676) | `(2)`, `(0)` over `ℤ`; `K(2,2)` | `H₀ = ℤ/2`, `H₁ = 0`; `H₁ = ℤ`; sign `f₁e₂ − f₂e₁` (r14) | True | none |
| §0.1 resolution (README:744–784) | constant `A[t]` over `A[t]/(t²)` | `H₀ = A[t]` against `B` (r14) | True | none |
| §0.2 K-flatness (README:788–848) | `ℤ/4` with `×2`; `F_p ⊗^L F_p` | `H = F₂` in every degree; `H⁰ = H⁻¹ = F_p` (r14) | True | none |
| `quasiIso_whiskering_of_projective` (Lean:172) | `Γ₀[ℤ --2→ ℤ] → ℤ/2`; `W**` | `Tor₁ = ℤ/2` against `0`; `V → V**` not onto (r14) | True | none |
| §0.4 Checks (README:1212–1224) | `k[ε]/ε²`; `ℤ → ℤ/2` | `H⁻¹ = εB`; `H⁻¹ = ℤ/2` (r14) | True | none |
| §0.5 Baer sum (README:1286–1304) | `Exal_ℤ(F₂, F₂)` | `F₂`; the `ℤ/4` class has order 2 (r14) | True | none |
| §0.7 (README:1308–1325) | `k[x,y]/(x,y)²` | `H⁻² = k` (r14) | True | none |
| §0.6 (README:1329–1369) | `ℤ → ℤ/p`; `ℤ/9 → F₃` | `0`; `1 ↦ 3` gives `1`, `1 ↦ 6` gives `2` (r14) | True | none |
| §0.8 (README:1373–1407) | `ℤ → ℤ → ℤ/3` | nonzero on `H⁻¹` (r14) | True | none |
| §0.11 (README:1463–1476) | `ℤ[X] → ℤ[X^±]` | relative `L = 0` (r14) | True | none |
| décalage (Lean:195, 213) | `N = R`, `n = 0, 1, 2`; `N = ℤ/2` | `R` in degree 2; `F₂ ≠ ℤ/4` (r14) | True | none |
| §1.1.1 Check (README:1902) | `RHom(ℤ[1/p], ℤ)` | `H⁰ = 0`, `H¹ = ℤ_p/ℤ` (r14) | True | none |
| §1.2 laws (Lean:257–292) | `I = A`; `I = 0`; `ℤ[−1]` | all `Hᵏ = 0`; `n = −1` detects `ℤ[−1]` (r14) | True | none |
| §1.3 reflector (Lean:297) | `ℤ`, `ℤ[1/p]`, `ℤ/p^m` | `ℤ_p`; `0`; fixed (r14) | True | none |
| §1.4 Koszul tower (README:2026–2040) | `K(p^(n+1)) → K(p^n)` | `(×p, id)` (r14) | True | none |
| §1.5 Check (README:2067–2082) | `ℤ_p ⋉ ℚ_p/ℤ_p` | nonsplit in `D(A)` (r14) | True | none |
| §1.9 descent (README:2276–2292) | `ℤ_p → F_p` | `H⁻¹ = F_p ≠ 0` (r14) | True | none |
| `nonempty_bicomplexSecondPageIso` (Lean:117) | pages 2 and 3 | position `(−k−2p, p)` (r14) | True | none |
| `simplicialTensorComparison` (Lean:132) | `x, y ∈ X₁, Y₁` | the sign at `p = 1` (r14) | True | none |
| `bisimplicialDiagonalComparison` (Lean:155) | constant `P` | `P` in degree 0 (r14) | True | none |
| `derivedLimit_isTriangulated` (Lean:235) | `⊕_(m≥n) k` | `lim¹ = ∏k/⊕k` (r14) | True | none |
| `IsCompletelyFlatModule` (Lean:321) | `I = 0`; `I = A`; `F_p` | flatness; every `M`; `Tor₁ ≠ 0` (r14) | Discriminating | none |
| `isAdicComplete_of_isCompletelyFlatModule` (Lean:352) | `ℤ/4`; `ℚ` | an isomorphism; `M = 0` (r14) | True | none |
| `isCompletelyFlatModule_of_isAdicComplete` (Lean:371) | `ℤ/4`, `M = ℤ/2` | `Tor₁ = ℤ/2` (r14) | True | none |
| `IsPerfect` and its closure (Lean:394–429) | `eA ⊂ k × k`; `[ℤ --2→ ℤ]` | Euler ranks `(1, 0)`; `H⁻¹` kept (r14) | True | none |
| `ringTowerLimit_jacobson` (Lean:452) | `k[t]/(t^(n+1))`; `A₀ = 0` | inverse `Σ(−t)^m`; the hypotheses are needed (r14) | True | none |
| `pseudoCoherent_residueCriterion` (Lean:465) | `[k[[t]] --t→ k[[t]]]`; `k` over `k[ε]` | `[−1, 0]`; no interval (r14) | True | none |
| `biduality_of_finite`, `biduality_of_artinian` (Lean:489, 502) | `ℤ_p`; `ℤ_(p)` | `End(ℚ_p/ℤ_p) = ℤ_p ≠ ℤ_(p)` (r14) | True | none |
| §1.M.1 Check (README:2577) | `⊕_ℕ k` | `D(M) = ∏k`, not onto (r14) | True | none |
| §1.E.1 Checks (README:2500–2507) | `[A_n --t→ A_n]`; `k[x₁, …]/(x_i²)` | `H⁻¹ ↦ 0`; nil but not nilpotent (r14) | True | none |
| §1.1 Checks (README:1865–1871) | dropping `r` levels; `h_n = x₀` | `Σ9^m = −1/8 ∉ ℤ` (r14) | True | none |
| §0.25 Checks (README:1705–1745) | `k[x]/(x³) → k[x]/(x²) → k` | the connecting map is onto `k` (r14) | True | none |
| Convention README:96 (`k` a field) | Checks README:1702, 2351, 2456 | `k = 0` collapses each (r14) | Consistent | none |

### Remark on untouched text

README:2030 cites StacksMA Lemma 15.93.18 at “pp.266–267”, but the lemma begins on p.267 (lines 12286 and 12293). The previous reviews passed this line; it is recorded here, not raised.

## Not verifiable

- Nothing in the changed passages. Every new locator was read in the cached StacksMA and BMS19 texts.
- The earlier items lie in untouched text and stand as r13 recorded them:
  - the NSW page numbers at README:960–962;
  - IllusieCC, Chapter II, 1.2.6.2.

## Source issues

- none
