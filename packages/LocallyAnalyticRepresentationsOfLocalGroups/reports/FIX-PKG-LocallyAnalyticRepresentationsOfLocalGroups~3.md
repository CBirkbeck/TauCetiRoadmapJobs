# Repair of LocallyAnalyticRepresentationsOfLocalGroups (package, round 3)

Sixteen findings of `REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2` were settled: fourteen applied, one applied differently (R15) and one disputed (R07). Files changed: `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md`, `Suggested.lean`, `sources.toml` and the top-level `gaps` list of `design/plan.json`. No source was fetched, and no `needs-references.toml` was written.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R01 (P1) — applied

**Verified:** for non-compact G the smooth contragredient of Steinberg is a proper nonzero D(G, E)-submodule of the full dual (ST03 lines 1434–1436), so abstract simplicity of the dual fails. For compact G the two notions agree (ST03 line 407, Cor. 3.4 (iv); line 542, Lemma 3.9).

**Changed:** §1.2 (iii) and its API bullet: "V′ simple D(G, E)-module" → "V′ simple object of 𝒞_G (no nonzero proper closed submodule); for compact G equivalently abstractly simple". Added the Steinberg/full-dual negative control.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R02 (P2) — applied

**Verified:** EM17 line 6163 (Prop. 6.3.6) assumes V admissible; EM17 line 4370 (Prop. 4.2.10, p. 85) gives closedness alone for V of compact type.

**Changed:** §1.6 API: "closed in V with its finest topology" → closed for V of compact type (Prop. 4.2.10); finest topology and admissible for admissible V (Prop. 6.3.6, p. 123). Added the trivial c_0(ℕ, E) negative control (Hamel functional e_n ↦ p^(−n)).

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R03 (P1) — applied

**Verified:** at n = 0, det^* = 0 and Hom_(g′)(T, E) = 0; for a torus, induction and closed induction both return the character.

**Changed:** §5.3 (4): "dimension n + d_L" → "n + d_L for n ≥ 1, 0 for n = 0", with the det^* reason in the route and the n = 0 Check. §6.1 and §7.2 Checks: properness → "for positive semisimple rank", plus the torus equality (1 = 1).

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R04 (P1) — applied

**Verified:** BZ77 line 166 (normalised induction, §1.8, p. 444) and line 552 (Theorem 4.2, p. 454). For unnormalised lower-Borel induction the exceptional raw ratios are {1, |·|_L^(−2)}.

**Changed:** §6.3 Check now uses the raw set {1, |·|_L^(−2)}, with the reason. §6.4 Check: ratio |·|_L → χ = 1 ⊠ 1, with |·|_L as an irreducible control. §6.6 Check: "simple M_i" → generic φ_i and dominant λ_i (8), with the 12-constituent control. Same pattern fixed in §§6.5, 6.7 and the Layer 6 Examples ("χ = φη, φ generic").

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R05 (P1) — applied

**Verified:** BR16 line 501 (Cor. 2.7) has no nonzero hypothesis, and its proof (lines 507–509) reads the highest weight off Ev⁺ ⊗ π′, which vanishes when π = 0.

**Changed:** §6.4: "finite-length π_(Q_i)" → "nonzero finite-length π_(Q_i)", with the reason and the n-invariants in the route. Added the 𝔾_m zero-input Check (0 = 0; with the trivial character, weights 0 and −1). Added a Source correction for BR16 Cor. 2.7.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R06 (P2) — applied

**Verified:** the ℚ_3^× witness; EMJ2 lines 147–149 (Cor. 0.14: finite-dimensional U) and lines 3275–3295 (scalar extension, then E′ forgotten); EMJ1 line 152 (Thm 0.6, character form).

**Changed:** the section, now §7.5 (i): "subquotient of the induction of a character" → "quotient of I(U), U finite-dimensional over E". U is the restriction of scalars of an E′-character and is a character when χ̃ is E-valued. Added the ℚ_3 Check (U = V) and a Source correction for EMJ1 Theorem 0.6.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R07 (P2) — disputed

**Evidence.** The general-prime theorem is not established in any source, so it cannot be a target with a locator and a proof route:

