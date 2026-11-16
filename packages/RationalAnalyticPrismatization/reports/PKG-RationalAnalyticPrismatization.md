# PKG-RationalAnalyticPrismatization

Package of the accepted design of `RationalAnalyticPrismatization` (accepted after REV-DESIGN~17 and FIX-DESIGN~18; both P3 findings of that review are applied in the design text this package starts from: 11.9 is stated for every pro-étale G-torsor, and the third Check of 8.5 keeps one radius coordinate).

Files written: `packages/RationalAnalyticPrismatization/README.md` (2149 lines, 13 layers, 93 subsections), `packages/RationalAnalyticPrismatization/Suggested.lean`, `packages/RationalAnalyticPrismatization/metadata.toml` (`topic = "math.AG"`, as PerfectoidSpaces, CrystallineCohomology and AdicSpacesPartIII on main), `packages/RationalAnalyticPrismatization/sources.toml`, the `gaps` list of `packages/RationalAnalyticPrismatization/design/plan.json` (it keeps all 21 gaps of the accepted design, every one of which a target of the plan names as a prerequisite; the only change is the sharpened `needs` sentence of `proetale-v-comparison`; checked by comparing every top-level key with the accepted file: only `gaps` differs, and only in that sentence), and this report. No source was fetched and no `needs-references.toml` was written: every cited text is in the manifest and in the sources cache.

## Headline theorems

None is statable at the pins; `Suggested.lean` states nothing and its module docstring names each one with what it lacks.

| Headline (README) | Status | What the pins lack |
|---|---|---|
| Comparison with the relative Fargues–Fontaine curve, `α_X: FF_{X^⋄} → X^{Div¹}` 0-proper, `O ≅ α_*O`, Perf-equivalence over Berkovich-étale `Y` (11.6, with 11.1 and 11.4) | not statable | Gelfand stacks, `X^{Div¹}`, `FF_{X^⋄}` as a Gelfand stack, 0-proper maps, perfect complexes on Gelfand stacks |
| Pro-étale cohomology as twistor cohomology (11.7) | not statable | `X^{Div¹}`, coherent cohomology of Gelfand stacks, pro-étale and v-cohomology of rigid spaces |
| Hodge–Tate stacks with arithmetic and geometric Sen operators and the inverse Faltings' extension (11.2, 11.5, 11.8) | not statable | `X^HT`, cotangent complexes of Gelfand stacks, Cartier duality of analytic vector groups |
| Decompletion and locally analytic torsors with their Sen operators (10.12, 11.9, 11.10) | not statable | Berkovich spaces as Gelfand stacks, `G^cont`, `G^la`, `G^sm`, Betti realization, `X^HT` |
| Twistor duality: `Div¹` smooth with dualizing complex `O{1}[2]`, `f^{Div¹,!}O ≅ O{d}[2d]`, duality for smooth proper maps (12.2–12.4) | not statable | six-functor formalisms on Gelfand stacks, `Div¹`, the Breuil–Kisin twist |
| Prismatic first Chern class and projective bundle formula (12.5) | not statable | `X^Δ`, animated abelian group stacks over it, pushforward along `f^Δ` |
| Formal Hodge–Tate stacks and Scholze's Riemann–Hilbert functor (12.6) | not statable | formal cones and formal Hodge–Tate stacks, the period sheaves `OB_dR,X`, `B⁺_pdR,X` |

Mathlib at the pin has `LightCondensed`, `CondensedMod.IsSolid` (condensed, not light), quasicategories and continuous group cohomology, and Tau Ceti has the adic Fargues–Fontaine space `TauCeti.FarguesFontaine.spaX` as a topological space; none of these is a carrier of the statements above. Lazard's criterion (10.4) is statable for functions on ℤ_p^d but is a tool of Layer 10 and names none of the roadmap's objects, so it is not a headline and is not stated.

## What changed relative to the design, and why

