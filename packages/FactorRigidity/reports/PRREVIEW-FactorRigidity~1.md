# Review of FactorRigidity (pull request #876 at 00c5ce8)

**Verdict:** needs changes

The gate fails on this head (`imports`, `mathlib-subimports`, `no-import-mathlib`, `prnum`), so the folder cannot be accepted whatever else holds. Beyond the gate there are two blocking findings: `Suggested.lean` states no headline theorem although two of the roadmap's headlines are statable at the pins, and the finite-module descent lemma of R8 is stated without the hypothesis that makes it true. The mathematics of R1–R10 is otherwise sound against the sources I could read; the sampled locators into Anantharaman–Popa and the three Popa papers all check, with one wrong theorem number.

## R01 (P2) — `Suggested.lean` states no headline theorem; statable headlines are absent

Location: `TauCetiRoadmap/FactorRigidity/Suggested.lean` lines 16–22 (module docstring: "These are suggested forms … The joint-action and matrix-witness prototypes below pin algebraic conventions") and lines 28–151.

Claim: the file is an API prototype (four structures/definitions, five proved API theorems, one sorried lemma `cp_traceTwoNorm_le`), not the acceptance test. It states none of the roadmap's headline theorems and its docstring does not say which headlines are not statable or what each lacks.

Witness: the README's headlines are (a) relative property (T) of `(ℤ²⋊SL₂(ℤ), ℤ²)` and of `(ℤ²⋊G, ℤ²)` for nonamenable `G ≤ SL₂(ℤ)` (R3); (b) the Haagerup property of `F_n`, `2 ≤ n ≤ ∞` (R4); (c) `F(L(ℤ²⋊F_n)) = {1}` (R7); (d) Bernoulli strong rigidity (R9); (e) solidity and primeness of `L(F_n)` (R10). Headlines (a) and (b) are statable at the pins: `ContRepresentation ℂ Γ H` (Mathlib `RepresentationTheory/Continuous/Basic.lean` line 54) with `TauCeti.ContRepresentation.IsUnitary` (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean` line 52) carries unitary representations of a discrete group, `Matrix.SpecialLinearGroup (Fin 2) ℤ`, `SemidirectProduct` and `FreeGroup (Fin n)` exist, and almost-invariant vectors, `H`-invariant vectors, positive-definite functions and the `c₀` condition are predicates with real bodies on these carriers. Neither is stated. Headlines (c), (d), (e) are not statable (no group von Neumann algebra with its trace, no crossed product, no amplification `M^t`, no spatial tensor product of von Neumann algebras at the pins), and the docstring does not say so.

The one sorried statement, `cp_traceTwoNorm_le` (line 77), is a standard lemma of R4 (the subunital Schwarz/L² contraction), not a headline, and it is stated at a different generality from the README: `τ : M →P[ℂ] ℂ` is any positive functional (the README has a faithful normal tracial state), `φ` ranges over all CP maps on a C*-algebra (the README has normal CP maps on a tracial von Neumann algebra). The statement is true as written (Kadison–Schwarz gives `φ(x)*φ(x) ≤ ‖φ(1)‖ φ(x*x) ≤ φ(x*x)`, then `τ∘φ ≤ τ` on positives), but it is not what the file is for. Likewise `RelativePropertyT` (line 68) takes an arbitrary positive functional and a non-closed `StarSubalgebra`: for `τ = 0` the predicate holds for every `B` (both sides of every inequality are `0`), so the definition is vacuous outside the README's hypotheses.

Repair: rewrite the file as the acceptance test. Module docstring "Approximation, deformation and rigidity of finite factors: target signatures", saying the roadmap is `README.md`, that the file states the headline theorems against the pinned APIs, and that `F(L(ℤ²⋊F_n)) = {1}`, Bernoulli strong rigidity and solidity/primeness of `L(F_n)` are not statable (naming the missing carriers above). State `relative property (T)` for `(ℤ²⋊SL₂(ℤ), ℤ²)` with `sorry`, using a definition of almost-invariant vectors and relative property (T) on `ContRepresentation ℂ Γ H` with `IsUnitary`, and the Haagerup property of `FreeGroup (Fin n)` with a definition of normalized `c₀` positive-definite functions. Delete `CommutingActions`, `WeaklyContained`, `traceTwoNorm`, `RelativePropertyT`, `cp_traceTwoNorm_le`, `MatrixIntertwiner`, `HasSpectralGap` and the five proved theorems; their content stays in the README as targets and Checks (see R04 for the padding list).

