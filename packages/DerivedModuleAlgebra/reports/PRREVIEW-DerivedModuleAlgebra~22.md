# Review of DerivedModuleAlgebra (pull request #1701 at ee318e5)

**Verdict:** needs changes

This is a full review of the folder at ee318e5, the same head that r21 read. "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`. Pins: Mathlib 1b1ccf4, Tau Ceti 2fd255d.

There are three findings:

- R01 (P2): a headline that is statable at the pins is missing from Lean.
- R02 (P3): one false clause remains in the pull-request description.
- R03 (P3): two Stacks chapters are cited without a References key.

## R01 (P2) — The derived tensor product and derived extension of scalars are statable at the pins but absent

**Location.** Lean:51–53, in the module docstring's list of headlines it calls not statable:

> "no derived tensor bifunctor or derived extension of scalars on `DerivedCategory (ModuleCat R)` exists at the pin"

**Claim.** README §0.2 defines `⊗^L` as the derived tensor of [StacksMA] Definition 15.60.13 (Tag 064M), and §1.E.0 defines derived extension of scalars. The roadmap itself lists both as headlines (Lean:51). Mathlib at the pin has the left-derived-bifunctor API, so the existence of both functors can be stated with no new definition. The docstring's reason is therefore wrong.

The docstring's claim about derived restriction of scalars is also wrong. Restriction is exact, and Mathlib's `Functor.mapDerivedCategory` (`Mathlib/Algebra/Homology/DerivedCategory/ExactFunctor.lean`:43) already supplies the derived functor.

**Witness.** Mathlib's `Functor.HasLeftDerivedFunctor₂` (`Mathlib/CategoryTheory/Functor/Derived/LeftDerivedTwo.lean`:48) and `Functor.HasLeftDerivedFunctor` (`…/LeftDerived.lean`:159) exist at the pin. The statements below elaborate there, and `infer_instance`, `simp`, `rfl` and `aesop` all fail on them.

**Repair.**

1. Add the first theorem to Lean before `end DerivedDeRham` of Layer 1, and the second before `IsRingTowerLimit` (Layer 4):

```lean
/-- **The derived tensor product exists** (README 0.2; Stacks, Definition 15.60.13, Tag 064M,
with Lemmas 15.60.10 and 15.60.12, Tags 06Y4 and 064L). -/
theorem hasLeftDerivedFunctor₂_tensor (R : Type u) [CommRing R]
    [HasDerivedCategory.{w} (ModuleCat.{u} R)] :
    (MonoidalCategory.curriedTensor (CochainComplex (ModuleCat.{u} R) ℤ) ⋙
      (Functor.whiskeringRight _ _ _).obj (DerivedCategory.Q (C := ModuleCat.{u} R))).HasLeftDerivedFunctor₂
      (HomologicalComplex.quasiIso (ModuleCat.{u} R) (ComplexShape.up ℤ))
      (HomologicalComplex.quasiIso (ModuleCat.{u} R) (ComplexShape.up ℤ)) := by
  sorry

/-- **Derived extension of scalars exists** (README 1.E.0; Stacks, Lemmas 15.60.10 and 15.60.12,
Tags 06Y4 and 064L). -/
theorem hasLeftDerivedFunctor_extendScalars {R S : Type u} [CommRing R] [CommRing S]
    (f : R →+* S) :
    (complexBaseChange f ⋙ DerivedCategory.Q (C := ModuleCat.{u} S)).HasLeftDerivedFunctor
      (HomologicalComplex.quasiIso (ModuleCat.{u} R) (ComplexShape.up ℤ)) := by
  sorry
```

2. Name both theorems in README §0.2 and §1.E.0. Add `hasLeftDerivedFunctor₂_tensor` to the README:46 row, which is where EnhancedDerivedSheaves' citation of `DerivedDeRham.derivedTensor` resolves.
3. Rewrite the first docstring bullet (Lean:51–57). It should keep only what is still unstated, namely the monoidal and exactness laws, and say why derived Nakayama, the §1.5 comparisons, the §1.8 bound and `isPerfect_baseChange` remain on K-flat and finite-free models.
4. Revisit the §1.1.1 bullet (Lean:72–73) in the same way.

**Test.** The scratch copy with exactly these insertions elaborates with exit 0. Its only messages are 31 "declaration uses `sorry`" warnings: the 29 of the head plus the two new theorems.

