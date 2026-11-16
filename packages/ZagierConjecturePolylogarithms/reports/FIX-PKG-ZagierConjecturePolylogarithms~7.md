# Repair of ZagierConjecturePolylogarithms (package, round 7)

This round resolves the three findings of `REV-PKG-ZagierConjecturePolylogarithms~6`. All three are right.

- **F01.** I applied it with one correction. The reviewer's wording of the conditions at infinity is too weak if read literally.
- **F02.** I applied it in a more general form than the one suggested.
- **F03.** I applied it as asked.

Files changed:

- `packages/ZagierConjecturePolylogarithms/README.md`
- `packages/ZagierConjecturePolylogarithms/sources.toml` (the `G08` locator only; no new source)

`Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged. No supplier gap was added or changed.

## F01 (P2) — applied differently

**What changed.**

- **§3.6.** Old: "define good variations … with Griffiths transversality and the admissibility conditions at infinity of [G08] §5". New: a good Hodge–Tate variation is a variation of mixed Hodge structure (MixedHodgeModulesAndIrregularHodgeTheory §3.1) whose odd graded pieces vanish and whose `gr^W_{−2n}` is a sum of copies of the constant `ℚ(n)`, and which is admissible (§3.3 there).
- **Admissibility.** The new text says that condition (b) holds automatically and that admissibility reduces to (a). The locator is now [G08] §9, p. 87, G08 lines 3812–3820.
- **§3.6 API and Checks.** One API bullet was added: the good Hodge–Tate variations form an abelian tensor subcategory. One negative-control Check was added.
- ***Needs*.** §3.6 *Needs* now lists MixedHodgeModulesAndIrregularHodgeTheory §§3.1, 3.3.
- **Scope.** In the "owns" bullet of Layer 3, the HodgeStructures bullet and the MixedHodgeModulesAndIrregularHodgeTheory bullet, "§§3.2–3.3" became "§§3.1–3.3".
- **Supplier contracts.** "From Tau Ceti" now says that variations over a base are MixedHodgeModulesAndIrregularHodgeTheory §3.1. "From MixedHodgeModulesAndIrregularHodgeTheory" gains §3.1, and its §3.3 entry now covers smooth complex varieties and the stabilities.
- **Layer 3 Dependencies.** Now "MixedHodgeModulesAndIrregularHodgeTheory §§3.1–3.3 (§§3.6, 3.13)".

**Evidence.**

- **Ownership.** I read MixedHodgeModulesAndIrregularHodgeTheory at its open head with `roadmaps show`. It is earlier in the merge order (line 261, against 323 for this roadmap) and was already a supplier here.
  - Its §3.1 defines graded-polarizable variations of mixed Hodge structure on a complex manifold, with Griffiths transversality and fibres in `TauCeti.Hodge.MixedHodgeStructure`.
  - Its §3.3 defines admissibility on `Δ^*`, relative to a boundary, and on a smooth complex variety for any compactification. It also gives the stabilities.
  - Its scope bullet for Layer 3 claims both. This roadmap keeps only the Hodge–Tate subclass, the framings and the Lie coalgebra.
- **Locator.** G08 §5 is "Twistor connections and variations of mixed Hodge structures" (G08 line 39; text at G08 lines 2301–2760, pp. 53–63). It has no condition at infinity: a search for "admissib" finds nothing there. The conditions are at G08 lines 3812–3820, p. 87. [G08] §5 is still cited in §3.7 for the real period of variations, which is correct.
- **Why "differently".** Read literally, the suggested sentence ("the Hodge bundles extend to the canonical extension, and `N(W_l) ⊂ W_{l−2}`") is weaker than admissibility in §3.3.
  - Counterexample: on `𝔸¹`, take `W_{−2} = ℚe₁` and `F⁰ = O·(e₀ + x e₁)`. At `s = 1/x = 0` the saturation `O·(s e₀ + e₁)` is a holomorphic subbundle and `N = 0`, so both conditions hold as written.
  - But the limit `F⁰` gives `gr^W_{−2}` dimension 1 and `gr^W_0` dimension 0, where 0 and 1 are needed. So condition (a) of §3.3 fails.
  - This is the boundary Check of the supplier's §3.3 restricted to the line `y = 0`. The new text therefore requires the extension to induce the constant filtration on each `gr^W`. It says that G08 writes the first condition without this, and records the example as a Check.
- **(b) is automatic.** `N_P` acts by zero on the constant graded pieces, so `N_P W_l ⊂ W_{l−1}`. The odd pieces vanish, so `W_{l−1} = W_{l−2}` for even `l`. Hence `N_P W_l ⊂ W_{l−2}`, and `M = W` induces on `gr^W_l` the filtration concentrated in degree `l`.
- **The reviewer's instance.** The Kummer variation is admissible, matching the supplier's Check at its line 410.

## F02 (P2) — applied differently

**What changed.**

- **§3.13(4).** Old: "a smooth `F`-variety `X_F` with `X = X_F ⊗_F ℂ` and an `F`-point `x` of the admissible open". New: "a point `x` of the admissible open of a symbol at which all its arguments take values in `F`". The reviewer's case (arguments in `F(X_F)ˣ` at an `F`-point) is stated as covered.
- **Proof route.** One sentence proving (4) was added.
- **New Check.** It shows that `S₄(π)` over `Spec ℂ` is excluded and that `S₄(πt)` at `t = 2/π` is covered.
- **Same pattern in §5.1.** "At an algebraic point …" is now stated with the same hypothesis.

**Evidence.**

- **The witness is right.** `S₄(π)` over `Spec ℂ = Spec ℚ ⊗ ℂ` has admissible open `X`, and its point comes from a `ℚ`-point, but `π ∉ ℚ`.
- **Why the value form.** It is strictly more general and follows from §3.9. The variation of a symbol is pulled back from `Conf_n` along the points of its word. So its fibre at `x` depends only on the values of the arguments at `x`, and §3.9 identifies the fibre at an `F`-rational point of `Conf_n`.
- **Example the reviewer's form misses.** `S₄(πt)` on `𝔾_m` is not defined over `ℚ(t)`. At `t = 2/π` (admissible open `t ≠ 1/π`) its value is `2`, so its fibre is the realization of `Cor_∞(0,0,0,1,2)`.
- **Every use of (4) still holds:**
  - in the §3.13 route, the cross-ratios take rational values at rational configurations;
  - in the same route, `X = Spec ℂ` with values in `σ(F)`;
  - in §5.1, now made precise;
  - in §6.3, `S₄(t)` at `t = σⱼ(z) ∈ σⱼ(F)`.
- **Arguments of the evaluated symbol are in `Fˣ`.** On the admissible open, an argument that is not identically `0` differs pointwise from the point `0` of the word.

## F03 (P3) — applied

**What changed.**

- **§3.9.** Old: "form a good variation …, described by Goncharov's Green data in families ([G08] Theorems 1.12, 7.8–7.9, 9.1)". New: the rational variation is cited to [G08] §10.1 setting 5 (line 4016), §10.2 (line 4060), Theorem 10.3 (line 4176), and (235)–(236) with Definition 10.4 (line 4237). Then: "Its underlying real variation is described by … Green data …, and it is what the period maps of §3.7 read", with the three real theorems.
- **`sources.toml`.** The `G08` locator gains "§9, the conditions at infinity before Theorem 9.3, p. 87; §§10.1–10.4, Theorem 10.3 and Definition 10.4, pp. 92–97".

**Evidence.**

- G08 line 796 and line 3781 state both theorems for variations of mixed **R**-Hodge structures.
- G08 lines 4016–4019 are setting 5 (variations over a base, `K = ℚ`). Line 4063 refers setting v) to Hain–Zucker.
- Page markers: p. 92 starts at line 4006, p. 93 at 4045, p. 95 at 4120 and p. 97 at 4236. So every locator is on the stated page.
- **Pattern search.** The other citations of Theorems 1.12 and 9.1 support real statements, so they are correct as they stand. They are the period comparison in §3.9 (README line 515) and the period forms in §3.13 (line 570). GR Theorem 9.1 at lines 940 and 983 is a different source.

## Checks run

- **Elaboration.** `lake env lean` on the absolute path of `packages/ZagierConjecturePolylogarithms/Suggested.lean`, run from the content checkout: exit 0. There are two warnings, both `declaration uses sorry`, at 124:8 (`zagier_four_exists`) and 133:8 (`zagier_four_everyFamily`). The file is unchanged this round.
- **`#check @name`.** I checked all ten declarations in one scratch file, elaborated once.
  - `polylog : ℕ → ℂ → ℂ`
  - `singleValued : ℕ → ℂ → ℝ`
  - `unitVector`, `trilogCyclic`, `TrilogRelationFunction` and `IsCycle4` each carry `[Field F]`; `TrilogRelationFunction` also has `[AddCommGroup V] [Module ℚ V]`.
  - `periodMatrixFour` and `zagierDeterminantFour` each carry `[Field F] [NumberField F]`.
  - `zagier_four_exists` and `zagier_four_everyFamily` each carry `[NumberField F]`; the latter also has `∀ j, IsCycle4 (c j)`.

  No binder was lost, and each type matches README §6.4. Nothing changed.