## R02 (P2) — the finite-module descent lemma is stated without its mixing hypothesis

Location: `TauCetiRoadmap/FactorRigidity/README.md` lines 502–506: "Prove the finite-module descent lemma: if P⊆M has no nonzero corner embedding into the enlarged abelian base and `Px⊆Σ_(i=1)^n x_iM` for x,x_i in the enlargement, then x∈M."

Claim: as stated, with the only hypotheses it names (P ⊆ M = A⋊Γ, enlargement M̃ = Ã⋊Γ with Ã ⊇ A abelian, no corner of P embeds into Ã), the lemma is false. The source (popa-strong-rigidity-i, Lemma 4.5, line 1078) requires an orthonormal basis `{1}∪{b_n}` of Ã over A satisfying the mixing condition (4.2.1) (line 1040: `sup_y ‖E_A(b_i* y σ_g(b_j))‖ → 0` as `g → ∞`) and a properly outer mixing action leaving A invariant.

Witness: take Γ ICC acting freely on A, M = A⋊Γ, P = L(Γ) ⊆ M (a II₁ factor, so no corner of P embeds into an abelian algebra), Ã = A ⊗̄ D with Γ acting trivially on D = L∞[0,1], M̃ = Ã⋊Γ. For x = 1⊗d ∈ D, `Px = xP ⊆ xM`, so the hypothesis holds with n = 1, x₁ = x, but x ∉ M. Here (4.2.1) fails: `E_A(b_i* y σ_g(b_j)) = E_A(b_i* y b_j)` does not depend on g.

Repair: state the lemma with Popa's hypotheses: Ã has an orthonormal basis `{1}∪{b_n}` over A such that `lim_{g→∞} sup_{‖y‖≤1, y∈A} ‖E_A(b_i* y σ_g(b_j))‖ = 0` for all i, j, and the Γ-action on Ã is properly outer and mixing and leaves A invariant; then add the one-sentence Check that the trivial-action enlargement `A ⊗̄ D` violates the basis condition and the conclusion. Then say in R8 that the Gaussian/diffuse-base enlargement constructed there satisfies (4.2.1) (popa-strong-rigidity-i Lemma 4.3, line 1048), which is the input the absorption theorem actually uses.

## R03 (P3) — gate failures: imports and a pull-request number

Location: `TauCetiRoadmap/FactorRigidity/Suggested.lean` lines 5–13 (`import Mathlib.Analysis.VonNeumannAlgebra.Basic` … `import Mathlib.RepresentationTheory.Invariants`); `README.md` line 57 ("[AmenableGroups, PR #821](…/pull/821)").

Claim: the gate reports `imports=1`, `mathlib-subimports=9`, `no-import-mathlib=1`, `prnum=1`.

Witness: `gate.md` for this head; the rule is the single line `import Mathlib` followed only by the `TauCeti.*` modules used, and no pull-request numbers in the README.

Repair: replace lines 5–13 by `import Mathlib` (keep line 14, `import TauCeti.RepresentationTheory.Continuous.Unitary.Basic`, only if the rewritten file still uses `IsUnitary`); replace line 57 by a citation by name and section, "AmenableGroups Layers 1–5 (invariant means, Følner criteria)", with the relative link `../AmenableGroups/README.md`. I elaborated the file with `lake env lean` after building the Tau Ceti module: `sorry` on line 77 is the only warning, so the rewrite of the header will not change elaboration.

## R04 (P3) — Lean form and padding

Location: `TauCetiRoadmap/FactorRigidity/Suggested.lean` line 26 (`namespace FactorRigidity`), lines 16–22, 32, 67, 89, 144 (docstrings with "R1", "R3", "R5", "Dynamics D1"), lines 44–47, 55–56, 114–135.