## R02 (P3) — The pull-request description still says the head leaves `Suggested.lean` unchanged

This is r21's R01, partly repaired.

**Location.** The description's **Summary** (data):

> "README only; `Suggested.lean` is unchanged. The head also replaces main's `Suggested.lean` …"

**Claim.** The appended sentence was added as r21 asked, but the false clause before it was kept. The Summary now contradicts itself.

**Witness.** `git diff --numstat origin/main...HEAD` gives `492 1230` for Lean.

**Repair.** On GitHub, delete "README only; `Suggested.lean` is unchanged." from the Summary. This is outside the folder.

**Test.** After the edit, the Summary agrees with the numstat.

## R03 (P3) — Stacks Chapters 47 and 19 are cited without a References key or manifest entry

**Location.**

- README:2667: "(Stacks, Proposition 47.7.8, tag 08Z9; §47.7, tag 08Z1"
- README:2633: "(Stacks, Lemma 47.7.5, tag 08Z6)"
- README:729: "(Stacks, Theorem 19.12.6, Tag 079P"
- Lean:570 and Lean:584 (the two Matlis headlines)

**Claim.** Every cited work needs a key in References and an entry in `sources.toml`. These two chapters have neither. Tag 08Z9 is the only locator for `Matlis.biduality_of_finite` and `Matlis.biduality_of_artinian`.

**Witness.** References (README:2746–2753) lists Stacks Chapters 10, 12, 14, 15, 21, 23, 91 and 92 only, and the manifest has no Chapter 19 or 47 entry. Read at Stacks, the content matches: Proposition 47.7.8 (08Z9, p.11), Lemma 47.7.5 (08Z6, p.10), Theorem 19.12.6 (079P, p.19).

**Repair.**

1. Add `**StacksDual**` (*Dualizing Complexes*, Chapter 47, `https://stacks.math.columbia.edu/download/dualizing.pdf`) and `**StacksInj**` (*Injectives*, Chapter 19, `…/injectives.pdf`) to References.
2. Cite them as:
   - [StacksDual], Proposition 47.7.8, Tag 08Z9, p.11
   - [StacksDual], Lemma 47.7.5, Tag 08Z6, p.10
   - [StacksDual], Remark 47.7.9, Tag 0EGL, p.11
   - [StacksInj], Theorem 19.12.6, Tag 079P, p.19
3. Record both in `sources.toml`.

**Test.** After the edit, both keys resolve in References and in the manifest.

## Previous findings

- **r21 R01** (the description): partly repaired.
  - Repaired: Roby representability now reads "`DividedPowerAlgebra.homogeneousLawEquiv`".
  - Repaired: the consumer count now reads "Eighteen roadmaps consume it".
  - Repaired: the title ends "and state the headline theorems in Suggested.lean".
  - Repaired: the Summary now ends "The head also replaces main's `Suggested.lean` …".
  - Not repaired: "README only; `Suggested.lean` is unchanged." remains. Raised again as R02.

## Verified sound

### Gate, dependency check, build, signatures, padding

- **Gate.** My run at this head ends `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. All 27 counters are 0.
- **Dependency check.** Output, with no UPWARD, CYCLE or `moved:` line:
  ```text
  depcheck: 239 roadmaps, 2337 edges, 0 problem(s)
  ```
  The roadmap is on main and not in ORDER.txt. Its only roadmap supplier, AlgebraicTopology, is also on main.
- **Files outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty.
- **Elaboration.** `lake env lean` on Lean exits 0. Its only messages are 29 "declaration uses `sorry`" warnings.
- **Signatures.** I elaborated a scratch file with `#check @…` for all 39 declarations and compared each type with its README statement. No binder is lost: the file has no `variable` block, and every hypothesis sits in its own signature.
  - `ringTowerLimit_jacobson` keeps `hsurj`, `hnil` and `hlim`.
  - `pseudoCoherent_residueCriterion` keeps `hP` and `hfib`.
- **Padding probe.** On a scratch copy I replaced each `sorry` with `first | rfl | simp | infer_instance | trivial | decide | aesop`. All 29 theorems fail, with errors on 29 distinct lines.

### Seeded sample (15 targets): every locator checked against the text

