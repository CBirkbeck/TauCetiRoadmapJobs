# Review of DerivedModuleAlgebra (pull request #1701 at 1c30cbf)

**Verdict:** needs changes

This is an incremental re-review of the 13 lines changed since b4d058a. All of them are in `TauCetiRoadmap/DerivedModuleAlgebra/README.md`, called "README" below. "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`, which has not changed since b4d058a.

The folder has no remaining defect. r19's R01 is repaired, and the three changed passages hold up under the adversarial pass. One P3 finding remains: r19's R02, the pull-request description, which is still not repaired. Fixing it means editing the description on GitHub, not the folder. The gate passes, the dependency check is clean, and Lean elaborates with only `sorry` warnings.

## R01 (P3) — The pull-request description still describes a README-only amendment

This was r19's R02. Earlier rounds raised it as r18's R04, r17's R01, r16's R01 and r15's R03. It is not repaired, and no repair report marks it as not actionable.

**Location.** The pull-request description (data), unchanged at this head:
- **Summary:** "README only; `Suggested.lean` is unchanged".
- **What this roadmap builds:** "Roby representability (`PD.robyRepresentability`)".
- **Why Tau Ceti wants it:** "Thirteen roadmaps consume it".
- **Title:** "cite the affine-crystalline formalisation at the divided power targets".

**Claim.** A human approves on the basis of the description, and all three statements above are false at this head. The title describes only the original amendment.

**Witness.**
- `git diff --numstat origin/main...HEAD` gives `492 1230` for Lean.
- `robyRepresentability` occurs 0 times in the folder and 0 times in the pinned Tau Ceti (`2fd255d`).
- README:2699–2704 names eighteen consumers.

**Repair.** Edit the description on GitHub:
1. End **Summary** with: "The head also replaces main's `Suggested.lean` with the roadmap's headline theorems and the few definitions they need."
2. Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv`, which is at the Tau Ceti pin in `TauCeti/RingTheory/DividedPowerAlgebra/Representability.lean`:440.
3. Replace "Thirteen" with "Eighteen".
4. If the title is kept, append "and state the headline theorems in Suggested.lean".

If the repair round cannot edit pull-request descriptions, its repair report should say so with that reason, so that this finding can be settled.

**Test.** After the edit, the three statements agree with the numstat, the pinned declaration and README:2699–2704.

## Previous findings

- R01 — repaired: README:49 now lists "`Algebra.CotangentComplex.arrowFunctor`, `Algebra.CotangentComplex.map`, `Algebra.CotangentComplex.resolutionIso`, …". It resolves them to "the map `L_(B/A) ⊗^L_B B′ → L_(B′/A′)` induced by a commutative square with its identity and composition laws, the differential model given by any polynomial resolution". That content is README:1217–1223.
- R02 — not repaired: the description still says "README only; `Suggested.lean` is unchanged", cites `PD.robyRepresentability`, and says "Thirteen roadmaps consume it". Raised again as R01.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** My run at this head (`gate … --base origin/main`) exits 0. Every counter is 0, followed by `OK`: `set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`. The worker's record for this head adds `build=0`.
- **Dependency check.** Output, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2338 edges, 0 problem(s)
```

- **Files changed.** Nothing outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty). Since b4d058a, only README changed (10 insertions, 3 deletions). `overlaps.md` reports no other open pull request changing this roadmap, and no cited id that an open revision drops or alone defines.
- **Elaboration.** `lake env lean` on Lean exits 0 with exactly 29 "declaration uses `sorry`" warnings and nothing else. Lean is byte-identical to b4d058a (`git diff b4d058a HEAD -- Suggested.lean` is empty). That leaves r18's 39-signature comparison and r19's `#check` of `nonempty_bicomplexSecondPageIso` standing. `signatures.md` agrees: 39 declarations, 0 with a dropped binder.
- **Padding probe.** I re-ran it this round on a scratch copy, with every `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide`. All 29 theorems fail: 29 errors on 29 distinct lines, and none closes.

### The changed passages