Claim and witnesses:
- The namespace must be `TauCetiRoadmap.FactorRigidity` (main's `AmenableGroups/Suggested.lean` uses `namespace TauCetiRoadmap.AmenableGroups`).
- Docstrings carry process labels ("R1's normal correspondence", "R3's literal CP-map criterion", "Matrix-corner implementation of R5", "match Dynamics D1", "This file is not the roadmap and is not exhaustive. These are suggested forms").
- Padding: `CommutingActions.joint_tmul` closes by `simp` from `Algebra.TensorProduct.lift_tmul`; `weaklyContained_refl` is `le_rfl`; `MatrixIntertwiner.map_right_corner` and `map_left_corner` restate the fields `right_unit`/`left_unit` through `θ_unit`; `MatrixIntertwiner.size_pos` is a boundary-case theorem (n = 0 has no `Fin 0`). Repair: delete them (the README keeps the identities as API bullets and Checks).
- `HasSpectralGap` (line 145) silently drops `[CompleteSpace H]` from the section `variable` block: its elaborated type (I ran `#check @FactorRigidity.HasSpectralGap` on a scratch copy) has only `NormedAddCommGroup H`, `InnerProductSpace ℂ H`, `Group Γ`. Harmless for this predicate, but the pattern is the one the brief warns about.
- None of the seven Lean names (`CommutingActions`, `WeaklyContained`, `traceTwoNorm`, `RelativePropertyT`, `cp_traceTwoNorm_le`, `MatrixIntertwiner`, `HasSpectralGap`) appears in the README, and the README names none of its own Lean declarations.
- The `noncomputable section` and `open scoped … ComplexOrder` are fine; `#check` lines are absent, fine.

Repair: subsumed by the rewrite in R01; whatever survives takes the namespace, a docstring per declaration stating the mathematics, and a README mention of every kept name.

## R05 (P3) — README shape: no supplier contracts, layers, `*Needs:*` lines, Checks, Examples or Dependencies; no per-claim locators

Location: `TauCetiRoadmap/FactorRigidity/README.md` throughout: headings `## Scope, conventions and dependencies`, `## R1.` … `## R10.`, `## Sources and API evidence`; lines 77–78 ("The definitive specification is this README. Suggested.lean prototypes selected interfaces."); line 134 ("R2's corrected `p=1,P=M,Q=ℂ` ambient specialization"); line 584 ("The source theorem references are listed below").

Claim: the README has none of the house sections (`## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k:` with `*Needs:*` lines, `**Checks.**` lists, `### Examples`, `### Dependencies`, `## Downstream consumers`). No definition has a Checks list; no theorem carries its locator at the claim (the only locators are the ranges in the final section, e.g. "relative-(T) 14.2.1–14.2.8"), so a reader cannot tell which of the roughly 120 claims in R1–R10 is which theorem. "Corrected", "retain", "prototypes" are process words.

Witness: the dependency check on this README reports `depcheck: 157 roadmaps, 1084 edges, 0 problem(s)` with no edge from FactorRigidity, because it has no `*Needs:*` lines or supplier table; it therefore cannot see that HilbertModules (merge order line 268) is cited as a supplier although FactorRigidity sits at line 251, and no `moved:` line is produced. The citations themselves resolve: Subfactors S1–S2 (open head, order line 250), VonNeumannAlgebras V2–V13b (open head of #889: V2 Borel logarithm at its line 280, V4 Lusin–Novikov at line 769, V11 measured relations at line 2240, V12 ultraproducts at line 2305, V13b commuting-representation minimal-norm criterion at line 2559), CStarAlgebras C4–C5 (open head: Schwarz for 2-positive maps, Stinespring, minimal tensor norm), HilbertModules H3 (interior tensor product), FreeProbability F3–F4 (main), OperatorAlgebraDynamics D1–D2 (main: `ContRepresentation`, P₂ criterion and its converse at D2 lines 104–113), AmenableGroups Layers 1–5 (main).

Repair: recast R1–R10 as `## Layer 1` … `## Layer 10` in build order with the house sections, one `*Needs:*` line per target naming Mathlib declarations, Tau Ceti declarations, earlier layers and supplier sections (so that HilbertModules, Subfactors, VonNeumannAlgebras, CStarAlgebras, FreeProbability, OperatorAlgebraDynamics, AmenableGroups become visible edges and the worker can place the roadmap after HilbertModules); put the locator in parentheses at each claim (e.g. the intertwining equivalences "(anantharaman-popa-ii1, Theorem 17.1.1, p. 281)"); give each definition (weak containment, relative amenability, relative property (T), spectral gap, Haagerup approximation, `P ≺_M Q`, Cartan pair, cost, F(M), s-malleable deformation, clustering, solidity, primeness) at least three Checks, several of which the README already contains in prose (the `ℂ⊕ℂ` example, the `L(F₂)` vacuum state, the `R ⊗̄ R` nonprime example, the Sanov subgroup); delete lines 77–78 and the process words.

## R06 (P3) — wrong theorem number in Popa I

Location: `README.md` line 525 ("Prove the finite normalizer-module construction of Theorem 4.2 Steps 1–5") and lines 661–662 ("with the regular-rigid reduction of Theorem 4.2").

Claim: in popa-strong-rigidity-i, 4.2 is a Definition (sub malleable / sub s-malleable actions, line 1035). The Steps are those of the proof of Theorem 4.1 (statement line 928; Steps 1–7 from line 942, Step 5 at line 995, Step 7 at line 1017). The "regular-rigid reduction" (replacing P by the factor `P₀ = M_n(qPq)` and Q by `D_n ⊗ qQq`, with Lemma 3.5) is Step 7 of Theorem 4.1 (lines 1017–1029).

Repair: cite "Theorem 4.1, Steps 1–5" and "the reduction of Step 7 of Theorem 4.1 (with Lemma 3.5)"; keep "Theorem 4.4(i)" and "Lemma 4.5", which are correct.

## R07 (P3) — VonNeumannAlgebras is carried by two open pull requests with different contents

Location: `README.md` lines 32–39 and 54–56 (citations of V5–V8, V11, V12, V13, V13b).

Claim: two open pull requests add a folder `VonNeumannAlgebras`: #889 ("factors and modular theory", sections V0–V13 with V13a/V13b) and #1041 ("operator foundations and measurable fields", sections V0–V4 only). The citations of V5–V8, V11–V13b resolve only at the head of #889; at the head of #1041 they dangle. Which one lands first decides whether this roadmap's supplier contracts resolve.

Repair: nothing to change here if #889 is the intended supplier; say so in the supplier-contract subsection ("VonNeumannAlgebras, sections V2–V13b, as in the roadmap of that name that includes the modular theory and injectivity layers"), so that the intake can detect drift if #1041 supersedes #889.

## R08 (P3) — R8 rebuilds Bernoulli basics that VonNeumannAlgebras V8 constructs

Location: `README.md` lines 489–491 ("For countably infinite Γ and Bernoulli actions … build finite-cylinder/tail algebras, freeness, ergodicity, mixing and clustering").

Claim: VonNeumannAlgebras at the head of #889 has a target `V8.BernoulliArbitraryDiscrete` (its line 1306) that constructs the Bernoulli shift of any infinite discrete group over a finite atomic base on `MeasureTheory.Measure.infinitePi`, with cylinder approximation, ergodicity, mixing, freeness (proper outerness), diffuseness and the II₁ crossed product. R8 restates the finite-base part.

Repair: in R8 consume V8.BernoulliArbitraryDiscrete for finite atomic bases and own only what it lacks: the general nontrivial standard base, the tail algebras, clustering (popa-strong-rigidity-ii Definition 1.1, line 285) and the sub-s-malleable Gaussian enlargement.

## Verified sound

**Gate and build.** The worker's gate fails only on the four rules of R03. I built `TauCeti.RepresentationTheory.Continuous.Unitary.Basic` and ran `lake env lean` on `Suggested.lean`: elaboration succeeds, `sorry` at line 77 is the only warning. On a scratch copy I elaborated `#check @…` for all twelve declarations and compared the types with the README (differences recorded in R01 and R04). One-tactic probe of `cp_traceTwoNorm_le` with `simp [traceTwoNorm]`, `positivity`, `gcongr`, `unfold traceTwoNorm; gcongr`: none closes it, so it is not one-tactic padding (it is excluded for being a non-headline, R01). The five proved theorems are padding by inspection (R04). No `set_option`, no sorried data, no `lemma`, no `#eval`, no edit outside the roadmap folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FactorRigidity'` is empty).

**Dependency check.** `depcheck: 157 roadmaps, 1084 edges, 0 problem(s)`; no UPWARD or CYCLE line, but also no edge from this roadmap (R05). By hand: every cited supplier is on main (FreeProbability, OperatorAlgebraDynamics, AmenableGroups), earlier in the merge order (Subfactors line 250, OperatorAlgebraDynamics 248), or an open pull request adding a new folder (VonNeumannAlgebras #889/#1041, CStarAlgebras #860, HilbertModules #861); HilbertModules at line 268 is later than this roadmap at 251 and is a `moved:` case once the edge is visible. No cycle: none of those roadmaps cites FactorRigidity (grep of their READMEs).

**Ownership.** `roadmaps grep` over main and the 383 open heads: property (T)/Kazhdan outside this roadmap appears only in AmenableGroups' scope paragraph (as excluded) and in unrelated senses (Kazhdan–Lusztig, Shimura varieties); Haagerup property, intertwining-by-bimodules, cost/graphings and the fundamental group of a II₁ factor appear nowhere else; Cartan subalgebras elsewhere are Lie-theoretic; Bernoulli shifts appear in VonNeumannAlgebras V8 (R08). Mathlib and Tau Ceti at the pins have none of these objects (grep for Kazhdan, Haagerup, Popa, intertwining, Cartan, spectral gap in operator-algebraic sense: no hits). This roadmap is the owner of R1–R10's objects, except the Bernoulli basics of R08.

**Sampled locators (15 targets, all in the readable texts).**

| # | Target | Source, locator, line | Result |
|---|---|---|---|
| 1 | H≺K via `‖π_H(z)‖ ≤ ‖π_K(z)‖` (R1) | anantharaman-popa-ii1 Def 13.3.8 + Rem 13.3.9, lines 10094–10100 | supports; the book defines by Fell closure and states the norm form as equivalent, the README takes the norm form as definition and proves the equivalence |
| 2 | Localization lemma (R2) | Lemma 13.4.8, line 10415 | hypotheses (a)–(c) match the README's bound/nonvanishing/asymptotic centrality |
| 3 | Relative amenability by P-central state (R2) | Thm 13.4.4 (ii),(iv),(v), Def 13.4.5, lines 10311–10378 | matches, including the correspondence criterion `L²(M)_P ≺ (L²(M)⊗_Q L²(M))_P` |
| 4 | Amenable iff `L²(M) ≺ coarse` (R1/R2) | Thm 13.4.1 (iii), line 10212 | matches |
| 5 | Relative property (T) by CP maps (R3) | Def 14.2.1, line 10659 | matches (book uses ≤δ, ≤ε; immaterial) |
| 6 | `(ℤ²⋊SL₂(ℤ), ℤ²)` relative (T) and the torus model (R3, R7) | Ex 14.2.8, line 10783; Ex 18.1.5, line 12804 | matches, including finite-index G and the Fourier identification |
| 7 | Spectral gap, fullness, full iff spectral gap for separable II₁ (R3) | Def 15.1.1, 15.3.1, Thm 15.3.2, lines 11321, 11710, 11715 | matches |
| 8 | Haagerup property, (H), relative (H), ideals I and I₀ (R4) | Def 16.1.1, 16.2.1, 16.3.3, Prop 16.3.1, lines 11974, 12017, 12123, 12084 | matches; `TJzJ ∈ I₀` with `τ(1−z) ≤ ε` as in README |
| 9 | Intertwining equivalences incl. matrix form (R5) | Thm 17.1.1 (i)–(iv), line 12260 | matches the README's `v ∈ M_{1,n}(fM)`, `v*v ≤ q`, `xv = vθ(x)` |
| 10 | Rigid + relative (H) ⇒ `P ≺_M Q`; rigid Cartan unique (R5, R6) | Thm 18.1.1, 18.1.3, Thm 17.2.3, lines 12749, 12791, 12496 | matches |
| 11 | Compression formula, `F(L(R)) = F(R)`, `F(L(ℤ²⋊F_n)) = {1}`, cost n (R7) | Thm 18.2.3, 18.3.1, 18.3.2, 18.3.3, lines 12909–12957 | matches; see Source issues for 18.2.3 |
| 12 | Solidity, deformation, spectral-gap lemma, nonintertwining, ε-criterion (R10) | ch. 19 Theorem line 13160, Lemma 19.1.1, 19.1.3, 19.1.4, 19.1.5, lines 13174–13343 | matches; 19.1.3 is for P ⊆ M₁ with unit 1, README's corner form is a stated extension; 19.1.5 has `ε < 2^{-1/2}` and the README's `ε < 1` strengthening is correct (row 13 of the table below) |
| 13 | Absorption into L(Λ), descent lemma, sub s-malleable Bernoulli (R8) | popa-strong-rigidity-i Thm 0.1, Lemma 4.3, Thm 4.4(i), Lemma 4.5, lines 120, 1048, 1061, 1078 | 4.4(i) matches (sub malleable, factorial normalizer, ICC); Lemma 4.5 needs (4.2.1) (R02); "Theorem 4.2" is a Definition (R06) |
| 14 | Strong rigidity statement and conjugacy criterion (R9) | popa-strong-rigidity-ii Thm 0.1 with (∗),(∗∗) lines 52–64, 89; Thm 0.7 line 217; Def 1.1 line 285; Def 1.3 line 349; Thm 4.2 line 668; Thm 5.1 line 784; Thm 5.2 line 806; Lemma 6.1 line 977 | matches: w-rigid ICC source with arbitrary free ergodic action, Bernoulli ICC target, `0 < t ≤ 1`, form `Ad(u)∘θ_χ∘θ_{Δ,δ}`, `δ(g)∘Δ = Δ∘g` |
| 15 | Survey statements (R5, R6, R9) | popa-icm2006 Thm 5.1 line 624, Thm 7.1 line 888, Thm 8.1 line 948 | match the primary sources |

**Adversarial table** (instances tried and values on each side).

| Statement | Instances | Values | Result / change |
|---|---|---|---|
| `‖π_coarse(z)‖ = ‖z‖_min`, `‖π_id(z)‖ ≤ ‖z‖_min`, equality fails (R1) | M = ℂ⊕ℂ, τ = (a+b)/2, z = e⊗fᵒᵖ | `‖z‖_min = ‖e‖‖f‖ = 1`; `π_coarse(z) = e⊗f` a nonzero projection, norm 1; `π_id(z)ξ = eξf = ξef = 0`, norm 0 | 0 ≤ 1, 0 ≠ 1: README's distinction correct, no change |
| identity action kills `e⊗(1−e)ᵒᵖ` for central e (R1) | M = L∞[0,1] ⊕ ℂ, e = (1,0) | `eξ(1−e) = ξ e(1−e) = 0` | holds; trivial e = 0 or 1 gives z = 0, consistent |
| `WeaklyContained A B` direction (Lean) | A = zero-dimensional H (joint = 0), B arbitrary | `0 ≤ ‖B.joint z‖`: the zero correspondence is weakly contained in everything | matches H ≺ K convention (AP Rem 13.3.9); no change |
| relative amenability of ℂ relative to ℂ in L(F₂) (R2) | ⟨M,e_ℂ⟩ = B(L²M), Ω = vector state at 1̂ | Ω|_M = τ; P = ℂ so P-central; M nonamenable | README's example correct; distinguishes P = ℂ from P = M |
| amenability stable under central direct sums (R2) | P = ⊕_k M_{n_k} (infinitely many) | each summand amenable, sum injective (direct sum of injective) | holds |
| relative (T) CP definition, vacuity (R3, Lean) | Lean `RelativePropertyT` with τ = 0 | `traceTwoNorm 0 x = √0 = 0 < δ, < ε` for all φ, B | vacuous for τ = 0 (R01); README's faithful tracial state excludes it |
| `(ℤ²⋊G, ℤ²)` relative (T) needs G nonamenable (R3) | G = {1} | pair (ℤ²,ℤ²): ℤ² amenable infinite, regular rep has almost invariant vectors and no invariant vector | README requires nonamenable G; correct |
| spectral gap `‖ξ‖² ≤ C Σ_{g∈F} ‖ρ(g)ξ−ξ‖²` on `invariants^⊥` (R3, Lean) | trivial representation, F = ∅ | `invariants^⊥ = 0`; inequality `0 ≤ 0` | spectral gap holds vacuously for the trivial representation, as in AP Def 15.1.1 (no almost-invariant vectors in the zero space); no change |
| Bernoulli spectral gap via quasi-regular reps (R3) | F = ∅ cylinder gives the constants; nonempty F has finite stabilizer Γ_F | `ℓ²(Γ/Γ_F) ⊆ ℓ²(Γ)` as the Γ_F-right-invariant vectors (Γ_F finite); nonamenable Γ: no almost invariant vectors, uniformly over the sum since all are subreps of a multiple of λ | holds; amenable Γ (e.g. ℤ): λ has almost invariant vectors, Bernoulli has no spectral gap; README's hypothesis correct |
| F_∞ word length not proper; weighted length proper (R4) | generators a_k with weight k | unweighted: infinitely many elements of length 1; weighted: `{g : ℓ_w(g) ≤ R}` finite | holds |
| subunital Schwarz `φ(x)*φ(x) ≤ ‖φ(1)‖φ(x*x)` and L² contraction (R4) | φ = compression `x ↦ pxp`, p a projection, τ tracial | `‖φ(1)‖ = ‖p‖ ≤ 1`; `(pxp)*(pxp) = px*pxp ≤ px*xp`; `τ(px*xp) = τ(x*xp) ≤ τ(x*x)` | holds; the factor `‖φ(1)‖` is needed: for φ = 2·id on ℂ, `φ(x)*φ(x) = 4|x|² > φ(x*x) = 2|x|²` |
| ε-criterion `‖x − E_Q(x)‖₂ ≤ ε√τ(f)` on the unit ball of P ⊆ fMf ⇒ `P ≺_M Q` (R5) | u ∈ U(P) (unit f), ε < 1 | `‖u‖₂² = τ(f)`; `‖E_Q(u)‖₂² = τ(f) − ‖u−E_Q(u)‖₂² ≥ (1−ε²)τ(f) > 0`, uniform in u, contradicting 17.1.1(i) with x = y = f | README's `ε < 1` version correct; AP's `ε < 2^{-1/2}` is only sufficient; corner factor needed: with the absolute bound ε and τ(f) → 0, `‖u − E_Q(u)‖₂ ≤ √τ(f) ≤ ε` holds for every u, so the absolute form would "prove" intertwining of every small corner (README says exactly this) |
| Cartan `A ≺_M B` ⇒ unitary conjugacy (R6) | AP 17.2.3 with II₁ factor | partial isometry v with `vv* ∈ Ap`, patched by normalizers to a unitary; needs the factor for central supports to match | README retains the II₁ factor hypothesis; holds |
| hyperfinite cost `C(R) = 1 − ∫ 1/|[x]| dμ` (R7) | classes of size 1; size 2; all infinite (ergodic ℤ) | 1 − 1 = 0 (trivial relation, empty graphing); 1 − 1/2 = 1/2 (one involution on half the space); 1 − 0 = 1 (one generator) | holds |
| compression `C(R^t) − 1 = (C(R) − 1)/t` needs ergodicity (R7) | R trivial on atomless X, A with μ(A) = 1/2 | left `C(R|_A) − 1 = −1`; right `(0 − 1)/(1/2) = −2` | fails for non-ergodic R; README states it for ergodic atomless relations; correct. AP 18.2.3 omits "ergodic" in its statement (Source issues) |
| `F(R) = {1}` from the formula needs `1 < C(R) < ∞` (R7) | ℤ action: C = 1; F_n, n ≥ 2: C = n | C = 1 gives `C(R^t) = 1` for all t, no conclusion; C = n gives `C(R^t) = 1 + (n−1)/t ≠ n` unless t = 1 | README's `2 ≤ n < ∞` correct |
| Sanov subgroup free of rank 2, index 12 (R7) | ⟨[[1,2],[0,1]], [[1,0],[2,1]]⟩ | `[SL₂(ℤ):Γ(2)] = 6`, `Γ(2) = {±1} × Sanov`, index `6·2 = 12` | holds |
| transversality `‖α_{2t}(x) − x‖₂ ≤ 2‖α_t(x) − E_M(α_t(x))‖₂` (R8) | x ∈ M, β fixing M, `βα_tβ = α_{−t}` | `α_{2t}(x) − x = α_t(α_t x − β α_t x)` up to β-fixed terms, giving `‖α_{2t}x − x‖₂ ≤ ‖α_t x − E_M α_t x‖₂ + ‖βα_t x − E_M α_t x‖₂ = 2‖α_t x − E_M α_t x‖₂` | holds |
| descent lemma (R8) | trivial-action enlargement `A ⊗̄ D` | hypotheses hold, conclusion fails (R02) | add (4.2.1) |
| rigidity persists through `M ⊆ M̃` via `‖φ̃(b)−b‖₂² ≤ 2‖b‖₂‖E_M(φ̃(b))−b‖₂` (R3) | y = φ̃(b), `‖y‖₂ ≤ ‖b‖₂` | `‖y−b‖₂² = ‖y‖₂² − 2Re⟨y,b⟩ + ‖b‖₂² ≤ 2(‖b‖₂² − Re⟨E_M y, b⟩) = 2Re⟨b − E_M y, b⟩ ≤ 2‖b‖₂‖E_M y − b‖₂` | holds |
| strong rigidity form and t = 1 (R9) | source Γ = ℤ²⋊F_n (w-rigid ICC), target Λ Bernoulli; t = 1/2 | Popa II Thm 0.1 forces t = 1, so no isomorphism `L∞(X)⋊Γ ≃ (L∞(Y)⋊Λ)^{1/2}` | matches the source; `0 < t ≤ 1` is the source's range |
| `F(M)` reciprocal law and `F(M) = {1}` for Bernoulli factors of w-rigid ICC groups (R9) | t and 1/t | `M^t ≃ M` iff `M ≃ M^{1/t}`; Thm 0.1 excludes `t < 1` hence `t > 1` | holds |
| solidity definitions equivalent (R10) | A diffuse; P = A′∩M | `P′∩M ⊇ A` and a normal unital map from a diffuse algebra onto a minimal corner ℂ cannot exist, so `P′∩M` is diffuse; AP form gives P amenable; converse via `P ⊆ (P′∩M)′∩M` and expectation permanence | holds (AP Exercise 19.2) |
| deformation of N*N (R10) | `α_t(u_i) = exp(it h_i)u_i`, `α_t(v_i) = v_i`, β(v_i) = v_i*, β(u_i) = u_i | `βα_tβ(u_i) = β(exp(it h_i)u_i) = exp(−it h_i)u_i = α_{−t}(u_i)` since β(h_i) = −h_i | matches AP Lemma 19.1.1 (lines 13203–13207) |
| spectral-gap lemma corner form (R10) | P ⊆ pM₁p with no amenable summand; naive repair P ⊕ ℂ(1−p) | the added summand ℂ(1−p) is amenable, so AP 19.1.3 does not apply directly | README's remark that the corner form must be proved directly is correct |
| primeness and finite-dimensional tensor factors (R10) | `L(F_n) ≃ M_k(ℂ) ⊗ L(F_n)^{1/k}` | allowed by the definition (M_k not diffuse); `R ⊗̄ R ≃ R` nonprime | holds |
| Lean `MatrixIntertwiner` axioms (R5) | n = 1, v = (f), q = f, θ = inclusion P → M (Q = M) | `f·f = f`, `(ff*)f = f`, `f q = f`, `x f = f x` for x ∈ P (f the unit of P) | the fields express `v ∈ fM`, `vv*v = v`, `v*v ≤ q`, `xv = vθ(x)`; consistent; n = 0 excluded by `nonzero` |

**Library declarations opened at the pins.** `ContRepresentation` (Mathlib `RepresentationTheory/Continuous/Basic.lean` line 54: a monoid hom `G →* V →L[R] V`, no topology on G, so discrete groups need nothing more, as the README says); `TauCeti.ContRepresentation.IsUnitary` (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean` line 52); `CompletelyPositiveMap` and `→CP` (`Analysis/CStarAlgebra/CompletelyPositiveMap.lean` lines 72, 115; non-unital C*-algebras with `StarOrderedRing`); `→P[ℂ]` (`Analysis/CStarAlgebra/PositiveLinearFunctional.lean`); `CStarMatrix` (`Analysis/CStarAlgebra/CStarMatrix.lean` line 44); `IsStarProjection` (`Algebra/Star/StarProjection.lean` line 26); `WStarAlgebra`, `VonNeumannAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean` lines 45, 67); `Representation.invariants` (`RepresentationTheory/Invariants.lean` line 73). Mathlib's `WStarAlgebra` is a `Prop`-class asserting a predual exists; it carries no trace, no normality API for maps and no crossed product, which is why headlines (c)–(e) are not statable.

