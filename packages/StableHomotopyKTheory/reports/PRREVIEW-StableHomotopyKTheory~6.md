# Review of StableHomotopyKTheory (pull request #1227 at f645066)

**Verdict:** needs changes

Incremental re-review of 9 changed README lines since 5f92355 (the HomotopyTheoryOfCategories ownership paragraph and consumer row, and the Summary/ownership wording "for classifying spaces" / "for realised nerves"). `Suggested.lean` is unchanged since 5f92355. Two findings: the worker's gate fails on one statement-hygiene hit (P3), and a supplier citation of DerivedModuleAlgebra §1.T.1 is dropped at the head of that roadmap's open revision (P2, a new fact since the previous review). The changed passages themselves are correct.

## R01 (P2) — DerivedModuleAlgebra §1.T.1 no longer exists at the head of its open revision

**Location.** `TauCetiRoadmap/StableHomotopyKTheory/README.md:86`–88 (`### From DerivedModuleAlgebra on main`: "DerivedModuleAlgebra §1.T.1 supplies countable tower algebra … `CompactCoefficients.Tower`: `ModuleTower.shift`, `ModuleTower.lim`, `ModuleTower.limOne` … `Tower.toModuleFunctor`, `Tower.limComparison` and `Tower.limOneComparison`"), and the inline citations of §1.T.1 at lines 1215, 1230, 1615, 1625, 1925, 2459, 2473, 2477 and 2487.

**Claim.** The README consumes the tower algebra (lim, lim¹, six-term sequence, Mittag–Leffler vanishing, Milnor maps, the ×p lim¹ comparison) as DerivedModuleAlgebra §1.T.1 with the names `CompactCoefficients.Tower`, `Tower.toModuleFunctor`, `Tower.limComparison`, `Tower.limOneComparison`, and links the anchor `#1t1-towers-lim-and-lim¹`.

**Witness.** On main, `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1403` is `### 1.T.1 Towers, lim and lim¹`. At the head of the open revision of DerivedModuleAlgebra (commit of 2026-11-08 "consume pinned Tau Ceti towers"), no `### 1.T.1` heading exists; its scope paragraph says that citations of §1.T.1 and its five targets resolve to the Tau Ceti tower declarations, and its name table maps `CompactCoefficients.Tower`, `CompactCoefficients.Tower.toModuleFunctor`, `.limComparison`, `.limOneComparison` to `TauCeti.ModuleTower` over ℤ with `TauCeti.ModuleTower.lim` and `.limOne`, and `limOne_mul_p`/`mulTower` to its §1.1 Check. When that revision merges, every §1.T.1 citation here and the anchor break, and the four `CompactCoefficients`/`Tower.*` names cited here resolve nowhere (the roadmaps resolver already lists `Tower.toModuleFunctor`, `Tower.limComparison`, `Tower.limOneComparison` as found in no pinned source). The previous review (2026-11-01) predates the drop, so this is not a passed defect.

