# Repair of the round-6 review of QuasicoherentSheavesOnPrestacks (design)

There were nine findings. I checked each against the sources, the pinned Mathlib, the supplier heads and the roadmap's own text. All nine are right and all are applied. I also replaced one broken supplier, which no finding raised (see "Further change").

Files changed:
- `packages/QuasicoherentSheavesOnPrestacks/design/README.md`
- `packages/QuasicoherentSheavesOnPrestacks/design/plan.json`
- `packages/QuasicoherentSheavesOnPrestacks/sources.toml` (HTT locators only)

## R01 (P1) — applied

The finding is right. 7.1 defines `[X/G]` as the fpqc hypersheafification. The trivial group's bar construction is constant, so `[X/1] = L X`. For `X = ∅`, `L∅ = Spec 0`: `∅ → Spec 0` is fpqc-local (3.3's Check), and `Spec 0` is a hypercomplete sheaf. At the zero ring the two values are a point and ∅.

Change, 7.1 API: "`[X/1] ≃ X`" → "`|1^{×_S •} ×_S X| ≃ X` and `[X/1] ≃ L X`, equal to X exactly when X is a hypercomplete fpqc sheaf (every affine is, by 3.2)".

The 7.1 Check becomes the empty-prestack negative control: a point against ∅ at the zero ring, with `QCoh = 0` on both sides. The 7.2 Check now derives `QCoh([X/1]) = QCoh(X)` from 3.3. The plan's `trivial` API and `trivial_group` test are updated to match.

Pattern search for `[X/1] = X`:
- 7.4's Check concerns `actionQuotient` of a scheme, where `[X/1]^♮ = h_X` is right. It now says so explicitly.
- No other occurrence.

## R02 (P1) — applied

The finding is right.
- SchemeAndStackFoundations §1.13 on main defines `GroupSpace S` as a group object of `Over h_S`.
- `h_{Spec 𝔽₂}(ℤ) = Hom(𝔽₂, ℤ) = ∅`, so there is no unit from the final prestack.

Change, 7.1: "a groupoid object of `PreStk_T` whose object of objects is final" → "a group prestack over a base prestack S: a groupoid object of `PreStk_T/S` with `G_0 → S` an equivalence, unit `e : S → G`, products `×_S`".
- Actions, realizations `|G^{×_S •} ×_S X|` and `BG = [S/G]` are relative to S.
- The absolute case is `S = Spec ℤ`.
- The classical adapter is restricted to group schemes over S acting on S-schemes. These enter through h and §1.13's `GroupSpace.ofGroupScheme`, as the review allowed.
- The affine-diagonal API now assumes S affine.
- New Check: the trivial group over `Spec 𝔽₂` has unit `id`, translation realization `Spec 𝔽₂` and `QCoh = D∞(𝔽₂)`; it has no absolute unit.

Carried through:
- 7.2's statement and Checks: `QCoh([G/G]) = QCoh(S)`, which is `D∞(ℤ)` in the absolute case and `D∞(𝔽₂)` over `Spec 𝔽₂`.
- 7.4: `|h_G^{×_k •} ×_k h_X|` and `Dqc(G^{×_k n} ×_k X)`, with the face maps written over k.
- The Notation table and the supplier line for §1.13.
- The plan entries for 7.1, 7.2 and 7.4.

## R03 (P1) — applied

The finding is right. The space-valued `Map(O, −)` sends `0 ⊕ 0` to a point but `0 ⊔ 0` to two points. EnhancedDerivedSheaves `compactMappingComparison` is stated for filtered diagrams only.

Change, 8.2: "global sections `Map(O_X, −)` commute with colimits" → "`Map(O_X, −)` commutes with filtered colimits; `RΓ(X, −) = q_* : QCoh(X) → D∞(ℤ)`, right adjoint of pullback along `q : X → Spec ℤ`, preserves small colimits; `Map(O_X, F) ≃ Ω^∞ RΓ(X, F)`".

The new API bullet gives the argument:
- `q_*` exists by `adjointFunctorTheorem`.
- It is exact.
- It preserves coproducts because `q^*` sends the compact generator ℤ to the compact `O_X` (`rightAdjoint_preservesCoproducts_iff`).
- Hence it preserves all small colimits (`exact_preservesColimits_iff_coproducts`).

New Check: on `Spec 𝔽₂`, `Map(O, 0 ⊕ 0)` is one point against two.

