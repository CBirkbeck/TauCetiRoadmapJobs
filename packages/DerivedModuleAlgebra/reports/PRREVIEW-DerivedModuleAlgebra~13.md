# Review of DerivedModuleAlgebra (pull request #1701 at b25f679)

**Verdict:** needs changes

This is an incremental re-review of the 124 lines of `TauCetiRoadmap/DerivedModuleAlgebra/README.md` that changed since `8b3bc25` (70 insertions, 54 deletions). `Suggested.lean` and the other folder files are unchanged, and nothing outside the folder changed. "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`, both at this head.

There are two findings, both P3, both carried over unrepaired from the previous review: its R03 (a backtick in the cited-name table) and its R04 (the pull-request description). Its R01 (the §0.4 locator) and R02 (missing References entries) are repaired, and the repairs introduce no new problem. Every changed locator was read against its source, except the NSW page numbers (see `## Not verifiable`). The gate passes, the dependency check is clean, and the Lean file elaborates with only `sorry` warnings.

## R01 (P3) — Row 75 of the cited-name table still leaves `isPerfect_baseChange` outside a code span

This is the previous review's R03 (and R01 before that), not repaired: the diff does not touch README:75.

**Location.** README:75: “| `PerfectComplex.IsPerfect`, isPerfect_baseChange | §1.E.0: `DerivedDeRham.IsPerfect` and its derived scalar change |”.

**Claim.** The left column lists the Lean names that other roadmaps cite.

**Witness.** Every other name in rows 43–76 is in backticks. `roadmaps grep 'isPerfect_baseChange'` finds the name cited as a Lean name by ArithmeticLocallySymmetricSpaces at its open head.

**Repair.** Write `` `isPerfect_baseChange` `` in backticks.

**Test.** The gate already accepts backticked names in this table that the Lean file does not declare: `derivedLimit_surjective` (README:65) and `ringCompletionUnit` (README:71). On this head `readme-ids-missing=0`, so adding the backticks does not trip the gate.

## R02 (P3) — The pull-request description does not match the change

This is the previous review's R04, not repaired. The repair is an edit of the description on GitHub, not of the folder.

**Location.** The description (data) still says:
- “README only; `Suggested.lean` is unchanged”;
- “Polynomial laws with Roby representability (`PD.robyRepresentability`)”;
- “Thirteen roadmaps consume it”.

**Witness.**
- `git diff --numstat origin/main...HEAD` gives `343 1227` for `Suggested.lean`.
- `robyRepresentability` occurs nowhere in the folder.
- README:2610–2615 lists eighteen consumers.

**Repair.**
- State that the head replaces main's `Suggested.lean` with 22 headline theorems and the definitions they need.
- Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv` (README:114, 267).
- Replace “Thirteen” with “Eighteen”.

**Test.** Re-read the description against `git diff --stat origin/main...HEAD` and README:2608–2620.

## Previous findings

- R01 — repaired: README:1204–1205 now reads “where `a_P : P• → P′•` is the induced map of standard resolutions ([StacksCt] §6, Tag 08QL, p.11)”, and README:1232 reads “[StacksCt], §6, Tag 08QL, pp.11–12”. Lemma 3.4 now appears only at README:1468, where it is cited for filtered colimits.
- R02 — repaired: References now has **Chenevier** (README:2636), **Nekovar** (2647), **NSW** (2648), **Roby** (2652) and **StacksDPA** (2658), each with a link definition. No inline source URL remains.
- R03 — not repaired: README:75 still reads “| `PerfectComplex.IsPerfect`, isPerfect_baseChange | §1.E.0: …” (now R01).
- R04 — not repaired: the description still says “README only; `Suggested.lean` is unchanged”, still cites `PD.robyRepresentability` and still says “Thirteen roadmaps consume it” (now R02).

## Verified sound

### Gate, dependency check, worktree

- **Worktree.** At `b25f679b`, clean. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty. `git diff --stat 8b3bc25 HEAD` touches only the README.
- **Gate (my run).** Every counter is 0, then `OK`, exit 0. The worker's record for this head has `build=0` as well.
- **Dependency check.** Output:

```text
depcheck: 239 roadmaps, 2368 edges, 0 problem(s)
```

- **Suppliers.** The diff adds no `*Needs:*` edge and no roadmap supplier. The only roadmap supplier is still AlgebraicTopology Stage 6, item 0, which is on main.
- **Gaps.** None declared, none needed.

### Elaboration and signatures

- **Elaboration.** `lake env lean` on the Lean file gives exactly 22 “declaration uses `sorry`” warnings, at lines 105, 120, 143, 160, 183, 201, 223, 254, 263, 270, 276, 285, 304, 323, 360, 366, 372, 379, 392, 405, 429 and 442, and nothing else.
- **Signatures.** The Lean file has 0 changed lines since `8b3bc25`. The worker's `signatures.md` lists 32 declarations with 0 dropped binders. The previous review's `#check @name` pass (33 declarations, including the local instance) and its one-tactic probe (no theorem closes with `first | rfl | (simp; done) | infer_instance | exact?`) therefore still apply.
- **No new Lean names.** The diff adds no backticked name of this roadmap's own.

