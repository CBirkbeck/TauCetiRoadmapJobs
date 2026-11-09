# Review of DerivedModuleAlgebra (pull request #1701 at 8b3bc25)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DerivedModuleAlgebra/` at `8b3bc25`. That is the head the previous review also read: the folder has 0 changed lines since then. "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`, both at this head.

There are four findings, all P3. Two are new: a locator in §0.4 and four works missing from References. Two are carried over unrepaired from the previous review. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with only `sorry` warnings. No sorried theorem closes with one tactic. All 15 sampled targets were read against their sources. Two of those sources contain errors, which the README already works around (see `## Source issues`).

## R01 (P3) — §0.4 cites Lemma 3.4 for the arrow-category functoriality; the construction is StacksCt §6

**Location.** README:1233, after the arrow-category model paragraph (README:1227–1231) and the law at README:1204–1207: “[StacksCt], Lemma 3.4, Tag 08S9, p.3; Lemmas 92.4.5–92.4.7, Tags 08QF–08QH.”

**Claim.** A commutative square `(A → B) → (A′ → B′)` induces a map of standard resolutions and a semilinear chain map `t ⊗ dx ↦ b(t) ⊗ d(a_P(x))`, functorially and with no truncation.

**Witness.**
- StacksCt line 108–109: Lemma 3.4 states only that `colim L_(B_i/A_i) = L_(colim B_i / colim A_i)`.
- StacksCt lines 463–473 (§6, Tag 08QL, p.11): the square induces `P_n → P′_n` from `A → A′` and `B → B′`, and hence `L_(B/A) → L_(B′/A′)` from `Ω_(P_n/A) → Ω_(P′_n/A′)`.

**Repair.**
- At README:1233, cite “[StacksCt], §6, Tag 08QL, pp.11–12” for the model. Keep Lemma 3.4 only where filtered colimits are meant.
- Add the same locator to the functoriality law at README:1204–1207.

**Test.**
- Re-read StacksCt lines 465–473: the construction there is exactly the README's `t ⊗ dx ↦ b(t) ⊗ d(a_P(x))` on the standard resolutions.
- §0.10 (README:1447) already cites §6, Tag 08QL for the same map, so after the repair the two sections agree.

## R02 (P3) — Four works cited with locators are missing from References

**Location.** These works are cited only through inline URLs:
- Roby: 35 occurrences, e.g. README:227, 247, 264;
- Chenevier: 5 occurrences, e.g. README:165, 186, 208;
- Neukirch–Schmidt–Wingberg: README:961–963;
- Nekovář, *Selmer complexes*: README:2519.

None of them appears in `## References` (README:2621–2669).

**Claim.** References lists the works whose locators the README uses. Per README:2623, “Source locators above use the cited edition’s page numbering”.

**Witness.** `sed -n '/^## References/,$p' README.md | grep -c -i -E 'Roby|Chenevier|Neukirch|Nekov'` returns `0`. The same pattern on the whole README returns 43 matching lines.

**Repair.** Add four entries and their link definitions, with the editions the inline links point to:
- **Roby**: N. Roby, *Lois polynômes et lois formelles en théorie des modules*, Ann. Sci. ÉNS (3) 80 (1963), 213–348 (Numdam).
- **Chenevier**: G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group, and pseudorepresentations over arbitrary rings*, arXiv:0809.0415v2.
- **NSW**: J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd ed., electronic version 2.3.
- **Nekovář**: J. Nekovář, *Selmer complexes*, Astérisque 310 (2006).

Optionally, replace the inline URLs by `[Roby]`, `[Chenevier]`, `[NSW]` and `[Nekovář]`.

**Test.** The same `grep -c` restricted to References returns 4 or more, and the gate's counters are unchanged.

## R03 (P3) — Row 75 of the cited-name table still leaves `isPerfect_baseChange` outside a code span

This is the previous R01, not repaired (the folder is unchanged).

**Location.** README:75: “| `PerfectComplex.IsPerfect`, isPerfect_baseChange | §1.E.0: `DerivedDeRham.IsPerfect` and its derived scalar change |”.

**Claim.** The left column lists the Lean names that other roadmaps cite.

**Witness.** Every other name in rows 43–76 is backticked. `roadmaps grep 'isPerfect_baseChange'` finds the name cited as a Lean name by ArithmeticLocallySymmetricSpaces at its open head.