Pattern repairs:
- 8.2's `BG_m` Check said the mapping functor "commutes with colimits". It now names the `Mod_R`-valued weight functor `M ↦ M_n` as the colimit-preserving one and the space-valued one as filtered-only.
- 8.3(d) now names `p_{U*} : QCoh(U × X₂) → Mod_A` and proves it preserves colimits by the same argument, as the review asked.

The remaining colimit claims were searched: `u_!`, L, 6.4 (filtered colimits) and the 8.3(a)/(b) route are correct. The plan's `unit_compact` API and `BGm` test are updated, with two new entries:
- test `mapping_space_vs_RGamma` (8.2);
- API `derived_pushforward_point` (8.3).

## R04 (P1) — applied

The finding is right. On `BGL₁ = BG_m` over ℚ, `O[1]` is invertible with inverse `O[−1]`, and its atlas pullback has `π₁ = ℚ` and `π₀ = 0`. Moreover `Map(ℚ, O[1]) = Ω^∞(ℚ[1]) = K(ℚ, 1)`, while `Hom(ℚ, π₀ O[1]) = 0`.

Change, 8.4 route: "`Map(V[i], M)` computing `Hom(V, π_i M)` … the finite-dimensional representations, which are the dualizable objects, generate" → "`π₀ Map(V[i], M) ≅ Hom(V, π_i M)` for every i (a statement about `π₀`); finite-dimensional V are compact, dualizable and generating; compact = dualizable = their stable retract-closed span".

That span is the objects with finitely many nonzero `π_i`, each finite-dimensional. It is reached by the Ind argument of 8.3 (`indCompactComparison`). Conversely, dualizable objects are compact because O is.

New Check: `O[1]` on `BGL₁` over ℚ, with the `K(ℚ, 1)` computation. The plan's `BGLn` API, a new test `shifted_unit_BGL1` and the prerequisites 6.3, 8.2 and E5:presentability.1 are updated.

## R05 (P2) — applied

The finding is right:
- SAG Remark 6.2.5.8 (SAG line 18017) assumes condition (3) of Proposition 6.2.3.4 (SAG line 17912).
- HA 1.4.4.11 needs the subcategory itself to be presentable.

Change, 6.2(a): "if `QCoh(X)` is presentable (2.3, 3.4)" → "if X is a u-small colimit of affines in `PreStk_T`, or satisfies the hypothesis of 3.4(b)". The locator now cites condition (3), and a sentence says that ambient presentability is not the hypothesis.

New route: the class 𝒞 of X with `QCoh(X)^cn` presentable contains the affines and is closed under u-small colimits.
- In prestacks, connectivity is detected on the colimit pieces because every point factors through a piece.
- In sheaves, it is detected because `⨿ X_j → X` is an effective epimorphism and connectivity is fpqc-local (6.1).
- Then `presentable_limit` applies.

(b) is reduced to (a) through the affine Čech nerve of the atlas; quasi-affine terms are finite colimits of affines. The plan's statement, hypotheses, locator and prerequisites (6.1, E5:presentability.2) are updated, with a new API `connective_presentable` and a new test `presentations`.

## R06 (P2) — applied