### The repairs and the changed locators, read against the sources

Each changed locator was opened at the cited place in the cached text.

**§0.4 arrow functoriality (R01).**
- StacksCt line 455 (p.11): §6 begins with Tag 08QL.
- StacksCt lines 465–473 (p.11): the square gives a map `P• → P′•` of standard resolutions, built from `A → A′` and `B → B′`, and from it `Ω_(P_n/A) → Ω_(P′_n/A′)`.
- StacksCt lines 474–506 (pp.11–12): the second description of the same map. So “p.11” in the law bullet and “pp.11–12” at README:1232 are both accurate.
- StacksCt line 206 (p.5): Lemma 4.5, Tag 08QF. Lines 224 and 228 (p.6): Lemmas 4.6 and 4.7, Tags 08QG and 08QH. So “pp.5–6, the values in degree zero and for polynomial algebras” is correct.
- §0.10 (README:1448) cites the same §6 locator, so the two sections now agree.

**§0.DP.1–§0.DP.2, Chenevier.**
- Chenevier line 5: arXiv v2 is dated 18 Jul 2013, as the new References entry says.
- Chenevier lines 269–274 (p.7): homogeneity, and Example 1.2(i), which identifies degree-one laws with `Hom_A(M,N)`. Narrowing README:165 from “pp.6–7” to “p.7” is correct, since p.6 is introduction.
- Chenevier lines 303–318 (p.8): `Γ^n_A(M)` and multiplicative laws, with degree one giving algebra maps (README:186, 208).
- Chenevier line 333 (p.8): footnote 13 (README:325).

**Roby.**
- Roby lines 7–8: Ann. ÉNS (3) 80 (1963), 213–348, as the new References entry says.
- The pages are unchanged by the diff and still match: Chapter III §1 starts on printed p.248 (line 1312); Theorem III.3 is on p.262 (line 1823); Chapter IV starts on p.265 and Theorem IV.1 is on p.266 (lines 1924, 1970); Theorem IV.2 and Proposition IV.5 are on p.272 (lines 2222, 2226); Proposition IV.9 is on p.285 (line 2676).

**StacksDPA (new key at README:396–626).**
- StacksDPA lines 408–421 (p.9): §5, Tag 07H4. The direct-sum description of `A⟨x₁,…,x_t⟩`, the augmentation, and its kernel `A⟨x⟩₊`.
- StacksDPA lines 422–437 (p.9): Lemma 5.1, Tag 07H5. Its proof gives the generators `x, x^[2], …` of `A⟨x⟩₊` and the equality `IA⟨x⟩ ∩ A⟨x⟩₊ = IA⟨x⟩·A⟨x⟩₊`, which are the free-module facts the README attributes to it.
- The proof of the universal property continues on p.10 (line 448), but no README claim uses that part.

