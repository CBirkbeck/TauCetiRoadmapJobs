# Review of FreeGroupsAndLimitGroups (pull request #2221 at b5fe829)

**Verdict:** needs changes

## R01 (P3) — The branch carries #2205 at `11a9d0f`, not at its head `d31b59b`, and the two conflict in §4.6

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:903` "Definition 2.1, p. 22, and §2.2 (domination, deformation spaces)". Also README:494 "A single folding does not change the language of the graph at the base vertex", and §4.11 (lines 1014–1029), which has no `**Checks.**`.

**Claim:** #2205's head `d31b59b` repairs these defects, and this head still has them:
- GL-JSJ locators at 800, 872 and 903.
- The false gloss of KM02 Lemma 3.4 at 489 and 494.
- No Checks for the `Suggested.lean` definitions `IsFreelyIndecomposable` and `IsGrushkoDecomposition`.
- 24 broken code spans, for example 247 and 1222, and the LaTeX `overline{…}` at 1774.

The two heads conflict at line 903.

**Witness:** GL-JSJ line 1072 (Definition 2.1, p. 22) is relative ellipticity of trees, line 1156 opens §2.2 (universal ellipticity), and line 914 (p. 19) is §1.4.2, domination. `git merge-file` with base `11a9d0f` conflicts only at line 903.

**Repair:** Merge `d31b59b` into this branch. Resolve README:903 with #2205's line: "Use [GL-JSJ] §1.2, pp. 16–17 (actions without inversions, elliptic and hyperbolic elements, minimal subtrees), §1.3, p. 18 (`(𝒜, ℋ)`-trees), and §1.4.2, p. 19 (domination, deformation spaces): …". I tested this resolution: the result differs from `d31b59b` in exactly this pull request's 20 hunks.

## R02 (P3) — Three sampled locators name the wrong section or page

**Location:** README:1257 "Use [ALG] §3.2, Theorem 3, p. 32, and Lemma 10, p. 34"; README:2157 "[VAR-I] §1, Theorem 1, p. 7, and §3, Form 2, p. 28" (the same page at 1640, 1653 and 2182); README:1860 "Use [IFT] §3.1, Definition 7 and Lemma 3, pp. 10–11".

**Claim:**
- ALG Theorem 3 is in §3.1. Only Lemma 10 is in §3.2.
- VAR-I Form 2 is on p. 29. Page 28 holds Lemmas 16–17.
- IFT Definition 7 is in the opening of §3, on p. 10, before §3.1 begins.

**Witness:** ALG lines 1178 (§3.1, p. 30), 1239 (Theorem 3, p. 32) and 1273 (§3.2, p. 33). VAR-I line 982 (Form 2) follows the p. 28 footer at line 973. IFT lines 432 (Definition 7, p. 10) and 465 (§3.1, p. 11).

**Repair:**
- At 1257, write "Use [ALG] §3.1, Theorem 3, p. 32, and §3.2, Lemma 10, p. 34:".
- At 1640, 1653, 2157 and 2182, change "Form 2, p. 28" to "Form 2, p. 29".
- At 1860, write "Use [IFT] §3, Definition 7, p. 10, and §3.1, Lemma 3, p. 11;".

## R03 (P3) — A §4.1 Check gives a false reason for requiring injective boundary maps

**Location:** README:793 "Data with a non-injective `ω_e` is not a graph of groups: with `ω_e` non-injective the vertex groups would not embed (the normal form theorem fails)."

**Claim:** Vertex groups can embed even when the boundary maps are not injective. If both maps of a segment have the same kernel `K`, the pushout is `A ∗_{C/K} B`. Injectivity is part of the definition, not a consequence of embedding. The description lists this item under "Further corrections not made here".

**Witness:** Map `C = ℤ` onto `A = B = ℤ/2` by reduction mod 2 on both sides. The pushout is `ℤ/2`, and both vertex groups embed in it.

**Repair:** Replace the bullet with "- Data with a non-injective `ω_e` is not a graph of groups. Vertex groups may then die: for `ℤ` mapped trivially to `A` and identically onto `B = ℤ`, the pushout is `A`. When both boundary maps have the same kernel `K`, the pushout `A ∗_{C/K} B` still contains `A` and `B`, so injectivity is a choice made in the definition."

## R04 (P3) — `rank_coprod` and §4.11(2) assume nontrivial factors, which the formula does not need

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/Suggested.lean:58` "`[Group.FG (Monoid.Coprod G H)] [Nontrivial G] [Nontrivial H]`"; README:1016 "(2) (Grushko–Neumann) For finitely generated nontrivial `G₁`, `G₂`".