- **Dependency check** (command as given in the brief):

  ```text
  depcheck: 245 roadmaps, 2240 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures.** None were listed in the brief.

## Adversarial pass (new and changed statements)

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §3.6 definition (good Hodge–Tate variation) | point; constant `ℚ(n)`; Kummer on `𝔾_m`; `F⁰ = O(e₀ + x e₁)` on `𝔸¹` | point: admissibility is vacuous, giving mixed Hodge–Tate structures as stated. `ℚ(n)`: `N = 0`, good. Kummer: Hodge line constant in the canonical frame at `0` and `∞`, good. `𝔸¹`: limit `F⁰` dimensions `(1, 0)` on `(gr_{−2}, gr_0)` against the required `(0, 1)`, not good | definition separates them; the `𝔸¹` case was added as a Check |
| (b) automatic | three-step weights `0, −2, −4`; Kummer | `N W_0 ⊂ W_{−1} = W_{−2}`, `N W_{−2} ⊂ W_{−3} = W_{−4}`; Kummer `N: gr_0 → gr_{−2}` onto | `M = W` in both; sound |
| literal Hain conditions (G08 lines 3815–3819) | same `𝔸¹` example | saturation at `s = 0` is `ℂe₁`, a subbundle; `N = 0` | weaker than §3.3(a); wording repaired |
| abelian tensor subcategory (API) | sub of `ℚ(n)^r`; `ℚ(a) ⊗ ℚ(b)`; dual | trivial monodromy restricts to subspaces; `ℚ(a+b)`; `ℚ(−n)`; odd pieces stay zero by `W`-strictness | sound; "extensions" left out (would need semisimplicity of the graded pieces) |
| `L^HT_1(𝔸¹)` against admissibility | `𝔸¹` example | class `x e₁ mod ℚe₁` is not constant; units of `𝔸¹` are `ℂˣ` with constant Kummer variations | admissibility is needed for `L^HT_1 = O(X)ˣ_ℚ`; recorded in the Check |
| §3.13(4) value form | `S₄(π)` on `Spec ℂ`; `S₄(πt)` at `t = 2/π`; `S₄(t)` at `t = 1`; `D₃₁(x,y)` with values `(3, 5)` | `π` in no number field, excluded; value `2 ∈ ℚ`, covered; `t = 1` not in the admissible open, excluded; `D₃₁(3,5)` over `ℚ` | sound; Check added |
| §3.13(4), argument nonvanishing | `x ∈ ℂ(X)ˣ` at a point of the admissible open | `0` is in the word and `x` is not identically `0`, so `x(pt) ≠ 0` | evaluated symbol is over `Fˣ` |
| §5.1 point value | `S₄(z)` at `z = i`, `F₀ = ℚ(i)` | `p = (2/5)L₄*(i) = (2/5)(5/16)L₄(i) = L₄(i)/8` (`log|i| = 0`) | agrees with the Layer 3 Examples |
| §3.9 locators | page markers | 4016 → p. 92; 4060 → p. 93; 4176 → p. 95; 4237 → p. 97; 796 → p. 19; 3399 → p. 77; 3781 → p. 86 | all correct |
| §3.6 locator | G08 §5 against §9 | §5: lines 2301–2760, no condition at infinity; §9: lines 3812–3820, p. 87 | moved |

## Ownership and overlap

- **Variations and admissibility.** Variations of mixed Hodge structure and admissibility have one owner, MixedHodgeModulesAndIrregularHodgeTheory §§3.1, 3.3, and are now cited. This roadmap owns the Hodge–Tate subclass, the framings, `L^HT_•`, the periods and the correlators. No other roadmap among those searched states framed Hodge–Tate variations: by object, I checked the closest list in `overlaps.md` and MixedHodgeModulesAndIrregularHodgeTheory.
- **Overlaps ledger.** It lists no other pull request changing this roadmap and no dropped id. This round drops no section, layer or target.
- **No new Lean name.** No declaration of `Suggested.lean` changed, and no fully qualified name of another roadmap is reused.

## For the maintainer

- **New supplier sections.** This roadmap now consumes MixedHodgeModulesAndIrregularHodgeTheory §3.1 as well as §§3.2–3.3. That roadmap is still an open pull request, earlier in the merge order. The depcheck shows no direction problem.
- **Names unchanged.** No name that other roadmaps cite changed, and no section was renumbered.
- **Possible source-issue note.** G08's statement of the first good-unipotent condition (G08 lines 3815–3816) omits the compatibility with `W`. Without it the condition is automatic for algebraic Hodge bundles on a curve. The README says so in §3.6; a future review may want to record it as a source issue.
- **No suspicious instructions.** None were found in the review text.