**StacksMA Koszul tags (README:651, 674).**
- 0622 and 0623 are Definitions 29.1–29.2 (lines 3199, 3214). 0624 is Lemma 29.3, functoriality along `ψ` with `φ′∘ψ = φ` (line 3222).
- 0626 and 0628 are Lemmas 29.5 and 29.7. 0664 is Lemma 29.12, `K(f,g) = Tot(K(f) ⊗ K(g))` (line 3368).
- 062F is Lemma 31.2, regular implies Koszul-regular (line 3571).

**StacksSites.**
- Tag 08J7 opens §35 on p.82 (line 3669), with the adjunction (35.0.1) at line 3672 (README:1891).
- Remark 39.11, Tag 08QD, begins on p.96 (line 4324). Its Eilenberg–Zilber sentence for flat simplicial modules is on p.97 (lines 4334–4339). README:1035 gives the start page.
- The References entry now names the whole of Chapter 21 and links its PDF, which both locators use.

**StacksMA Lemma 15.99.3 (README:2452).**
- Tag 0CQG, p.288, line 13310.
- Its hypotheses (1)–(3), with the “all `K_n` perfect” branch of (2), and its conclusion are exactly §1.E.1's statement.

**Nekovář.**
- Astérisque 310 (2006), Nekovar line 8.
- §2.2 is on printed p.51 (line 2218) and §2.3 on pp.52–53 (lines 2226–2259). §3.1 is on p.75 (line 3080), with §3.2 (admissible `R[G]`-modules, the equivariant form) running onto p.76.

**NSW.** The new References entry (Grundlehren 323, electronic version 2.3, May 2020) matches the authors' page (NSW lines 18–28). The page numbers are under `## Not verifiable`.

**References consistency.**
- Every key used in the README (23 of them) has a bullet and a link definition.
- `sed -n '/^## References/,$p' README.md | grep -c -i -E 'Roby|Chenevier|Neukirch|Nekov'` returns 7. It returned 0 at `8b3bc25`.
- The References preamble (README:2624–2627) says chapter PDFs use chapter-local pages. The new Stacks locators follow this: DPA p.9, Sites pp.82 and 96, More on Algebra p.288.

### Seeded sample, where it falls in the changed passages

- **§0.4** (the full cotangent complex): the repaired locators above.
- **§1.1.1** (unbounded module derived Hom), at README:1890–1891:
  - StacksMA §15.75, Tag 0A5W (line 8707, p.189);
  - (75.0.1) and (75.0.2), Tags 0A63 and 0A64 (lines 8711 and 8720);
  - Lemma 75.1, Tag 0A65 (line 8723);
  - StacksSites Tag 08J7 (p.82).
- The rest of the sample (§§0.2, 0.2.1, 0.7, 0.9, 0.10, 0.13, 0.14, 0.16, 0.25, 1.2, 1.6, 1.8, 1.9) lies in untouched text. The previous review read it against its sources and passed it.

### Cross-roadmap citations, ownership and overlaps

- **Diff.** It adds no cross-roadmap citation. `citations.md` still has 0 unresolved cross-roadmap citations and the same 92 Lean-name leads that the previous review resolved.
- **Overlaps (`overlaps.md`).**
  - No other open pull request changes this roadmap.
  - No id this README cites is dropped.
  - No cited id is defined only by an open revision.
  - The dropped §1.T.1 ids are still mapped to the Tau Ceti tower declarations at README:34–36, a passage the diff does not touch.
- **Ownership.** Unchanged by the diff.

### Adversarial table

The first five rows are for the statements and locator groups the diff changes, with values computed this round. The rest are carried from the previous review (PRREVIEW-DerivedModuleAlgebra~12, marked “r12”) for statements the diff leaves untouched. Their README line numbers are given at this head.