**Claim:** The equality also holds when a factor is trivial. The two hypotheses narrow the headline below what the mathematics gives.

**Witness:** Take `G = 1`. Then `Monoid.Coprod 1 H ≃* H`, and `Group.rank 1 = 0` by Mathlib `Group.rank_eq_zero_iff`, so `rank (1 ∗ H) = 0 + rank H`.

**Repair:**
- Delete `[Nontrivial G] [Nontrivial H]` from `rank_coprod`.
- Change its docstring to "rank is additive on free products of finitely generated groups".
- At README:1016, write "(2) (Grushko–Neumann) For finitely generated `G₁`, `G₂` (trivially so when one of them is trivial)".

## R05 (P3) — The description describes the stack as of #2205's old head `11a9d0f`

**Location:** Description: "#2205's head `11a9d0f` is merged into this branch" and "this branch then takes main, keeping its own text in the hunks where its lines sit next to #2205's. If this pull request merges first, it contains all of #2205."

**Claim:** #2205's head is now `d31b59b`, and this branch lacks its repairs (R01). The stated merge rule would also keep this branch's README:903, which undoes #2205's §4.6 locator repair.

**Witness:** `roadmaps list` shows "#2205 FreeGroupsAndLimitGroups @CBirkbeck d31b59b". The merge in R01 conflicts only at line 903.

**Repair:** After R01's merge:
- Write "#2205's head `d31b59b` is merged into this branch".
- Write "this branch then takes main without conflict".
- Write "If this pull request merges first, it contains all of #2205 at `d31b59b`".
- In Checks, write "#2205's head `d31b59b` is an ancestor of this branch".
- In Correction 12, drop "GL-JSJ §1.2, pp. 16–17, and Proposition 1.1, p. 17, not §1.1 (§§4.6, 4.9)", which becomes #2205's change.
- If R03 is applied, move the §4.1 item from "Further corrections not made here" into the corrections.

## Verified sound

Status of the previous review's findings at this head:

| Previous | Passage at this head | Status |
| --- | --- | --- |
| R01 sorry-data | `Suggested.lean` is #2205's 288-line file; gate `sorry-data=0` | repaired |
| R02 #2205's repairs | README:1870 "times `|S|`"; :1882 "§7.7 is needed uniformly in the rank" | repaired against `11a9d0f`; #2205 has moved to `d31b59b` (R01) |
| R03 `Nonempty` | gate `statement-hygiene=0` | repaired |
| R04 PR number | README:26 "A proposed Mathlib change, commit `b38ce379…`" | repaired |
| R05 §§7.1, 7.3 | :1732 "Nonempty items alone do not encode `w ≠ 1`"; :1762 "identity on `X₀`" | repaired |
| R06 §10.9 | :2546 "pp. 197–198 (restated in the introduction, p. 94)"; :2807 "Cited in §10.9 for the statement" | repaired |
| R07 §2.4 | :470 "…quotient morphism, preserving connectedness."; :487 "in particular so does the folded quotient of §2.4" | repaired |
| R08 locators | :1349 "§3.6, Lemma 15 and Theorem 5, p. 40"; :1123 "§1 (introduction), pp. 2–5"; :1520 "§5.1.2, Proposition 5.4" | repaired |
| R09 description | "#2205's head `11a9d0f` is merged into this branch" | repaired for `11a9d0f`; stale again (R05) |