| Target | Locators verified (source line, page) |
| --- | --- |
| 0.1 | StacksCt line 81 (Def 3.1, 08PM, p.2); 144/169/193 (Lemmas 4.1–4.3, 08PS–08PU, pp.4–5); 360 (Remark 5.5, 08QI, p.9); 382/395 (Lemmas 5.6–5.7, 08QJ/08QK, pp.9–10) |
| 0.2.2 | StacksSites line 4324 (Remark 21.39.11, 08QD, pp.96–97); DoldPuppe 422 (Satz 2.9, p.213), 567 (Satz 2.15, p.217), 583 (2.16, p.217), total differential `δ′ + (−1)^p δ″` at 408 |
| 0.5 | StacksDefos 56/127/161/177 (2.1–2.4, 08S5, 08S7, 0GPT, 0GPU, pp.2–4); GR 1454–1480 (§§2.5.4–2.5.7, Baer sum via diagonal pullback and addition pushout, p.30) |
| 0.8 | StacksCt 704 (Prop 7.4, 08QX, p.16) |
| 0.9 | GR 10619 (Prop 8.1.7, pp.219–220); `R• = S• ×_S R`, Illusie II.1.2.6.2 and `E¹_ij = H_j(L_(S[i]/R[i]))` at 10634–10639; BMS19 552 (§2, printed pp.212–216) |
| 0.10 | StacksCt 456 (§6, 08QL, pp.11–12), 519 (Lemma 6.2, 08QQ, p.12); its hypothesis `B ⊗^L A′ = B′` is the README's Tor independence |
| 0.11 | StacksCt 108 (Lemma 3.4, 08S9, p.3), 779 (8.1, 08QZ, p.17), 827 (8.6, 08SF, p.19); 8.6 with `A = B` gives `L_(S⁻¹B/B) = 0` |
| 0.12 | StacksCt 847 (9.1, 08R5, p.19), 805 (8.4(5), 08R2, p.18), 228 (4.7, 08QH, p.6) |
| 0.14 | SAG 62288 (Constr. 25.2.2.2, p.1700), 62365 (25.2.3.1, p.1702), 62398/62405 (25.2.3.2–3, p.1703), 62412 (25.2.3.4, pp.1703–1704); DoldPuppe 902–1040 (§4, pp.227–230); BL22 10001 (B.1, p.225), 10042 (B.5, p.226) |
| 0.15 | SAG 62262 (Constr. 25.2.2.1, pp.1699–1700); DoldPuppe 994 (4.10, pp.229–230) |
| 0.16 | SAG 62308 (Constr. 25.2.2.3, pp.1700–1701), 62327 (Remark 25.2.2.4, p.1701); DoldPuppe 1023/1031 (4.13, (4.14), p.230) |
| 0.17 | DM 863 (Lemma 3.3: statement and proof sketch on p.21, application on p.22 at 902); SAG 62450 (25.2.4.2, p.1704, proof to p.1707); Bhatt12 523 (Prop 3.22, pp.11–12), 893 (Remark 3.43, p.18) |
| 1.1 | StacksMA 10946 (89.1, 091D, p.238), 10971 (89.3, 0CQD, p.238), 10983 (89.4, 0CQE, p.239), 11108 (89.10, 091J, p.241), 11124/11133 (89.11–12, 091K/091L, p.242) |
| 1.1.1 | StacksMA 8707–8723 (§15.75, 0A5W, 0A63, 0A64, 0A65, p.189); StacksSites 3669 (08J7, p.82) |
| 1.8 | BMS19 850 (Def 4.1, p.220), 895 (Lemma 4.6, p.221), 908 (Lemma 4.7, pp.221–222), 958 (Cor 4.8, p.223) |

The README flags no locator as unverified.

I also checked locators the headlines rest on:

- StacksMA:
  - 068V (p.202), 066W (p.192), 0CQG (p.288), 091V (p.264), 091P (p.261), 091Q (p.262)
  - 0922 (p.276), 0923 (p.271), 0A06 (p.276), 062F/062G (p.76), 0920 (p.267)
- StacksHom: 0130/0132/0133 (pp.67–69).
- StacksCt: 08SJ/08SL (p.29) and 08QF (p.5).

### Library declarations