- OS15 lines 117–122 (p. 4): the authors say the restriction is imposed by their method and that they know no counterexample.
- OS15 lines 1034–1037 (p. 26): the assumption enters through their §8 results on highest-weight modules, and a refined analysis "might" remove it.
- BR16 lines 234–236: Breuil carries the same hypothesis.
- One web search turned up no later removal.

The no-good-primes principle forbids narrowing a known general theorem. It does not require planning an open problem, and the cited restricted theorem is not a shortcut. Every group to which Layers 8–10 apply 6.4–6.6 (GL_n(L), its Levi subgroups and their products) is of type A, where no restriction applies. **Clarification added:** the Layer 6 introduction now states where the bound enters (OS15 p. 26, §8), that the question is open (p. 4), that 6.1–6.3 do not use the bound, and that the consumers are of type A.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R08 (P1) — applied

**Verified:** `packages/LocallyAnalyticDistributionsPartII/README.md` (lines 20–21; §§1.1, 1.2, 2.5); PadicLocalLanglandsForGL2Qp §0.1 and NoncommutativeAndEquivariantIwasawa §§0.1–0.7 at their open heads; LAD §0.3 at #854 is stated for O_F only.

**Changed:** ND.0 → NCEI §§0.2, 0.6–0.7. ND.1 → PLGL2 §0.1, plus LADPartII §1.1 for x̃. ND.2 → PLGL2 §0.1 with new gap:frechet-stein-general and gap:radius-algebras. ND.3 → LADPartII §2.5 (𝒰(g)). ND.6 → PLGL2 §0.1. §0.4 (vi): LAD §0.3 → PLGL2 §0.1. Contracts, Scope, Summary and all Needs and Dependencies lines updated.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R09 (P2) — applied

**Verified:** open #1828 (SpringerResolutionAndCharacteristicCycles README lines 1210–1238) builds the same Verma and simple modules. This roadmap is earlier in the merge order (line 253 against 258).

**Changed:** the Scope bullet for Layer 4 now states single ownership of category O for every block and parabolic. Springer owns only the strict central reduction, orbit labels and localisation. The sl_2 boundary is stated. Springer's matching repair lies outside this package.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R10 (P3) — applied