The adversarial pass:

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.6 centralizers (sample) | `a²ba²b`; `x = 1` with `|α| ≥ 2` | `(a²b)²`, `a²b` not a power, `C = ⟨a²b⟩`; `C(1) = F`, not cyclic | holds; SUBGROUPS lines 1612–1613 (p. 36) | none |
| §1.7 CSA (sample) | `F₂×ℤ` with `(a,0)`, `(b,0)`, `(1,1)`; `F(a,b)∗_{⟨a²⟩}(⟨a²⟩×⟨t⟩)`; trivial group | `(1,1)` central, `[(a,0),(b,0)] ≠ 1`; `a~a²~t`, `[a,t] ≠ 1`; CSA, vacuously | holds; ALG lines 116–117 (p. 4), 577 (p. 15); IFT line 302 (p. 7) | none |
| §1.8 malnormality (sample) | `u = a`, `g = b`; `u = a²`, `g = a` | `b⟨a⟩b⁻¹ ∩ ⟨a⟩ = 1`; `a⟨a²⟩a⁻¹ ∩ ⟨a²⟩ = ⟨a²⟩` with `a ∉ ⟨a²⟩` | holds; ALG line 583 (p. 16); SUBGROUPS line 694 (p. 16) | none |
| §2.1a adapter (sample) | one-loop bouquet; two isolated vertices; empty graph | 1 component, 2 Serre lifts; 2 components; 0 components, not connected | holds; GraphConnectivityAndFlows (main) lines 224–256, 369; FOLD line 199 (p. 5) | none |
| §2.9 product graphs (sample) | `a`-rose × cycle labelled `a,b,b⁻¹`; `⟨a²⟩ ∩ ⟨a³⟩` | both factors accept `⟨a⟩`, product accepts `⊥`; 6-cycle, `⟨a⁶⟩` | holds; KM02 lines 1146–1162 (p. 25), 796, 862, 885, 955, 1196 | none |
| §4.6 trees (sample) | Cayley tree of `F(a,b)`; `ℤ/2` swapping a segment | `ℓ(ab) = 2`, `ℓ(aba⁻¹) = 1`; an inversion, excluded | maths holds; GL-JSJ section cited for domination is wrong | R01 |
| §4.10a folds (sample) | `S = {a, a², b}` in `⟨a⟩∗⟨b⟩` | `K = ⟨a⟩` of rank 1, one 2-edge circle, `c(B₀) = 2 < 3 = k` | holds; FOLD lines 797–813 (pp. 19–20), 1148–1174 (pp. 27–28) | none |
| §4.12 refinements (sample) | collapse of `A∗_C B`; intersecting curves on a closed surface | trivial tree, dominated; neither tree elliptic with respect to the other | holds; GL-JSJ lines 1072–1090 (pp. 22–23), 1124, 1135, 1224 (p. 26) | none |
| §5.6 Zariski (sample) | `G=H=1`; `G=1`, `H=F₂`; `G=H=ℤ`, `{0,1}` | only algebraic set is the point, `closure ∅ = ∅`; `closure{a} = H`; closed, not algebraic | holds; Theorem 3 is in ALG §3.1 (line 1239) | R02 |
| §6.1a models (sample) | pants; torus; projective plane; disc | `F(p₁,p₂)`; `⟨a,b | [a,b]⟩`; `⟨c | c²⟩`; trivial | holds; SURFACES lines 3065 (p. 80), 3432 (p. 88), 3564 (p. 92) | none |
| §7.9 Malcev (sample) | `{x=1, y=1}` over `F(a,b)` | `x²ax²a⁻¹ = (ybyb⁻¹)²` has only the solution `(1,1)` | holds; IFT lines 469 (p. 11), 485–530 (pp. 11–12), 1081 (p. 25); Definition 7 is in §3 (line 432) | R02 |
| §8.6 discrimination (sample) | `⟨a,b,t | [a,t]⟩`, `w=[b,t]`; rank-2 extension; `u = 1` | `ξ_k(w) = [b,aᵏ] ≠ 1`; `t₁t₂⁻¹ ↦ 1`; `1 = 1²` excluded | holds; IFT lines 264–284 (pp. 6–7); VAR-II lines 129–143 (p. 4) | none |
| §8.8 towers (sample) | `x₁²x₂²x₃²`; `[x,a]=[x,b]=1`; `[u,v]=1` under `u^x u⁻¹=1` | carrier `F∗ℤ²`; `F₂×ℤ` vs radical `F₂`; `F∗ℤ³` omits `(1,a,b)` | holds; IFT line 6811 (p. 137); Form 2 is VAR-I line 982 (p. 29) | R02 |
| §11.1 lifts (sample) | `S = [x,y]` with squares; `S: x=1`, singleton family; empty family | one of `m,n,m+n` even, no square in `F∗ℤ²`; generic; `a=1` has no lift | holds; IFT lines 3025, 3070, 3120–3129 (pp. 65–67), 7008 (p. 141); LIFT pp. 224, 226 | none |
| §11.4 twist families (sample) | `[x,y]=[a,b]`, `K=3`, `J=2`; `(a,b,b,a)` | moves `y,x,y,y,x,y`, a palindrome; atoms `[a,b]`, `[b,a]` commute, `[a,b] ≠ 1` | holds; IFT lines 3168–3180 (p. 68), 4857 (p. 99), 5112 (p. 104) | none |
| §2.5 folding gloss | `e₁,e₂` labelled `a` from `u`, `b₁: w₁→u`, `c₂: u→w₂` | `cb` lies in `L(folded)` but not in `L(Γ)`; both subgroups contain `cb` | subgroup claim true, KM02 gloss false | R01 |
| §4.1 Check | `ℤ/2 ← ℤ → ℤ/2`, both mod 2; `ℤ → A` trivial, `ℤ → ℤ` identity | pushout `ℤ/2`, both embed; pushout `A`, `B` dies | Check false as worded | R03 |
| `fg_inf` | `⟨a²⟩∩⟨a³⟩`; `⟨a,bab⁻¹⟩∩⟨b⟩`; `α = ∅` | `⟨a⁶⟩`; `⊥`; trivial | true | none |
| `rank_sub_one_eq_index_mul` | `n=0`; `n=1`, `kℤ`; `n=2`, index 2 | `−1 = 1·(−1)`; `0 = k·0`; `3−1 = 2·1` | true | none |
| `rank_coprod` | `ℤ/2∗ℤ/3`; `F₂∗ℤ`; `G = 1` | `2=1+1`; `3=2+1`; `rank H = 0 + rank H` | true; `Nontrivial` unused | R04 |
| `IsFreelyIndecomposable` | `ℤ`; `1`; `ℤ/2∗ℤ/2` | yes; no (nontriviality); no | correct; no Checks at this head | R01 |
| `exists_isGrushkoDecomposition` | `1`; `ℤ`; `ℤ²∗F₂` | `p=q=0`; `p=0, q=1`; `p=1, q=2` | true, not vacuous | none |
| `IsGrushkoDecomposition.unique` | `ℤ/2∗ℤ/2` with `(⟨s⟩,⟨t⟩)` and `(⟨s⟩,⟨sts⟩)`; `ℤ` | `σ = id`, `g = s`; `q = 1`, since an infinite cyclic factor is excluded | true | none |
| `satisfiability_recursive` | `n=0`, `x≠1`; `[x,a]=[x,b]=1 ∧ x≠1`; `y∈⟨a⟩`, `y²=a²` | unsatisfiable; unsatisfiable; unique `y=a` | true, uniform in rank | none |
| `merzljakov` | `k=0`; `∀x∃y y=xa`; `n=1`, `S=[x,a]` | `S=1` on both sides; `q = xa`; true in `ℤ`, `[x,a]≠1` in `F(x,a)` | true; `2 ≤ n` needed and present | none |
| `isFullyResiduallyFree_centralizerExt` | `F(a,b)`, `u=a`; `u=a²`; `u=1` | `[b,t] ↦ [b,aᵏ] ≠ 1`; proper power excluded; `F₂×ℤ` excluded | true; `IsAdmissibleCentralizerStep` at `Basic.lean:468` | none |
| `isFinitelyPresented_of_fullyResiduallyFree` | `ℤ²`; `S⁺(2,0)`; `F₂×ℤ` | finitely presented; finitely presented; not fully residually free | true | none |
| `LyndonLength`, `IsFree` | `ℤ/2`, `l(s)=1`; word length, `g=a`, `f=ab`, `h=b` | (L5) `0<1` fails; `2c(a,ab)=2 > 0 = 2c(a,b) = 2c(ab,b)` | matches LENGTH (L1)–(L5) | none |
| `exists_free_lyndonLength` | `1`; `ℤ`, `l=|k|`; `F₂×ℤ` | `n=0`; `|2k|>|k|`; not commutative transitive, excluded | true, not vacuous | none |
| `IsRegularOrientable` | `[x,y][a,b]⁻¹`; `[x,y]=1`; `z₁⁻¹az₁z₂⁻¹bz₂z₃⁻¹az₃(aba)⁻¹` | clause `n=1, m=0, d≠1`; `κ=2`, not regular; `κ=4`, values `a,b,a` | matches §6.7 | none |
| `hasCompleteLift_of_isRegularOrientable` | genus 2, `T: [z,x₁]=1`, `W: z≠1`; `T: z=x₁y₁`; `Y = ∅` | lift `z = x₁ ≠ 1`; `z = x₁y₁`; `W ∉ R(S)` since `V(S) ≠ ∅` | true (IFT p. 67) | none |
| `hasCompleteLift_of_isRegularNonorientable` | `x₁²x₂²x₃²`; `x₁²⋯x₄²` at `(a,a⁻¹,b,b⁻¹)` | `κ=3`, not regular; `κ=4`, `[a⁻²,b²] ≠ 1`, regular | matches §6.7 | none |
| Docstring, unstatable | Mathlib `ModelTheory/Encoding.lean:32`; carriers at Tau Ceti `2fd255d` | Primcodable formulas are listed as a TODO; no JSJ-tree, `Hom`-diagram or NTQ carrier | correct | none |

