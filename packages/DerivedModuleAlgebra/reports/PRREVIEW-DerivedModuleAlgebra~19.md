# Review of DerivedModuleAlgebra (pull request #1701 at b4d058a)

**Verdict:** needs changes

This is an incremental re-review of the 25 lines changed since f8483df. Below, "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`.

There are two findings, both P3. r18's R01–R03 are repaired, and r18's R04 is not. The gate passes, the dependency check is clean, and Lean elaborates with only `sorry` warnings. Every changed statement survived the adversarial pass.

## R01 (P3) — The cited-names table still drops two §0.4 names that main's EnhancedDerivedSheaves cites

**Location.** README:49 is the §0.4 row of the cited-names table (README:41–80). It begins "`Algebra.CotangentComplex.homologyZeroIso`, `Algebra.CotangentComplex.arrowFunctor`, `arrowResolution`, …" and resolves to "§0.4: the full cotangent complex, its arrow-category model and its Checks". Neither `Algebra.CotangentComplex.map` nor `Algebra.CotangentComplex.resolutionIso` occurs anywhere in README or Lean.

**Why this is in scope.** This head edits this table to map names that it drops and other roadmaps cite (the new rows at README:47, 65, 78 and 79), so the table is a changed passage. These two names are dropped names of the same kind. r18 compared full names only, so it missed the consumer's abbreviated form.

**Claim.**
- Main's DerivedModuleAlgebra README:841 and :845 define both names as §0.4 API, and this pull request drops them.
- Their content survives without the names at README:1209–1215: the map induced by a commutative square, with its identity and composition laws, and the model given by any polynomial resolution.
- Once this merges, main's citation of them resolves nowhere. The brief treats a dropped id that another roadmap cites, with no old → new mapping, as P3.

**Witness.** Main `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`:2891 reads "*Needs:* DerivedModuleAlgebra §§0.4–0.13 (`Algebra.CotangentComplex`, `.map`, `.resolutionIso`, `.transitivityTriangle`, `.baseChange`, `.smooth`, `.regularQuotient`)". The same line is at #1187:2891, #1330:2895 and #1630:2958.

**Repair.** In README:49, insert `` `Algebra.CotangentComplex.map`, `Algebra.CotangentComplex.resolutionIso`, `` after `` `Algebra.CotangentComplex.arrowFunctor`, `` in the left column. The right column already covers both.

**Test.** After the edit, every name on EnhancedDerivedSheaves:2891 resolves through the table:
- `.map` and `.resolutionIso` → §0.4 (README:49, laws at README:1209–1215);
- `.transitivityTriangle` → §0.8 (README:53);
- `.baseChange` → §0.10 (README:55);
- `.smooth` → §0.12 (README:57);
- `.regularQuotient` → §0.13 (README:58).

## R02 (P3) — The pull-request description still describes a README-only amendment

This is r18's R04, raised before as r17's R01 and earlier. It is not repaired. No repair report marks it as not actionable.

**Location.** The pull-request description (data), unchanged:
- **Summary:** "README only; `Suggested.lean` is unchanged";
- **What this roadmap builds:** "Roby representability (`PD.robyRepresentability`)";
- **Why Tau Ceti wants it:** "Thirteen roadmaps consume it".

**Claim.** A human approves on the basis of the description, and these three statements are false at this head.

**Witness.**
- `git diff --numstat origin/main...HEAD` gives `492 1230` for Lean.
- `robyRepresentability` occurs 0 times in the folder and 0 times in the pinned Tau Ceti.
- README:2692–2697 names eighteen consumers.