**Repair.** Write `` `isPerfect_baseChange` `` in backticks.

**Test.** The gate already accepts backticked names in this table that `Suggested.lean` does not declare: `derivedLimit_surjective` (README:65) and `ringCompletionUnit` (README:71). On this head `readme-ids-missing=0`.

## R04 (P3) — The pull-request description does not match the change

This is the previous R02, not repaired. The repair is an edit of the description on GitHub, not of the folder.

**Location.** The description (data) says:
- “README only; `Suggested.lean` is unchanged”;
- “Polynomial laws with Roby representability (`PD.robyRepresentability`)”;
- “Thirteen roadmaps consume it”.

**Witness.**
- `git diff --numstat origin/main...HEAD` gives `343 1227` for `Suggested.lean`.
- `robyRepresentability` occurs nowhere in the README or `Suggested.lean`.
- README:2609–2614 lists eighteen consumers.

**Repair.**
- State that the head replaces main's `Suggested.lean` with 22 headline theorems and the definitions they need.
- Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv` (README:114, 267).
- Replace “Thirteen” with “Eighteen”.

**Test.** Re-read the description against `git diff --stat origin/main...HEAD` and README:2607–2614.

## Previous findings

- **R01 (r11) — not repaired.** README:75 still reads “| `PerfectComplex.IsPerfect`, isPerfect_baseChange | …” (now R03).
- **R02 (r11) — not repaired.** The description still reads “README only; `Suggested.lean` is unchanged”, still cites `PD.robyRepresentability` and still says “Thirteen roadmaps consume it” (now R04).

## Verified sound

### Gate, dependencies, worktree

- **Worktree.** At `8b3bc25`, clean. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty: no edit outside the folder.
- **Folder contents.** `PROGRESS.md`, `STATUS.md` and `metadata.toml` sit beside the README and the Lean file, as on main (`stray-files=0`).
- **Gate (my run).** Every counter is 0, followed by `OK`, exit 0. The worker's record for this head also has `build=0`.
- **Dependency check.** Output:

```text
depcheck: 239 roadmaps, 2368 edges, 0 problem(s)
```

- **Suppliers.** The only roadmap supplier is AlgebraicTopology Stage 6, item 0, which is on main. Its README:954–983 owns “Homotopy-commuting product squares induce actual cone maps, retaining the specified square homotopies”, as cited at README:111 and 129–139.
- **Gaps.** No supplier gap is declared and none is needed.

### Elaboration, signatures, padding

- **Elaboration.** `lake env lean` on `Suggested.lean` gives exactly 22 “declaration uses `sorry`” warnings, at lines 105, 120, 143, 160, 183, 201, 223, 254, 263, 270, 276, 285, 304, 323, 360, 366, 372, 379, 392, 405, 429 and 442. Nothing else is reported.
- **Signatures.** I added `#check @name` for all 33 declarations to a scratch copy (32 plus the local instance `moduleDerived`) and elaborated it once, with no error.
- **Binders.** Each elaborated type carries every hypothesis of its README statement:
  - `ringTowerLimit_jacobson` has `hsurj`, `hnil` (including `n = 0`) and `hlim`;
  - `isAdicComplete_of_isCompletelyFlatModule` has `hA`, `hc` and `hM`;
  - the Matlis pair has `[IsAdicComplete (maximalIdeal R) R]` and `he : TauCeti.IsInjectiveEnvelope e`.
  No binder is lost, and nothing changed.
- **One-tactic probe.** I replaced every `sorry` with `first | rfl | (simp; done) | infer_instance | exact?` in a scratch copy. All 22 theorems failed (“`exact?` could not close the goal”), so there is no padding.
- **Headline coverage.** These README headlines are stated:
  - EZ and generalised EZ (§0.2.2);
  - Dold–Puppe invariance (§0.3);
  - décalage for flat modules (§0.17);
  - exactness of the derived limit (§1.1);
  - the completeness laws and the reflector (§§1.2–1.3);
  - BMS19 Lemma 4.7(1)–(2) (§1.8);
  - perfect-complex closure, the residue criterion and unit reflection (§1.E.0);
  - Matlis biduality (§1.M.2);
  - the second page of the bicomplex spectral sequence (§S.1).
- **Headlines named as not statable.** The rest are named in the docstring with the missing carrier:
  - `⊗^L` on `D(R)`;
  - the cotangent complex;
  - `LF` on `D^(≤0)`;
  - the cohomological spectral sequence and its edge maps;
  - simplicial-algebra completion;
  - effectivity.