The finding is right. The heads were read:
- PrismaticCohomologyPartII (#1065) §4.0 defines `QCohPrestack` with `eval`, `pullback`, `specEquiv`, `limitOfColimit`, `isEquiv_iff_eval`, `isDualizable_iff_perfect`, `isInvertible_iff`, `QCohPrestack.Perf`, `flatDescent`, `sheafificationEquiv`, `cechDescent`, `affinePushforward`, `affineBaseChange` and `affineProjectionFormula`.
- LanglandsParameterStacks (#1202) §1.7 owns animated faithfully flat descent, including descent of `Perf`.
- HabiroCohomologyFoundations (#1428) §§1.27–1.28 own the lattice quotient, its heart, vector bundles and perfect complexes.

All three are earlier in `ORDER.txt` (lines 85, 82 and 207). A single owner therefore means importing them here.

Change, Scope line 7: "special cases of 2.2–2.3, 3.2–3.3, 4.2, 7.3 … Downstream consumers records which sections each uses" → three owner bullets. Each states what the import owns, which targets here extend it, and that the extensions agree with it. Then:
- **Suppliers.** New supplier contracts and supplier bullets for the three roadmaps.
- **Compatibility sentences.** One clause per target, naming the import:
  - 2.2: `QCohPrestack` is the classical `QCoh`, identified through 1.2's classical values;
  - 2.3, 2.4, 3.2, 3.3, 4.2, 6.3, 7.3;
  - the 7.3 lattice Check and the Layer 7 example.
- **Needs and Dependencies.** The *Needs* lines and the Dependencies of Layers 2, 3, 4, 6 and 7.
- **Plan.** `plan.json` suppliers, consumers and summary.

Pattern repair, Downstream consumers:
- PrismaticCohomologyPartII, LanglandsParameterStacks and HabiroCohomologyFoundations are removed: they are now suppliers, and keeping them as consumers would be a cycle.
- AlgebraicModuliForArithmeticGeometry is removed. It is at line 36 of the order, earlier than every supplier, so it cannot consume this roadmap. Its `spaceDQCoh` is its own.
- AnalyticStacks (line 338) stays, since the gate now places this roadmap after HabiroCohomologyFoundations (line 207). Its line is restated as a fact about which sections it can use.

The review's three compatibility witnesses agree with the imports' own Checks:
- `QCoh(Spec ℤ) = D∞(ℤ)`;
- `𝔽₂ → 𝔽₂[ε]/ε²` is faithfully flat and descends;
- the trivial ℤ-action on `Spec ℚ[x^{±1}]` gives the class `ℚ[x^{±1}]`.

## R07 (P3) — applied

The finding is right. On main, SchemeAndStackFoundations §1.22's comodule Check is unnamed, and `test_BG_representations` occurs in neither its README nor its Suggested.lean.

Change, line 109: "its Check `test_BG_representations` identifies" → "its first Check, on affine group schemes, identifies". No other occurrence.

## R08 (P3) — applied

The finding is right. GR-I line 7354 starts §1.1.3 on printed page 144, and line 7365 starts §1.1.4 with the limit formula on page 145.

Change, 2.2 and plan 2.2: "GR-I Chapter I.3, §1.1, p. 143" → "GR-I Chapter I.3, §§1.1.3–1.1.4, pp. 144–145".

Other places checked:
- 2.3's "§§1.1 and 3.2, pp. 143–145 and 159" is a range covering §1.1 and is correct.
- The manifest's chapter-level GR-I entry already covers these pages.

## R09 (P1) — applied

The finding is right. Mathlib at the pin has `groupCohomology` (Basic.lean:183) as a definition, and its cyclic results need a generator. For `S₃` over `𝔽₃`, `H¹ = Hom(S₃, 𝔽₃) = 0`.

Change, 8.5 route: "`Hⁱ(Γ; k)`, nonzero for infinitely many i" → coinduced coefficients.
- Cauchy's theorem gives g of order p (`exists_prime_orderOf_dvd_card`, Type.lean:491).
- Set C = ⟨g⟩ and `V = Coind_C^Γ k` (`Rep.coind`, Coinduced.lean:120).
- Then `Hⁱ(Γ; V) ≅ Hⁱ(C; k) = k` for every i ≥ 0. This uses `groupCohomology.coindIso` (Shapiro.lean:58) and `Rep.FiniteCyclicGroup.groupCohomologyIsoEven/Odd` (FiniteCyclic.lean:80, :114), whose maps here are `g − 1 = 0` and norm `p = 0`.
- Finally `⊕ V[i] = ∏ V[i]`, so compactness of O would force `⊕k = ∏k`.

The mapping-space comparison `π₀ Map(O, V[i]) ≅ Hⁱ(Γ; V)` is now an API bullet. It goes through 2.2's mapping-space formula and EnhancedDerivedSheaves E5:presentability.3 (`homotopyFixedPoints`, `continuousDerivedInvariants`; on main, its Check states the finite-group case).

New Check: `S₃` over `𝔽₃`, where `H¹ = H² = 0` with trivial coefficients, and V is two-dimensional with `Hⁱ = 𝔽₃` for all i. Also updated:
- the Mathlib supplier contract;
- the *Needs* of 8.5 and the Layer 8 Dependencies;
- the plan's 8.5 statement, hypotheses, API, tests and prerequisites.

## Further change: HigherToposTheory was replaced

The design cited a roadmap named HigherToposTheory. `roadmaps show HigherToposTheory` now returns "No roadmap HigherToposTheory on main or in an open roadmap pull request", and `roadmaps resolve` flagged it. Its content is now owned by the InfinityCategoryTheory family in open pull request #2270, by another author, which adds new roadmap folders.

I read each target at that head and remapped every citation:

| Old | New |
| --- | --- |
| L2.1 | CartesianFibrations §2.1.1, §2.2.1 |
| L2.2 | InfinityCategoryFoundations §5.1.1 |
| L3.5 | CartesianFibrations §1.3.1 |
| L4.2 | CartesianFibrations §5.5.3 |
| L6.3 | PresheavesAndCompletions §1.4.3 |
| L6.8 | LimitsAndKanExtensions §9.1.2 |
| L7.6 | PresentableInfinityCategories §4.4.2 |
| L9.4 | DerivedInfinityCategories §5.5.2 |
| L9.6 | StableInfinityCategories §11.1.1 |
| L10.1 | InfinityTopoi §3.1.2, §4.4.1 |
| L10.3 | InfinityTopoi §3.3.2, §3.5.1 |
| L11.3 | HypercompletenessAndCoherence §6.1.1, §2.4.1, §2.5.1, §2.5.2 |

The README contracts, Scope, all *Needs* and Dependencies lines, and the plan's prerequisites and suppliers were changed together. Because StableInfinityCategories §11.3.2 supplies the t-structure on `Sp`, the spectral Part II sentence in Scope now says precisely what is still missing. The HTT manifest locators gain Remark 2.4.2.2, Proposition 2.4.2.4 and Proposition 6.1.2.6, each verified in the cached text (HTT lines 5959, 5975, 25103).

## Checks run

**Dependency gate**, after all edits:

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Before the edits, the same command placed the roadmap after MathematicalBilliards with 2229 edges and 0 problems.

**Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found nowhere. Before the edits it listed HigherToposTheory L9.6 and seven supplier-planned names. Those seven are names that supplier roadmaps plan (SchemeAndStackFoundations, EnhancedDerivedSheaves, DerivedModuleAlgebra), not pinned declarations.

**Plan.json**: valid JSON; 33 targets and 122 tests, each target with at least three. There is no forward `target:` prerequisite, and the supplier list equals the roadmaps named in prerequisites. Formatting is preserved.

**Style scan**: no LaTeX delimiters, process words, pull-request numbers or machine paths in the README.

**Suggested.lean**: there is none at the design stage, so no `#check` elaboration was run and no Lean name was added.

**Gate failures listed in the brief**: none.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 7.1 `[X/1] = L X` | ∅ over `Spec ℤ`; `Spec A`; `h_X` of a k-scheme | `L∅(0) = ∗`, `∅(0) = ∅`; `L Spec A = Spec A` (3.2); `[X/1]^♮ = h_X` | correct; ∅ is the negative control |
| 7.1 translation realization | `G = ℤ/2` over `Spec ℤ`; `G = S = Spec 𝔽₂` | Čech nerve of `G → S` split by e; realization `∗`, resp. `Spec 𝔽₂` | S, as stated |
| 7.1 relative unit | `G = Spec 𝔽₂` over itself | absolute unit would be a point of `Hom(𝔽₂, ℤ) = ∅` | relative definition needed; Check added |
| 7.1 affine diagonal (S affine) | `G_m` on `Spec ℤ` over `Spec ℤ` | pullback of the diagonal to `X × X` is `G_m × Spec ℤ → Spec ℤ × Spec ℤ`, a map of affines | affine |
| 7.2 `QCoh([G/G]) = QCoh(S)` | absolute `G_m`; trivial group over `Spec 𝔽₂` | Čech descent along `ℤ → ℤ[t^{±1}]` gives `D∞(ℤ)`; `D∞(𝔽₂)` | correct |
| 7.4(a) relative | `G_m` over `k = ℤ`, `X = Spec ℤ` | `lim Dqc(G_m^{×n})`, comodules over `ℤ[t^{±1}]` | agrees with 7.2's Check |
| 6.2(a) hypothesis | `Spec A`; `⨿_ℕ Spec ℤ`; `BΓ × Spec k`; `BG_m`; a u-large coproduct | `Mod_A^cn`; `∏ Mod_ℤ^cn`; `Fun(BΓ, Mod_k^cn)`; via the Čech nerve; not covered | first four presentable; last excluded, as 2.3 also excludes it |
| 6.2(a) detection on pieces | X a prestack colimit; X a sheaf colimit | `π₀ colim X_j(A)` is a quotient of `⨿ π₀ X_j(A)`; fpqc-locally via effective epi | connectivity detected |
| 8.2 `RΓ` preserves colimits | `Spec A`; `BG_m`; `⨿_ℕ Spec ℤ` (not perfect) | restriction of scalars; weight-0 part; `RΓ(⊕ O_i) = ∏ ℤ` but `⊕ RΓ(O_i) = ⊕ ℤ` | holds on perfect stacks, fails off them |
| 8.2 space-valued Map | `Spec 𝔽₂`, `0 ⊕ 0` | one point against `∗ ⊔ ∗` | filtered colimits only; Check added |
| 8.4 `π₀ Map(V[i], M) ≅ Hom(V, π_i M)` | `BG_m`/ℚ: `(V, i, M) = (ℚ, 0, O[1]), (ℚ, 1, O[1]), (ℚ, −1, O)` | both sides `0`; `ℚ = ℚ`; `0 = 0`. The full mapping space in the first case is `K(ℚ,1)` | holds on `π₀` only, as now stated |
| 8.4 compact = dualizable span | `O ⊕ O[3]`; `O[1]`; `⊕_ℕ O`; `∏_i O[i]` | bounded with finite-dim `π_i`: yes, yes; infinite-dim `π₀`: no; infinitely many `π_i`: no | correct |
| 8.5 coinduced witness | `ℤ/p`/`𝔽_p`; `S₃`/`𝔽₃`; `S₃`/`𝔽₂`; `Q₈`/`𝔽₂`; trivial Γ; `ℤ/p`/ℚ | `dim V = 1, 2, 3, 4` with `Hⁱ = k` for all i; the last two are outside the hypothesis, where O is compact | correct |
| 8.5 `⊕ V[i] = ∏ V[i]` | `Fun(BΓ, Mod_k)` | `π_n` of both sides is V, from the single term `i = n` | equivalence; `colim_N ∏_{i≤N} k = ⊕ k ≠ ∏ k` |
| `H*(S₃; 𝔽₃)` low degrees | trivial coefficients | `H¹ = Hom(C₂, 𝔽₃) = 0`; `H² = H²(C₃; 𝔽₃)^{C₂} = 0` (action −1) | Check correct |
| Cyclic computation | trivial C-module k, char p | odd: `ker N / im(g−1) = k/0`; even > 0: `ker(g−1)/im N = k/0` | `Hⁱ = k` |
| 2.2/2.4 classical = `QCohPrestack` | `Spec ℤ`; ∅; `B(ℤ/2)` over `𝔽₂` | `D(ℤ)`; zero category; `H¹ = 𝔽₂` in both texts' Checks | agree |
| 3.2 vs LanglandsParameterStacks §1.7 | `A → A`; `(f, g) = A`; `𝔽_p → 𝔽_p[ε]/ε²` | identical Checks in both roadmaps | agree; same comparison functor |
| 7.3 vs HabiroCohomologyFoundations §1.27 | `d = 0`; `ℚ[x^{±1}]`, `q = 1`, `d = 1` | `D(C)`; class `ℚ[x^{±1}]` in both | agree |
| R08 locator | GR-I lines 7354, 7365 | §1.1.3 on p. 144, §1.1.4 on p. 145 | corrected |

## Ownership

- **This roadmap owns:** the animated and `E∞` theory; flat hyperdescent over `CAlg^cn`; the extension of 7.3 to every discrete group and prestack; the classical results PrismaticCohomologyPartII §4.0 does not state (Layers 5, 6.1–6.2, 6.4 and 7–8).
- **It imports:** PrismaticCohomologyPartII §4.0, LanglandsParameterStacks §1.7 and HabiroCohomologyFoundations §§1.27–1.28, by name and section.
- **How this was checked:** `roadmaps list`, `roadmaps show` (the three heads, AnalyticStacks and the thirteen #2270 members), `roadmaps grep` and the scratch overlaps file.
- **No competing pull request:** each imported roadmap has a single open pull request, and none drops §4.0, §1.7, §1.27 or §1.28.
- **Main roadmaps:** EnhancedDerivedSheaves and SchemeAndStackFoundations on main are cited unchanged.
- **Not checked:** ownership against open pull requests outside the brief's index was not checked.

## For the maintainer

- **New dependencies:**
  - PrismaticCohomologyPartII (#1065), LanglandsParameterStacks (#1202) and HabiroCohomologyFoundations (#1428), all earlier in the order.
  - The InfinityCategoryTheory family (#2270, nine Parts cited), which is not in `ORDER.txt`. It replaces the vanished HigherToposTheory dependency and must be named in the merge-order paragraph.
- **Placement:** the gate now places the design right after HabiroCohomologyFoundations.
- **Downstream consumers:** this roadmap no longer claims PrismaticCohomologyPartII, LanglandsParameterStacks, HabiroCohomologyFoundations or AlgebraicModuliForArithmeticGeometry as consumers. No roadmap on main or open cites QuasicoherentSheavesOnPrestacks (`roadmaps grep`), so no other roadmap breaks.
- **Renamed or added targets:** no target id changed. 7.1 now defines group prestacks relative to a base S, the absolute notion being `S = Spec ℤ`.
- **No suspicious instructions** were found in the review, the heads read or the sources.