**Repair.** Edit the description on GitHub:
1. End **Summary** with: "The head also replaces main's `Suggested.lean` with the roadmap's headline theorems and the few definitions they need."
2. Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv` (Tau Ceti pin, `TauCeti/RingTheory/DividedPowerAlgebra/Representability.lean`:440).
3. Replace "Thirteen" with "Eighteen".
4. If the title is kept, append "and state the headline theorems in Suggested.lean".

**Test.** All three statements then agree with the numstat, the pinned declaration and README:2692–2697.

## Previous findings

- R01 — repaired: README:47 "| `test_derived_tensor_unbounded_flat` | §0.2: the Check on the bi-infinite `ℤ/4` complex with every differential multiplication by `2`, acyclic and termwise free but not K-flat |", pointing at the Check at README:849–852.
- R02 — repaired: README:884–886 "double complex in an abelian category (abelian groups or modules over a ring in the uses of §§0.2.2 and 0.9)"; README:918 "chain double complex `C_(p,q)` in the same abelian category".
- R03 — repaired: README:1511 "[StacksCt], §14, Lemma 14.2 and Proposition 14.4; Tags 08SJ, 08SL, p.29."
- R04 — not repaired: the description still says "README only; `Suggested.lean` is unchanged", cites `PD.robyRepresentability`, and says "Thirteen roadmaps consume it". Raised again as R02.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** My run at this head (`gate … --base origin/main`) exits 0. Every counter is 0, then `OK`: `set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`. The worker's record for this head adds `build=0`.
- **Dependency check.** Output, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2338 edges, 0 problem(s)
```

- **Files changed.** Nothing outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty). `overlaps.md` reports no other open pull request changing this roadmap.
- **Elaboration.** `lake env lean` on Lean exits 0 with exactly 29 "declaration uses `sorry`" warnings and no other output.
- **Signature of the changed declaration.** The Lean diff is a docstring of `nonempty_bicomplexSecondPageIso`. `#check @…DerivedDeRham.nonempty_bicomplexSecondPageIso` elaborates to `∀ {C} [Category C] [Abelian C] (K : HomologicalComplex₂ C (down ℕ) (down ℕ)) (p k : ℕ), Nonempty ((K.columnFiltrationSpectralSequence.page 3).X (-↑k - 2*↑p, ↑p) ≅ …homology p)`. That is the README's generality now, which was r18's R02. No other signature changed, so r18's 39-signature comparison stands.
- **Padding probe.** I re-ran it this round on a scratch copy, with every `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide`. All 29 theorems fail: 29 errors on 29 distinct lines, and no declaration closes.

### Changed passages checked

- **The seven new cited-name rows (README:47, 65, 78, 79).** Each name is main's DerivedModuleAlgebra's own:
  - main README:673: `test_derived_tensor_unbounded_flat`;
  - main Lean:407 and :478: `CompactCoefficients.Tower.limOne_subsingleton_of_isMittagLeffler` and `CompactCoefficients.Tower.limOne_exact`;
  - main Lean:706 and :732: `HasTorAmplitude` and `finiteFreeBaseChangeModel`;
  - main Lean:752 and :765: `PerfectSystem` and `FiniteFreeSystemModel`.

  Each is cited elsewhere, and each citation now resolves:
  - main EnhancedDerivedSheaves:545 (the test name);
  - PadicPeriodRings #940 README:39 ("`Tower.limOne_subsingleton_of_isMittagLeffler` and `Tower.limOne_exact`");
  - DeformationAndDerivedPatchingAlgebra #1034 README:82 (`HasTorAmplitude`, `PerfectSystem`, `FiniteFreeSystemModel`);
  - CompletedCohomologyPartII #1035 README:146 (`finiteFreeBaseChangeModel`).

  Each right column matches its target:
  - README:849–852 (the ℤ/4 Check);
  - README:2376 (Tor amplitude) and README:2383–2384 (the finite-free base-change comparison);
  - README:2417 (*Compatible finite-free models*).

  `DerivedDeRham.complexBaseChange` is declared at Lean:469, in namespace `DerivedDeRham`.
- **Dropped-name scan.** Main's DerivedModuleAlgebra README and Lean have 625 backticked or declared names, and 258 of them are absent at this head. I grepped all 258, both the full name and the last component when it is distinctive, across main and the 588 roadmap folders at the heads of the 467 other open pull requests. I also grepped the abbreviated form `` `.<last component>` ``. Results:
  - Only `.map` and `.resolutionIso` are attributed to this roadmap and left unmapped: R01.
  - `IsMittagLeffler`, `isMittagLeffler_iff_ranges` and `ModuleTower.limOneMap` hits cite Mathlib, Tau Ceti or mapped names.
  - `completedColimit` and `derivationDiscrete` are other roadmaps' own names.
- **Supplier row (README:116).** The pin `TauCeti` `2fd255d` declares the two added names:
  - `TauCeti.ModuleTower.exact_limOneMap` (`Algebra/Category/ModuleCat/Tower/Exact.lean`:136). Hypotheses: levelwise exactness and levelwise surjectivity of `g`, no injectivity.
  - `TauCeti.ModuleTower.limOneMap_surjective` (`…/Tower/Basic.lean`:547).