- **Effectivity test.** I tested the docstring's reason for §1.E.1 by writing the statement with the file's own `IsRingTowerLimit`, `IsPerfect` and `complexBaseChange`. Existence of a perfect `E` with `Q(E ⊗ A_n) ≅ Q(P_n)` is statable. Compatibility with the given `M_(n+1) ⊗^L A_n ≅ M_n` needs derived scalar extension of morphisms, which the pins lack. The docstring's reason holds.

### Library declarations opened at the pins

- **Tau Ceti `Algebra/Homology/SpectralSequence/Bicomplex.lean`.**
  - `:442`: `columnFiltrationSpectralSequence := K.flip.rowFiltrationSpectralSequence`.
  - `:446`: page `2` at `(−k−2p, p)` is `H_k(K.X p)`.
  - `:426`: `p + 2s + k = 0` on the rows.
  - These fix the indexing of `nonempty_bicomplexSecondPageIso` (computed below).
- **Tau Ceti perfect objects** (`Algebra/Homology/DerivedCategory/Singularity/Basic.lean:92`, `Perfect.lean:143, 192`). `TauCeti.DerivedCategory.Bounded.perfect` is the thick closure in `Dᵇ(C)` of all projectives in degree 0. It has no finiteness condition, so for `ModuleCat R` it is not the roadmap's finite-projective `IsPerfect`. This is a different object, not a duplicate.
- **Tau Ceti `Algebra/Module/Injective/Envelope/Basic.lean:95–101`.** `IsInjectiveEnvelope` has the fields `moduleInjective`, `injective` and `isEssential_range`, which is the “essential, injective” hull of §1.M.1.
- **Tau Ceti `Algebra/Category/ModuleCat/Tower/DerivedLimit.lean:310`.** `derivedLimit : DerivedCategory (ModuleTower R) ⥤ DerivedCategory (ModuleCat R)`.
- **Mathlib.**
  - `AlgebraicTopology/SimplicialObject/Homotopy.lean:102`: `Homotopy.whiskerRight`.
  - `SimplicialObject/ChainHomotopy.lean:157`: `toChainHomotopy`.
  - `Algebra/Category/ModuleCat/ChangeOfRings.lean:974`: `extendScalarsComp`.
  - `Algebra/Homology/DerivedCategory/ExactFunctor.lean:43`: `mapDerivedCategory`.
- **Every name in the supplier contracts is at the pin.**
  - Every Tau Ceti declaration named at README:111–125 and 131–138 exists.
  - 24 named Tau Ceti modules are files.
  - `…ModuleCat.Tower`, `…SpectralSequence.Filtered`, `…KoszulComplex`, `…PolynomialLaw` and `…DividedPowerAlgebra` are directories that hold the named declarations.
- **Duplication grep.** Neither pin has derived completeness, `IsTriangulated` for the derived limit, a general EZ for simplicial modules, or Matlis biduality beyond finite length. The roadmap's targets are therefore not restatements.

### Cross-roadmap citations, ownership and overlaps

- **Citation leads.** `citations.md` has 0 unresolved cross-roadmap citations and 92 Lean-name leads:
  - 57 are entries of the cited-name resolution table (README:43–76);
  - 21 are names declared in `Suggested.lean`;
  - 4 are Tau Ceti module paths, all present at the pin;
  - 10 are AffineCrystalline names.
- **AffineCrystalline names, read on GitHub (`main` branch).**
  - `DPAlgebraAugmentation.lean` declares, in `AffineCrystalline.Envelope.FreeConstruction` with `R M : Type u`, the names `augmentation`, `augmentation_apply_dp`, `augmentation_apply_algebraMap`, `positiveIdeal` (an `Ideal.span`), `dp_mem_positiveIdeal`, `positiveIdeal_le_augmentation_ker`, `sub_augmentation_mem_positiveIdeal` and `positiveIdeal_eq_augmentation_ker`, with the stated content.
  - `TotM.lean`: `RawBi.augRowι_quasiIso` (augmented columns exact) and `RawBi.augColι_quasiIso` (augmented rows exact).
  - `TotQuasiIso.lean`: `RawBi.totMap_quasiIso` (columnwise quasi-isomorphism).
  - `CechDerived.lean`: `rightDerivedLimIsoCech` over `D : CechNerveData J`.
  - The README's descriptions at README:366–375, 425–429, 463–466, 492–496, 975–982 and 1812–1818 match.