| Statement | Instances | Values on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| §0.4 functoriality law, changed (README:1201–1206) | `ℤ → ℤ[x]` over `ℤ → ℤ`, `b(x) = 0`; `ℤ → ℤ/2` over `id_(ℤ/2)`; `ℤ → ℤ[x]` over `F₂ → F₂[x]`; composite squares | `L ⊗ B′ = ℤ·dx → L_(ℤ/ℤ) = 0`; on `P₀ = ℤ[ℤ[x]] → ℤ[ℤ]`, `[x] ↦ [0]`, so `t ⊗ d[x] ↦ b(t) ⊗ d[0]`: zero in `H⁰`. Second square: `ℤ/2[1] → 0`, not an iso; `Tor₁^ℤ(ℤ/2,ℤ/2) ≠ 0`, so StacksCt Lemma 6.2 does not apply and the README claims only a map. Flat square: `d[x] ↦ d[x] ≠ 0` in `F₂[x]dx`, which excludes the zero map. Composite: `[f] ↦ [b(f)] ↦ [b′b(f)]`, the composite square's map. Well-defined: `ε′∘a_P = b∘ε` gives `t ⊗ p·dx ↦ b(tε(p)) ⊗ d(a_P x)` | True | none |
| §0.DP.1 homogeneity, locator narrowed (README:160–168) | zero law; `f + g`; `g ∘ f`; `x ↦ x + x²` on `A → A` | `0(sx) = 0 = sⁿ·0`; `(f+g)(sx) = sⁿ(f+g)(x)`; `g(f(sx)) = g(s^m f(x)) = s^(mn) g(f(x))`. `x + x²` at `s = 2`: `2x + 4x²` vs `2(x + x²)` or `4(x + x²)`, not homogeneous. Degree one is linear by Chenevier Example 1.2(i), p.7 | True | none |
| §0.DP.3 free-module facts, new StacksDPA key (README:396–626) | `ℤ⟨x⟩` with `I = (2)`; `F₂⟨x⟩` | `ε(x^[n]) = 0` for `n > 0`, `ε(1) = 1`. `IA⟨x⟩ ∩ A⟨x⟩₊ = ⊕_(n>0) 2ℤ·x^[n] = IA⟨x⟩·A⟨x⟩₊`. Over `F₂`: `x·Σc_n x^[n] = Σc_n(n+1)x^[n+1]` lies in the span of the odd `x^[k]`, so `x^[2] ∉ (x)` and `x` alone does not generate the kernel | True | none |
| §0.K.1 Koszul, re-keyed to StacksMA (README:644–652, 668–676) | `x = (2)` and `(0)` over `ℤ`; `K(2,2) = K(2) ⊗ K(2)` | `[ℤ →2 ℤ]`: `H₀ = ℤ/2`, `H₁ = 0`. `(0)`: `H₁ = ℤ ≠ 0`, so regularity is needed. Tensor sign: `e₁ ⊗ e₂ ↦ 2(1⊗e₂) − 2(e₁⊗1)`, Stacks' `d(e₁∧e₂) = f₁e₂ − f₂e₁` | True | none |
| §1.E.1 effectivity, re-keyed (README:2442–2452) | `A_n = k[t]/t^(n+1)`, `M_n = A_n`; `M_n = k` with identity maps | `Rlim A_n = k[[t]]`, perfect, `⊗^L A_n = A_n`. For `M_n = k`: `k ⊗^L_(A_(n+1)) A_n` has `Tor_i = k` for all `i`, so the derived hypothesis fails although `k ⊗ A_n = k`. Also `k ⊗^L_(k[[t]]) A_n = [A_n →t A_n]` has `H⁻¹ ≅ k`, so the conclusion fails: derived compatibility is needed, as README:2450 says | True | none |
| §0.1 resolution (README:744–784) | constant `A[t]` over `A[t]/(t²)` | `H₀ = A[t]` vs `B`, kernel `(t²)`; `P₀ → B` onto (r12) | True | none |
| §0.2 K-flatness (README:788–848) | `ℤ/4` with `×2`; `F_p ⊗^L F_p` | acyclic, not K-flat: `⊗F₂` has `H = F₂` in every degree; `H⁰ = H⁻¹ = F_p` (r12) | True | none |
| §0.3 / `quasiIso_whiskering_of_projective` (Lean:160) | `Γ₀[ℤ →2 ℤ] → ℤ/2` under `(−)^⊗2`; `W**` on `⊕_ℕ F₂` | `Tor₁ = ℤ/2` vs `0`, so projectivity is needed; `V → V**` not onto (r12) | True | none |
| §0.4 Checks (README:1212–1224) | `k[ε]/ε²`, char ≠ 2 and char 2; `ℤ → ℤ/2` | `H⁻¹ = εB ≅ k`; char 2: `H⁻¹ = H⁰ = B`; `H⁰ = 0`, `H⁻¹ = ℤ/2` (r12) | True | none |
| §0.5 Baer sum (README:1286–1304) | `Exal_ℤ(F₂,F₂)`; `ℚ[X] ⊕ εℚ[X]` | `F₂`; the `ℤ/4` class has order 2; the automorphism moves `X` (r12) | True | none |
| §0.7 (README:1308–1325) | `k[x,y]/(x,y)²` | `Rel/TrivRel` basis `s₁, s₂, ys₁`; `H⁻² = k` (r12) | True | none |
| §0.6 (README:1329–1369) | `ℤ → ℤ/p`; `ℤ/9 → F₃` | `Hom(F_p[1],F_p) = 0`; `1 ↦ 3` gives `1`, `1 ↦ 6` gives `2` (r12) | True | none |
| §0.8 (README:1373–1407) | `ℤ → ℤ → ℤ/3`; `A = B` | nonzero on `H⁻¹`; source `0` (r12) | True | none |
| §0.11 (README:1463–1476) | `ℤ[X] → ℤ[X^±]`; `∪A[X₁…X_n]` | relative `L = 0`; `Ω` finitely supported (r12) | True | none |
| §0.17 / décalage (Lean:183, 201) | `N = R`, `n = 0,1,2`; `N = ℤ/2` | `∧²` gives `R` in degree 2; `H₂ = F₂ ≠ ℤ/4`, so flatness is needed (r12) | True | none |
| §1.1.1 Check (README:1902) | `RHom(ℤ[1/p], ℤ)` | `H⁰ = 0`, `H¹ = ℤ_p/ℤ` (r12) | True | none |
| §1.2 laws (Lean:248–280) | `I = A`; `I = 0`; `ℤ[−1]` at `I = ℤ` | all `Hᵏ = 0`; all complete; `n = −1` detects (r12) | True | none |
| §1.3 reflector (Lean:285) | `ℤ`, `ℤ[1/p]`, `ℤ/p^m` | `ℤ_p`, `0`, fixed; a cokernel would fail (r12) | True | none |
| §1.4 Koszul tower (README:2015–2029) | `K(p^(n+1)) → K(p^n)`; `(0)` | `(×p, id)`; `Rlim(M ⊕ M[1]) = M` (r12) | True | none |
| §1.5 non-Noetherian Check (README:2056–2071) | `ℤ_p ⋉ ℚ_p/ℤ_p` | nonsplit in `D(A)`, since `Ext¹_A(A,ℤ_p) = 0` (r12) | True | none |
| §1.9 descent (README:2256–2272) | `ℤ_p → F_p`; `ℤ_p → ℤ_p²` | `H⁻¹ = F_p ≠ 0`; section exists (r12) | True | none |
| `nonempty_bicomplexSecondPageIso` (Lean:105) | pages 2 and 3 | `(−k−2p, p)` is `H_k(K.X p)`; page 3 `H_p(H_k)` (r12) | True | none |
| §S.1 Check (README:995–1000) | four generators | `det 1`; `d₂[a] = [−e]`; `E₃ = 0` (r12) | True | none |
| `simplicialTensorComparison` (Lean:120) | `x, y ∈ X₁, Y₁` | the `TensorSigns` sign at `p = 1`; the opposite sign fails (r12) | True | none |
| `bisimplicialDiagonalComparison` (Lean:143) | constant `P` | `P` in degree 0 on both sides (r12) | True | none |
| `derivedLimit_isTriangulated` (Lean:223) | `A_n = ⊕_(m≥n)k` | `lim¹ = ∏k/⊕k`; the zero-map triangle is not distinguished (r12) | True | none |
| `IsCompletelyFlatModule` (Lean:293) | `I = 0`; `I = A`; `F_p` | flatness; every `M`; `Tor₁ ≠ 0` (r12) | Discriminating | none |
| `isAdicComplete_of_isCompletelyFlatModule` (Lean:304) | `ℤ/4`, `p = 2`; `ℚ` | iso `1⊗2 ↦ 2`; forces `M = 0` (r12) | True | none |
| `isCompletelyFlatModule_of_isAdicComplete` (Lean:323) | `ℤ/4`, `M = ℤ/2` | `n = 2` hypothesis needed, `Tor₁ = ℤ/2` (r12) | True | none |
| `IsPerfect` and closure (Lean:346–381); row 75 | `eA ⊂ k×k`; `[ℤ →2 ℤ]` | Euler ranks `(1,0)`; `H⁻¹` kept after `⊗F₂` (r12) | True; R01 is style | R01 |
| `ringTowerLimit_jacobson` (Lean:392) | `k[t]/(t^(n+1))`; `A₀ = 0`; `ℚ`/`ℤ` | inverse `Σ(−t)^m`; `hnil` and `hsurj` needed (r12) | True | none |
| `pseudoCoherent_residueCriterion` (Lean:405) | `[k[[t]] →t k[[t]]]`; `k` over `k[ε]` | interval `[−1,0]`; no interval for `k` (r12) | True | none |
| `biduality_of_finite` / `_of_artinian` (Lean:429, 442) | `ℚ`; `ℤ_p`; `ℤ_(p)` | `End(ℚ_p/ℤ_p) = ℤ_p ≠ ℤ_(p)`, so completeness is needed (r12) | True | none |
| §1.M.1 Check (README:2549) | `⊕_ℕ k` | `D(M) = ∏k`; evaluation not onto (r12) | True | none |
| §1.E.1 Checks (README:2472–2479) | `[A_n →t A_n]`; `k[x₁,…]/(x_i²)` | `H⁻¹ ↦ 0`; nil but not nilpotent (r12) | True | none |
| §1.1 cofinal and square Checks (README:1865–1871) | drop `r` levels; `h_n = x₀` | `id` mod `ℤ`; `Σ9^m = −1/8 ∉ ℤ` (r12) | True | none |
| §0.25 Checks (README:1705–1745) | `k[x]/(x³) → k[x]/(x²) → k`; `ℤ/4` | connecting map onto `k`; not flat (r12) | True | none |
| §0.DP.3 `F₂` Checks (README:453, 637) | `Γ_(F₂)(F₂)` | `dp(2,1)` not in the degree-one ideal (r12) | True | none |
| Convention README:96 (`k` a field) | Checks README:1702, 2329, 2428 | `k = 0` collapses each Check (r12) | Consistent | none |

## Not verifiable

- **NSW page numbers (§S.1, README:960–962).** The locators are “Proposition 2.1.1, printed p. 99 (PDF p. 116)” and “Lemma 2.2.4, printed p. 105 (PDF p. 122)”.
  - The sources service resolves the PDF URL in the link definition to the authors' landing page. It did so with the package manifest's entry and again with an empty scratch manifest, and the cache holds only that one-page HTML text (NSW lines 1–41). The PDF text was therefore not read.
  - The two locators have the same printed-to-PDF offset of 17. The diff only merged two duplicate link texts into one `[NSW]` citation and left the numbers as earlier rounds passed them.
  - NSW is outside the seeded sample.
- **IllusieCC, Chapter II, 1.2.6.2 (§0.9).** Untouched. There is no open copy of LNM 239.
- **Sources manifest.** Not edited. The NSW fetch attempts went into scratch copies of the manifest.

## Source issues

- none