- **Other pinned declarations opened for the new rows.** `subsingleton_limOne_of_isMittagLeffler` (`…/Tower/MittagLeffler.lean`:191) and `IsMittagLeffler` (:70). The latter is Mathlib's `Functor.IsMittagLeffler` of the underlying type functor, which is also how main defined `CompactCoefficients.Tower.IsMittagLeffler` (main Lean:380). So the identification "over ℤ" is exact.
- **§S.1 StacksHom locator (README:967–969, and the Lean docstring at Lean:113–114).** StacksHom has §25, *Spectral sequences: double complexes*, at line 3241 (p.67):
  - Lemma 25.1 (Tag 0130) is at line 3258 on p.67, its omitted proof on p.68. Item (5) is the second page `H^p_I(H^q_II)` of the first filtration, whose `F^p` is `⊕_{i≥p}`, the README's column filtration.
  - Lemma 25.3 (Tag 0132) is at line 3284 on p.68: finitely many nonzero terms per total degree give finite filtrations and convergence.
  - Lemma 25.4 (Tag 0133) runs from line 3293 (p.68) to line 3315 (p.69): an exact augmentation gives a quasi-isomorphism to `Tot`, with the variant in the other variable.

  All three are stated in an arbitrary abelian category, so "Lemmas 12.25.1, 12.25.3 and 12.25.4, Tags 0130, 0132 and 0133, pp.67–69" is exact. The manifest has `StacksHom` as certified (open repository, locator "0130; 0132; 0133", `cited_for` S.1), and its URL matches the new References link at README:2766.
- **§0.13 locator (README:1511).** StacksCt Lemma 14.2 (08SJ) is at line 1290 and Proposition 14.4 (08SL) at line 1303, with its proof ending at line 1312. Page 29 runs from line 1275 to line 1314.

### Seeded sample, where it falls in the changed passages

- **0.2** is the target of the new row at README:47. Its locators are in StacksMA:
  - Definition 15.60.1 (06XZ), line 6709, p.144;
  - Lemma 15.60.5 (06Y2), line 6725, p.144;
  - Lemma 15.60.7 (064K), line 6741, p.145;
  - Lemma 15.60.8 (06Y3), line 6753, p.145;
  - Lemma 15.60.10 (06Y4), line 6781, p.146;
  - Lemma 15.60.12 (064L), line 6824, p.147;
  - Definition 15.60.13 (064M), line 6846, p.147.

  All are correct, with the same hypotheses: any ring, K-flatness as acyclicity of `Tot(M ⊗ K)` for every acyclic `M`, a bounded-above flat complex K-flat, and the flat-term K-flat resolution.
- **0.13**: correct, as above.
- **0.2.2**, named in §S.1's new parenthetical, `*Needs:*` §S.1 at README:1094, and **0.9** does so at README:1436. r18 verified 0.2.2's locators, and the passage is unchanged.
- The other sampled targets (0.3, 0.4, 0.5, 0.7, 0.10, 0.11, 0.16, 0.25, 1.1.1, 1.3, 1.5, 1.7) lie outside the changed passages and were not re-read. r18 verified 0.3, 0.4, 0.5, 0.7 and 1.7. README flags no locator as unverified.

### Ownership, headlines, remarks

- **Ownership and headlines.** The diff introduces no new object, so r18's ownership audit (main and all open heads) and its headline list stand. No headline was added or removed.
- **Remark (untouched text, no change requested).** ArithmeticGaloisDuality #858 README:4799 uses `(mulTower p).limOne` in a Check without attributing `mulTower` to this roadmap. Main's README:1454 named that tower, and this head drops the name; the content is the `limOne_mul_p` Check of README:67.

### Adversarial table

The first eight rows were computed this round for the changed statements and passages. The rest are carried forward from r18 (`PRREVIEW-DerivedModuleAlgebra~18`, adversarial table), for statements this diff leaves untouched.