- Source locators checked against the text: 85, in 10 sources: IFT 17, ALG 16, GL-JSJ 13, KM02 11, FOLD 10, VAR-II 6, VAR-I 4, SUBGROUPS 3, SURFACES 3, LIFT 2. Of the 15 sampled targets, 11 verify cleanly. §4.6 has a locator slip (R01), and so do §§5.6, 7.9 and 8.8 (R02).
- Library declarations: 41 names `#check`ed in a scratch file; 32 elaborate. The other 9 are Tau Ceti names in modules the file does not import, and I read them in the pinned source: `Characterization.lean:171`, `UniversalTheory.lean:125`, `GroupAlgGeom/Linear.lean:216`, `Irreducible/Basic.lean:120`, `PresentationComplex.lean:238`, `Schreier.lean:275`, `ResiduallyFinite.lean:42`, `ResiduallyP.lean:323,352`. I also opened `AlgebraicSet.lean:470–477`, `CentralizerExtension/Basic.lean:119,468`, `ResiduallyFree.lean:110` and `CSA.lean:41–227`.
- Cross-roadmap citations resolved: GraphConnectivityAndFlows Target 1.1 (main, lines 224–256) and Target 2.1 (lines 364–369). Every consumer citation resolves at this head: SurfaceTopology (§§2.1–2.2a, 6.0a–6.0d), NeronModelsAndSemistableAbelianVarieties (§2.2a), ArithmeticFuchsianGroups (§§6.0a–6.1a), AutomorphyLiftingBeyondTaylorWiles (§4.8) and NoncongruenceModularForms on main (§4.11).
- Gate rerun at this head: every check 0, OK (the worker's run also built the module, `build=0`), with no change outside the folder. Depcheck: `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and no other diagnostic. I compared the 26 elaborated signatures with the README statements; none loses a binder.
- One-tactic probe (`first | rfl | infer_instance | decide | trivial | (simp; done) | exact inferInstance`) closes none of the 12 theorems, so there is no padding.
- Merge test: `git merge-file` on this README, base `11a9d0f` and #2205 at `d31b59b`, gives 1 conflict, at line 903. Resolved with #2205's line, it leaves 20 hunks over `d31b59b`, all this pull request's own.
- Overlap check: read SurfaceTopology, RandomGraphs and GraphConnectivityAndFlows.
  - SurfaceTopology consumes §§2.1–2.2a and 6.0a–6.0d; the owner is this roadmap.
  - GraphConnectivityAndFlows owns the multigraph walks, components and forests that §§2.1a and 2.2a cite.
  - RandomGraphs shares nothing.
  - Searching open roadmaps and main for Stallings graphs, limit groups, Makanin, graphs of groups and Lyndon length finds no second owner.

## Not verifiable

- [TREES] Serre, *Trees* (cited with FOLD in §§2.1, 4.1–4.13): the Springer copy is paywalled, and the service records it as uncertified.
- [MAK] Makanin 1984 (cited in the sampled §7.9 and in §§7.2, 7.10): mathnet.ru timed out ("The read operation timed out"). §7.9 was checked through IFT pp. 10–12 and 25.
- [KM06] Theorem 32, p. 513 (§10.9): the Elsevier copy is paywalled.
- The description's other corrections it does not make (§7.4 D4 and ET2–ET5, §§7.4–7.5, §10.1a) were not adjudicated in this round. The README defers ET1–ET5 to IFT §5.1, and the `F(Z)` in its D4 display is not defined.

## Source issues

- **Error** in ALG at §3.1, Theorem 3, p. 32: the source says the Zariski topology on `H^n` is T1 for every `G`-group `H`; it should claim closedness only for points with coordinates in `G` (for `G=1`, `H=F₂`, the closure of `{a}` is `H`); affects a stated result.
- **Error** in KM02 at Lemma 3.4, p. 7: the source says one folding preserves `L(Γ,v)`, which Definition 2.7 makes a set of label words; it should say it preserves their freely reduced forms, since a fold can add the word `cb`; affects a stated result.
- **Error** in VAR-I at Theorem 2 and Corollary 1, pp. 7–8: the source says every nondegenerate triangular quasi-quadratic system has coordinate group inside iterated centralizer extensions; it should restrict to fixed-coefficient radicals, since `{[u,v],[u,x]}` over `F(a,b)` has reducible solutions; affects a stated result.
- **Misprint** in VAR-I at Definition 9, p. 7: the source takes nondegeneracy over the radical of `S_1, …, S_{i−1}`; it should be the radical of the lower levels `S_{i+1}, …, S_m`; affects nothing.
- **Misprint** in IFT at §2.5, Definition 1, p. 6: the source allows a commutation-free tuple to contain `1`, so the singleton `(1)` makes every group fail BP; it should require nontrivial entries; affects nothing.
- **Misprint** in IFT at §2.5, the theorem of [40], p. 7: the source writes `G(u,v)` and quantifies over every `w`; it should be `G(u,t)` and every nontrivial `w`; affects nothing.
- **Misprint** in IFT at §7.2, the display before Theorem 10, p. 104: the source defines `Ξ_{P,β}` with `φ_{2K,p}` while `P ⊂ ℕ^{JK}`; it should use `φ_{JK,p}`; affects nothing.