1. **Gestalten are owned here (new Layer 0).** The design consumed Gest Definitions 6.5, 6.12 and Propositions 6.6, 6.13, 7.9, 9.5, Corollary 9.8 through two contracts with supplier `none` (`gestalten-affine-proper`, `gestalten-transmutation`); the accepting review flagged acceptance as conditional on an owner. A search by object (`roadmaps grep -i` for Gestalt, Stefanich, presentable (∞, 2), 2Pr, 1-affine, Campion, Gabriel–Ulmer, ambidexterity, transmutation over main, the 454 open pull-request heads and the board packages) finds no owner: AnalyticStacks (open head, README line 22) excludes Gestalten from its scope and names none. A gap needs a supplier roadmap, and an unowned prerequisite leaves an item in no layer, so the package states the theory as Layer 0 (0.1 higher presentable categories, Stefanich rings and Gestalten; 0.2 n-affine maps; 0.3 n-prim and n-proper maps; 0.4 n-suave and n-étale maps, ambidexterity, surjectivity and descent; 0.5 transmutation), with locators to Gest Lectures II, III, VI–IX and ALRS Construction 2.1.2, each subsection with API laws, at least three Checks and a *Needs:* line. Only what 2.2, 2.7, 10.3, 12.1 and 12.2 use, and the inputs of the stated proof routes (Gabriel–Ulmer, the ambidexterity criterion, the surjectivity criterion), are stated; Gest Theorem 7.1 (the topos of n-étale Gestalten) is not needed and not stated, and 2.2 now asks for a conservative functor preserving κ-small colimits and finite limits, which is what Gest Corollary 9.8 and ALRS Construction 2.1.2 give, instead of "a morphism of ∞-topoi". The two gap entries stay declared in `plan.json`, where targets of the plan name them as prerequisites; their supplier is `none`, so nothing is announced for them, and the README states their content as Layer 0 rather than as a supplier contract.
2. **The 18 AnalyticStacks gaps are cited by section in the README.** At its open head AnalyticStacks states each of them (read: §§0.5–0.6, 0.8–0.13, 1.6–1.7, 2.3, 2.11, 3.2–3.3, 3.6, 3.8, 4.1–4.5, 5.1–5.3, 6.3–6.6, 7.2, 7.5–7.7), and its consumer note maps every slug to those sections. They stay declared in `plan.json`, where targets of the plan name them as prerequisites; in the README each contract is a bullet of the AnalyticStacks supplier subsection with what is assumed and the source passages, and every reference to a contract (63 single references in *Needs:* lines and Dependencies, eight list-form Dependencies lines and twelve mentions in prose) now names the AnalyticStacks section.
3. **One gap is not yet stated by its supplier:** `proetale-v-comparison` on DiamondsAndVStacks §D6.5 (on main: §D6.5 is the étale-site comparison only, and no roadmap on main or in an open pull request states the pro-étale/v comparison with p-adic coefficients). Its `needs` sentence is sharpened (complete nonarchimedean extension K of ℚ_p; integral and rational forms) and appears verbatim in the DiamondsAndVStacks subsection as `What DiamondsAndVStacks must provide (gap:proetale-v-comparison): …`. The "Declared gaps" subsection is deleted.
4. **Supplier facts corrected at the pins.** (a) `BDeRhamPlus` and `WittVector.fontaineTheta` take an integral ring R, p-adically complete with `¬IsUnit p` (`#check` at the pin); the design said they are used for "the ℚ_p-algebras", in which p is a unit. The contract now says they are applied to A° of the nonzero perfectoid ℚ_p-algebras A. (b) Tau Ceti now has Amice's basis map `TauCeti.AnalyticStage.amiceMap` (TauCeti/NumberTheory/Padics/Distribution/Amice/Basis.lean:494), contractive, with Amice's theorem (isometric isomorphism) stated there as not proved; the Tau Ceti contract cites it. (c) Mathlib's `CondensedMod.IsSolid` (Mathlib/Condensed/Solid.lean:83) is recorded as the non-light solidity predicate, not used.
5. **Smaller edits.** Summary, Scope and How to read mention Layer 0; Conventions gain a Gestalten paragraph (κ of the Conventions, the source's ℵ₁ read as κ, indexing O(X)_n); "Layers 1–7 form a self-contained interface" becomes "Layers 0–7"; 10.3 needs §0.4 (Gest Proposition 7.9 in its route) and Layer 10 depends on Layers 0–7; Gest references in 2.2, 2.7, 10.3, 12.1, 12.2 also cite the Layer 0 subsection; the References entry for Gest describes Layer 0. The design's text otherwise stands: 623 of the 627 `statement` strings of `plan.json` occur verbatim in the README, up to the code-span backticks of item 6; the four that differ are the 2.2 statement and its third API bullet (Layer 0 references, the transmutation phrasing), and 4.5 and 5.1 (contract name replaced by the AnalyticStacks section).
6. **Notation.** The README wrote sub- and superscripts in TeX form (`ℚ_{p,■}`, `X^{Div¹}`, `Hom_{K_D}(…)`) in running prose: 1935 occurrences of `_{` or `^{` outside code spans, on 479 lines. Each expression carrying one is now a code span, as the roadmaps on main write such mathematics (1527 spans; an expression is the maximal formula token around the brace, extended to matching parentheses, and two such tokens joined by a single relation or operator symbol form one span). The edit only inserts backticks: removing every backtick from the new README gives the previous text exactly, so no statement, locator or heading changed (heading slugs are unaffected; no heading carried a brace).
7. **Manifest.** `cited_for` of every entry is recomputed from the README sections that cite it (no "Design", "Final targets", "Risks" or contract slugs); the Gest locator lists the statements Layer 0 restates; three `version_note` strings no longer speak of "the design" or of an "unowned prerequisite". No entry was added; all 24 are `certified`.

## What the README could not support

Nothing is left unstated. 11.7's last isomorphism rests on the DiamondsAndVStacks gap above. The README states no Lean name of its own: `Suggested.lean` declares nothing, and every backticked name in the README is a Mathlib, Tau Ceti or supplier declaration (`Spectrum` of TropicalAndBerkovichArithmetic, `Huber.GelfandSpectrum` of AdicSpacesPartIII, declared at AdicSpacesPartIII/Suggested.lean:798 in namespace `Huber`).

## Notions moved down

None from a later roadmap. Layer 0 is not a move from a later roadmap; it is a prerequisite that no roadmap owned (item 1).

## Duplication sweep and removals

By object, against main, the open pull-request heads (`roadmaps grep`), the board packages and the pins:

- Removed from the README: the 18 AnalyticStacks contracts as separate declared contracts (each is a citation of the AnalyticStacks section that states it) and the two unowned Gestalten contracts (stated here as Layer 0) (items 1–2); all twenty stay declared as gaps in `plan.json`, whose targets name them. No target of the design duplicates another roadmap, so no target was deleted.
- Kept variants, each saying how it differs: AnalyticStacks §7.3 defines 1-suave, 1-étale, 0-suave and 0-prim maps of commutative algebras in V-linear κ-presentable categories (the two-level case, RC26a Definition 2.5.1); Layer 0 defines these at every level for Stefanich rings, which the transmutation needs, and a Check of 0.4 compares the two on Spec ℤ[T] → Spec ℤ. ChromaticHomotopyTheory's ambidexterity concerns local systems over spaces and LocallyPresentableCategories' Gabriel–Ulmer duality is 1-categorical; neither is the statement of 0.1 or 0.4.
- Pins: Mathlib has no Gelfand rings, analytic rings, presentable ∞-categories, six functors or Stefanich rings; Tau Ceti's "Berkovich" hits are rank-one points of `Spa` (Spa/RankLeOne.lean), its "Gelfand" hits are Gelfand–Tsetlin and C*-algebra files, "Prism" hits are singular-homology prisms, "deRham" hits are manifold de Rham cohomology, "Nuclear" hits are nuclear operators, and there are no Sen operators, locally analytic vectors, Hyodo–Kato or twistor objects. The objects found (amiceMap, `CondensedMod.IsSolid`) are cited, not restated.
- Ownership against open pull requests: checked through `roadmaps grep` over all open heads and the AnalyticStacks head read in full where cited; `scratch/overlaps.md` lists no pull request that changes this roadmap or drops an id it cites. The AnalyticStacks consumer note still maps this roadmap's former contract slugs (and a slug `hypercover-inversion` the design no longer used) to its sections; it matches the gaps `plan.json` still declares, and it is AnalyticStacks' text.

## Adversarial pass (statements written or changed)

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.1 Pr^L_κ ∈ Pr^L_κ, size cutoff | functors out of Ani | in Pr^L_κ: Hom(Ani, C) = C^κ, small; in all of Pr^L: Hom(Ani, C) = C, not small | holds; Check added | — |
| 0.1 CAlg(C) → CAlg(Mod_C(Pr^L_κ)), End(1) | C = D(k); A = 0; A = ℚ_p[x] | End_{Mod_{D(k)}(1Pr)}(1) = Fun^L_{D(k)}(D(k), D(k)) = D(k) = A_1; with A_2 = 1Pr instead, End(1) = Ani ≠ D(k); Mod_0 = 0, End = 0; End of unit of D(ℚ_p[x]) = ℚ_p[x] | holds; wrong model excluded | — |
| 0.1 module categories and tensor products | ℚ_p[x] ⊗_{ℚ_p} ℚ_p[y] | tensor of categories: End(1) = ℚ_p[x, y], a domain; product of categories: ℚ_p[x] × ℚ_p[x], not a domain | distinct, as the Check says | — |
| 0.1 terminal Stefanich ring | (∗, ∗, ∗, …) | Gestalt ∅, initial (Gest line 2523) | holds | — |
| 0.2 n-affine, D(R) → D(S) | S an R-algebra; S = 0 | (B/A)_0 = S, B_1 = Mod_S(D(R)) = D(S); S = 0: B_1 = 0 = Mod_0(D(R)), the empty Gestalt, 0-affine | holds | — |
| 0.2 empty Gestalt over the absolute base | Gest §8.2 | A_0 = ∗ for both ∗ and ∅, so not 0-affine; 1-affine; over D(k) 0-affine with (B/A)_0 = 0 | holds; consistent with the previous row | — |
| 0.2 Warning 6.7 | ∗ → B²G_m over k | A_1 = B_1 = D(k), (B/A)_0 = k: Mod_k(D(k)) = D(k) = B_1 at m = 0; 0-affine with unit relative algebra would force B = A, but ∗ ≠ B²G_m | condition at level n alone insufficient | Check |
| 0.2 stability | ⋃_n A^n | terms 0-affine, union not n-affine for any n (Gest line 1700) | limits yes, colimits of Gestalten no | Check |
| 0.3 κ-presented 0-affine ⇒ 0-proper | k[x] over k | pushforward D(k[x]) → D(k) forgetful: D(k)-linear, preserves colimits; diagonal k[x, y] → k[x] 0-affine; further diagonals identities | holds | — |
| 0.3 primness and diagonals | X = A¹_k (char 0); X = point | base change of Δ_{X^dR} is (X × X)^∧_Δ → X × X; pushforward (M_n) ↦ lim_n M_n; for M^i_n = k[x, y]/(x − y)^n, i ∈ ℕ, lim_n ⊕_i M^i_n ∋ Σ_i (x − y)^i e_i ∉ ⊕_i lim_n M^i_n; X a point: identity | not colimit-preserving, so not 0-prim; point excluded | Check needs positive dimension (source says "a variety") |
| 0.3 n-prim ⇒ (n+1)-prim | definition | conditions for m ≥ n + 1 include m ≥ n + 2 | holds | API bullet |
| 0.4 A¹ not 0-suave | k[x] over k | (x^i)_{i∈ℕ} ∈ ∏_i k[x] has unbounded degree, not in (∏_i k) ⊗ k[x] = ⊕_n (∏_i k)·x^n | base change does not preserve products, no left adjoint; A¹ is 1-étale only (Gest §8.6) | Check |
| 0.4 P¹ | A¹ ⊔_{GL₁} A¹ over D(k) | Γ(O) = k; 0-affine would make P¹ the point; diagonal 0-affine; 1-étale (Gest §8.8) | not 0-affine; locality on target only | Check |
| 0.4 comparison with AnalyticStacks §7.3 | Spec ℤ[T] → Spec ℤ | right adjoint of restriction Hom(ℤ[T], −) = ∏_ℕ(−), ⊕ not preserved; 0-prim: restriction is a D(ℤ)-linear colimit-preserving right adjoint of f^* | same verdicts at level two (0-prim, not 0-suave); full equality of 0-suave not claimed | Check |
| 0.5 point formalism | C = point, D(∗) = V | Corr(C) = point, K_D = Mod_V(1Pr), [∗]_D = Gest(V); V = Ani gives the final Gestalt | holds | Check |
| 0.5 finite sets | D(X) = D(Λ)^X, fold map {1, 2} → ∗ | D(Λ)^X ⊗_{D(Λ)} D(Λ)^Y = D(Λ)^{X×Y}; f_* = f_! = ⊕ on D(Λ)², adjoint on both sides to the diagonal; 0-truncated; f_*1 = Λ × Λ, D(Λ)² = Mod_{Λ×Λ}(D(Λ)) | 0-étale, 0-proper, 0-affine | Check |
| 0.5 Künneth case, 0-affineness | P¹ over k in QCoh | Künneth holds, Γ(O) = k, D(P¹) ≠ Mod_k(D(k)) | "every [X]_D is 0-affine" is false | restricted to D(X) ≅ Mod_{f_*1}(D(∗)) |
| 0.5 empty cover | X = AnSpec(0), AnSpec(ℚ_p) | D(0) = 0: ∅ = ∅; D(ℚ_{p,■}) ≠ 0: empty family not a cover | holds | Check |
| 2.2 transmutation of Gelfand stacks | affinoid GSpec(R), R = ℚ_p⟨T⟩, R = 0; open disc | Künneth D(B ⊗_A C) = D(B) ⊗_{D(A)} D(C) (AnalyticStacks §2.3(7)) gives [∗]_D = Gest(D(ℚ_p)); D(R) = Mod_R(D(ℚ_{p,■})) gives 0-affine with relative algebra R; R = 0 gives ∅; open disc: f_! ≠ f_*, not 0-proper | holds; "morphism of ∞-topoi" replaced by what Corollary 9.8 gives | statement |
| Conventions, κ | Gest line 955–956; ALRS line 704–705 | Gest fixes κ = ℵ₁; ALRS fixes any uncountable regular κ and replaces "countable" accordingly; Gest line 2271–2273 describes the same replacement | consistent | paragraph |
| `BDeRhamPlus` input | R = O_{C_p}; R = C_p; R = 0; R a nonzero perfect 𝔽_p-algebra | ¬IsUnit p holds; p a unit, instance not available; 0 = 1 so p a unit, excluded; p = 0 not a unit, `BDeRhamPlus` = 0 | design text wrong (ℚ_p-algebras) | contract |
| `TauCeti.AnalyticStage.amiceMap` | h = 0, c = e·δ₁ | m_0(1) = 1! = 1, image x·e, evaluation x ↦ x e; ‖amiceMap c‖ ≤ ‖c‖ (`norm_amiceMap_le`) | holds; isometry not proved at the pin | contract |
| Gap proetale-v-comparison | X = Spa(ℚ_p); X = ∅; integral H² | both sides RΓ(Gal_{ℚ_p}, ℚ_p): dimensions 1, 2, 0, χ = −1; ∅: 0 = 0; H²(Gal_{ℚ_p}, ℤ_p) = 0 for p odd and ℤ/2 for p = 2, dying after inverting p | holds | `needs` sentence |
| 10.3 needs §0.4 | route | the route checks 0-properness after pullback along GSpec(ℚ_p) → BG^la with Gest Proposition 7.9 | dependency was missing | *Needs:* |

Rows of the design's own statements that are unchanged rest on the computed rows of the design rounds (REV-DESIGN~12 to ~17); they were not recomputed here.

## Checks run

**Elaboration.** `lake env lean packages/RationalAnalyticPrismatization/Suggested.lean`, run from the content checkout: exit 0, no output — 0 `sorry` warnings, no other message. The file is `module`, `import Mathlib`, the module docstring and the empty namespace `TauCetiRoadmap.RationalAnalyticPrismatization`; no `TauCeti.*` import, no `set_option`, no declaration.

**`#check` pass.** `Suggested.lean` declares nothing, so there is nothing of its own to compare. A scratch file with `#check @CondensedMod.IsSolid`, `@LightCondensed`, `@LightProfinite`, `@MulRingSeminorm`, `@spectralNorm`, `@WittVector.fontaineTheta`, `@BDeRhamPlus`, `@PadicComplex`, `@PadicInt.mahlerEquiv` elaborated against the pin; the signatures of `WittVector.fontaineTheta` and `BDeRhamPlus` (`[Fact ¬IsUnit ↑p]`, `[IsAdicComplete (Ideal.span {↑p}) R]`) led to change 4(a). Every Mathlib and Tau Ceti declaration the README cites was opened at the file and line it gives (21 of them, including the Tau Ceti Fargues–Fontaine declarations): all match.

**Structure (scripted).** 93 subsections, each with at least three Checks and a *Needs:* line; 13 layers, each ending with Examples and Dependencies; no fenced block; no LaTeX delimiters, no TeX-only `_{` or `^{` outside code spans, no machine paths, pull-request numbers or process words (the gate's README text scanners, run through the tool's own `scan_folder` on the README and `Suggested.lean`, count 0 in every category, `tex` included); the plan check (`plan_change_problems` against the accepted `plan.json`) reports nothing, and the 21 gap slugs targets name as prerequisites are exactly the 21 declared; the gap line in the README equals the `needs` sentence in `plan.json`.

**Citations.** `roadmaps resolve` on the README: one lead, "MotivesAndAlgebraicCyclesPartII Layer 0", which is the board package `packages/MotivesAndAlgebraicCyclesPartII/README.md` (Layer 0 at its line 100, §0.4 at line 150), in the merge order at line 407; no Lean name found nowhere.

**Dependency check** (`gate --depcheck … --movable --content …`):

```
depcheck: 243 roadmaps, 2290 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 408, right after MotivesAndAlgebraicCyclesPartII; its suppliers (AnalyticStacks at line 355, the others earlier or on main) are all above it.

## Untrusted text

No fetched or read text contained instructions; nothing to report.

## For the worker

- `plan.json` declares the accepted design's 21 gaps and adds none: the 18 AnalyticStacks gaps are stated at the AnalyticStacks head and mapped by its consumer note (its README line 1304), the two Gestalten gaps have supplier `none` and are stated here as Layer 0, and `proetale-v-comparison` on DiamondsAndVStacks §D6.5 is the one gap its supplier does not yet state (its `needs` sentence is sharpened, not new).