- I extracted 238 backticked library names from README.
- 198 elaborate with `#check @…` at the pins.
- The other 40 I opened in the pinned sources. These are modules with no built object file, plus abbreviated `CategoryTheory.` names, which I checked with their full names:
  - `RobyAlgebra.lean`:340, 521
  - `BaseChange.lean`:100, 200
  - `TensorMap.lean`:101, 138, 162
  - `SymmetricTensor.lean`:277
  - `PolynomialLaw/Multiplicative.lean`:71, 138, 146, 233
  - `MappingCocone/Homotopy.lean`:47, 86, 93
  - `KoszulComplex/Regular.lean`:140; `Tensor.lean`:319, 340
  - `Ideal/ArtinRees.lean`:85
  - `AdicCompletion/Torsion.lean`:95
  - `MatlisDuality/FiniteLength.lean`:57, 102, 139, 155; `Artinian.lean`:100
  - `Tower/Milnor/Subsequence.lean`:52; `Naturality.lean`:155, 172
- Definitions I relied on:
  - `TauCeti.IsInjectiveEnvelope` (`Envelope/Basic.lean`:95) bundles injectivity of `Q`, injectivity of `f` and an essential range.
  - The reduction tower (`Tower/Reduction.lean`:85) is `n ↦ M/I^(n+1)M`.
  - The column spectral sequence's first page sits at `(−k−2p, p)` (`Bicomplex.lean`:446).
  - The cocone shift structure of the derived limit is at `DerivedLimit.lean`:165 and 329.

### Cross-roadmap citations, overlaps, ownership

- **Citations.** I resolved these on main:
  - AlgebraicTopology Stage 6 item 0 (its README:954; the homotopy-square cone maps are at :978–994).
  - EnhancedDerivedSheaves §§0.1–0.3, E1.F3.H1 and E1.8.DMA.1 (README:29, 152, 429–455).
  - EtaleCohomologyFoundations F.10.3 (README:1295).
  - KhovanovHomology K5 (README:46).
  - PerfectoidSpaces P0.19 (README:59, 326).
  - AdicSpacesPartIII (README:114, 310).
  - `citations.md` lists no cross-roadmap citation found nowhere.