- **Ownership.**
  - EnhancedDerivedSheaves (main README:2573) compares its telescope predicate with this roadmap's `DerivedDeRham.derivedCompleteness` of §1.2: it is a consumer.
  - DerivedDeRhamCohomology (open head, README:324 and others) and FiniteFlatGroupsAndIntegralPadicHodgeTheory cite §0.4 rather than owning the cotangent complex.
  - SchemeKTheoryOperations' `IsPerfectComplex` is for schemes, a different object.
  - No other `Suggested.lean` declares a `TauCetiRoadmap.DerivedModuleAlgebra.*` name.
- **Overlaps (`overlaps.md`).**
  - No other open pull request changes this roadmap.
  - No cited id is dropped.
  - The dropped §1.T.1 ids are mapped to Tau Ceti declarations at README:34–36.

### Seeded sample: locators read against the text

- **§0.1.**
  - StacksCt Definition 3.1 (Tag 08PM) is on p.2 (line 81) and Remark 5.5 (Tag 08QI) on p.9 (line 360).
  - Lemmas 4.1–4.3 (lines 144–195) and 5.6–5.7 (lines 382–396) are on pp.4–10.
  - Remark 5.5 adds “surjecting onto B”, but each of its conditions (1)–(3) forces `P_0 → B` onto, so the README's omission is harmless.
- **§0.2.** StacksMA Definition 15.60.1 is on p.144 (line 6709); Lemmas 60.5 and 60.7 are on p.145; Lemma 60.10 is on p.146; Lemma 60.12 and Definition 60.13 are on p.147. The statements match.
- **§0.3.**
  - Dold–Puppe Satz 1.15 (p.209, line 301): any functor preserves homotopy.
  - Satz 3.31 (p.225, line 852): `N` and `K` preserve homotopies.
  - 4.1–4.6 (pp.227–228): projective simplicial resolutions are unique up to homotopy, and `L_qT := H_q TX`. 4.7 (p.228) is the additive case.
  - StacksSimp Remark 14.26.4 (Tag 019M): functors carry homotopies.
  - SAG Proposition 25.2.1.2 and Corollary 25.2.1.3 are on pp.1698–1699.
- **§0.4.**
  - StacksCt Definition 3.2 (p.3), Lemmas 4.3–4.7 (pp.5–6) and Lemma 4.5 (Tag 08QF) match.
  - BL22 Construction B.1 and Remark B.2 are on p.225 and Remark B.5 on p.226.
  - The locator for the arrow model is R01.
- **§0.5.** StacksDefos Lemmas 2.1–2.3 and Remark 2.4 are on pp.2–4 (lines 56, 127, 161, 177). GR §§2.5.4–2.5.7 is on p.30: Baer sum `α_*(X ⊕ Y)^*δ`, line 1474.
- **§0.6.**
  - GR Theorem 2.5.30 (p.34, line 1672) and Lemma 3.2.1 with (3.2.2) (p.41, line 1946). The inverse there restricts `A → E` to `I`, which is the README's conormal formula.
  - StacksDefos Lemma 2.3 is on p.4; Bhatt12 Remark 6.6 with (6) is on p.25.
- **§0.7.** StacksCt Lemmas 11.2–11.3 are on p.21 (lines 916, 933) and Lemma 13.3 (Tag 09CG) on p.26 (line 1146).
- **§0.8.** StacksCt Proposition 7.4 (Tag 08QX) is on p.16 (line 704).
- **§0.11.** StacksCt Lemma 3.4 is on p.3; Lemma 8.1 on p.17; Lemma 8.6 (Tag 08SF) on p.19.
- **§0.17.**
  - DM Lemma 3.3 is on p.21 (line 863): the filtration of `∧^i` for a short exact sequence of projectives.
  - SAG Proposition 25.2.4.2 (p.1704, SAG line 62450) states `LSymⁿ(ΣM) ≃ Σⁿ∧ⁿM` and `∧ⁿ(ΣM) ≃ ΣⁿΓⁿM`.
  - Bhatt12 Proposition 3.22 is on p.11 and Remark 3.43 on p.18.
