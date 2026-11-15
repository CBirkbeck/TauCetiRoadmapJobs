# Repair of LieGroupsPartII design

The review REV-DESIGN-LieGroupsPartII~6 has five findings, all P3. Each was checked against:

- LieGroups on main (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` Layers 6, 7 and 9, and its `Suggested.lean`);
- RealSemisimpleLieGroups at the head of its open pull request, read with `roadmaps show`;
- the pinned Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.

All five findings are right, and all five are applied. Where the text written differs from the review's suggested wording, the reason is given below.

Only `packages/LieGroupsPartII/design/README.md` and `packages/LieGroupsPartII/design/plan.json` changed. `sources.toml` needed no change: the renumbering maps the set `2.2–2.6` in `knapp2002`'s `cited_for` onto itself, and `bourbaki-lie4-6` cites only 2.1. No new source is cited, no source was fetched and no request file was written.

There is no acceptance file at the design stage. So no Lean command was run, and no `#check` comparison was possible.

## F01 (P3) — applied

Old order of Layer 2: §2.3 Weyl groups, §2.4 component condition, §2.5 triples, §2.6 base `IwasawaData`, so §2.3 needed the later §2.6. New order: the base datum is §2.3, then Weyl groups §2.4, component condition §2.5, triples §2.6. Every `§2.x` citation, plan id, `target:` prerequisite and plan cross-reference is renumbered, and "How to read the build" is reordered.

Evidence and checks:

- Before the move, plan prerequisite 2.3 → `target:2.6` was the only forward edge. After it, a scan of all 33 plan targets finds no forward `target:` prerequisite. The new edges are exactly the review's test:
  - 2.3: 1.1;
  - 2.4: 1.1, 2.1, 2.2, 2.3;
  - 2.5: 1.1, 2.2, 2.4;
  - 2.6: 1.2, 2.2, 2.4, 2.5.
- Each `*Needs:*` range was recomputed rather than copied. For example:
  - §3.1 "§§2.1–2.4" became "§§2.1–2.2, 2.4–2.5";
  - §3.5 "§§2.4–2.6" became "§§2.3, 2.5–2.6";
  - the RealSemisimpleLieGroups §1.2 contract line became "§§2.1, 2.3, 2.5, 2.6, 4.1, 4.2 and 6.3".
- The citations of other roadmaps' sections were left alone: RealSemisimpleLieGroups §2.3, AutomorphicFormsOnReductiveGroups §2.3a and Wallach §2.1–2.2 keep their numbers.
- No other roadmap cites a Layer 2 id here. `roadmaps grep LieGroupsPartII` finds no section citation on main or at any open head. Two board packages name this roadmap: `SurfaceGroupCharacterVarieties/target.md` and `RealReductiveGroupsStructure/target.md`. Both cite it only for conjugacy of Cartan involution data (Layer 1), which is unaffected.

## F02 (P3) — applied

Old: four places said LieGroups Layer 9 proves `Ad(K)𝔞 = 𝔭` only "for the 𝔞 of an `IwasawaData`": Scope, the LieGroups contract, §2.2 and plan 2.2. New, in all four: "Layer 9 proves `Ad(K)𝔞 = 𝔭`; §2.2 proves the form under `K⁰`, the conjugacy of two maximal abelian subspaces and the factorizations." The contract now also says that Layer 9's restricted-root statements presuppose no `IwasawaData`.

Evidence:

- LieGroups README (main `1a19c9f`), lines 1354–1365: the paragraph "Restricted roots and KAK" proves `Ad(K)a=p`, the reflection representatives and chamber coverage. It has no `IwasawaData` hypothesis.
- LieGroups `Suggested.lean`: `chamber_normalizer_cover` is a field of `IwasawaData`. Under the restricted reading, §2.3 (formerly §2.6) would have needed that field in order to prove it, which is circular.

Pattern repair: plan 2.3 ("normalizer coverage is LieGroups Layer 9's chamber coverage") now says that coverage is stated for a maximal abelian `𝔞` of a `CartanInvolution` with no `IwasawaData` presupposed. §2.2 step 2 no longer says Layer 9's argument is for "the `𝔞` of an `IwasawaData`". No other Layer 9 attribution carries the restriction.

## F03 (P3) — applied

Old: §2.5 (formerly §2.4) asserted "axiom (v) ⇒ component condition" with no route, and its `*Needs:*` line lacked LieGroups Layers 6 and 7. New:

- a four-step proof sketch, the review's route made precise:
  1. the compact form `𝔲` and the polar decomposition of `Int(𝔰_ℂ)`;
  2. `Ad(n)` lies in `Int(𝔲)`;
  3. an `M⁰`-adjustment to a maximal torus;
  4. the free Weyl action on chambers;
- `*Needs:*` and plan 2.5 gain §1.1 and LieGroups Layers 6 and 7;
- two Checks.

The gap is real. On `O(4)`, the section's own Check, the condition holds while (v) fails, so the clause is not one of the equivalences. Its proof needs compact-group inputs that no `*Needs:*` line listed.

The sketch differs from the review's text in five places, each a correction inside the same route:

- **The conclusion.** The review concludes "`Ad(n)` fixes `𝔞`", but the element that fixes `𝔞` is `n' = mn`, after the `M⁰`-adjustment. The text now concludes `n' ∈ M` and then `n = m⁻¹n' ∈ M`.
- **The torus algebra.** `𝔱` is taken maximal abelian in `𝔪`. Because `𝔱 ⊇ 𝔷 ∩ 𝔨`, it is the Lie algebra of a maximal torus of `M⁰`, which Layer 6 needs. Then `𝔱_𝔲 = (𝔱 ∩ 𝔰) ⊕ i(𝔞 ∩ 𝔰)`. Its maximality in `𝔲` is proved in one clause: the `𝔨`-part lies in `𝔪 ∩ 𝔰` and commutes with `𝔱`, and the `i𝔭`-part lies in `i(𝔞 ∩ 𝔰)`.
- **The positive system.** The fixed positive system of the roots of `𝔱_𝔲` is defined explicitly, by `H₀ + εT₀`. Roots that do not vanish on `𝔞` restrict into `Σ`, and roots that vanish on `𝔞` are roots of `(𝔪_ℂ, 𝔱_ℂ)`, because `Z_𝔤(𝔞) = 𝔪 ⊕ 𝔞`.
- **The Cartan datum on `Int(𝔰_ℂ)`.** It comes from Layer 9's case of a connected semisimple group with finite centre. The conjugation `τ` is a Cartan involution of `(𝔰_ℂ)_ℝ`: writing `X = A + iA'` with `A, A' ∈ 𝔲`, `−B_ℝ(X, τX) = −2(B(A,A) + B(A',A')) > 0`. Its fixed group is connected because `Int(𝔰_ℂ)` is, so it is `Int(𝔲)`.
- **Layer 7.** Layer 7's compact-form construction is not needed, because `𝔲` is explicit. Layer 7 is cited for the complexification `𝔤 ⊗ ℂ` that the statement uses.

The LieGroups Layer 6 inputs were checked on main:

- `isConj_of_isMaximalTorus` (`Suggested.lean` line 266) and `weylGroup` (line 286);
- in the README (line 752), the identification with the root-pairing Weyl group, transitivity, and "the geometric Weyl action on chambers is free".

Pattern repair: LieGroups Layer 6 was added to Scope, to the LieGroups contract bullet, to the Layer 2 Dependencies and to the plan's supplier sections.

## F04 (P3) — applied

Old:

- §7.1 took "the base Cartan datum" from Layer 9;
- §3.1 asserted a datum on `L` with no model and no reductivity fields.

New:

- The §1.1 API states one reductivity criterion: if `ad` is closed under adjoints, then the algebra is its centre plus a semisimple derived algebra. It has a `𝔟` Check.
- §7.1 proves both fields with it.
- §3.1 names its model `π|_L : L → Z_H(dπ 𝔰)` and its fields.
- §5.1 and the `G⁰` restriction now name their fields too.

Evidence:

- `CartanInvolution` has the fields `reductive_compl` and `derived_semisimple` (LieGroups `Suggested.lean`, lines 493–501).
- Layer 9 (README lines 1201–1257) proves the polar theorem for a model. It states the centre ⊕ semisimple splitting only in its `GL_n` Check.

Why "applied" rather than "applied differently": the review's argument is used as written. It is stated once, as a general criterion in §1.1, so that §§3.1 and 7.1 cite one statement instead of two copies. The two cases are:

- `X' = −dθX` for `B_θ`, which follows from the invariance of `B`;
- `X' = Xᵀ` for `tr(XYᵀ)`, because `tr(⁅X,Y⁆Zᵀ) = tr(Y⁅Xᵀ,Z⁆ᵀ)`.

The §3.1 model was checked field by field:

- `L = π⁻¹(Z_H(dπ 𝔰))`, by naturality of `Ad` and injectivity of `dπ`;
- `Z_H(dπ 𝔰)` is transpose-stable, since `dπ(𝔭)` consists of symmetric matrices;
- it has finite components, because `H`'s polar decomposition restricts to it and the first factor `K_H ∩ Z` is compact;
- `ker π` is central, so it lies in `L`.

`*Needs:*` gains LieGroups Layers 2 and 9, and plan 3.1 gains `roadmap:LieGroups Layer 2`.

Ownership: no roadmap states this criterion.

- RealSemisimpleLieGroups §0.1 proves the version for a negative definite invariant form.
- RealSemisimpleLieGroups §0.4 assumes semisimplicity.
- `roadmaps grep` for transpose-closed or adjoint-closed reductivity finds nothing else.

This roadmap owns the criterion. Plan 1.1 gains the API item `reductive_of_adjoint_closed`, but this is not a Lean name: there is no Lean file at the design stage, and the README does not backtick it.

## F05 (P3) — applied

Old: `dynamicParabolic` used a "bounded" set, through `Bornology.IsBounded`. New:

- §7.2 and plan 7.2 use entrywise boundedness: `∃ C, ∀ t ≥ 0, ∀ i j, |(exp(−tX) g exp(tX)) i j| ≤ C`.
- The Mathlib contract says that `Matrix` has no `Bornology` instance at the pin.
- `Bornology.IsBounded` is removed from the §7.2 `*Needs:*` line, the Layer 7 Dependencies and plan 7.2.
- Two Checks are recomputed.

Evidence at the pin:

- `Mathlib/Analysis/CStarAlgebra/CStarMatrix.lean:733` reads "we are missing `Bornology (Matrix m n A)`".
- In `Mathlib/Analysis/Matrix/Normed.lean`, the matrix norms are definitions given only scoped or local instance attributes (lines 75–215).
- `Filter.Tendsto` in `dynamicUnipotent` still elaborates, because `Mathlib/Topology/Instances/Matrix.lean:48` gives `Matrix` a topology.

Plan 7.2d never listed `Bornology.IsBounded`, so nothing was removed there.

## Adversarial mathematics pass (changed or added statements)

Notation: `d = diag(1, −1)`, `Y = ((0,1),(1,0))` in `O(1,1)`, and `⟨X,Y⟩ = tr(XYᵀ)`.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 reductivity criterion | `𝔤𝔩_2` with `⟨,⟩`; `0`; abelian `ℝ²`; `𝔰𝔬(3)` with `−B` | `⟨[E₁₂,E₂₂],E₁₂⟩ = tr(E₁₁) = 1 = ⟨E₂₂,[E₂₁,E₁₂]⟩ = tr(E₂₂)`; `⟨1, X⟩ = tr X = 0` on `𝔰𝔩_2`, so `𝔷 ⊥ [𝔤,𝔤]`; zero/abelian: `ad = 0 = ad 0`, `𝔷 = 𝔥`, derived `0`; `𝔰𝔬(3)`: `(ad X)* = ad(−X)`, centre `0` | Holds | Added |
| criterion, non-examples | `𝔟` upper triangular; Heisenberg `𝔥₃` | `𝔟`: `(ad E₁₂)*E₁₂ = E₂₂ − E₁₁ ∉ ad(𝔟)E₁₂ ⊆ ℝE₁₂`; complement of `ℝE₁₂` = diagonal, `[E₁₂, diag(1,0)] = −E₁₂`; `𝔷 ⊕ [𝔟,𝔟]` has dim 2 < 3. `𝔥₃`: `⟨(ad x)*z, y⟩ = ‖z‖² ≠ 0` while every `ad x'` kills `z` | Hypothesis fails exactly where the conclusion fails | Check added |
| criterion, mis-stated control | unitriangular `ℝE₁₂` | 1-dim abelian: `(ad E₁₂)* = 0 = ad 0`, reductive | My first plan 7.1c test said it fails the criterion; false | Plan test corrected; README §7.1 Check added separating polar failure from reductivity |
| §1.1 restriction to `G⁰` | `O(1,1)`; `ℝ^×` | `𝔤 = ℝY` = centre ⊕ 0; `K⁰ = {1}` compact; `ℝ^×`: `𝔤 = ℝ`, `K⁰ = 1` | Fields are those of `C` | Clause added |
| §3.1 model `L = π⁻¹(Z_H(dπ𝔰))` | `GL_3`, `𝔰 = ℝ·diag(1,1,−2)`; `SL_2` with `π` onto `SO₀(2,1)`, `𝔰 = 𝔞`; `O(1,1)`, `𝔰 = 𝔞`; `𝔰 = 0` | `Z_H = GL_2 × GL_1`, `2·2 = 4` components, `dim 𝔩 = 5 = 2 + 3`, centre `ℝdiag(1,1,0) ⊕ ℝdiag(0,0,1)`, derived `𝔰𝔩_2`; `Z_H(dπ𝔞)` = image of the diagonal `≅ ℝ_{>0}` (1 component), `L = {diag(a,a⁻¹)}` (2 components), `ker π = {±1} ⊆ L`; `Z_H(Y) = {±exp(tY)}`, `K_H ∩ Z = {±1}`; `L = G`, `Z_H = H` | Holds | Added |
| §3.1, role of symmetry | `GL_2`, non-symmetric `E₁₂` | `Z(E₁₂) = {aI + bE₁₂}`, transpose `{aI + bE₂₁}` ≠ it | Transpose stability needs `dπ𝔰` symmetric, which `𝔰 ⊆ 𝔭` gives | — |
| §5.1 `⁰L` fields | `GL_n` (`n ≥ 2`); `ℝ² ⋊ C₂`; `ℝ^×` | `Lie = 𝔰𝔩_n`: centre `0`, derived `𝔰𝔩_n`; `Lie = V₀ = {(v,−v)}`: centre `V₀`, derived `0`; `Lie = 0` | Holds | Clause added |
| §7.1 fields | `GL_n` (`n ≥ 1`, `n = 0`); `SL_2`; upper triangular of `GL_2` | centre `ℝ·1`, derived `𝔰𝔩_n`; zero algebra; centre `0`, `𝔰𝔩_2` semisimple; 4 components, `𝔟` fails both fields | Holds; control fails as it must | Added |
| §2.5 axiom (v), route | `GL_2`, `n = diag(−1,1)`; `SL_2(ℂ)` real; `ℝ^×`; `SO(2,1)` | `𝔪 = 0`, `𝔱_𝔲 = iℝd`, `Ad(n)d = d`, `n ∈ M`; `𝔱 = iℝd`, `𝔱_𝔲` 2-dimensional in `𝔰𝔲(2)⊕𝔰𝔲(2)` (rank 2); `𝔰 = 0`, `Ad` trivial, `n ∈ M = K`; `N_K(𝔞) = {diag(a,b,ab)}` acts on `𝔞` by `a`, stabilizer of `Σ⁺` = `{diag(1,b,b)}` = `M` | Holds | Added |
| §2.5 axiom (v), negative | `O(1,1)`; `O(4)` | `Int(ℂY) = 1`, `Ad(d) = −1`: (v) fails, condition fails; `O(4)`: (v) fails, condition holds | Consistent with "strictly weaker" | Check added |
| §2.5 step 1 (`τ` is Cartan) | `𝔰 = 𝔰𝔩_2(ℝ)` | `𝔲 = 𝔰𝔬(2) ⊕ i·Sym₀ = 𝔰𝔲(2)`; Killing on `𝔰𝔲(2)` negative; `−B_ℝ(X,τX) = −2(B(A,A)+B(A',A')) > 0` | Holds | — |
| §7.2 entrywise boundedness | `GL_2`, `X = diag(1,0)`; skew `X`; `X = 0`; products | entries `a, e^{−t}b, e^{t}c, d`, bounded by `max(|a|,|b|,|d|)` iff `c = 0`; rotation conjugates have entries `≤ ‖g‖_op ≤ ‖g‖_F ≤ 2·max|g_ij|`; constant `g`; `|(AB)_ij| ≤ n·max|A|·max|B|` keeps the subalgebra claim | Holds | Definition and Checks rewritten |
| Layer 2 order (F01) | all 33 plan targets | position of every `target:` prerequisite is before its target | No forward edge | Renumbered |
| Layer 9 citation (F02) | LieGroups README 1354–1365 | no `IwasawaData` hypothesis | Coverage citation in §2.3 is not circular | Wording repaired |

## Check outcomes

Dependency gate, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

Other checks:

- **Citations.** `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name found nowhere. That run did not check names outside TauCetiRoadmap, so the new names were opened by hand:
  - Mathlib `Bornology` (`Topology/Bornology/Basic.lean:52`) and the two Mathlib files named in the contract;
  - the LieGroups names `isConj_of_isMaximalTorus`, `weylGroup`, `cartan_polar_decomposition`, `FiniteCartanMatrixModel` and `chamber_normalizer_cover`.
- **Plan.** `plan.json` parses. It has 33 targets, every `target:` prerequisite exists, and every prerequisite points backwards.
- **Lean.** There is no acceptance file at the design stage, so there was no elaboration and no `#check` comparison.

## Ownership and maintainer notes

- **Renumbered ids.** In Layer 2, 2.6 → 2.3, 2.3 → 2.4, 2.4 → 2.5 and 2.5 → 2.6. Plan target names are unchanged. No roadmap on main, at an open head or in the board's packages cites these ids.
- **New supplier section.** LieGroups Layer 6 (main) is newly consumed, by §2.5. It is a section of the existing supplier, so the gate output is unchanged.
- **Ownership.** The reductivity criterion (§1.1 API) is owned here; the search is described under F04. Ownership against open pull requests was checked with the tool's index of the 475 open roadmap pull requests.
- **Not acted on.** The review's non-finding on the `knapp2002` locator (Ch. VII §5 against Propositions 7.32–7.33 in §2) was not acted on: the book is uncertified and its text was not read. The three human-reviewer items (merge-order placement after RealSemisimpleLieGroups, the source-arrangement question and the ownership note) were not acted on either.
- **Suspicious text.** The review contains no instruction-like text.