**Repair.** The content is at the pinned Tau Ceti (2fd255d9), so cite it directly and pin-robustly. Replace the `From DerivedModuleAlgebra on main` contract by a `From Tau Ceti` contract naming, in `TauCeti/Algebra/Category/ModuleCat/Tower/`: `TauCeti.ModuleTower` (`Basic.lean:78`, `ℕᵒᵖ ⥤ ModuleCat R`), `TauCeti.ModuleTower.Product` (`Basic.lean:89`), `.shift` (`Basic.lean:160`), `.lim` (`Basic.lean:170`), `.limOne` (`Basic.lean:174`), `.productMap`/`.limMap`/`.limOneMap` (`Basic.lean:393`, 462, 516), `.connecting` and `.exact_limOneMap` (`Exact.lean:191`, 136), `.IsMittagLeffler` and `.subsingleton_limOne_of_isMittagLeffler` (`MittagLeffler.lean:70`, 191), `.limSubsequenceEquiv` (`Subsequence.lean:86`) and `.derivedLimit` (`DerivedLimit.lean:310`), all over ℤ for the integral case; keep a DerivedModuleAlgebra citation only for what that roadmap still owns at both main and its head, namely §1.1 (the derived-limit exactness, the Milnor maps and the ×p Check with lim = 0 and lim¹ ≅ ℤ_p/ℤ). Rewrite the nine inline "§1.T.1" citations to the Tau Ceti names (for lim¹ = coker δ with δ(x)ᵢ = xᵢ − rᵢxᵢ₊₁, which is `TauCeti.ModuleTower.shift`'s convention) or to §1.1, and delete the anchor link. Tested on the refuting instance: the ×2 tower on ℤ has lim = 0 and lim¹ = ℤ₂/ℤ under `TauCeti.ModuleTower.limOne`, under main's §1.T.1 and under the open revision's §1.1 Check, so no statement of §§3.18, 4.11, 7.9–7.11 changes.

## R02 (P3) — gate: `IsPlusConstruction.piTwoEquiv` concludes `Nonempty (_ ≃+ _)`

**Location.** `TauCetiRoadmap/StableHomotopyKTheory/Suggested.lean:192`–200 ("theorem IsPlusConstruction.piTwoEquiv … : Nonempty (Additive (HomotopyGroup (Fin 2) Y (f x)) ≃+ groupHomology (Rep.trivial (ULift.{u} ℤ) P (ULift.{u} ℤ)) 2)"), named at `README.md:1340`.

**Claim.** π₂ of a plus construction at a perfect normal P, for an aspherical source of CW type, is isomorphic to H₂(P; ℤ) (§3.29).

**Witness.** The worker's gate at f645066 and my rerun both return `statement-hygiene=1 … FAIL` with this hit: a theorem concluding `Nonempty (A ≃+ B)` is refused unless named `nonempty_*`/`exists_*`. The Lean file is unchanged since the acceptance at 5f92355; the scanner is new. The mathematics is unchanged (row 3.29 below: π₂(BA₅⁺) = H₂(A₅) = C₂, π₂(BC₃⁺₁) = 0).

**Repair.** The canonical map (the boundary π₂(Y) → π₁ of the plus fibre followed by the kernel identification of the universal central extension) has no carrier at the pins beyond the fibre of `fiber_universalCentralExtension`, so stating it with `IsIso` would need new sorry'd data, which the file may not contain. Rename the theorem `IsPlusConstruction.nonempty_piTwoEquiv` (the form the rule allows for an existence statement), update the backticked name at `README.md:1340`, and leave the naturality of the isomorphism where it is, as the README targets of §§3.29–3.30. Tested: the renamed statement elaborates identically (the name is the only change) and the gate's scanner accepts the `nonempty_` prefix by its rule text.

## Previous findings

- The previous report (5f92355) was an acceptance with no findings; R01–R03 of the report before it were recorded there as repaired, and the passages they concern (§§5.3, 5.7–5.8, 7.29–7.30, 7.32, the CW-type adapter) are untouched at this head.

## Verified sound

**Scope of this round.** Only `README.md` changed, by 9 lines: the Summary ("Theorems A and B for classifying spaces"), the ownership sentence ("Quillen A/B for realised nerves"), a new paragraph at `README.md:21` on HomotopyTheoryOfCategories, the consumer sentence at line 2833 and a new consumer-table row at line 2843. I read the paragraph against the HomotopyTheoryOfCategories roadmap at the head of its open pull request (765f978, another author's new roadmap, not yet in the merge order) and against the sections of this README it cites (§§1.10–1.12, 1.21, 2.1, 2.26, 2.29–2.31, 2.34) and the Lean statements it names.

**Gate and elaboration.** The worker's gate and my rerun agree: every scanner count is zero except `statement-hygiene=1` (R02); `outside-folder=0`, `depcheck=0`, `build=0`. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty (the long file list in the change summary is the merge of main into the branch at 4e2bdd04, not pull-request changes). Direct `lake env lean` on `TauCetiRoadmap/StableHomotopyKTheory/Suggested.lean` exited 0 with exactly 11 `declaration uses 'sorry'` warnings and nothing else. The pins moved with that merge, to Mathlib 1b1ccf4b and Tau Ceti 2fd255d9; the unchanged file elaborates at the new pins. The worker's elaborated signatures of all 24 declarations match the README statements; the four "looks dropped" leads are the `[Category.{v} C]`/`[Category.{v} D]` instances of the three Quillen theorems, which the elaborated types carry as `inst`/`inst_1`, and `continuousFunctions_projective_free`, whose type mentions no category, so nothing is dropped.

The dependency command returned:

```text
depcheck: 237 roadmaps, 2288 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The README cites HomotopyTheoryOfCategories only at lines 21, 2833 and 2843, as a consumer; no `*Needs:*` line or supplier contract names it. No supplier gap is declared.

**The HomotopyTheoryOfCategories paragraph, checked at that roadmap's head.**

| Claim at `README.md:21`, 2843 | Where it is checked | Finding |
| --- | --- | --- |
| That roadmap owns Theorem A for an arbitrary basic localizer and the localizer consequences of natural transformations, adjoints and initial objects (its §§2.3–2.4) | HomotopyTheoryOfCategories `README.md` §2.3 (membership in `W` for functors with a natural transformation to a `W`-functor, with an adjoint, a category with an initial object is aspherical) and §2.4 (`mem_of_isAsphericalFunctor`, "the general owner of Theorem A") | Agrees. |
| Those forms assert membership in a class; §§1.10–1.12 and 2.31 here assert explicit homotopies, homotopy equivalences with the given maps, contractibility | §1.10 constructs the homotopy with `edge(η_c)` as track; §1.11 retains `BL`, `BR` as the forward and inverse maps; §1.12 contractibility; §2.31 "BF a homotopy equivalence by CW Whitehead" | Agrees; instance below. |
| The topological instance at Thomason equivalences rests on §§2.26 and 2.29 here, so that roadmap is a consumer | Its §4.1 proves LF3 for `W_N` from StableHomotopyKTheory §§2.26, 2.29 (its *Needs* line), its supplier table lists StableHomotopyKTheory §§1.21, 2.26, 2.29, 2.30, 2.34 for Layer 4, and its boundary sentence hands everything "through the topological realisation of a nerve" to the owner named | Agrees; direction consistent on both sides. |
| Theorem B (§2.34) is owned here and consumed there, as `quillenTheoremB` in the forward comma form | Its §4.4 consumes §2.34 `quillenTheoremB` "when every d → d′ induces a homotopy equivalence"; `Suggested.lean:93` quantifies over `g : d ⟶ d'` with `CostructuredArrow.map g : F↓d → F↓d'` and compares `CostructuredArrow.proj F d` into `MappingPathFiber` | Agrees: `CostructuredArrow F d` is F↓d, the forward comma. |
| A simplicial weak equivalence of nerves there is a weak homotopy equivalence (§2.1) of the realised nerve map here, with the same nerves | Its convention 4 defines `W_N` by `nerveMap F` being a simplicial weak equivalence of GeneralizedCohomology G2 item 1 (realisation bijective on π₀, isomorphisms on all πₙ); §2.1 here: bijective π₀ and every positive πₙ at all basepoints; both use Mathlib's `nerve`/`nerveMap`, and `classifyingSpace` is `SSet.toTop.obj (nerve C)` (`Suggested.lean:51`) | Agrees. |
| §1.21 here owns π₁(BC) as the automorphism group in C[C⁻¹]; §2.30 the homology spectral sequence; §2.26 invariance of hocolim | Its §4.6 (`Π₁ A := FreeGroupoid A`, cites §1.21), §4.3 (cites §2.30 for the E² comparison), §4.1 (cites §2.26) | Agrees. |

Ownership: the abstract Theorem A (a statement about an arbitrary basic localizer `W`) and Quillen's Theorem A for realised nerves (§2.31) are different objects; the instance of the former at `W_N` is derived there from §§2.26, 2.29 here, so the supply runs one way and no object has two owners. One remark, not a finding: at `W_N` itself, membership plus Whitehead's theorem does give *some* homotopy inverse, so the sentence "which the localizer forms do not imply" is exact for the explicit homotopies and the specified inverse maps of §§1.10–1.11 and for an arbitrary `W`, which is what it says.

**Sources, the seeded sample.** Of the 15 seeded targets, two fall in the changed passages (§§1.11, 2.29); I read them at their locators. The other 13 are untouched and their rows are carried below from the previous report.

| Passage | Source and exact locator read | Verification |
| --- | --- | --- |
| §§1.10–1.12 | Q lines 301–313, §1 Proposition 2, Corollaries 1 and 2, printed LNM p. 92; W IV lines 1122–1145, 3.2, Examples 3.2.1–3.2.2, pp. IV.25–26 | Natural transformation gives a homotopy `BC × I → BD`; an adjoint pair gives a homotopy equivalence with `Bf′` as the inverse of `Bf`; initial or terminal object gives contractibility through the adjoint of `C → 1`. Supports the explicit-homotopy and specified-inverse statements and the equivalence/skeleton corollary of §1.11. |
| §2.29 | Kahn lines 223–245, Theorem 1.4.3, p. 6; lines 268–271, Lemma 1.4.5, p. 7 | Canonical weak equivalence from the diagonal of the bisimplicial nerve to `N(∫F)`, sending `(d₀ → d₁, x₀ → x₁)` to `(d₀, y₀) → (d₁, y₁)` with `y₁ = F(f₁)x₁`, `h₁ = (f₁, F(f₁)g₁)`; at `g₁ = id` this is the `(f, id) : (c, x) → (d, F(f)x)` of §2.29. `s ⊣ p₁` gives the levelwise adjunction equivalences the proof sketch takes from §1.11. Thomason's Theorem 1.2 is cited through Kahn; see Not verifiable. |

**Ownership searches this round.** `tauceti-roadmap roadmaps grep` and the open-head index for "basic localizer", "Thomason equivalence", "Theorem A", "Theorem B": only HomotopyTheoryOfCategories (#1521) and this roadmap; their split is recorded above. DerivedModuleAlgebra on main and at its open head (R01). No other open pull request changes this roadmap (`overlaps.md`); no id this pull request drops is cited elsewhere.

**Headline and padding check.** Unchanged from the previous report: the same 11 sorried theorems and 13 definitions; the module docstring names the headline theorems not statable at the pins (category homology, rational Hurewicz, monoidal group completion and its linear/orthogonal comparisons, the Segal machine, the symmetric-sphere-module spectra, Waldhausen categories, operad algebras, the deformation category and HF₂-synthetic spectra). No new sorried statement, so no new one-tactic probe; the previous probes are carried.

**Adversarial table.** New computed rows for the changed passages first; then the rows the diff leaves untouched for the seeded targets, the Lean headline theorems and the targets the findings touch, each carried from the previous report ([r5], itself carrying [r4]). The remaining rows of [r5] (the full Layer 1–7 sweep) are unchanged and carried by reference.

| Statement | Instances tried | Computed values on both sides / wrong-model control | Result; change |
| --- | --- | --- | --- |
| Ownership split: localizer Theorem A versus §2.31 | `∅ → 1`; `id_[1]`; `[1] → 1` | `∅/⟨⟩ = ∅` is not aspherical, so `∅ → 1 ∉ W`, and `B(F↓*) = ∅` is not contractible, `∅ → *` no equivalence: both forms refuse it. `id_[1]`: every comma category has a terminal object; both accept. `[1] → 1`: membership in `W` for `W = ⊤` carries no homotopy, while §1.11 gives the specific inverse `B1 → B[1]` at 1 and the track `0 ⇒ 1`. | Pass; the two statements differ as the paragraph says, and the `W_N` instance is downstream of §§2.26, 2.29. |
| `W_N` LF3 from §§2.26, 2.29 (that roadmap's §4.1 route) | `u : A → B` over `C = B` with `u = F` | `B/b` has a terminal object, so `A/b → B/b ∈ W_N` iff `B(A/b)` is weakly contractible; hocolim over `b` of `B(A/b)` is `B(∫ FT) ≃ BA` by §2.29 and Kahn Lemma 1.4.5, and of `B(B/b)` is `BB`; §2.26 gives `BA → BB` weak. | Pass; Theorem A at `W_N` is a consequence of this roadmap's targets, not an input. |
| `quillenTheoremB` forward comma form | `1 → C₃` (one object) ; `g : d → d′` in `[1]` for `F = id` | `F↓*` for `1 → C₃` is the discrete category on 3 objects, `CostructuredArrow.map` of each arrow permutes them; the homotopy fibre `ΩBC₃` has 3 contractible components. For `id_[1]`, `F↓0 = {0}`, `F↓1 = [1]`, `map(0 → 1)` is the inclusion, a homotopy equivalence; fibre contractible. | Pass; `CostructuredArrow` is F↓d, the direction the consumer cites. |
| §2.1 weak equivalence = simplicial weak equivalence of nerves | `B(ℤ/2) → e`; `[1] → e` | First: `π₁` map `C₂ → 1` not injective on either side. Second: `I → *` bijective on `π₀`, all positive groups `0 → 0`. Same `nerve`, `nerveMap`, `SSet.toTop` on both sides. | Pass; the consumer's `W_N` is §2.1 applied to `classifyingSpaceMap`. |
| §1.21 as consumed (`Π₁ A = FreeGroupoid A`) | One-object category of `ℕ`; `[1]` | `Aut` in `ℕ[ℕ⁻¹] = ℤ` equals `π₁(Bℕ) = ℤ` (`Bℕ ≃ S¹`); `[1]` localised is the indiscrete groupoid on two objects, `π₁ = 1`. | Pass; same object on both sides. |
| §2.30 as consumed (E² comparison) | `F : C → 1` with `C = BC₃`; `A/c → B/c` isomorphisms | Base column only, `E²₀,q = H_q(BC₃)`: `ℤ, C₃, 0, C₃, …`; isomorphic comma homology gives isomorphic `E²` pages and abutments. | Pass; forward comma `F↓d` on both sides. |
| R01: tower algebra under the three citations | `×2` tower on `ℤ`; constant tower `A` | `lim = 0`, `lim¹ = ℤ₂/ℤ` under `TauCeti.ModuleTower.limOne` (`coker(shift)`, `δ(x)ₙ = xₙ − φₙ(xₙ₊₁)`), under main's §1.T.1 and under the open revision's §1.1 Check; constant `A`: `lim = A`, `lim¹ = 0` everywhere. | Pass for the mathematics; the citation target moves (R01). |
| 3.29 `piTwoEquiv` (R02) | `G = A₅, P = A₅`; `G = C₃, P = 1` | `π₂(BA₅⁺) = H₂(A₅) = C₂`, plus-fibre `π₁ = 2·A₅ → A₅` with central kernel `C₂`; second gives `0` and `1 → 1`. | Pass; the finding is on the statement's form only. [r5] |
| 1.11 Adjunction (seeded) | `[1] → 1` with terminal right adjoint | `B[1] = I`, `B1 = *`; composite at `[1]` is constant at 1, homotopic to `id_I`. | Pass; retain. [r5] |
| 1.30 Classifier comparison (seeded) | `G = C₃, S₃`; trivial homomorphism | Both classifiers have `π₁ = G`; comparison induces `id_G`; trivial map induces trivial `π₁` map. | Pass; retain. [r5] |
| 2.8 Homotopy pullback (seeded) | `* → S¹ ← *`; `* → * ← *` | Pullbacks `ΩS¹` (`π₀ = ℤ`) and `*`; the first strict pullback is only `*`. | Pass; retain. [r5] |
| 2.9 Contractible base (seeded) | `X, Y` over `*` | Homotopy pullback `= X × Y`; `X = ∅` gives `∅`, `X = Y = *` gives `*`. | Pass; retain. [r5] |
| 2.15 Exhaustion criterion (seeded) | `F × ℝ` by `F × [−n, n]` | Each fibre comparison `id_F`; every compact lies in a finite stage; global fibre `F`. | Pass; retain. [r5] |
| 2.23 Level equivalence realisation (seeded) | constant point → constant interval | Level maps and `* → I` weak; `π₀ = 1`, higher `0` on both sides. | Pass; retain. [r5] |
| 2.27 Proper realisation/hocolim (seeded) | constant point simplicial diagram | Realisation and derived colimit contractible; simplex category nerve contractible. | Pass; retain. [r5] |
| 2.29 Thomason comparison (seeded) | terminal-category diagram over `C₃`; `[1]` with `x ∈ F(0)` | Grothendieck construction `= C₃`; hocolim of points `= BC₃`, `π₁ = C₃` both sides. Over `[1]` the edge at `x` is `(0,x) → (1, F(0→1)x)` with fibre arrow `id`, matching Kahn's `h₁ = (f₁, F(f₁)g₁)` at `g₁ = id`; the reversed arrow is not in the image. | Pass; retain. [r5], locator reread this round |
| 2.32 Prefibred comparison (seeded) | `id_[1]` | Fibre over each object terminal; comma inclusion has the adjoint with value that object. | Pass; retain. [r5] |
| 3.3 Acyclic maps (seeded) | `id`; punctured Poincaré sphere `→ *`; `* →` that space | First two have acyclic fibres; the last has a 120-point `π₀` fibre despite being a homology isomorphism. | Pass; retain. [r5] |
| 4.13 Product plus (seeded) | `BA₅ × BA₅` at `A₅ × A₅` | `π₁` plus `= 1`; `H₂ = C₂ ⊕ C₂` equals `H₂` of the product of the plus spaces. | Pass; retain. [r5] |
| 4.17 Telescope acyclicity (seeded) | discrete `ℕ`; finite-set core | Telescope labels `k − r` range over `ℤ`; `π₀` map `id_ℤ`; component 0 maps to `BΣ∞⁺`. | Pass; retain. [r5] |
| 4.20 Groupoid cofinality (seeded) | even-rank finite sets | `K₀` map `2ℤ ↪ ℤ`, cokernel `C₂`; higher groups agree after stabilisation. | Pass; retain. [r5] |
| 4.30 Topological K comparison (seeded) | `k = ℝ, ℂ`; rank 0, 1 | `π₀ku = π₀ko = ℤ`; `GL₁(ℝ)` has 2 components, `GL₁(ℂ)` connected; singular interior and vertex both evaluate to 5/4, so the counit is not an isomorphism. | Pass; retain. [r5] |
| 7.11 Tate-module extension (seeded) | `E = H(ℚ_p/ℤ_p)`, degree 1 | Quotient contribution `π₁E/pʳ = 0`; `T_pπ₀E = ℤ_p`; completion `π₁ = ℤ_p`; tensoring `π₁E` would give `0`. | Pass; retain. [r5] |
| 2.31 Quillen A (headline) | `id_[1]`; `∅ → 1` | Identity comma spaces contract, `BI → BI` is `id`; empty comma not contractible and `∅ → *` no equivalence. | Pass; retain. [r5] |
| 2.34 Quillen B, both orientations (headline) | `1 → C₃`; `id_[1]` | Comma spaces discrete `C₃`; `ΩBC₃` has 3 contractible components; identity gives a point. | Pass; retain. [r5] |
| 3.7 Local homology iff acyclic (headline) | `id`; `* →` punctured Poincaré sphere with regular coefficients | `id` induces isomorphisms; control has `H₀` source `ℤ¹²⁰`, target `ℤ`. | Pass; retain. [r5] |
| 3.10 Plus existence (headline) | `S¹, P = 1`; `BA₅, P = A₅` | First plus can be `id`; second has `π₁ = 1`, `H₂ = ℤ/2`. | Pass; retain. [r5] |
| 3.25 Plus factorisation (headline) | `id_{S¹}` at `P = 1`; `BA₅⁺ → K(C₂, 2)` | `h = g`; two classes before and after plus, indexed by `H² = C₂`. | Pass; retain. [r5] |
| 3.28 H-space recognition (headline) | `S¹ → S¹` degree `−1`; plus `= id` | `H₁` map `−1` invertible; factor `h` has degree `−1`; degree 2 fails the premise. | Pass; retain. [r5] |
| 3.30 π₂ naturality (touched by R02) | `id_{A₅}`; `A₅ → 1` | Multiplier maps `C₂ → C₂` is `id`; `C₂ → 0` is zero; same `π₂` maps. | Pass; retain. [r5] |
| 3.33 Universal-extension fibration (headline) | `1 → C₂ → 2·A₅ → A₅ → 1` | `π₂(B(2·A₅)⁺) = 0`; `π₂(BA₅⁺) = C₂ → π₁BC₂ = C₂` isomorphism. | Pass; retain. [r5] |
| 4.29 Projective freeness (headline) | `P = 0`; rank-one trivial; `n = 0`; Möbius line over `C(S¹, ℝ)` | Free ranks 0, 1; `C(Δ⁰, k) = k`; the Möbius module is non-free outside the simplex hypothesis. | Pass; retain. [r5] |
| 5.17 Cellular approximation (headline) | `D(ℤ)`, `G = ℤ[0]`, `E = Hom(−, C₂[0])`; empty `G` | `R = C₂[0]`, `x = id` gives evaluation `C₂ → C₂`; empty family gives `R = 0`; `ℤ[−1]` outside the connective closure; `⊕_ℕ ℤ` fails compactness. | Pass; retain. [r5] |
| 3.18 Postnikov/Milnor (touched by R01) | constant `S²`; discrete tails; Postnikov `S²` | `π₂ = ℤ`, `lim¹π₃ = 0`; tail holim `∅`; `P₁S²` has `π₂ = 0`, `P₂S²` has `π₂ = ℤ`. | Pass; retain. [r5] |
| 4.11 Phantom/Milnor (touched by R01) | constant exhaustion `S¹`, target `K(ℤ, 1)` | `lim[S¹, K] = ℤ`, `lim¹[ΣS¹, K] = 0`; no phantom kernel. | Pass; retain. [r5] |
| 7.9 lim/lim¹ comparison (touched by R01) | identity tower `A`; zero-transition tower | `δ = 1 − shift`: kernel `A`, cokernel `0`; `δ = id`: kernel `= cokernel = 0`. | Pass; retain. [r5] |
| 7.10 Nonzero lim¹ (touched by R01) | `×2` tower on `ℤ`; `×3` tower with map `×2` | `lim = 0`, `lim¹ = ℤ₂/ℤ`; `[1/3] ≠ 0`; at `p = 3`, `[1/2] ≠ 0` but `2[1/2] = 0`. | Pass; retain. [r5] |

[r5]: packages/StableHomotopyKTheory/reports/PRREVIEW-StableHomotopyKTheory~5.md
[r4]: packages/StableHomotopyKTheory/reports/PRREVIEW-StableHomotopyKTheory~4.md

**Remarks on untouched text (no change requested).** `README.md:941` (§2.34) contains the doubled phrase "the forward-arrow comparison the forward-comma comparison map is weak"; the meaning is clear. §5.19's identification of `η : π₀K(C) → π₁K(C)` with the self-braiding and HomotopyTheoryOfCategories §12.5's sign `ε` of a Picard groupoid are the same homomorphism on different carriers (the spectrum there, the algebraic invariant classifying Picard groupoids here); neither restates the other's theorem, and a future consumer of both will identify them through §5.19.

## Not verifiable

- Thomason, *Homotopy colimits in the category of small categories* (1979), Theorem 1.2, cited at §2.29: the journal copy is paywalled and not in the sources cache; the statement was checked through Kahn's restatement (Kahn lines 223–245, Theorem 1.4.3, attributed to Thomason Th. 1.2), which supports §2.29 as written.
- The 13 seeded targets outside the changed passages were not resampled at their sources this round; their rows are carried from the previous report, which carried them from the full review.
- The previous reports' limits stand: the Barratt–Eccles Γ⁺-structures I approximation proof reached only a paywalled route; the structure-map details of Schwede's Waldhausen iteration remain roadmap targets.

## Source issues

- none