- **§1.2.** StacksMA Lemmas 93.1–93.3, Definition 93.4 and Proposition 93.5 are on pp.261–263. 93.1(3)⇔(4) gives `isDerivedCompleteCohomology`, and 93.2 (a radical ideal) gives the generators and radical laws.
- **§1.3.** StacksMA Lemma 93.10 (Tag 091V) is on p.264, with the extended Čech complex as `C_I`. Lemma 93.18 is on p.267; Lemmas 93.20 (derived Nakayama) and 93.21 are on p.268.
- **§1.4.** StacksMA Situation 93.15 has transitions `f^(m−n)` on `e_i`; with Lemma 93.18 this is on pp.266–267.
- **§1.5.**
  - StacksMA Lemmas 95.1–95.2 are on p.271.
  - Lemma 96.1 is on p.275 and Proposition 96.2 on p.276, with Algebra Lemma 51.2 (Artin–Rees).
  - Lemma 96.4 (Tag 0A06) and the §15.96 opening example are on p.275 (see `## Source issues`).
  - Prisms §1.2, footnote 5 (p.10) gives the regular-sequence case.
- **§1.9.**
  - BMS19 Theorem 3.1 is on p.217, with assertion (1) of its proof for any `M ∈ D(A)`.
  - Remark 3.2 (p.218) leaves hyperdescent open.
  - Lemma 4.4 is on p.220 and Lemma 4.5(2) on p.221.
  - Corollary 4.8(3) and Remark 4.9 are on p.223; Remark 4.9 passes to the limit via `A/pⁿ`.
- **Headline locators, also read.**
  - BMS19 Lemmas 4.6–4.7 are on pp.221–222, matching the two §1.8 headlines word for word in hypotheses.
  - StacksMA Lemma 79.2 (Tag 068V, p.202; (3)⇒(1) with maximal ideals) and Lemma 76.2 (p.191; the representative in `[a,b]`) give `pseudoCoherent_residueCriterion`.
  - StacksMA 76.1, 76.4 and 76.5 (p.191) give `IsPerfect` and the triangle and retract laws.
  - StacksMA 99.3 (Tag 0CQG, p.288) contains the unit-reflection step.
  - Stacks Proposition 47.7.8 (Tag 08Z9) needs a complete Noetherian local ring and no finite residue field; Lemma 47.7.5 (Tag 08Z6) gives `Hom(E,E) = R̂`.

### Adversarial table