**Cross-roadmap citations resolved.** All listed under R05; none dangles at the head the brief gives. Ownership against open pull requests was checked through `roadmaps grep` (383 heads).

## Not verifiable

- Gaboriau, *Coût des relations d'équivalence et des groupes*, Invent. Math. 139 (2000): the DOI resolves only to a paywalled Springer page and the guessed author-page URL returned 404; recorded as `uncertified` and listed in `needs-references.toml`. The R7 locators (Definitions I.1–I.5, Proposition II.6, Lemma II.8, Theorems IV.1/IV.15, proofs IV.35–IV.39) are cited by locator alone. The statements they are cited for (treeing minimality, cost of F_n actions, compression formula) were checked instead against anantharaman-popa-ii1 Theorems 18.2.3, 18.3.3 and the adversarial table; the README's description of the IV.35–IV.39 argument (finite-level unfoldings with discarded measure `2⁻q/(2Lr)` per generator and total error `q·2⁻q`) could not be checked.

## Source issues

- **Gap** in anantharaman-popa-ii1 at Theorem 18.2.3, printed page 296–297: the proof establishes only `C(R^t) − 1 ≤ (C(R) − 1)/t` for `t > 1` and says the rest is not needed; it should prove both inequalities for all `t > 0` or cite Gaboriau Prop II.6 at the statement; affects a stated result (the README cites Gaboriau for the full formula).
- **Misprint** in anantharaman-popa-ii1 at Theorem 18.2.3, printed page 296: the statement is for a countable p.m.p. relation, while `R^t` is defined (Definition 18.2.1) only for ergodic relations and the formula fails for the trivial relation; it should say ergodic; affects a stated result (the README adds ergodicity).