**Verified:** consumers cite LR.0–LR.9, LR.4/principal-series and LR.5/orlik-strauch-* (TriangulineVarietyAndItsLocalModel at #1829, lines 18 and 117–121; board packages PadicHodgeParameters…, SolidAnalyticRings, PadicLocalLanglandsForGL2QpPartII).

**Changed:** added a table headed "Former numbering", one row per id: LR.0–3 → Layers 0–3; LR.4 → Layer 5 (5 slugs → §§5.1–5.5); LR.5 → Layer 6 (7 slugs → §§6.1–6.7); LR.6–9 → Layers 7–10; the four Layer 7 moves of R15.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R11 (P2) — applied

**Verified:** the Scope bullet for Layers 8–10 and the Layer 8, 9 and 10 introductions identified layers with Ding's sections; the Layer 3 introduction and its Scope bullet did the same with "Boxer–Calegari–Gee–Pilloni §2.2".

**Changed:** these now state each layer's mathematical outputs and why the order is forced: Layer 9 needs Layer 8 for each Levi block, and Layer 10 specialises along g ⊗ E = ∏_σ g_σ. The Layer 3 introduction, Scope and Summary are repaired the same way. Claim-level locators are kept.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R12 (P3) — applied

**Verified:** EM17 line 5898 (Prop. 6.2.2, p. 117), line 5999 (Prop. 6.2.9, pp. 119–120) and line 6072 (Cor. 6.2.16, p. 121).

**Changed:** §1.2 (i): "Prop. 6.2.4, p. 118" → "Prop. 6.2.2, p. 117". §2.1 (iii) → "Prop. 6.2.9, pp. 119–120, and Cor. 6.2.16, p. 121". The EM17 manifest locator was updated under the same key, adding 3.6.18, 4.2.10, 6.1.20 and 6.3.6, which the README already cites.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R13 (P3) — applied

**Verified:** `Ext` is at `Mathlib/CategoryTheory/Abelian/Ext.lean:41`, in the root namespace; `CategoryTheory.Abelian.Ext` is at `…/DerivedCategory/Ext/Basic.lean:118`; `TauCeti.LocallyAnalytic` is ℤ_p-only with no topology (its line 30).

**Changed:** the README contract, §1.7 and the Needs lines now name both Ext declarations. The Suggested.lean docstring's absence claim is qualified with `TauCeti.AnalyticStage` and `TauCeti.LocallyAnalytic`. Scope records them under "Already in the libraries".

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R14 (P3) — applied

**Verified:** the task prescribes the single line `import Mathlib`.

**Changed:** `module` / `public import Mathlib` / `@[expose] public section` → `import Mathlib`; the wrapper was removed, and the docstring and empty namespace are kept.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R15 (P3) — applied differently

**Verified:** §§1.6 and 1.10 cited §4.1, and §7.2 needed §§7.3 and 7.5. Moving §4.1 would renumber about forty references, so the forward edges were removed instead.

**Changed:** §1.6 now takes highest-weight lines from ReductiveGroups §10B. §1.10 descends Harish-Chandra separation from Ē inline (the centre commutes with base change), citing LieHighestWeight Layers 5, 7 and 9. Layer 7 is reordered as the finding suggested (7.1, 7.2 closed induction, 7.3, 7.4, 7.5 Jacquet consequences, 7.6), with the numbering map.

## REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~2/R16 (P2) — applied

**Verified:** at the pin, `BarrelledSpace` (`Barrelled.lean:90`), `BaireSpace.instBarrelledSpace` (:122) and the two `banach_steinhaus` theorems (:164, :192) all work over a nontrivially normed field.

**Changed:** these are imported under From Mathlib. gap:barrelled-banach-steinhaus keeps its slug and owner and is narrowed (README and plan.json) to the lattice/seminorm comparison plus the compact-type and inductive-limit instances. Added the ℚ_2 Check. Same pattern: gap:compact-type-tensor is narrowed to exactness, since LAD §0.0 now has *Compact-type tensor comparison*.

## Checks run

- **Elaboration.** `lake env lean packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean`, run from the content checkout, exited 0 with no output in 4.6 s. No `TauCeti.*` module is imported, so nothing had to be built.
- **Signatures.** Suggested.lean has zero declarations, so the `#check @name` comparison has nothing to check. No signature changed.
- **Dependency check.** Full output:

  ```text
  depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line. The edge count rose by one, the new edge being NoncommutativeAndEquivariantIwasawa, which is at line 30 of the merge order, before this roadmap.
- **Citation resolver.** `roadmaps resolve` reports one lead: "LocallyAnalyticDistributionsPartII §1.1: no roadmap … on main or in an open pull request". It is a false positive. That roadmap is a board package at line 199 of the merge order, earlier than this one (line 253). Its README was read directly, and §§1.1, 1.2 and 2.5 exist with the content cited. No Lean names were reported missing.
- **Gaps.** README and plan.json both list the same nine gap slugs, mechanically compared.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.2 (iii) closed simplicity | Steinberg of GL_2(ℚ_p); G = ℤ_p, V = C^an; G = 1, V = E or 0; discrete G = ℤ | St: closed submodules {0, V′}, but V^∨ ⊊ V′ is nonzero (f ↦ f(0) − f(∞) has a torus stabiliser, not open); C^an: V′ = D is not simple and V has the closed constants; E: simple in both senses; 0: excluded on both sides; ℤ: finite-dimensional, so all submodules are closed | Holds; abstract simplicity is false for St |
| 1.6 API, finest topology | trivial c_0, W = E; admissible π ⊗ W | c_0: e_n ↦ p^(−n) gives 1 on p^n e_n → 0, a discontinuous functional; compact-open invariants infinite-dimensional; π ⊗ W has finest topology by EM17 Cor. 6.3.7 | Admissibility is needed for the topology clause |
| 5.3 (4) | n = 0, 1, 2; d_L = 1, 2 | n = 0: 0 (det^* = 0); n = 1, L = ℚ_p: 2 = 1 + 1; n = 2, d_L = 2: 2 + (1 + 2) − 1 = 4 | Corrected |
| 6.1 and 7.2 properness | GL_2; G = T | GL_2: K = M⁻(−s·λ) ≠ 0 gives a proper inclusion; T: 1 = 1 | Positive semisimple rank needed |
| 6.3 raw criterion | raw ratios 1, |·|, |·|^(−1), |·|^(−2) | normalised ratios |·|, |·|², 1, |·|^(−1): reducible, irreducible, irreducible, reducible; ratio 1 contains the constants; ratio |·|^(−2) is Ind(δ_(B⁻)) = (Ind 1)^∨, with δ_(B⁻)(diag(a, b)) = |b/a| | Matches 8.1 genericity (φ_1/φ_2 ∉ {|·|^(±1)}, raw ratio (φ_1/φ_2)|·|^(−1)) |
| 6.4 uniqueness | 𝔾_m with M_0, M_1, π = 0 or 1 | π = 0: 0 = 0 with M_0 ≇ M_1; π = 1: z^0 against z^(−1), weights 0 ≠ −1 | Nonzero π required |
| 6.6 count | GL_2(ℚ_p) × GL_2(ℚ_p(√p)) | generic: 2·4 = 8; χ_1 = 1 ⊠ 1: (2 + 1)·4 = 12 | Genericity needed |
| 6.5 Check, GL_3 | χ = φη, φ generic | GL_2-block ratio χ_2/χ_3 = (φ_2/φ_3)|·|^(−1), never in {1, |·|^(−2)}; 6 constituents | Consistent |
| 7.5 (i) | ℚ_3^×, V = E², 3 ↦ (0 3; 1 0); E′ = ℚ_3(√3) | X² − 3 irreducible (v_3(3) = 1); dim V = 2 against dim of the induction of a character = 1; on basis (1, √3), √3 acts by (0 3; 1 0) | Finite-dimensional U needed; U = V |
| 7.5 route | weight choice | EMJ2 lines 3286–3290: no λ − μ with μ ≠ 0 in the positive cone, a minimal weight | Wording matches the source |
| 1.10 (1) route | gl_2, λ = (1, 0), μ = (0, 0) | λ + ρ = (3/2, −1/2) and μ + ρ = (1/2, −1/2) lie in distinct W-orbits; the centre over ℚ_p tensored with ℚ̄_p is the centre over ℚ̄_p | Separation descends |
| R16 Check | E = ℚ_2, x ↦ ax with a ∈ ℤ_2, and 2^(−n)x | sup_a |ax| = |x|, bound 1; |2^(−n)| = 2^n is unbounded | Both formulations agree |
| gap:frechet-stein-general | A = E; A = D(ℤ_p, E) | A = E: coadmissible = finite-dimensional, all submodules closed; ST03 Lemma 3.8 needs B coadmissible over A, and D(H′) is finite free over D(H) | Statement and locator checked at ST03 lines 401–480 |
| Former-numbering table | design headings LR.0–LR.9 and the LR.4/LR.5 target slugs | LR.4 is parabolic induction (Layer 5), LR.5 is Orlik–Strauch (Layer 6), LR.6 is Jacquet (Layer 7), LR.7–9 are Layers 8–10 | Every cited id is mapped |
| Layer 7 renumbering | all 22 references | old 7.3 → 7.2, 7.4 → 7.3, 7.5 → 7.4, 7.2 → 7.5; Downstream consumers (7.2, 7.4, 7.6); sources.toml cited_for (EMJ1 7.5, DING25 7.2) | No dangling reference (scripted scan) |

## For the maintainer

- **Ownership against open pull requests.** Checked with `roadmaps grep` and `roadmaps show` against the indexed heads. PadicLocalLanglandsForGL2Qp (#1312), NoncommutativeAndEquivariantIwasawa (#1307) and LocallyAnalyticDistributions (#854) are earlier in the merge order. No upward edge was added, and no Suggested.lean name collides with another roadmap's.
- **New supplier gaps against PadicLocalLanglandsForGL2Qp §0.1.** `gap:frechet-stein-general` and `gap:radius-algebras` use the same slugs and content as the gaps LocallyAnalyticDistributionsPartII declares against the same section. They are one request from two consumers.
- **SpringerResolutionAndCharacteristicCycles (#1828)** should import Layer 4 for Verma modules, simple quotients and the finite-length theory, keeping only its strict-block reduction, labels and localisation (R09). That edit is outside this package.
- **Consumers that cite LR ids** (TriangulineVarietyAndItsLocalModel #1829 and the board packages listed under R10) are served by the former-numbering table. No Lean names other roadmaps cite were changed.
- **R07** is disputed. If it is raised again, a human decides whether the roadmap should state the open small-prime case as a conjecture.