| Statement | Instances | Values on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 resolution (README:744–784) | constant `A[t]` over `A[t]/(t²)`, `A ≠ 0` | `H₀ = A[t]` vs `B`: kernel `(t²) ≠ 0`, not a qiso. Each of (1)–(3) gives `π₀P ≅ B`, so `P₀ → B` is onto | True | none |
| §0.2 K-flatness (README:788–848) | `ℤ/4` with `×2` both ways; `F_p ⊗^L F_p` | `ker 2 = im 2 = (2)`, acyclic. `⊗F₂`: zero differentials, `H = F₂` in every degree; K-flat and acyclic would give an acyclic tensor (60.12 with `Q = 0`). `[F_p →0 F_p]`: `H⁰ = H⁻¹ = F_p` | True | none |
| §0.3 / `quasiIso_whiskering_of_projective` (Lean:160) | `Γ₀[ℤ →2 ℤ] → ℤ/2` under `(−)^⊗2`; `W**` on `⊕_ℕ F₂` | `H₁`: `Tor₁(ℤ/2,ℤ/2) = ℤ/2` vs `0`, so the target must be projective; `V → V**` is injective, `dim V**` uncountable, not onto | True | none |
| §0.4 (README:1183–1244) | `k[ε]/ε²`, char ≠ 2 and char 2; `ℤ → ℤ/2` | `x² ↦ 2ε dε`: `H⁻¹ = ker 2ε = εB ≅ k`; char 2: `H⁻¹ = H⁰ = B`; `ℤ → ℤ/2`: `H⁰ = 0`, `H⁻¹ = (2)/(4) ≅ ℤ/2` | True; locator R01 | R01 |
| §0.5 Baer sum (README:1285–1303) | `Exal_ℤ(F₂,F₂)`; `ℚ[X] ⊕ εℚ[X]` | `Exal = Hom(F₂[1],F₂[1]) = F₂`: the `ℤ/4` class has order 2, two copies sum to split. `a+εb ↦ a+ε(b+a′)` fixes the quotient and `εℚ[X]` but moves `X` | True | none |
| §0.7 (README:1307–1324) | `k[x,y]/(x,y)²`, LS complex | syzygies `s₁ = (y,−x,0)`, `s₂ = (0,y,−x)`; `TrivRel = (xs₁, ys₁+xs₂, ys₂)`; `Rel/TrivRel` has basis `s₁, s₂, ys₁`; `ys₁ ↦ (y²,−xy,0) = 0`, the others are independent: `H⁻² = k` | True | none |
| §0.6 (README:1328–1368) | `ℤ → ℤ/p`, `M = ℤ/p`; `ℤ/9 → F₃` | `Hom(F_p[1],F_p) = 0`, `Hom(F_p[1],F_p[1]) = F_p` (from `ℤ/p²`). Inclusion `1 ↦ 3`: `3 mod 9 ↦ 1`; `1 ↦ 6`: `3 ≡ 2·6`, so `↦ 2`; order 3 | True | none |
| §0.8 (README:1372–1406) | `ℤ → ℤ → ℤ/3`; `A = B`; `ℚ → ℚ[X] = ℚ[X]` | `L_(ℤ/ℤ) = 0`: the second map is `id` on `F₃[1]`, nonzero on `H⁻¹`. `A = B`: source `0`. First map sends `dX ↦ dX ≠ 0` | True | none |
| §0.11 (README:1462–1475) | `ℤ[X] → ℤ[X^±]`; `∪A[X₁…X_n]` | relative `L = 0` (8.4, 8.6), `dX` kept; `Ω = ⊕A[X]dX_i`, finitely supported, not `∏`; `colim(L_i ⊗ B) = colim L_i` because `L_i` is termwise free | True | none |
| §0.17 / decalage headlines (Lean:183, 201) | `N = R`, `n = 0, 1, 2`; `N = ℤ/2`; `N = 0` | `Γ₀(R[1]) = 0, R, R²`: `∧²` gives `R` in degree 2 only (`= Γ²R`); `Sym²`: unit `R → R` in degrees 2,1, acyclic (`= ∧²R = 0`); `ℤ/2`: `H₂ = F₂ ≠ ℤ/4 = Γ²_ℤ(ℤ/2)`; `n = 0`: `R = Γ⁰ = ∧⁰` | True; flatness needed | none |
| §1.2 laws (Lean:248–280) | `I = A`; `I = 0`; `ℚ_p`; `ℤ[−1]` at `I = ℤ` | `f = 1`: all `Hᵏ(M) = 0`; `I = 0`: `A[1/0] = 0`, so everything is complete; `ℤ[1/p] → ℚ_p` is nonzero; `ℤ[−1]`: `n = −1` gives `ℤ ≠ 0`, so testing only `n = 0` would wrongly accept it | True | none |
| §1.3 reflector (Lean:285) | `ℤ`, `ℤ[1/p]`, `ℤ/p^m`; `×2` on `ℤ[0]`, `I = 0` | `Λℤ = ℤ_p`, `Λℤ[1/p] = 0` (93.12), `ℤ/p^m` fixed. A cokernel would be a split epi onto `0` or `ℤ`; `ℤ → ℤ/2` does not factor through `0` | True | none |
| §1.4 Koszul tower (README:2014–2028) | `K(p^(n+1)) → K(p^n)`; tuple `(0)` | `(×p, id)`: `pⁿ·p = p^(n+1)`, as in 93.15. `(0)`: zero degree −1 transitions; `Rlim(M ⊕ M[1]) = M` | True | none |
| §1.5 non-Noetherian Check (README:2055–2070) | `A = ℤ_p ⋉ ℚ_p/ℤ_p`, `I = (p)` | Koszul `H⁻¹ = T[pⁿ]` (×p onto), `H⁰ = ℤ_p/pⁿ`; `Rlim`: `ℤ_p`, `ℤ_p`. Naive tower: `ℤ_p[0]`. `ℤ_p[1]` complete (telescope inverse `b ↦ (Σ p^j b_(n+j))`). `Hom(C, ℤ_p[1]) = Ext¹_A(A,ℤ_p) = 0` ⇒ nonsplit in `D(A)` | True; contradicts StacksMA 0BKH in `D(A)` | none |
| §1.9 descent (README:2255–2271) | `ℤ_p → F_p`; `ℤ_p → ℤ_p²`; identity | `F_p ⊗^L F_p` has `H⁻¹ = F_p ≠ 0`, so it is not completely flat; the product map's Čech nerve has a section; the identity gives `M` | True | none |
| `nonempty_bicomplexSecondPageIso` (Lean:105) | positions on pages 2 and 3 | page 2 at `(−k−2p, p)` is `H_k(K.X p)`; `d_r` has bidegree `(r, 1−r)`, so page 2 runs columns `p+1 → p → p−1`; page 3 is `H_p(t ↦ H_k(K.X t))` | True | none |
| §S.1 Check (README:997–1002) | `a,b,c,e` at `(0,1),(1,0),(1,1),(2,0)` | `D(a) = c`, `D(b) = c+e`: `[[1,1],[0,1]]`, det 1 ⇒ `H(Tot) = 0`; `E₁ = R` at `(0,1),(2,0)`; `D(a−b) = −e` ⇒ `d₂[a] = [−e]`, `E₃ = 0` | True | none |
| `simplicialTensorComparison` (Lean:120) | `x ∈ X₁`, `y ∈ Y₁` | `d(s₁x⊗s₀y − s₀x⊗s₁y) = s₀(d₀−d₁)x⊗y − x⊗s₀(d₀−d₁)y = ∇(dx⊗y) − ∇(x⊗dy)`, the `TensorSigns` sign at `p = 1`; the opposite sign negates it and fails | True | none |
| `bisimplicialDiagonalComparison` (Lean:143) | constant `P` | diagonal and total homology: `P` in degree 0, `0` above | True | none |
| `derivedLimit_isTriangulated` (Lean:223) | `A_n = ⊕_(m≥n)k ⊂ V → kⁿ` | `lim A = 0`, `lim¹ A = ∏k/⊕k`; the zero-third-map triangle is not distinguished since `⊕k → ∏k` is not onto; the global connecting map is the quotient | True | none |
| `IsCompletelyFlatModule` (Lean:293) | `I = 0`; `I = A`; `F_p` over `ℤ` at `p` | `I = 0`: `Tor_n(M,A) = 0` and `A⊗M ≅ M`, so it is flatness; `I = A`: every `M`; `F_p`: `Tor₁ = F_p ≠ 0` | Discriminating | none |
| `isAdicComplete_of_isCompletelyFlatModule` (Lean:304) | `A = M = ℤ/4`, `p = 2`; `A = ℚ`, `p = 2` | `ℤ/4 ⊗ 2ℤ/4 → 2ℤ/4`, `1⊗2 ↦ 2`, an iso; over `ℚ`: `A[1/2] = ℚ`, so completeness forces `M = 0` | True | none |
| `isCompletelyFlatModule_of_isAdicComplete` (Lean:323) | `A = ℤ/4`, `M = ℤ/2` | `M/2M` is flat over `ℤ/2`, but `M/4M = ℤ/2` is not flat over `ℤ/4` (`Tor₁ = ℤ/2`): the `n = 2` hypothesis is needed | True | none |
| `IsPerfect` and closure (Lean:346–381); row 75 | `eA ⊂ k×k`; `[ℤ →2 ℤ]` | `eA` is projective, Euler ranks `(1,0)` ⇒ no bounded free model; the alternating `e`, `1−e` resolution works; `[ℤ →2 ℤ] ⊗ F₂ = [F₂ →0 F₂]` keeps `H⁻¹` | True; R03 is style | R03 |
| `ringTowerLimit_jacobson` (Lean:392) | `k[t]/(t^(n+1))`; `A₀ = 0`; `A₀ = ℚ`, `A_n = ℤ` | `1+t ↦ 1`, inverse `Σ(−t)^m`. Shifted tower: `1 ∈ ker(k → 0)` is not nilpotent, so `hnil` fails at `n = 0`. `ℚ`/`ℤ`: `hsurj` fails; `2 ∉ ℤ^×` | Both hypotheses needed | none |
| `pseudoCoherent_residueCriterion` (Lean:405) | `[k[[t]] →t k[[t]]]`; `k` over `k[ε]`; zero ring | fibre `[k →0 k]`: `H⁻¹ = k`, so the interval needs `[−1,0]`; `k ⊗^L k` has `Tor_i = k` for all `i`, no interval (and `k` is not perfect); zero ring: `P` acyclic, `E = 0` | True | none |
| `biduality_of_finite` / `_of_artinian` (Lean:429, 442) | `R = ℚ`; `ℤ_p`; `ℤ_(p)`; `E ⊕ E` | finite-dimensional `V ≅ V**`; `End(ℚ_p/ℤ_p) = ℤ_p`; for `ℤ_(p)`, `Hom(E,E) = ℤ_p ≠ ℤ_(p)` (08Z6), so completeness is needed; `Hom(k, E²) = k²` | True | none |
| §1.M.1 Check (README:2548) | `R = k`, `M = ⊕_ℕ k` | `D(M) = ∏k`; evaluation injective, not onto | True | none |
| §1.E.1 Checks (README:2471–2478) | `[A_n →t A_n]`; `B = k[x₁,…]/(x_i²)` | `H⁻¹(M_(n+1)) = (t^(n+1)) ↦ 0` in `A_n`, while the limit has `H⁻¹ = 0`; `f` in `N` variables has `f^(N+1) = 0`, yet `x₁⋯x_r ≠ 0` | True | none |
| §1.1 cofinal Check (README:1864) | drop `r` levels of `×p` on `ℤ` | `Σpⁿa_(n+r) = (Σp^m a_m − Σ_(m<r)p^m a_m)/p^r`; composed with `×p^r` it is `id` mod `ℤ`, and `×p` is bijective on `ℤ_p/ℤ` | True | none |
| §1.1 square Check (README:1867–1870) | `h_n = x₀` for even `n` | `Σ9^m = −1/8 ∉ ℤ`, nonzero in `ℤ₃/ℤ` | True | none |
| §1.1.1 Check (README:1901) | `RHom(ℤ[1/p], ℤ)` | `Rlim(ℤ ←p ℤ …)`: `H⁰ = 0`, `H¹ = ℤ_p/ℤ` | True | none |
| §0.25 Checks (README:1704–1744) | `k[x]/(x³) → k[x]/(x²) → k`; `A′ = ℤ/4`, `c = 0` | `J/J² = (x²)/(x³) ≅ k`, `x² ↦ 0` in `(x)/(x²)`, so the connecting map is onto `k`; `B′ = F₂[ε]/ε²`: `JB′ = 0`, `B′/JB′ ≠ B`, not flat | True | none |
| §0.DP.3 `F₂` Checks (README:453, 637) | `Γ_(F₂)(F₂)` | `dp(1,1)·dp(n,1) = (n+1)dp(n+1,1)`: the ideal is the span of odd degrees, so `dp(2,1)` is not in it; over `ℚ`, `dp(2,m) = ½dp(1,m)²` | True | none |
| Convention README:96 (`k` a field) | Checks README:1701, 2328, 2427 | at `k = 0` the lifts coincide, `eA = 0` has a model, and all `Tor` vanish; `k ≠ 0` restores each Check | Consistent | none |