- **README:49 (§0.4 row, R01's repair).** The two added names resolve as their consumers use them:
  - Main's DerivedModuleAlgebra README:841 (`.map`: the square-induced map with identity and composition laws) and :845 (`.resolutionIso`: any polynomial resolution gives the model) define them.
  - Their content is at README:1217–1221 and README:1222–1223. The head writes the model formula as `b(t) ⊗ d(a_P(x))` with `a_P` the induced map of standard resolutions. That corrects main's `d(a(x))`, since `x ∈ P•`.
  - The consumer is main's `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`:2891, "DerivedModuleAlgebra §§0.4–0.13 (`Algebra.CotangentComplex`, `.map`, `.resolutionIso`, …)". The same line is at #1187:2891, #1330:2895 and #1630:2958, and it uses "coherent functoriality on squares" (main :2883). Every name on that line now resolves: `.map`, `.resolutionIso` → §0.4; `.transitivityTriangle` → §0.8 (README:53); `.baseChange` → §0.10 (:55); `.smooth` → §0.12 (:57); `.regularQuotient` → §0.13 (:58).
- **README:67 (§1.1 row, `mulTower`).** Main's Lean:520 defines `mulTower (p : ℕ)` as the tower on `ℤ` with every transition `(p : ℤ) •`. Its Checks (main Lean:526–538) assume `p.Prime`.
  - The right column ("`ℤ ← ℤ ← ⋯` with every transition multiplication by a prime `p` (`lim = 0`, `lim¹ ≅ ℤ_p/ℤ ≠ 0`)") is the Check at README:1888–1889.
  - The direction `n+1 → n` matches the Conventions (README:98).
  - The only consumer, ArithmeticGaloisDuality #858 README:4799, writes "`(mulTower p).limOne ≅ ℤ_p/ℤ ≠ 0`" for "a prime `p`", so it now resolves. This settles r19's remark about that citation.
  - "the degreewise-surjective model with its Milnor maps" is README:1823–1824.
- **README:970–977 (§S.1, derivation of the edge morphisms and the five-term and extended sequences).** Every step checks against the section's own conventions (README:884–905):
  - `FᵖTotⁿ = ⊕_{i≥p} A^{i,n−i}` gives `F⁰ = Tot` and `Fⁿ⁺¹Totⁿ = 0`.
  - `d_r : E_r^{p,q} → E_r^{p+r,q−r+1}`, so with `r ≥ 2` an incoming map to `(0,n)` starts at `p = −r < 0` and an outgoing map from `(n,0)` lands at `q = 1−r < 0`.
  - Hence `E_∞^{0,n} = ⋂ ker d_r ⊆ E₂^{0,n}` and `E_∞^{n,0}` is a quotient of `E₂^{n,0}`.
  - `E_∞^{1,0} = E₂^{1,0}`, since an incoming map would start at `p = 1−r < 0`.
  - `E_∞^{0,1} = ker(d₂)`, since `d_{r≥3}` lands at `q < 0`. `E_∞^{2,0} = coker d₂`, since `d_{r≥3}` would start at `p < 0`.
  - Under the vanishing of rows `0 < q < n`: `F¹Hⁿ = FⁿHⁿ = E₂^{n,0}`, `E_{n+1}^{0,n} = E₂^{0,n}`, `E_{n+1}^{n+1,0} = E₂^{n+1,0}`, and only `d_(n+1)` links them.

  The claim "in any abelian category" rests on StacksHom Definition 24.9 (Tag 012U, line 3131: convergence means `gr_p Hⁿ = E_∞^{p,n−p}`, regular, with finite filtration) and Lemma 25.3 (Tag 0132, line 3284, p.68). Both are stated for an arbitrary abelian category. The derivation replaces the reliance on the NSW locator, which this worker cannot read, for the general abelian case. The adjacent `*Needs:*` declarations exist at the pins:
  - Tau Ceti `CochainComplex.spectralSequence` (`…/SpectralSequence/Filtered/SpectralObject.lean`:409), `filtrationAbutmentIso` (`…/Filtered/Convergence.lean`:51), `filtrationSpectralSequencePageXIsoEInfty` (`…/Filtered/Stabilization.lean`:83), `HomologicalComplex₂.columnFiltrationSpectralSequence` (`…/SpectralSequence/Bicomplex.lean`:442) and `columnFiltrationAbutmentIso` (:484);
  - Mathlib `HomotopyCategory.spectralObjectMappingCone` (`Algebra/Homology/HomotopyCategory/SpectralObject.lean`:46), `Triangulated.SpectralObject.mapHomologicalFunctor` (`CategoryTheory/Triangulated/SpectralObject.lean`:245), `Abelian.SpectralObject.IsFirstQuadrant` (`Algebra/Homology/SpectralObject/HasSpectralSequence.lean`:394), `coreE₂CohomologicalNat` (:176) and `spectralSequence` (`…/SpectralObject/SpectralSequence.lean`:479).

### Seeded sample, where it falls in or depends on the changed passages

The changed rows point at §0.4 and §1.1. These sampled targets cite them, and I verified their locators against the cached texts:

- **0.10** (README:1463–1464). StacksCt §6 (Tag 08QL) is at line 456, p.11, and constructs the square-induced map. Lemma 6.2 (Tag 08QQ) is at line 519, p.12. Its hypothesis `B ⊗^L_A A′ = B′` is exactly `B′ = B ⊗_A A′` plus Tor independence. Correct.
- **0.11** (README:1483). Lemma 3.4 (08S9) is at line 108, p.3. Lemma 8.1 (08QZ) is at line 779, p.17. Lemma 8.6 (08SF) is at line 827, p.19. Taking `A = B` and `S = {1}` in 8.6 gives `L_(T⁻¹B/B) = 0`. Correct.
- **0.12** (README:1499–1500). Lemma 9.1 (08R5) is at line 847, p.19. Stacks' smooth maps are of finite presentation, which matches "smooth finitely presented". Lemma 8.4(5) (08R2, étale) is at line 805, p.18. Lemma 4.7 (08QH) is at line 228, p.6. Correct.
- **0.13**: 08SJ is at line 1290 and 08SL at line 1303, both on p.29 (lines 1275–1314). Correct, as in r19.
- **1.1.1** (README:1905–1906). Its Check at README:1917–1919 uses the §1.1 tower. The locators:
  - StacksMA §15.75 (Tag 0A5W) is at line 8707, p.189;
  - (75.0.1) (0A63) is at line 8711 and (75.0.2) (0A64) at line 8720;
  - Lemma 75.1 (0A65) is at line 8723, stated for any ring and arbitrary `K, L, M ∈ D(R)`;
  - StacksSites §21.35 (Tag 08J7) is at line 3669, p.82.

  All correct, and they match "neither boundedness nor perfectness of `L`".
- **§0.4's own locators**, behind the row's new right column:
  - Definition 3.2 (08PN) is at line 89, p.3;
  - Lemmas 4.3–4.7 (08PU, 08QE–08QH) are at lines 193–228, pp.5–6;
  - Remark 5.5 (08QI) is at line 360, p.9;
  - §6 (08QL) is at line 456, pp.11–12.

  All correct.
- The other sampled targets lie outside the changed passages and their dependents, and were not re-read this round: 0.2 (verified in r19), 0.14, 0.15, 0.16, 0.25 (its `*Needs:*` at README:1707 cites §§0.6, 0.8 and 0.12, not §0.4), 1.3, 1.4, 1.5, 1.7 and 1.9. README flags no locator as unverified.

### Ownership, overlaps, headlines, remarks

- **Ownership and headlines.** The diff adds no object. It only maps three names that main's version owned and other roadmaps cite, and it adds a proof sketch inside §S.1. r18's ownership audit (main and all open heads) and its headline list stand.
- **Overlaps.** The ids that this pull request drops and other roadmaps cite (§1.T.1, cited across main, #858, #868, #869, #1187, #1227 and more, and the `#1t1-towers-lim-and-lim¹` anchor at StableHomotopyKTheory #1227:86) keep their old → new mapping at README:34–36, untouched.
- **Remark (untouched text, no change requested).** In the new §S.1 sentence "Since `F⁰Hⁿ = Hⁿ`, `Fⁿ⁺¹Hⁿ = 0` and `d_r` has bidegree …", the vanishing of incoming and outgoing differentials comes from the first-quadrant hypothesis (README:886), not from the two filtration facts. All three premises are true and the conclusions follow. This is a wording remark only.

### Adversarial table

The first nine rows were computed this round for the changed passages and the in-scope sampled targets. The remaining rows are carried forward from r19 (`PRREVIEW-DerivedModuleAlgebra~19`), which in turn carries r18's rows. The diff leaves all of those statements untouched.

| Statement | Instances | Values on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| Row README:49 → §0.4 `.map` (README:1217) | identity square on `ℤ → ℤ/2`; `(ℤ → ℤ/2) → (ℤ/2 → ℤ/2)`; `(k → k[t]) → (k → k[ε])`, `t ↦ ε`, char `≠ 2` | Identity: `L = ℤ/2[1]`, map `id` on `H⁻¹ = ℤ/2`. Second: source `ℤ/2[1]`, target `L_(F₂/F₂) = 0`, map `0`. Third: `H⁰`: `B·dt → B·dε/(2ε)`, `dt ↦ dε`, onto; `H⁻¹`: `0 → εB`. An `H⁰`-only map is excluded by the `ℤ → ℤ/2` value `H⁻¹ = ℤ/2` | True | none |
| Row README:49 → §0.4 `.resolutionIso` (README:1222) | constant resolution `P_n = A[t]` of `A[t]`; `k[ε]/ε²` | Constant model: alternating face complex of constant `A[t]dt` has `H₀ = A[t]dt`, `H_{>0} = 0`, which equals the standard-resolution value (Check README:1230). The wrong model `Ω[0]` gives `H⁻¹ = 0`, but `H⁻¹ = εB` (char `≠ 2`) and `B` (char 2) | True | none |
| Row README:67 → `mulTower`, §1.1 Check (README:1888) | `p = 2, 3`; Neg. `p = 1`, `p = 0` | `p = 2`: `x₀ ∈ ⋂ 2ⁿℤ = 0`, so `lim = 0`; `lim¹ ≅ ℤ₂/ℤ` via `Σ 2ⁿaₙ`, and the class of `Σ 4ᵐ = −1/3 ∉ ℤ` is nonzero. `p = 3`: `Σ 9ᵐ = −1/8 ∉ ℤ` (README:1886). Neg.: `p = 1` gives `lim = ℤ`, `lim¹ = 0`; `p = 0` gives `lim = lim¹ = 0`, so "prime" is needed | True | none |
| §S.1 five-term derivation (README:970–975) | the four-generator Check (README:1010–1015); a single row `A^{00} = A^{10} = ℤ` with `d′ = 0` | Four generators: `E₂^{1,0} = 0`, `E₂^{0,1} = E₂^{2,0} = R`, `d₂` iso (`[a] ↦ [−e]`), `H¹ = H² = 0`. Sequence `0 → 0 → 0 → R ≅ R → 0` is exact; `ker d₂ = 0 = H¹/F¹`, `coker d₂ = 0 = F²H²`. Single row: `E₂^{1,0} = ℤ = H¹ = F¹H¹`, `E₂^{0,1} = 0`. Homological bidegree `(−r, r−1)` is excluded: the Check's `d₂` goes `(0,1) → (2,0)` | True | none |
| §S.1 extended sequence (README:976–977, statement README:903) | `n = 2`, only `A^{02} = ℤ`; Neg. `n = 0` (README:1005) | `0 → E₂^{2,0} = 0 → H² = ℤ → E₂^{0,2} = ℤ → E₂^{3,0} = 0 → H³ = 0` is exact. The rows with `0 < q < 2` vanish, so `d₃` is the only link. Neg.: at `n = 0` both edge maps are `id_ℤ`, with nonzero composite, so `n ≥ 1` is needed | True | none |
| §0.10 locators and Check | `A = ℤ`, `B = A′ = F_p` | 08QQ needs `B ⊗^L A′ = B′`. Here `Tor₁^ℤ(F_p, F_p) = F_p ≠ 0`, so it fails. `L_(F_p/ℤ) ⊗^L F_p = F_p[1]` and `L_(F_p/F_p) = 0`, which agrees with the Check | True | none |
| §0.11 locators and Check | `ℤ[X] → ℤ[X^{±1}]` | 08R2(3): `L_(ℤ[X^±]/ℤ[X]) = 0`. 08SF: `L_(ℤ[X^±]/ℤ) = ℤ[X^±]·dX`. Agrees | True | none |
| §0.12 locators and Check | `k[ε]/ε²` over `k` | 08R5 needs smooth; `H⁻¹ ≠ 0`, so the Check correctly excludes the smooth formula | True | none |
| §1.1.1 locators and Check (README:1917) | `L = ℤ[1/p]`, `M = ℤ` | `ℤ[1/p] = colim(ℤ →p ℤ →p ⋯)`, so `RHom = Rlim(mulTower p)`: `H⁰ = 0`, `H¹ = ℤ_p/ℤ`, matching the README:67 row. 0A64: `H¹ = Ext¹(ℤ[1/p], ℤ)` | True | none |
| `nonempty_bicomplexSecondPageIso` (Lean:120) | r19: `C = ModuleCat ℤ`, single term; four generators | r19: page 3 at `(0,0)` is `ℤ`; page 3 at `(−4,2)` is `R`; the transposed model is `0` | True | none |
| §S.1 Stacks sentence (README:967–970) | r19: `A⁰⁰ = A¹⁰ = ℤ` | r19: finitely many positions per degree; exact row gives `Hⁿ(Tot) = 0` | True | none |
| Row `test_derived_tensor_unbounded_flat` (README:47) | r19: bi-infinite `ℤ/4`, `d = 2` | r19: acyclic; `⊗F₂` has `Hⁱ = F₂` for all `i`, so not K-flat | True | none |
| Tower rows (README:65) | r19: `(ℤ, ×p) → (ℤ, id) → ℤ/pⁿ` | r19: `lim¹`: `ℤ_p/ℤ → 0 → 0`, exact | True | none |
| Rows `HasTorAmplitude`, `finiteFreeBaseChangeModel`, `PerfectSystem`, `FiniteFreeSystemModel` (README:78–79) | r19: `A[0]`, `A[1]`, `[ℤ --2→ ℤ] → F₂`; `k[t]/tⁿ⁺¹` | r19: amplitudes `[0,0]`, `[−1,−1]`; `Tor₁ = Tor₀ = F₂`; kernel `(tⁿ⁺¹)/(tⁿ⁺²)` square-zero | True | none |
| §0.2 locators | r19: seven StacksMA items | r19: numbers, pages and hypotheses agree | True | none |
| `simplicialTensorComparison` (Lean:135) | r18: `x ∈ X₁, y ∈ Y₁` | r18: `d∇ = ∇d`; the opposite sign fails unless `2 = 0` | True | none |
| `bisimplicialDiagonalComparison` (Lean:158) | r18: constant `P`; `A[1]` | r18: `H₀ = P`; `H₂ = A`; transposition sign `−1` | True | none |
| `quasiIso_whiskering_of_projective` (Lean:175) | r18 Neg.: `Γ₀[ℤ --2→ ℤ] → ℤ/2`, `V ⊗ V` | r18: source `H₁ = ℤ/2`, target `0`; excluded because the target is not projective | True | none |
| `exteriorPower_decalage`, `symmetricPower_decalage` (Lean:198, 216) | r18: `F₂`, `n = 2`; `ℤ/2` over `ℤ`; `N = R` | r18: result `F₂γ₂`; `Γ²_ℤ(ℤ/2) = ℤ/4`; ranks `1, 1, 0` | True | none |
| `derivedLimit_isTriangulated` (Lean:238) | r18: constant `ℤ[0]`; split Neg. | r18: shift iso `id`; the all-ones sequence is not in the image | True | none |
| `derivedCompleteness`, `isDerivedComplete*`, `derivedCompleteness_isRightAdjoint`, `completeNakayama` (Lean:262–310) | r18: `I = 0, A`; `ℚ_p`; `ℤ[−1]`; `m ⊂ O_ℂp`; `ℤ[1/p]` | r18: `ℤ[1/p] → ℚ_p ≠ 0`; `m = m²` excluded by `hI` | True | none |
| `ordinaryQuotientCompletion` and variants (Lean:327–389) | r18: `ℤ, (p)`; `ℤ_p ⋉ ℚ_p/ℤ_p`; `ℚ_p/ℤ_p` | r18: `L = ℤ_p[0]`; non-Noetherian `H⁻¹ = ℤ_p`; `hfin` needed | True | none |
| `IsCompletelyFlatModule` and §1.8 (Lean:406–456) | r18: `ℤ`, `F_p`, `ℤ/4`, `ℤ/2` | r18: `Tor₁(F_p, F_p) = F_p`; `M/4M = ℤ/2` not flat over `ℤ/4` | True | none |
| `IsPerfect`, `isPerfect_baseChange` (Lean:479–522) | r18: `eA ⊂ k × k`; `ℤ/2` over `ℤ/4` | r18: Euler ranks `(1,0)`; `Tor_i = F₂` for every `i` | True | none |
| `ringTowerLimit_jacobson`, `pseudoCoherent_residueCriterion` (Lean:537, 550) | r18: `k[t]/tⁿ⁺¹`; `k` over `k[ε]` | r18: `1 + t` a unit; `hnil` needed | True | none |
| `biduality_of_finite/_artinian` (Lean:574, 587) | r18: `ℤ_p`, `E = ℚ_p/ℤ_p`; `ℤ_(p)` | r18: `End E = ℤ_p`; `ℤ_(p)` not complete | True | none |
| README Checks §§0.1–1.M (r18 rows) | r18 instances | r18 values: `F_p ⊗^L F_p`, `k[ε]/ε²`, `ℤ/9 → F₃`, `×p` tower, `Ext¹(ℤ[1/2], ℤ) = ℤ₂/ℤ`, `D(R⊕E) = E⊕R` | True | none |

## Not verifiable

- **NSW, Proposition 2.1.1 and Lemma 2.2.4** (README:965–967, printed pp.99 and 105, untouched). The cached NSW entry still holds only the authors' landing page (41 lines). This review edits no manifest. The new derivation at README:970–977 no longer needs NSW for the abelian-category generality.
- **IllusieCC** (uncertified in the manifest, so settled).

## Source issues

- none