| Statement | Instances | Values on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| `nonempty_bicomplexSecondPageIso` (Lean:119), docstring now Stacks 0130 | `C = ModuleCat ℤ`: only `K₀,₀ = ℤ`; generators `a(2,0), b(1,1), c(1,0), e(0,1)` with `d_h a = c`, `d_v b = c`, `d_h b = e` | Single term: page 3 at `(0,0)` is `ℤ`, and `H₀(t ↦ H₀(K.X t)) = ℤ`. Four generators: vertical-first gives `R` at `(p,k) = (2,0)` and `(0,1)`, so page 3 at `(−4,2)` is `R`. The transposed model (Stacks' `″E₂`, horizontal first) is `0` everywhere, since `a ↦ c` and `b ↦ e` are isomorphisms. Lean's RHS applies `homologyFunctor k` to columns, then takes `homology p`, which is Stacks 0130(5)'s `′E₂`. Signature `[Abelian C]` = README:884 | True | none |
| §S.1 Stacks sentence (README:967–969) | first quadrant; `A⁰⁰ = A¹⁰ = ℤ`, `d′ = id` | 0132: total degree `n` has `n+1` possible nonzero positions, which is finite. 0133 (row variant): the row is exact in positive degrees, `ker(A⁰• → A¹•) = 0`, so `Hⁿ(Tot) = 0`, matching the S.1 Check "`E₂ = 0` and `H(Tot A) = 0`" | True | none |
| Row `test_derived_tensor_unbounded_flat` (README:47 → 849) | bi-infinite `ℤ/4`, `d = 2` | `ker 2 = {0,2} = im 2`, so acyclic. `⊗F₂`: `2 ↦ 0`, so `Hⁱ = F₂` for all `i`. The derived tensor of an acyclic complex is `0`. A K-flat acyclic complex tensors acyclically, so this one is not K-flat. Agrees with EnhancedDerivedSheaves:545 | True | none |
| Rows `…Tower.limOne_subsingleton_of_isMittagLeffler`, `…Tower.limOne_exact` (README:65) | `A = (ℤ, ×p) --pⁿ→ B = (ℤ, id) → C = (ℤ/pⁿ)`; Neg.: `0 → (ℤ, ×p)` | `lim¹`: `ℤ_p/ℤ → 0 → 0`, exact at the middle and onto. Six-term: `0 → 0 → ℤ → ℤ_p → ℤ_p/ℤ → 0 → 0`. Neg.: not levelwise onto, and `0 → ℤ_p/ℤ` is not onto, so `hg` is needed. The pinned exactness drops main's `hinj`, so it is more general. `(ℤ, ×p)`: images `pᵏℤ` never stabilise and `lim¹ ≠ 0` | True | none |
| Rows `HasTorAmplitude`, `finiteFreeBaseChangeModel` (README:78 → 2376–2384) | `A[0]`, `A[1]`, `0`; `[ℤ --2→ ℤ] → F₂`; Neg.: bi-infinite `ℤ/4` | Amplitudes: `A[0]` is `[0,0]`; `A[1]` is `[−1,−1]`, since `H^{−1}(N[1]) = N`; `0` has every interval. `[F₂ --0→ F₂]`: `H^{−1} = Tor₁ = F₂`, `H⁰ = Tor₀ = F₂`. Neg.: not bounded above, and termwise `F₂` in every degree differs from the derived `0` | True | none |
| Rows `PerfectSystem`, `FiniteFreeSystemModel` (README:79 → 2417) | `A_n = k` constant, `M_n = k[0]`; `A_n = k[t]/tⁿ⁺¹`, `M_n = A_n[0]` | Constant: `P_n = k[0]` with identity reductions. Truncated: `A_(n+1) ⊗ A_n = A_n`, with kernel `(tⁿ⁺¹)/(tⁿ⁺²)` square-zero, so locally nilpotent | True | none |
| §0.13 locator (README:1511) | `(p) ⊂ ℤ` | 08SJ: `L_(F_p/ℤ) = (p)/(p²)[1] = F_p[1]`; both statements on p.29 | True | none |
| §0.2 locators (row target) | as above | 7 StacksMA items, numbers, pages and hypotheses agree | True | none |
| `simplicialTensorComparison` (Lean:134) | r18: `x ∈ X₁, y ∈ Y₁` | `d∇ = ∇d = s₀d₀x⊗y − s₀d₁x⊗y − x⊗s₀d₀y + x⊗s₀d₁y`. The opposite sign fails unless `2 = 0` | True | none |
| `bisimplicialDiagonalComparison` (Lean:157) | r18: constant `P`; `A[1]` | Both sides `H₀ = P`; `H₂ = A`; transposition sign `−1` | True | none |
| `quasiIso_whiskering_of_projective` (Lean:174) | r18 Neg.: `Γ₀[ℤ --2→ ℤ] → ℤ/2`, `V ⊗ V` | Source `H₁ = ℤ/2`, target `0`; excluded because the target is not projective | True | none |
| `exteriorPower_decalage` (Lean:197) | r18: `F₂`, `n = 2`; Neg. `ℤ/2` over `ℤ` | `N(∧²X)` ranks `1, 0, 0`, so the result is `F₂γ₂`. Neg.: `Γ²_ℤ(ℤ/2) = ℤ/4`, so flatness is needed | True | none |
| `symmetricPower_decalage` (Lean:215) | r18: `N = R`, `n = 2` | Ranks `1, 1, 0`, acyclic, equal to `∧²R = 0` | True | none |
| `derivedLimit_isTriangulated` (Lean:237) | r18: constant `ℤ[0]`; split Neg. | Shift iso `id`; the all-ones sequence is not in the image | True | none |
| `derivedCompleteness`, `isDerivedComplete*` (Lean:262–294) | r18: `I = 0, A`; `ℚ_p`; `ℤ[−1]` | Everything is complete for `I = 0`; only `0` for `I = A`; `ℤ[1/p] → ℚ_p ≠ 0`; testing `n = −1` excludes `ℤ[−1]` | True | none |
| `derivedCompleteness_isRightAdjoint`, `completeNakayama` (Lean:299, 310) | r18: `m ⊂ O_ℂp`; `ℤ[1/p]` | `m = m²` is excluded by `hI`; `hc` fails for `ℤ[1/p]` | True | none |
| `ordinaryQuotientCompletion` and variants (Lean:327–389) | r18: `ℤ, (p)`; `ℤ_p ⋉ ℚ_p/ℤ_p`; `[p, 1]`; `ℚ_p/ℤ_p` | `L = ℤ_p[0]`; non-Noetherian `H^{−1} = ℤ_p`; `Ideal.ofList [] = ⊥`; `hfin` needed | True | none |
| `IsCompletelyFlatModule` and §1.8 (Lean:406–456) | r18: `ℤ`, `F_p`, `ℤ/4`, `ℤ/2` | `Tor₁(F_p, F_p) = F_p` fails; `M/4M = ℤ/2` not flat over `ℤ/4` | True | none |
| `IsPerfect`, closure lemmas, `isPerfect_baseChange` (Lean:479–522) | r18: `eA ⊂ k × k`; `[ℤ --2→ ℤ]` | Euler ranks `(1,0)`, so no bounded finite-free model. `ℤ/2` over `ℤ/4` has `Tor_i = F₂` for every `i` | True | none |
| `ringTowerLimit_jacobson`, `pseudoCoherent_residueCriterion` (Lean:537, 550) | r18: `k[t]/tⁿ⁺¹`; `k` over `k[ε]` | `1 + t` is a unit; `hnil` is needed; `k` has no finite interval | True | none |
| `biduality_of_finite/_artinian` (Lean:574, 587) | r18: `ℤ_p`, `E = ℚ_p/ℤ_p`; `ℤ_(p)` | `End E = ℤ_p`; `ℤ_(p)` is excluded because it is not complete | True | none |
| README Checks §§0.1–1.M (r18 rows) | r18 instances | r18 values: `F_p ⊗^L F_p`, `k[ε]/ε²`, `ℤ/9 → F₃`, `k[x,y]/(x,y)²`, `×p` tower, `Ext¹(ℤ[1/2], ℤ) = ℤ₂/ℤ`, `R ⋉ T`, `D(R⊕E) = E⊕R` | True | none |

## Not verifiable

- **NSW, Proposition 2.1.1 and Lemma 2.2.4** (README:965–967, printed pp.99 and 105). The cached NSW entry holds only the authors' landing page. This review edits no manifest, so I did not fetch the PDF. Now that §S.1 is set in an abelian category, I also could not confirm that NSW states the five-term and extended sequences at that generality. They hold in any abelian category, and StacksHom Chapter 12 has no five-term statement: its only "five" is the five lemma, at line 2550.
- **IllusieCC, Chapter II, 1.2.6.2** (README:1431, untouched). The manifest records it as uncertified, so it is settled.

## Source issues

- none