## Not verifiable

- **IllusieCC, Chapter II, 1.2.6.2 (§0.9).** Springer LNM 239 has no open copy. It is cited only as used in GR Proposition 8.1.7, and is outside the seeded sample.
- **Roby, Chenevier, NSW and Nekovář.** Not read this round: they are outside the seeded sample, although legal copies exist at the linked Numdam, arXiv and author pages. Their absence from References is R02.
- **AffineCrystalline.** Read on GitHub's `main` branch, not on the archived version 1.0.0 that the DOI names.
- **Sources manifest.** The package manifest records 5 works. To read the sample I fetched StacksDefos, StacksSimp, StacksAlg, Bhatt12, DM, BL22, Prisms and SAG through the sources service into the cache, using a scratch copy of the manifest. The package manifest was not edited, and its missing entries are for the worker to add.

## Source issues

- **Error** in StacksMA at §15.96, opening paragraph (Tag 0BKH), printed p.275: the source says the derived completion of `A[0]`, for `A = ℤ_p ⋉ ℚ_p/ℤ_p` at `(p)`, is `ℤ_p[1] ⊕ ℤ_p[0]`; it should say this splitting holds after restriction to `D(ℤ_p)`, since in `D(A)` `Hom(K^∧, ℤ_p[1]) = Ext¹_A(A, ℤ_p) = 0`; affects nothing.
- **Error** in SAG at Construction 25.2.2.2, printed p.1700 (also Proposition 25.2.3.4(2), p.1703): the source defines `∧ⁿ` as signed-permutation coinvariants of `M^⊗n` and calls it free of rank `C(m,n)`; it should be the quotient by tensors with a repeated factor, since for rank one and `n = 2` the coinvariants are `A/2A`; affects a stated result.