- **Overlaps.** `overlaps.md` shows no other open pull request changing this roadmap. The ids dropped here are §1.T.1 and anchor `#1t1-towers-lim-and-lim¹` (StableHomotopyKTheory #1227:86). Both are mapped at README:34–36.
- **Ownership.** I ran `roadmaps grep` over main and all 469 open heads for eight headline objects: triangulated derived limit, derived Nakayama, Matlis biduality, décalage, the non-additive whiskering invariance, complete flatness, the completion reflector and the ordinary-quotient comparisons.
  - Only this pull request declares them. EllAdicHomotopyTypesAndWeights #1644 mentions derived Nakayama in its docstring as a consumer.
  - All names live under `TauCetiRoadmap.DerivedModuleAlgebra`, so no fully qualified name collides.
  - Tau Ceti's `isArtinian_of_isNoetherian_linearMap` (`Artinian.lean`:91) is the converse direction, so the Matlis headlines do not duplicate it.

### Headline theorems

**Stated in Lean (29):**

- the second page of the column spectral sequence
- simplicial and bisimplicial Eilenberg–Zilber
- the non-additive whiskering invariance
- both flat décalages
- exactness of the derived limit
- the completeness criteria and the completion reflector
- derived Nakayama
- the four §1.5 comparisons
- the §1.8 amplitude and module results
- perfect closure and base change
- unit reflection and the residue criterion
- Matlis biduality, finite and Artinian sides

**Provided by the pins and named in the docstring:** Roby representability, augmentation, Koszul, K-injective and K-flat replacements, Lazard, Alexander–Whitney, bicomplex convergence, `derivedLimit`, `derivedHom`, complete flatness of flat modules, and the Matlis inputs.

**Correctly named as not statable, by carrier:**

- the cotangent complex
- `LF`, `L∧ⁿ`, `LSymⁿ`, `LΓⁿ` on `D^(≤0)`
- edge maps and the five-term sequence
- the Koszul completion tower
- simplicial-algebra completion
- Čech descent
- compatible models and effectivity

**Statable but absent:** derived tensor and scalar-extension existence (R01).

### Adversarial pass

| Statement | Instances | Values computed on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| `nonempty_bicomplexSecondPageIso` (Lean:120) | general `(p,k)`; single column; transposed model | Page-2 object at `(−k−2p,p)` is `H_k(K.X p)`. The page-2 `d` has bidegree `(2,−1)`: `(−k−2p,p) → (−k−2(p−1),p−1)`, same `k`, column `p−1`. So page 3 is `H_p(t ↦ H_k(K.X t))`. Single column: `(−k,0) ↦ H_k(K.X 0)`. The transposed `H_k(H^I_p)` differs on the four-generator Check | True | none |
| `simplicialTensorComparison` (Lean:135) | `x ∈ X₁`, `y ∈ Y₁` | `d(s₁x⊗s₀y) = s₀d₀x⊗y − x⊗y + x⊗s₀d₁y`. `d(s₀x⊗s₁y) = x⊗s₀d₀y − x⊗y + s₀d₁x⊗y`. Their difference is `∇(dx⊗y − x⊗dy)`; the opposite sign gives its negative and fails. Degree 0 is the identity | True | none |
| `bisimplicialDiagonalComparison` (Lean:158) | constant `P` | Diagonal: `P` in degree 0. Total: `P` in degree 0, higher homology 0 (Satz 2.15, p.217) | True | none |
| `quasiIso_whiskering_of_projective` (Lean:175) | Neg. `Γ₀[ℤ --2→ ℤ] → ℤ/2` with `F(V)=V⊗V`; constant `F` | Neg.: source `H₁ = ℤ/2`, target `0`, so projectivity of `Y` is needed. Constant `F`: `R′` on both sides | True | none |
| `exteriorPower_decalage` (Lean:198) | `N=R`, `n=0,1,2`; Neg. `ℤ/2` over ℤ | For `n=2`, normalized `N₂ = R(s₀e∧s₁e)` and `N₃ = 0` (all three degree-3 wedges are degenerate), giving `R = Γ²R`. `n=0`: `R` in degree 0. `n=1`: `N` in degree 1. Neg.: `F₂` against `Γ²_ℤ(ℤ/2) = ℤ/4` | True | none |
| `symmetricPower_decalage` (Lean:216) | `N=R`, `n=2`; signed-coinvariant model | Normalized `N₂ = R(s₀e·s₁e)`. `d = d₀−d₁+d₂` sends it to `0 − e² + 0`, a unit, so the complex is acyclic, matching `∧²R = 0`. Signed coinvariants predict `ℤ/2` over ℤ, which is excluded | True | none |
| `derivedLimit_isTriangulated` (Lean:238) | constant `ℤ[0]`; levelwise-split neg. (README:1870) | The lift `(incl, 0)` meets only the cocone component on which the shift iso has no sign, so the shift iso is `id` on `ℤ[1]`. Neg.: a zero boundary would make `⊕k → ∏k` onto, but `(1,1,…)` is not in its image | True | none |
| `derivedCompleteness` (Lean:263) | `I=0`; `I=A`; model testing `n=0` only | `A[1/0] = 0`, so every `M` is complete. At `f=1`, `Hom(A[n],M) = H^(−n)M = 0` forces `M = 0`. The `n=0`-only model admits `ℤ[−1]` at `I=ℤ`; `n=−1` excludes it, since `Hom(ℤ[−1],ℤ[−1]) = ℤ` | True | none |
| `isDerivedCompleteGenerators`, `…Radical` (Lean:269, 278) | `s=∅`, `I=0`; `(p)` against `(p²)` | Both sides hold for `∅`. `ℤ_p` is complete for both ideals. `ℚ_p` is complete for neither: `ℤ[1/p] → ℚ_p` sends `1 ↦ 1`, and `ℤ[1/p²] = ℤ[1/p]` | True | none |
| `isDerivedCompleteCohomology` (Lean:285) | `ℤ_p ⊕ ℚ_p[1]` | Both sides fail, the right one at `j = −1`. The per-`f` equivalence holds since `pd A_f ≤ 1` (Tag 091P(4)) | True | none |
| `isDerivedComplete_triangle`, `derivedCompleteness_isRightAdjoint` (Lean:291, 300) | `ℤ_p --p→ ℤ_p → F_p`; `I=0`, `I=A` | `F_p` is complete. The left adjoint is the identity at `I=0` and the zero functor at `I=A` | True | none |
| `completeNakayama` (Lean:311) | `ℤ[1/p]`; `m ⊂ O_ℂp` | `ℤ[1/p] ⊗ F_p = 0`, but `hc` fails. For `m`: `fⁿm ⊇ fⁿ⁺¹O`, so `m` is `f`-adically complete and torsion-free, `m/m² = 0` and `m ≠ 0`. Only `hI` excludes it | True | none |
| `ordinaryQuotientCompletion` (Lean:328) | `F_p[0]` via `[ℤ --p→ ℤ]`; Neg. `ℤ_p ⋉ ℚ_p/ℤ_p` | `F_p[0]`: `H^(−1) = pⁿℤ/pⁿ⁺¹ ≅ F_p` with zero transitions, `H⁰ = F_p`, so `Rlim = F_p[0]`. Neg.: the ordinary tower gives `ℤ_p[0]`. The Koszul tower has `H^(−1) = T[pⁿ]` with `×p` onto, so `H^(−1)Λ = ℤ_p ≠ 0` | True | none |
| `…_of_boundedTorsion`, `…_of_isWeaklyRegular` (Lean:347, 369) | `ℤ[x_i]/(px_i)`; `f=0`; `[p,1]`; `[]` | `c = 1`. At `f=0`, `c = 1` gives the constant tower `= M`. `[p,1]`: `I = ℤ`, tower `0 = Λ`. `[]`: `I = 0` | True | none |
| `nonempty_ordinaryQuotientCompletionHomologyIso` (Lean:390) | `F_p[0]`; Neg. `ℚ_p/ℤ_p` over `ℤ_p` | `F_p[0]`: `(0, F_p)`, equal to the completions. Neg.: `H^(−1)(Rlim) = ℤ_p` against `0`, so `hfin` is needed | True | none |
| `IsCompletelyFlatModule` (Lean:407) | `ℤ`, `F_p`, `ℤ_p`; model "`M/IM` flat" | `ℤ` and `ℤ_p` pass. `F_p` fails with `Tor₁ = F_p ≠ 0`. The `M/IM`-only model would admit `F_p` | True | none |
| `cohomologicalAmplitude_of_completeTorAmplitude` (Lean:419) | `ℤ[1/p]` in degree 1; `ℤ_p ⋉ ℚ_p/ℤ_p` | `ℤ[1/p]`: `P⊗N = 0` but `H¹ ≠ 0`, excluded by `hc`. Unbounded torsion: `H^(−1)C = ℤ_p`, excluded by `hA` | True | none |
| `isAdicComplete_of_…`, `isCompletelyFlatModule_of_…` (Lean:438, 457) | `ℤ/4` and `ℤ/2` over `ℤ/4`, `p=2` | `ℤ/4 ⊗ A[2] ≅ ℤ/2 → 2ℤ/4` sends `1⊗2 ↦ 2`, bijective; `A[4] = A`. For `ℤ/2`, `M/4M` is not flat, so `hflat` fails at `n=2`, matching `Tor_n = ℤ/2` | True | none |
| `IsPerfect`, `IsPseudoCoherent`, `isPerfect_retract/shift/triangle/isPseudoCoherent` (Lean:474–515) | `eA ⊂ k×k`; cone of `ℤ --2→ ℤ` | `eA` is a retract of `A`. Its Euler ranks are `(1,0)`, so it has no bounded finite-free model. `⋯ --e→ A --(1−e)→ A --e→ A` is a bounded-above finite-free model. `[ℤ --2→ ℤ]` is perfect | True | none |
| `isPerfect_baseChange` (Lean:523) | `[ℤ --2→ ℤ] ⊗ F₂`; Neg. `ℤ/2` over `ℤ/4`; bi-infinite `ℤ/4` | `[F₂ --0→ F₂]` is perfect. Neg.: `H^(−i) = F₂` for all `i ≥ 0`, excluded by `hK`. The bi-infinite complex is excluded by the upper bound in `IsFiniteFreeModel` | True | none |
| `ringTowerLimit_jacobson` (Lean:538) | `k[t]/tⁿ⁺¹`; Neg. `A₀ = 0`; Neg. `ℤ ↪ ℚ` | `(1+t)⁻¹ = Σ(−t)ⁱ`. At `A₀ = 0`, `1 ∈ ker`, so `hnil` fails. For the tower `A₁ = ℤ ↪ A₀ = ℚ`: `π₀(2)` is a unit and `2` is not, so `hsurj` is used | True | none |
| `pseudoCoherent_residueCriterion` (Lean:551) | `[k[[t]] --t→ k[[t]]]`; `a > b` | The fibre is `[k --0→ k]`, so `a ≤ −1` is needed. If `a > b`, every fibre vanishes, `K = 0` and `E = 0` | True | none |
| `Matlis.biduality_of_finite/_artinian` (Lean:575, 588) | `ℤ_p` with `E = ℚ_p/ℤ_p`; Neg. `ℤ_(p)`; `R = ℚ` | `D(ℤ_p) = E` is Artinian, `D(E) = ℤ_p` is finite, and evaluation is an iso. Neg.: `End E = ℤ_p ≠ ℤ_(p)` (Tag 08Z6). For `ℚ`: finite dimensions | True | none |
| §0.1 Check (README:785) | constant `A[t] → A[t]/t²` | `H₀ = A[t] ≠ A[t]/t²` | True | none |
| §0.5 Checks (README:1300, 1320) | `ℤ/4 → F₂`, `ℤ/9 → F₃` | `Exal_ℤ(F₂,F₂) = Hom((2)/(4),F₂) = F₂`. The class has order 2, so the sum of two copies is 0 | True | none |
| §0.7 Check (README:1342) | `k[x,y]/(x,y)²` | `Rel` is free on `(y,−x,0)` and `(0,y,−x)`. `Rel/TrivRel` has `k`-dimension 3. The map to `B³` kills `y r₁`, so `H^(−2) ≅ k` | True | none |
| §§0.8–0.10 Checks (README:1410, 1455, 1476) | `ℤ→ℤ→ℤ/3`; `ℤ→ℤ/2`; `ℤ→F_p` | `H^(−1) = (3)/(9)`. `H₁ = (2)/(4)`. `Tor₁(F_p,F_p) = F_p`, and `0` against `F_p[1]` | True | none |
| §§0.11–0.12 Checks (README:1492, 1511) | `ℤ[X] → ℤ[X^±]`; `k[ε]/ε²` | `ℤ[X^±]dX`, with the relative complex `0`. `1 ↦ 2ε` with kernel `εB`; the kernel is `B` in characteristic 2 | True | none |
| §§0.14–0.17 Checks (README:1561–1684) | `Be`, `ℤe`, `F_p`, `Be ⊕ Bf` | Alternating `∧²` is `0`; signed coinvariants give `B/2`. `e·e = 2γ₂(e)` and `e^p = p!γ_p = 0`. The graded pieces are `0`, `B(e∧f)`, `0` | True | none |
| §§1.1–1.1.1 Checks (README:1892, 1917–1921) | `[ℤ → ℤ/pⁿ⁺¹]`; `ℤ/p`; `ℤ[1/p]` | `lim¹ pⁿ⁺¹ℤ = ℤ_p/ℤ = H¹[ℤ → ℤ_p]`. `Ext¹ = ℤ/p`. `Ext¹ = ℤ_p/ℤ` | True | none |
| §1.8 Check (README:2329) | `∏ℤ/pⁿ` over `ℤ_p` | Complete, amplitude in `[−1,0]`, torsion unbounded | True | none |
| R01: derived tensor and scalar extension (§§0.2, 1.E.0) | scratch insertion | Elaborates with 31 warnings; not closed by `infer_instance`, `simp`, `rfl` or `aesop` | statable | add (R01) |
| R03: Stacks 08Z9 | Stacks Chapter 47, p.11 | Complete Noetherian local ring, anti-equivalence between Artinian and Noetherian modules, `D∘D = id` | content right, key missing | add key (R03) |

## Not verifiable

- **NSW, Proposition 2.1.1 and Lemma 2.2.4** (README:965–967). The cached NSW entry holds only the authors' landing page (NSW lines 1–41). The StacksHom derivation at README:967–979 covers the same claims and checks.
- **IllusieCC** is uncertified in the manifest, which settles it. Its use at README:1440 matches GR line 10637.

## Source issues

- **Error** in SAG at Construction 25.2.2.2, p.1700, and Proposition 25.2.3.4(2), p.1703: the source says the n-th exterior power is the quotient of the tensor power by signed permutations, yet claims it is free of binomial rank; it should be the quotient by tensors with two equal factors, since signed coinvariants of ℤ in degree two give ℤ/2, not 0; affects a stated result.
